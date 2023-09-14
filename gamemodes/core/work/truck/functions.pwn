CheckTruckPointAndLoad(playerid)
{
	if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 0;
	if (!PLAYER_WORKS[playerid][WORK_TRUCK]) return 0;
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_TRUCK) return 0;

	new vehicleid = GetPlayerVehicleID(playerid);
	if (!WORK_VEHICLES[vehicleid][work_vehicle_VALID]) return 0;
	if (WORK_VEHICLES[vehicleid][work_vehicle_WORK] != WORK_TRUCK) return 0;

	for(new i = 0; i != sizeof LoadTrucksPoints; i ++)
	{
		if (IsPlayerInRangeOfPoint(playerid, 3.0, LoadTrucksPoints[i][0], LoadTrucksPoints[i][1], LoadTrucksPoints[i][2]))
		{
			if (TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADED]) return ShowPlayerMessage(playerid, "~r~El camión ya está cargado.", 3);
			if (TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADING]) return ShowPlayerMessage(playerid, "~r~El camión ya se está cargando.", 3);

			TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADING] = true;
			TRUCK_VEHICLE[vehicleid][truck_vehicle_DRIVER_USER_ID] = ACCOUNT_INFO[playerid][ac_ID];

			SetVehicleVelocity(vehicleid, 0.0, 0.0, 0.0);

			GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 0;
			UpdateVehicleParams(vehicleid);

			ShowPlayerMessage(playerid, "Usa ~r~ESPACIO~w~ para seleccionar y ~r~ENTER~w~ para salir~n~y ~r~ARRIBA~w~ o ~r~ABAJO~w~ para mover.", 10);

			ShowPlayerMenu(playerid, TRUCKRECOS, "Cargamentos");
			for(new x = 0; x != sizeof Truck_Contents; x ++)
			{
				new line_str[105], paga_str[105];
				format(line_str, sizeof line_str, "%s", TextToSpanish(Truck_Contents[x][truck_content_NAME]));
				format(paga_str, sizeof paga_str, "Paga: %s$ - Distancia: %.2f Km", number_format_thousand(Truck_Contents[x][truck_content_MONEY]), (GetPlayerDistanceFromPoint(playerid, Truck_Contents[x][truck_content_X], Truck_Contents[x][truck_content_Y], Truck_Contents[x][truck_content_Z]) * 0.01));
				AddPlayerMenuItem(playerid, line_str, paga_str);
			}
			return 1;
		}
	}
	return 1;
}

ResetTruckInfo(vehicleid)
{
	new tmp_TRUCK_VEHICLE[TRUCK_VEHICLE_Info]; TRUCK_VEHICLE[vehicleid] = tmp_TRUCK_VEHICLE;
	return 1;
}

SetPlayerTruckCheckpoint(playerid, vehicleid)
{
	if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]))
	{
		DestroyDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]);
		PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT] = INVALID_STREAMER_ID;
    	CancelTracing(playerid);
	}

	if (TRUCK_VEHICLE[vehicleid][truck_vehicle_DELIVERED])
	{
		PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT] = CreateDynamicCP(2509.596923, -2628.955078, 13.645235, 5.0, 0, 0, playerid, 9999999999.0);
		StartTracing(playerid, 2509.596923, -2628.955078, 13.645235);

		new info[1];
		info[0] = CHECKPOINT_TYPE_FINISH_TRUCK;
		Streamer_SetArrayData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT], E_STREAMER_EXTRA_ID, info);
	}
	else
	{

		PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT] = CreateDynamicCP(Truck_Contents[ TRUCK_VEHICLE[vehicleid][truck_vehicle_POINT] ][truck_content_X], Truck_Contents[ TRUCK_VEHICLE[vehicleid][truck_vehicle_POINT] ][truck_content_Y], Truck_Contents[ TRUCK_VEHICLE[vehicleid][truck_vehicle_POINT] ][truck_content_Z], 5.0, 0, 0, playerid, 9999999999.0);
		StartTracing(playerid, Truck_Contents[ TRUCK_VEHICLE[vehicleid][truck_vehicle_POINT] ][truck_content_X], Truck_Contents[ TRUCK_VEHICLE[vehicleid][truck_vehicle_POINT] ][truck_content_Y], Truck_Contents[ TRUCK_VEHICLE[vehicleid][truck_vehicle_POINT] ][truck_content_Z]);

		new info[1];
		info[0] = CHECKPOINT_TYPE_UNLOAD_TRUCK;
		Streamer_SetArrayData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT], E_STREAMER_EXTRA_ID, info);
	}
	return 1;
}

UpdatePlayerLoadingTruckSize(playerid)
{
	new str_text[64];
	format(str_text, sizeof(str_text), "Preparando camión ~g~%d%", PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] + minrand(1, 8));
	ShowPlayerMessage(playerid, str_text, 2);

	if (PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] > 99)
	{
		ShowPlayerMessage(playerid, "Preparando camión ~g~100%", 2);
	}
	return 1;
}