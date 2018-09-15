private ["_vehicle", "_allHitpoints", "_hitpointNames", "_totalRepairList", "_totalSalvageList", "_wheelRepairList", "_wheelSalvageList", "_tempLabel", "_noWheels", "_tempExpression", "_tempMenu", "_wheelPrice", "_valueType", "_ctrl"];

_vehicle1 = [];
if (isNull objectParent player) then {_vehicle1 pushback cursorTarget;} else 
{
_vehicleTemp = (objectParent player);
_vehicle1 pushback (nearestObject [player, typeof _vehicleTemp]);
};
_vehicle = (_vehicle1 select 0);
_allHitpoints = getAllHitPointsDamage _vehicle;
_hitpointNames = _allHitpoints select 0;
_totalRepairPrice = 0;
_repairlist =[];

/////////Wheels Menus
_wheelRepairList = [];
_noWheelsTemp = getnumber (configfile >> "cfgvehicles" >> (typeof _vehicle) >> "numberPhysicalWheels");
{
	_wheel = ["wheel", _x] call bis_fnc_instring;
	if(_wheel) then
	{
		_damage = _vehicle getHitPointDamage _x;
		if (_damage > 0) then 
		{
			_wheelRepairList pushback _x;
		};
	};
} forEach _hitpointNames;

