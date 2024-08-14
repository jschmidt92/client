#include "script_component.hpp"

/*
 * Author: Creedcoder, J. Schmidt
 * Registers a defuse task.
 * 
 * Arguments:
 * 0: ID of the task <STRING>
 * 1: Amount of entities destroyed to fail the task <NUMBER>
 * 2: Amount of ieds defused to complete the task <NUMBER>
 * 3: Should the mission end (MissionSuccess) if the task is successful <BOOL> (default: false)
 * 4: Should the mission end (MissionFailed) if the task is failed <BOOL> (default: false)
 * 5: Amount of funds the company recieves if the task is successful <NUMBER> (default: 0)
 * 6: Amount of rating the company and player lose if the task is failed <NUMBER> (default: 0)
 * 7: Amount of rating the company and player recieve if the task is successful <NUMBER> (default: 0)
 * 
 * Return Value:
 * None
 *
 * Example:
 * ["task_name", 2, 3, 375000, -75, 300, false, false] spawn sof_client_contract_fnc_defuse;
 * 
 * Public: Yes
 */

// Mission Parameters from Contract via Mission Handler
params [["_taskID", ""], ["_limitFail", -1], ["_limitSuccess", -1], ["_companyFunds", 0], ["_ratingFail", 0], ["_ratingSuccess", 0], ["_endSuccess", false], ["_endFail", false]];

private _result = 0;

// Get the IED(s) assigned to taskID
private _ieds = GVAR(allIEDs) select { (_x getVariable ["assignedTask", ""]) == _taskID };

// Get the entitie(s) assigned to taskID
private _entities = GVAR(allEntities) select { (_x getVariable ["assignedTask", ""]) == _taskID };

// Mission Initialization.
// Mission Watchdog checks for example Defused IEDs, Destroyed entities
waitUntil {
	sleep 1; // Use sleep on server side!

	// Check if entities are killed
	private _entitiesAlive = ({ !alive _x } count _entities);
	if (_entitiesAlive >= _limitFail) then { _result = 1; };

	// Trigger Conditions
	(_result == 1) OR ((GVAR(defusedCount) >= _limitSuccess) && (_entitiesAlive < _limitFail))
};

// Mission Watchdog checks for example Defused IEDs, destroyed entities
if (_result == 1) then {
	// Mission Failed
	// Clean-up IEDs and entities

	{ deleteVehicle _x } forEach _ieds;
	{ deleteVehicle _x } forEach _entities;

	// Do stuff after the Mission is failed
	// Like trigger next mission step via Mission Handler, punishment or so on

	[_taskID, "FAILED"] call BFUNC(taskSetState);

	if (_endFail) then {
		["MissionFail", false] remoteExecCall ["BIS_fnc_endMission", playerSide];
	};

	["deduct", _ratingFail] remoteExecCall ["sof_server_rating_fnc_handleRating", 2];

	sleep 1;

	{ [_x, _ratingFail] remoteExec ["addRating", -2] } forEach allPlayers;
} else {
	// Mission Complete
	// Clean-up IEDs and entities

	{ deleteVehicle _x } forEach _ieds;
	{ deleteVehicle _x } forEach _entities;

	// Do stuff after the Mission is completed
	// Like trigger next mission step via Mission Handler, rewards or so on

	[_taskID, "SUCCEEDED"] call BFUNC(taskSetState);

	if (_endSuccess) then {
		["MissionSuccess", true] remoteExecCall ["BIS_fnc_endMission", playerSide];
	};

	["advance", _ratingSuccess] remoteExecCall ["sof_server_rating_fnc_handleRating", 2];

	sleep 1;

	{ [_x, _ratingSuccess] remoteExec ["addRating", -2] } forEach allPlayers;

	["advance", _companyFunds] remoteExecCall ["sof_server_money_fnc_handleFunds", 2];
};

// Reset Mission Spot
// Like delete Markers or other stuff for example Logging

GVAR(defusedCount) = 0;