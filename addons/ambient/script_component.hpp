#define COMPONENT ambient
#define COMPONENT_BEAUTIFIED Ambient
#include "..\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_AMBIENT
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_AMBIENT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_AMBIENT
#endif

#include "..\main\script_macros.hpp"