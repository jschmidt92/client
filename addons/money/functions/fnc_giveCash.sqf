#include "..\script_component.hpp"

/*
 * Function: sof_client_money_fnc_giveCash
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
 * Send money to player.
 *
 * Arguments:
 * 0: Target to send money <OBJECT>
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [cursorObject] spawn sof_client_money_fnc_giveCash;
 *
 * Public: Yes
 */

SOF_cashGiveTarget = _this select 0;

disableSerialization;
createDialog "RscGiveCash";