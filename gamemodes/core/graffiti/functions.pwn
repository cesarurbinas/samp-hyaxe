CreateGraffitis()
{
	for(new i = 0; i < sizeof GRAFFITIS_OBJ; i ++)
	{
		GRAFFITIS_OBJ[i][g_ID] = CreateDynamicObject(GRAFFITIS_OBJ[i][g_MODELID], GRAFFITIS_OBJ[i][g_X], GRAFFITIS_OBJ[i][g_Y], GRAFFITIS_OBJ[i][g_Z], GRAFFITIS_OBJ[i][g_RX], GRAFFITIS_OBJ[i][g_RY], GRAFFITIS_OBJ[i][g_RZ], 0, 0);
		SetDynamicObjectMaterialText(GRAFFITIS_OBJ[i][g_ID], 0, GRAFFITIS_OBJ[i][g_ZONE_NAME], OBJECT_MATERIAL_SIZE_512x64, GRAFFITIS_OBJ[i][g_FONT], 60, 0, 0xFFdc3939, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	
		new DBResult:Result, DB_Query[140];
		format(DB_Query, sizeof DB_Query, "SELECT * FROM `GRAFFITIS` WHERE `GRAFF_ID` = '%d'", i);
		Result = db_query(Database, DB_Query);

		if (db_num_rows(Result) == 0) printf("[ERROR] No hay registro para el graffiti %d", i);
		else
		{
			for(new x; x < db_num_rows(Result); x++ )
			{
				new 
					crew_id,
					graff;

				crew_id = getCrewIndexWithId(db_get_field_assoc_int(Result, "ID_CREW"));
				graff = db_get_field_assoc_int(Result, "GRAFF_ID");

				if (crew_id > 0)
				{
					if (CREW_INFO[crew_id][crew_VALID])
					{
						new CrewColorGraffiti_ARGB = hy_RGBAToARGB(CREW_INFO[crew_id][crew_COLOR]);
						SetDynamicObjectMaterialText(GRAFFITIS_OBJ[graff][g_ID], 0, CREW_INFO[crew_id][crew_NAME], OBJECT_MATERIAL_SIZE_512x64, GRAFFITIS_OBJ[graff][g_FONT], 60, 0, CrewColorGraffiti_ARGB, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
					}
				}
				db_next_row(Result);
			}
			db_free_result(Result);
		}
	}
	return 1;
}

InitGraffiti(graff_id)
{
	ResetGraffitiTextdraw();

	new DB_Query[164];
	format(DB_Query, sizeof DB_Query, "UPDATE `SERVER_PROPERTIES` SET `LAST_GRAFFITI` = '%d';", graff_id);
	db_free_result(db_query(Database, DB_Query));

	for(new i = 0; i < sizeof GRAFFITIS_OBJ; i ++)
	{
		if (GRAFFITIS_OBJ[i][g_ACTIVATED] == true)
		{
			GRAFFITIS_OBJ[i][g_ACTIVATED] = false;
		}
	}

	GraffitiGetTime = gettime();

	new str_text[128];

	GRAFFITIS_OBJ[graff_id][g_ACTIVATED] = true;
	GraffitiCancelTimer = SetTimer("CancelGraffiti", 1200000, false);

	format(str_text, sizeof(str_text), "   ~w~Graffiti en %s", GRAFFITIS_OBJ[graff_id][g_ZONE_NAME]);

	new str[144];
	format(str, 144, "[GRAFFITI] Graffiti en %s.", GRAFFITIS_OBJ[graff_id][g_ZONE_NAME]);
    SendMessageToAdmins(COLOR_ANTICHEAT, str, 1);

    format(str, 144, "Graffiti en %s.", GRAFFITIS_OBJ[graff_id][g_ZONE_NAME]);
    SendDiscordWebhook(str, 2);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_CREW[i][player_crew_VALID] || PLAYER_WORKS[i][WORK_POLICE])
			{
				CREW_INFO[ PLAYER_CREW[i][player_crew_INDEX] ][crew_IN_GRAFFITI] = false;

				TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][1], -1);
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][1], TextToSpanish("¡La disputa comenzó! Nadie ha pintado todavía."));
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][0], TextToSpanish(str_text));
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][2], "hud:radar_spray");
                TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][0]);
                TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][1]);
                TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][2]);
				SetPlayerMapIcon(i, 0, GRAFFITIS_OBJ[graff_id][g_X], GRAFFITIS_OBJ[graff_id][g_Y], GRAFFITIS_OBJ[graff_id][g_Z], 63, 0, MAPICON_GLOBAL);
			}
		}
	}
}

RecalculeCrewGraffitis(crew_id)
{
	new DBResult:Result, DB_Query[140];

	format(DB_Query, sizeof DB_Query, "SELECT * FROM `GRAFFITIS` WHERE `ID_CREW` = '%d'", CREW_INFO[crew_id][crew_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result) == 0) CREW_INFO[crew_id][crew_GRAFFITIS_COUNT] = 0;
	else
	{
		CREW_INFO[crew_id][crew_GRAFFITIS_COUNT] = db_num_rows(Result);
	}
	return 1;
}

SendGraffitiNotification(const ann[])
{
	KillTimer(GraffitiGlobalTime);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if (IsPlayerConnected(i))
        {
        	if (PLAYER_CREW[i][player_crew_VALID] || PLAYER_WORKS[i][WORK_POLICE])
			{
                ShowPlayerNotification(i, ann, 6);
                RecalculeCrewGraffitis(PLAYER_CREW[i][player_crew_INDEX]);
            }
        }
    }
    return 1;
}

