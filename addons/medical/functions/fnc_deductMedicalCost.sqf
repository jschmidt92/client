#include "..\script_component.hpp"

params ["_unit", "_totalCost"];

private _preferredAccount = GETVAR(_unit,Cash_Bank,0);
private _selectedAccount = ["Cash", "Cash_Bank"] select (_preferredAccount >= _totalCost);
private _accountBalance = _unit getVariable _selectedAccount;
private _newBalance = _accountBalance - _totalCost;

SETPVAR(_unit,_selectedAccount,_newBalance);
[format ["Medical Services: %1 credited for treatment and recovery.", _totalCost], "blue-grey", 5] call EFUNC(misc,notify);