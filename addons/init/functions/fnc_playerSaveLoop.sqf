#include "..\script_component.hpp"

/*
 * Function: sof_client_init_fnc_playerSaveLoop
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
 * Initialize player save loop.
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [] call sof_client_init_fnc_playerSaveLoop (Server or Singleplayer Only)
 * [] remoteExecCall ["sof_client_init_fnc_playerSaveLoop", 2, false] (Multiplayer Only)
 *
 * Public: Yes
 */

waitUntil { !isNull player };
waitUntil { alive player };

while { true } do {
    sleep ((configFile >> "CfgPatches" >> "sof_client_main" >> "clientSaveLoopTime") call BFUNC(getCfgData));

	["Saving player...", "blue-grey", 3] call EFUNC(misc,notify);
    [] call FUNC(playerDBSave);
};