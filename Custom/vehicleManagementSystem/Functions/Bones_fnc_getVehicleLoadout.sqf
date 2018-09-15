private ["_pylon", "_pylonRun", "_pylonList", "_magClass","_vehicle", "_currentLoadout", "_turretPath", "_ammoCount", "_magDetail"];
_OK = params
[
	["_vehicle", objNull, [objNull]]
];

if (!_OK) exitWith
{
	diag_log format ["VMS Error: Calling Bones_fnc_getVehicleLoadout with invalid parameters: %1",_this];
};	

_currentLoadout = [];
_magDetail = magazinesAllTurrets _vehicle;
_pylonList = getPylonMagazines _vehicle;
_pylonRun = 1;
{
	_magClass = _x select 0;
	_turretPath = _x select 1;
	_ammoCount = _x select 2;
	_pylon = -1;
	if (_magclass in _pylonList) then 
	{_pylon = _pylonRun;_pylonRun = _pylonRun + 1;
	_currentLoadout pushBack [_turretPath, _pylon, _magClass, _ammoCount];
	} else
	{
	private ["_tempAmmo", "_inserted"];
	_inserted = false;
		{
			if ((_x select 0) isEqualTo _turretPath && (_x select 2) isEqualTo _magClass) then
			{
				_tempAmmo = (_x select 3); 
				_x set [3, (_tempAmmo + _ammoCount)];
				_inserted = true;
			};
		} forEach _currentLoadout;

		if (!_inserted) then
		{
			_currentLoadout pushBack [_turretPath, _pylon, _magClass, _ammoCount];
		};
	};
} forEach _magDetail;

_currentLoadout