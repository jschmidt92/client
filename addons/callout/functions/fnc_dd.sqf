#include "..\script_component.hpp"

private _safePosMinDist = 2000;
private _safePosMaxDist = 5000;
private _safePosMaxGrade = 0.7;

private _playerPos = getPos player;
private _spawnPos = [_playerPos, _safePosMinDist, _safePosMaxDist, 1, 0, _safePosMaxGrade, 0, [], [_playerPos, _playerPos]] call BFUNC(findSafePos);

private _civilianGroup = createGroup civilian;

"C_man_1" createUnit [_spawnPos, _civilianGroup, "dealer = this;", 0];

waitUntil { sleep 1; !isNull dealer };

private _dealerPos = position dealer vectorAdd [random 10, random 10, 0];

"C_man_1" createUnit [_dealerPos, _civilianGroup, "buyer = this;", 0];

waitUntil { sleep 1; !isNull buyer };

[west, "t1", ["Drug Deal reported at the marked location. Investigate and apprehend with caution.", "Drug Deal", ""], _spawnPos, "ASSIGNED", 0, true, "search", true] call BFUNC(taskCreate);

["dd", [dealer, buyer]] spawn FUNC(heartBeat);