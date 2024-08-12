#include "..\script_component.hpp"

/*
 * Function: sof_client_db_fnc_saveToMission
 * Author: J.Schmidt
 * Edit: 07.23.2024
 * Copyright © 2024 J.Schmidt, All rights reserved
 *
 * Do not edit without permission!
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivative 4.0 International License.
 * To view a copy of this license, vist https://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
 * PO Box 1866, Mountain View, CA 94042
 *
 * [Description]
 * Store mission and player data in Mission Namespace.
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [] call sof_client_db_fnc_saveToMission;
 *
 * Public: Yes
 */

if (isNil "companyFunds") then { companyFunds = 0 };
if (isNil "companyRating") then { companyRating = 0 };
if (isNil "companyGenerals") then { companyGenerals = [] };
if (isNil "companyArsenalUnlocks") then { companyArsenalUnlocks = [] };
if (isNil "companyGarageUnlocks") then { companyGarageUnlocks = [] };
if (isNil "sof_client_armory_arsenalUnlocks") then { sof_client_armory_arsenalUnlocks = [] };
if (isNil "sof_client_armory_garageUnlocks") then { sof_client_armory_garageUnlocks = [] };

private _vdata = [];
private _pdata = [];
private _cdata = [
["key", "CompanyState"],
["funds", [companyFunds]],
["rating", [companyRating]],
["operations", [companyGenerals]],
["armory_unlocks", [companyArsenalUnlocks]],
["garage_unlocks", [companyGarageUnlocks]]
];

private _vehicles = nearestObjects [player, ["LandVehicle"], 50] apply {
    createHashMapFromArray [
        ["vehicle", _x],
        ["class", [typeOf _x]],
        ["position", [getPosATL _x]],
        ["direction", [getDir _x]],
        ["health", [damage _x]]
    ];
};

{
    if (alive _x) then {  
        _vdata pushBackUnique _x;
    };
} forEach _vehicles;

{
    private _data = [
    ["key", getPlayerUID player],
    ["armory_unlocks", [sof_client_armory_arsenalUnlocks]],
    ["garage_unlocks", [sof_client_armory_garageUnlocks]],
    ["locker", [player getVariable ["Locker", []]]],
    ["garage", [player getVariable ["Garage", []]]],
    ["cash", [player getVariable ["Cash", 0]]],
    ["bank", [player getVariable ["Cash_Bank", 0]]],
    ["number", [player getVariable ["SOF_Phone_Number", "unknown"]]],
    ["email", [player getVariable ["SOF_Email", "unknown@spearnet.mil"]]],
    ["paygrade", [player getVariable ["Paygrade", "E1"]]],
    ["reputation", [rating player]],
    ["loadout", [getUnitLoadout player]],
    ["holster", [player getVariable ["SOF_HolsterWeapon", true]]],
    ["position", [getPosASLVisual player]],
    ["direction", [getDirVisual player]]
    ];

    if (vehicle player == player) then {
        _data pushBack "currentWeapon";
        _data pushBack [currentMuzzle player];
        _data pushBack "stance";
        _data pushBack [stance player];
    };

    _pdata pushBackUnique _data;
} forEach playableUnits;

private _cHashMap = createHashMapFromArray _cdata;
private _pHashMap = createHashMapFromArray _pdata;
private _vHashMap = createHashMapFromArray _vdata;

missionProfileNamespace setVariable ["SOF_MissionData", _cHashMap];
missionProfileNamespace setVariable ["SOF_PlayerData", _pHashMap];
missionProfileNamespace setVariable ["SOF_VehicleData", _vHashMap];