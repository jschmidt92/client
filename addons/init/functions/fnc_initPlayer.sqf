#include "..\script_component.hpp"

/*
 * Function: sof_client_init_fnc_initPlayer
 * Author: Creedcoder, J.Schmidt
 * Edit: 07.15.2024
 * Copyright © 2024 Creedcoder, J.Schmidt, All rights reserved
 *
 * Do not edit without permission!
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivative 4.0 International License.
 * To view a copy of this license, vist https://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
 * PO Box 1866, Mountain View, CA 94042
 *
 * [Description]
 * Initialize player.
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [] call sof_client_init_fnc_initPlayer (Server or Singleplayer Only)
 * [] remoteExecCall ["sof_client_init_fnc_initPlayer", 2, false] (Multiplayer Only)
 *
 * Public: Yes
 */

waitUntil { !isNull player };
waitUntil { player == player };
waitUntil { alive player };

removeAllWeapons player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;

SETVAR(player,value_loadDone,false);
cutText ["Loading In...", "BLACK", 1];

waitUntil { GETVAR(player,value_armoryDone,false) };

// ["hgetall", "", "", -1, [], "sof_client_init_fnc_handlePlayerLoad", true] spawn dragonfly_db_fnc_addTask;
["hgetallid", getPlayerUID player, "", -1, [], "sof_client_init_fnc_handlePlayerLoad", true, netId player] remoteExec ["dragonfly_db_fnc_addTask", 2, false];

[] spawn FUNC(playerSaveLoop);
[] spawn EFUNC(interaction,initInteraction);

waitUntil { GETVAR(player,value_loadDone,false) };
cutText ["", "PLAIN", 1];

waitUntil { !(isNull (findDisplay 46)) };
(findDisplay 46) displayAddEventHandler ["KeyDown", {
	switch (_this select 1) do {
		// Interaction Interface (default key TAB)
		case ((configFile >> "CfgPatches" >> "sof_client_main" >> "interactionKey") call BFUNC(getCfgData)): {
			[] call EFUNC(interaction,openInteraction);
			false;
		};
		// Holster/Unholster (default key H)
		case ((configFile >> "CfgPatches" >> "sof_client_main" >> "holsterKey") call BFUNC(getCfgData)): {
			if ((currentWeapon player) != "" && !(GETVAR(player,SOF_HolsterWeapon,true))) then {
				player action ["SwitchWeapon", player, player, 299];
				SETPVAR(player,SOF_HolsterWeapon,true);
			} else {
				private _weapon = switch (true) do {
					case ((primaryWeapon player) != ""): { primaryWeapon player };
					case ((handgunWeapon player) != ""): { handgunWeapon player };
					case ((secondaryWeapon player) != ""): { secondaryWeapon player };
					default {""};
				};
				if (_weapon != "") then { player selectWeapon _weapon };
				SETPVAR(player,SOF_HolsterWeapon,false);
			};
			false;
		};
		// Open Phone (default key P)
		case ((configFile >> "CfgPatches" >> "sof_client_main" >> "phoneKey") call BFUNC(getCfgData)): {
			[] spawn EFUNC(phone,openPhone);
			false;
		};
		default {
			false;
		};
	};
}];