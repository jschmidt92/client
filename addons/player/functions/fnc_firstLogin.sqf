#include "..\script_component.hpp"

/*
 * Function: sof_client_player_fnc_firstLogin
 * Author: J.Schmidt
 * Edit: 07.23.2024
 * Copyright © 2024 J.Schmidt, All rights reserved
 *
 * Do not edit without permission!
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivative 4.0 International License.
 * To view a copy of this license, vist https://creativecommons.org/licenses/by-nc-nd/4.0/ or send a letter to Creative Commons,
 * PO Box 1866, Mountain View, CA 94042
 *
 * [Description]
 * Setup new player.
 *
 * Arguments:
 * N/A
 *
 * Return Value:
 * N/A
 *
 * Examples:
 * [player] spawn sof_client_player_fnc_firstLogin;
 *
 * Public: Yes
 */

private _player = _this select 0;
private _uid = getPlayerUID _player;

private _defaultPhoneNumber = "unknown";
private _defaultEmail = "unknown@spearnet.mil";
private _defaultPaygrade = "E1";

_player setUnitLoadout [[],[],["hgun_P07_F","","","",["16Rnd_9x21_Mag",17],[],""],["U_BG_Guerrilla_6_1",[["SOF_Phone",1]]],["V_Rangemaster_belt",[["16Rnd_9x21_Mag",5,17]]],[],"","",[],["","","","","",""]];
_player action ["SwitchWeapon", _player, _player, -1];
_player addRating 500;

SETVAR(_player,Cash_Bank,2000);
SETVAR(_player,SOF_HolsterWeapon,true);
SETVAR(_player,PayGrade,_defaultPaygrade);

private _number = "0160" + (_uid select [count (toArray _uid) - 6, 6]);
private _email = _number + "@spearnet.mil";

SETVAR(_player,SOF_Phone_Number,_number);
SETVAR(_player,SOF_Email,_email);

private _name = name _player;
private _phoneNumber = GETVAR(_player,SOF_Phone_Number,_defaultPhoneNumber);
private _phoneEmail = GETVAR(_player,SOF_Email,_defaultEmail);

EGVAR(phone,SOF_AddressBook) pushBackUnique [_name, _phoneNumber, _phoneEmail];
profileNamespace setVariable ["SOF_AddressBook", EGVAR(phone,SOF_AddressBook)];

private _messages = [
	"Welcome to your first day on the job. You have been issued a Pistol, 6 x 9mm Ammo, a Pistol Belt, and a small amount of RP and credit from OPSG. These are the only free things you will get for this identity, so save them, and use them wisely. You are responsible for all purchases going forward.",
	"Cash in your RP at any laptop by Access the Bank, Sign In, and then Submit Time. Do this before leaving the game session!"
];

private _welcomeEmail = format ["Welcome to your first day on the job. You have been issued a phone with a new number of %1 and an email address of %2", _number, _email];

["Field Cmdr", _welcomeEmail] spawn EFUNC(phone,newEmail);
// ["listadd", _phoneEmail, "", -1, ["Field Cmdr <fieldCmdr@spearnet.mil>", "Job Orientation", _welcomeEmail], "sof_server_phone_fnc_addEmail", "null", false] spawn dragonfly_db_fnc_addTask;
// ["listadd", _phoneEmail, "", -1, ["Field Cmdr <fieldCmdr@spearnet.mil>", "Job Orientation", _welcomeEmail], "sof_server_phone_fnc_addEmail", netId _player, false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
[_phoneEmail, ["Field Cmdr <fieldCmdr@spearnet.mil>", "Job Orientation", _welcomeEmail]] remoteExec ["sof_server_phone_fnc_addEmail", 2, false];

uiSleep 1;

{
	["Field Cmdr", _x] spawn EFUNC(phone,newMsg);
	// ["listadd", _phoneNumber, "", -1, ["Field Cmdr", _x], "", "null", false] spawn dragonfly_db_fnc_addTask;
	// ["listadd", _phoneNumber, "", -1, ["Field Cmdr", _x], "", netId _player, false] remoteExec ["dragonfly_db_fnc_addTask", 2, false];
	[_phoneNumber, ["Field Cmdr", _x]] remoteExec ["sof_server_phone_fnc_addMsg", 2, false];
} forEach _messages;

private _arsenalUnlocks = [["SOF_Phone", 0], ["SOF_Tablet", 0], ["ItemCompass", 0], ["ItemGPS", 0], ["ItemMap", 0], ["ItemRadio", 0], ["ItemWatch", 0], ["U_BG_Guerrilla_6_1", 0], ["V_Rangemaster_belt", 0], ["hgun_P07_F", 1]];
private _garageUnlocks = [["B_Quadbike_01_F", 0]];

{
	private _classname = _x select 0;
	private _typeOf = _x select 1;
	[_classname, _typeOf] call EFUNC(armory,addItemArmory);
	uiSleep 0.2;
} forEach _arsenalUnlocks;

uiSleep 1;

{
	private _classname = _x select 0;
	private _typeOf = _x select 1;
	[_classname, _typeOf] call EFUNC(armory,addVehArmory);
	uiSleep 0.2;
} forEach _garageUnlocks;

uiSleep 1;
["armory"] call EFUNC(armory,saveArmoryUnlocks);

uiSleep 1;
["garage"] call EFUNC(armory,saveArmoryUnlocks);

uiSleep 1;
[] call EFUNC(init,playerDBSave);
SETVAR(_player,value_loadDone,true);

uiSleep 1;
// ["listrng", _phoneEmail, "", -1, [], "sof_client_phone_fnc_addEmail", netId _player, true] spawn dragonfly_db_fnc_addTask;
["listrng", _phoneEmail, "", -1, [], "sof_client_phone_fnc_addEmail", netId _player, true] remoteExec ["dragonfly_db_fnc_addTask", 2, false];

uiSleep 1;
// ["listrng", _phoneNumber, "", -1, [], "sof_client_phone_fnc_addMsg", netId _player, true] spawn dragonfly_db_fnc_addTask;
["listrng", _phoneNumber, "", -1, [], "sof_client_phone_fnc_addMsg", netId _player, true] remoteExec ["dragonfly_db_fnc_addTask", 2, false];