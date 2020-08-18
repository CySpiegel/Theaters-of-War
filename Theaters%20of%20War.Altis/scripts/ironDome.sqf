// Place in init.sqf
/*
call compile preprocessFileLineNumbers "IronDome.sqf";
if(isServer) then 
{
	{
		if (_x isKindOf "B_SAM_System_02_F") then
		{
			[_x,4000] call addToIronDome;
		};
	} forEach vehicles;
};
*/


if(isServer) then
{
	addToIronDome = {
	params["_launcher", "_detectionrange"];
	_null = [_launcher, _detectionrange]spawn
	{
		private ["_launcher","_detectionrange", "_incoming","_destination","_interceptor"];
		_launcher = _this select 0;
		_detectionrange = _this select 1;
		_mag = weaponState [_launcher, [0]];
		_ammo = getText (configFile ˃˃ "CfgMagazines" ˃˃ magazines _launcher select 0 ˃˃ "ammo");
		while {alive _launcher} do
		{
			_incoming = _launcher nearObjects ["RocketBase", _detectionrange];
			_incoming = _incoming + (_launcher nearObjects["MissileBase", _detectionrange]);
			_incoming = _incoming + (_launcher nearObjects["ShellBase", _detectionrange]);
			if (count _incoming ˃ 0) then
			{
				_target = selectRandom _incoming;
				_fromTarget = _target getDir _launcher;
				_dirTarget = direction _target;
				_destination = position _target;
				_launcher lookAt _destination;
				_tracked = _target getVariable "engaged";
				if((typeOf _target != _ammo) && (_dirTarget ˂_fromTarget + 60) && (_dirTarget ˃_fromTarget - 60) && (alive _target) && (isNil "_tracked")) then 
				{
					_target setVariable ["engaged", 123,true];
					[_launcher, _mag select 1] call BIS_fnc_fire;
					sleep 0.1;
					_interceptor = position _launcher nearObjects [_ammo, 100] select 0;
					_fails = 0;
					while {alive _interceptor} do 
					{
						_minDist = _target distance _interceptor;
						_velocity = (velocityModelSpace _interceptor) vectorMultiply 1.01;
						_velocityTrue = velocityModelSpace _interceptor;
						_dirHor = [_interceptor, _target] call BIS_fnc_DirTo;
						_interceptor setDir _dirHor;
						_dirVer = acos ((_target distance2D _interceptor) /(_target distance _interceptor));
						[_interceptor, _dirVer, 0] call BIS_fnc_setPitchBank;
						_interceptor setVelocityModelSpace _velocity;

						// Sleep time before missile recalculates trajectory to target
						sleep 0.002;

						if (_minDist ˂ _target distance _interceptor) then 
						{
							_fails = _fails + 1;
						} 
						else 
						{
							_fails = 0
						};
						if (_fails ˃ 3) then 
						{
							"HelicopterExploBig" createVehicle (getPos _interceptor);
							deleteVehicle _interceptor;
						};
						if (_interceptor distance _target ˂ 60) then 
						{
							"HelicopterExploBig" createVehicle (getPos _interceptor);
							deleteVehicle _interceptor;
							sleep 0.5;
							"HelicopterExploBig" createVehicle (getPos _target);
							deleteVehicle _target;
						};
					};
				};
			};
			if (count _incoming == 0) then 
			{
				sleep 0.5;
			};
		};
	};
	};   
};