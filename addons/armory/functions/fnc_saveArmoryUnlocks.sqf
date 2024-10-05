#include "..\script_component.hpp"

params ["_unlockType"];
private _default_arsenal_unlocks = [[],[],[],[]];
private _default_garage_unlocks = [[],[],[],[],[],[]];
private _arsenal_unlocks = [[],[],[],[]];
private _garage_unlocks = [[],[],[],[],[],[]];

switch (_unlockType) do {
    case "armory": {
        switch (SOF_PDB_Mode) do {
            case 0: {
                profileNamespace setVariable ["ArsenalUnlocks", GVAR(arsenalUnlocks)];
            };
            case 1: {
                _arsenal_unlocks = GETVAR(player,Armory_Unlocks,_default_arsenal_unlocks);
                // ["hset", "", "armory_unlocks", -1, GVAR(arsenalUnlocks), "", false] spawn dragonfly_db_fnc_addTask;
                // ["hsetid", getPlayerUID player, "armory_unlocks", -1, GVAR(arsenalUnlocks), "", false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
                ["hsetid", getPlayerUID player, "armory_unlocks", -1, _arsenal_unlocks, "", false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
            };
            default {
                profileNamespace setVariable ["ArsenalUnlocks", GVAR(arsenalUnlocks)];
            };
        };
    };
    case "garage": {
        switch (SOF_PDB_Mode) do {
            case 0: {
                profileNamespace setVariable ["GarageUnlocks", GVAR(garageUnlocks)];
            };
            case 1: {
                _garage_unlocks = GETVAR(player,Garage_Unlocks,_default_garage_unlocks);
                // ["hset", "", "garage_unlocks", -1, GVAR(garageUnlocks), "", false] spawn dragonfly_db_fnc_addTask;
                // ["hsetid", getPlayerUID player, "garage_unlocks", -1, GVAR(garageUnlocks), "", false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
                ["hsetid", getPlayerUID player, "garage_unlocks", -1, _garage_unlocks, "", false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
            };
            default {
                profileNamespace setVariable ["GarageUnlocks", GVAR(garageUnlocks)];
            };
        };
    };
};