enum E_RESULT_DATA {
	result_ID[12],
	result_NAME[86],
	result_UPLOADED[51],
	result_DURATION
};
new PLAYER_DIALOG_MP3_RESULT[MAX_PLAYERS][6][E_RESULT_DATA];

forward OnYouTubeQueryResponse(playerid, response_code, data[]);
forward OnDownloadResponse(playerid, response_code, data[]);

// ==========================================================================

public OnYouTubeQueryResponse(playerid, response_code, data[])
{
	printf("OnYouTubeQueryResponse - playerid %d - response_code %d - data %s", playerid, response_code, data);
	if (!PLAYER_TEMP[playerid][py_PLAYER_WAITING_MP3_HTTP]) return 1;

<<<<<<< HEAD
=======
	PLAYER_TEMP[playerid][py_LAST_SEARCH] = gettime();
	
>>>>>>> refs/rewritten/assds
	if(response_code != 200)
	{
		PLAYER_TEMP[playerid][py_PLAYER_WAITING_MP3_HTTP] = false;

		switch(response_code)
		{
			case 403: return ShowPlayerMessage(playerid, "~r~Hubo un error intentando buscar el contenido.", 4);
			case 429: return ShowPlayerNotification(playerid, "Se han estado solicitando muchas canciones ultimamente, intenta más tarde.", 6);
			default: return ShowPlayerMessage(playerid, "~r~Hubo un error intentando buscar el contenido, intenta nuevamente en un minuto.", 4);
		}
	}

	new Node:vidata, Node:arr_data, length;
	JSON_Parse(data, vidata);
	JSON_GetArray(vidata, "results", arr_data);
	JSON_Cleanup(vidata);
	JSON_ArrayLength(arr_data, length);

	new dialog[250 * 10], line[350];
	format(dialog, sizeof(dialog), ""COL_WHITE"Título\t"COL_WHITE"Subido por\t"COL_WHITE"Duración\n");
	for(new i = 0; i < length; i++)
	{
		new Node:object;
		JSON_ArrayObject(arr_data, i, object);
		JSON_GetString(object, "id", PLAYER_DIALOG_MP3_RESULT[playerid][i][result_ID]);
		JSON_GetString(object, "title", PLAYER_DIALOG_MP3_RESULT[playerid][i][result_NAME]);
		JSON_GetString(object, "uploaded_by", PLAYER_DIALOG_MP3_RESULT[playerid][i][result_UPLOADED]);
		JSON_GetInt(object, "duration", PLAYER_DIALOG_MP3_RESULT[playerid][i][result_DURATION]);
		JSON_Cleanup(object);
		if(PLAYER_DIALOG_MP3_RESULT[playerid][i][result_DURATION] >= 60) format(line, sizeof(line), "%s\t{b3b3b3}%s\t%s minuto(s)\n", PLAYER_DIALOG_MP3_RESULT[playerid][i][result_NAME], PLAYER_DIALOG_MP3_RESULT[playerid][i][result_UPLOADED], TimeConvert(PLAYER_DIALOG_MP3_RESULT[playerid][i][result_DURATION]));
		else format(line, sizeof(line), "%s\t{b3b3b3}%s\t%d segundos\n", PLAYER_DIALOG_MP3_RESULT[playerid][i][result_NAME], PLAYER_DIALOG_MP3_RESULT[playerid][i][result_UPLOADED], PLAYER_DIALOG_MP3_RESULT[playerid][i][result_DURATION]);
		strcat(dialog, line);
	}
	JSON_Cleanup(arr_data);

	PLAYER_TEMP[playerid][py_DIALOG_RESPONDED] = false;
	ShowPlayerDialog(playerid, DIALOG_PLAYER_MP3_RESULTS, DIALOG_STYLE_TABLIST_HEADERS, sprintf(""COL_RED"%d resultados", length), dialog, "Selecc.", "Cancelar");

	return 1;
}

public OnDownloadResponse(playerid, response_code, data[])
{
	printf("OnDownloadResponse - playerid %d - response_code %d - data %s", playerid, response_code, data);
	PLAYER_TEMP[playerid][py_PLAYER_WAITING_MP3_HTTP] = false;

<<<<<<< HEAD
	if (response_code != 200)
=======
	ShowPlayerNotification(playerid, "Espere, estamos procesando el video...", 3);

	if (response_code != 200) // data = OK
>>>>>>> refs/rewritten/Bugs-varios-arreglados
	{
		switch(response_code)
		{
			case 403: return ShowPlayerMessage(playerid, "~r~No pudimos reproducir esta canción", 4);
			case 429, 500: return ShowPlayerNotification(playerid, "Se han estado solicitando muchas canciones ultimamente, intenta más tarde.", 6);
			default: return 0;
		}
	}

	new url[128];
	format(url, sizeof(url), "http://51.178.211.161:12345/stream/%s.mp3", PLAYER_DIALOG_MP3_RESULT[playerid][ PLAYER_TEMP[playerid][py_RESULT_INDEX] ][result_ID]);

	if(CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_OWN_PROPERTY)
	{
		for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
		{
			if (IsPlayerConnected(i))
			{
				if ( (CHARACTER_INFO[i][ch_STATE] == ROLEPLAY_STATE_OWN_PROPERTY || CHARACTER_INFO[i][ch_STATE] == ROLEPLAY_STATE_GUEST_PROPERTY) && CHARACTER_INFO[i][ch_INTERIOR_EXTRA] == CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA])
				{
					PlayAudioStreamForPlayer(i, url);
					ShowPlayerNotification(i, sprintf("Reproduciendo %s", PLAYER_DIALOG_MP3_RESULT[playerid][ PLAYER_TEMP[playerid][py_RESULT_INDEX] ][result_NAME]), 5);
				}
			}
		}
	}
	else if (IsPlayerInAnyVehicle(playerid))
	{
		new vehid = GetPlayerVehicleID(playerid);
		if(PLAYER_VEHICLES[vehid][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID])
		{
			for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
			{
				if (IsPlayerConnected(i))
				{
					if (IsPlayerInAnyVehicle(i))
					{
						if (GetPlayerVehicleID(playerid) == GetPlayerVehicleID(i))
						{
							PlayAudioStreamForPlayer(i, url);
							ShowPlayerNotification(i, sprintf("Reproduciendo %s", PLAYER_DIALOG_MP3_RESULT[playerid][ PLAYER_TEMP[playerid][py_RESULT_INDEX] ][result_NAME]), 5);
						}
					}
				}
			}
		}
	}
	else if(PLAYER_TEMP[playerid][py_MUSIC_BOOMBOX] != -1)
	{
		PlayAudioInBoombox(playerid, PLAYER_TEMP[playerid][py_MUSIC_BOOMBOX], url);
		PLAYER_TEMP[playerid][py_MUSIC_BOOMBOX] = -1;
	}
	else
	{
		PlayAudioStreamForPlayer(playerid, url);
		ShowPlayerNotification(playerid, sprintf("Reproduciendo %s", PLAYER_DIALOG_MP3_RESULT[playerid][ PLAYER_TEMP[playerid][py_RESULT_INDEX] ][result_NAME]), 5);
	}
	return 1;
}