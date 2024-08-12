#include "..\script_component.hpp"

/*
 * Function: sof_client_init_fnc_handlePlayerLoad
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
 * Handle player load from DB.
 *
 * Arguments:
 * 0: Data from key [<ARRAY|STRING|NUMBER|BOOL>] (default: [])
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [[_data]] call sof_client_init_fnc_handlePlayerLoad (Server or Singleplayer Only)
 * [[_data]] remoteExecCall ["sof_client_init_fnc_handlePlayerLoad", 2, false] (Multiplayer Only)
 *
 * Public: Yes
 */

private _data = _this;
private _defaultEmail = "unknown@spearnet.mil";
private _defaultPhoneNumber = "unknown";

if (_data isEqualTo [""]) then {
    2 cutText ["No Save Found!", "PLAIN DOWN", 1];
    [player] spawn EFUNC(player,firstLogin);
} else {
    [format ["Welcome back %1. Your persistent locker, bank, cash and profile have been loaded.", name player, 5], "blue-grey"] call EFUNC(misc,notify);

    for "_i" from 0 to (count _data - 1) step 2 do {
        private _key = _data select _i;
        private _value = _data select (_i + 1);

        if (_value isEqualType []) then {
            _value = _value select 0;
        };

        switch (_key) do {
            case "reputation": {
                SETVAR(player,Reputation,_value);
                player addRating _value;
            };
            case "loadout": {
                SETVAR(player,Loadout,_value);
                player setUnitLoadout _value;
            };
            case "direction": {
                SETVAR(player,Direction,_value);
                player setDir _value;
            };
            case "cash": {
                SETVAR(player,Cash,_value);
            };
            case "bank": {
                SETVAR(player,Cash_Bank,_value);
            };
            case "armory_unlocks": {
                EGVAR(armory,arsenalUnlocks) = _value;
            };
            case "garage_unlocks": {
                EGVAR(armory,garageUnlocks) = _value;
            };
            case "locker": {
                SETVAR(player,Locker,_value);
            };
            case "garage": {
                SETVAR(player,Garage,_value);
            };
            case "email": {
                SETVAR(player,SOF_Email,_value);
            };
            case "number": {
                SETVAR(player,SOF_Phone_Number,_value);
            };
            case "paygrade": {
                SETVAR(player,Paygrade,_value);
            };
            case "stance": {
                SETVAR(player,Stance,_value);
                player playAction _value;
            };
            case "holster": {
                SETVAR(player,SOF_HolsterWeapon,_value);
                if (_value) then {
                    [player] call AFUNC(weaponselect,putWeaponAway);
                };
            };
            case "position": {
                SETVAR(player,Position,_value);
                player setPosASL _value;

                private _pAlt = ((getPosATLVisual player) select 2);
                private _pVelZ = ((velocity player) select 2);
                if (_pAlt > 5 && _pVelZ < 0) then {
                    player setVelocity [0, 0, 0];
                    player setPosATL [((getPosATLVisual player) select 0), ((getPosATLVisual player) select 1), 1];
                    hint "You logged off mid air. You were moved to a safe position on the ground.";
                };
            };
        };
    };

    if (needReload player == 1) then { reload player };
    SETVAR(player,value_loadDone,true);

    // ["listrng", GETVAR(player,SOF_Email,_defaultEmail), "", -1, [], "sof_client_phone_fnc_addOfflineEmail", "null", true] spawn dragonfly_db_fnc_addTask;
    ["listrng", GETVAR(player,SOF_Email,_defaultEmail), "", -1, [], "sof_client_phone_fnc_addOfflineEmail", netId player, true] remoteExec ["dragonfly_db_fnc_addTask", 2, false];

    // ["listrng", GETVAR(player,SOF_Phone_Number,_defaultPhoneNumber), "", -1, [], "sof_client_phone_fnc_addOfflineMsg", "null", true] spawn dragonfly_db_fnc_addTask;
    ["listrng", GETVAR(player,SOF_Phone_Number,_defaultPhoneNumber), "", -1, [], "sof_client_phone_fnc_addOfflineMsg", netId player, true] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
};