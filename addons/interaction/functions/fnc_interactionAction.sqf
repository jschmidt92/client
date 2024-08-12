#include "..\script_component.hpp"

/*
 * Function: sof_client_interaction_fnc_interactionAction
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
 * Initialize player interaction.
 *
 * Arguments:
 * 0: Index of current action array <NUMBER>
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [0] call sof_client_interaction_fnc_interactionAction;
 *
 * Public: Yes
 */

params ["_index"];

closeDialog 0;

call compile (SOF_CurrentActionArray select _index);