#include "..\script_component.hpp"

params ["_veh"];

private _fuelNeeded = 1 - (fuel _veh);
private _fuelCost = "FUEL_COST" call BIS_fnc_getParamValue;
private _estimatedCost = _fuelNeeded * _fuelCost;

private _fuelAdded = 0;
private _refuelRate = 0.01;
private _refuelInterval = 0.1;

if (companyFunds < _estimatedCost) exitWith {
    ["Insufficient company funds for refueling.", "warning", 3] call EFUNC(misc,notify);
};

["Refueling Vehicle...", "grey", 3] call EFUNC(misc,notify);

while { fuel _veh < 0.99 && companyFunds >= (_fuelAdded * _fuelCost) } do {
    _veh setFuel ((fuel _veh) + _refuelRate);
    _fuelAdded = _fuelAdded + _refuelRate;
    uiSleep _refuelInterval;
};

private _totalCost = _fuelAdded * _fuelCost;
private _formattedTotalCost = (_totalCost) call sof_client_misc_fnc_formatNumber;
private _formattedFuelAdded = (_fuelAdded) toFixed 2;

["deduct", _totalCost] remoteExecCall ["sof_server_money_fnc_handleFunds", 2];

[format ["VEHICLE REFUELED:
    <br/>Fuel Added: %1
    <br/>Total Cost: $%2
    <br/>Billed to SOF PMC Group.", _formattedFuelAdded, _formattedTotalCost], "blue-grey", 5] call EFUNC(misc,notify);