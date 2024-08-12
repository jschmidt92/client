#include "..\script_component.hpp"

private _data = _this;

if (_data isEqualTo [""]) then {
	GVAR(garageUnlocks) = [[],[],[],[],[],[]];
} else {
	GVAR(garageUnlocks) = _data select 0;
};

{
	[_x] call FUNC(addVirtualVehs);
} forEach GVAR(garageUnlocks);