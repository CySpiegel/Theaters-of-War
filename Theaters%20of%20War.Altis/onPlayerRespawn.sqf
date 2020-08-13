params ["_newUnit", "_oldUnit"];

// Disconnect possible connected UAV
if !(isNull (getConnectedUAV _oldUnit)) then {
    _oldUnit connectTerminalToUAV objNull;
};
