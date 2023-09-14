
CheckAmbulance(playerid)
{
	if (PLAYER_WORKS[playerid][WORK_MEDIC] && PLAYER_TEMP[playerid][py_WORKING_IN] == WORK_MEDIC && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		new vehicleid = INVALID_VEHICLE_ID;
		vehicleid = GetPlayerCameraTargetVehicle(playerid);

		if (vehicleid == INVALID_VEHICLE_ID) return 0;
		if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] == 416)
		{
			if ((gettime() - PLAYER_TEMP[playerid][py_LIMIT_AMBULANCE]) < 60) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 60 segundos para volver a hacer esto.", 3);

			SetTimerEx("GetAmbulanceItem", 2100, false, "ii", playerid, vehicleid);

			new doors[4];
			GetVehicleParamsCarDoors(vehicleid, doors[0], doors[1], doors[2], doors[3]);
			SetVehicleParamsCarDoors(vehicleid, doors[0], doors[1], 1, 1);

			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 2000, true);

			PLAYER_TEMP[playerid][py_LIMIT_AMBULANCE] = gettime();
		}
	}
	return 1;
}