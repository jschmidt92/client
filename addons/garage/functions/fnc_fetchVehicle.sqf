#include "..\script_component.hpp"

private _dialog = findDisplay 202304;
private _itemList = _dialog displayCtrl 1501;
lbClear _itemList;

private _tmp = [];
private _locations = (missionConfigFile >> "SOF_CfgGarages" >> "locations") call BFUNC(getCfgData);

{
	if ((getPosATLVisual player) distance (_x select 1) < 20) then {
		{
			private _cat = _x getVariable ["Garage", "Error"];
			if (_cat != "Error") then {
				_tmp pushBackUnique [_cat, typeOf _x, netId _x];
			};
		} forEach (nearestObjects [(_x select 1), ["Land", "Air", "Ship"], 5]) - [player];
	};
} forEach _locations;

{
	private _itemListIndex = _itemList lbAdd (getText (configFile >> "CfgVehicles" >> (_x select 1) >> "displayName"));
	_itemList lbSetData [_itemListIndex, format ["%1", _x]];
	_itemList lbSetPicture [_itemListIndex, (getText (configFile >> "CfgVehicles" >> (_x select 1) >> "picture"))];
} forEach _tmp;