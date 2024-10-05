#include "..\script_component.hpp"

private _data = _this;
private _arsenal_unlocks = [[],[],[],[]];

if (_data isEqualTo [""]) then {
	// GVAR(arsenalUnlocks) = _arsenal_unlocks;
    SETPVAR(player,Armory_Unlocks,_arsenal_unlocks);
} else {
    _arsenal_unlocks = _data select 0;
	// GVAR(arsenalUnlocks) = _data select 0;
    SETPVAR(player,Armory_Unlocks,_arsenal_unlocks);
};

if (SOF_Armory_Type == 0) then {
	// {
	// 	[SOF_Armory_Box, _x, false, true, 1, _forEachIndex] call BFUNC(addVirtualItemCargo);
	// } forEach GVAR(arsenalUnlocks);
	{
		[SOF_Armory_Box, _x, false, true, 1, _forEachIndex] call BFUNC(addVirtualItemCargo);
	} forEach _arsenal_unlocks;
} else {
	// {
	// 	[SOF_Armory_Box, _x] call AFUNC(arsenal,addVirtualItems);
	// } forEach GVAR(arsenalUnlocks);
	{
		[SOF_Armory_Box, _x] call AFUNC(arsenal,addVirtualItems);
	} forEach _arsenal_unlocks;
};

// player setVariable ["Armory_Unlocks", GVAR(arsenalUnlocks), true];