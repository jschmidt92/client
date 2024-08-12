#include "..\script_component.hpp"

/*
 * Function: sof_client_db_fnc_saveToTempDB
 * Author: J.Schmidt
 * Edit: 07.23.2024
 * Copyright © 2024 J.Schmidt, All rights reserved
 *
 * Do not edit without permission!
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivative 4.0 International License.
 * To view a copy of this license, vist https://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
 * PO Box 1866, Mountain View, CA 94042
 *
 * [Description]
 * Store data in Temp DB.
 *
 * Arguments:
 * 0: Name of Event <STRING>
 * 1: Name of DB <STRING>
 * 2: UID of Player <STRING>
 * 3: Name of Key <STRING>
 * 4: Value to store in key <ARRAY|STRING|NUMBER|BOOL>
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * ["playerStatus", "players", "76561198027566824", "status", "available"] call sof_client_db_fnc_saveToTempDB;
 *
 * Public: Yes
 */

params [["_event", "", [""]], ["_db", "", [""]], ["_uid", "", [""]], ["_key", "", [""]], ["_value", "", [[], 0, "", false]]];

if (isNil "_event") exitWith { ["No Event provided"] call BFUNC(log); };
if (isNil "_db") exitWith { ["No DB provided"] call BFUNC(log); };
if (isNil "_uid") exitWith { ["No UID provided"] call BFUNC(log); };
if (isNil "_key") exitWith { ["No key provided"] call BFUNC(log); };
if (isNil "_value") exitWith { ["No Value provided"] call BFUNC(log); };

["Received event: %1", _this] call BFUNC(logFormat);

private _response = [GVAR(SOF_tempDb), [_db, _uid, _key], _value] call BFUNC(dbValueSet);

if !(_response) then {
   ["Failed to set Key '%1' for UID '%2' with '%3' to DB", _key, _uid, _value] call BFUNC(logFormat);
} else {
   SETPVAR(missionNamespace,SOF_tempDb,GVAR(SOF_tempDb));
   ["Successfully set key '%1' for UID '%2' with '%3'", _key, _uid, _value] call BFUNC(logFormat);
};