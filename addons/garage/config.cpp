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

        locations[] = {
            {"garageAircraft", {4805,8075,0}, 0},
            {"garageArmored", {4805,8075,0}, 0},
            {"garageChopper", {4805,8075,0}, 0},
            {"garageMarine", {4805,8075,0}, 0},
            {"garageStatic", {4805,8075,0}, 0},
            {"garageUAV", {4805,8075,0}, 0},
            {"garageUGV", {4805,8075,0}, 0},
            {"garageWheeled", {4805,8075,0}, 0}
        };
    };
};

#include "CfgEventHandlers.hpp"
#include "ui\RscCommon.hpp"
#include "ui\RscGarage.hpp"