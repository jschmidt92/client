#include "..\script_component.hpp"

private _metaCtrls = [2023001, 2023002, 2023003];

{
	ctrlShow [_x, true];
	ctrlEnable [_x, true];
} forEach _metaCtrls;

private _ctrl01 = (findDisplay 202300) displayCtrl 202319;
_ctrl01 ctrlRemoveAllEventHandlers "ButtonClick";
_ctrl01 ctrlAddEventHandler ["ButtonClick", {
	_this spawn FUNC(viewMessages);

	ctrlShow [2023001, false];
	ctrlShow [2023002, false];
	ctrlShow [2023003, false];
	ctrlShow [202305, false];
	ctrlShow [202306, false];
}];

ctrlShow [202305, true];
ctrlShow [202306, true];

disableSerialization;

private _control = _this select 0;
private _index = _this select 1;

private _sender = _control lbText _index;
private _message = _control lbData _index;

ctrlSetText [202307, "Messages"];
ctrlSetText [202308, "Read your message"];

ctrlSetText [2023001, "FROM"];
ctrlSetText [2023002, _sender];
ctrlSetText [2023003, "MESSAGE"];
ctrlSetText [202306, _message];

private _ctrl01 = (findDisplay 202300) displayCtrl 202306;

private _ctrl01Pos = ctrlPosition _ctrl01;
private _oldH = _ctrl01Pos select 3;
private _newH = ctrlTextHeight _ctrl01;
private _x = _ctrl01Pos select 0;
private _y = _ctrl01Pos select 1;
private _z = _ctrl01Pos select 2;

_ctrl01 ctrlSetPosition [_x, _y, _z, _newH];
_ctrl01 ctrlCommit 0;