#include "..\script_component.hpp"

/*
 * Function: sof_client_store_fnc_filterChange
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
 * Change store filter.
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * _this spawn sof_client_store_fnc_filterChange (Server or Singleplayer Only)
 * _this remoteExec ["sof_client_store_fnc_filterChange", 2, false] (Multiplayer Only)
 *
 * Public: Yes
 */

private _control = _this select 0;
private _index = _this select 1;
private _selectedCategory = _control lbData _index;
private _selectedCategoryTitle = _control lbText _index;

{
	if (_index == _forEachIndex) then {
		GVAR(selectedCategory) = _selectedCategory;
		GVAR(selectedCategoryTitle) = _selectedCategoryTitle;
	};
} forEach storeCategories;

switch (GVAR(selectedCategory)) do {
	case "storeBackpacks": {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
	case "storeGoggles": {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
	case "storeHeadgear": {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
	case "storeItems": {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
	case "storeMagazines": {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
	case "storeUniforms": {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
	case "storeVests": {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
	case "storeWeapons": {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
	case "storeAircraft": {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
	case "storeArmored": {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
	case "storeChopper": {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
	case "storeMarine": {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
	case "storeStatic": {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
	case "storeUAV": {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
	case "storeUGV": {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
	case "storeWheeled": {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
	default {
		[missionNamespace getVariable GVAR(selectedCategory)] call FUNC(addInventory);
	};
};

hintSilent format ["Category filter changed. \n Only type %1 products will be shown.", GVAR(selectedCategory)Title];