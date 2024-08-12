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
	_this spawn sof_client_phone_fnc_showMessage;
	ctrlShow [202302, false];
}];

SOF_DeleteMsgTrigger = true;
SOF_DeleteMsg = _myDialog displayAddEventHandler ["KeyDown", {
	if ((_this select 1) == 14 && SOF_DeleteMsgTrigger) then {
		SOF_DeleteMsgTrigger = false;
		private _ctrl01 = (findDisplay 202300) displayCtrl 202302;
		private _selectedIndex = lbCurSel _ctrl01;
		if (_selectedIndex >= 0) then {
			private _selectedText = _ctrl01 lbText _selectedIndex;
			[format ["Deleted text message from: %1", _selectedText], "blue-grey", 3] call EFUNC(misc,notify);
			[] spawn sof_client_phone_fnc_delMsg;
		};
	};
}];

_ctrl02 ctrlAddEventHandler ["ButtonClick", {
	private _homeScreenBgBtns = [202202, 202203, 202204, 202205, 202206, 202207, 202208, 202209];
	private _homeScreenBtns = [202310, 202311, 202312, 202313, 202314, 202315, 202316, 202317, 202318];
	private _viewMessagesBtns = [202201, 2023001, 2023002, 2023003, 202302, 202305, 202306, 202307, 202308];

	SOF_DeleteMsgTrigger = false;

	private _myDialog = findDisplay 202300;
	_myDialog displayRemoveEventHandler ["KeyDown", SOF_DeleteMsg];

	{ ctrlShow [_x, true]; ctrlEnable [_x, true]; } forEach _homeScreenBgBtns;
	{ ctrlShow [_x, true]; ctrlEnable [_x, true]; } forEach _homeScreenBtns;
	{ ctrlShow [_x, false] } forEach _viewMessagesBtns;
	ctrlShow [202319, false];
	ctrlEnable [202319, false];
}];

ctrlSetText [202307, "Messages"];
ctrlSetText [202308, "View your messages"];

lbClear _ctrl01;

private _messages = GVAR(messages);

{
    private _sender = _x select 0;
    {
        if (_sender == (_x select 1)) then {
          _sender = _x select 0;
        };
    } forEach GVAR(addressbook);
    private _message = _x select 1;
    private _msgListIndex = _ctrl01 lbAdd _sender;
    _ctrl01 lbSetData [_msgListIndex, format ["%1", _message]];
    _ctrl01 lbSetPicture [_msgListIndex, "\z\sof_client\addons\phone\ui\data\avatar.paa"];
} forEach _messages;