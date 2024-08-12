#include "..\script_component.hpp"

params ["_contact"];

private _defaultPhoneNumber = "unknown";
private _defaultEmail = "unknown@spearnet.mil";

private _name = name _contact;
private _phoneNumber = GETVAR(_contact,SOF_Phone_Number,_defaultPhoneNumber);
private _email = GETVAR(_contact,SOF_Email,_defaultEmail);

GVAR(addressbook) pushBackUnique [_name, _phoneNumber, _email];

SETVAR(profileNamespace,SOF_AddressBook,GVAR(addressbook));