#include "..\script_component.hpp"

/*
 * Function: sof_client_store_fnc_buyItem
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
 * Buy store item.
 *
 * Arguments:
 * 0: Name of category type <STRING> (default: "")
 * 1: Type of item <NUMBER> (default: 0)
 * 2: Classname of item <STRING> (default: "")
 * 3: Price of item <NUMBER> (default: 0)
 * 4: Magazine <BOOL> (default: false)
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * ["storeItems", 0, "ItemMap", 10] call sof_client_store_fnc_buyItem (Server or Singleplayer Only)
 * ["storeItems", 0, "ItemMap", 10] remoteExecCall ["sof_client_store_fnc_buyItem", 2, false] (Multiplayer Only)
 *
 * Public: Yes
 */

params [["_categoryType", "", [""]], ["_itemType", 0, [0]], ["_classname", "", [""]], ["_itemPrice", 0, [0]], ["_magazine", false, [false]]];

private _bank = player getVariable ["Cash_Bank", 0];
private _cash = player getVariable ["Cash", 0];
private _locker = player getVariable ["Locker", []];
private _funds = companyFunds;

if (GVAR(currentPaymentMethod) == "Company Funds" && !((getPlayerUID player) in companyGenerals)) exitWith { hintSilent "You are not authorized to use Company Funds!" };
if (GVAR(currentPaymentMethod) == "Company Funds" && (getPlayerUID player) in companyGenerals) then {
    if (_itemPrice > _funds) exitWith { hintSilent "You do not have enough funds!" };
    if (_magazine) then {
        _locker pushBack [_categoryType, [_classname, getNumber (configfile >> "CfgMagazines" >> _classname >> "count"), getNumber (configfile >> "CfgMagazines" >> _classname >> "count")]];
    } else {
        _locker pushBack [_categoryType, _classname];
    };

    SETVAR(player,Locker,_locker);

    ["deduct", _itemPrice] remoteExecCall ["sof_server_money_fnc_handleFunds", 2];
    [_classname, _itemType] call EFUNC(armory,addItemArmory);

    hintSilent "You have bought the item!";
} else {
    if (_itemPrice > _cash) exitWith { hintSilent "You do not have enough money!" };
    if (_magazine) then {
        _locker pushBack [_categoryType, [_classname, getNumber (configfile >> "CfgMagazines" >> _classname >> "count"), getNumber (configfile >> "CfgMagazines" >> _classname >> "count")]];
    } else {
        _locker pushBack [_categoryType, _classname];
    };

    SETVAR(player,Locker,_locker);

    ["deduct", "Cash", _itemPrice, player] remoteExecCall ["sof_server_money_fnc_handleMoney", 2];
    [_classname, _itemType] call EFUNC(armory,addItemArmory);

    hintSilent "You have bought the item!";
};