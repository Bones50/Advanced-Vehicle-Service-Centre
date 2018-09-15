_activate = true;
_callData = _this;
_checkType = _callData select 0;
_pos = _callData select 1;

if (_checkType == "locCall") then
{

	if (vmsSafeZoneCheck == 1) then
	{
		_traderZoneList = [];
		{
			_markername = _x;
			_markerType = getMarkerType _x;
			if (_markerType == "ExileTraderZone") then {_traderZoneList pushback _markerName;};
		}forEach AllMapMarkers;
		
		{
			_position = getMarkerPos _x;
			_radius = getMarkerSize _x;
			_radius1 = _radius select 0;
			if ((_pos distance _position) <= _radius1) then {_activate = false;};
		}forEach _traderZoneList;
	};
	
	if (vmsTerritoryCheck == 1) then
	{
		_worldSize = if (isNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize")) then {getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");} else {8192;};
		_middle = _worldSize / 2;
		_territories = nearestObjects [[_middle, _middle], ["Exile_Construction_Flag_Static"], _worldSize];
		
		{
			_position = getPos _x;
			if ((_pos distance _position) <= vmsTerritoryCheckRange) then {_activate = false;};
		}forEach _territories;
	};
};

if (_checkType == "playerCall") then
{
	_vehicle1 = [];
	if (isNull objectParent player) then {_vehicle1 pushback cursorTarget;} else 
	{
	_vehicleTemp = (objectParent player);
	_vehicle1 pushback (nearestObject [player, typeof _vehicleTemp]);
	};
	_vehicle = (_vehicle1 select 0);

	if (isNull objectParent player) then
	{
		if (vmsSafeZoneCheck == 1) then
		{
			if (ExilePlayerInSafezone) then {_activate = false;};
		};
		
		if (vmsTerritoryCheck == 1) then
		{
			_worldSize = if (isNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize")) then {getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");} else {8192;};
			_middle = _worldSize / 2;
			_territories = nearestObjects [[_middle, _middle], ["Exile_Construction_Flag_Static"], _worldSize];
			
			{
				_position = getPos _x;
				if (((position player) distance _position) <= vmsTerritoryCheckRange) then {_activate = false;};
			}forEach _territories;
		};
	
		_damage = damage _vehicle;
		if (_damage == 1) then 
		{
			_activate = false;
		};
	};
};

_activate