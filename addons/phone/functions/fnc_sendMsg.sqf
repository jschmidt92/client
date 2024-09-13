#include "..\script_component.hpp"

params ["_number", "_msg"];

private _defaultPhoneNumber = "unknown";
private _pNumber = GETVAR(player,SOF_Phone_Number,_defaultPhoneNumber);

{
	private _tmpNumber = GETVAR(_x,SOF_Phone_Number,_defaultPhoneNumber);

	if (_tmpNumber isEqualTo _number) then {
		[_pNumber] remoteExec ["sof_client_phone_fnc_newMsg", _x, false];
	};
} forEach playableUnits;

// ["listadd", _number, "", -1, [_pNumber, _msg], "", false] spawn dragonfly_db_fnc_addTask;
["listadd", _number, "", -1, [_pNumber, _msg], "", false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];