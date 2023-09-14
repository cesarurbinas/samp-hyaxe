
forward InitLastGraffiti();
public InitLastGraffiti()
{
	#if DEBUG_MODE == 1
		printf("InitLastGraffiti"); // debug juju
	#endif

	new DBResult:Result, graff_id;
	Result = db_query(Database, "SELECT * FROM `SERVER_PROPERTIES`;");
	if (db_num_rows(Result)) graff_id = db_get_field_assoc_int(Result, "LAST_GRAFFITI");
 
	if (graff_id != 0) InitGraffiti(graff_id);
	else InitGraffiti( minrand(0, sizeof(GRAFFITIS_OBJ)) );

	db_free_result(Result);
	return 1;
}

forward FirstGraffitiAnnounce();
public FirstGraffitiAnnounce()
{
	#if DEBUG_MODE == 1
		printf("FirstGraffitiAnnounce"); // debug juju
	#endif

	new hour, minute, second;
	gettime(hour, minute, second);
	if (hour >= 2 && hour <= 6) 
	{
		print("Skipping graffiti event activation until 6 AM.");
		return 0;
	}

	SendGraffitiNotification("En 15 minutos se iniciara una disputa.");
	SendDiscordWebhook("En 15 minutos se iniciara una disputa.", 2);
	SetTimer("TwoGraffitiAnnounce", 900000, false);
	return 1;
}

forward TwoGraffitiAnnounce();
public TwoGraffitiAnnounce()
{
	#if DEBUG_MODE == 1
		printf("TwoGraffitiAnnounce"); // debug juju
	#endif

	SendGraffitiNotification("En 5 minutos se iniciara una disputa.");
	SendDiscordWebhook("En 5 minutos se iniciara una disputa.", 2);
	SetTimer("InitRandomGangEvent", 300000, false);
	SetTimer("FinalGraffitiAnnounce", 240000, false);
	return 1;
}

forward FinalGraffitiAnnounce();
public FinalGraffitiAnnounce()
{
	#if DEBUG_MODE == 1
		printf("FinalGraffitiAnnounce"); // debug juju
	#endif

	SendGraffitiNotification("En 60 segundos se iniciara una disputa.");
	SendDiscordWebhook("En 60 segundos se iniciara una disputa.", 2);
	return 1;
}

forward CancelGraffiti();
public CancelGraffiti()
{
	#if DEBUG_MODE == 1
		printf("CancelGraffiti"); // debug juju
	#endif

	KillTimer(GraffitiCancelTimer);

	for(new i = 0; i < sizeof GRAFFITIS_OBJ; i ++)
	{
		if (GRAFFITIS_OBJ[i][g_ACTIVATED])
		{
			new str_text[144];

			GRAFFITIS_OBJ[i][g_ACTIVATED] = false;

			format(str_text, sizeof(str_text), "Nadie ha ganado el graffiti en %s.", GRAFFITIS_OBJ[i][g_ZONE_NAME]);
			SendGraffitiNotification(str_text);
			SendDiscordWebhook(str_text, 2);

			format(str_text, sizeof(str_text), "[GRAFFITI] Nadie ha ganado el graffiti en %s.", GRAFFITIS_OBJ[i][g_ZONE_NAME]);
			SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 1);
		}
	}

	for(new x = 0, j = GetPlayerPoolSize(); x <= j; x++)
	{
		if (IsPlayerConnected(x))
		{
			if (PLAYER_CREW[x][player_crew_VALID])
			{
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
				RemovePlayerMapIcon(x, 0);
				CREW_INFO[ PLAYER_CREW[x][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS] = 0;
				CREW_INFO[ PLAYER_CREW[x][player_crew_INDEX] ][crew_IN_GRAFFITI] = false;
			}
		}
	}
	return 1;
}

