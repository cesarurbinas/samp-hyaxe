CountCrewPlayersInTerritory(crew_index, territory_index)
{
	new count;
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_CREW[i][player_crew_VALID])
			{
				if (PLAYER_CREW[i][player_crew_INDEX] == crew_index)
				{
					if (CHARACTER_INFO[i][ch_STATE] == ROLEPLAY_STATE_NORMAL && PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
					{
						if (!IsPlayerPaused(i))
						{
							if (IsPlayerInDynamicArea(i, TERRITORIES[territory_index][territory_AREA]))
							{
								count ++;
							}
						}
					}
				}
			}
		}
	}
	return count;
}

GetAvaibleCrewIndex()
{
	for(new i = 0; i != MAX_CREWS; i ++)
	{
		if (!CREW_INFO[i][crew_VALID]) return i;
	}
	return -1;
}

NewCrewRegister(index)
{
	if (!CREW_INFO[index][crew_VALID]) return 0;

	new DBResult:Result, DB_Query[340];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `CREW`\
		(\
			`NAME`, `COLOR`, `GRAFFITIS_COUNT`\
		)\
		VALUES\
		(\
			'%q', '%d', '0'\
		);\
		SELECT MAX(`ID`) FROM `CREW`;\
	",
		CREW_INFO[index][crew_NAME],
		CREW_INFO[index][crew_COLOR]
	);
	Result = db_query(Database, DB_Query);
	if (db_num_rows(Result)) CREW_INFO[index][crew_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);



	for(new i = 0; i != MAX_CREW_RANKS; i ++)
	{
		if (!CREW_RANK_INFO[index][i][crew_rank_VALID]) continue;

		new DBResult:Result_ranks;
		format(DB_Query, sizeof DB_Query,
		"\
			INSERT INTO `CREW_RANKS`\
			(\
				`ID_CREW`, `RANK_POS`, `RANK_NAME`\
			)\
			VALUES\
			(\
				'%d', '%d', '%q'\
			);\
			SELECT MAX(`ID`) FROM `CREW_RANKS`;\
		",
			CREW_INFO[index][crew_ID],
			i,
			CREW_RANK_INFO[index][i][crew_rank_NAME]
		);
		Result_ranks = db_query(Database, DB_Query);

		if (db_num_rows(Result_ranks)) CREW_RANK_INFO[index][i][crew_rank_ID] = db_get_field_int(Result_ranks, 0);
		db_free_result(Result_ranks);

		for(new x = 0; x != CREW_RANK_SIZE; x ++)
		{
			format(DB_Query, sizeof DB_Query,
			"\
				INSERT INTO `RANK_PERMISSIONS`\
				(\
					`ID_RANK`, `PERMISSION`, `SET`\
				)\
				VALUES\
				(\
					'%d', '%d', '%d'\
				);\
			",
				CREW_RANK_INFO[index][i][crew_rank_ID],
				x,
				CREW_RANK_INFO[index][i][crew_rank_PERMISSION][x]
			);
			db_free_result(db_query(Database, DB_Query));
		}

	}
	return 1;
}

SendMessageToCrewMembers(crew_id, color, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_CREW[i][player_crew_VALID])
			{
				if (PLAYER_CREW[i][player_crew_ID] == crew_id)
				{
					SendResponsiveMessage(i, color, message, 135);
				}
			}
		}
	}
	return 1;
}

SaveNotificationToCrewMemeber(crew_id, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_CREW[i][player_crew_VALID])
			{
				if (PLAYER_CREW[i][player_crew_ID] == crew_id)
				{
					SavePlayerNotification(i, message);
				}
			}
		}
	}
	return 1;
}

RegisterNewCrewRank(index, rank)
{
	new DBResult:Result_ranks, DB_Query[340];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `CREW_RANKS`\
		(\
			`ID_CREW`, `RANK_POS`, `RANK_NAME`\
		)\
		VALUES\
		(\
			'%d', '%d', '%q'\
		);\
		SELECT MAX(`ID`) FROM `CREW_RANKS`;\
	",
		CREW_INFO[index][crew_ID],
		rank,
		CREW_RANK_INFO[index][rank][crew_rank_NAME]
	);
	Result_ranks = db_query(Database, DB_Query);

	if (db_num_rows(Result_ranks)) CREW_RANK_INFO[index][rank][crew_rank_ID] = db_get_field_int(Result_ranks, 0);
	db_free_result(Result_ranks);

	for(new x = 0; x != CREW_RANK_SIZE; x ++)
	{
		format(DB_Query, sizeof DB_Query,
		"\
			INSERT INTO `RANK_PERMISSIONS`\
			(\
				`ID_RANK`, `PERMISSION`, `SET`\
			)\
			VALUES\
			(\
				'%d', '%d', '%d'\
			);\
		",
			CREW_RANK_INFO[index][rank][crew_rank_ID],
			x,
			CREW_RANK_INFO[index][rank][crew_rank_PERMISSION][x]
		);
		db_free_result(db_query(Database, DB_Query));
	}
	return 1;
}

