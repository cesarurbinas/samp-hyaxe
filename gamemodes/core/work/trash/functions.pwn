CreateTrashCheckpoint(route, modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if (route >= MAX_ROUTES) return printf("---> Límite superado en array 'TRASH_OBJECTS, route' en la función 'CreateTrashCheckpoint'.");
	if (!TRASH_OBJECTS[route][trash_route_VALID]) TRASH_OBJECTS[route][trash_route_VALID] = true;
	if (TRASH_OBJECTS[route][trash_route_OBJECTS] >= MAX_OBJECTS_PER_ROUTE) return printf("---> Límite superado en array 'TRASH_OBJECTS, objects' en la función 'CreateTrashCheckpoint'.");

	if (TRASH_OBJECTS[route][trash_route_OBJECTS] == 0) TRASH_OBJECTS[route][trash_route_DISTANCE] = GetDistanceBetweenPoints3D(x, y, z, obtain_work_coords[WORK_TRASH][obtain_work_X], obtain_work_coords[WORK_TRASH][obtain_work_Y], obtain_work_coords[WORK_TRASH][obtain_work_Z]);
	else
	{
		TRASH_OBJECTS[route][trash_route_DISTANCE] -= GetDistanceBetweenPoints3D(TRASH_OBJECTS[route][trash_object_X][ TRASH_OBJECTS[route][trash_route_OBJECTS] - 1], TRASH_OBJECTS[route][trash_object_Y][ TRASH_OBJECTS[route][trash_route_OBJECTS] - 1 ], TRASH_OBJECTS[route][trash_object_Z][ TRASH_OBJECTS[route][trash_route_OBJECTS] - 1 ], obtain_work_coords[WORK_TRASH][obtain_work_X], obtain_work_coords[WORK_TRASH][obtain_work_Y], obtain_work_coords[WORK_TRASH][obtain_work_Z]);
		TRASH_OBJECTS[route][trash_route_DISTANCE] += GetDistanceBetweenPoints3D(x, y, z, TRASH_OBJECTS[route][trash_object_X][ TRASH_OBJECTS[route][trash_route_OBJECTS] - 1], TRASH_OBJECTS[route][trash_object_Y][ TRASH_OBJECTS[route][trash_route_OBJECTS] - 1 ], TRASH_OBJECTS[route][trash_object_Z][ TRASH_OBJECTS[route][trash_route_OBJECTS] - 1 ]);
	}

	TRASH_OBJECTS[route][trash_object_MODELID][ TRASH_OBJECTS[route][trash_route_OBJECTS] ] = modelid;
	TRASH_OBJECTS[route][trash_object_X][ TRASH_OBJECTS[route][trash_route_OBJECTS] ] = x;
	TRASH_OBJECTS[route][trash_object_Y][ TRASH_OBJECTS[route][trash_route_OBJECTS] ] = y;
	TRASH_OBJECTS[route][trash_object_Z][ TRASH_OBJECTS[route][trash_route_OBJECTS] ] = z;
	TRASH_OBJECTS[route][trash_object_RX][ TRASH_OBJECTS[route][trash_route_OBJECTS] ] = rx;
	TRASH_OBJECTS[route][trash_object_RY][ TRASH_OBJECTS[route][trash_route_OBJECTS] ] = ry;
	TRASH_OBJECTS[route][trash_object_RZ][ TRASH_OBJECTS[route][trash_route_OBJECTS] ] = rz;
	//CreateDynamicObject(modelid, x, y, z, rx, ry, rz, 0, 0);

	TRASH_OBJECTS[route][trash_route_DISTANCE] += GetDistanceBetweenPoints3D(x, y, z, obtain_work_coords[WORK_TRASH][obtain_work_X], obtain_work_coords[WORK_TRASH][obtain_work_Y], obtain_work_coords[WORK_TRASH][obtain_work_Z]);
	TRASH_OBJECTS[route][trash_route_MONEY] = floatround(0.3 * TRASH_OBJECTS[route][trash_route_DISTANCE]);

	TRASH_OBJECTS[route][trash_route_OBJECTS] ++;
	return 1;
}

ResetTrashInfo(vehicleid)
{
	new tmp_TRASH_VEHICLES[TRASH_VEHICLES_INFO]; TRASH_VEHICLES[vehicleid] = tmp_TRASH_VEHICLES;

	TRASH_VEHICLES[vehicleid][trash_vehicle_DRIVER_ID] = INVALID_PLAYER_ID;
	TRASH_VEHICLES[vehicleid][trash_vehicle_PASSENGER_ID] = INVALID_PLAYER_ID;
	return 1;
}

