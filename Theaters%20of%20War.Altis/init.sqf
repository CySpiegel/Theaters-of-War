// Disable arma save system
enableSaving [false,false];

execVM "R3F_LOG\init.sqf";

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

		_budget = switch(_sideUnit) do
		{
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


// ACRE2 Radio Net Programming.........//
_nop = [] execVM "scripts\radioNoFreq.sqf";

// Sandsorms disable for altis
//Sandstorm
// [3, 7, 645] execvm "ROS\scripts\ROS_Sandstorm_Scheduler.sqf";


//Disable VCOMAI on all vehicles if server and clients are running it.
[{{Driver _x setvariable ["NOAI",true];} foreach (vehicles select {_x isKindOf 'air'});}, 1, []] call CBA_fnc_addPerFrameHandler;


// Satcom
_a1 = [] execVM "pxs_satcom_a3\init_satellite.sqf";
sleep 0.2;
//action
SATTOP addAction ["<t color='#ff0066'>SATCOM</t>", {call PXS_startSatellite;}, "", 0, true, true, "", "_this == player"]; 
//
