#include "script_component.hpp"
ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

GVAR(currentMod) = "RHS";
GVAR(currentPaymentMethod) = "Personal";
GVAR(currentProductList) = [];
GVAR(focusedProductName) = "";
GVAR(focusedProductClass) = "";
GVAR(focusedProdcutPrice) = "";
GVAR(selectedCategory) = "storeWeapons";
GVAR(selectedPaymentMethod) = "Personal";