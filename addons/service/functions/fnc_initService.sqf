#include "..\script_component.hpp"

private _worldCenter = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
private _fuelPumpTypes = ["Land_fs_feed_F", "Land_FuelStation_Feed_F", "Land_FuelStation_01_pump_malevil_F", "Land_FuelStation_01_pump_F", "Land_FuelStation_03_pump_F", "Land_A_FuelStation_Feed", "Land_Benzina_schnell", "Land_Fuelstation_army", "Land_Ind_FuelStation_Feed_EP1", "Land_Fuelstation"];
private _fuelPumps = nearestTerrainObjects [_worldCenter, _fuelPumpTypes, 500000];

{
    private _fuelPump = _x;
    private _triggerPos = getPos _fuelPump;
    private _trigger = createTrigger ["EmptyDetector", _triggerPos];

    _trigger setTriggerArea [5, 5, 0, false];
    _trigger setTriggerActivation ["ANYPLAYER", "PRESENT", true];
    _trigger setTriggerStatements [
        "{ _x isKindOf 'LandVehicle' && !isEngineOn _x } count thisList > 0",
        "[thisList select 0] spawn sof_client_service_fnc_refuel;",
        ""
    ];
} forEach _fuelPumps;