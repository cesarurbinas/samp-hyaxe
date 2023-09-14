AddPlayerPoliceHistory(playerid, const by[], const reason[])
{
	if (!ACCOUNT_INFO[playerid][ac_ID]) return 0;

	new DB_Query[512];
	format(DB_Query, sizeof DB_Query,

		"\
			INSERT INTO `POLICE_HISTORY` (`ID_USER`, `BY`, `TEXT`) VALUES ('%d', '%q', '%q');\
			DELETE FROM `POLICE_HISTORY` WHERE `ID_USER` = '%d' AND `ID_USER` NOT IN (SELECT `ID_USER` FROM `POLICE_HISTORY` WHERE `ID_USER` = '%d' ORDER BY `DATE` DESC LIMIT 20);\
		",

		ACCOUNT_INFO[playerid][ac_ID], by, reason,
		ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_ID]
	);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

GetFreePoliceObjectSlot()
{
	for(new i = 0; i != MAX_POLICE_OBJECTS; i ++)
	{
		if (!POLICE_OBJECTS[i][police_object_VALID]) return i;
	}
	return -1;
}

DeleteIlegalInv(playerid, bool:drugs = false)
{
	if (!PLAYER_WORKS[playerid][WORK_POLICE])
	{
		// RESETIAR ARMAS AKI AKI
	}

	if (drugs)
	{
		PLAYER_MISC[playerid][MISC_SEED_CANNABIS] = 0;
		PLAYER_MISC[playerid][MISC_SEED_CRACK] = 0;
		PLAYER_MISC[playerid][MISC_CANNABIS] = 0;
		PLAYER_MISC[playerid][MISC_CRACK] = 0;
		SavePlayerMisc(playerid);
	}

	return 1;
}

SendPoliceNotification(const message[], time)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
			{
				if (PLAYER_WORKS[i][WORK_POLICE])
				{
					if (PLAYER_TEMP[i][py_WORKING_IN] == WORK_POLICE)
					{
						ShowPlayerNotification(i, message, time);
					}
				}
			}
		}
	}
	return 1;
}

CountPoliceRadioPlayers(radio)
{
	new total;
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
			{
				if (PLAYER_WORKS[i][WORK_POLICE])
				{
					if (PLAYER_TEMP[i][py_WORKING_IN] == WORK_POLICE)
					{
						if (PLAYER_TEMP[i][py_POLICE_RADIO] == radio)
						{
							total ++;
						}
					}
				}
			}
		}
	}
	return total;
}

SendPoliceRadioMessage(radio, color, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
			{
				if (PLAYER_WORKS[i][WORK_POLICE])
				{
					if (PLAYER_TEMP[i][py_WORKING_IN] == WORK_POLICE)
					{
						if (radio == -1) SendResponsiveMessage(i, color, message, 135);
						else
						{
							if (PLAYER_TEMP[i][py_POLICE_RADIO] == radio)
							{
								SendResponsiveMessage(i, color, message, 135);
							}
						}
					}
				}
			}
		}
	}
	return 1;
}

SetPlayerRangePoliceSearchLevel(playerid, level, Float:range, const reason[])
{
	if (PLAYER_WORKS[playerid][WORK_POLICE]) return 0;

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
			{
				if (PLAYER_WORKS[i][WORK_POLICE])
				{
					if (PLAYER_TEMP[i][py_WORKING_IN] == WORK_POLICE)
					{
						new Float:x, Float:y, Float:z;
						GetPlayerPos(playerid, x, y, z);
						if (GetPlayerDistanceFromPoint(playerid, x, y, z) <= range)
						{
							SetPlayerPoliceSearchLevel(playerid, PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] + level);
							
							format(PLAYER_TEMP[playerid][py_POLICE_REASON], 32, "%s", reason);
							ShowPlayerMessage(playerid, sprintf("~b~Has cometido un crimen: %s", reason), 5);
							AddMentalState(playerid, 1);
							break;
						}
					}
				}
			}
		}
	}
	return 1;
}

SetPlayerPoliceSearchLevel(playerid, level, bool:message = true)
{
	if (!level)
	{
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][43]);
		SendPoliceMark(playerid, PLAYER_COLOR);
		PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] = level;
		SetPlayerWantedLevel(playerid, 0);
		SavePlayerMisc(playerid);

		format(PLAYER_TEMP[playerid][py_POLICE_REASON], 32, "Ninguna");
		return 1;
	}

	level = (PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] + level);
	if (level > 6) level = 6;

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][43]);
	PLAYER_TEMP[playerid][py_TIMERS][43] = SetTimerEx("DisablePlayerPoliceSearchLevel", 300000 * level, false, "i", playerid);

	PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] = level;
	SetPlayerWantedLevel(playerid, level);
	SendPoliceMark(playerid, 0xCB2828FF);

    SavePlayerMisc(playerid);
    if (message) ShowPlayerNotification(playerid, "Sera mejor que corras, la policía te esta buscando", 3);
    return 1;
}