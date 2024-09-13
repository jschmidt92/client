#include "..\script_component.hpp"

_number = (_this select 0);
{
	if (_number == (_x select 1)) then {
		_number = (_x select 0);
	};
} forEach GVAR(addressbook);

[format ["You got a new message from %1.", _number], "green", 3] call EFUNC(misc,notify);

playSound "SOF_newMsg";

uiSleep 1;

// [player getVariable ["SOF_Phone_Number", "unknown"], player, "sof_client_phone_fnc_addMsg", true] remoteExec ["db_fnc_listload", 2, false];
// ["listrng", player getVariable ["SOF_Phone_Number", "unknown"], "", -1, [], "sof_client_phone_fnc_addMsg", true] spawn dragonfly_db_fnc_addTask;
["listrng", player getVariable ["SOF_Phone_Number", "unknown"], "", -1, [], "sof_client_phone_fnc_addMsg", true, netId player] remoteExec ["dragonfly_db_fnc_addTask", 2, false];