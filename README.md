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
3. Copy the Custom folder into your mission file (note the filepath must be Custom\vehicleManagementSystem).
4. Edit the vmsConfig file to suite your server.
5. Profit!

