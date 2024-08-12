#include "..\script_component.hpp"

private _defaultTheme = ["bg_dark01", "\@sof_mod\userconfig\backgrounds\bgdark_01.paa"];
private _theme = GETVAR(profileNamespace,SOF_PhoneTheme,_defaultTheme);
private _themeBackground = _theme select 1;

private _dayTime = [(date select 3), (date select 4)] call FUNC(dateToHhMm);
private _dialog = createDialog "RscPhone";

private _homeScreenBgBtns = [202202, 202203, 202204, 202205, 202206, 202207, 202208, 202209];
private _homeScreenBtns = [202310, 202311, 202312, 202313, 202314, 202315, 202316, 202317, 202318];

private _dialpadBgBtns = [202210, 202211, 202212, 202213, 202214, 202215, 202216, 202217, 202218, 202219, 202220, 202221];
private _dialpadBtns = [202401, 202402, 202403, 202404, 202405, 202406, 202407, 202408, 202409, 202410, 202411, 202412, 202413];

private _displayCtrls = [202201, 202210, 202211, 202212, 202213, 202214, 202215, 202216, 202217, 202218, 202219, 202220, 202221, 202222, 202223, 202224, 202302, 202303, 202304, 202305, 202306, 202307, 202308, 202309, 202319, 2023001, 2023002, 2023003, 2023004, 2023005, 2023006, 202401, 202402, 202403, 202404, 202405, 202406, 202407, 202408, 202409, 202410, 202411, 202412, 202413, 202414, 202415, 202416];

disableSerialization;

ctrlSetText [202200, _themeBackground];

{
	ctrlShow [_x, false];
} forEach _displayCtrls;

ctrlSetText [202301, (_dayTime select 0) + ":" + (_dayTime select 1)];