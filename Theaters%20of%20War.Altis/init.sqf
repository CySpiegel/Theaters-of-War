// Disable arma save system
enableSaving [false,false];



/*  
ACE Fortification budget system 

Kiling enemies will add to the budget of ACE Fortification
Killing Friendlies or civilians will be penelised 
*/
["CAManBase", "Init", {
	params ["_entity"];
	
	_entity setVariable ["side_unit", side _entity];

	_entity addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];

		_sideUnit = _unit getVariable ["side_unit", sideUnknown];
		if (_sideUnit isEqualTo sideUnknown) exitWith {};

		_budget = switch(_sideUnit) do {
			case west: { 0 };
			case east: { 50 };
			case resistance: 
			{ 
				if ((side _instigator) isEqualTo west) then { -200 } else { 0 }
			};
			case civilian: 
			{
				if ((side _instigator) isEqualTo west) then { -200 } else { 0 }
			};
			default { 0 };
		};
		
		// Prevent the budget from going negative
		if (_budget isEqualTo 0) exitWith {};

		// Updating the budget
		[west, _budget, (_sideUnit isEqualTo civilian)] call acex_fortify_fnc_updateBudget;
		["ACE_Fortify_budget_change", []] call CBA_fnc_serverEvent;
	}];
}] call CBA_fnc_addClassEventHandler;


#ifndef execNow
#define execNow call compile preprocessfilelinenumbers
#endif

["ALiVE | Theaters of War - Executing init.sqf..."] call ALiVE_fnc_Dump;


// ace fortification supplies
execVM "scripts\fortify.sqf";

// ACRE2 Radio Net Programming.........//
_nop = [] execVM "scripts\radioNoFreq.sqf";

//Disable VCOMAI on all vehicles if server and clients are running it.
[{{Driver _x setvariable ["NOAI",true];} foreach (vehicles select {_x isKindOf 'air'});}, 1, []] call CBA_fnc_addPerFrameHandler;
