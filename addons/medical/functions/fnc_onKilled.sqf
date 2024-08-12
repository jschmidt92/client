#include "..\script_component.hpp"

params ["_unit", "_killer", "_instigator", "_useEffects"];

private _unitPos = getPosATL _unit;
private _bodyBag = createVehicle ["ACE_bodyBagObject", _unitPos, [], 0, "NONE"];

[_unit] call FUNC(saveDroppedWeapons);
[_unit, _bodyBag] call FUNC(moveInventory);