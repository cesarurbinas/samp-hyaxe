forward UpdateTerritoryAttack(territory_index);
public UpdateTerritoryAttack(territory_index)
{
	Logger_Debug("UpdateTerritoryAttack"); // This is a debug line!

	if (!TERRITORIES[territory_index][territory_VALID]) return 1;
	if (!TERRITORIES[territory_index][territory_WAR]) return 1;

	if (TERRITORIES[territory_index][territory_WAR_TIME_LEFT] - gettime() <= 0)
	{
		CREW_INFO[ TERRITORIES[territory_index][territory_CREW_INDEX] ][crew_FIGHTING] = false;
		TERRITORIES[territory_index][territory_CREW_ID] = CREW_INFO[ TERRITORIES[territory_index][territory_ATTACKER_CREW_INDEX] ][crew_ID];
		TERRITORIES[territory_index][territory_CREW_INDEX] = TERRITORIES[territory_index][territory_ATTACKER_CREW_INDEX];

		new r, g, b, a;
		hy_HexToRGBA(CREW_INFO[ TERRITORIES[territory_index][territory_ATTACKER_CREW_INDEX] ][crew_COLOR], r, g, b, a);
		TERRITORIES[territory_index][territory_COLOR] = hy_RGBAToHex(r, g, b, 135);

		new message[144];
		format(message, sizeof message, "%s ha conquistado un nuevo territorio.", CREW_INFO[ TERRITORIES[territory_index][territory_ATTACKER_CREW_INDEX] ][crew_NAME]);

		new str_text[144];
		format(str_text, sizeof(str_text), "[TERRITORIO] %s", message);
		SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 1);

		format(str_text, sizeof(str_text), "%s", message);
		SendDiscordWebhook(str_text, 4);

		new DBResult:rows, query[200];
		format(query, sizeof(query), "SELECT * FROM `CREW_TERRITORIES` WHERE `ID_TERRITORY` = %d;", TERRITORIES[territory_index][territory_ID]);
		rows = db_query(Database, query);
		if (!db_num_rows(rows))
		{
			format(query, sizeof(query), "\
				INSERT INTO `CREW_TERRITORIES` (`ID_CREW`, `ID_TERRITORY`) VALUES (%d, %d);", TERRITORIES[territory_index][territory_CREW_ID], TERRITORIES[territory_index][territory_ID]);
		}
		else
		{
			format(query, sizeof(query), "\
				UPDATE `CREW_TERRITORIES` SET \
					`ID_CREW` = %d \
				WHERE `ID_TERRITORY` = %d; \
			", TERRITORIES[territory_index][territory_CREW_ID],
			TERRITORIES[territory_index][territory_ID]);
		}
		db_free_result(rows);
		db_free_result(db_query(Database, query));

		CREW_INFO[ TERRITORIES[territory_index][territory_ATTACKER_CREW_INDEX] ][crew_LAST_ATTACK] = gettime();
		CREW_INFO[ TERRITORIES[territory_index][territory_ATTACKER_CREW_INDEX] ][crew_FIGHTING] = false;
		TERRITORIES[territory_index][territory_WAR] = false;
		TERRITORIES[territory_index][territory_ATTACKER_CREW_INDEX] = 0;
		TERRITORIES[territory_index][territory_WAR_TIME_LEFT] = 0;
		TERRITORIES[territory_index][territory_LAST_ATTACK] = gettime();
		KillTimer(TERRITORIES[territory_index][territory_TIMER]);
		UpdateGangZoneColor(territory_index);
		TERRITORIES[territory_index][territory_OCCUPIED] = true;

		new prize = minrand(2000, 6000);
		new prize_message[128];
		format(prize_message, sizeof prize_message, "Han ganado %d$ por conquistar este territorio.", prize);

		for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
		{
			if (IsPlayerConnected(i))
			{
				if (PLAYER_CREW[i][player_crew_VALID])
				{
					ShowPlayerNotification(i, message, 4);
					if (IsPlayerInDynamicArea(i, TERRITORIES[territory_index][territory_AREA]))
					{
						if (PLAYER_CREW[i][player_crew_ID] == TERRITORIES[territory_index][territory_CREW_ID])
						{
							GivePlayerCash(i, prize);
							ShowPlayerNotification(i, prize_message, 5);
						}

						SetPlayerNormalColor(i);

						TextDrawHideForPlayer(i, Textdraws[textdraw_TERRITORY_BOX]);
						TextDrawHideForPlayer(i, TERRITORIES[territory_index][territory_TEXTDRAW]);
					}
				}
			}
		}
		return 1;
	}


	new message[144], progress[128];
	format(progress, sizeof progress, "~r~%s", TimeConvert(TERRITORIES[territory_index][territory_WAR_TIME_LEFT] - gettime()));

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_CREW[i][player_crew_VALID])
			{
				if (IsPlayerInDynamicArea(i, TERRITORIES[territory_index][territory_AREA]))
				{
					GameTextForPlayer(i, progress, 1000, 1);
				}
			}
		}
	}

	new attackers_in_area = CountCrewPlayersInTerritory(TERRITORIES[territory_index][territory_ATTACKER_CREW_INDEX], territory_index);
	if (attackers_in_area <= 0)
	{
		format(message, sizeof message, "%s no ha podido completar su conquista.", CREW_INFO[ TERRITORIES[territory_index][territory_ATTACKER_CREW_INDEX] ][crew_NAME]);

		new str_text[144];
		format(str_text, sizeof(str_text), "[TERRITORIO] %s", message);
		SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 1);

		format(str_text, sizeof(str_text), "%s", message);
		SendDiscordWebhook(str_text, 4);

		CREW_INFO[ TERRITORIES[territory_index][territory_ATTACKER_CREW_INDEX] ][crew_LAST_ATTACK] = gettime();
		CREW_INFO[ TERRITORIES[territory_index][territory_ATTACKER_CREW_INDEX] ][crew_FIGHTING] = false;
		CREW_INFO[ TERRITORIES[territory_index][territory_CREW_INDEX] ][crew_FIGHTING] = false;
		TERRITORIES[territory_index][territory_WAR] = false;
		TERRITORIES[territory_index][territory_ATTACKER_CREW_INDEX] = 0;
		TERRITORIES[territory_index][territory_WAR_TIME_LEFT] = 0;
		TERRITORIES[territory_index][territory_LAST_ATTACK] = gettime();
		KillTimer(TERRITORIES[territory_index][territory_TIMER]);
		UpdateGangZoneColor(territory_index);

		for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
		{
			if (IsPlayerConnected(i))
			{
				if (PLAYER_CREW[i][player_crew_VALID])
				{
					ShowPlayerNotification(i, message, 4);
					if (IsPlayerInDynamicArea(i, TERRITORIES[territory_index][territory_AREA]))
					{
						SetPlayerNormalColor(i);

						TextDrawHideForPlayer(i, Textdraws[textdraw_TERRITORY_BOX]);
						TextDrawHideForPlayer(i, TERRITORIES[territory_index][territory_TEXTDRAW]);
						ShowPlayerMessage(i, "~r~Conquista cancelada", 3);
					}
				}
			}
		}
		return 1;
	}
	return 1;
}