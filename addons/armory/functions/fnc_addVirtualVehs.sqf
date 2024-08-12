#include "..\script_component.hpp"

params [["_vehicles", [], [[]]]];

private _cars = GVAR(garageUnlocks) select 0;
private _armor = GVAR(garageUnlocks) select 1;
private _helis = GVAR(garageUnlocks) select 2;
private _planes = GVAR(garageUnlocks) select 3;
private _naval = GVAR(garageUnlocks) select 4;
private _static = GVAR(garageUnlocks) select 5;

{
	switch true do {
		case (_x isKindOf "Car"): {
			if ((_x isKindOf "Tank") || (_x isKindOf "Wheeled_APC_F")) exitWith {};
			_cars pushBackUnique _x;
		};
		case (_x isKindOf "Tank"): {
			_armor pushBackUnique _x;
		};
		case (_x isKindOf "Helicopter"): {
			_helis pushBackUnique _x;
		};
		case (_x isKindOf "Plane"): {
			_planes pushBackUnique _x;
		};
		case (_x isKindOf "Ship"): {
			_naval pushBackUnique _x;
		};
		case (_x isKindOf "Static"): {
			_static pushBackUnique _x;
		};
	};
} forEach _vehicles;

SOF_CarUnlocks = [];
SOF_ArmorUnlocks = [];
SOF_HeliUnlocks = [];
SOF_PlaneUnlocks = [];
SOF_NavalUnlocks = [];
SOF_StaticUnlocks = [];

{
	SOF_CarUnlocks append [getText (configFile >> "CfgVehicles" >> _x >> "model"), [configFile >> "CfgVehicles" >> _x]];
} forEach _cars;

{
	SOF_ArmorUnlocks append [getText (configFile >> "CfgVehicles" >> _x >> "model"), [configFile >> "CfgVehicles" >> _x]];
} forEach _armor;

{
	SOF_HeliUnlocks append [getText (configFile >> "CfgVehicles" >> _x >> "model"), [configFile >> "CfgVehicles" >> _x]];
} forEach _helis;

{
	SOF_PlaneUnlocks append [getText (configFile >> "CfgVehicles" >> _x >> "model"), [configFile >> "CfgVehicles" >> _x]];
} forEach _planes;

{
	SOF_NavalUnlocks append [getText (configFile >> "CfgVehicles" >> _x >> "model"), [configFile >> "CfgVehicles" >> _x]];
} forEach _naval;

{
	SOF_StaticUnlocks append [getText (configFile >> "CfgVehicles" >> _x >> "model"), [configFile >> "CfgVehicles" >> _x]];
} forEach _static;