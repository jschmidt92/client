class CfgVehicles {
    class Man;
    class CAManBase: Man {
		class ACE_MainActions {
			class giveCash {
				displayName = "Give Cash";
				condition = "isPlayer cursorObject && (player distance cursorObject) <= 5";
				exceptions[] = {};
                statement = QUOTE([cursorObject] spawn EFUNC(money,giveCash));
				icon = "";
			};
			class addContact {
				displayName = "Add Contact";
				condition = "isPlayer cursorObject && (player distance cursorObject) <= 5";
				exceptions[] = {};
                statement = QUOTE([cursorObject] spawn EFUNC(phone,addContact));
				icon = "";
			};
			class openATM {
				displayName = "Access ATM";
				condition = "!(isNil {cursorObject getVariable 'isBank'}) && (player distance cursorObject) <= 5";
				exceptions[] = {};
                statement = QUOTE([cursorObject] spawn EFUNC(bank,openBank));
				icon = "";
			};
			class openCPOF {
				displayName = "Access CPOF";
				condition = "!(isNil {cursorObject getVariable 'isCPOF'}) && (player distance cursorObject) <= 5";
				exceptions[] = {};
                statement = QUOTE([cursorObject] spawn EFUNC(admin,openAdmin));
				icon = "";
			};
			class openGarage {
				displayName = "Open Garage";
				condition = "!(isNil {cursorObject getVariable 'isGarage'}) && (player distance cursorObject) <= 5 && SOF_Team_Coord == 0";
				exceptions[] = {};
                statement = QUOTE([cursorObject] spawn EFUNC(garage,openGarage));
				icon = "";
			};
			// class openCompanyGarage {
			// 	displayName = "Open Company Garage";
			// 	condition = "!(isNil {cursorObject getVariable 'isGarage'}) && (player distance cursorObject) <= 5 && SOF_Team_Coord == 1 && (getPlayerUID player) in companyGenerals";
			// 	exceptions[] = {};
			// 	statement = "[cursorObject] spawn sof_client_garage_fnc_openGarage";
			// 	icon = "";
			// };
			class openVirtualGarage {
				displayName = "Virtual Garage";
				condition = "!(isNil {cursorObject getVariable 'isGarage'}) && (player distance cursorObject) <= 5 && SOF_VA_Enable == 1 && SOF_Team_Coord == 0";
				exceptions[] = {};
                statement = QUOTE([cursorObject] spawn EFUNC(armory,openGarage));
				icon = "";
			};
			// class openVirtualCompanyGarage {
			// 	displayName = "Virtual Company Garage";
			// 	condition = "!(isNil {cursorObject getVariable 'isGarage'}) && (player distance cursorObject) <= 5 && SOF_VA_Enable == 1 && SOF_Team_Coord == 1 && (getPlayerUID player) in companyGenerals";
			// 	exceptions[] = {};
			// 	statement = "[cursorObject] spawn sof_client_armory_fnc_openGarage";
			// 	icon = "";
			// };
			class takeCash {
				displayName = "Take Cash";
				condition = "!(isNil {cursorObject getVariable 'isCash'}) && (player distance cursorObject) <= 5";
				exceptions[] = {};
                statement = QUOTE([cursorObject] spawn EFUNC(money,takeCash));
				icon = "";
			};
			class openLocker {
				displayName = "Open Locker";
				condition = "!(isNil {cursorObject getVariable 'isLocker'}) && (player distance cursorObject) <= 5";
				exceptions[] = {};
                statement = QUOTE([cursorObject] spawn EFUNC(locker,openLocker));
				icon = "";
			};
			// class openCompanyLocker {
			// 	displayName = "Open Company Locker";
			// 	condition = "!(isNil {cursorObject getVariable 'isLocker'}) && (player distance cursorObject) <= 5 && SOF_Team_Coord == 1 && (getPlayerUID player) in companyGenerals";
			// 	exceptions[] = {};
			// 	statement = "[cursorObject] spawn sof_client_locker_fnc_openLocker";
			// 	icon = "";
			// };
			class openVirtualArmory {
				displayName = "Virtual Armory";
				condition = "!(isNil {cursorObject getVariable 'isLocker'}) && (player distance cursorObject) <= 5 && SOF_VA_Enable == 1";
				exceptions[] = {};
                statement = QUOTE([cursorObject] spawn EFUNC(armory,openArmory));
				icon = "";
			};
			// class openVirtualCompanyArmory {
			// 	displayName = "Virtual Company Armory";
			// 	condition = "!(isNil {cursorObject getVariable 'isLocker'}) && (player distance cursorObject) <= 5 && SOF_VA_Enable == 1 && SOF_Team_Coord == 1 && (getPlayerUID player) in companyGenerals";
			// 	exceptions[] = {};
			// 	statement = "[cursorObject] spawn sof_client_armory_fnc_openArmory";
			// 	icon = "";
			// };
			class openStore {
				displayName = "Access Store";
				condition = "!(isNil {cursorObject getVariable 'isStore'}) && (player distance cursorObject) <= 5";
				exceptions[] = {};
                statement = QUOTE([cursorObject] spawn EFUNC(store,openStore));
				icon = "";
			};
		};
		class ACE_SelfActions {
            class getacF110 {
                displayName = "Getac F110";
                condition = "('SOF_Tablet' in (items player))";
                // icon = "";
                class getacOpen {
                    displayName = "Open";
                    condition = "true";
                    exceptions[] = {};
                    statement = "[] execVM 'CoalaOs\CoalaOsMain.sqf'";
                };
            };
            class phone {
                displayName = "Phone";
                condition = "('SOF_Phone' in (items player))";
                // icon = "";
                class phoneOpen {
                    displayName = "Open";
                    condition = "true";
                    exceptions[] = {};
                    statement = QUOTE([] spawn EFUNC(phone,openPhone));
                };
            };
        };
	};
};