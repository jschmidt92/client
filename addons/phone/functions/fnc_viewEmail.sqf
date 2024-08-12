#include "..\script_component.hpp"

private _homeScreenBgBtns = [202202, 202203, 202204, 202205, 202206, 202207, 202208, 202209];
private _homeScreenBtns = [202310, 202311, 202312, 202313, 202314, 202315, 202316, 202317, 202318];

{
	ctrlShow [_x, false];
	ctrlEnable [_x, false];
} forEach _homeScreenBgBtns;

{
	ctrlShow [_x, false];
	ctrlEnable [_x, false];
} forEach _homeScreenBtns;

ctrlShow [202201, true];
ctrlShow [202302, true];
ctrlShow [202307, true];
ctrlShow [202308, true];
ctrlShow [202319, true];
ctrlEnable [202319, true];

private _myDialog = findDisplay 202300;
private _ctrl01 = _myDialog displayCtrl 202302;
private _ctrl02 = _myDialog displayCtrl 202319;

_ctrl01 ctrlRemoveAllEventHandlers "LBDblClick";
_ctrl02 ctrlRemoveAllEventHandlers "ButtonClick";

_ctrl01 ctrlAddEventHandler ["LBDblClick", {
	_this spawn FUNC(showEmail);
	ctrlShow [202302, false];
}];

SOF_DeleteEmailTrigger = true;
SOF_DeleteEmail = _myDialog displayAddEventHandler ["KeyDown", {
	if ((_this select 1) == 14 && SOF_DeleteEmailTrigger) then {
		SOF_DeleteEmailTrigger = false;
		private _ctrl01 = (findDisplay 202300) displayCtrl 202302;
		private _selectedIndex = lbCurSel _ctrl01;
		if (_selectedIndex >= 0) then {
			private _selectedText = _ctrl01 lbText _selectedIndex;
			[format ["Deleted email from: %1", _selectedText], "blue-grey", 3] call EFUNC(misc,notify);
			[] spawn FUNC(delEmail);
		};
	};
}];

_ctrl02 ctrlAddEventHandler ["ButtonClick", {
	private _homeScreenBgBtns = [202202, 202203, 202204, 202205, 202206, 202207, 202208, 202209];
	private _homeScreenBtns = [202310, 202311, 202312, 202313, 202314, 202315, 202316, 202317, 202318];
	private _viewEmailsBtns = [202201, 2023001, 2023002, 2023003, 202302, 202305, 202306, 202307, 202308];

	SOF_DeleteEmailTrigger = false;

	private _myDialog = findDisplay 202300;
	_myDialog displayRemoveEventHandler ["KeyDown", SOF_DeleteEmail];

	{ ctrlShow [_x, true]; ctrlEnable [_x, true]; } forEach _homeScreenBgBtns;
	{ ctrlShow [_x, true]; ctrlEnable [_x, true]; } forEach _homeScreenBtns;
	{ ctrlShow [_x, false] } forEach _viewEmailsBtns;
	ctrlShow [202319, false];
	ctrlEnable [202319, false];
}];

ctrlSetText [202307, "Emails"];
ctrlSetText [202308, "View your emails"];

lbClear _ctrl01;

private _emails = GVAR(email);

{
    private _from = _x select 0;
    {
        if (_from == (_x select 1)) then {
          _from = _x select 0;
        };
    } forEach GVAR(addressbook);
    private _subject = _x select 1;
	private _body = _x select 2;
    private _emailListIndex = _ctrl01 lbAdd _from;
    _ctrl01 lbSetData [_emailListIndex, format ["%1", [_subject, _body]]];
    _ctrl01 lbSetPicture [_emailListIndex, "\z\sof_client\addons\phone\ui\data\avatar.paa"];
} forEach _emails;