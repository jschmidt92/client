#include "..\script_component.hpp"

private _metaCtrls = [2023001, 2023002, 2023003];

{
	ctrlShow [_x, true];
	ctrlEnable [_x, true];
} forEach _metaCtrls;

private _ctrl01 = (findDisplay 202300) displayCtrl 202319;
_ctrl01 ctrlRemoveAllEventHandlers "ButtonClick";
_ctrl01 ctrlAddEventHandler ["ButtonClick", {
	_this spawn FUNC(viewContacts);

	ctrlShow [2023001, false];
	ctrlShow [2023002, false];
	ctrlShow [2023003, false];
	ctrlShow [202304, false];
	ctrlShow [202416, false];
	ctrlEnable [202416, false];
}];

private _ctrl02 = (findDisplay 202300) displayCtrl 202416;
_ctrl02 ctrlRemoveAllEventHandlers "ButtonClick";
_ctrl02 ctrlAddEventHandler ["ButtonClick", {
	private _reciever = ctrlText 2023002;
	private _msg = ctrlText 202304;
	[_reciever, _msg] spawn FUNC(sendMsg);

	playSound "SOF_msgSent";

	ctrlShow [2023001, false];
	ctrlShow [2023002, false];
	ctrlShow [2023003, false];
	ctrlShow [202304, false];
	ctrlShow [202416, false];
	ctrlEnable [202416, false];
}];

ctrlShow [202304, true];
ctrlShow [202416, true];
ctrlEnable [202416, true];

ctrlSetText [202307, "Messages"];
ctrlSetText [202308, "Send your message"];

private _reciever = _this select 0;

ctrlSetText [2023001, "TO"];
ctrlSetText [2023002, _reciever];
ctrlSetText [2023003, "MESSAGE"];
ctrlSetText [202304, ""];