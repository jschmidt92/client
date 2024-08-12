#include "..\script_component.hpp"

params ["_veh", "_vehType"];

private _fnc_removeMagazines = {
    params ["_vehicle", "_magazines"];
    private _removedMags = [];
    {
        if !(_x in _removedMags) then {
            _vehicle removeMagazines _x;
            _removedMags pushBack _x;
        };
    } forEach _magazines;
    _removedMags
};

private _fnc_addMagazines = {
    params ["_vehicle", "_magazines"];
    private _rearmCost = 0;
    {
        _vehicle vehicleChat format ["Reloading %1", _x];
        _vehicle addMagazine _x;
        _rearmCost = _rearmCost + 100;
        uiSleep 1;
    } forEach _magazines;
    _rearmCost
};

private _fnc_processTurrets = {
    params ["_vehicle", "_config"];
    private _rearmCost = 0;
    private _turretCount = count (_config >> "Turrets");
    for "_i" from 0 to (_turretCount - 1) do {
        private _turretConfig = (_config >> "Turrets") select _i;
        private _vehMags = getArray (_turretConfig >> "magazines");
        [_vehicle, _vehMags] call _fnc_removeMagazines;
        _rearmCost = _rearmCost + ([_vehicle, _vehMags] call _fnc_addMagazines);
        
        if (count (_turretConfig >> "Turrets") > 0) then {
            _rearmCost = _rearmCost + ([_vehicle, _turretConfig] call _fnc_processTurrets);
        };
    };
    _rearmCost
};

private _vehMags = getArray (configFile >> "CfgVehicles" >> _vehType >> "magazines");
private _rearmCost = 0;

[_veh, _vehMags] call _fnc_removeMagazines;
_rearmCost = _rearmCost + ([_veh, _vehMags] call _fnc_addMagazines);

private _turretConfig = configFile >> "CfgVehicles" >> _vehType >> "Turrets";
_rearmCost = _rearmCost + ([_veh, _turretConfig] call _fnc_processTurrets);

if (companyFunds < _rearmCost) exitWith {
    ["Insufficient company funds for rearming.", "warning", 3] call EFUNC(misc,notify);
};

_veh vehicleChat "Rearming...";

_veh setVehicleAmmo 1;
_veh vehicleChat format ["%1 Rearmed.", _vehType];

_rearmCost