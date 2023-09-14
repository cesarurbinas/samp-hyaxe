enum E_RESULT_DATA {
	result_ID[12],
	result_NAME[86],
	result_UPLOADED[51]
};
new PLAYER_DIALOG_MP3_RESULT[MAX_PLAYERS][11][E_RESULT_DATA];

forward OnYouTubeQueryResponse(playerid, response_code, data[]);
forward OnDownloadResponse(playerid, response_code, data[]);

// ==========================================================================

public OnYouTubeQueryResponse(playerid, response_code, data[])
{
	printf("OnYouTubeQueryResponse - playerid %d - response_code %d - data [JSON]", playerid, response_code);
	if (!PLAYER_TEMP[playerid][py_PLAYER_WAITING_MP3_HTTP]) return 1;

	if (response_code == 200)
	{
		new Node:vidata, results, Node:arr_data, length;
		JSON_Parse(data, vidata);
		JSON_GetInt(vidata, "result_count", results);
		JSON_GetArray(vidata, "results", arr_data);
		JSON_ArrayLength(arr_data, length);

		new dialog[250 * 10], line[250];
		format(dialog, sizeof(dialog), ""COL_WHITE"Subido por\t"COL_WHITE"Título\n");
		for(new i = 0; i < length; i++)
		{
			new Node:object;
			JSON_ArrayObject(arr_data, i, object);
			JSON_GetString(object, "id", PLAYER_DIALOG_MP3_RESULT[playerid][i][result_ID]);
			JSON_GetString(object, "title", PLAYER_DIALOG_MP3_RESULT[playerid][i][result_NAME]);
			JSON_GetString(object, "uploaded_by", PLAYER_DIALOG_MP3_RESULT[playerid][i][result_UPLOADED]);
			format(line, sizeof(line), "%s\t%s\n", PLAYER_DIALOG_MP3_RESULT[playerid][i][result_UPLOADED], PLAYER_DIALOG_MP3_RESULT[playerid][i][result_NAME]);
			strcat(dialog, line);
		}

		PLAYER_TEMP[playerid][py_DIALOG_RESPONDED] = false;
		ShowPlayerDialog(playerid, DIALOG_PLAYER_MP3_RESULTS, DIALOG_STYLE_TABLIST_HEADERS, sprintf(""COL_RED"%d resultados", results), dialog, "Selecc", "Cancelar");
	} else ShowPlayerMessage(playerid, "~r~No se pudo procesar su busqueda.", 3);

	return 1;
}

public OnDownloadResponse(playerid, response_code, data[])
{
	printf("OnDownloadResponse - playerid %d - response_code %d - data %s", playerid, response_code, data);
	PLAYER_TEMP[playerid][py_PLAYER_WAITING_MP3_HTTP] = false;

	ShowPlayerNotification(playerid, "Espere, estamos procesando el video...", 3);

	if (response_code != 200)
	{
		switch(response_code)
		{
			case 403: return ShowPlayerMessage(playerid, "~r~No pudimos reproducir esta canción", 4);
			case 429: return ShowPlayerNotification(playerid, "Se han estado solicitando muchas canciones ultimamente, intenta más tarde.", 6);
			default: return 0;
		}
	}

	new url[128];
	format(url, sizeof(url), "http://51.178.211.161:12345/stream/%s.mp3", PLAYER_DIALOG_MP3_RESULT[playerid][ PLAYER_TEMP[playerid][py_RESULT_INDEX] ][result_ID]);

	if (PLAYER_TEMP[playerid][py_MUSIC_FOR_PROPERTY])
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
		PLAYER_TEMP[playerid][py_MUSIC_FOR_PROPERTY] = false;
	}
	else if (PLAYER_TEMP[playerid][py_MUSIC_FOR_VEHICLE])
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
		PLAYER_TEMP[playerid][py_MUSIC_FOR_VEHICLE] = false;
	}
	else
	{
		PlayAudioStreamForPlayer(playerid, url);
		ShowPlayerNotification(playerid, sprintf("Reproduciendo %s", PLAYER_DIALOG_MP3_RESULT[playerid][ PLAYER_TEMP[playerid][py_RESULT_INDEX] ][result_NAME]), 5);
	}

	return 1;
}