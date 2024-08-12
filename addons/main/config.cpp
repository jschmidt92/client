#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main", "ace_main"};
        authors[] = {"J. Schmidt", "Creedcoder"};
        author = "J. Schmidt";
        VERSION_CONFIG;
        clientSaveLoopTime = 900;
        holsterKey = 35;
        interactionKey = 15;
        phoneKey = 25;
    };
};

#include "CfgMods.hpp"
#include "CfgMPGameTypes.hpp"
#include "CfgNotifications.hpp"