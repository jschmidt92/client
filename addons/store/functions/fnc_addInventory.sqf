#include "..\script_component.hpp"

/*
 * Function: sof_client_store_fnc_addInventory
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
 * Add Inventory to store.
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [missionNamespace getVariable GVAR(selectedCategory)] call sof_client_store_fnc_addInventory (Server or Singleplayer Only)
 * [missionNamespace getVariable GVAR(selectedCategory)] remoteExecCall ["sof_client_store_fnc_addInventory", 2, false] (Multiplayer Only)
 *
 * Public: Yes
 */

private _dialog = findDisplay 202302;
private _itemList = _dialog displayCtrl 2023002;

lbClear _itemList;

GVAR(currentProductList) = [];
currentSelectionArray = _this select 0;

{
	private _class = ((currentSelectionArray select _forEachIndex) select 0);
	private _price = ((currentSelectionArray select _forEachIndex) select 1);
	private _mod = ((currentSelectionArray select _forEachIndex) select 2);
	
	if (_mod == GVAR(currentMod)) then {
		GVAR(currentProductList) pushBack [_class, _price, _mod];
		switch (GVAR(selectedCategory)) do {
			case "storeBackpacks": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeGoggles": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
			case "storeHeadgear": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
			case "storeItems": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
			case "storeMagazines": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgMagazines" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgMagazines" >> _class >> "picture"))];
			};
			case "storeUniforms": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
			case "storeVests": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
			case "storeWeapons": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};

			case "storeAircraft": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeArmored": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeChopper": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeMarine": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeStatic": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeUAV": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeUGV": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			case "storeWheeled": {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> _class >> "picture"))];
			};
			default {
				private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgWeapons" >> _class >> "displayName"));
				_itemList lbSetData [_itemListIndex, format ["%1", [_class, _price, _mod]]];
				_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgWeapons" >> _class >> "picture"))];
			};
		};
	};
} forEach currentSelectionArray;

_itemList lbSetCurSel 0;