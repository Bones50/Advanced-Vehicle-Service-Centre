_totalCost = 0;
_vehicle1 = [];
if (isNull objectParent player) then {_vehicle1 pushback cursorTarget;} else 
{
_vehicleTemp = (objectParent player);
_vehicle1 pushback (nearestObject [player, typeof _vehicleTemp]);
};
_vehicle = (_vehicle1 select 0);
_weapArray = [];
{
	_cfgTurret = _x;
	_magazineArray = getArray (_cfgTurret >> "magazines");
	_tempArray = [];		
	{
		_magDetails = [];
		_tempMag = _x;
		if !(_tempMag in _tempArray) then 
		{
			_tempArray pushback _tempMag;
			_cnt = {_x == _tempMag} count _magazineArray;
			_magDetails pushback _tempMag;
			_magDetails pushback _cnt;
			_weapArray pushback _magDetails;
		};
	} forEach _magazineArray;
} forEach ([_vehicle] call BIS_fnc_getTurrets);
{
	_weapArray pushBack [_x, 1]
} forEach (getPylonMagazines _vehicle);

_vehicleMags = _vehicle call Bones_fnc_getVehicleLoadout;

{
	private ["_turretPath", "_bulletCost", "_maxMag", "_menuItem", "_magClass", "_displayName", "_ammoCount", "_magMaxAmmoCount", "_maxBullets", "_numMagsToLoad", "_currentMags", "_loadedMagCount", "_currentMagToLoad", "_currentMagCost", "_menuItemAndDetails"];
	_bulletCost = 0;
	_cost = 0;
	_maxMag = 0;
	_magClass = _x select 2;
	
	//get bullet cost for this turret mag
	{
		if (_magClass == (_x select 0)) then {_bulletCost = _x select 1;};
	} forEach vmsAmmoCost;
	if (_bulletCost == 0) then {_bulletCost = vmsdefaultAmmoCost;};
	
	//get max number of mags for this turret mag
	{
		if (_magClass == (_x select 0)) then {_maxMag = _x select 1;};
	} forEach _weapArray;
	
	//get ammo and get total max bullets
	_ammoCount = _x select 3;
	_magMaxAmmoCount = getNumber(configFile >> "CfgMagazines" >> _magClass >> "count");
	_maxBullets = _magMaxAmmoCount * _maxMag;
	
	//if less than  max bullets work out how many and how much
	if (_ammoCount < _maxBullets&& !(_magClass in vmsAmmoBlackList)) then
	{
		if (["120mm",_magClass] call BIS_fnc_inString || ["125mm",_magClass] call BIS_fnc_inString || ["105mm",_magClass] call BIS_fnc_inString || ["L30A1_Cannon",_magClass] call BIS_fnc_inString || ["2A46",_magClass] call BIS_fnc_inString || ["100mm",_magClass] call BIS_fnc_inString || ["smoke",_magClass] call BIS_fnc_inString) then
		{
			_numMagsToLoad = _magMaxAmmoCount - _ammoCount;
			_currentMagCost = _numMagsToLoad * _bulletCost;
			_cost = _currentMagCost;
		} else
		{
			_currentMags = floor (_ammoCount / _magMaxAmmoCount);
			_numMagsToLoad = _maxMag - _currentMags - 1;
			_totalMagCost = _numMagsToLoad * _bulletCost * _magMaxAmmoCount;
			_loadedMagCount = _ammoCount - (_currentMags * _magMaxAmmoCount);
			_currentMagToLoad = _magMaxAmmoCount - _loadedMagCount;
			_currentMagCost = _currentMagToLoad * _bulletCost;
			_cost = _totalMagCost + _currentMagCost;
		};
		_totalCost = _totalCost + _cost;
	};
} forEach _vehicleMags;	
_totalCost