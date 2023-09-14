forward TruckLoadUp(playerid, vehicleid);
public TruckLoadUp(playerid, vehicleid)
{
	Logger_Debug("TruckLoadUp"); // debug juju

	if (PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] < 100)
	{
		PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] += 10;
		if (PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] > 100) PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] = 100;
		
		UpdatePlayerLoadingTruckSize(playerid);
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][9]);
		PLAYER_TEMP[playerid][py_TIMERS][9] = SetTimerEx("TruckLoadUp", 1000, false, "ii", playerid, vehicleid);
		return 1;
	}

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 1;
	UpdateVehicleParams(vehicleid);

	TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADED] = true;
	TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADING] = false;
	TRUCK_VEHICLE[vehicleid][truck_vehicle_DELIVERED] = false;

	ShowPlayerMessage(playerid, "Ve a entregar la mercancía", 7);
	SetPlayerTruckCheckpoint(playerid, vehicleid);
	return 1;
}

forward TruckUnLoadUp(playerid, vehicleid);
public TruckUnLoadUp(playerid, vehicleid)
{
	Logger_Debug("TruckUnLoadUp"); // debug juju

	if (PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] < 100)
	{
		PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] += 10;
		if (PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] > 100) PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] = 100;
		
		UpdatePlayerLoadingTruckSize(playerid);
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][9]);
		PLAYER_TEMP[playerid][py_TIMERS][9] = SetTimerEx("TruckUnLoadUp", 1000, false, "ii", playerid, vehicleid);
		return 1;
	}

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 1;
	UpdateVehicleParams(vehicleid);

	TRUCK_VEHICLE[vehicleid][truck_vehicle_UNLOADING] = false;
	TRUCK_VEHICLE[vehicleid][truck_vehicle_DELIVERED] = true;

	ShowPlayerMessage(playerid, "Vuelve a la ~y~estación", 7);
	SetPlayerTruckCheckpoint(playerid, vehicleid);
	return 1;
}
