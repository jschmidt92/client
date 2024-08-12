#include "..\script_component.hpp"

disableSerialization;
createDialog "RscAdmin";

private _dialog = findDisplay 202303;
private _list = _dialog displayCtrl 2023001;
private _list2 = _dialog displayCtrl 2023003;

{
	if (str (side _x) == str (playerSide)) then {
		private _name = name (_x);
		private _payGrade = GETVAR(_x,paygrade,nil);
		private _index = _list lbAdd format["%1 - %2", _name, _payGrade];

		_list lbSetData [_index, _name];
	};
} count (allPlayers);

lbSetCurSel [2023001, 0];

private _payGrades = (missionConfigFile >> "SOF_CfgPaygrades" >> "payGrades") call BFUNC(getCfgData);

{
	private _index = _list2 lbAdd format ["%1 - $%2", (_x select 0), ((_x select 1) call EFUNC(misc,formatNumber))];

	_list2 lbSetData [_index, str _x];
} forEach _payGrades;

lbSetCurSel [2023003, 0];
ctrlSetText [2023002, format ["$%1", (companyFunds call EFUNC(misc,formatNumber))]];