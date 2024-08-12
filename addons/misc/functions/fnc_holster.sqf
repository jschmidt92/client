#include "..\script_component.hpp"

private _SOF_Holster = player getVariable ["SOF_Holster", []];
private _SOF_HolsterWeapon = player getVariable ["SOF_HolsterWeapon", 0];

if (_SOF_HolsterWeapon == 1) then {
	player addMagazine [(_SOF_Holster select 1), (_SOF_Holster select 3)];
	player addWeapon (_SOF_Holster select 0);

	{
		player addHandgunItem _x;
		true
	} count (_SOF_Holster select 2);

	player action ["SwitchWeapon", player, player, 299];
	_SOF_HolsterWeapon = 0;
	_SOF_Holster = [];
} else {
	if (handgunWeapon player isEqualTo "") exitWith {};

	_SOF_Holster = [handgunWeapon player, (handgunMagazine player) select 0, handgunItems player, player ammo (handgunWeapon player)];

	player removeWeapon (handgunWeapon player);
	_SOF_HolsterWeapon = 1;
};

player setVariable ["SOF_Holster", _SOF_Holster, true];
player setVariable ["SOF_HolsterWeapon", _SOF_HolsterWeapon, true];