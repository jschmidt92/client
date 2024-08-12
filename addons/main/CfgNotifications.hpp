class CfgNotifications {
	class Default {
		title = "";
		iconPicture = "";
		iconText = "";
		description = "";
		color[] = {1,1,1,1};
		duration = 5;
		priority = 0;
		difficulty[] = {};
	};
	
	class TaskAssigned {
		title = "Contract Accepted";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		description = "%1";
		color[] = {1,1,1,1};
		priority = 0;
				
	};
	
	class TaskFailed {
		title = "Breach of Contract";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_ca.paa";
		description = "%1";
		color[] = {1,0,0,1};
		priority = 0;
	};
	
	class TaskDone {
		title = "Contract Fulfilled";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIconDone_ca.paa";
		description = "%1";
		color[] = {0,1,0,1};
		priority = 0;
	};
	
	class InformationRed {
		title = "Information";
		iconPicture = "\A3\ui_f\data\map\markers\handdrawn\warning_ca.paa";
		description = "%1";
		color[] = {0.69,0.13,0.13,1};
		priority = 1;
	};
	
	
	class InformationGreen {
		title = "Information";
		iconPicture = "\A3\ui_f\data\map\markers\handdrawn\warning_ca.paa";
		description = "%1";
		color[] = {0.13,0.54,0.13,1};
		priority = 1;
	};
	
	class ScoreAdded {
		title = "RP Earned";
		iconText = "+%2";
		description = "%1";
		color[] = {1,0,1,1};
		priority = 2;
	};

	class IncomingQRF {
		title = "ENEMY QRF";
		iconPicture = "\A3\ui_f\data\Map\VehicleIcons\iconTruck_ca.paa";
		iconText = "";
		description = "An enemy QRF was spotted near your location";
		color[] = {1, 1, 1, 1};
		duration = 5;
		priority = 3;
		difficulty[] = {};
	};

	class Warning {
		title = "WARNING";
		iconPicture = "\A3\ui_f\data\Map\Markers\Military\warning_CA.paa";
		iconText = "";
		description = "%1";
		color[] = {1, 0, 0, 1};
		duration = 7;
		priority = 5;
		difficulty[] = {};
	};

	class JipTeleport {
		title = "JIP";
		iconPicture = "\A3\ui_f\data\GUI\Cfg\Hints\Timing_ca.paa";
		iconText = "";
		description = "Join In Progress: Use self-interaction to TP back to your squad";
		color[] = {1, 1, 1, 1};
		duration = 5;
		priority = 4;
		difficulty[] = {};
	};

	class IntelAdded {
		title = "INTEL FOUND";
		iconPicture = "\A3\ui_f\data\GUI\RscCommon\RscButtonSearch\search_start_ca.paa";
		iconText = "";
		description = "%1";
		color[] = {1, 1, 1, 1};
		duration = 7;
		priority = 3;
		difficulty[] = {};
	};

	class RespawnCalled {
		title = "RESPAWN";
		iconPicture = "\A3\modules_f\data\iconSector_ca.paa";
		iconText = "";
		description = "The CO has called for reinforcements. Respawning in 5 seconds...";
		color[] = {0, 0.8, 0, 1};
		duration = 5;
		priority = 5;
		difficulty[] = {};
	};

	class Info {
		title = "INFO";
		iconPicture = "\A3\ui_f\data\GUI\Cfg\CommunicationMenu\instructor_ca.paa";
		iconText = "";
		description = "%1";
		color[] = {1, 1, 1, 1};
		duration = 5;
		priority = 4;
		difficulty[] = {};
	};

	class AOLimitWarning {
		title = "AO LIMIT";
		iconPicture = "\a3\ui_f\data\GUI\Cfg\Debriefing\endDeath_ca.paa";
		iconText = "";
		description = "Where are you going? Return to the AO now!";
		color[] = {1, 1, 1, 1};
		duration = 5;
		priority = 4;
		difficulty[] = {};
	};

	class SetupTimerEnded {
		title = "SETUP TIMER";
		iconPicture = "\a3\ui_f\data\IGUI\Cfg\Actions\settimer_ca.paa";
		iconText = "";
		description = "Setup phase is over. The mission is a go.";
		color[] = {1, 1, 1, 1};
		duration = 5;
		priority = 4;
		difficulty[] = {};
	};

	class TimeLimitNotification {
		title = "MISSION TIME LIMIT";
		iconPicture = "\a3\ui_f\data\IGUI\Cfg\Actions\settimer_ca.paa";
		iconText = "";
		description = "%1 minutes remaining.";
		color[] = {1, 1, 1, 1};
		duration = 5;
		priority = 5;
		difficulty[] = {};
	};
};