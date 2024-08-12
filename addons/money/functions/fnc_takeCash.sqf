#include "..\script_component.hpp"

/*
 * Function: sof_client_money_fnc_takeCash
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
 * Handle cash picked up.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [cursorObject] spawn sof_client_money_fnc_takeCash;
 *
 * Public: Yes
 */

params ["_ct"];

private _amount = GETVAR(_ct,Cash,0);

["advance", "Cash", _amount] call sof_server_money_fnc_handleMoney;

SETPVAR(_ct,Cash,nil);
deleteVehicle _ct;