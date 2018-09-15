
class CfgInteractionMenus
{
	class Car 
	{
		targetType = 2;
		target = "Car";

		class Actions 
		{
			class ServicePointRepair: ExileAbstractAction
			{
				title = "Access Vehicle Service Point";
				condition = "(count (nearestObjects [(getPos player), buildingObjects ,vmsRange]) >0) && (enableServicePoint == 1) && ['playerCall', getPos player] Call Bones_fnc_vmsChecks";
				action = "_this call Bones_fnc_showServicePointDialogue";
			};
		};
	};

	class Air
	{
		target = "Air";
		targetType = 2;

		class Actions
		{
			class ServicePointRepair: ExileAbstractAction
			{
				title = "Access Vehicle Service Point";
				condition = "(count (nearestObjects [(getPos player), buildingObjects ,vmsRange]) >0) && (enableServicePoint == 1) && ['playerCall', getPos player] Call Bones_fnc_vmsChecks";
				action = "_this call Bones_fnc_showServicePointDialogue";
			};
		};
	};
};
