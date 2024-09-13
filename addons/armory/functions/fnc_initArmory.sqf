#include "..\script_component.hpp"

SOF_Armory_Box = "ReammoBox_F" createVehicleLocal [0, 0, -999];
[SOF_Armory_Box, false, false] call AFUNC(arsenal,initBox);

SOF_PDB_Mode = "PDB_MODE" call BFUNC(getParamValue);
SOF_Armory_Type = "ARS_TYPE" call BFUNC(getParamValue);

SETVAR(player,value_armoryDone,false);

switch (SOF_PDB_Mode) do {
	case 0: {
		GVAR(arsenalUnlocks) = GETVAR(profileNamespace,ArsenalUnlocks,[]);
		GVAR(garageUnlocks) = GETVAR(profileNamespace,GarageUnlocks,[]);

		if (SOF_Armory_Type == 0) then {
			{
				[SOF_Armory_Box, _x, false, true, 1, _forEachIndex] call BFUNC(addVirtualItemCargo);
			} forEach GVAR(arsenalUnlocks);
		} else {
			{
				[SOF_Armory_Box, _x] call AFUNC(arsenal,addVirtualItems);
			} forEach GVAR(arsenalUnlocks);
		};

		{
			[_x] call FUNC(addVirtualVehs);
		} forEach GVAR(garageUnlocks);

		SETVAR(player,value_armoryDone,true);
	};
	case 1: {
		_handler = 0 spawn {
			waitUntil { value_serverDone };

			// ["hget", "", "armory_unlocks", -1, [], "sof_client_armory_fnc_loadArmoryUnlocks", false] spawn dragonfly_db_fnc_addTask;
			["hgetid", getPlayerUID player, "armory_unlocks", -1, [], "sof_client_armory_fnc_loadArmoryUnlocks", false, netId player] remoteExec ["dragonfly_db_fnc_addTask", 2, false];

			uiSleep 1;

			// ["hget", "", "garage_unlocks", -1, [], "sof_client_armory_fnc_loadGarageUnlocks", false] spawn dragonfly_db_fnc_addTask;
			["hgetid", getPlayerUID player, "garage_unlocks", -1, [], "sof_client_armory_fnc_loadGarageUnlocks", false, netId player] remoteExec ["dragonfly_db_fnc_addTask", 2, false];

			SETVAR(player,value_armoryDone,true);
		};
	};
	default {
		GVAR(arsenalUnlocks) = GETVAR(profileNamespace,ArsenalUnlocks,[]);
		GVAR(garageUnlocks) = GETVAR(profileNamespace,GarageUnlocks,[]);

		if (SOF_Armory_Type == 0) then {
			{
				[SOF_Armory_Box, _x, false, true, 1, _forEachIndex] call BFUNC(addVirtualItemCargo);
			} forEach GVAR(arsenalUnlocks);
		} else {
			{
				[SOF_Armory_Box, _x] call AFUNC(arsenal,addVirtualItems);
			} forEach GVAR(arsenalUnlocks);
		};

		{
			[_x] call FUNC(addVirtualVehs);
		} forEach GVAR(garageUnlocks);

		SETVAR(player,value_armoryDone,true);
	};
};