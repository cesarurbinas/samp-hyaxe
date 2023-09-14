CMD:duda(playerid, params[])
{
	if (!ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL]) return SendClientMessage(playerid, COLOR_WHITE, "Para enviar una duda primero debes activar el canal de dudas con "COL_RED"/dudas");
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /duda <mensaje>");
	
	if (PLAYER_MISC[playerid][MISC_MUTES] >= 5) return SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Tienes muchos muteos, ya no eres aceptado en el canal de dudas.");
	if (strlen(params) > 132) return SendClientMessage(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Su duda es muy larga");

	if (PLAYER_MISC[playerid][MISC_MUTE] > gettime())
	{
		new seconds = PLAYER_MISC[playerid][MISC_MUTE] - gettime();
		SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Estás silenciado en el canal de dudas y anuncios por %s minutos", TimeConvert(seconds));
		return 1;
	}

	if (!ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		if (gettime() < PLAYER_TEMP[playerid][py_DOUBT_CHANNEL_TIME] + MIN_TIME_BETWEEN_DOUBT)
		{
			new time = (MIN_TIME_BETWEEN_DOUBT-(gettime()-PLAYER_TEMP[playerid][py_DOUBT_CHANNEL_TIME]));
			SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Tienes que esperar %s segundos para volver a enviar una duda.", TimeConvert(time));
			return 1;
		}
	}

	if (!ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		if (CheckSpamViolation(params))
		{
			new dialog[250];
			format(dialog, sizeof dialog, ""COL_WHITE"Fuiste baneado, razón: Spam (Dudas)");
			ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
			
			AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, "Spam (Dudas)");

			KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
			PLAYER_MISC[playerid][MISC_BANS] ++;
			SavePlayerMisc(playerid);

			new str[144], webhook[144];
			format(str, 144, "[ADMIN] NeuroAdmin baneó a %s (%d): Spam (Dudas).", ACCOUNT_INFO[playerid][ac_NAME], playerid);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);

			format(str, 144, "[DUDAS] %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, params);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);
			return 0;
		}

		if (CheckFilterViolation(params))
		{
			new str[144], webhook[144];
			format(str, 144, "[DUDAS] %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, params);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);

			SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Tu duda tiene palabras inapropiadas.");
			return 1;
		}

		if (StringContainsIP(params))
		{
			new dialog[250];
			format(dialog, sizeof dialog, ""COL_WHITE"Fuiste baneado, razón: Spam (IP en el dudas)");
			ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
			
			AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, "Spam (IP en el dudas)");

			KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
			PLAYER_MISC[playerid][MISC_BANS] ++;
			SavePlayerMisc(playerid);

			new str[144];
			format(str, 144, "[ADMIN] NeuroAdmin baneó a %s (%d): Spam (IP en el dudas).", ACCOUNT_INFO[playerid][ac_NAME], playerid);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			new webhook[144];
			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);
			
			format(str, 144, "[DUDAS] %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, params);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);
			return 1;
		}
	}

	PLAYER_MISC[playerid][MISC_DOUBT_SENT]++;
	SendMessageToDoubtChannel(playerid, params);
	SavePlayerMisc(playerid);
	format(PLAYER_TEMP[playerid][py_LAST_DOUBT], 144, "%s", params);
	return 1;
}
alias:duda("n")

CMD:dudas(playerid, params[])
{
	if (ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL])
	{
		ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL] = false;
		ShowPlayerMessage(playerid, "Canal de dudas ~r~desactivado", 1);
	}
	else
	{
		ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL] = true;
		ShowPlayerMessage(playerid, "Canal de dudas ~g~activado", 1);
	}
	return 1;
}

CMD:global(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GLOBAL_CHAT])
	{
		PLAYER_MISC[playerid][MISC_GLOBAL_CHAT] = false;
		ShowPlayerMessage(playerid, "Canal global ~r~desactivado", 1);
	}
	else
	{
		PLAYER_MISC[playerid][MISC_GLOBAL_CHAT] = true;
		ShowPlayerMessage(playerid, "Canal global ~g~activado", 1);
	}
	return 1;
}

