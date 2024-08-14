#include "..\script_component.hpp"

params [["_type", "", [""]], ["_entities", nil, [objNull, 0, [], sideUnknown, grpNull, ""]], ["_vehicles", nil, [objNull, 0, [], sideUnknown, grpNull, ""]], ["_args", nil, [[]]]];

switch (_type) do {
    case "dd": {
        private _dealer = _entities select 0;
        private _buyer = _entities select 1;

        waitUntil { sleep 1; GETVAR(_dealer,ace_captives_isHandcuffed,false) && GETVAR(_buyer,ace_captives_isHandcuffed,false) };

        player addAction ["Complete Callout", {
            params ["_target", "_caller", "_actionId", "_arguments"];

            ["Callout completed. Good job!", "blue-grey", 5] call EFUNC(misc,notify);

            ["t1", "SUCCEEDED"] call BFUNC(taskSetState);
            ["t1"] call BFUNC(deleteTask);
            
            player removeAction _actionId;
        }];
    };
    case "hvt": {
        waitUntil { sleep 1; !alive _entities };

        player addAction ["Complete Callout", {
            params ["_target", "_caller", "_actionId", "_arguments"];

            ["Callout completed. Good job!", "blue-grey", 5] call EFUNC(misc,notify);

            ["t1", "SUCCEEDED"] call BFUNC(taskSetState);
            ["t1"] call BFUNC(deleteTask);
            
            player removeAction _actionId;
        }];
    };
    case "rd": {
        private _stopDistance = _args select 0;

        while { alive _vehicles } do {
            ["t1", [_vehicles, true]] call BFUNC(taskSetDestination);

            if (_entities distance player <= _stopDistance) then { break; };
            sleep 1;
        };

        if (alive _entities) then { doStop _entities; };

        player addAction ["Complete Callout", {
            params ["_target", "_caller", "_actionId", "_arguments"];

            ["Callout completed. Good job!", "blue-grey", 5] call EFUNC(misc,notify);

            ["t1", "SUCCEEDED"] call BFUNC(taskSetState);
            ["t1"] call BFUNC(deleteTask);
            
            player removeAction _actionId;
        }];
    };
    case "sa":  {
        waitUntil { sleep 1; { alive _x } count _entities == 0 };

        player addAction ["Complete Callout", {
            params ["_target", "_caller", "_actionId", "_arguments"];

            ["Callout completed. Good job!", "blue-grey", 5] call EFUNC(misc,notify);

            ["t1", "SUCCEEDED"] call BFUNC(taskSetState);
            ["t1"] call BFUNC(deleteTask);
            
            player removeAction _actionId;
        }];
    };
    case "sf": {
        waitUntil { sleep 1; !alive _entities };

        player addAction ["Complete Callout", {
            params ["_target", "_caller", "_actionId", "_arguments"];

            ["Callout completed. Good job!", "blue-grey", 5] call EFUNC(misc,notify);

            ["t1", "SUCCEEDED"] call BFUNC(taskSetState);
            ["t1"] call BFUNC(deleteTask);
            
            player removeAction _actionId;
        }];
    };
};