#include "..\script_component.hpp"

params ["_email", "_msg"];

private _defaultEmail = "unknown@spearnet.mil";
private _pEmail = GETVAR(player,SOF_Email,_defaultEmail);

{
	private _tmpEmail = GETVAR(_x,SOF_Email,_defaultEmail);

	if (_tmpEmail isEqualTo _email) then {
		[_pEmail] remoteExec ["sof_client_phone_fnc_newEmail", _x, false];
	};
} forEach playableUnits;

// ["listadd", _email, "", -1, [_pEmail, _msg]], "sof_server_phone_fnc_addEmail", false] spawn dragonfly_db_fnc_addTask;
["listadd", _email, "", -1, [_pEmail, _msg], "", false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];