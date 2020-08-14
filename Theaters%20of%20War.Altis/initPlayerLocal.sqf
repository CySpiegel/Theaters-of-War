// Ace Fortification ALiVE Database saving system
["acex_fortify_objectPlaced", {
	[ALiVE_SYS_LOGISTICS, "updateObject", [(_this select 2)]] call ALIVE_fnc_logistics;
	["ACE_Fortify_budget_change", []] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

["acex_fortify_objectDeleted", {
	[ALiVE_SYS_LOGISTICS, "removeObject", [(_this select 2)]] call ALIVE_fnc_logistics;
	["ACE_Fortify_budget_change", []] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

_action = ["ASO_Logistics_Update", "Save Position", "", {
	[ALiVE_SYS_LOGISTICS, "updateObject", [_target]] call ALiVE_fnc_logistics;
	hintSilent "Position saved!";
}, {true}] call ace_interact_menu_fnc_createAction;


["Reammobox_F", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;


// Enable Dynamic Group System
["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;


nul = [player] execVM "scripts\check.sqf";

// Wait for player to fully load in before continuing clientside code execution
if (!isServer && (player != player)) then { waitUntil {player == player}; waitUntil {time > 10}; };

// start undercover system
if (player getVariable ["isSneaky",false]) then {
    [player] execVM "INC_undercover\Scripts\initUCR.sqf";
};