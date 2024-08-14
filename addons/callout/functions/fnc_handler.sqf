#include "..\script_component.hpp"

/*
 * Author: Creedcoder, J. Schmidt
 * Server side callout handler/spawner.
 * 
 * Arguments:
 * 0: Type of callout <STRING>
 * 1: Params for callout <ARRAY>
 * 2: Minimum rating for callout <NUMBER> (default: nil)
 * 
 * Return Value:
 * None
 *
 * Example:
 * ["callout_type", [_reward, _punish, _time, etc.....], minRating] remoteExec ["sof_client_callout_fnc_handler", 2, false];
 * [] remoteExec ["sof_client_callout_fnc_handler", 2, false];
 * 
 * Public: Yes
 */

GVAR(acceptCallouts) = false;

private _thread = 0;

private _callouts = [["dd", "Drug Deal"], ["hvt", "High Value Target"], ["rd", "Reckless Driver"], ["sa", "Suspicious Activity"], ["sf", "Shot(s) Fired"]];
private _index = floor (random (count _callouts));

private _callout = _callouts select _index;
private _calloutType = _callout select 0;
private _calloutName = _callout select 1;

private _removeActions = {
    private _unit = _this select 0;
    { _unit removeAction _x } forEach GVAR(allIDsToRemove);
};

private _addCalloutActions = {
    params ["_calloutType", "_removeActions"];

    private _function = call compile format ["sof_client_callout_fnc_%1", _calloutType];

    private _acceptAction = player addAction ["Accept Callout", {
		params ["_target", "_caller", "_actionId", "_arguments"];

		private _removeActions = _arguments select 0;
		private _function = _arguments select 1;

        _thread = [] spawn _function;

        [_caller] call _removeActions;

        waitUntil { sleep 2; scriptDone _thread };
    }, [_removeActions, _function]];

    private _ignoreAction = player addAction ["Ignore Callout", {
		params ["_target", "_caller", "_actionId", "_arguments"];

        [_caller] call sof_client_callout_fnc_ignore;

        _removeActions = _arguments select 0;
    }, [_removeActions]];

    GVAR(allIDsToRemove) pushBack _acceptAction;
    GVAR(allIDsToRemove) pushBack _ignoreAction;
};

private _notifyAndAddActions = {
    params ["_calloutName", "_calloutType", "_removeActions"];

    [format ["You have a new callout: %1. Do you accept?", _calloutName], "blue-grey", 5] call EFUNC(misc,notify);

    [_calloutType, _removeActions] call _addCalloutActions;
};

switch (_calloutType) do {
    case "dd": {
        [_calloutName, "dd", _removeActions] call _notifyAndAddActions;
    };
    case "hvt": {
        [_calloutName, "hvt", _removeActions] call _notifyAndAddActions;
    };
    case "rd": {
        [_calloutName, "rd", _removeActions] call _notifyAndAddActions;
    };
    case "sa": {
        [_calloutName, "sa", _removeActions] call _notifyAndAddActions;
    };
    case "sf": {
        [_calloutName, "sf", _removeActions] call _notifyAndAddActions;
    };
    default {
        diag_log format ["Unknown Callout Type: %1", _calloutType];
    };
};

diag_log "Callout Handler Done";

GVAR(acceptCallouts) = true;