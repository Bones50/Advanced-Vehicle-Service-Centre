#include "CustomControlClasses.hpp"
class Bones_Service_Point
{
	idd = 9123;
	movingEnable = false;
	
	class ControlsBackground
	{
		class vms_subselectframe
		{
			type = 0;
			idc = 1011;
			x = safeZoneX + safeZoneW * 0.29875;
			y = safeZoneY + safeZoneH * 0.33666667;
			w = safeZoneW * 0.254375;
			h = safeZoneH * 0.38333334;
			style = 64;
			text = "Repair or Reload Individual Items....";
			colorBackground[] = {0.8,0.9373,0.1176,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = .05;
			
		};
		class vms_mainFrame
		{
			type = 0;
			idc = 1003;
			x = safeZoneX + safeZoneW * 0.28375;
			y = safeZoneY + safeZoneH * 0.21777778;
			w = safeZoneW * 0.431875;
			h = safeZoneH * 0.57222223;
			style = 64;
			text = "Service Centre | AeoniumGaming";
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaSemiBold";
			sizeEx = 0.1;
			
		};
		
	};
	class Controls
	{
		class vms_leftList
		{
			type = 5;
			idc = 1500;
			x = safeZoneX + safeZoneW * 0.308125;
			y = safeZoneY + safeZoneH * 0.38111112;
			w = safeZoneW * 0.2375;
			h = safeZoneH * 0.31888889;
			style = 16;
			colorBackground[] = {0.702,0.702,0.702,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			onLBDblClick = "[(_this select 0) lbData (_this select 1)] spawn bones_fnc_performAction";
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class vms_rearmButton
		{
			type = 1;
			idc = 1603;
			x = safeZoneX + safeZoneW * 0.29875;
			y = safeZoneY + safeZoneH * 0.29333334;
			w = safeZoneW * 0.1225;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Reload Options";
			borderSize = 0;
			colorBackground[] = {0.949,0.949,0.949,1};
			colorBackgroundActive[] = {0.302,0.502,0.302,1};
			colorBackgroundDisabled[] = {0.702,0.702,0.702,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.902,0.902,0.902,1};
			colorFocused[] = {0.702,0.702,0.702,1};
			colorShadow[] = {0.302,0.302,0.302,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0;
			offsetY = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[player] spawn bones_fnc_getReloadable";
			
		};
		class vms_repairButton
		{
			type = 1;
			idc = 1602;
			x = safeZoneX + safeZoneW * 0.4325;
			y = safeZoneY + safeZoneH * 0.29333334;
			w = safeZoneW * 0.1225;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Repair Options";
			borderSize = 0;
			colorBackground[] = {0.949,0.949,0.949,1};
			colorBackgroundActive[] = {0.302,0.502,0.302,1};
			colorBackgroundDisabled[] = {0.702,0.702,0.702,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.902,0.902,0.902,1};
			colorFocused[] = {0.702,0.702,0.702,1};
			colorShadow[] = {0.302,0.302,0.302,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0;
			offsetY = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[] spawn bones_fnc_getRepairable";
			
		};
		class vms_exitButton
		{
			type = 1;
			idc = 1601;
			x = safeZoneX + safeZoneW * 0.293125;
			y = safeZoneY + safeZoneH * 0.72888889;
			w = safeZoneW * 0.415625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Exit Service Centre";
			borderSize = 0;
			colorBackground[] = {0.949,0.949,0.949,1};
			colorBackgroundActive[] = {0.302,0.502,0.302,1};
			colorBackgroundDisabled[] = {0.502,0.502,0.502,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.6,0.6,0.6,1};
			colorFocused[] = {0.502,0.502,0.502,1};
			colorShadow[] = {0.4,0.4,0.4,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0;
			offsetY = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "closeDialog 0";
			
		};
		class vms_refuelCost
		{
			type = 0;
			idc = 1010;
			x = safeZoneX + safeZoneW * 0.56625;
			y = safeZoneY + safeZoneH * 0.54;
			w = safeZoneW * 0.145625;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "XX Poptabs";
			colorBackground[] = {0.6627,0.3294,0.8941,0};
			colorText[] = {0.902,0.902,0.302,1};
			font = "PuristaSemiBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class vms_refuelCostLabel
		{
			type = 0;
			idc = 1009;
			x = safeZoneX + safeZoneW * 0.56625;
			y = safeZoneY + safeZoneH * 0.51444445;
			w = safeZoneW * 0.145625;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "Refuel Cost:";
			colorBackground[] = {0.6627,0.3294,0.8941,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class vms_poptabs
		{
			type = 0;
			idc = 1001;
			x = safeZoneX + safeZoneW * 0.56625;
			y = safeZoneY + safeZoneH * 0.3;
			w = safeZoneW * 0.145625;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "XX Poptabs";
			colorBackground[] = {0.6627,0.3294,0.8941,0};
			colorText[] = {0.902,0.902,0.302,1};
			font = "PuristaSemiBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class vms_poptabsLabel
		{
			type = 0;
			idc = 1000;
			x = safeZoneX + safeZoneW * 0.56625;
			y = safeZoneY + safeZoneH * 0.27555556;
			w = safeZoneW * 0.125625;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "Current Poptabs:";
			colorBackground[] = {0.6627,0.3294,0.8941,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class vms_refuelButton
		{
			type = 1;
			idc = 1600;
			x = safeZoneX + safeZoneW * 0.563125;
			y = safeZoneY + safeZoneH * 0.67333334;
			w = safeZoneW * 0.145625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Refuel";
			borderSize = 0;
			colorBackground[] = {0.949,0.949,0.949,1};
			colorBackgroundActive[] = {0.302,0.502,0.302,1};
			colorBackgroundDisabled[] = {0.502,0.502,0.502,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.6,0.6,0.6,1};
			colorFocused[] = {0.502,0.502,0.502,1};
			colorShadow[] = {0.4,0.4,0.4,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0;
			offsetY = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "['[''refuel'']'] spawn bones_fnc_performAction";
			
		};
		class vms_vehicleLabel
		{
			type = 0;
			idc = 1002;
			x = safeZoneX + safeZoneW * 0.56625;
			y = safeZoneY + safeZoneH * 0.33555556;
			w = safeZoneW * 0.125625;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "Current Vehicle:";
			colorBackground[] = {0.6627,0.3294,0.8941,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class vms_vehicle
		{
			type = 0;
			idc = 1004;
			x = safeZoneX + safeZoneW * 0.56625;
			y = safeZoneY + safeZoneH * 0.36;
			w = safeZoneW * 0.145625;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "Waiting";
			colorBackground[] = {0.6627,0.3294,0.8941,0};
			colorText[] = {0.902,0.902,0.302,1};
			font = "PuristaSemiBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class vms_repairAllButton
		{
			type = 1;
			idc = 1604;
			x = safeZoneX + safeZoneW * 0.563125;
			y = safeZoneY + safeZoneH * 0.62333334;
			w = safeZoneW * 0.145625;
			h = safeZoneH * 0.03666667;
			style = 0+2;
			text = "Repair All";
			borderSize = 0;
			colorBackground[] = {0.949,0.949,0.949,1};
			colorBackgroundActive[] = {0.302,0.502,0.302,1};
			colorBackgroundDisabled[] = {0.502,0.502,0.502,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.6,0.6,0.6,1};
			colorFocused[] = {0.502,0.502,0.502,1};
			colorShadow[] = {0.4,0.4,0.4,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0;
			offsetY = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "['[''repairall'']'] spawn bones_fnc_performAction";
			
		};
		class vms_reloadAllLabel
		{
			type = 0;
			idc = 1005;
			x = safeZoneX + safeZoneW * 0.56625;
			y = safeZoneY + safeZoneH * 0.39555556;
			w = safeZoneW * 0.145625;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "Total Reload Cost:";
			colorBackground[] = {0.6627,0.3294,0.8941,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class vms_reloadAllCost
		{
			type = 0;
			idc = 1006;
			x = safeZoneX + safeZoneW * 0.56625;
			y = safeZoneY + safeZoneH * 0.42;
			w = safeZoneW * 0.145625;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "Select Option..";
			colorBackground[] = {0.6627,0.3294,0.8941,0};
			colorText[] = {0.902,0.902,0.302,1};
			font = "PuristaSemiBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class vms_rearmCostLabel
		{
			type = 0;
			idc = 1007;
			x = safeZoneX + safeZoneW * 0.56625;
			y = safeZoneY + safeZoneH * 0.45555556;
			w = safeZoneW * 0.145625;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "Total Repair Cost:";
			colorBackground[] = {0.6627,0.3294,0.8941,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class vms_rearmCost
		{
			type = 0;
			idc = 1008;
			x = safeZoneX + safeZoneW * 0.56625;
			y = safeZoneY + safeZoneH * 0.48;
			w = safeZoneW * 0.145625;
			h = safeZoneH * 0.02777778;
			style = 0;
			text = "XX Poptabs";
			colorBackground[] = {0.6627,0.3294,0.8941,0};
			colorText[] = {0.902,0.902,0.302,1};
			font = "PuristaSemiBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		
	};
	
};
