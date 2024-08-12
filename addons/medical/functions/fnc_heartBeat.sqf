#include "..\script_component.hpp"

params ["_unit", "_totalCost"];

private _bank = GETVAR(_unit,Cash_Bank,0);
private _cash = GETVAR(_unit,Cash,0);

while { _cash < _totalCost && _bank < _totalCost } do {
    if (_cash >= _totalCost || _bank >= _totalCost) exitWith {
        [_unit, ""] remoteExec ["switchMove"];
        [_unit, _totalCost] call FUNC(deductMedicalCost);
        SETVAR(_unit,gearSaved,false);

        ["Terminate"] call BFUNC(EGSpectator);
    };

    uiSleep 1;
};