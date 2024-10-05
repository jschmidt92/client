#include "..\script_component.hpp"

params [["_class", "", [""]], ["_type", 0, [0]]];

private _default = [[],[],[],[],[],[]];
private _garage_unlocks = GETVAR(player,Garage_Unlocks,_default);
// private _index = (GVAR(garageUnlocks) select _type) pushBackUnique _class;
private _index = (_garage_unlocks select _type) pushBackUnique _class;

if (_index > - 1) then {
	[[_class]] call FUNC(addVirtualVehs);
};