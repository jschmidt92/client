#include "..\script_component.hpp"

#define PX_DC_SEP "."
#define PX_TH_SEP ","
#define PX_DC_PL 2

private _count = 0;
private _arr = (_this toFixed PX_DC_PL) splitString ".";
private _str = PX_DC_SEP+(_arr select 1);

_arr = toArray(_arr select 0);
reverse _arr;

{
	if (_count == 3) then {
		_count = 0;
		_str = PX_TH_SEP + _str;
	};

	_str = toString[_x] + _str;
	_count = _count + 1;

	true
} count (_arr);

_str