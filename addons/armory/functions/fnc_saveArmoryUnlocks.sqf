#include "..\script_component.hpp"

params ["_unlockType"];

switch (_unlockType) do {
    case "armory": {
        switch (SOF_PDB_Mode) do {
            case 0: {
                profileNamespace setVariable ["ArsenalUnlocks", GVAR(arsenalUnlocks)];
            };
            case 1: {
                // ["hset", "", "armory_unlocks", -1, GVAR(arsenalUnlocks), "", "null", false] spawn dragonfly_db_fnc_addTask;
                ["hsetid", getPlayerUID player, "armory_unlocks", -1, GVAR(arsenalUnlocks), "", "null", false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
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
                // ["hset", "", "garage_unlocks", -1, GVAR(garageUnlocks), "", "null", false] spawn dragonfly_db_fnc_addTask;
                ["hsetid", getPlayerUID player, "garage_unlocks", -1, GVAR(garageUnlocks), "", "null", false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
            };
            default {
                profileNamespace setVariable ["GarageUnlocks", GVAR(garageUnlocks)];
            };
        };
    };
};