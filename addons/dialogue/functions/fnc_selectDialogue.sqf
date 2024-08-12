#include "..\script_component.hpp"

/*
	Name:	sof_client_dialogue_fnc_selectDialogue
	Date:	8/6/2022
	Version: 1.0
	Author:  J. Schmidt

	Description:
	Create dialogue for AI unit.

	Arguments:
	0: OBJECT - The AI unit
	1: STRING - The dialogue
*/

params [["_units", [], [[]]], ["_dialogue", [], [[]]]];

{
	_x params ["_topic", "_sentence"];
	[_topic, _sentence, nil, false, nil, [_units], 1, false] spawn BFUNC(kbTell);
	true
} count (_dialogue);