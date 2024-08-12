#include "..\script_component.hpp"

private _safePosMinDist = 2000;
private _safePosMaxDist = 5000;
private _safePosMaxGrade = 0.7;

private _playerPos = getPos player;
private _destination = _playerPos vectorAdd [random 1000, random 1000, 0];
private _spawnPos = [_playerPos, _safePosMinDist, _safePosMaxDist, 1, 0, _safePosMaxGrade, 0, [], [_playerPos, _playerPos]] call BFUNC(findSafePos);

private _vehicle = "C_Offroad_01_F" createVehicle _spawnPos;

waitUntil { sleep 1; !isNull _vehicle };

private _vehiclePos = getPos _vehicle;
private _entityPos = _vehiclePos vectorAdd [random 5, random 5, 0];
private _group = createGroup civilian;

"C_man_1" createUnit [_entityPos, _group, "rDriver = this;", 0];

waitUntil { sleep 1; !isNull rDriver };

rDriver moveInDriver _vehicle;
rDriver doMove _destination;

[west, "t1", ["Reckless Driver reported at the marked location. Stop and apprehend with caution.", "Reckless Driver", ""], _spawnPos, "ASSIGNED", 0, true, "car", true] call BFUNC(taskCreate);

["rd", rDriver, _vehicle, [100]] spawn FUNC(heartBeat);