#include "..\script_component.hpp"

/*
	Ussage:
	_trg = createTrigger ["EmptyDetector", getPos player];
	_trg setTriggerArea [5, 5, 0, false];
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trg setTriggerStatements [
		"call { {_x iskindof 'LAND' && speed _x < 1} count thisList > 0; };",
		"call { _handle = [(thisList select 0), 'LAND'] spawn sof_client_service_fnc_vehicle; };",
		""
	];
*/

params ["_veh", "_vehKind"];

private _veh = _this select 0;
private _vehType = getText (configFile >> "CfgVehicles" >> typeOf _veh >> "DisplayName");

private _rearmCost = 0;
private _refuelCost = 0;
private _repairCost = 0;
private _totalCost = 0;

if ((_veh isKindOf _vehKind) && (driver _veh == player)) exitWith {

	_veh vehicleChat format ["Servicing %1... Please Stand By...", _vehType];

	uiSleep 3;

	_rearmCost = [_veh, _vehType] call FUNC(rearm);
	_refuelCost = [_veh, _vehType] call FUNC(refuel);
	_repairCost = [_veh, _vehType] call FUNC(repair);
	_totalCost = (_rearmCost + _repairCost + _refuelCost);

	private _formattedRearmCost = (_rearmCost) call EFUNC(misc,formatNumber);
	private _formattedRefuelCost = (_refuelCost) call EFUNC(misc,formatNumber);
	private _formattedRepairCost = (_RepairCost) call EFUNC(misc,formatNumber);
	private _formattedTotalCost = (_totalCost) call EFUNC(misc,formatNumber);

	["deduct", _totalCost] remoteExecCall ["sof_server_money_fnc_handleFunds", 2];

	[format ["SERVICE COST:
		<br/>Rearmament: $%1
		<br/>Repairs: $%2
		<br/>Refueling: $%3
		<br/>Total: $%4
		<br/>Billed to SOF PMC Group.", 
		_formattedRearmCost, _formattedRepairCost, _formattedRefuelCost, _formattedTotalCost], "blue-grey", 8] call EFUNC(misc,notify);

	_veh vehicleChat format ["Service Completed for %1", _vehType];
};