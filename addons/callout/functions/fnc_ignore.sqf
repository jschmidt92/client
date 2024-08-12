#include "..\script_component.hpp"

private _removeActions = {
    _unit = _this;
    { _unit removeAction _x } forEach GVAR(allIDsToRemove);
};

player call _removeActions;

sleep 0.1;

[] remoteExec [QFUNC(handler), 2, false];