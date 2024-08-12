#include "..\script_component.hpp"

/*
 * Function: sof_client_money_fnc_giveCashSubmit
 * Author: Creedcoder, J.Schmidt
 * Edit: 07.23.2024
 * Copyright © 2024 Creedcoder, J.Schmidt, All rights reserved
 *
 * Do not edit without permission!
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivative 4.0 International License.
 * To view a copy of this license, vist https://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
 * PO Box 1866, Mountain View, CA 94042
 *
 * [Description]
 * Handle cash to be given.
 *
 * Arguments:
 * 0: Target to add money <OBJECT>
 * 1: Player to remove money <OBJECT>
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [cursorObject, player] spawn sof_client_money_fnc_giveCashSubmit;
 *
 * Public: Yes
 */

params ["_target", "_player"];

private _amount = parseNumber (ctrlText 1401);
private _playerCash = GETVAR(player,Cash,0);
private _targetCash = GETVAR(_target,Cash,0);

if (_amount > 0) then {
	if (_amount > _playerCash) exitWith { ["Insufficient cash available.", "warning", 3] call EFUNC(misc,notify) };

	private _newCash = _targetCash + _amount;
	private _formattedAmount =  (_amount) call EFUNC(misc,formatNumber);
	SETVAR(_target,Cash,_newCash);

	["deduct", "Cash", _amount] remoteExecCall ["sof_server_money_fnc_handleMoney", 2];
	[format ["You have received $%2 cash from %1", _player, _formattedAmount], "blue-grey", 3] remoteExecCall [QEFUNC(misc,notify), _target];
} else {
	[format ["Enter a valid amount greater than zero."], "warning", 3] call EFUNC(misc,notify);
};

closeDialog 0;