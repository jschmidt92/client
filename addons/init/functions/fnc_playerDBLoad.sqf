#include "..\script_component.hpp"

/*
 * Function: sof_client_init_fnc_playerDBLoad
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
 * Load player from DB.
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [] call sof_client_init_fnc_playerDBLoad (Server or Singleplayer Only)
 * [] remoteExecCall ["sof_client_init_fnc_playerDBLoad", 2, false] (Multiplayer Only)
 *
 * Public: Yes
 */

// ["hgetall", "", "", -1, [], "sof_client_init_fnc_handlePlayerLoad", true] spawn dragonfly_db_fnc_addTask;
["hgetallid", getPlayerUID player, "", -1, [], "sof_client_init_fnc_handlePlayerLoad", true, netId player] remoteExec ["dragonfly_db_fnc_addTask", 2, false];