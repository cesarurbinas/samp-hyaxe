forward UpdatePlayer_GPS_Map(playerid);
public UpdatePlayer_GPS_Map(playerid)
{
	Logger_Debug("UpdatePlayer_GPS_Map"); // This is a debug line!

	/*
		0 - playerpos
		1 - cp gps
		2 - cp works
		3 > cp works

	*/
	if (!PLAYER_TEMP[playerid][py_GPS_MAP]) return KillTimer(PLAYER_TEMP[playerid][py_TIMERS][13]);

	new Float:x, Float:y, Float:z;

	switch(CHARACTER_INFO[playerid][ch_STATE])
	{
		case ROLEPLAY_STATE_INTERIOR:
		{
			x = ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_EXT_X];
			y = ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_EXT_Y];
		}
		case ROLEPLAY_STATE_OWN_PROPERTY, ROLEPLAY_STATE_GUEST_PROPERTY:
		{
			x = PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PROPERTY_INDEX] ][property_EXT_X];
			y = PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PROPERTY_INDEX] ][property_EXT_Y];
		}
		default: GetPlayerPos(playerid, x, y, z);
	}
	SetPlayerPoint_GPS_Map(0, playerid, "hud:radar_waypoint", COLOR_WHITE, 5.0, 5.0, x, y);

	if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_GPS_CHECKPOINT]))
	{
		new Float:gps_cp_pos[2];
		Streamer_GetFloatData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_GPS_CHECKPOINT], E_STREAMER_X, gps_cp_pos[0]);
		Streamer_GetFloatData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_GPS_CHECKPOINT], E_STREAMER_Y, gps_cp_pos[1]);
		SetPlayerPoint_GPS_Map(1, playerid, "LD_SPAC:white", 0xaa0000ff, 3.0, 3.0, gps_cp_pos[0], gps_cp_pos[1]);
	}
	else
	{
		if (PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][1] != PlayerText:INVALID_TEXT_DRAW)
		{
			PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][1]);
			PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][1] = PlayerText:INVALID_TEXT_DRAW;
		}
	}

	switch(PLAYER_TEMP[playerid][py_WORKING_IN])
	{
		case WORK_NONE:
		{
			if (PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2] != PlayerText:INVALID_TEXT_DRAW)
			{
				PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2]);
				PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2] = PlayerText:INVALID_TEXT_DRAW;
			}
		}
		case WORK_TRUCK:
		{
			if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]))
			{
				new Float:gps_cp_pos[2];
				Streamer_GetFloatData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT], E_STREAMER_X, gps_cp_pos[0]);
				Streamer_GetFloatData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT], E_STREAMER_Y, gps_cp_pos[1]);
				SetPlayerPoint_GPS_Map(2, playerid, "LD_SPAC:white", 0xaa0000ff, 3.0, 3.0, gps_cp_pos[0], gps_cp_pos[1]);
			}
			else
			{
				if (PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2] != PlayerText:INVALID_TEXT_DRAW)
				{
					PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2]);
					PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2] = PlayerText:INVALID_TEXT_DRAW;
				}
			}
		}
		case WORK_HARVESTER:
		{
			if (IsValidDynamicRaceCP(PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT]))
			{
				new Float:gps_cp_pos[2];
				Streamer_GetFloatData(STREAMER_TYPE_RACE_CP, PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT], E_STREAMER_X, gps_cp_pos[0]);
				Streamer_GetFloatData(STREAMER_TYPE_RACE_CP, PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT], E_STREAMER_Y, gps_cp_pos[1]);
				SetPlayerPoint_GPS_Map(2, playerid, "LD_SPAC:white", 0xaa0000ff, 3.0, 3.0, gps_cp_pos[0], gps_cp_pos[1]);
			}
			else
			{
				if (PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2] != PlayerText:INVALID_TEXT_DRAW)
				{
					PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2]);
					PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2] = PlayerText:INVALID_TEXT_DRAW;
				}
			}
		}
		case WORK_TRASH:
		{
			if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT]))
			{
				new Float:gps_cp_pos[2];
				Streamer_GetFloatData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT], E_STREAMER_X, gps_cp_pos[0]);
				Streamer_GetFloatData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT], E_STREAMER_Y, gps_cp_pos[1]);
				SetPlayerPoint_GPS_Map(2, playerid, "LD_SPAC:white", 0xaa0000ff, 3.0, 3.0, gps_cp_pos[0], gps_cp_pos[1]);
			}
			else
			{
				if (PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2] != PlayerText:INVALID_TEXT_DRAW)
				{
					PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2]);
					PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2] = PlayerText:INVALID_TEXT_DRAW;
				}
			}
		}
	}

	new cp_counts = 3;
	for(new d = cp_counts; d != MAX_PLAYER_MAP_GPS_POINTS; d ++)
	{
		if (PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][d] != PlayerText:INVALID_TEXT_DRAW)
		{
			PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][d]);
			PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][d] = PlayerText:INVALID_TEXT_DRAW;
		}
	}

	if (cp_counts >= MAX_PLAYER_MAP_GPS_POINTS) return 1;
	return 1;
}