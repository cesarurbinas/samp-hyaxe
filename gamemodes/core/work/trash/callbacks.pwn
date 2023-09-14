forward RecycleUp(playerid);
public RecycleUp(playerid)
{
	Logger_Debug("RecycleUp"); // This is a debug line!

	if (PLAYER_TEMP[playerid][py_RECYCLE_BIN_VALUE] < 100)
	{
		PLAYER_TEMP[playerid][py_RECYCLE_BIN_VALUE] += 15;
		if (PLAYER_TEMP[playerid][py_RECYCLE_BIN_VALUE] > 100) PLAYER_TEMP[playerid][py_RECYCLE_BIN_VALUE] = 100;

		ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.1, true, false, false, false, 0);
		UpdatePlayerTrashRecycleSize(playerid);
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][10]);
		PLAYER_TEMP[playerid][py_TIMERS][10] = SetTimerEx("RecycleUp", 1000, false, "i", playerid);
		return 1;
	}

	TogglePlayerControllableEx(playerid, true);
	ClearAnimations(playerid);

	new driver = TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID];
	new cp = TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_CP];
	new route = TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_ROUTE];

	DestroyDynamicObject(TRASH_PLAYER_OBJECTS[playerid][cp]);
	TRASH_PLAYER_OBJECTS[playerid][cp] = INVALID_STREAMER_ID;

	DestroyDynamicObject(TRASH_PLAYER_OBJECTS[driver][cp]);
	TRASH_PLAYER_OBJECTS[driver][cp] = INVALID_STREAMER_ID;

	CreatePlayerFlashObject(
								playerid,
								TRASH_OBJECTS[ route ][trash_object_X][ cp ],
								TRASH_OBJECTS[ route ][trash_object_Y][ cp ],
								TRASH_OBJECTS[ route ][trash_object_Z][ cp ] - 1.5
							);

	CreatePlayerFlashObject(
								driver,
								TRASH_OBJECTS[ route ][trash_object_X][ cp ],
								TRASH_OBJECTS[ route ][trash_object_Y][ cp ],
								TRASH_OBJECTS[ route ][trash_object_Z][ cp ] - 1.5
							);

	PlayerPlaySoundEx(playerid, 1190, 0.0, 0.0, 0.0);

	TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_CP] ++;
	if (TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_CP] >= TRASH_OBJECTS[ TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_ROUTE] ][trash_route_OBJECTS])
	{
	    ShowPlayerMessage(playerid, "Sube al camión para volver al ~y~vertedero ~w~y recibir la paga.", 3);
	    ShowPlayerMessage(driver, "Sube al camión para volver al ~y~vertedero ~w~y recibir la paga.", 3);
	}
	else ShowPlayerMessage(playerid, "Sube al camión para seguir con la ruta.", 3);

	SetPlayerTrashCheckpoint(driver, PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);
	SetPlayerTrashCheckpoint(playerid, PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);

	Streamer_Update(driver);
	Streamer_Update(playerid);
	return 1;
}