#include "..\script_component.hpp"

/*
 * Function: sof_client_init_fnc_playerDBSave
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
 * Save player to DB.
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [] call sof_client_init_fnc_playerDBSave (Server or Singleplayer Only)
 * [] remoteExecCall ["sof_client_init_fnc_playerDBSave", 2, false] (Multiplayer Only)
 *
 * Public: Yes
 */

private _data = [
getPlayerUID player,
"armory_unlocks", [sof_client_armory_arsenalUnlocks],
"garage_unlocks", [sof_client_armory_garageUnlocks],
"locker", [player getVariable ["Locker", []]],
"garage", [player getVariable ["Garage", []]],
"cash", [player getVariable ["Cash", 0]],
"bank", [player getVariable ["Cash_Bank", 0]],
"number", [player getVariable ["SOF_Phone_Number", "unknown"]],
"email", [player getVariable ["SOF_Email", "unknown@spearnet.mil"]],
"paygrade", [player getVariable ["Paygrade", "E1"]],
"reputation", [rating player],
"loadout", [getUnitLoadout player],
"holster", [player getVariable ["SOF_HolsterWeapon", true]],
"position", [getPosASLVisual player],
"direction", [getDirVisual player]
];

if (vehicle player == player) then {
    _data pushBack "currentWeapon";
    _data pushBack [currentMuzzle player];
    _data pushBack "stance";
    _data pushBack [stance player];
};

// ["hsetBulk", "", "", -1, _data, "", "null", false] spawn dragonfly_db_fnc_addTask;
["hsetidbulk", "", "", -1, _data, "", netId player, false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];