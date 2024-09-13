#include "..\script_component.hpp"

_email = (_this select 0);
{
	if (_email == (_x select 1)) then {
		_email = (_x select 0);
	};
} forEach GVAR(addressbook);

[format ["You got a new email from %1.", _email], "cyan", 3] call EFUNC(misc,notify);

playSound "SOF_newMsg";

uiSleep 1;

// [player getVariable ["SOF_Email", "unknown@spearnet.mil"], player, "sof_client_phone_fnc_addEmail", true] remoteExec ["db_fnc_listload", 2, false];
// ["listrng", player getVariable ["SOF_Email", "unknown@spearnet.mil"], "", -1, [], "sof_client_phone_fnc_addEmail", true] spawn dragonfly_db_fnc_addTask;
["listrng", player getVariable ["SOF_Email", "unknown@spearnet.mil"], "", -1, [], "sof_client_phone_fnc_addEmail", true, netId player] remoteExec ["dragonfly_db_fnc_addTask", 2, false];