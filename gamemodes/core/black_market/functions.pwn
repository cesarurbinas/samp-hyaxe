InitBlackMarket(market_id)
{
	SetMarketTextdraw();

	for(new i = 0; i < sizeof BLACK_MARKET_OBJ; i ++)
	{
		if (BLACK_MARKET_OBJ[i][bm_ACTIVATED] == true)
		{
			BLACK_MARKET_OBJ[i][bm_ACTIVATED] = false;
		}
	}

	new str_text[128];

	MarketGetTime = gettime();
	BLACK_MARKET_OBJ[market_id][bm_ACTIVATED] = true;

	format(str_text, sizeof(str_text), "   ~w~Mercado de %s", BLACK_MARKET_OBJ[market_id][bm_ZONE_NAME]);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][1], -1);
	TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][1], TextToSpanish("¡La disputa comenzó! Nadie ha llegado todavía."));
	TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][0], TextToSpanish(str_text));
	TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][2], "hud:radar_locosyndicate");

	format(str_text, sizeof(str_text), "[MERCADO] Mercado en %s.", BLACK_MARKET_OBJ[market_id][bm_ZONE_NAME]);
    SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 1);

    format(str_text, 144, "Mercado en %s.", BLACK_MARKET_OBJ[market_id][bm_ZONE_NAME]);
    SendDiscordWebhook(str_text, 3);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_CREW[i][player_crew_VALID] || PLAYER_WORKS[i][WORK_POLICE])
			{
				CREW_INFO[ PLAYER_CREW[i][player_crew_INDEX] ][crew_IN_GRAFFITI] = false;

                TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][0]);
                TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][1]);
                TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][2]);
				SetPlayerMapIcon(i, 0, BLACK_MARKET_OBJ[market_id][bm_EXTERIOR_X], BLACK_MARKET_OBJ[market_id][bm_EXTERIOR_Y], BLACK_MARKET_OBJ[market_id][bm_EXTERIOR_Z], 23, 0, MAPICON_GLOBAL);
			}
		}
	}
	return 1;
}

RecalculeCrewMarkets(crew_id)
{
	new DBResult:Result, DB_Query[140];

	format(DB_Query, sizeof DB_Query, "SELECT * FROM `BLACK_MARKETS` WHERE `ID_CREW` = '%d'", CREW_INFO[crew_id][crew_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result) == 0) CREW_INFO[crew_id][crew_MARKET_COUNT] = 0;
	else
	{
		CREW_INFO[crew_id][crew_MARKET_COUNT] = db_num_rows(Result);
	}
	return 1;
}

LoadBlackMarkets()
{
	for(new i = 0; i < sizeof BLACK_MARKET_OBJ; i ++)
	{
		new DB_Query[140],
			DBResult:Result,
			str_text[128];

		format(DB_Query, sizeof DB_Query, "SELECT * FROM `BLACK_MARKETS` WHERE `MARKET_ID` = '%d'", i);
		Result = db_query(Database, DB_Query);
				
		new crew_id = getCrewIndexWithId(db_get_field_assoc_int(Result, "ID_CREW"));
		if (CREW_INFO[crew_id][crew_VALID])
		{
			format(str_text, sizeof(str_text), "\n"COL_WHITE"Dominado por: {%06x}%s",  CREW_INFO[crew_id][crew_COLOR] >>> 8, CREW_INFO[crew_id][crew_NAME]);
		}
		else
		{
			format(str_text, sizeof(str_text), "\n"COL_WHITE"Dominado por: Nadie");
		}

		BLACK_MARKET_OBJ[i][bm_LABEL] = CreateDynamic3DTextLabel(str_text, 0xF0F0F000, BLACK_MARKET_OBJ[i][bm_EXTERIOR_X], BLACK_MARKET_OBJ[i][bm_EXTERIOR_Y], BLACK_MARKET_OBJ[i][bm_EXTERIOR_Z] + 0.25, 5.0, .testlos = true, .worldid = 0, .interiorid = 0);
	}
	return 1;
}

