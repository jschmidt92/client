#include "..\script_component.hpp"

params [["_condition", "", [""]]];

private _dialog = findDisplay 202303;
private _list = _dialog displayCtrl 2023001;
private _targetValue = lbCurSel _list;
private _data = _list lbData _targetValue;
private _amount = round (parseNumber (ctrlText 2023005));

if ((isNil {_data})) exitWith { hint "You did not select a player!" };

{
    if (str (name (_x)) == str _data) then {
        private _target = _x;
    };
} count playableUnits;

switch (_condition) do {
    case ("advance"): {
        private _bank = GETVAR(_target,Cash_Bank,0);
        private _newBalance = _bank + _amount;

        if (_amount > companyFunds) exitWith { ["Not enough money in the company's account!", "warning", 3] call EFUNC(misc,notify) };

        SETPVAR(_target,Cash_Bank,_newBalance);

        ["deduct", _amount] call FUNC(adminRefresh);
        ["deduct", _amount] remoteExecCall ["sof_server_money_fnc_handleFunds", 2];
    };
    case ("advanceAll"): {
        private _count = count playableUnits;

        if ((10000 * _count) > companyFunds) exitWith { ["Not enough money in the company's account!", "warning", 3] call EFUNC(misc,notify) };

        {
            private _bank = GETVAR(_x,Cash_Bank,0);
            private _newBalance = _bank + 10000;

            SETPVAR(_x,Cash_Bank,_newBalance);
        } count playableUnits;

        ["deduct", (10000 * _count)] call FUNC(adminRefresh);
        ["deduct", (10000 * _count)] remoteExecCall ["sof_server_money_fnc_handleFunds", 2];
    };
    case ("deduct"): {
        private _bank = GETVAR(_target,Cash_Bank,0);
        private _newBalance = _bank - _amount;

        if (_amount > _bank) exitWith { ["Not enough money in the player's account!", "warning", 3] call EFUNC(misc,notify) };

        SETPVAR(_target,Cash_Bank,_newBalance);

        ["advance", _amount] call FUNC(adminRefresh);
        ["advance", _amount] remoteExecCall ["sof_server_money_fnc_handleFunds", 2];
    };
    case ("payday"): {
        private _totalPayment = 0;
        private _paymentToDo = [];
        private _payGrades = (missionConfigFile >> "SOF_CfgPaygrades" >> "payGrades") call BIS_fnc_getCfgData;

        {
            private _player = _x;
            private _payGrade = GETVAR(_player,PayGrade,nil);

            {
                _x params ["_payGradeIndex", "_payGradeBonus"];

                if ((_x select 0) == _payGrade) then {
                    _paymentToDo pushBack [_player, _payGradeBonus];
                    _totalPayment = _totalPayment + _payGradeBonus;
                };
            } forEach _payGrades;
        } count playableUnits;

        if (_totalPayment > companyFunds) exitWith { ["Not enough money in the company's account!", "warning", 3] call EFUNC(misc,notify) };

        {
            _x params ["_player", "_bonus"];

            private _bank = GETVAR(_player,Cash_Bank,0);
            private _newBalance = _bank + _bonus;

            SETPVAR(_player,Cash_Bank,_newBalance);
        } count _paymentToDo;

        ["deduct", _totalPayment] call FUNC(adminRefresh);
        ["deduct", _totalPayment] remoteExecCall ["sof_server_money_fnc_handleFunds", 2];
    };
};

ctrlSetText [2023005, ""];