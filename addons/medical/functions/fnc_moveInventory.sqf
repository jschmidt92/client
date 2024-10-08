#include "..\script_component.hpp"
/*
 * Author: Jonpas
 * Puts killed unit's inventory into the body bag.
 *
 * Arguments:
 * 0: Killed Unit <OBJECT>
 * 1: Body Bag <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [killed, bodybag] call sof_client_medical_fnc_moveInventory
 *
 * Public: No
 */

params ["_unit", "_bodybag"];

private _items = [];
private _weapons = [];

_items pushBack (headgear _unit);
_items pushBack (uniform _unit);
_items append (uniformItems _unit);
_items pushBack (vest _unit);
_items append (vestItems _unit);
_items append (backpackItems _unit);
_weapons pushBack (primaryWeapon _unit);
_items append (primaryWeaponItems _unit);
_items append (primaryWeaponMagazine _unit);
_weapons pushBack (secondaryWeapon _unit);
_items append (secondaryWeaponItems _unit);
_items append (secondaryWeaponMagazine _unit);
_weapons pushBack (handgunWeapon _unit);
_items append (handgunItems _unit);
_items append (handgunMagazine _unit);
_weapons append (_unit getVariable [QGVAR(droppedWeapons), []]);
_items append (_unit getVariable [QGVAR(droppedItems), []]);
_items append (assignedItems _unit);
_items pushBack (_unit call CFUNC(binocularMagazine));

if !((goggles _unit ) in (_unit getVariable [QGVAR(droppedItems), []])) then {
    _items pushBack (goggles _unit);
};

_items = _items select {_x != ""};
_weapons = _weapons select {_x != ""};

{
    _bodybag addItemCargoGlobal [_x, 1];
} forEach _items;

{
    private _weaponNonPreset = [_x] call CFUNC(getNonPresetClass);
    if (_weaponNonPreset == "") then {
        _weaponNonPreset = _x;
    };
    _bodybag addWeaponCargoGlobal [_weaponNonPreset, 1];
} forEach _weapons;

private _backpack = backpack _unit;
if (_backpack != "") then {
    private _backpackNonPreset = [_backpack, "CfgVehicles"] call CFUNC(getNonPresetClass);
    if (_backpackNonPreset == "") then {
        _backpackNonPreset = _backpack;
    };
    _bodybag addBackpackCargoGlobal [_backpackNonPreset, 1];
};

private _nearHolders = _bodybag nearObjects ["WeaponHolderSimulated", 3];
{
    private _holderWeapons = ((getWeaponCargo _x) select 0) select {_x in _weapons};
    if !(_holderWeapons isEqualTo []) exitWith {
        deleteVehicle _x;
    };
} forEach _nearHolders;