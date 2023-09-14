forward UpdateMarketProgress(playerid);
public UpdateMarketProgress(playerid)
{
	#if DEBUG_MODE == 1
		printf("UpdateMarketProgress"); // debug juju
	#endif

	if (IsPlayerPaused(playerid)) return 0;
	if (GetPlayerInterior(playerid) != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return 0;

	//Strings
	new crew_one[64],
		crew_two[64],
		crew_three[64],
		player_str[128];

	for(new x = 0; x < sizeof BLACK_MARKET_OBJ; x ++)
	{
		if (BLACK_MARKET_OBJ[x][bm_ACTIVATED] == true)
		{
			//Give crew text slot
			if (BLACK_MARKET_OBJ[x][bm_CREW_ONE] == 0)
			{
				if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_MARKET] == false)
				{
					BLACK_MARKET_OBJ[x][bm_CREW_ONE] = CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID];
					CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_MARKET] = true;

					format(crew_one, sizeof(crew_one), "%s~n~ _", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
					TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][1], crew_one);
					UpdateSizeBarMarket(PLAYER_CREW[playerid][player_crew_INDEX], 5);
				}
			}

			if (BLACK_MARKET_OBJ[x][bm_CREW_TWO] == 0)
			{
				if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_MARKET] == false)
				{
					BLACK_MARKET_OBJ[x][bm_CREW_TWO] = CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID];
					CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_MARKET] = true;

					format(crew_two, sizeof(crew_two), "%s~n~ _", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
					TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][3], crew_two);
					UpdateSizeBarMarket(PLAYER_CREW[playerid][player_crew_INDEX], 7);
				}
			}

			if (BLACK_MARKET_OBJ[x][bm_CREW_THREE] == 0)
			{
				if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_MARKET] == false)
				{
					BLACK_MARKET_OBJ[x][bm_CREW_THREE] = CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID];
					CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_MARKET] = true;

					format(crew_three, sizeof(crew_three), "%s~n~ _", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
					TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][4], crew_three);
					UpdateSizeBarMarket(PLAYER_CREW[playerid][player_crew_INDEX], 9);
				}
			}

			//Check initial crew text slot
			if (BLACK_MARKET_OBJ[x][bm_CREW_ONE] == CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID])
			{
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_PROGRESS] ++;

				TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][1], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);
				
				format(crew_one, sizeof(crew_one), "%s~n~ _", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][1], crew_one);
				UpdateSizeBarMarket(PLAYER_CREW[playerid][player_crew_INDEX], 5);
			}

			if (BLACK_MARKET_OBJ[x][bm_CREW_TWO] == CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID])
			{
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_PROGRESS] ++;

				TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][3], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);
				
				format(crew_two, sizeof(crew_two), "%s~n~ _", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][3], crew_two);
				UpdateSizeBarMarket(PLAYER_CREW[playerid][player_crew_INDEX], 7);
			}

			if (BLACK_MARKET_OBJ[x][bm_CREW_THREE] == CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID])
			{
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_PROGRESS] ++;

				TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][4], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);
				
				format(crew_three, sizeof(crew_three), "%s~n~ _", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][4], crew_three);
				UpdateSizeBarMarket(PLAYER_CREW[playerid][player_crew_INDEX], 9);
			}

			for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
			{
				if (IsPlayerConnected(i))
				{
					if (PLAYER_CREW[i][player_crew_VALID] || PLAYER_WORKS[i][WORK_POLICE])
					{
						TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][0]);

						if (BLACK_MARKET_OBJ[x][bm_CREW_ONE] > 0)
						{
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][1]);
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][5]);
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][6]);
						}

						if (BLACK_MARKET_OBJ[x][bm_CREW_TWO] > 0)
						{
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][3]);
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][7]);
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][8]);
						}

						if (BLACK_MARKET_OBJ[x][bm_CREW_THREE] > 0)
						{
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][4]);
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][9]);
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][10]);
						}

						TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][2]);
					}
				}
			}
		}
	}

	ApplyAnimation(playerid, "COP_AMBIENT", "COPBROWSE_NOD", 4.1, true, false, false, false, 0, false);
	format(player_str, sizeof(player_str), "Conquistando...~n~~r~%d %", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_PROGRESS]);
	ShowPlayerMessage(playerid, player_str, 3);
	CheckMarketProgress(playerid);
    return 1;
}
