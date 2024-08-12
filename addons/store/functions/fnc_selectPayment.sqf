#include "..\script_component.hpp"

/*
 * Function: sof_client_store_fnc_selectPayment
 * Author: Creedcoder, J.Schmidt
 * Edit: 07.15.2024
 * Copyright © 2024 Creedcoder, J.Schmidt, All rights reserved
 *
 * Do not edit without permission!
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivative 4.0 International License.
 * To view a copy of this license, vist https://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
 * PO Box 1866, Mountain View, CA 94042
 *
 * [Description]
 * Select store method of payment.
 *
 * Arguments:
 * 0: Target Object for store <OBJECT>
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * _this spawn sof_client_store_fnc_selectPayment (Server or Singleplayer Only)
 * _this remoteExec ["sof_client_store_fnc_selectPayment", 2, false] (Multiplayer Only)
 *
 * Public: Yes
 */

GVAR(selectedPaymentMethod)Index = _this select 1;
{
	if (GVAR(selectedPaymentMethod)Index == _forEachIndex) then {
		GVAR(currentPaymentMethod) = _x;
	};
} forEach storePaymentMethods;

hintSilent format ["Payment Method changed. \n Only type %1 will be used.", GVAR(currentPaymentMethod)];