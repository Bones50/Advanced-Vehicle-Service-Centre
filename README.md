# Advanced-Vehicle-Service-Centre
Updated version of the Service Centre with custom GUI.

Fetaures:
1. Full custom GUI
2. Both in vehicle and out of vehicle access to the service centre menu option (configurable)
3. New consolidated config file (configure everything in one location, from bullet cost to trigger objects!)
4. Repair takes into account how damaged the part is when calculating repair price (no more "1000 poptabs to repair 1% damage!")
5. Whole range of new config options in the config file inc. enable/disable refuelling, enable or disable default arma refueling, 6 configurable to work/not in safezones, configurable to work/not in territories, configurable to work/not if aggro'd, configurable (on/off) service point markers.
6. Repair/reload sounds
7. NEW - Disable refueling at fuel stations works on all maps with no config required.
8. NEW - Define ammo types not to be reloadable in the config file.

Install Instructions:
1. Copy the Init.sqf file into you mission file root directory or merge it with your existing one.
2. Merge the items in config.cpp into you mission config.cpp file for car and air classes (and tanks if you have them).
3. Add the line in the description.ext file to the bottom of your mission description.ext
4. Copy the Custom folder into your mission file (note the filepath must be Custom\vehicleManagementSystem).
5. Edit the vmsConfig file to suite your server.
6. Profit!

IF USING INFISTAR...
If you have UDW set to true you will need to add "9123" to the "allowedIDDs[]" array. e.g.:

/* Use IDD White-List ? */ UDW = "true";
/* allowedIDDs: Insert IDDs here to prevent them from being closed! */
allowedIDDs[] =
{
	/* default idds */
	-1,0,4,5,6,8,12,15,18,24,49,54,55,70,72,101,160,174,177,999,131,63,602,301,

	/* exile idds */
	24001,24002,20023,24005,24004,24010,24025,20021,20017,24012,24027,
	20019,20016,24007,20024,20018,24008,24011,24015,24000,24006,24014,
	20020,24026,4002,4000,4001,4003,1500,

	24033,24030,24029,24028,24031,24034,

	4004,21000,	// Bounty system and MarXet
	8457,	// http://www.exilemod.com/topic/9040-xm8-apps/
	65431,	// r3f menu fix
	6666,	// Paintshop
	0711,	// Advanced Banking
	0720,24036,	// Virtual Garage
	5501,5502,5503,5504,5505,5506,5507,	// BRAma Cookbook
	-1339,-1340,	// custom infiSTAR dialogs (some editor & a private chat menu)
  9123,   // Bones Service Point Script

	/* main idd - never delete it */
	46
};