CheckMarketProgress(playerid)
{
	if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_PROGRESS] > 98)
	{
		new str_text[128];

		ClearAnimations(playerid);
		ShowPlayerMessage(playerid, "Conquistando...~n~~r~100 %", 2);

		for(new x = 0, j = GetPlayerPoolSize(); x <= j; x++)
		{
			if (IsPlayerConnected(x))
			{
				if (PLAYER_CREW[x][player_crew_VALID])
				{
					CREW_INFO[ PLAYER_CREW[x][player_crew_INDEX] ][crew_MARKET_PROGRESS] = 0;
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

		for(new i = 0; i < sizeof BLACK_MARKET_OBJ; i ++)
		{
			if (BLACK_MARKET_OBJ[i][bm_ACTIVATED] == true)
			{
				BLACK_MARKET_OBJ[i][bm_ACTIVATED] = false;
				//TextDrawColor(Textdraws[textdraw_GRAFFITI][0], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);
				//SetTimer("FirstGraffitiAnnounce", 1500000, false);
				format(str_text, sizeof(str_text), "%s ahora domina el mercado de %s.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], BLACK_MARKET_OBJ[i][bm_ZONE_NAME]);
				SendGraffitiNotification(str_text);
				SendDiscordWebhook(str_text, 3);

				new str[144]; format(str, 144, "[MERCADO] %s ha ganado el mercado en %s.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], BLACK_MARKET_OBJ[i][bm_ZONE_NAME]);
    			SendMessageToAdmins(COLOR_ANTICHEAT, str, 1);

    			format(str_text, sizeof(str_text), "\n"COL_WHITE"Dominado por: {%06x}%s",  CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] >>> 8, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
    			UpdateDynamic3DTextLabelText(BLACK_MARKET_OBJ[i][bm_LABEL], 0xF0F0F000, str_text);

				new DB_Query[140];

				/* UPDATE OLD CREW DATE */
				new DBResult:Result;
				format(DB_Query, sizeof DB_Query, "SELECT * FROM `BLACK_MARKETS` WHERE `MARKET_ID` = '%d'", i);
				Result = db_query(Database, DB_Query);
				
				new crew_id = db_get_field_assoc_int(Result, "ID_CREW");

				new tmp_old = (CREW_INFO[getCrewIndexWithId(crew_id)][crew_MARKET_COUNT] - 1);
				CREW_INFO[getCrewIndexWithId(crew_id)][crew_MARKET_COUNT] = tmp_old;
				if (tmp_old < 0) tmp_old = 0;

				if (CREW_INFO[getCrewIndexWithId(crew_id)][crew_VALID])
				{
					format(DB_Query, sizeof DB_Query, "UPDATE `CREW` SET `MARKETS_COUNT` = '%d' WHERE `ID` = '%d';", tmp_old, getCrewIndexWithId(crew_id));
					db_free_result(db_query(Database, DB_Query));
				}

				/* UPDATE NEW CREW DATE */
				new tmp_new = (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_COUNT] + 1);
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_COUNT] = tmp_new;

				format(DB_Query, sizeof DB_Query, "UPDATE `CREW` SET `MARKETS_COUNT` = '%d' WHERE `ID` = '%d';", tmp_new, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID]);
				db_free_result(db_query(Database, DB_Query));

				/* UPDATE GRAFFITI DATE */
				format(DB_Query, sizeof DB_Query, "UPDATE `BLACK_MARKETS` SET `MARKET_ID` = '%d', `ID_CREW` = '%i', `LAST_START` = '%i' WHERE `MARKET_ID` = '%d';", i, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID], gettime(), i);
				db_free_result(db_query(Database, DB_Query));

				/* RESET OTHER CREW's */
				BLACK_MARKET_OBJ[i][bm_CREW_ONE] = 0;
				BLACK_MARKET_OBJ[i][bm_CREW_TWO] = 0;
				BLACK_MARKET_OBJ[i][bm_CREW_THREE] = 0;
			}
		}
	}
	return 1;
}

UpdateSizeBarMarket(crew_index, init)
{
	new Float:size = 502.0 + (floatround(CREW_INFO[crew_index][crew_MARKET_PROGRESS]) + 5.0),
		td_bg = init,
		td_bar = (init + 1);

	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][td_bar], 606.000000, 0.000000);

	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][td_bg], AdjustDarkness(CREW_INFO[crew_index][crew_COLOR], 1.75));
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][td_bar], CREW_INFO[crew_index][crew_COLOR]);

	if (size < 606.0)
	{
		TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][td_bar], size, 0.000000);
	}
	else
	{
		TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][td_bar], 606.000000, 0.000000);
	}
	return 1;
}

CheckMarketAttack(playerid)
{
	if (PLAYER_CREW[playerid][player_crew_VALID])
	{
		if (!PLAYER_WORKS[playerid][WORK_POLICE])
		{
			for(new i = 0; i < sizeof BLACK_MARKET_OBJ; i ++)
			{
				if (IsPlayerInRangeOfPoint(playerid, 1.5, BLACK_MARKET_OBJ[i][bm_EXTERIOR_X], BLACK_MARKET_OBJ[i][bm_EXTERIOR_Y], BLACK_MARKET_OBJ[i][bm_EXTERIOR_Z]))
				{
					if (GetPlayerInterior(playerid) == 0)
					{
						if (BLACK_MARKET_OBJ[i][bm_ACTIVATED] == true)
						{
							if (PLAYER_TEMP[playerid][py_IN_MARKET] == true) return 0;

							for(new z = 0, j = GetPlayerPoolSize(); z <= j; z++)
							{
								if (IsPlayerConnected(z))
								{
									if (PLAYER_TEMP[z][py_IN_MARKET])
									{
										ApplyAnimation(z, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 0, true);
										ClearAnimations(z);

										PLAYER_TEMP[z][py_IN_MARKET] = false;
										KillTimer(PLAYER_TEMP[z][py_TIMERS][41]);
									}
								}
							}

							PLAYER_TEMP[playerid][py_IN_MARKET] = true;
							ShowPlayerMessage(playerid, "Conquistando...~n~~r~0 %", 3);
							ApplyAnimation(playerid, "COP_AMBIENT", "COPBROWSE_NOD", 4.1, true, false, false, false, 0, false);
							PLAYER_TEMP[playerid][py_TIMERS][41] = SetTimerEx("UpdateMarketProgress", 1500, 1, "i", playerid);
							return 1;
						}
					}
				}
			}
		}
	}
	return 1;
}