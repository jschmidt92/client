_ctrl = _this select 0;
_win = [_ctrl] call sof_client_os_fnc_getWinFromCtrl;

{
    ctrlSetFocus _x;
} forEach _win;

ctrlSetFocus _ctrl;