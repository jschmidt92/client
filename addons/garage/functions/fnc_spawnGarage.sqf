#include "..\script_component.hpp"

private _dialog = findDisplay 202304;
private _itemList = _dialog displayCtrl 1500;
private _itemList2 = _dialog displayCtrl 1501;
private _selectedItem = lbCurSel _itemList;
private _data = call compile format ["%1", _itemList lbData _selectedItem];

if ((isNil {_data})) exitWith { ctrlEnable [1600, true]; };

private _category = _data select 0;
private _class = _data select 1;
private _locations = (missionConfigFile >> "SOF_CfgGarages" >> "locations") call BFUNC(getCfgData);

{
	if ((_x select 0) == _category) then {
		private _veh = createVehicle [_class, (_x select 1)];
		SETPVAR(_veh,Garage,_category);
		_veh setDir (_x select 2);
		//[_veh, (_x select 2)] remoteExec ["setDir"];
	};
} forEach _locations;

lbClear _itemList;
lbClear _itemList2;
_itemList lbSetCurSel -1;
_itemList2 lbSetCurSel -1;

private _garage = GETVAR(player,Garage,[]);
private _index = _garage findIf { _x isEqualTo _data };

_garage deleteAt _index;
SETPVAR(player,Garage,_garage);

[] call FUNC(fetchGarage);
[] call FUNC(fetchVehicle);

ctrlEnable [1600, true];