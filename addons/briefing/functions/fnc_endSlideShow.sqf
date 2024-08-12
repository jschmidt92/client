#include "..\script_component.hpp"

/*
	Author: PDT for J. Schmidt
	ends the slide show

	Arguments:
	0: _controller <OBJECT> - object that controls the slide show

	Return Value:
	<BOOL> - true if the slide show was ended; false if not
*/

params [["_controller", objNull]];

if (isNull _controller) exitWith {
	_return = false;
	_return
};

private _controllers = _controller getVariable ["SOF_SlideShow_Controllers", []];
private _currentIndex = 0;
private _images = _controller getVariable ["SOF_SlideShow_Images", []];
private _screens = _controller getVariable ["SOF_SlideShow_Screens", []];

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

{
	_x setObjectTextureGlobal [0, ""];
	true
} count (_screens);

{
	_x setVariable ["SOF_SlideShow_Images", _images, true];
	_x setVariable ["SOF_SlideShow_Screens", _screens, true];
	_x setVariable ["SOF_SlideShow_CurrentIndex", _currentIndex, true];
	_x setVariable ["SOF_SlideShow_Started", false, true];
	true
} count (_controllers);

_return = true;
_return