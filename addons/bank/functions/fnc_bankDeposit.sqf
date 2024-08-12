#include "..\script_component.hpp"

private _amount = round (parseNumber (ctrlText 2023004));

if (_amount > 0) then {
	[_amount, "Bank"] call FUNC(bankRefresh);
} else {
	hintSilent "Deposit amount must be greater than 0!";
};

ctrlSetText [2023004, ""];
ctrlEnable [1601, true];