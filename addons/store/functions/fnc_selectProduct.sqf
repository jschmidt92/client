#include "..\script_component.hpp"

/*
 * Function: sof_client_store_fnc_selectProduct
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
 * Select store product.
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * _this spawn sof_client_store_fnc_selectProduct (Server or Singleplayer Only)
 * _this remoteExec ["sof_client_store_fnc_selectProduct", 2, false] (Multiplayer Only)
 *
 * Public: Yes
 */

private _dialog = findDisplay 202302;
private _itemDescription = _dialog displayCtrl 2023001;

private _i = _this select 1;
GVAR(focusedProductClass) = ((GVAR(currentProductList) select _i) select 0);
focusedProductPrice = ((GVAR(currentProductList) select _i) select 1);

switch (GVAR(selectedCategory)) do {
	case "storeBackpacks": {
		GVAR(focusedProductName) = getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "picture")];
	};
	case "storeGoggles": {
		GVAR(focusedProductName) = getText (configFile >> "CfgWeapons" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgWeapons" >> GVAR(focusedProductClass) >> "picture")];
	};
	case "storeHeadgear": {
		GVAR(focusedProductName) = getText (configFile >> "CfgWeapons" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgWeapons" >> GVAR(focusedProductClass) >> "picture")];
	};
	case "storeItems": {
		GVAR(focusedProductName) = getText (configFile >> "CfgWeapons" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgWeapons" >> GVAR(focusedProductClass) >> "picture")];
	};
	case "storeMagazines": {
		GVAR(focusedProductName) = getText (configFile >> "CfgMagazines" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgMagazines" >> GVAR(focusedProductClass) >> "picture")];
	};
	case "storeUniforms": {
		GVAR(focusedProductName) = getText (configFile >> "CfgWeapons" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgWeapons" >> GVAR(focusedProductClass) >> "picture")];
	};
	case "storeVests": {
		GVAR(focusedProductName) = getText (configFile >> "CfgWeapons" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgWeapons" >> GVAR(focusedProductClass) >> "picture")];
	};
	case "storeWeapons": {
		GVAR(focusedProductName) = getText (configFile >> "CfgWeapons" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgWeapons" >> GVAR(focusedProductClass) >> "picture")];
	};
	case "storeAircraft": {
		GVAR(focusedProductName) = getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "picture")];
	};
	case "storeArmored": {
		GVAR(focusedProductName) = getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "picture")];
	};
	case "storeChopper": {
		GVAR(focusedProductName) = getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "picture")];
	};
	case "storeMarine": {
		GVAR(focusedProductName) = getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "picture")];
	};
	case "storeStatic": {
		GVAR(focusedProductName) = getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "picture")];
	};
	case "storeUAV": {
		GVAR(focusedProductName) = getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "picture")];
	};
	case "storeUGV": {
		GVAR(focusedProductName) = getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "picture")];
	};
	case "storeWheeled": {
		GVAR(focusedProductName) = getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgVehicles" >> GVAR(focusedProductClass) >> "picture")];
	};
	default {
		GVAR(focusedProductName) = getText (configFile >> "CfgWeapons" >> GVAR(focusedProductClass) >> "displayName");
		ctrlSetText [2023003, getText (configFile >> "CfgWeapons" >> GVAR(focusedProductClass) >> "picture")];
	};
};

_itemDescription ctrlSetStructuredText parseText format ["<t color='#000000'>%1<br /><br />Price: $%2<br />", GVAR(focusedProductName), focusedProductPrice];