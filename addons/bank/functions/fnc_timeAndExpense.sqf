#include "..\script_component.hpp"

private _payMultiplyer = "MULTIPLYR" call BFUNC(getParamValue);
private _plyscore = rating player;
private _multiplyer = _plyscore * _payMultiplyer;
private _bank = GETVAR(player,Cash_Bank,0);
private _newBank = _bank + _multiplyer;

private _formattedNewBank = _newBank call EFUNC(misc,formatNumber);
private _formattedPending = 0 call EFUNC(misc,formatNumber);

SETPVAR(player,Cash_Bank,_newBank);

hintSilent format ["Payday! You were paid $%1.00 for services rendered. The money has been direct deposited to your account.", _multiplyer];
["InformationGreen", ["Payday!"]] call BFUNC(showNotification);

player addRating - _plyscore;

ctrlSetText [2023002, format ["Bank: $%1", _formattedNewBank]];
ctrlSetText [2023000, format ["Pending: $%1", _formattedPending]];

ctrlEnable [1602, true];