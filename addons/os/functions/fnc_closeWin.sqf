_ctrl = _this select 0;
_win = [_ctrl] call sof_client_os_fnc_getWinFromCtrl;

_processId = [_win select 0, "processID"] call sof_client_os_fnc_getVarToCtrl;
if (str(_processId) != "<null>") then {
    [format ["close %1", _processId]] call sof_client_os_fnc_exeCmdNonShell;
    [] call sof_client_os_fnc_stopPlayer;
};

{
    ctrlDelete _x;
} forEach _win;