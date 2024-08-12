#include "..\script_component.hpp"

private _worldCenter = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
private _stretcherTypes = ["Land_Stretcher_01_F", "Land_Stretcher_01_olive_F", "Land_Stretcher_01_sand_F"];
private _stretchers = nearestObjects [_worldCenter, _stretcherTypes, 500000];

{
	private _stretcher = _x;
	private _triggerPos = getPos _stretcher;
	private _trigger = createTrigger ["EmptyDetector", _triggerPos];

	_trigger setVariable ["isOccupied", false, true];
	_trigger setTriggerArea [5, 5, 0, true, 5];
	_trigger setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trigger setTriggerStatements [
	"{ (_x isKindOf 'CAManBase') && _x distance thisTrigger < 0.5 } count thisList > 0",
	"thisTrigger setVariable ['isOccupied', true, true];",
	"thisTrigger setVariable ['isOccupied', false, true];"
	];
	GVAR(occupancyTriggers) pushBack _trigger;
} forEach _stretchers;

if (count GVAR(occupancyTriggers) == 0) then {
	diag_log text format ["[SOF Medical] Warning: No Stretchers found in the world for medical system initialization."];
};