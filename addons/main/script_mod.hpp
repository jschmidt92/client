#define MAINPREFIX z
#define PREFIX sof_client

#include "script_version.hpp"

#define VERSION MAJOR.MINOR
#define VERSION_AR MAJOR,MINOR,PATCH,BUILD

#define REQUIRED_VERSION 2.12

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(SOF Client - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(SOF Client - COMPONENT)
#endif