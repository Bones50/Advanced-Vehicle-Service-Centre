/*
Bones Vehicle Repair Script

Executed from Bones_fnc_salvageAndRepairMenu.sqf

Call as [_action, _vehicle, _items, _price] execVM 'Custom\vehicleService\Bones_fnc_Repair.sqf';

*/

_vehicle1 = [];
if (isNull objectParent player) then {_vehicle1 pushback cursorTarget;} else 
{
_vehicleTemp = (objectParent player);
_vehicle1 pushback (nearestObject [player, typeof _vehicleTemp]);
};
_vehicle = (_vehicle1 select 0);
_temp = _this select 0;
_actionData = call compile _temp;
_action = _actionData select 0;

if (_action == "rearmall") then
{
	private ["_cost"];
	_cost = 0;
	_cost = [] call Bones_fnc_getReloadCost;
	_exilew = player getVariable ["ExileMoney", 0];
	if (_exilew <_cost) exitWith {["ErrorTitleOnly", ["You don't have enough money!"]] call ExileClient_gui_toaster_addTemplateToast;};
	
	["Reload.ogg", _Vehicle, 30] call Bones_fnc_playSounds;
	
	_vehicle setVehicleAmmo 1;
	if(_cost > 0 && isTradeEnabled)then
	{
		takegive_poptab = [player,_cost,true];
		publicVariableServer "takegive_poptab";
	};
	[] call Bones_fnc_getReloadable;
	_playerPoptabs = _exilew - _cost;
	_poptabs = (findDisplay 9123 displayCtrl 1001);
	_poptabs ctrlSetText (format ["%1 poptabs", _playerPoptabs]);
	_rearmAll = (findDisplay 9123 displayCtrl 1605);
	_rearmAll ctrlenable false;
	_reloadValueDisplay = 0;
	_reloadCost = (findDisplay 9123 displayCtrl 1006);
	_reloadCost ctrlSetText (format ["%1 Poptabs", _reloadValueDisplay]);
	
	["SuccessTitleOnly", format ["Reload of All Items Complete, Total Cost was %1 Poptabs", _cost]] call ExileClient_gui_toaster_addTemplateToast;
};

if (_action == "repairall") then
{
	_cost = [] call Bones_fnc_getRepairableCosts;
	_exilew = player getVariable ["ExileMoney", 0];
	if (_exilew <_cost) exitWith {["ErrorTitleOnly", ["You don't have enough money!"]] call ExileClient_gui_toaster_addTemplateToast;};
	
	["Repair.ogg", _Vehicle, 30] call Bones_fnc_playSounds;

	_vehicle setdamage 0;
	if(_cost > 0 && isTradeEnabled)then
	{
		takegive_poptab = [player,_cost,true];
		publicVariableServer "takegive_poptab";
	};
	[] call Bones_fnc_getRepairable;
	_playerPoptabs = _exilew - _cost;
	_poptabs = (findDisplay 9123 displayCtrl 1001);
	_poptabs ctrlSetText (format ["%1 poptabs", _playerPoptabs]);
	_repairAll = (findDisplay 9123 displayCtrl 1604);
	_repairAll ctrlenable false;
	_repairValueDisplay = 0;
	_repairCost = (findDisplay 9123 displayCtrl 1008);
	_repairCost ctrlSetText (format ["%1 Poptabs", _repairValueDisplay]);
	
	["SuccessTitleOnly", format ["Repair of All Items Complete, Total Cost was %1 Poptabs", _cost]] call ExileClient_gui_toaster_addTemplateToast;
};

if (_action == "Repair") then

{
	_items = _actionData select 1;
	_price = _actionData select 2;

	_exilew = player getVariable ["ExileMoney", 0];
	if (_exilew <_price) exitWith {["ErrorTitleOnly", ["You don't have enough money!"]] call ExileClient_gui_toaster_addTemplateToast;};
	
	["Repair.ogg", _Vehicle, 30] call Bones_fnc_playSounds;
	
	{_vehicle setHitPointDamage [_x, 0]}forEach _items;
	
	if(_price > 0 && isTradeEnabled)then{
			takegive_poptab = [player,_price,true];
			publicVariableServer "takegive_poptab";
	};

	[] call Bones_fnc_getRepairable;
	_playerPoptabs = player getVariable ["ExileMoney", 0];
	_poptabs = (findDisplay 9123 displayCtrl 1001);
	_poptabs ctrlSetText (format ["%1 poptabs", _playerPoptabs]);
	_repairValueDisplay = [] call Bones_fnc_getRepairableCosts;
	_repairCost = (findDisplay 9123 displayCtrl 1008);
	_repairCost ctrlSetText (format ["%1 Poptabs", _repairValueDisplay]);
	if(_repairValueDisplay == 0) then
	{
	_repairAll = (findDisplay 9123 displayCtrl 1604);
	_repairAll ctrlenable false;
	};

	["SuccessTitleOnly", format ["Repair of item complete, Total Cost was %1 Poptabs", _price]] call ExileClient_gui_toaster_addTemplateToast;
};

if (_action == "Reload") then

