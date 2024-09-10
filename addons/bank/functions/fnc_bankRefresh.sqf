#include "..\script_component.hpp"

params [["_amount", 0, [0]], ["_type", "", [""]]];

private _bank = GETVAR(player,Cash_Bank,0);
private _cash = GETVAR(player,Cash,0);
private _newBank = 0;
private _newCash = 0;

switch (_type) do {
    case "Bank": {
        _newCash = _cash - _amount;
        _newBank = _bank + _amount;
    };
    case "Cash": {
        _newBank = _bank - _amount;
        _newCash = _cash + _amount;
    };
};

if (_newBank < 0) exitWith {
    ["You don't have enough money in the bank!", "warning", 3] call EFUNC(misc,notify);
};
if (_newCash < 0) exitWith {
    ["You don't have enough cash!", "warning", 3] call EFUNC(misc,notify);
};

private _netWorth = _newBank + _newCash;
private _formattedNewBank = _newBank call EFUNC(misc,formatNumber);
private _formattedNewCash = _newCash call EFUNC(misc,formatNumber);

SETPVAR(player,Cash_Bank,_newBank);
SETPVAR(player,Cash,_newCash);

SETVAR(profileNamespace,SOFPlayerNet,_netWorth);

ctrlSetText [2023002, format ["Bank: $%1", _formattedNewBank]];
ctrlSetText [2023003, format ["Cash: $%1", _formattedNewCash]];