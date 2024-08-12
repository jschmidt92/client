#include "..\script_component.hpp"

disableSerialization;
createDialog "RscGarage";

ctrlSetText [1000, format ["%1 Garage", (name player)]];

[] call FUNC(fetchGarage);
[] call FUNC(fetchVehicle);