CMD:gl(playerid, params[])
{
	if (!PLAYER_MISC[playerid][MISC_GLOBAL_CHAT]) return SendClientMessage(playerid, COLOR_WHITE, "Para enviar mensajes por el canal global tienes que tenerlo activado.");
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /gl <mensaje>");
	if (strlen(params) > 132) return SendClientMessage(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Su mensaje es muy largo.");

	if (PLAYER_MISC[playerid][MISC_MUTE] > gettime())
	{
		new seconds = PLAYER_MISC[playerid][MISC_MUTE] - gettime();
		SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Estás silenciado en todos los canales por %s minutos", TimeConvert(seconds));
		return 1;
	}

	if (!ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		if (gettime() < PLAYER_TEMP[playerid][py_GLOBAL_CHANNEL_TIME] + MIN_TIME_BETWEEN_GLOBAL)
		{
			new time = (MIN_TIME_BETWEEN_GLOBAL-(gettime()-PLAYER_TEMP[playerid][py_GLOBAL_CHANNEL_TIME]));
			SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Tienes que esperar %s segundos para volver a enviar un mensaje.", TimeConvert(time));
			return 1;
		}
	}

	if (!ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		if (CheckSpamViolation(params))
		{
			new dialog[250];
			format(dialog, sizeof dialog, ""COL_WHITE"Fuiste baneado, razón: Spam (Global)");
			ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
			
			AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, "Spam (Dudas)");

			KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
			PLAYER_MISC[playerid][MISC_BANS] ++;
			SavePlayerMisc(playerid);

			new str[144], webhook[144];
			format(str, 144, "[ADMIN] NeuroAdmin baneó a %s (%d): Spam (Global).", ACCOUNT_INFO[playerid][ac_NAME], playerid);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);

			format(str, 144, "[GLOBAL] %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, params);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);
			return 0;
		}

		if (CheckFilterViolation(params))
		{
			new str[144], webhook[144];
			format(str, 144, "[GLOBAL] %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, params);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);

			SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Tu mensaje tiene palabras inapropiadas.");
			return 1;
		}

		if (StringContainsIP(params))
		{
			new dialog[250];
			format(dialog, sizeof dialog, ""COL_WHITE"Fuiste baneado, razón: Spam (IP en el Global)");
			ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
			
			AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, "Spam (IP en el dudas)");

			KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
			PLAYER_MISC[playerid][MISC_BANS] ++;
			SavePlayerMisc(playerid);

			new str[144];
			format(str, 144, "[ADMIN] NeuroAdmin baneó a %s (%d): Spam (IP en el Global).", ACCOUNT_INFO[playerid][ac_NAME], playerid);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			new webhook[144];
			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);
			
			format(str, 144, "[GLOBAL] %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, params);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);
			return 1;
		}
	}

	SendMessageToGlobalChannel(playerid, params);
	SavePlayerMisc(playerid);
	return 1;
}

CMD:anuncio(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL]) return SendClientMessage(playerid, COLOR_WHITE, "Para enviar un anuncio primero debes activar el canal de dudas con "COL_RED"/dudas");
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /anuncio "COL_WHITE"[TEXTO]");

	if (PLAYER_MISC[playerid][MISC_MUTES] >= 5) return SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Tienes muchos muteos, ya no eres aceptado en el canal de dudas.");
	if (strlen(params) > 64) return SendClientMessage(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Su anuncio es muy largo");

	if (PLAYER_MISC[playerid][MISC_MUTE] > gettime())
	{
		new seconds = PLAYER_MISC[playerid][MISC_MUTE] - gettime();
		SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Estás silenciado en el canal de dudas y anuncios por %s minutos", TimeConvert(seconds));
		return 1;
	}

	if (gettime() < PLAYER_TEMP[playerid][py_ANN_CHANNEL_TIME] + MIN_TIME_BETWEEN_ANN)
	{
		new time = (MIN_TIME_BETWEEN_ANN-(gettime()-PLAYER_TEMP[playerid][py_ANN_CHANNEL_TIME]));
		SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Tienes que esperar %s segundos para volver a enviar un anuncio.", TimeConvert(time));
		return 1;
	}

	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] <= 1)
	{
		if (CheckSpamViolation(params))
		{
			new dialog[250];
			format(dialog, sizeof dialog, ""COL_WHITE"Fuiste baneado, razón: Spam (Anuncios)");
			ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
			
			AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, "Spam (Anuncios)");

			KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
			PLAYER_MISC[playerid][MISC_BANS] ++;
			SavePlayerMisc(playerid);

			new str[144];
			format(str, 144, "[ADMIN] NeuroAdmin baneó a %s (%d): Spam (Anuncios).", ACCOUNT_INFO[playerid][ac_NAME], playerid);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			new webhook[144];
			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);

			format(str, 144, "[ANUNCIOS] %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, params);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);
			return 0;
		}

		if (CheckFilterViolation(params))
		{
			new str[144], webhook[144];
			format(str, 144, "[ANUNCIOS] %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, params);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);

			SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Tu anuncio tiene palabras inapropiadas.");
			return 1;
		}
	}

	if (StringContainsIP(params))
	{
		new dialog[250];
		format(dialog, sizeof dialog, ""COL_WHITE"Fuiste baneado, razón: Spam (IP en el anuncio)");
		ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
		
		AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, "Spam (IP en el anuncio)");

		KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
		PLAYER_MISC[playerid][MISC_BANS] ++;
		SavePlayerMisc(playerid);

		new str[144];
		format(str, 144, "[ADMIN] NeuroAdmin baneó a %s (%d): Spam (IP en el anuncio).", ACCOUNT_INFO[playerid][ac_NAME], playerid);
		SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

		new webhook[144];
		format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
		SendDiscordWebhook(webhook, 1);

		format(str, 144, "[ANUNCIOS] %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, params);
		SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

		format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
		SendDiscordWebhook(webhook, 1);
		return 1;
	}

	new str_text[264];
	format(str_text, sizeof(str_text), "Anuncio: "COL_WHITE"%s [Teléfono: %d]", params, PLAYER_PHONE[playerid][player_phone_NUMBER]);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if ((PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_DEAD) && ACCOUNT_INFO[i][ac_DOUBT_CHANNEL] && !PLAYER_TEMP[playerid][py_NEW_USER])
			{
				SendResponsiveMessage(i, COLOR_LIGHT_ORANGE, str_text, 135);
			}
		}
	}

	format(str_text, sizeof(str_text), "[ANUNCIO] %s (%d) [Teléfono: %d]", PLAYER_TEMP[playerid][py_NAME], playerid, PLAYER_PHONE[playerid][player_phone_NUMBER]);
	SendMessageToAdmins(COLOR_ANTICHEAT, str_text);

	PLAYER_TEMP[playerid][py_ANN_CHANNEL_TIME] = gettime();
	return 1;
}