#include "..\script_component.hpp"

/*
 * Function: sof_client_interaction_fnc_initInteraction
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
 * N/A
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [] spawn sof_client_interaction_fnc_initInteraction;
 *
 * Public: Yes
 */

SOF_Team_Coord = "TEAM_COORD" call BFUNC(getParamValue);
SOF_VA_Enable = "VA_ENABLE" call BFUNC(getParamValue);

SOF_InteractionButtons = [1600, 1601, 1602, 1603, 1604, 1605, 1606, 1607, 1608];

SOF_InteractionItems = [
	[
		["isPlayer cursorObject", "(player distance cursorObject) <= 5"],
		["Give Cash", "[cursorObject] spawn sof_client_money_fnc_giveCash"]
	],
	[
		["isPlayer cursorObject", "(player distance cursorObject) <= 5"],
		["Add Contact", "[cursorObject] call sof_client_phone_fnc_addContact"]
	],
	[
		["!(isNil {
			cursorObject getVariable 'isBank'
		})", "(player distance cursorObject) <= 5"],
		["Access ATM", "[cursorObject] spawn sof_client_bank_fnc_openBank"]
	],
	[
		["!(isNil {
			cursorObject getVariable 'isCPOF'
		})", "(player distance cursorObject) <= 5 && (getPlayerUID player) in companyGenerals"],
		["Access CPOF", "[cursorObject] spawn sof_client_admin_fnc_openAdmin"]
	],
	[
		["!(isNil {
			cursorObject getVariable 'isCash'
		})", "(player distance cursorObject) <= 5"],
		["Take Cash", "[cursorObject] spawn sof_client_money_fnc_takeCash"]
	],
	[
		["!(isNil {
			cursorObject getVariable 'isLocker'
		})", "(player distance cursorObject) <= 5"],
		["Open Locker", "[cursorObject] spawn sof_client_locker_fnc_openLocker"]
	],
	[
		["!(isNil {
			cursorObject getVariable 'isStore'
		})", "(player distance cursorObject) <= 5"],
		["Access the Store", "[cursorObject] spawn sof_client_store_fnc_openStore"]
	]
];

if (SOF_Team_Coord == 1) then {
	SOF_InteractionItems append [
		[
			["!(isNil {
				cursorObject getVariable 'isGarage'
			})", "(player distance cursorObject) <= 5 && (getPlayerUID player) in companyGenerals"],
			["Open Company Garage", "[cursorObject] spawn sof_client_garage_fnc_openGarage"]
		]
	];
} else {
	SOF_InteractionItems append [
		[
			["!(isNil {
				cursorObject getVariable 'isGarage'
			})", "(player distance cursorObject) <= 5"],
			["Open Garage", "[cursorObject] spawn sof_client_garage_fnc_openGarage"]
		]
	];
};

if (SOF_VA_Enable == 1) then {
	SOF_InteractionItems append [
		[
			["!(isNil {
				cursorObject getVariable 'isLocker'
			})", "(player distance cursorObject) <= 5"],
			["Virtual Armory", "[] spawn sof_client_armory_fnc_openArmory"]
		],
		[
			["!(isNil {
				cursorObject getVariable 'isGarage'
			})", "(player distance cursorObject) <= 5"],
			["Virtual Garage", "[cursorObject] spawn sof_client_armory_fnc_openGarage"]
		]
	];
};