#include "..\script_component.hpp"

private ["_data", "_dialog", "_list", "_target", "_targetValue", "_textBox", "_textMessage"];

_dialog = findDisplay 202303;
_list = _dialog displayCtrl 2023001;
_textBox = _dialog displayCtrl 2023006;
_targetValue = lbCurSel _list;
_data = _list lbData _targetValue;

if ((isNil {_data})) exitWith { hintSilent "You did not select a player!" };

{
	if (str (name (_x)) == str _data) then {
		_target = _x;
	};
} forEach playableUnits;

hintSilent format ["Player Selected. You have selected %1", _target];

if (isNil "_target") then {
	hintSilent "Please Select an Active Player First!"
} else {
	_textMessage = ctrlText _textBox;
	[_target, _textMessage] remoteExec ["sof_server_misc_fnc_textMessage", 2];
	
	// [format ["Message sent to %1: <br/>%2", _target, _textMessage], "blue-grey", 3] call EFUNC(misc,notify);
};

["dummy"] call FUNC(adminRefresh);