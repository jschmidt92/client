#include "..\script_component.hpp"

/*
	Author: PDT for J. Schmidt
	starts the slideshow

	Arguments:
	0: _controller  <OBJECT> - object that controls the slide show

	Return Value:
	<BOOL> - true if slide show was started
*/

params [["_controller", objNull], ["_units", []], ["_topic", ""], ["_sentence", ""]];

SOF_Briefing_inProgress = true;
publicVariable "SOF_Briefing_inProgress";

if (isNull _controller) exitWith {
	_return = false;
	_return
};

private _autoScroll = _controller getVariable ["SOF_SlideShow_AutoScroll", false];
private _controllers = _controller getVariable ["SOF_SlideShow_Controllers", []];
private _currentIndex = _controller getVariable ["SOF_SlideShow_CurrentIndex", 0];
private _images = _controller getVariable ["SOF_SlideShow_Images", []];
private _screens = _controller getVariable ["SOF_SlideShow_Screens", []];
private _units = _controller getVariable ["SOF_SlideShow_Units", []];
private _topic = _controller getVariable ["SOF_SlideShow_Topic", ""];
private _sentence = _controller getVariable ["SOF_SlideShow_Sentence", ""];
private _started = _controller getVariable ["SOF_SlideShow_Started", true];

if (_images isEqualTo []) exitWith {
	_return = false;
	_return
};

if (_screens isEqualTo []) exitWith {
	_return = false;
	_return
};

if (_controllers isEqualTo []) exitWith {
	_return = false;
	_return
};

private _imageCount = (count _images) - 1;

if (_currentIndex isEqualTo _imageCount) then {
	_currentIndex = 0;
};

_handle = [_topic, _sentence, nil, nil, nil, _units, 1, false] spawn BIS_fnc_kbTell;

{
	_x setObjectTextureGlobal [0, (_images select _currentIndex) select 0];
	true
} count (_screens);

{
	_x setVariable ["SOF_SlideShow_CurrentIndex", _currentIndex, true];
	true
} count (_controllers);

if (_autoScroll) then {
	{
		private _index = _controller getVariable ["SOF_SlideShow_CurrentIndex", 0];
		private _image = _x select 0;
		private _sleep = _x select 1;

		{
			_x setObjectTextureGlobal [0, _image];
			true
		} count (_screens);

		_index = _index + 1;
		_controller setVariable ["SOF_SlideShow_CurrentIndex", _index, true];

		uiSleep _sleep;
		true
	} count (_images);
};

waitUntil { scriptDone _handle };

SOF_Briefing_inProgress = false;
publicVariable "SOF_Briefing_inProgress";

_return = true;
_return