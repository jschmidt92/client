#include "..\script_component.hpp"

private _amount = round (parseNumber (ctrlText 2023004));

if (_amount > 0) then {
	[_amount, "Cash"] call FUNC(bankRefresh);
} else {
	hintSilent "Withdrawal amount must be more than $0!";
};

ctrlSetText [2023004, ""];
ctrlEnable [1600, true];