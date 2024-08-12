#include "..\script_component.hpp"

disableSerialization;
createDialog "RscBank";

private _bank = player getVariable ["Cash_Bank", 0];
private _cash = player getVariable ["Cash", 0];
private _payMultiplyer = "MULTIPLYR" call BFUNC(getParamValue);
private _plyscore = rating player;
private _pending = _plyscore * _payMultiplyer;

private _formattedBank = _bank call EFUNC(misc,formatNumber);
private _formattedCash = _cash call EFUNC(misc,formatNumber);
private _formattedPending = _pending call EFUNC(misc,formatNumber);

ctrlSetText [2023000, format ["Pending: $%1", _formattedPending]];
ctrlSetText [2023001, format ["Account: %1", name player]];
ctrlSetText [2023002, format ["Bank: $%1", _formattedBank]];
ctrlSetText [2023003, format ["Cash: $%1", _formattedCash]];