//wheel Repair MenuItems
//get pricing
_wheelPrice = 0;
{
_wheelPriceTemp = (getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price"));
_wheelPrice = _wheelPrice + _wheelPriceTemp;
} forEach vmswheelRepairItems;
	
{
	_damage = _vehicle getHitPointDamage _x;
	_wheelPriceThis = 0;
	_wheelPriceThis = round(_wheelPrice * _damage);
	_value = 0;
	_noWheels = getnumber (configfile >> "cfgvehicles" >> (typeof _vehicle) >> "numberPhysicalWheels");
	if (_noWheels == 8) then 
		{
			if (_x == "HitRFWheel" || _x == "HitRF2Wheel" || _x == "HitRMWheel" || _x == "HitLFWheel" || _x == "HitLF2Wheel" || _x == "HitLMWheel" || _x == "HitRBWheel" ||_x == "HitLBWheel") then {_value = _wheelPriceThis};
		};

	if (_noWheels == 4) then 
		{
			if (_x == "HitRFWheel" || _x == "HitRF2Wheel" || _x == "HitLFWheel" || _x == "HitLF2Wheel") then {_value = _wheelPriceThis};
		};

	if (_noWheels == 6) then 
		{
			if (_x == "HitRFWheel" || _x == "HitRF2Wheel" || _x == "HitRMWheel" || _x == "HitLFWheel" || _x == "HitLF2Wheel" || _x == "HitLMWheel") then {_value = _wheelPriceThis};
		};
	_totalRepairPrice = _totalRepairPrice + _value;
} forEach _wheelRepairList;

//////////Main Rotors

_mainRotorRepairList = [];

{
	_rotor = ["HitHRotor", _x] call bis_fnc_instring;
	if(_rotor) then
	{
		_damage = _vehicle getHitPointDamage _x;
		if (_damage > 0) then 
		{
			_mainRotorRepairList pushback _x;
		};
	};
} forEach _hitpointNames;

_mainRotorPrice = 0;
{
_rotorPriceTemp = (getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price"));
_mainRotorPrice = _mainRotorPrice + _rotorPriceTemp;
} forEach vmsmainRotorRepairItems;

{
	_damage = _vehicle getHitPointDamage _x;
	_mainRotorPriceThis = round(_mainRotorPrice * _damage);
	_totalRepairPrice = _totalRepairPrice + _mainRotorPriceThis;
} forEach _mainRotorRepairList;


//////////Tail Rotor

_tailRotorRepairList = [];

{
	_rotor = ["HitVRotor", _x] call bis_fnc_instring;
	if(_rotor) then
	{
		_damage = _vehicle getHitPointDamage _x;
		if (_damage > 0) then 
		{
			_tailRotorRepairList pushback _x;
		};
	};
} forEach _hitpointNames;

_tailRotorPrice = 0;
{
_rotorPriceTemp = (getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price"));
_tailRotorPrice = _tailRotorPrice + _rotorPriceTemp;
} forEach vmstailRotorRepairItems;

{
	_damage = _vehicle getHitPointDamage _x;
	_tailRotorPriceThis = round(_tailRotorPrice * _damage);
	_totalRepairPrice = _totalRepairPrice + _tailRotorPriceThis;
} forEach _tailRotorRepairList;

///////////Glass Menu

_glassRepairList = [];

{
	_glass = ["glass", _x] call bis_fnc_instring;
	if(_glass) then
	{
		_damage = _vehicle getHitPointDamage _x;
		if (_damage > 0) then 
		{
			_glassRepairList pushback _x;
		};
	};
} forEach _hitpointNames;

//glass Repair Menu
_glassPrice = 0;
{
_glassPriceTemp = (getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price"));
_glassPrice = _glassPrice + _glassPriceTemp;
} forEach vmsglassRepairItems;
{
	_damage = _vehicle getHitPointDamage _x;
	_glassPriceThis = 0;
	_glassPriceThis = round(_glassPrice * _damage);
	_totalRepairPrice = _totalRepairPrice + _glassPriceThis;
} forEach _glassRepairList;

/////Engine Menu
_engineRepairList = [];

{
	_engine = ["engine", _x] call bis_fnc_instring;
	if(_engine) then
	{
		_damage = _vehicle getHitPointDamage _x;
		if (_damage > 0) then 
		{
			_engineRepairList pushback _x;
		};
	};
} forEach _hitpointNames;

_enginePrice = 0;
{
	_enginePriceTemp = (getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price"));
	_enginePrice = _enginePrice + _enginePriceTemp;
} forEach vmsengineRepairItems;

{
	_damage = _vehicle getHitPointDamage _x;
	_enginePriceThis = 0;
	_enginePriceThis = round(_enginePrice * _damage);
	_totalRepairPrice = _totalRepairPrice + _enginePriceThis;
} forEach _engineRepairList;

/////Fuel Tank Menu
_fuelRepairList = [];
{
	if(_x == "hitFuel") then
	{
		_damage = _vehicle getHitPointDamage _x;
		if (_damage > 0) then 
		{
			_fuelRepairList pushback _x;
		};
	};
} forEach _hitpointNames;

_fuelPrice = 0;
{
	_fuelPriceTemp = (getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price"));
	_fuelPrice = _fuelPrice + _fuelPriceTemp;
} forEach vmsfuelRepairItems;

{
	_damage = _vehicle getHitPointDamage _x;
	_fuelPriceThis = 0;
	_fuelPriceThis = round(_fuelPrice * _damage);
	_totalRepairPrice = _totalRepairPrice + _fuelPriceThis;
} forEach _fuelRepairList;

//Hull Repair
_overallDamage = 0;
_damagePool = 0;
_otherDamageItems = [];
{
	_glass = ["glass", _x] call bis_fnc_instring;
	_rotor = ["rotor", _x] call bis_fnc_instring;
	_wheel = ["wheel", _x] call bis_fnc_instring;
	_engine = ["engine", _x] call bis_fnc_instring;
	_fuel = ["fuel", _x] call bis_fnc_instring;
	
	if !(_glass || _rotor || _wheel || _fuel || _engine) then
	{
	_damage = _vehicle getHitPointDamage _x;
	_overallDamage = _overallDamage + _damage;
	_damagePool = _damagePool + 1;
	_otherDamageItems pushback _x;
	};
} forEach _hitpointNames;

_otherPrice = 0;
if (_overallDamage > 0) then
{
	{
		_otherPriceTemp = (getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price"));
		_otherPrice = _otherPrice + _otherPriceTemp;
	} forEach vmsotherRepairItems;
	_damagePerc = round(_overallDamage / _damagePool * 100);
	_otherPrice = _otherPrice * (_damagePerc / 100);
	_totalRepairPrice = _totalRepairPrice + _otherPrice;
};

_totalRepairPrice