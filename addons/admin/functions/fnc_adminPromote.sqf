#include "..\script_component.hpp"

params [["_condition", "", [""]]];
private ["_data", "_data2", "_dialog", "_list", "_list2", "_paygrade", "_rankValue", "_target", "_targetValue"];

_dialog = findDisplay 202303;
_list = _dialog displayCtrl 2023001;
_list2 = _dialog displayCtrl 2023003;
_targetValue = lbCurSel _list;
_rankValue = lbCurSel _list2;
_data = _list lbData _targetValue;
_data2 = call compile format ["%1", (_list2 lbData _rankValue)];
_paygrade = _data2 select 0;

if ((isNil {_data})) exitWith { hintSilent "You did not select a player!" };
{
	if (str (name (_x)) == str _data) then {
		_target = _x;
	};
} forEach playableUnits;

switch (_condition) do {
	case ("promote"): {
		SETVAR(_target,PayGrade,_paygrade)
	};
	case ("demote"): {
		SETVAR(_target,PayGrade,_paygrade)
	};
};

["dummy"] call FUNC(adminRefresh);