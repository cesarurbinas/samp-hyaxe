forward neuroadmin_BotGetResponse(index, response_code, const data[]);
public neuroadmin_BotGetResponse(index, response_code, const data[])
{
	#if DEBUG_MODE == 1
		printf("neuroadmin_BotGetResponse %d %d %s", index, response_code, data);
	#endif

	if (IsPlayerConnected(index))
	{
		new str_text[264];
	    if (response_code == 200)
	    {
	    	printf("[NEUROADMIN] Data: %s", data);

	    	format(str_text, sizeof(str_text), 
	    		"[Dudas] "COL_WHITE"NeuroAdmin: (( @%d %s ))",
	    		index,
	    		data
	    	);

	    	printf("[NEUROADMIN] Doubt: %s", str_text);
	    	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
			{
				if (IsPlayerConnected(i))
				{
					if ((PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_DEAD) && ACCOUNT_INFO[i][ac_DOUBT_CHANNEL])
					{
						SendResponsiveMessage(i, COLOR_DARK_GREEN, str_text, 135);
					}
				}
			}

			new DCC_Channel:channelid;
			channelid = DCC_FindChannelById("790742732829491230");
			SendDiscordMessage(channelid, "%s", str_text);
	    }
	    else
	    {
			format(str_text, sizeof(str_text), "{\"author\": \"%s\", \"playerid\": %d, \"message\": \"%s\"}", PLAYER_TEMP[index][py_NAME], index, PLAYER_TEMP[index][py_LAST_DOUBT]);
			HTTP(index, HTTP_POST, "51.222.21.190:6666/check_bad_use", str_text, "neuroadmin_BotCheckBadUse");
	    }
	}
	return 1;
}

forward neuroadmin_BotCheckBadUse(index, response_code, const data[]);
public neuroadmin_BotCheckBadUse(index, response_code, const data[])
{
	#if DEBUG_MODE == 1
		printf("neuroadmin_BotCheckBadUse %d %d %s", index, response_code, data); // debug juju
	#endif

	if (IsPlayerConnected(index))
	{
	    if (response_code == 200)
	    {
	    	if (data[0] == 'Y')
			{
				new seconds = 60 * 60;

				SendClientMessageEx(index, COLOR_ORANGE, "[Alerta]"COL_WHITE" NeuroAdmin te silenció del canal de dudas y anuncios por Mal uso - Tiempo: 60");
				PLAYER_MISC[index][MISC_MUTES] ++;
				PLAYER_MISC[index][MISC_MUTE] = gettime() + seconds;
				SavePlayerMisc(index);

				new str_text[145];
			    format(str_text, 145, "[Dudas] "COL_WHITE"NeuroAdmin silenció a %s (%d) del canal de dudas/anuncios: Mal uso", ACCOUNT_INFO[index][ac_NAME], index);

			    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
				{
					if (IsPlayerConnected(i))
					{
						if ((PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_DEAD) && ACCOUNT_INFO[i][ac_DOUBT_CHANNEL])
						{
							SendResponsiveMessage(i, COLOR_DARK_GREEN, str_text, 135);
						}
					}
				}

				format(str_text, 145, "[DUDAS] %s (%d): %s", ACCOUNT_INFO[index][ac_NAME], index, PLAYER_TEMP[index][py_LAST_DOUBT]);
			    SendDiscordWebhook(str_text, 1);

				format(str_text, 145, "NeuroAdmin silencio a %s (%d) del canal de dudas/anuncios: Mal uso", ACCOUNT_INFO[index][ac_NAME], index);
			    SendDiscordWebhook(str_text, 1);

			    new DCC_Channel:channelid;
				channelid = DCC_FindChannelById("790742732829491230");
				SendDiscordMessage(channelid, "%s", str_text);
			}
	    }
	}
	return 1;
}