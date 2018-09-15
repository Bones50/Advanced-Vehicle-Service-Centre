private ["_vehicle", "_allHitpoints", "_hitpointNames", "_totalRepairList", "_totalSalvageList", "_wheelRepairList", "_wheelSalvageList", "_tempLabel", "_noWheels", "_tempExpression", "_tempMenu", "_wheelPrice", "_valueType", "_ctrl"];

_valueType = vmsCostType; // type of cost
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
_allWheelPrice = 0;
_allGlassPrice = 0;
_repairlist =[];
_crtl = (findDisplay 9123 displayCtrl 1500);
lbClear _crtl;
_action = "Repair";

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
	_wheelPriceThis = 0;
	_repairData = [];
	_tempLabel = _x;
	_noWheels = getnumber (configfile >> "cfgvehicles" >> (typeof _vehicle) >> "numberPhysicalWheels");
	_damage = _vehicle getHitPointDamage _x;
	_damagePerc = round(_damage * 100);
	_wheelPriceThis = round(_wheelPrice * (_damagePerc / 100));
	if (_noWheels == 8) then 
		{
			if (_x == "HitRFWheel") then {_tempLabel = format ["Repair Right Front Wheel (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitRF2Wheel") then {_tempLabel = format ["Repair Right Front Wheel 2 (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitRMWheel") then {_tempLabel = format ["Repair Right Rear Wheel 2 (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitRBWheel") then {_tempLabel = format ["Repair Right Rear Wheel (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitLFWheel") then {_tempLabel = format ["Repair Left Front Wheel (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitLF2Wheel") then {_tempLabel = format ["Repair Left Front Wheel 2 (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitLMWheel") then {_tempLabel = format ["Repair Left Rear Wheel 2 (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitLBWheel") then {_tempLabel = format ["Repair Left Rear Wheel (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
		};

	if (_noWheels == 4) then 
		{
			if (_x == "HitRFWheel") then {_tempLabel = format ["Repair Right Front Wheel (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitRF2Wheel") then {_tempLabel = format ["Repair Right Rear Wheel (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitLFWheel") then {_tempLabel = format ["Repair Left Front Wheel (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitLF2Wheel") then {_tempLabel = format ["Repair Left Rear Wheel (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitRMWheel") then {_tempLabel = "error"};
			if (_x == "HitLMWheel") then {_tempLabel = "error"};
			if (_x == "HitLBWheel") then {_tempLabel = "error"};
			if (_x == "HitRBWheel") then {_tempLabel = "error"};
		};

	if (_noWheels == 6) then 
		{
			if (_x == "HitRFWheel") then {_tempLabel = format ["Repair Right Front Wheel (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitRF2Wheel") then {_tempLabel = format ["Repair Right Middle Wheel (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitRMWheel") then {_tempLabel = format ["Repair Right Rear Wheel (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitLFWheel") then {_tempLabel = format ["Repair Left Front Wheel (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitLF2Wheel") then {_tempLabel = format ["Repair Left Middle Wheel (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitLMWheel") then {_tempLabel = format ["Repair Left Rear Wheel (%1%2 damage) - %3 %4", _damagePerc, "%", _wheelPriceThis, _valueType]};
			if (_x == "HitLBWheel") then {_tempLabel = "error"};
			if (_x == "HitRBWheel") then {_tempLabel = "error"};
		};
	if !(_tempLabel == "error") then
		{
			_repairData pushback _action;
			_repairData pushback [_x];
			_repairData pushback _wheelPriceThis;
			_strRepairData = str _repairData;
			_index = _crtl lbAdd _tempLabel;
			_crtl lbSetData [_index, _strRepairData];
			_repairlist pushback _x;
			_totalRepairPrice = _totalRepairPrice + _wheelPriceThis;
			_allWheelPrice = _allWheelPrice + _wheelPriceThis;
		};

} forEach _wheelRepairList;

//////////Main Rotor Menu

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

//Main rotor Repair Menu
_mainRotorPrice = 0;
{
_rotorPriceTemp = (getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price"));
_mainRotorPrice = _mainRotorPrice + _rotorPriceTemp;
} forEach vmsmainRotorRepairItems;

{
	_repairData = [];
	_tempLabel = _x;
	_damage = _vehicle getHitPointDamage _x;
	_damagePerc = round(_damage * 100);
	_mainRotorPrice = round(_mainRotorPrice * _damage);
	if (_x == "HitHRotor") then {_tempLabel = format ["Repair Main Rotor (%1%2 damage) - %3 %4", _damagePerc, "%", _mainRotorPrice, _valueType]};
	if !(_tempLabel == "error") then
		{
			_repairData pushback _action;
			_repairData pushback [_x];
			_repairData pushback _mainRotorPrice;
			_strRepairData = str _repairData;
			_index = _crtl lbAdd _tempLabel;
			_crtl lbSetData [_index, _strRepairData];
			_repairlist pushback _x;
			_totalRepairPrice = _totalRepairPrice + _mainRotorPrice;
		};
		
} forEach _mainRotorRepairList;

//////////Tail Rotor Menu

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

//Tail rotor Repair Menu
_tailRotorPrice = 0;
{
_rotorPriceTemp = (getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price"));
_tailRotorPrice = _tailRotorPrice + _rotorPriceTemp;
} forEach vmstailRotorRepairItems;
{
	_repairData = [];
	_tempLabel = _x;
	_damage = _vehicle getHitPointDamage _x;
	_damagePerc = round(_damage * 100);
	_tailRotorPrice = round(_tailRotorPrice * _damage);
	if (_x == "HitVRotor") then {_tempLabel = format ["Repair Tail Rotor (%1%2 damage) - %3 %4", _damagePerc, "%", _tailRotorPrice, _valueType]};
	if !(_tempLabel == "error") then
		{
			_repairData pushback _action;
			_repairData pushback [_x];
			_repairData pushback _tailRotorPrice;
			_strRepairData = str _repairData;
			_index = _crtl lbAdd _tempLabel;
			_crtl lbSetData [_index, _strRepairData];
			_repairlist pushback _x;
			_totalRepairPrice = _totalRepairPrice + _tailRotorPrice;
		};
		
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
	_glassPriceThis = 0;
	_repairData = [];
	_tempLabel = _x;
	_damage = _vehicle getHitPointDamage _x;
	_damagePerc = round(_damage * 100);
	_glassPriceThis = round(_glassPrice * (_damagePerc / 100));
	if (_x == "HitGlass1") then {_tempLabel = format ["Repair Window 1 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass1A") then {_tempLabel = format ["Repair Window 1a (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass1B") then {_tempLabel = format ["Repair Window 1b (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass2") then {_tempLabel = format ["Repair Window 2 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass3") then {_tempLabel = format ["Repair Window 3 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass4") then {_tempLabel = format ["Repair Window 4 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass5") then {_tempLabel = format ["Repair Window 5 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass6") then {_tempLabel = format ["Repair Window 6 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass7") then {_tempLabel = format ["Repair Window 7 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass8") then {_tempLabel = format ["Repair Window 8 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass9") then {_tempLabel = format ["Repair Window 9 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass10") then {_tempLabel = format ["Repair Window 10 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass11") then {_tempLabel = format ["Repair Window 11 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass12") then {_tempLabel = format ["Repair Window 12 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass13") then {_tempLabel = format ["Repair Window 13 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass14") then {_tempLabel = format ["Repair Window 14 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass15") then {_tempLabel = format ["Repair Window 15 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass16") then {_tempLabel = format ["Repair Window 16 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitGlass17") then {_tempLabel = format ["Repair Window 17 (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitRGlass") then {_tempLabel = format ["Repair Window Right (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if (_x == "HitLGlass") then {_tempLabel = format ["Repair Window Left (%1%2 damage) - %3 %4", _damagePerc, "%", _glassPriceThis, _valueType]};
	if !(_tempLabel == "error") then
		{
			_repairData pushback _action;
			_repairData pushback [_x];
			_repairData pushback _glassPriceThis;
			_strRepairData = str _repairData;
			_index = _crtl lbAdd _tempLabel;
			_crtl lbSetData [_index, _strRepairData];
			_repairlist pushback _x;
			_totalRepairPrice = _totalRepairPrice + _glassPriceThis;
		};
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
	_enginePriceThis = 0;
	_repairData = [];
	_tempLabel = _x;
	_damage = _vehicle getHitPointDamage _x;
	_damagePerc = round(_damage * 100);
	_enginePriceThis = round(_enginePrice * (_damagePerc / 100));
	if (_x == "HitEngine") then {_tempLabel = format ["Repair Engine (%1%2 damage) - %3 %4", _damagePerc, "%", _enginePriceThis, _valueType]};
	if (_x == "HitEngine1") then {_tempLabel = format ["Repair Engine 1 (%1%2 damage) - %3 %4", _damagePerc, "%", _enginePriceThis, _valueType]};
	if (_x == "HitEngine2") then {_tempLabel = format ["Repair Engine 2 (%1%2 damage) - %3 %4", _damagePerc, "%", _enginePriceThis, _valueType]};
	if (_x == "HitEngine3") then {_tempLabel = format ["Repair Engine 3 (%1%2 damage) - %3 %4", _damagePerc, "%", _enginePriceThis, _valueType]};
	if !(_tempLabel == "error") then
		{
			_repairData pushback _action;
			_repairData pushback [_x];
			_repairData pushback _enginePriceThis;
			_strRepairData = str _repairData;
			_index = _crtl lbAdd _tempLabel;
			_crtl lbSetData [_index, _strRepairData];
			_repairlist pushback _x;
			_totalRepairPrice = _totalRepairPrice + _enginePriceThis;
		};
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
	_repairData = [];
	_tempLabel = _x;
	_damage = _vehicle getHitPointDamage _x;
	_damagePerc = round(_damage * 100);
	_fuelPrice = round(_fuelPrice * (_damagePerc / 100));
	if (_x == "HitFuel") then {_tempLabel = format ["Repair Fuel Tank (%1%2 damage) - %3 %4", _damagePerc, "%", _fuelPrice, _valueType]};
	if !(_tempLabel == "error") then
		{
			_repairData pushback _action;
			_repairData pushback [_x];
			_repairData pushback _fuelPrice;
			_strRepairData = str _repairData;
			_index = _crtl lbAdd _tempLabel;
			_crtl lbSetData [_index, _strRepairData];
			_repairlist pushback _x;
			_totalRepairPrice = _totalRepairPrice + _fuelPrice;
		};
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

if (_overallDamage > 0) then
{
	_otherPrice = 0;
	_repairData = [];
	{
		_otherPriceTemp = (getNumber (missionConfigFile >> "CfgExileArsenal" >> _x >> "price"));
		_otherPrice = _otherPrice + _otherPriceTemp;
	} forEach vmsotherRepairItems;
	
	_damagePerc = round(_overallDamage / _damagePool * 100);
	_otherPrice = _otherPrice * (_damagePerc / 100);
	_tempLabel = format ["Repair Hull (%1%2 damage) - %3 %4", _damagePerc, "%", _otherPrice, _valueType];
	_repairData pushback _action;
	_repairData pushback _otherDamageItems;
	_repairData pushback _otherPrice;
	_strRepairData = str _repairData;
	_index = _crtl lbAdd _tempLabel;
	_crtl lbSetData [_index, _strRepairData];
	_repairlist pushback _otherDamageItems;
	_totalRepairPrice = _totalRepairPrice + _otherPrice;
};
if (count _repairlist == 0) then
{
_crtl lbAdd "Nothing to Repair... Go get shot at by something!";
};