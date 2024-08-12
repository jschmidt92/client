#include "..\script_component.hpp"

params [["_condition", "", [""]], ["_amount", 0, [0]]];

private _newFunds = 0;
private _dialog = findDisplay 202303;
private _list = _dialog displayCtrl 2023001;

switch (_condition) do {
	case ("deduct"): {
		_newFunds = companyFunds - _amount;
		ctrlSetText [2023002, format ["$%1", (_newFunds call EFUNC(misc,formatNumber))]];
	};
	case ("advance"): {
		_newFunds = companyFunds + _amount;
		ctrlSetText [2023002, format ["$%1", (_newFunds call EFUNC(misc,formatNumber))]];
	};
	default {
		lbClear _list;

		{
			if (str (side _x) == str (playerSide)) then {
				private _name = name (_x);
				private _defaultPaygrade = "E1";
				private _paygrade = GETVAR(_x,PayGrade,_defaultPaygrade);
				private _index = _list lbAdd format["%1 - %2", _name, _paygrade];

				_list lbSetData [_index, name (_x)];
			};
		} forEach playableUnits;

		lbSetCurSel [2023001, 0];
		ctrlSetText [2023005, ""];
		ctrlSetText [2023006, ""];
	};
};

lbClear _list;

{
	if (str (side _x) == str (playerSide)) then {
		private _name = name (_x);
		private _defaultPaygrade = "E1";
		private _paygrade = GETVAR(_x,PayGrade,_defaultPaygrade);
		private _index = _list lbAdd format["%1 - %2", _name, _paygrade];

		_list lbSetData [_index, name (_x)];
	};
} forEach playableUnits;

lbSetCurSel [2023001, 0];
ctrlSetText [2023005, ""];
ctrlSetText [2023006, ""];