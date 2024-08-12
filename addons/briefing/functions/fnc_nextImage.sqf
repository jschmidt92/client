#include "..\script_component.hpp"

/*
	Author: PDT for J. Schmidt
	displays the next image
	
	Arguments:
	0: _controller <OBJECT> - object that controls the slide show
	
	Return Value:
	<BOOL> - true if the next image was displayed; false if not
*/

params [["_controller", objNull]];

if (isNull _controller) exitWith {
	_return = false;
	_return
};

private _controllers = _controller getVariable ["SOF_SlideShow_Controllers", []];
private _currentIndex = _controller getVariable ["SOF_SlideShow_CurrentIndex", 0];
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

private _imageCount = (count _images) - 1;

if (_currentIndex isEqualTo _imageCount) then {
	_currentIndex = 0;
} else {
	_currentIndex = _currentIndex + 1;
};

{
	_x setObjectTextureGlobal [0, (_images select _currentIndex) select 0];
	true
} count (_screens);

{
	_x setVariable ["SOF_SlideShow_CurrentIndex", _currentIndex, true];
	true
} count (_controllers);

_return = true;
_return