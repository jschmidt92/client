#include "..\script_component.hpp"

if (SOF_Armory_Type == 0) then {
	["Open", [false, SOF_Armory_Box, player]] call BFUNC(arsenal);
} else {
	[SOF_Armory_Box, player, false] call AFUNC(arsenal,openBox);
};