SetPlayerGangZones(playerid)
{
	for(new i = 0; i != MAX_TERRITORIES; i ++)
	{
		if (!TERRITORIES[i][territory_VALID]) continue;

		if (TERRITORIES[i][territory_WAR])
		{
			new flash_color, r, g, b, a;
			hy_HexToRGBA(CREW_INFO[ TERRITORIES[i][territory_ATTACKER_CREW_INDEX] ][crew_COLOR], r, g, b, a);
			flash_color = hy_RGBAToHex(r, g, b, 135);

			GangZoneFlashForPlayer(playerid, TERRITORIES[i][territory_GANG_ZONE], flash_color);
		}
		else GangZoneShowForPlayer(playerid, TERRITORIES[i][territory_GANG_ZONE], TERRITORIES[i][territory_COLOR]);
	}
	return 1;
}

HidePlayerGangZones(playerid)
{
	for(new i = 0; i != MAX_TERRITORIES; i ++)
	{
		if (!TERRITORIES[i][territory_VALID]) continue;

		GangZoneHideForPlayer(playerid, TERRITORIES[i][territory_GANG_ZONE]);
	}
	return 1;
}

UpdateGangZoneColor(index)
{
	if (TERRITORIES[index][territory_WAR])
	{
		new flash_color, r, g, b, a;
		hy_HexToRGBA(CREW_INFO[ TERRITORIES[index][territory_ATTACKER_CREW_INDEX] ][crew_COLOR], r, g, b, a);
		flash_color = hy_RGBAToHex(r, g, b, 135);

		for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
		{
			if (IsPlayerConnected(i))
			{
				if (PLAYER_CREW[i][player_crew_VALID])
				{
					GangZoneFlashForPlayer(i, TERRITORIES[index][territory_GANG_ZONE], flash_color);
				}
			}
		}
	}
	else
	{
		for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
		{
			if (IsPlayerConnected(i))
			{
				if (PLAYER_CREW[i][player_crew_VALID])
				{
					GangZoneShowForPlayer(i, TERRITORIES[index][territory_GANG_ZONE], TERRITORIES[index][territory_COLOR]);
				}
			}
		}
	}
	return 1;
}

StartTerritoryAttack(crew_index, territory_index, time)
{
	CREW_INFO[crew_index][crew_FIGHTING] = true;
	CREW_INFO[crew_index][crew_LAST_ATTACK] = gettime();
	TERRITORIES[territory_index][territory_WAR] = true;
	TERRITORIES[territory_index][territory_ATTACKER_CREW_INDEX] = crew_index;
	TERRITORIES[territory_index][territory_WAR_TIME_LEFT] = gettime() + time;
	TERRITORIES[territory_index][territory_LAST_ATTACK] = gettime();
	UpdateGangZoneColor(territory_index);

	new message[144];

	KillTimer(TERRITORIES[territory_index][territory_TIMER]);
	TERRITORIES[territory_index][territory_TIMER] = SetTimerEx("UpdateTerritoryAttack", 1000, true, "i", territory_index);

	if (TERRITORIES[territory_index][territory_OCCUPIED])
	{
		CREW_INFO[ TERRITORIES[territory_index][territory_CREW_INDEX] ][crew_FIGHTING] = true;
		format(message, sizeof message, "%s está atacando un territorio de %s en %s.", CREW_INFO[crew_index][crew_NAME], CREW_INFO[ TERRITORIES[territory_index][territory_CREW_INDEX] ][crew_NAME], TERRITORIES[territory_index][territory_NAME]);
	}
	else format(message, sizeof message, "%s está atacando un territorio en %s.", CREW_INFO[crew_index][crew_NAME], TERRITORIES[territory_index][territory_NAME]);

	new str_text[144];
	format(str_text, sizeof(str_text), "[TERRITORIO] %s", message);
	SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 1);

	format(str_text, sizeof(str_text), "%s", message);
	SendDiscordWebhook(str_text, 4);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_CREW[i][player_crew_VALID])
			{
				ShowPlayerNotification(i, message, 4);
				if (IsPlayerInDynamicArea(i, TERRITORIES[territory_index][territory_AREA]))
				{
					new r, g, b, a;
					hy_HexToRGBA(CREW_INFO[ PLAYER_CREW[i][player_crew_INDEX] ][crew_COLOR], r, g, b, a);
				}
			}
		}
	}
	return 1;
}