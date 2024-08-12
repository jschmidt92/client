#include "..\script_component.hpp"

/*
 * Function: sof_client_interaction_fnc_openInteraction
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
 * Open player interaction.
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [] call sof_client_interaction_fnc_openInteraction;
 *
 * Public: Yes
 */

if (!isNull findDisplay 1014) exitWith {};

createDialog "RscInteraction";

{
	ctrlShow [_x, false];
} forEach SOF_InteractionButtons;

private _index1 = 0;
SOF_CurrentActionArray = [];

{
	private _cArray = _x select 0;
	private _cTrue = true;

	for "_i" from 0 to ((count _cArray) - 1) step 1 do {
		_c = call compile (_cArray select _i);
		if (!_c) then {
			_cTrue = false;
		};
	};

	if (_cTrue) then {
		if (_index1 < 9) then {
			private _idc = 1600 + _index1;
			_index1 = _index1 + 1;
			private _text = (_x select 1) select 0;
			private _action = (_x select 1) select 1;

			ctrlShow [_idc, true];
			ctrlSetText [_idc, _text];

			SOF_CurrentActionArray pushBack _action;
		};
	};
} forEach SOF_InteractionItems;