#include "..\script_component.hpp"

params ["_veh", "_vehType"];

private _fnc_calculateRepairCost = {
    params ["_damage", "_repairPrice"];
    private _laborHours = _damage * 10;
    private _laborCost = _laborHours * _repairPrice;
    private _partsCost = _damage * 1000;
    [_laborHours, _laborCost, _partsCost, _laborCost + _partsCost]
};

private _currentDamage = damage _veh;
private _repairPrice = "REPAIR_COST" call BIS_fnc_getParamValue;
private _repairDetails = [_currentDamage, _repairPrice] call _fnc_calculateRepairCost;

_repairDetails params ["_laborHours", "_laborCost", "_partsCost", "_repairCost"];

private _formattedLaborHours = _laborHours toFixed 1;
private _formattedLaborCost = (_laborCost) call sof_client_misc_fnc_formatNumber;
private _formattedPartsCost = (_partsCost) call sof_client_misc_fnc_formatNumber;
private _formattedTotalCost = (_repairCost) call sof_client_misc_fnc_formatNumber;

[format ["SERVICE DEPARTMENT:
    <br/>The repair will take %1 Labor Hours to complete.
    <br/>Labor Cost: $%2
    <br/>Parts Cost: $%3
    <br/>Total Cost: $%4", 
    _formattedLaborHours, _formattedLaborCost, _formattedPartsCost, _formattedTotalCost], "blue-grey", 3] call EFUNC(misc,notify);

uiSleep 5;

if (companyFunds < _repairCost) exitWith {
    ["Insufficient company funds for repairing.", "warning", 3] call EFUNC(misc,notify);
};

_veh vehicleChat "Repairing...";
uiSleep _laborHours;

_veh setDamage 0;
_veh vehicleChat format ["%1 Repaired.", _vehType];

_repairCost