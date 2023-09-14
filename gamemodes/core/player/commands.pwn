CMD:reportar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_REPORT_MUTE]) return SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Te encuentras bloqueado de esta opción.");
	if ((gettime() - PLAYER_TEMP[playerid][py_ANTIFLOOD_REPORT]) < 60) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 60 segundos para volver a reportar.", 3);
	PLAYER_TEMP[playerid][py_ANTIFLOOD_REPORT] = gettime();

	new reason[128];
	if (sscanf(params, "us[128]", params[0], reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /reportar "COL_WHITE"[ID o nombre] [Razón]");
    if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);

	ShowPlayerMessage(playerid, "~g~Tu reporte fue enviado a los administradores en línea.", 3);

	new str[144];
	format(str, 144, "[REPORTE]"COL_WHITE" %s (%d) > %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, PLAYER_TEMP[params[0]][py_NAME], params[0], reason);
	SendMessageToAdmins(COLOR_ORANGE, str);
	Log("reports", str);

	new DCC_Channel:channelid;
	channelid = DCC_FindChannelById("790742732829491230");
	SendDiscordMessage(channelid, "[REPORTE] %s (%d) > %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, PLAYER_TEMP[params[0]][py_NAME], params[0], reason);

	PLAYER_TEMP[ params[0] ][py_TOTAL_REPORTS] ++;
	return 1;
}
alias:reportar("re", "report")

CMD:r(playerid, params[])
{
	new message[128];
	if (sscanf(params, "s[128]", message)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /r "COL_WHITE"[MENSAJE]");

	if (PLAYER_TEMP[playerid][py_ADMIN_PM_PID] == INVALID_PLAYER_ID || !PLAYER_TEMP[playerid][py_ADMIN_PM_AID]) 
		return ShowPlayerMessage(playerid, "~r~Nada que responder.", 3);
	
	if (ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_ADMIN_PM_PID] ][ac_ID] != PLAYER_TEMP[playerid][py_ADMIN_PM_AID])
	{
		PLAYER_TEMP[playerid][py_ADMIN_PM_PID] = INVALID_PLAYER_ID;
		PLAYER_TEMP[playerid][py_ADMIN_PM_AID] = 0;
		PLAYER_TEMP[playerid][py_ADMIN_PM_TIME] = 0;
		ShowPlayerMessage(playerid, "~r~El administrador que te envió el mensaje está desconectado.", 3);
		return 1;
	}
	if (gettime() > PLAYER_TEMP[playerid][py_ADMIN_PM_TIME] + 60)
	{
		PLAYER_TEMP[playerid][py_ADMIN_PM_PID] = INVALID_PLAYER_ID;
		PLAYER_TEMP[playerid][py_ADMIN_PM_AID] = 0;
		PLAYER_TEMP[playerid][py_ADMIN_PM_TIME] = 0;
		ShowPlayerMessage(playerid, "~r~Tardaste mucho en responder.", 3);
		return 1;
	}

	SendClientMessageEx(PLAYER_TEMP[playerid][py_ADMIN_PM_PID], COLOR_WHITE, "{5CCE3D}>"COL_WHITE" Respuesta de %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, message);
	ShowPlayerMessage(playerid, "Tu mensaje ha sido enviado al administrador.", 2);
	PLAYER_TEMP[playerid][py_ADMIN_PM_PID] = INVALID_PLAYER_ID;
	PLAYER_TEMP[playerid][py_ADMIN_PM_AID] = 0;
	PLAYER_TEMP[playerid][py_ADMIN_PM_TIME] = 0;
	return 1;
}

CMD:id(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player))
	{
		to_player = playerid;
		SendClientMessage(playerid, COLOR_WHITE, "Recuerde que también puede usar: /id "COL_WHITE"[ID o nombre]");
	}
	if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado.");

	new
		player_version[32],
		acid,
		ping
	;

	GetPlayerVersion(to_player, player_version, sizeof player_version);

	if (ACCOUNT_INFO[to_player][ac_ID] == 0) acid = minrand(10000, 25000);
	else acid = ACCOUNT_INFO[to_player][ac_ID];

	if (GetPlayerPing(to_player) < 80) ping = minrand(100, 300);
	else ping = GetPlayerPing(to_player);

	SendClientMessageEx(playerid, COLOR_RED, "• "COL_WHITE"Nombre: %s (%d) [Nivel %d] "COL_RED"|"COL_WHITE" ID de cuenta: %d",
		PLAYER_TEMP[to_player][py_NAME],
		to_player,
		GetPlayerScore(to_player),
		acid
	);
	
	SendClientMessageEx(playerid, COLOR_RED, "• "COL_WHITE"Versión: %s "COL_RED"|"COL_WHITE" PacketLoss: %.2f "COL_RED"|"COL_WHITE" Ping: %d",
		player_version,
		NetStats_PacketLossPercent(to_player),
		ping
	);
	return 1;
}

CMD:localizar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	ShowDialog(playerid, DIALOG_PLAYER_GPS_VEHICLES);
	return 1;
}

CMD:hora(playerid, params[])
{
	new time[6];
	gettime(time[0], time[1], time[2]);
	getdate(time[3], time[4], time[5]);

	SendClientMessageEx(playerid, COLOR_RED, "• "COL_WHITE"Hora: %02d:%02d:%02d "COL_RED"|"COL_WHITE" Fecha: %02d/%02d/%d",
		time[0], time[1], time[2],
		time[3], time[4], time[5]
	);
	return 1;
}
alias:hora("fecha")