SetPlayerTrashCheckpoint(playerid, vehicleid)
{
	DestroyPlayerTrashCheckpoint(playerid);

	new cp = TRASH_VEHICLES[ vehicleid ][trash_vehicle_CP];
	new route = TRASH_VEHICLES[ vehicleid ][trash_vehicle_ROUTE];

	if (cp >= TRASH_OBJECTS[route][trash_route_OBJECTS])
	{
		PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT] = CreateDynamicCP(1621.435791, -2158.833740, 13.554687, 5.0, 0, 0, playerid, 9999999999.0);
	    StartTracing(playerid, 1621.435791, -2158.833740, 13.554687);
		new info[1];
		info[0] = CHECKPOINT_TYPE_FINISH_TRASH;
		Streamer_SetArrayData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT], E_STREAMER_EXTRA_ID, info);
	}
	else
	{
		PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT] = CreateDynamicCP(TRASH_OBJECTS[ route ][trash_object_X][ cp ], TRASH_OBJECTS[ route ][trash_object_Y][ cp ], TRASH_OBJECTS[ route ][trash_object_Z][ cp ], 1.5, 0, 0, playerid, 9999999999.0);
		StartTracing(playerid, TRASH_OBJECTS[ route ][trash_object_X][ cp ], TRASH_OBJECTS[ route ][trash_object_Y][ cp ], TRASH_OBJECTS[ route ][trash_object_Z][ cp ]);

		new info[1];
		info[0] = CHECKPOINT_TYPE_TRASH;
		Streamer_SetArrayData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT], E_STREAMER_EXTRA_ID, info);
	}
	return 1;
}

DestroyPlayerTrashCheckpoint(playerid)
{
	if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT]))
	{
		DestroyDynamicCP(PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT]);
		CancelTracing(playerid);
		PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT] = INVALID_STREAMER_ID;
	}
	return 1;
}

CancelTrashWork(driver, mate, vehicleid)
{
	DestroyPlayerTrashCheckpoint(driver);
	DestroyPlayerTrashCheckpoint(mate);

	DestroyPlayerTrashRouteObjects(driver);
	DestroyPlayerTrashRouteObjects(mate);

	PLAYER_TEMP[driver][py_TRASH_DRIVER] = false;
	PLAYER_TEMP[driver][py_TRASH_PASSENGER] = false;
	PLAYER_TEMP[driver][py_TRASH_VEHICLE_ID] = INVALID_VEHICLE_ID;

	PLAYER_TEMP[mate][py_TRASH_DRIVER] = false;
	PLAYER_TEMP[mate][py_TRASH_PASSENGER] = false;
	PLAYER_TEMP[mate][py_TRASH_VEHICLE_ID] = INVALID_VEHICLE_ID;

	KillTimer(PLAYER_TEMP[mate][py_TIMERS][10]);
	ClearAnimations(mate);
	TogglePlayerControllableEx(mate, true);

	ResetTrashInfo(vehicleid);
	SetVehicleToRespawnEx(vehicleid);
	return 1;
}

UpdatePlayerTrashRecycleSize(playerid)
{
	new str_text[64];
	format(str_text, sizeof(str_text), "Recogiendo basura ~g~%d%", PLAYER_TEMP[playerid][py_RECYCLE_BIN_VALUE] + minrand(1, 8));
	ShowPlayerMessage(playerid, str_text, 2);

	if (PLAYER_TEMP[playerid][py_RECYCLE_BIN_VALUE] > 99)
	{
		ShowPlayerMessage(playerid, "Recogiendo basura ~g~100%", 2);
	}
	return 1;
}

CreatePlayerTrashRouteObjects(playerid, route)
{
	for(new i = 0; i != MAX_OBJECTS_PER_ROUTE; i ++)
	{
		TRASH_PLAYER_OBJECTS[playerid][i] = INVALID_STREAMER_ID;

		if (TRASH_OBJECTS[route][trash_object_MODELID][i] != 0)
		{
			TRASH_PLAYER_OBJECTS[playerid][i] = CreateDynamicObject(TRASH_OBJECTS[route][trash_object_MODELID][i], TRASH_OBJECTS[route][trash_object_X][i], TRASH_OBJECTS[route][trash_object_Y][i], TRASH_OBJECTS[route][trash_object_Z][i], TRASH_OBJECTS[route][trash_object_RX][i], TRASH_OBJECTS[route][trash_object_RY][i], TRASH_OBJECTS[route][trash_object_RZ][i], 0, 0, playerid);
		}
	}
	return 1;
}

DestroyPlayerTrashRouteObjects(playerid)
{
	for(new i = 0; i != MAX_OBJECTS_PER_ROUTE; i ++)
	{
		if (TRASH_PLAYER_OBJECTS[playerid][i] != INVALID_STREAMER_ID) DestroyDynamicObject(TRASH_PLAYER_OBJECTS[playerid][i]);
		TRASH_PLAYER_OBJECTS[playerid][i] = INVALID_STREAMER_ID;
	}
	return 1;
}