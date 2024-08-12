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
ctrlShow [202303, true];
ctrlShow [202307, true];
ctrlShow [202308, true];
ctrlShow [202319, true];
ctrlEnable [202319, true];

private _ctrl01 = (findDisplay 202300) displayCtrl 202303;
private _ctrl02 = (findDisplay 202300) displayCtrl 202319;

_ctrl02 ctrlRemoveAllEventHandlers "ButtonClick";

_ctrl02 ctrlAddEventHandler ["ButtonClick", {
	private _homeScreenBgBtns = [202202, 202203, 202204, 202205, 202206, 202207, 202208, 202209];
	private _homeScreenBtns = [202310, 202311, 202312, 202313, 202314, 202315, 202316, 202317, 202318];

	{ ctrlShow [_x, true]; ctrlEnable [_x, true]; } forEach _homeScreenBgBtns;
	{ ctrlShow [_x, true]; ctrlEnable [_x, true]; } forEach _homeScreenBtns;
	ctrlShow [202201, false];
	ctrlShow [202303, false];
	ctrlShow [202307, false];
	ctrlShow [202308, false];
	ctrlShow [202319, false];
	ctrlEnable [202319, false];
}];

lbClear _ctrl01;

private _mC = "SOF_CfgPhones";
private _themes = "true" configClasses (missionConfigFile >> "SOF_CfgPhones" >> "themes");
private _notifications = "true" configClasses (missionConfigFile >> "SOF_CfgPhones" >> "notifications");
private _ringtones = "true" configClasses (missionConfigFile >> "SOF_CfgPhones" >> "ringtones");

{
	private _configName = configName(_x);
	private _themeName = (missionConfigFile >> _mC >> "themes" >> _configName >> "themeName") call BIS_fnc_getCfgData;
	private _themeBackground = (missionConfigFile >> _mC >> "themes" >> _configName >> "themeBackground") call BIS_fnc_getCfgData;
	
	private _theme = _ctrl01 lbAdd format ["Theme %1 - %2", (_forEachIndex + 1), _themeName];
	_ctrl01 lbSetData [_theme, format ["%1", [_configName, _themeBackground]]];
} forEach _themes;

lbSetCurSel [202303, 0];

_ctrl01 ctrlAddEventHandler ["LBSelChanged", {
	params ["_control"];

	private _data = _control lbData (lbCurSel _control);
	private _dataArray = call compile _data;
	private _themeName = _dataArray select 0;
	private _themeBackground = _dataArray select 1;

	ctrlSetText [202200, _themeBackground];
	profileNamespace setVariable ["SOF_PhoneTheme", [_themeName, _themeBackground]];
}];

ctrlSetText [202307, "Settings"];
ctrlSetText [202308, "Modify your phone"];