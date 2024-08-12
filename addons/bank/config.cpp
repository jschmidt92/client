#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"sof_client_main"};
        authors[] = {"J. Schmidt", "Creedcoder"};
        author = "J. Schmidt";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "ui\RscCommon.hpp"
#include "ui\RscBank.hpp"