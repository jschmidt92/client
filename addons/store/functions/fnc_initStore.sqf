#include "..\script_component.hpp"

/*
 * Function: sof_client_store_fnc_initStore
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
 * Initialize store.
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [] spawn sof_client_store_fnc_initStore (Server or Singleplayer Only)
 * [] remoteExec ["sof_client_store_fnc_initStore", 2, false] (Multiplayer Only)
 *
 * Public: Yes
 */

B_initialBudget = paramsArray select 0;
deliveryTime = paramsArray select 1;

if (isNil "B_defenceBudget") then {
	B_defenceBudget = B_initialBudget;
	publicVariable "B_defenceBudget";
};

if (isNil "B_totalCost") then {
	B_totalCost = 0;
	publicVariable "B_totalCost";
};