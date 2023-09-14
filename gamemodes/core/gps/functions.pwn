GetEmptyPlayer_GPS_Slot(playerid)
{
	for(new i = 0; i != MAX_PLAYER_GPS_SAVES; i ++)
	{
		if (!PLAYER_GPS[playerid][i][player_gps_VALID]) return i;
	}
	return -1;
}

Cancel_GPS(playerid)
{
	if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_GPS_CHECKPOINT]))
	{
		DestroyDynamicCP(PLAYER_TEMP[playerid][py_GPS_CHECKPOINT]);
    	CancelTracing(playerid);
		PLAYER_TEMP[playerid][py_GPS_CHECKPOINT] = INVALID_STREAMER_ID;
	}
	return 1;
}

SetPlayer_GPS_Checkpoint(playerid, Float:x, Float:y, Float:z, world, interior)//spgps
{
	if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_GPS_CHECKPOINT]))
	{
		DestroyDynamicCP(PLAYER_TEMP[playerid][py_GPS_CHECKPOINT]);
    	CancelTracing(playerid);
		PLAYER_TEMP[playerid][py_GPS_CHECKPOINT] = INVALID_STREAMER_ID;
	}
	PLAYER_TEMP[playerid][py_GPS_CHECKPOINT] = CreateDynamicCP(x, y, z, 5.0, world, interior, playerid, 9999999999.0);
  	StartTracing(playerid, x, y, z);

	new info[1];
	info[0] = CHECKPOINT_TYPE_GPS;
	Streamer_SetArrayData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_GPS_CHECKPOINT], E_STREAMER_EXTRA_ID, info);

	SetPlayerChatBubble(playerid, "\n\n\n\n* Configura su GPS.\n\n\n", 0xffcb90FF, 20.0, 5000);
	return 1;
}

RegisterNewPlayer_GPS_Site(playerid, slot)
{
	new DBResult:Result, DB_Query[340];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PLAYER_GPS`\
		(\
			`ID_USER`, `NAME`, `X`, `Y`, `Z`, `WORLD`, `INTERIOR`\
		)\
		VALUES\
		(\
			'%d', '%q', '%f', '%f', '%f', '%d', '%d'\
		);\
		SELECT MAX(`ID`) FROM `PLAYER_GPS`;\
	",
		ACCOUNT_INFO[playerid][ac_ID], PLAYER_GPS[playerid][slot][player_gps_NAME], PLAYER_GPS[playerid][slot][player_gps_X], PLAYER_GPS[playerid][slot][player_gps_Y], PLAYER_GPS[playerid][slot][player_gps_Z], PLAYER_GPS[playerid][slot][player_gps_WORLD], PLAYER_GPS[playerid][slot][player_gps_INTERIOR]
	);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result)) PLAYER_GPS[playerid][slot][player_gps_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);
	return 1;
}

ShowPlayerGpsMap(playerid)
{
	PLAYER_TEMP[playerid][py_GPS_MAP] = true;
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_GPS_MAP][0]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_GPS_MAP][1]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_GPS_MAP][2]);

	UpdatePlayer_GPS_Map(playerid);

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][13]);
	PLAYER_TEMP[playerid][py_TIMERS][13] = SetTimerEx("UpdatePlayer_GPS_Map", 1000, true, "i", playerid);
	return 1;
}

HidePlayerGpsMap(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][13]);
	PLAYER_TEMP[playerid][py_GPS_MAP] = false;
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_GPS_MAP][0]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_GPS_MAP][1]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_GPS_MAP][2]);

	for(new i = 0; i != MAX_PLAYER_MAP_GPS_POINTS; i ++)
	{
		if (PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][i] != PlayerText:INVALID_TEXT_DRAW)
		{
			PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][i]);
			PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][i] = PlayerText:INVALID_TEXT_DRAW;
		}
	}
	return 1;
}

SetPlayerPoint_GPS_Map(index, playerid, const icon[], color, Float:icon_size_X, Float:icon_size_Y, Float:x, Float:y)
{
	new Float:td_X, Float:td_Y;

	if (x > 3000.0) x = 3000.0;
	else if (x < -3000.0) x = -3000.0;

	if (y > 3000.0) y = 3000.0;
	else if (y < -3000.0) y = -3000.0;

	new
		Float:converted_MAP_SIZE_X = floatdiv(map_td_SIZE_X, 2),
		Float:converted_MAP_SIZE_Y = floatdiv(map_td_SIZE_Y, 2),
		Float:converted_ICON_SIZE_X = floatdiv(icon_size_X, 2),
		Float:converted_ICON_SIZE_Y = floatdiv(icon_size_Y, 2);

	td_X = map_td_X + floatmul(floatdiv(converted_MAP_SIZE_X, 3000), x) + converted_MAP_SIZE_X - converted_ICON_SIZE_X;
	td_Y = map_td_Y + floatmul(floatdiv(-converted_MAP_SIZE_Y, 3000), y) + converted_MAP_SIZE_Y- converted_ICON_SIZE_Y;

	if (PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index] != PlayerText:INVALID_TEXT_DRAW)
	{
		PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index]);
		PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index] = PlayerText:INVALID_TEXT_DRAW;
	}

	PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index] = CreatePlayerTextDraw(playerid, td_X, td_Y, icon);
	PlayerTextDrawLetterSize(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], 0.160333, 1.280592);
	PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], icon_size_X, icon_size_Y);
	PlayerTextDrawAlignment(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], 1);
	PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], color);
	PlayerTextDrawSetShadow(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], 0);
	PlayerTextDrawSetOutline(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], 0);
	PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], 255);
	PlayerTextDrawFont(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], 4);
	PlayerTextDrawSetProportional(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], 0);
	PlayerTextDrawSetShadow(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], 0);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index]);
	return 1;
}