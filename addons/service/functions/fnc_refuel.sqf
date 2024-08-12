#include "..\script_component.hpp"

params ["_veh", "_vehType"];

private _fnc_calculateFuelCost = {
    params ["_currentFuel", "_fuelPrice"];
    private _fuelNeeded = 1 - _currentFuel;
    private _cost = _fuelNeeded * _fuelPrice;
    [_fuelNeeded, _cost]
};

private _fnc_refuelVehicle = {
    params ["_vehicle", "_fuelNeeded", "_fuelPrice"];
    private _fuelAdded = 0;
    private _refuelRate = 0.01;
    private _refuelInterval = 0.1;

    while { fuel _vehicle < 0.99 && _fuelAdded < _fuelNeeded } do {
        _vehicle setFuel ((fuel _vehicle) + _refuelRate);
        _fuelAdded = _fuelAdded + _refuelRate;
        uiSleep _refuelInterval;
    };

    _fuelAdded
};

private _currentFuel = fuel _veh;
private _fuelPrice = "FUEL_COST" call BIS_fnc_getParamValue;
private _fuelDetails = [_currentFuel, _fuelPrice] call _fnc_calculateFuelCost;

_fuelDetails params ["_fuelNeeded", "_estimatedCost"];

if (companyFunds < _estimatedCost) exitWith {
    ["Insufficient company funds for refueling.", "warning", 3] call EFUNC(misc,notify);
};

_veh vehicleChat "Refueling...";

private _fuelAdded = [_veh, _fuelNeeded, _fuelPrice] call _fnc_refuelVehicle;
private _fuelCost = _fuelAdded * _fuelPrice;

_veh vehicleChat format ["%1 Refueled.", _vehType];

_fuelCost