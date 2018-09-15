private ["_worldSizeTemp", "_worldSize", "_middle", "_servicePoints", "_markerstr"];

if(vmsMarkers == 1) then 
{
	_worldSizeTemp = if (isNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize")) then {getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");} else {8192;};
	_worldsize = _worldsizeTemp + 1000;
	_middle = _worldSize / 2;
	_servicePoints = nearestObjects [[_middle, _middle], buildingObjects, _worldSize];
	_id = 0;
	{
	_pos = getPos _x;
	_vmsActive = ["locCall", _pos] call Bones_fnc_vmsChecks;
	if (_vmsActive) then
	{
		_markerstr = createMarker [format ["Vehicle Service Centre %1", _id], getPos _x];
		_markerstr setMarkerShape "ICON";
		_markerstr setMarkerType "respawn_unknown";
		_id = _id +1;
	};
	} forEach _servicePoints;
};