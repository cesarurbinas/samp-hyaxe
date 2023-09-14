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
	if(response_code == 200)
	{
		new Node:vidata, results, Node:arr_data, length;
		JSON_Parse(data, vidata);
		JSON_GetInt(vidata, "result_count", results);
		JSON_GetArray(vidata, "results", arr_data);
		JSON_ArrayLength(arr_data, length);

		new dialog[250 * 10], line[250];
		format(dialog, sizeof(dialog), "Subido por\tTítulo\n");
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

		ShowPlayerDialog(playerid, DIALOG_PLAYER_MP3_RESULTS, DIALOG_STYLE_TABLIST_HEADERS, sprintf("Resultados - %d", results), dialog, "Reproducir", "Cancelar");
	} else ShowPlayerMessage(playerid, "~r~No se pudo procesar su busqueda.", 3);

	return 1;
}

public OnDownloadResponse(playerid, response_code, data[])
{
	if(response_code != 200)
	{
		switch(response_code)
		{
			case 403: return SendClientMessage(playerid, COLOR_WHITE, "No pudimos reproducir esta canción...");
			case 429: return SendClientMessage(playerid, COLOR_WHITE, "Se han estado solicitando muchas canciones ultimamente, intenta más tarde.");
			default: return 0;
		}
	}

	new url[128];
	format(url, sizeof(url), "127.0.0.1:12345%s", data); // /pipe/%d

	if (PLAYER_TEMP[playerid][py_MUSIC_FOR_PROPERTY])
	{
		for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
		{
			if (IsPlayerConnected(i))
			{
				if ( (CHARACTER_INFO[i][ch_STATE] == ROLEPLAY_STATE_OWN_PROPERTY || CHARACTER_INFO[i][ch_STATE] == ROLEPLAY_STATE_GUEST_PROPERTY) && CHARACTER_INFO[i][ch_INTERIOR_EXTRA] == CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA])
				{
					PlayAudioStreamForPlayer(i, url);
					SendClientMessage(i, COLOR_WHITE, "Reproduciendo música. Usa {CCFF00}/stop para parar la música.");
				}
			}
		}
		PLAYER_TEMP[playerid][py_MUSIC_FOR_PROPERTY] = false;
		SetPlayerChatBubble(playerid, "\n\n\n\n* Poné música en su propiedad.\n\n\n", 0xffcb90FF, 20.0, 5000);
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
						SendClientMessage(i, COLOR_WHITE, "Reproduciendo música. Usa {CCFF00}/stop para parar la música.");
					}
				}
			}
		}
		PLAYER_TEMP[playerid][py_MUSIC_FOR_VEHICLE] = false;
		SetPlayerChatBubble(playerid, "\n\n\n\n* Pone música en su vehículo.\n\n\n", 0xffcb90FF, 20.0, 5000);
	}
	else
	{
		PlayAudioStreamForPlayer(playerid, url);
		SendClientMessage(playerid, COLOR_WHITE, "Reproduciendo música. Usa {CCFF00}/stop para parar la música.");
		SetPlayerChatBubble(playerid, "\n\n\n\n* Escucha música en sus auriculares.\n\n\n", 0xffcb90FF, 20.0, 5000);
	}

	return 1;
}