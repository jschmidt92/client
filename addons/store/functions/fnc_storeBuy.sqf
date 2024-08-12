#include "..\script_component.hpp"

/*
 * Function: sof_client_store_fnc_storeBuy
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
 * Buy store product.
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * _this spawn sof_client_store_fnc_storeBuy (Server or Singleplayer Only)
 * _this remoteExec ["sof_client_store_fnc_storeBuy", 2, false] (Multiplayer Only)
 *
 * Public: Yes
 */

private _pdbMode = "PDB_MODE" call BFUNC(getParamValue);
private _index = lbCurSel 2023002;
private _data = lbData [2023002, _index];
private _dataArray = call compile _data;
private _class = _dataArray select 0;
private _price = _dataArray select 1;
private _amount = 1;
private _amountPrice = _price * _amount;

switch (GVAR(selectedCategory)) do {
	case "storeItems": {
		["storeItems", 0, _class, _price] call FUNC(buyItem);
	};
	case "storeMagazines": {
		["storeMagazines", 2, _class, _price, true] call FUNC(buyItem);
	};
	case "storeWeapons": {
		["storeWeapons", 1, _class, _price] call FUNC(buyItem);
	};
	case "storeUniforms": {
		["storeUniforms", 0, _class, _price] call FUNC(buyItem);
	};
	case "storeVests": {
		["storeVests", 0, _class, _price] call FUNC(buyItem);
	};
	case "storeHeadgear": {
		["storeHeadgear", 0, _class, _price] call FUNC(buyItem);
	};
	case "storeBackpacks": {
		["storeBackpacks", 3, _class, _price] call FUNC(buyItem;)	
	};
	case "storeAircraft": {
		["garageAircraft", 3, _class, _price] call FUNC(buyVehicle);
	};
	case "storeArmored": {
		["garageArmored", 1, _class, _price] call FUNC(buyVehicle);
	};
	case "storeChopper": {
		["garageChopper", 2, _class, _price] call FUNC(buyVehicle);
	};
	case "storeMarine": {
		["garageMarine", 4, _class, _price] call FUNC(buyVehicle);
	};
	case "storeStatic": {
		["garageStatic", 5, _class, _price] call FUNC(buyVehicle);
	};
	case "storeUAV": {
		["garageUAV", 3, _class, _price] call FUNC(buyVehicle);
	};
	case "storeUGV": {
		["garageUGV", 0, _class, _price] call FUNC(buyVehicle);
	};
	case "storeWheeled": {
		["garageWheeled", 0, _class, _price] call FUNC(buyVehicle);
	};
	default {
		hint "Error >> Item doesn't have a defined type";
		closeDialog 0;
	};
};