#include "..\script_component.hpp"

private _spawnPos = [getPos player, 2000, 5000, 1, 0, 0.7, 0, [], [getPos player, getPos player]] call BFUNC(findSafePos);
"O_Soldier_F" createUnit [_spawnPos, (createGroup east), "shooter = this;", 0];

waitUntil { sleep 1; !isNull shooter };

[west, "t1", ["Active Shooter reported at the marked location. Find and Neutralize with caution.", "Active Shooter", ""], _spawnPos, "ASSIGNED", 0, true, "kill", true] call BFUNC(taskCreate);

["sf", shooter] spawn FUNC(heartBeat);

waitUntil { sleep 1; player distance shooter <= 250 };

shooter doTarget player;
shooter doFire player;