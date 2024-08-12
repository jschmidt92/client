#include "..\script_component.hpp"

/*
 * Function: sof_client_store_fnc_buyVehicle
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
 * Buy store vehicle.
 *
 * Arguments:
 * 0: Name of category type <STRING> (default: "")
 * 1: Type of item <NUMBER> (default: 0)
 * 2: Classname of item <STRING> (default: "")
 * 3: Price of item <NUMBER> (default: 0)
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * ["garageWheeled", 0, "B_Quadbike_01_F", 10000] call sof_client_store_fnc_buyVehicle (Server or Singleplayer Only)
 * ["garageWheeled", 0, "B_Quadbike_01_F", 10000] remoteExecCall ["sof_client_store_fnc_buyVehicle", 2, false] (Multiplayer Only)
 *
 * Public: Yes
 */

params [["_categoryType", "", [""]], ["_vehicleType", 0, [0]], ["_classname", "", [""]], ["_vehiclePrice", 0, [0]]];

private _bank = player getVariable ["Cash_Bank", 0];
private _cash = player getVariable ["Cash", 0];
private _garage = player getVariable ["Garage", []];
private _funds = companyFunds;

if (GVAR(currentPaymentMethod) == "Company Funds" && !((getPlayerUID player) in companyGenerals)) exitWith { hintSilent "You are not authorized to use Company Funds!" };
if (GVAR(currentPaymentMethod) == "Company Funds" && (getPlayerUID player) in companyGenerals) then {
    if (_vehiclePrice > _funds) exitWith { hintSilent "You do not have enough funds!" };

    _garage pushBack [_categoryType, _classname];
    SETVAR(player,Garage,_garage);

    ["deduct", _vehiclePrice] remoteExecCall ["sof_server_money_fnc_handleFunds", 2];
    [_classname, _vehicleType] call EFUNC(armory,addVehArmory);

    hintSilent "You have bought the vehicle!";
} else {
    if (_vehiclePrice > _cash) exitWith { hintSilent "You do not have enough money!" };

    _garage pushBack [_categoryType, _classname];
    SETVAR(player,Garage,_garage);

    ["deduct", "Cash", _vehiclePrice, player] remoteExecCall ["sof_server_money_fnc_handleMoney", 2];
    [_classname, _vehicleType] call EFUNC(armory,addVehArmory);

    hintSilent "You have bought the vehicle!";
};