CheckGraffitiProgress(playerid)
{
	for(new x = 0, j = GetPlayerPoolSize(); x <= j; x++)
	{
		if (IsPlayerConnected(x))
		{
			if (PLAYER_TEMP[playerid][py_DEBUG])
			{
				SendClientMessageEx(playerid, -1, "[%d] %s (%i) - %s (%d): %d", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS], PLAYER_TEMP[playerid][py_NAME], playerid, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], PLAYER_CREW[playerid][player_crew_INDEX], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID]);
			}
		}
	}

	if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS] > 98)
	{
		new CrewColorGraffiti_ARGB = hy_RGBAToARGB(getPlayerCrewColor(playerid));
		new str_text[128];

		for(new x = 0, j = GetPlayerPoolSize(); x <= j; x++)
		{
			if (IsPlayerConnected(x))
			{
				if (PLAYER_CREW[x][player_crew_VALID])
				{
					CREW_INFO[ PLAYER_CREW[x][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS] = 0;
					CREW_INFO[ PLAYER_CREW[x][player_crew_INDEX] ][crew_IN_GRAFFITI] = false;
				}

				TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][0]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][1]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][2]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][3]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][4]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][5]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][6]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][7]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][8]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][9]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][10]);

				KillTimer(PLAYER_TEMP[x][py_TIMERS][41]);
				PLAYER_TEMP[x][py_IN_MARKET] = false;
				RemovePlayerMapIcon(x, 0);
			}
		}

		for(new i = 0; i < sizeof GRAFFITIS_OBJ; i ++)
		{
			if (GRAFFITIS_OBJ[i][g_ACTIVATED] == true)
			{
				GRAFFITIS_OBJ[i][g_ACTIVATED] = false;
				KillTimer(GraffitiCancelTimer);
				SetTimer("FirstGraffitiAnnounce", 1500000, false);

				format(str_text, sizeof(str_text), "%s ha ganado el graffiti en %s.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], GRAFFITIS_OBJ[i][g_ZONE_NAME]);
				SendGraffitiNotification(str_text);
				SendDiscordWebhook(str_text, 2);

				new str[144]; format(str, 144, "[GRAFFITI] %s ha ganado el graffiti en %s.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], GRAFFITIS_OBJ[i][g_ZONE_NAME]);
    			SendMessageToAdmins(COLOR_ANTICHEAT, str, 1);

				SetDynamicObjectMaterialText(GRAFFITIS_OBJ[i][g_ID], 0, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], OBJECT_MATERIAL_SIZE_512x64, GRAFFITIS_OBJ[i][g_FONT], 60, 0, CrewColorGraffiti_ARGB, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

				new DB_Query[140];

				/* UPDATE OLD CREW DATE */
				new DBResult:Result;
				format(DB_Query, sizeof DB_Query, "SELECT * FROM `GRAFFITIS` WHERE `GRAFF_ID` = '%d'", i);
				Result = db_query(Database, DB_Query);
				
				new crew_id = db_get_field_assoc_int(Result, "ID_CREW"),
					cindex = getCrewIndexWithId(crew_id);

				new tmp_old = (CREW_INFO[cindex][crew_GRAFFITIS_COUNT] - 1);
				if (tmp_old < 0) tmp_old = 0;


				CREW_INFO[cindex][crew_GRAFFITIS_COUNT] = tmp_old;

				if (CREW_INFO[cindex][crew_VALID])
				{
					format(DB_Query, sizeof DB_Query, "UPDATE `CREW` SET `GRAFFITIS_COUNT` = '%d' WHERE `ID` = '%d';", tmp_old, getCrewIndexWithId(crew_id));
					db_free_result(db_query(Database, DB_Query));
				}

				/* UPDATE NEW CREW DATE */
				new tmp_new = (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITIS_COUNT] + 1);
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITIS_COUNT] = tmp_new;

				format(DB_Query, sizeof DB_Query, "UPDATE `CREW` SET `GRAFFITIS_COUNT` = '%d' WHERE `ID` = '%d';", tmp_new, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID]);
				db_free_result(db_query(Database, DB_Query));

				/* UPDATE GRAFFITI DATE */
				format(DB_Query, sizeof DB_Query, "UPDATE `GRAFFITIS` SET `GRAFF_ID` = '%d', `ID_CREW` = '%i' WHERE `GRAFF_ID` = '%d';", i, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID], i);
				db_free_result(db_query(Database, DB_Query));

				/* RESET OTHER CREW's */
				GRAFFITIS_OBJ[i][g_CREW_ONE] = 0;
				GRAFFITIS_OBJ[i][g_CREW_TWO] = 0;
				GRAFFITIS_OBJ[i][g_CREW_THREE] = 0;

				if (GRAFFITIS_OBJ[i][g_OBJ_CREW_ONE] != INVALID_STREAMER_ID) DestroyDynamicObject(GRAFFITIS_OBJ[i][g_OBJ_CREW_ONE]);
				if (GRAFFITIS_OBJ[i][g_OBJ_CREW_TWO] != INVALID_STREAMER_ID) DestroyDynamicObject(GRAFFITIS_OBJ[i][g_OBJ_CREW_TWO]);
				if (GRAFFITIS_OBJ[i][g_OBJ_CREW_THREE] != INVALID_STREAMER_ID) DestroyDynamicObject(GRAFFITIS_OBJ[i][g_OBJ_CREW_THREE]);
			}
		}
	}
	return 1;
}