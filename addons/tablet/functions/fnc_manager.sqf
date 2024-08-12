GUI_GRID_W = 0.025;
GUI_GRID_H = 0.04;
GUI_GRID_X = 0;
GUI_GRID_Y = 0;
sofMouseX = 0;
sofMouseY = 0;
isMouseDown = 0;
SOF_WindowId = 1801;

GUI_TOP = 1;
GUI_LEFT = -2;
GUI_WIDTH = 46.5;
GUI_HEIGHT = 21.75;
GUI_RIGHT = (GUI_WIDTH + GUI_LEFT) * GUI_GRID_W;
GUI_BOTTOM = (GUI_HEIGHT + GUI_TOP) * GUI_GRID_H;

SOF_Display displayAddEventHandler ["MouseMoving", {
    [_this] call sof_client_tablet_fnc_ckMoveWin;
    sofMouseX = _this select 1;
    sofMouseY = _this select 2;
}];

SOF_Display displayAddEventHandler ["MouseButtonUp", {
    isMouseDown = 0;
}];