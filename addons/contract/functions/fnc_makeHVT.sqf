#include "script_component.hpp"

/*
 * Author: Creedcoder, J. Schmidt
 * Registers an AI unit as a hvt.
 *
 * Arguments:
 * 0: The AI unit <OBJECT>
 * 1: ID of the task <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [this, "task_name"] spawn sof_client_contract_fnc_makeHVT;
 *
 * Public: Yes
 */

params [["_entity", nil, [objNull, 0, [], sideUnknown, grpnull, ""]], ["_taskID", "", [""]]];

// Check stuff
// if (isNull _entity) exitWith {[COMPONENT_NAME, "ERROR", "Unit is not found", true] call sof_server_main_fnc_log};
// if (_taskID == "") exitWith {[COMPONENT_NAME, "ERROR", "Task ID is empty", true] call sof_server_main_fnc_log};

// Register hvt
SETVAR(_entity,assignedTask,_taskID);

// Add unit to hvt array
private _index = GVAR(allHVTs) pushBackUnique _entity;

if (alive _entity) then {
	[_entity, "hvt"] spawn FUNC(heartBeat);
};

// Log
// [COMPONENT_NAME, "DEBUG", format [
// 	"Unit (%1) is registered as a hvt. HVT array: %2", _entity, str GVAR(allHVTs)
// ]] call sof_server_main_fnc_log;

// if (_index == -1) then {
// 	[COMPONENT_NAME, "WARNING", format ["Unit (%1) is already a hvt", _entity], true] call sof_server_main_fnc_log;
// };