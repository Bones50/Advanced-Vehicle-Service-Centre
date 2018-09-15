_worldSize = if (isNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize")) then {getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize");} else {8192;};
_middle = _worldSize / 2;
vmsservicePoints = nearestObjects [[_middle, _middle], buildingObjects, _worldSize];

{
_pos = getPos _x;
_vmsActive = ["locCall", _pos] call Bones_fnc_vmsChecks;
if (_vmsActive) then 
{
	_trg = createTrigger ["EmptyDetector", _pos, false];
	_trg setTriggerArea [vmsRange, vmsRange, 0, false];
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trg setTriggerStatements
	[
	   "vehicle player in thisList",
	   "if (enableServicePoint == 1) then
	   {
		   ['InfoTitleOnly', ['You are in range of a Vehicle Service Point']] call ExileClient_gui_toaster_addTemplateToast;
	   };
	   ",
	   "
	   if (enableServicePoint == 1) then
	   {
		   ['InfoTitleOnly', ['You have left range of the Vehicle Service Point']] call ExileClient_gui_toaster_addTemplateToast;
		};
	   "
	];
};
} forEach vmsservicePoints;
{
_pos = getPos _x;
_vmsActive = ["locCall", _pos] call Bones_fnc_vmsChecks;
if (_vmsActive) then 
{
	_trg = createTrigger ["EmptyDetector", _pos, false];
	_trg setTriggerArea [vmsRange, vmsRange, 0, false];
	_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
	_trg setTriggerStatements
	[
		"this",
		"
				thisTrigger setVariable ['_vehicleAction', (objectParent player) addAction ['Vehicle Service Point', 'Custom\vehicleManagementSystem\GUI\Bones_fnc_showServicePointDialogue.sqf',objectParent player,1.5,false,true,'','(speed (objectParent player) < 1) and (speed (objectParent player) > -1) and enableServicePoint == 1 and inVehicleVMSAccess == 1 and player != vehicle player']];
	   ",
	   "
		(objectParent player) removeAction (thisTrigger getVariable ['_vehicleAction', -1]);
	   "
	];
};
} forEach vmsservicePoints;

