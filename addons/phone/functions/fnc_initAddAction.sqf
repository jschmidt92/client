#include "..\script_component.hpp"

waitUntil { "SOF_Phone" in items player };
SOF_addAction = player addAction ["<t color='#0000CC'>Mobile Phone</t>", FUNC(initAction), [], -99, false, false, "", ""];