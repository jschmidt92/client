#include "..\script_component.hpp"

private _enemies = [];
private _spawnPos = [getPos player, 2000, 5000, 1, 0, 0.7, 0, [], [getPos player, getPos player]] call BFUNC(findSafePos);
private _group = createGroup east;

for "_i" from 0 to 5 do {
    _enemy = _group createUnit ["O_Soldier_F", _spawnPos, [], 0, "FORM"];
    _enemies pushBack _enemy;
};

waitUntil { sleep 1; { alive _x } count _enemies >= 6 };

[_group, _spawnPos, 100] call BFUNC(taskPatrol);

[west, "t1", ["Suspicious Activity reported at the marked location. Investigate with caution.", "Suspicious Activity", "TargetLocation"], _spawnPos, "ASSIGNED", 0, true, "default", true] call BFUNC(taskCreate);

["sa", _enemies] spawn FUNC(heartBeat);