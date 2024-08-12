#include "..\script_component.hpp"

_locations = (missionConfigFile >> "SOF_CfgGarages" >> "locations") call BFUNC(getCfgData);
{
	SOF_VehSpawnPos = (_x select 1) getPos [5, (_x select 2)];
} count _locations;

private _vehicleSpawn = createVehicle ["Land_HelipadEmpty_F", SOF_VehSpawnPos, [], 0, "NONE"];
SETMVAR(BIS_fnc_garage_center,_vehicleSpawn);

[missionNamespace, "garageOpened", {
	params ["_display", "_toggleSpace"];

	private _vehicles = [SOF_CarUnlocks,SOF_ArmorUnlocks,SOF_HeliUnlocks,SOF_PlaneUnlocks,SOF_NavalUnlocks,SOF_StaticUnlocks];
	SETMVAR(BIS_fnc_garage_data,_vehicles);

	{
		lbClear (_display displayCtrl (960 + _forEachIndex));
	} forEach BIS_fnc_garage_data;

	["ListAdd", [_display]] call BFUNC(garage);
}] call BFUNC(addScriptedEventHandler);

private _defaultVehicle = getText (configFile >> "CfgVehicles" >> "B_Quadbike_01_F" >> "model");
SETMVAR(BIS_fnc_garage_centerType,_defaultVehicle);

["Open", true] call BFUNC(garage);

[missionNamespace, "garageClosed", {
	private _nearestObjects = BIS_fnc_garage_center nearEntities [["Car","Tank","Air","Ship"], 15];

	if (!isNil "_nearestObjects") then {
		_obj = _nearestObjects select 0;
		_veh = typeOf _obj;
		_textures = getObjectTextures _obj;
		_animationNames = animationNames _obj;
		{ deleteVehicle _x } forEach _nearestObjects;
		_createVehicle = createVehicle [_veh, SOF_VehSpawnPos, [], 0, "CAN_COLLIDE"];

		_createVehicle setVariable ["Garage", "garageWheeled", true]; // To be done setup correct category for selected vehicle type.

		if (count _textures > 0) then {
			_count = 0;
			{
				_createVehicle setObjectTextureGlobal [_count, _x];
				_count = _count + 1;
			} forEach _textures;
		};

		if (count _animationNames > 0) then {
			_animationPhase = [];

			for "_i" from 0 to count _animationNames -1 do {
				_animationPhase pushBack [_animationNames select _i, _obj animationPhase (_animationNames select _i)];
				{ _createVehicle animate _x; } forEach _animationPhase;
			};
		};
	};
}] call BFUNC(addScriptedEventHandler);