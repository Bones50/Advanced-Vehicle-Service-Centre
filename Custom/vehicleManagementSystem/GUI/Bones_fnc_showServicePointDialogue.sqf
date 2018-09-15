if (ExileClientPlayerIsInCombat && vmsAggroCheck == 1) exitwith {["ErrorTitleOnly", ["You are in Combat! Wait and try again later."]] call ExileClient_gui_toaster_addTemplateToast;};

disableSerialization;

_vehicle = _this select 0;
if !(isNull objectParent player) then {_vehicle = objectParent player};

_rearmOptions = ["Select the repair or rearm option button...."];

createDialog "Bones_Service_Point";

waitUntil {!isNull (findDisplay 9123);};

_ctrl = (findDisplay 9123 displayCtrl 1500);

{
	_ctrl lbAdd _x;
} forEach _rearmOptions;

_playerPoptabs = player getVariable ["ExileMoney", 0];
_poptabs = (findDisplay 9123 displayCtrl 1001);
_poptabs ctrlSetText (format ["%1 poptabs", _playerPoptabs]);

_vehicleDisplay = gettext (configfile >> "CfgVehicles" >> typeof _vehicle >> "displayName");
_vehicleType = (findDisplay 9123 displayCtrl 1004);
_vehicleType ctrlSetText _vehicleDisplay;

_reloadValueDisplay = []call Bones_fnc_getReloadCost;
_reloadCost = (findDisplay 9123 displayCtrl 1006);
_reloadCost ctrlSetText (format ["%1 Poptabs", _reloadValueDisplay]);
if(_reloadValueDisplay == 0) then
{
_rearmAll = (findDisplay 9123 displayCtrl 1605);
_rearmAll ctrlenable false;
};

_repairValueDisplay = [] call Bones_fnc_getRepairableCosts;
_repairCost = (findDisplay 9123 displayCtrl 1008);
_repairCost ctrlSetText (format ["%1 Poptabs", _repairValueDisplay]);
if(_repairValueDisplay == 0) then
{
_repairAll = (findDisplay 9123 displayCtrl 1604);
_repairAll ctrlenable false;
};

_maxFuelAmount = getnumber (configfile >> "cfgvehicles" >> (typeof _vehicle) >> "fuelCapacity");
_fuelAmountTemp = fuel _vehicle;
_fuelAmount = _fuelAmountTemp * _maxFuelAmount;
_refillFuelAmount = round(_maxFuelAmount - _fuelAmount);
_refuelCost = _refillFuelAmount * fuelingPrice;
if (_refuelCost == 0 || enableRefuelOption == 0) then 
{
	_reFuelButton = (findDisplay 9123 displayCtrl 1600);
	_reFuelButton ctrlenable false;
};
_refuelDisplay = format["%1 Poptabs", _refuelCost];
_reFuelButton = (findDisplay 9123 displayCtrl 1010);
_reFuelButton ctrlSetText _refuelDisplay;
