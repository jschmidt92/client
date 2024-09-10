#include "..\script_component.hpp"

private _data = _this;

if (_data isEqualTo [""]) then {
	GVAR(arsenalUnlocks) = [[],[],[],[]];
} else {
	GVAR(arsenalUnlocks) = _data select 0;
};

if (SOF_Armory_Type == 0) then {
	{
		[SOF_Armory_Box, _x, false, true, 1, _forEachIndex] call BFUNC(addVirtualItemCargo);
	} forEach GVAR(arsenalUnlocks);
} else {
	{
		[SOF_Armory_Box, _x] call AFUNC(arsenal,addVirtualItems);
	} forEach GVAR(arsenalUnlocks);
};

player setVariable ["Armory_Unlocks", GVAR(arsenalUnlocks)];