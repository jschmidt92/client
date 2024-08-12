#include "..\script_component.hpp"

params ["_unit", "_corpse"];

private _newBank = 0;
private _newCash = 0;

private _bank = GETVAR(_unit,Cash_Bank,0);
private _cash = GETVAR(_unit,Cash,0);
private _funds = companyFunds;

private _deductible = "INS_DEDUCT" call BFUNC(getParamValue);
private _medicalCost = "MED_COST" call BFUNC(getParamValue);
private _totalCost = (_medicalCost - _deductible);

private _loadout = [[], [], [], ["U_BG_Guerrilla_6_1", []], [], [], "", "", [], ["", "", "", "", "", ""]];
private _stretcher = (GVAR(occupancyTriggers) select { !(GETVAR(_x,isOccupied,false)) }) param [0, objNull];
private _stretcherPos = (getPosATL _stretcher) vectorAdd [0.05, -0.125, 0.45];
private _stretcherDir = getDir _stretcher;

if (_cash >= _totalCost || _bank >= _totalCost) exitWith {
    [_unit, _totalCost] call FUNC(deductMedicalCost);
    _unit setUnitLoadout _loadout;
};

["Medical Alert: Funds unavailable for treatment. Respawn temporarily suspended.", "warning", 5] call EFUNC(misc,notify);

_unit setUnitLoadout _loadout;
_unit setPosATL _stretcherPos;
_unit setDir _stretcherDir;
[_unit, "Acts_LyingWounded_loop"] remoteExec ["switchMove"];

["Initialize", [_unit, [], false, true, true, true, true, true, false, false]] call BFUNC(EGSpectator);

[_unit, _totalCost] spawn FUNC(heartBeat);