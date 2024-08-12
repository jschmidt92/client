#include "..\script_component.hpp"

params [["_class", "", [""]], ["_type", 0, [0]]];

private _index = (GVAR(garageUnlocks) select _type) pushBackUnique _class;

if (_index > - 1) then {
	[[_class]] call FUNC(addVirtualVehs);
};