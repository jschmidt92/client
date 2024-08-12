#include "..\script_component.hpp"

/*
	Name:	sof_client_dialogue_fnc_selectAI
	Date:	8/6/2022
	Version: 1.0
	Author:  J. Schmidt

	Description:
	Select AI for dialogue.

	Arguments:
	0: OBJECT - The AI unit
*/

params [["_units", [], [[]]]];

{
	_x disableAI "ALL";
	_x switchMove " ";
	[_x] call FUNC(selectDialogue);
	true
} count (_units);