CMD:clearchat(playerid, params[])
{
	ClearPlayerChatBox(playerid);
	return 1;
}

CMD:g(playerid, params[])
{
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /g"COL_WHITE"ritar [TEXTO]");

	new str_text[190];
	format(str_text, 190, "%s grita: ¡%s!", PLAYER_TEMP[playerid][py_RP_NAME], params);

	//Do code
	strreplace(str_text, "[", "{dbc766}[");
	strreplace(str_text, "]", "]{E6E6E6}");

	//Negrita code
	strreplace(str_text, "<", "{A8A8A8}");
	strreplace(str_text, ">", "{E6E6E6}");

	ProxDetector(playerid, 25.0, str_text, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5, 85);
	return 1;
}
alias:g("gritar")

CMD:s(playerid, params[])
{
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /s"COL_WHITE"usurrar [TEXTO]");

	new str_text[190];
	format(str_text, sizeof(str_text), "%s susurra: %s", PLAYER_TEMP[playerid][py_RP_NAME], params);

	//Do code
	strreplace(str_text, "[", "{dbc766}[");
	strreplace(str_text, "]", "]{E6E6E6}");

	//Negrita code
	strreplace(str_text, "<", "{A8A8A8}");
	strreplace(str_text, ">", "{E6E6E6}");

	ProxDetector(playerid, 5.0, str_text, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5, 85);
	return 1;
}
alias:s("susurrar")

CMD:desbug(playerid, params[])
{
	if (PLAYER_TEMP[playerid][py_CUFFED]) return ShowPlayerMessage(playerid, "~r~No puedes hacer eso estando esposado.", 3);
	new
		Float:x, Float:y, Float:z,
		interior = GetPlayerInterior(playerid)
	;

	GetPlayerPos(playerid, x, y, z);
	// if (interior != 0) SetPlayerPos(playerid, x, y, z + 0.5);

	if (CHARACTER_INFO[playerid][ch_STATE] != ROLEPLAY_STATE_NORMAL) return 1;

	if (IsPlayerInRangeOfPoint(playerid, 50.0, -198.002197, -1762.759643, 675.768737))
		SetPlayerPosEx(playerid, 1172.832763, -1323.269531, 15.400051, 270.0, 0, 0);

	switch(interior)
	{
		case 25..27:
		{
			SetPlayerPosEx(playerid, 509.152374, -723.324951, 19.869243, 340.0, 0, 0);
			SetPlayerTime(playerid, SERVER_TIME[0], SERVER_TIME[1]);
		}
	}
	return 1;
}

CMD:pos(playerid, params[])
{
	new Float:x, Float:y, Float:z, Float:angle;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, angle);
	SendClientMessageEx(playerid, COLOR_WHITE, "X: %f Y: %f Z: %f ANGLE: %f "COL_RED"|"COL_WHITE" Virtual World: %d "COL_RED"|"COL_WHITE" Interior: %d", x, y, z, angle, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
	return 1;
}

CMD:b(playerid, params[])
{
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /b "COL_WHITE"[TEXTO]");

    new str_text[190];
    format(str_text, sizeof(str_text), "[ID: %d] %s: (( %s ))", playerid, PLAYER_TEMP[playerid][py_RP_NAME], params);
	ProxDetector(playerid, 15.0, str_text, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5, 85);
	return 1;
}

CMD:do(playerid, params[])
{
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /do "COL_WHITE"[TEXTO]");

    new str_text[190];
    format(str_text, sizeof(str_text), "* %s (( %s ))", params, PLAYER_TEMP[playerid][py_RP_NAME]);
	ProxDetector(playerid, 15.0, str_text, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 85);
	return 1;
}

CMD:intentar(playerid, params[])
{
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /intentar "COL_WHITE"[TEXTO]");

    new 
    	str_text[190],
    	status[15]
    ;

    switch( minrand(0, 2) )
    {
    	case 0: format(status, sizeof(status), "falla");
    	default: format(status, sizeof(status), "lo logra");
    }
    
    format(str_text, sizeof(str_text), "* %s intenta %s y %s.", PLAYER_TEMP[playerid][py_RP_NAME], params, status);
	ProxDetector(playerid, 15.0, str_text, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 85);
	return 1;
}

CMD:me(playerid, params[])
{
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /me "COL_WHITE"[TEXTO]");

	SendPlayerAction(playerid, params);
	return 1;
}
alias:me("y")

CMD:habilidades(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ShowPlayerSkills(playerid, playerid);
	return 1;
}
alias:habilidades("hab", "exp", "skills")

CMD:cuenta(playerid, params[])
{
	ShowPlayerStats(playerid, playerid);
	return 1;
}
alias:cuenta("est")

CMD:web(playerid, params[])
{
	SendClientMessage(playerid, COLOR_WHITE, "Web: "COL_RED""SERVER_WEBSITE"");
	return 1;
}

CMD:discord(playerid, params[])
{
	SendClientMessage(playerid, COLOR_WHITE, "Discord: "COL_RED""SERVER_DISCORD"");
	return 1;
}

CMD:testnot(playerid, params[])
{
	ShowPlayerNotification(playerid, "Te hemos devuelto el dinero porque el luchador que apostaste se ha ido del ring.", 3);
	return 1;
}

CMD:runtime(playerid, params[])
{
	SendClientMessageEx(playerid, COLOR_WHITE, "El servidor se ha iniciado: %s", ReturnTimelapse(ServerInitTime, gettime()));
	return 1;
}