{
	_items = _actionData select 1;
	_price = _actionData select 2;
	_turretPath = _actionData select 3;
	_bulletAmount = _actionData select 4;
	_pylonIndex = _actionData select 5;

	_exilew = player getVariable ["ExileMoney", 0];
	if (_exilew <_price) exitWith {["ErrorTitleOnly", ["You don't have enough money!"]] call ExileClient_gui_toaster_addTemplateToast;};
	
	["Reload.ogg", _Vehicle, 30] call Bones_fnc_playSounds;
	
	if (["120mm",_items] call BIS_fnc_inString || ["125mm",_items] call BIS_fnc_inString || ["105mm",_items] call BIS_fnc_inString || ["L30A1_Cannon",_items] call BIS_fnc_inString || ["2A46",_items] call BIS_fnc_inString || ["100mm",_items] call BIS_fnc_inString) then
	{
		_vehicle removeMagazinesTurret [_items, _turretPath];
		_vehicle addMagazineTurret [_items,_turretPath,_bulletAmount];
	} else
	{
		//DO THIS IF SMOKE
		if (["smoke",_items] call BIS_fnc_inString) then
		{
			_vehicle removeMagazinesTurret [_items, _turretPath];
			_vehicle removeWeaponTurret ["SmokeLauncher", _turretPath];
			_vehicle addMagazineTurret [_items,_turretPath,_bulletAmount];
			_vehicle addWeaponTurret ["SmokeLauncher", _turretPath];
		} else
		{
			//DO THIS IF CHAFF
			if (["chaff",_items] call BIS_fnc_inString) then
			{
				_vehicle removeMagazinesTurret [_items, _turretPath];
				_vehicle removeWeaponTurret ["CMFlareLauncher", _turretPath];
				_vehicle addMagazineTurret [_items,_turretPath,_bulletAmount];
				_vehicle addWeaponTurret ["CMFlareLauncher", _turretPath];
			} else
			{
				//DO THIS IF PYLON
				if (["pylon",_items] call BIS_fnc_inString) then
				{
					_vehicle setAmmoOnPylon [_pylonIndex,_bulletAmount];
				} else
				{
					//FOR EVERYTHING ELSE
					_maxMagAmmo = (configFile >> "CfgMagazines" >> _items >> "count") call BIS_fnc_getCfgData;
					_vehicle addMagazineTurret [_items, _turretPath, _bulletAmount];	
					_numMags = floor (_bulletAmount / _maxMagAmmo);
					_vehicle removeMagazinesTurret [_items, _turretPath];
					while {_numMags > 0} do
					{
						_vehicle addMagazineTurret [_items, _turretPath];
						_numMags = _numMags - 1;
					};
				};
			};
		};
	};
	
	if(_price > 0 && isTradeEnabled)then{
			takegive_poptab = [player,_price,true];
			publicVariableServer "takegive_poptab";
	};
	[] call Bones_fnc_getReloadable;
	_playerPoptabs = _exilew - _price;
	_poptabs = (findDisplay 9123 displayCtrl 1001);
	_poptabs ctrlSetText (format ["%1 poptabs", _playerPoptabs]);
	_reloadValueDisplay = []call Bones_fnc_getReloadCost;
	_reloadCost = (findDisplay 9123 displayCtrl 1006);
	_reloadCost ctrlSetText (format ["%1 Poptabs", _reloadValueDisplay]);
	if(_reloadValueDisplay == 0) then
	{
	_rearmAll = (findDisplay 9123 displayCtrl 1605);
	_rearmAll ctrlenable false;
	};
	
	["SuccessTitleOnly", format ["Reload of weapon complete, Total Cost was %2 Poptabs", _items, _price]] call ExileClient_gui_toaster_addTemplateToast;
};

if (_action == "refuel") then
{
	_maxFuelAmount = getnumber (configfile >> "cfgvehicles" >> (typeof _vehicle) >> "fuelCapacity");
	_fuelAmountTemp = fuel _vehicle;
	_fuelAmount = _fuelAmountTemp * _maxFuelAmount;
	_refillFuelAmount = round(_maxFuelAmount - _fuelAmount);
	_refuelCost = _refillFuelAmount * fuelingPrice;
	if (_refuelCost == 0) exitwith {["ErrorTitleOnly", ["You're fuel tank is already full!"]] call ExileClient_gui_toaster_addTemplateToast;};
	_exilew = player getVariable ["ExileMoney", 0];
	if (_exilew <_refuelCost) exitWith {["ErrorTitleOnly", ["You don't have enough money!"]] call ExileClient_gui_toaster_addTemplateToast;};
	_vehicle setFuel 1;
	if(_refuelCost > 0 && isTradeEnabled)then
	{
		takegive_poptab = [player,_refuelCost,true];
		publicVariableServer "takegive_poptab";
	};
	_maxFuelAmount = getnumber (configfile >> "cfgvehicles" >> (typeof _vehicle) >> "fuelCapacity");
	_fuelAmountTemp = fuel _vehicle;
	_fuelAmount = _fuelAmountTemp * _maxFuelAmount;
	_refillFuelAmount = round(_maxFuelAmount - _fuelAmount);
	_refuelCost2 = _refillFuelAmount * fuelingPrice;
	if (_refuelCost2 == 0 || enableRefuelOption == 0) then 
	{
		_reFuelButton = (findDisplay 9123 displayCtrl 1600);
		_reFuelButton ctrlenable false;
	};
	_refuelDisplay = format["%1 Poptabs", _refuelCost2];
	_reFuelButton = (findDisplay 9123 displayCtrl 1010);
	_reFuelButton ctrlSetText _refuelDisplay;
	
	["SuccessTitleOnly", format ["Refuelling Complete, Total Cost was %1 Poptabs", _refuelCost]] call ExileClient_gui_toaster_addTemplateToast;
};