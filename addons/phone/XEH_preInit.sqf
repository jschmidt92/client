#include "script_component.hpp"
ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

GVAR(addressbook) = GETVAR(profileNamespace,SOF_AddressBook,[]);
GVAR(messages) = [];
GVAR(email) = [];