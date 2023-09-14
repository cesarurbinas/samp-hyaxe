SendMessageToDoubtChannel(playerid, const message[])
{
	new str[364];

	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL]) format(str, sizeof(str), "[Dudas] "COL_WHITE"%s %s (%d): (( %s ))", ADMIN_LEVELS[ ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] ], PLAYER_TEMP[playerid][py_RP_NAME], playerid, message);
	else
	{
		format(str, sizeof(str), "[Dudas] "COL_WHITE"Jugador %s (%d): (( %s ))", PLAYER_TEMP[playerid][py_RP_NAME], playerid, message);
		ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_YELLOW"Recordatorio", ""COL_WHITE"Recuerde que si dice cosas sarcásticas, insultos, anuncios o\n\
			cualquier cosa que no sea relacionada al tema del canal\n\
			puede ser muteado y a los 4 muteos no va a poder enviar\n\
			dudas ni anuncios.", "Cerrar", "");
	}

	Log("doubt", str);

	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		ReplaceStringByRegex(str, "\\B@(\\w+)", "{4db6ac}@$1{F0F0F0}", str);
	}

	PLAYER_TEMP[playerid][py_DOUBT_CHANNEL_TIME] = gettime();

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if ((PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_DEAD) && ACCOUNT_INFO[i][ac_DOUBT_CHANNEL] && !PLAYER_TEMP[playerid][py_NEW_USER])
			{
				SendResponsiveMessage(i, COLOR_DARK_GREEN, str, 135);
			}
		}
	}

	#if defined FINAL_BUILD
		if (!ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL]) ScanDoubt(playerid, message);
	#endif
	return 1;
}

#if defined FINAL_BUILD
ScanDoubt(playerid, const doubt[])
{
	new payload[264];
	format(payload, sizeof(payload), "{\"author\": \"%s\", \"playerid\": %d, \"question\": \"%s\"}", PLAYER_TEMP[playerid][py_NAME], playerid, doubt);
	HTTP(playerid, HTTP_POST, "vulcan.hyaxe.com:6666/get_response", payload, "neuroadmin_BotGetResponse");
	return 1;
}
#endif

SendMessageToGlobalChannel(playerid, const message[])
{
	new str[364];

	format(str, sizeof(str),
		"%s%s (%d) (GLOBAL):%s %s",
		COLOR_INFO[ PLAYER_MISC[playerid][MISC_GLOBAL_NAME_COLOR] ][color_HEX],
		PLAYER_TEMP[playerid][py_RP_NAME],
		playerid,
		COLOR_INFO[ PLAYER_MISC[playerid][MISC_GLOBAL_CHAT_COLOR] ][color_HEX],
		message
	);

	Log("global", str);

	PLAYER_TEMP[playerid][py_GLOBAL_CHANNEL_TIME] = gettime();

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_MISC[i][MISC_GLOBAL_CHAT])
			{
				SendResponsiveMessage(i, COLOR_WHITE, str, 135);
			}
		}
	}
	return 1;
}
