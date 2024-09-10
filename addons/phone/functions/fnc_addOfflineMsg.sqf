#include "..\script_component.hpp"

if (_this isEqualTo [""]) exitWith {};

private _tmp = call compile format ["%1", _this];
if ((typeName _tmp) isEqualTo "SCALAR") exitWith {};

GVAR(messages) = _this;

["You got a message while away.", "green", 3] call EFUNC(misc,notify);