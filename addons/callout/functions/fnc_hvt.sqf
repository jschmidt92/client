#include "..\script_component.hpp"

private _spawnPos = [getPos player, 2000, 5000, 1, 0, 0.7, 0, [], [getPos player, getPos player]] call BFUNC(findSafePos);
"O_Soldier_F" createUnit [_spawnPos, (createGroup east), "hvt = this; [this, ""t1""] call sof_client_contract_fnc_makeHVT;", 0];

waitUntil { sleep 1; !isNull hvt };

["hvt", hvt] spawn FUNC(heartBeat);

[west, "t1", ["HVT reported at the marked location. Find and Neutralize with caution.", "HVT", ""], _spawnPos, "ASSIGNED", 0, true, "kill", true] call BFUNC(taskCreate);

waitUntil { sleep 1; ["t1"] call BFUNC(taskState) == "ASSIGNED" };

["t1", 2, 1, "", 500000, -75, 300, [false, true]] spawn EFUNC(contract,hvt);