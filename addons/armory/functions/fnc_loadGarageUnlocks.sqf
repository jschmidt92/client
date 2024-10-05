#include "..\script_component.hpp"

private _data = _this;
private _garage_unlocks = [[],[],[],[],[],[]];

if (_data isEqualTo [""]) then {
	// GVAR(garageUnlocks) = _garage_unlocks;
    SETPVAR(player,Garage_Unlocks,_garage_unlocks);
} else {
    _garage_unlocks = _data select 0;
	// GVAR(garageUnlocks) = _data select 0;
    SETPVAR(player,Garage_Unlocks,_garage_unlocks);
};

// {
// 	[_x] call FUNC(addVirtualVehs);
// } forEach GVAR(garageUnlocks);
{
	[_x] call FUNC(addVirtualVehs);
} forEach _garage_unlocks;

// player setVariable ["Garage_Unlocks", GVAR(garageUnlocks), true];