forward UpdateGraffitiProgress(playerid);
public UpdateGraffitiProgress(playerid)
{
	#if DEBUG_MODE == 1
		printf("UpdateGraffitiProgress"); // debug juju
	#endif

	if (IsPlayerPaused(playerid)) return KillTimer(PLAYER_TEMP[playerid][py_TIMERS][41]);
	if (GetPlayerWeapon(playerid) != 41) return KillTimer(PLAYER_TEMP[playerid][py_TIMERS][41]);

	//Strings
	new crew_one[64],
		crew_two[64],
		crew_three[64],
		symbol[2] = "%";

	for(new x = 0; x < sizeof GRAFFITIS_OBJ; x ++)
	{
		if (GRAFFITIS_OBJ[x][g_ACTIVATED])
		{
			new Float:distance = GetPlayerDistanceFromPoint(playerid, GRAFFITIS_OBJ[x][g_X], GRAFFITIS_OBJ[x][g_Y], GRAFFITIS_OBJ[x][g_Z]);
			if (distance > 2.5)
				return KillTimer(PLAYER_TEMP[playerid][py_TIMERS][41]);

			//Give crew text slot
			if (GRAFFITIS_OBJ[x][g_CREW_ONE] == 0)
			{
				if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_GRAFFITI])
				{
					GRAFFITIS_OBJ[x][g_CREW_ONE] = CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID];
					CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_GRAFFITI] = true;

					new CrewColorGraffiti_ARGB = hy_RGBAToARGB(getPlayerCrewColor(playerid));
					GRAFFITIS_OBJ[x][g_OBJ_CREW_ONE] = CreateDynamicObject(GRAFFITIS_OBJ[x][g_MODELID], GRAFFITIS_OBJ[x][g_X], GRAFFITIS_OBJ[x][g_Y], GRAFFITIS_OBJ[x][g_Z], GRAFFITIS_OBJ[x][g_RX], GRAFFITIS_OBJ[x][g_RY], GRAFFITIS_OBJ[x][g_RZ], 0, 0);
					SetDynamicObjectMaterialText(GRAFFITIS_OBJ[x][g_OBJ_CREW_ONE], 0, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], OBJECT_MATERIAL_SIZE_512x64, GRAFFITIS_OBJ[x][g_FONT], 60, 0, CrewColorGraffiti_ARGB, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

					format(crew_one, sizeof(crew_one), "%s %d %s", TextToSpanish(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]), CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS], symbol);
					TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][1], crew_one);
				}
			}

			if (GRAFFITIS_OBJ[x][g_CREW_TWO] == 0)
			{
				if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_GRAFFITI])
				{
					GRAFFITIS_OBJ[x][g_CREW_TWO] = CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID];
					CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_GRAFFITI] = true;

					new CrewColorGraffiti_ARGB = hy_RGBAToARGB(getPlayerCrewColor(playerid));
					GRAFFITIS_OBJ[x][g_OBJ_CREW_TWO] = CreateDynamicObject(GRAFFITIS_OBJ[x][g_MODELID], GRAFFITIS_OBJ[x][g_X], GRAFFITIS_OBJ[x][g_Y], GRAFFITIS_OBJ[x][g_Z], GRAFFITIS_OBJ[x][g_RX], GRAFFITIS_OBJ[x][g_RY], GRAFFITIS_OBJ[x][g_RZ], 0, 0);
					SetDynamicObjectMaterialText(GRAFFITIS_OBJ[x][g_OBJ_CREW_TWO], 0, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], OBJECT_MATERIAL_SIZE_512x64, GRAFFITIS_OBJ[x][g_FONT], 60, 0, CrewColorGraffiti_ARGB, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

					format(crew_two, sizeof(crew_two), "%s %d %s", TextToSpanish(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]), CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS], symbol);
					TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][3], crew_two);
				}
			}

			if (GRAFFITIS_OBJ[x][g_CREW_THREE] == 0)
			{
				if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_GRAFFITI])
				{
					GRAFFITIS_OBJ[x][g_CREW_THREE] = CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID];
					CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_GRAFFITI] = true;

					new CrewColorGraffiti_ARGB = hy_RGBAToARGB(getPlayerCrewColor(playerid));
					GRAFFITIS_OBJ[x][g_OBJ_CREW_THREE] = CreateDynamicObject(GRAFFITIS_OBJ[x][g_MODELID], GRAFFITIS_OBJ[x][g_X], GRAFFITIS_OBJ[x][g_Y], GRAFFITIS_OBJ[x][g_Z], GRAFFITIS_OBJ[x][g_RX], GRAFFITIS_OBJ[x][g_RY], GRAFFITIS_OBJ[x][g_RZ], 0, 0);
					SetDynamicObjectMaterialText(GRAFFITIS_OBJ[x][g_OBJ_CREW_THREE], 0, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], OBJECT_MATERIAL_SIZE_512x64, GRAFFITIS_OBJ[x][g_FONT], 60, 0, CrewColorGraffiti_ARGB, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

					format(crew_three, sizeof(crew_three), "%s %d %s", TextToSpanish(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]), CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS], symbol);
					TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][4], crew_three);
				}
			}

			//Check initial crew text slot
			if (GRAFFITIS_OBJ[x][g_CREW_ONE] == CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID])
			{
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS] ++;

				TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][1], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);
				format(crew_one, sizeof(crew_one), "%s %d %s", TextToSpanish(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]), CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS], symbol);
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][1], crew_one);
			}

			if (GRAFFITIS_OBJ[x][g_CREW_TWO] == CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID])
			{
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS] ++;

				TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][3], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);
				
				format(crew_two, sizeof(crew_two), "%s %d %s", TextToSpanish(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]), CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS], symbol);
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][3], crew_two);
			}

			if (GRAFFITIS_OBJ[x][g_CREW_THREE] == CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID])
			{
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS] ++;

				TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][4], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);
				
				format(crew_three, sizeof(crew_three), "%s %d %s", TextToSpanish(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]), CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS], symbol);
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][4], crew_three);
			}

			for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
			{
				if (IsPlayerConnected(i))
				{
					if (PLAYER_CREW[i][player_crew_VALID] || PLAYER_WORKS[i][WORK_POLICE])
					{
						TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][0]);

						if (GRAFFITIS_OBJ[x][g_CREW_ONE] > 0)
						{
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][1]);
						}

						if (GRAFFITIS_OBJ[x][g_CREW_TWO] > 0)
						{
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][3]);
						}

						if (GRAFFITIS_OBJ[x][g_CREW_THREE] > 0)
						{
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][4]);
						}

						TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][2]);
					}
				}
			}
		}
	}
    
	CheckGraffitiProgress(playerid);
    return 1;
}