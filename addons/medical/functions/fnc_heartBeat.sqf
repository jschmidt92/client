#include "..\script_component.hpp"

params ["_unit", "_totalCost"];

while { (GETVAR(_unit,Cash,0)) < _totalCost or (GETVAR(_unit,Cash_Bank,0)) < _totalCost } do {
    if ((GETVAR(_unit,Cash,0)) >= _totalCost or (GETVAR(_unit,Cash_Bank,0)) >= _totalCost) exitWith {
        [_unit, ""] remoteExec ["switchMove"];
        [_unit, _totalCost] call FUNC(deductMedicalCost);
        SETVAR(_unit,gearSaved,false);

        ["Terminate"] call BFUNC(EGSpectator);
    };

    uiSleep 1;
};