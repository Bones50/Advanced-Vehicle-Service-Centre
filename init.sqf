Bones_fnc_playSounds = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\Functions\Bones_fnc_playSounds.sqf");
Bones_fnc_showServicePointDialogue = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\GUI\Bones_fnc_showServicePointDialogue.sqf");
Bones_fnc_getVehicleLoadout = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\Functions\Bones_fnc_getVehicleLoadout.sqf");
Bones_fnc_getReloadable = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\Functions\Bones_fnc_getReloadable.sqf");
Bones_fnc_performAction = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\Functions\Bones_fnc_performAction.sqf");
Bones_fnc_getReloadCost = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\Functions\Bones_fnc_getReloadCost.sqf");
Bones_fnc_getRepairable = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\Functions\Bones_fnc_getRepairable.sqf");
Bones_fnc_getRepairableCosts = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\Functions\Bones_fnc_getRepairableCosts.sqf");
Bones_fnc_vmsChecks = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\Functions\Bones_fnc_vmsChecks.sqf");
vmsConfig = compileFinal (preprocessFileLineNumbers "Custom\vehicleManagementSystem\vmsConfig.sqf");
[] call vmsConfig;
[] execVM "Custom\vehicleManagementSystem\Functions\takegive_poptab_init.sqf";
[] execVM "Custom\vehicleManagementSystem\Functions\Bones_fnc_markServicePoints.sqf";
if (!isServer)  then 
{
[] execVM "Custom\vehicleManagementSystem\functions\Bones_fnc_vspInRange.sqf";
[] execVM "Custom\vehicleManagementSystem\functions\Bones_fnc_disableDefaultRefuel.sqf";
};