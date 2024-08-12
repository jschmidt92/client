#include "..\script_component.hpp"

disableSerialization;
createDialog "RscLocker";

ctrlSetText [1001, format ["%1 Inventory", (name player)]];
ctrlSetText [1000, format ["%1 Locker", (name player)]];

[] call FUNC(fetchLocker);
[] call FUNC(fetchPlayer);