if (vmsDisableStockRefuel == 1) then
{
_allFuelStations = ([0,0,0] nearObjects 150000) select {getFuelCargo _x > 0};
{_x setFuelCargo 0} foreach _allFuelStations;
};