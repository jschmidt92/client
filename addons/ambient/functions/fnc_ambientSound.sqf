#include "..\script_component.hpp"

/*
 * Function: sof_client_ambient_fnc_ambientSound
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
 * Create a sound source and play an ambient sfx sound.
 *
 * Arguments:
 * 0: The sound source <OBJECT>
 * 1: The name of the SFX sound <STRING>
 * 2: Number of seconds before SFX sound will be deleted <NUMBER>
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [this, "sfx_sound_name"] spawn sof_client_ambient_fnc_ambientSound
 *
 * Public: Yes
 */

params [["_source", nil, [objNull, 0, [], sideUnknown, grpNull, ""]], ["_sfx", "", [""]], ["_time", nil, [0]]];

private _sound0 = createSoundSource [_sfx, position _source, [], 0];

while { alive _source } do {
	if (!isNil "_time") exitWith {
		uiSleep _time;
		deleteVehicle _sound0;
	};

	uiSleep 5;

	if (!alive _source) exitWith {
		deleteVehicle _sound0;
	};
};