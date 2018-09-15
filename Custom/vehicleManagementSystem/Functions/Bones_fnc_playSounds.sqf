private ["_soundfile","_soundsourceobject","_volume","_pitch","_distance","_inside","_soundposition"];

_Path = str missionConfigFile; 
_Path = [_Path, 0, -15] call BIS_fnc_trimString;
_Path = _Path + "Custom\VehicleManagementSystem\Sounds\";

_soundfile = _path + (_this select 0);
_soundsourceobject = _this select 1;
_volume = 10;
_pitch = 1;
_distance = 30;
_inside = false;
_soundposition = getPos _soundsourceobject;
playSound3D [_soundfile, _soundsourceobject, _inside, _soundposition, _volume, _pitch, _distance];


