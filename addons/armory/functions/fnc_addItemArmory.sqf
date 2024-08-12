#include "..\script_component.hpp"

params [["_class", "", [""]], ["_type", 0, [0]]];

private _index = (GVAR(arsenalUnlocks) select _type) pushBackUnique _class;

if (_index > - 1) then {
	if (SOF_Armory_Type == 0) then {
		[SOF_Armory_Box, [_class], false, true, 1, _type] call BFUNC(addVirtualItemCargo);
	} else {
		[SOF_Armory_Box, [_class]] call AFUNC(arsenal,addVirtualItems);
	};
};