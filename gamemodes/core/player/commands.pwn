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
	ReplaceStringByRegex(str_text, "\\[(.*?)\\]", "{dbc766}[$1]{E6E6E6}", str_text);

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
	ReplaceStringByRegex(str_text, "\\[(.*?)\\]", "{dbc766}[$1]{E6E6E6}", str_text);

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

	if (GetPlayerScore(playerid) <= 1)
	{
		if (CheckSpamViolation(params))
		{
			Anticheat_Ban(playerid, "Spam (B)");
			return 0;
		}
	}

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
	new string[422];
	format(string, 422, "%s", params);
	ShowPlayerNotification(playerid, string, 5);
	return 1;
}

CMD:runtime(playerid, params[])
{
	SendClientMessageEx(playerid, COLOR_WHITE, "El servidor se ha iniciado: %s", ReturnTimelapse(ServerInitTime, gettime()));
	return 1;
}

CMD:accsave(playerid, params[])
{
	if (gettime() < PLAYER_TEMP[playerid][py_SAVE_ACCOUNT_TIME] + 30)
	{
		new time = (30-(gettime()-PLAYER_TEMP[playerid][py_SAVE_ACCOUNT_TIME]));
		SendClientMessageEx(playerid, COLOR_WHITE, "Tienes que esperar %s minutos para volver a guardar tus datos.", TimeConvert(time));
		return 1;
	}

	SaveUserData(playerid);
	SavePlayerToysData(playerid);
	SavePlayerVehicles(playerid, false);
	SavePlayerSkills(playerid);
	SavePlayerWorks(playerid);
	SavePlayerMisc(playerid);

	PLAYER_TEMP[playerid][py_SAVE_ACCOUNT_TIME] = gettime();

	ShowPlayerNotification(playerid, "Datos guardados.", 3);
	return 1;
}

CMD:ayuda(playerid, params[])
{
	ShowInventory(playerid);
	ShowHelpMenu(playerid);
	PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], COLOR_WHITE);
	PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2], COLOR_WHITE);
	PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3], COLOR_WHITE);
	PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40], COLOR_INV_RED);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);
	return 1;
}

CMD:testvlood(playerid, params[])
{
	PlayerBloodParticle(playerid);
	return 1;
}

CMD:nochesexo(playerid, params[])
{
	PLAYER_TEMP[playerid][py_NOCHE_DE_SEXO] = !PLAYER_TEMP[playerid][py_NOCHE_DE_SEXO];

	if (PLAYER_TEMP[playerid][py_NOCHE_DE_SEXO]) SetPlayerTime(playerid, 0, 0);
	else SetPlayerTime(playerid, SERVER_TIME[0], SERVER_TIME[1]);

	return 1;
}

/*CMD:menu(playerid, params[])
{
	PlayerExitGamemode(playerid);
	StopAudioStreamForPlayer(playerid);

	ShowMainMenu(playerid);

	PLAYER_TEMP[playerid][py_MENU] = true;

	PlayAudioStreamForPlayer(playerid, MAIN_MUSIC[random(sizeof(MAIN_MUSIC))]);
	ClearPlayerChatBox(playerid);
	return 1;
}*/

/* COMMAND FINDING */
cmd:tr(playerid, params[])
{
	Anticheat_Kick(playerid, "TR [CSC]");
	return 1;
}

cmd:tp(playerid, params[])
{
	Anticheat_Kick(playerid, "TP [CSC]");
	return 1;
}

cmd:teleport(playerid, params[])
{
	Anticheat_Kick(playerid, "Teleport [CSC]");
	return 1;
}

cmd:salo(playerid, params[])
{
	Anticheat_Kick(playerid, "Salo [CSC]");
	return 1;
}

cmd:fantasma(playerid, params[])
{
	Anticheat_Kick(playerid, "Fantasma [CSC]");
	return 1;
}

cmd:domar(playerid, params[])
{
	Anticheat_Kick(playerid, "Domar [CSC]");
	return 1;
}

cmd:sapito(playerid, params[])
{
	Anticheat_Kick(playerid, "Sapito [CSC]");
	return 1;
}

cmd:pinwino(playerid, params[])
{
	Anticheat_Kick(playerid, "Pinwino [CSC]");
	return 1;
}

cmd:verdesin(playerid, params[])
{
	Anticheat_Kick(playerid, "Verdesin [CSC]");
	return 1;
}

cmd:piso(playerid, params[])
{
	Anticheat_Kick(playerid, "Piso [CSC]");
	return 1;
}

cmd:storm(playerid, params[])
{
	Anticheat_Kick(playerid, "Storm [CSC]");
	return 1;
}

cmd:gg(playerid, params[])
{
	Anticheat_Kick(playerid, "GG [CSC]");
	return 1;
}

cmd:baciga(playerid, params[])
{
	Anticheat_Kick(playerid, "Baciga [CSC]");
	return 1;
}

cmd:spread(playerid, params[])
{
	Anticheat_Kick(playerid, "Spread [CSC]");
	return 1;
}

cmd:cfind(playerid, params[])
{
	Anticheat_Kick(playerid, "CFind [CSC]");
	return 1;
}

cmd:master(playerid, params[])
{
	Anticheat_Kick(playerid, "Master [CSC]");
	return 1;
}

cmd:tmp(playerid, params[])
{
	Anticheat_Kick(playerid, "Tmp [CSC]");
	return 1;
}

cmd:fr(playerid, params[])
{
	Anticheat_Kick(playerid, "Fr [CSC]");
	return 1;
}

cmd:hmo(playerid, params[])
{
	Anticheat_Kick(playerid, "Hmo [CSC]");
	return 1;
}

cmd:skr(playerid, params[])
{
	Anticheat_Kick(playerid, "Skr [CSC]");
	return 1;
}

cmd:xex(playerid, params[])
{
	Anticheat_Kick(playerid, "Xex [CSC]");
	return 1;
}

cmd:up(playerid, params[])
{
	Anticheat_Kick(playerid, "Up [CSC]");
	return 1;
}

cmd:slide(playerid, params[])
{
	Anticheat_Kick(playerid, "Slide [CSC]");
	return 1;
}

cmd:cbug(playerid, params[])
{
	Anticheat_Kick(playerid, "Cbug [CSC]");
	return 1;
}

cmd:slap(playerid, params[])
{
	Anticheat_Kick(playerid, "Slap [CSC]");
	return 1;
}

cmd:aimbot(playerid, params[])
{
	Anticheat_Kick(playerid, "Aimbot [CSC]");
	return 1;
}

cmd:aim(playerid, params[])
{
	Anticheat_Kick(playerid, "Aim [CSC]");
	return 1;
}

CMD:creditos(playerid, params[])
{
	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Colaboradores", ""COL_WHITE"Hyaxe es posible gracias a:\n\
		Muphy, Atom, Kitis, Arkerooz\n\
		Mitt, Alper.", "Cerrar", "");
	return 1;
}

CMD:vincular(playerid, params[])
{
	new code = (ACCOUNT_INFO[playerid][ac_ID] + 5) * 2;
	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Vincular", sprintf(""COL_WHITE"Código de vinculación: "COL_RED"%d", code), "Cerrar", "");
	
	new str_text[200];
	format(str_text, sizeof(str_text), "51.222.21.190:10500/B987Tbt97BTb9SAF9B8Ttasbfdf6/register/%s:%d:%d",
		PLAYER_TEMP[playerid][py_NAME],
		code,
		ACCOUNT_INFO[playerid][ac_SU]
	);
	HTTP(playerid, HTTP_GET, str_text, "", "");
	return 1;
}

CMD:gps(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (!PLAYER_OBJECT[playerid][po_GPS])
	{
		ShowPlayerMessage(playerid, "~r~No tienes ningún GPS, ve a un 24/7.", 3, 1085);
		return 1;
	}

	SetPlayerChatBubble(playerid, "\n\n\n\n* Mira su GPS", 0xffcb90FF, 20.0, 2000);
	ShowDialog(playerid, DIALOG_PLAYER_GPS);
	return 1;
}

CMD:stop(playerid, params[])
{
	if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);
	return 1;
}

CMD:mp3(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_OBJECT[playerid][po_MP3]) return ShowPlayerMessage(playerid, "~r~No tienes un reproductor MP3. Ve a una tienda electrónica.", 4);
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3, 1085);
	if (PLAYER_TEMP[playerid][py_PLAYER_WAITING_MP3_HTTP]) return ShowPlayerMessage(playerid, "~r~Espera que termine la búsqueda actual.", 3, 1085);
	if (gettime() < PLAYER_TEMP[playerid][py_LAST_SEARCH] + 60) return ShowPlayerMessage(playerid, "~r~Solo puedes usar este comando cada un minuto.", 3, 1085);

	ShowPlayerMessage(playerid, "~r~YouTube nos ha baneado, esta opcion se encuentra desactivada.", 4);
	//ShowDialog(playerid, DIALOG_PLAYER_MP3);
	return 1;
}
alias:mp3("youtube")

CMD:pass(playerid, params[])
{
	ShowDialog(playerid, DIALOG_CHANGE_PASSWORD);
	return 1;
}

CMD:borrarcp(playerid, params[])
{
	Cancel_GPS(playerid);
	ShowPlayerMessage(playerid, "Has cancelado la ruta antigua de tu GPS.", 3);
	return 1;
}

CMD:guia(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (!PLAYER_OBJECT[playerid][po_PHONE_RESOLVER])
	{
		ShowPlayerMessage(playerid, "~r~No tienes una guía telefónica, ve a un 24/7.", 3, 1085);
		return 1;
	}

	if (sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /guia "COL_WHITE"[ID o nombre]");
	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador Desconectado.", 2);

	if (ACCOUNT_INFO[params[0]][ac_ID] == 0) return ShowPlayerMessage(playerid, "~r~Este jugador ha decidido no mostrar su número en la guía.", 3);

	if (!PLAYER_PHONE[params[0]][player_phone_VALID]) return ShowPlayerMessage(playerid, "~r~Este jugador no tiene teléfono.", 2);
	if (!PLAYER_PHONE[params[0]][player_phone_VISIBLE_NUMBER]) return ShowPlayerMessage(playerid, "~r~Este jugador ha decidido no mostrar su número en la guía.", 3);

	SendClientMessageEx(playerid, COLOR_WHITE, "Teléfono de %s: "COL_RED"%d", PLAYER_TEMP[params[0]][py_RP_NAME], PLAYER_PHONE[params[0]][player_phone_NUMBER]);
	return 1;
}

CMD:responder(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (!PLAYER_PHONE[playerid][player_phone_VALID])
	{
		ShowPlayerMessage(playerid, "~r~No tienes ningún teléfono, ve a 24/7.", 3, 1085);
		return 1;
	}
	if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_OFF) return ShowPlayerMessage(playerid, "~r~Tu teléfono está apagado, para encenderlo usa /movil.", 3);

	if (!PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) return ShowPlayerMessage(playerid, "~r~No hay llamadas entrantes.", 2);
	if (PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID] == INVALID_PLAYER_ID) return ShowPlayerMessage(playerid, "~r~No hay llamadas entrantes.", 2);
	if (PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE] != CALL_STATE_INCOMING_CALL) return ShowPlayerMessage(playerid, "~r~No hay llamadas entrantes.", 2);

	new to_playerid = PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID];

	PLAYER_TEMP[playerid][py_PLAYER_IN_CALL] = true;
	PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE] = CALL_STATE_ESTABLISHED;
	PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID] = to_playerid;
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);

	KillTimer(PLAYER_TEMP[to_playerid][py_TIMERS][6]);
	PLAYER_TEMP[to_playerid][py_PLAYER_IN_CALL] = true;
	PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_STATE] = CALL_STATE_ESTABLISHED;
	PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_PLAYERID] = playerid;
	SetPlayerSpecialAction(to_playerid, SPECIAL_ACTION_USECELLPHONE);

	ShowPlayerMessage(playerid, "Llamada establecida, usa ~g~/colgar ~w~para terminarla.", 3);
	ShowPlayerMessage(to_playerid, "Llamada establecida, usa ~g~/colgar ~w~para terminarla.", 3);
	return 1;
}

CMD:colgar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_PHONE[playerid][player_phone_VALID])
	{
		ShowPlayerMessage(playerid, "~r~No tienes ningún teléfono, ve a un 24/7.", 3, 1085);
		return 1;
	}
	if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_OFF) return ShowPlayerMessage(playerid, "~r~Tu teléfono está apagado, para encenderlo usa /movil.", 3);

	if (!PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) return ShowPlayerMessage(playerid, "~r~No hay llamadas entrantes.", 2);

	if (PLAYER_TEMP[playerid][py_POLICE_CALL_NAME] || PLAYER_TEMP[playerid][py_POLICE_CALL_DESCRIPTION])
	{
		PLAYER_TEMP[playerid][py_PLAYER_IN_CALL] = false;
		PLAYER_TEMP[playerid][py_POLICE_CALL_NAME] = false;
		PLAYER_TEMP[playerid][py_POLICE_CALL_DESCRIPTION] = false;
		ShowPlayerMessage(playerid, "Llamada finalizada.", 2);
		return 1;
	}

	if (PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID] == INVALID_PLAYER_ID) return ShowPlayerMessage(playerid, "No hay llamadas entrantes.", 3);

	switch(PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE])
	{
		case CALL_STATE_WAITING_RESPONSE:
		{
			EndPhoneCall(playerid);
			ShowPlayerMessage(playerid, "Colgaste.", 2);
		}
		case CALL_STATE_INCOMING_CALL:
		{
			EndPhoneCall(playerid);
			ShowPlayerMessage(playerid, "No has respondido la llamada.", 2);
		}
		case CALL_STATE_ESTABLISHED:
		{
			EndPhoneCall(playerid);
			ShowPlayerMessage(playerid, "Llamada finalizada.", 2);
		}
		default: ShowPlayerMessage(playerid, "~r~No estás en ninguna llamada.", 2);
	}
	return 1;
}

CMD:configuracion(playerid, params[])
{
	ShowDialog(playerid, DIALOG_PLAYER_CONFIG);
	return 1;
}
alias:configuracion("config", "ajustes", "panel")

CMD:vender(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (ACCOUNT_INFO[playerid][ac_LEVEL] < 2) return ShowPlayerMessage(playerid, "~r~Debes ser nivel 2", 2);

	new option[24], to_playerid, extra, price;
	if (sscanf(params, "s[24]udd", option, to_playerid, extra, price)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /vender hycoins <id> <cantidad> <precio>");

	if (price <= 0 || price > 10000000) return ShowPlayerMessage(playerid, "~r~El precio no es válido.", 3);
	if (!IsPlayerConnected(to_playerid)) return ShowPlayerMessage(playerid, "~r~El jugador no está conectado", 3);
	if (playerid == to_playerid) return ShowPlayerMessage(playerid, "~r~No puedes venderte a ti mismo.", 3);
	new Float:x, Float:y, Float:z; GetPlayerPos(to_playerid, x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~Este jugador no está cerca tuya.", 3);
	if (PLAYER_TEMP[to_playerid][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No le puedes vender nada a este jugador por ahora.", 3);
	if (ACCOUNT_INFO[to_playerid][ac_LEVEL] < 2) return ShowPlayerMessage(playerid, "~r~El jugador no es nivel 2.", 3);

	if (price > CHARACTER_INFO[to_playerid][ch_CASH])
	{
		ShowPlayerMessage(playerid, "~r~El jugador no tiene el dinero que pides.", 3);
		return 1;
	}

	PLAYER_TEMP[to_playerid][py_TRICK_SELLER_PID] = playerid;
	PLAYER_TEMP[to_playerid][py_TRICK_SELLER_AID] = ACCOUNT_INFO[playerid][ac_ID];
	PLAYER_TEMP[to_playerid][py_TRICK_PRICE] = price;
	PLAYER_TEMP[to_playerid][py_TRICK_SELLER_EXTRA] = extra;
	PLAYER_TEMP[to_playerid][py_TRICK_TIME] = gettime();

	if (!strcmp(option, "hycoins", true))
	{
		if (PLAYER_TEMP[to_playerid][py_TRICK_SELLER_EXTRA] <= 0 || PLAYER_TEMP[to_playerid][py_TRICK_SELLER_EXTRA] > 10000000) return ShowPlayerMessage(playerid, "~r~Cantidad incorrecta", 3);
		if (PLAYER_TEMP[to_playerid][py_TRICK_SELLER_EXTRA] > ACCOUNT_INFO[playerid][ac_SD]) return ShowPlayerMessage(playerid, "~r~No tienes esa cantidad", 3);

		new str_text[164];
		format(str_text, sizeof(str_text), "Le has ofrecido una venta a %s, espera para ver si la acepta.", PLAYER_TEMP[to_playerid][py_RP_NAME]);
		ShowPlayerNotification(playerid, str_text, 4);

		format(str_text, sizeof(str_text),
			"%s te quiere vender %d "SERVER_COIN" a %d$.",
			PLAYER_TEMP[playerid][py_NAME],
			extra,
			price
		);
		ShowActionForPlayer(to_playerid, HYCOIN_SELL, str_text, .action_time = 10000);
		return 1;
	}
	else SendClientMessage(playerid, COLOR_WHITE, "Syntax: /vender hycoins <id> <cantidad> <precio>");
	return 1;
}

Action:HYCOIN_SELL(playerid, response)
{
	if (response == ACTION_RESPONSE_YES)
	{
		if (gettime() > PLAYER_TEMP[playerid][py_TRICK_TIME] + 20) return ShowPlayerMessage(playerid, "~r~Tardaste mucho en aceptar.", 3);
		if (!IsPlayerConnected(PLAYER_TEMP[playerid][py_TRICK_SELLER_PID])) return ShowPlayerMessage(playerid, "~r~El vendedor no está conectado.", 3);
		if (ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_TRICK_SELLER_PID] ][ac_ID] != PLAYER_TEMP[playerid][py_TRICK_SELLER_AID]) return ShowPlayerMessage(playerid, "~r~El vendedor no está conectado.", 3);

		new Float:x, Float:y, Float:z; GetPlayerPos(PLAYER_TEMP[playerid][py_TRICK_SELLER_PID], x, y, z);
		if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El vendedor no está cerca tuya.", 3);
		if (PLAYER_TEMP[ PLAYER_TEMP[playerid][py_TRICK_SELLER_PID] ][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~El vendedor no está disponible.", 3);


		ACCOUNT_INFO[playerid][ac_SD] += PLAYER_TEMP[playerid][py_TRICK_SELLER_EXTRA];
		ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_TRICK_SELLER_PID] ][ac_SD] -= PLAYER_TEMP[playerid][py_TRICK_SELLER_EXTRA];

		new DB_Query_update[256];
		format
		(
			DB_Query_update, sizeof DB_Query_update,

				"\
					UPDATE `ACCOUNTS` SET `SD` = '%d' WHERE `ID` = '%d';\
					UPDATE `ACCOUNTS` SET `SD` = '%d' WHERE `ID` = '%d';\
				",
					ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_ID],
					ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_TRICK_SELLER_PID] ][ac_SD], ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_TRICK_SELLER_PID] ][ac_ID]
		);
		db_free_result(db_query(Database, DB_Query_update));

		GivePlayerCash(playerid, -PLAYER_TEMP[playerid][py_TRICK_PRICE]);
		GivePlayerCash(PLAYER_TEMP[playerid][py_TRICK_SELLER_PID], PLAYER_TEMP[playerid][py_TRICK_PRICE]);
		ShowPlayerNotification(PLAYER_TEMP[playerid][py_TRICK_SELLER_PID], sprintf("Has vendido %d hycoins.", PLAYER_TEMP[playerid][py_TRICK_SELLER_EXTRA]), 5);
		SetPlayerChatBubble(PLAYER_TEMP[playerid][py_TRICK_SELLER_PID], "* Llega a un acuerdo con alguien.\n\n\n", 0xffcb90FF, 20.0, 5000);

		new str_text[164];
		format(str_text, sizeof(str_text), "%s (%d) le ha vendido %d hycoins a %s (%d) al precio de %d$.",
			PLAYER_TEMP[ PLAYER_TEMP[playerid][py_TRICK_SELLER_PID] ][py_NAME],
			PLAYER_TEMP[playerid][py_TRICK_SELLER_PID],
			PLAYER_TEMP[playerid][py_TRICK_SELLER_EXTRA],
			PLAYER_TEMP[playerid][py_NAME],
			playerid,
			PLAYER_TEMP[playerid][py_TRICK_PRICE]
		);
		Log("hycoin_sell", str_text);
	}
	else
	{
		if (gettime() > PLAYER_TEMP[playerid][py_TRICK_TIME] + 20) return 1;
		if (!IsPlayerConnected(PLAYER_TEMP[playerid][py_TRICK_SELLER_PID])) return 1;
		if (ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_TRICK_SELLER_PID] ][ac_ID] != PLAYER_TEMP[playerid][py_TRICK_SELLER_AID]) return 1;

		ShowPlayerMessage(PLAYER_TEMP[playerid][py_TRICK_SELLER_PID], "~r~El comprador no ha aceptado tu trato.", 3);
	}
	return 1;
}

CMD:tirar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (ACCOUNT_INFO[playerid][ac_LEVEL] < 2) return ShowPlayerMessage(playerid, "~r~Debes ser nivel 2", 2);

	new ammount;
	if (sscanf(params, "d", ammount)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /tirar <cantidad>");
	if (ammount <= 0 || ammount > 1000) return ShowPlayerMessage(playerid, "~r~La cantidad no es válida.", 3);

	if (PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] != 9999)
	{
		new 
			Float:x, Float:y, Float:z,
			slot = PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT];

		if (ammount > PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][slot]) return ShowPlayerMessage(playerid, "~r~No tienes esa cantidad", 4);
		if (PLAYER_VISUAL_INV[playerid][slot_TYPE][slot] == 50) return 0;

		GetPlayerPos(playerid, x, y, z);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 1000, true);
		
		if (!IsWeaponType(PLAYER_VISUAL_INV[playerid][slot_TYPE][slot]))
		{
			CreateDropItem(PLAYER_VISUAL_INV[playerid][slot_TYPE][slot], x, y, z - 1, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), PLAYER_TEMP[playerid][py_NAME], ammount, .playerid = playerid);
			
			SubtractItem(playerid, PLAYER_VISUAL_INV[playerid][slot_TYPE][slot], ammount);
			ResetItemBody(playerid);
			PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]--;
		}
		else ShowPlayerMessage(playerid, "~r~No puedes hacerlo con ese objeto", 4);
	}
	else ShowPlayerMessage(playerid, "~r~No tienes un item en la mano", 4);
	return 1;
}

CMD:guardar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);

	new ammount;
	if (sscanf(params, "d", ammount)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /tirar <cantidad>");
	if (ammount <= 0 || ammount > 1000) return ShowPlayerMessage(playerid, "~r~La cantidad no es válida.", 3);

	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 0;

	new vehicleid = GetPlayerCameraTargetVehicle(playerid);
	if (vehicleid == INVALID_VEHICLE_ID) return ShowPlayerMessage(playerid, "~r~Tienes que estar cerca de un vehículo", 4);
	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Tienes que estar cerca de un vehículo", 4);
	if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID] || IsPlayerInKeys(PLAYER_VEHICLES[vehicleid][player_vehicle_ID], ACCOUNT_INFO[playerid][ac_ID]))
	{
		PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] = vehicleid;
		
		if (PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] != 9999)
		{
			new slot = PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT];

			if (ammount > PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][slot]) return ShowPlayerMessage(playerid, "~r~No tienes esa cantidad", 4);
			if (PLAYER_VISUAL_INV[playerid][slot_TYPE][slot] == 50) return 0;

			
			if (!IsWeaponType(PLAYER_VISUAL_INV[playerid][slot_TYPE][slot]))
			{
				new count = GetVehicleItemsCount(PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] ][player_vehicle_ID]);
				if (count >= 11) return ShowPlayerMessage(playerid, "~r~El maletero se encuentra lleno.", 4);

				if (PLAYER_VISUAL_INV[playerid][slot_TYPE][slot] == 50) return 0;

				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~w~Item guardado", 2000, 5);
				ResetItemBody(playerid);

				SubtractItem(playerid, PLAYER_VISUAL_INV[playerid][slot_TYPE][slot], ammount);

				new already_exists = ItemAlreadyInVehicle(PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] ][player_vehicle_ID], PLAYER_VISUAL_INV[playerid][slot_TYPE][slot]);

				if (already_exists)
				{
					new DB_Query[164];
					format(DB_Query, sizeof DB_Query,
						"UPDATE `VEHICLE_STORAGE` SET `EXTRA` = EXTRA + '%d' WHERE `ID` = '%d';",
						ammount,
						already_exists
					);
					db_free_result(db_query(Database, DB_Query));
				}
				else
				{
					AddItemToVehicle(
						PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] ][player_vehicle_ID],
						PLAYER_VISUAL_INV[playerid][slot_TYPE][slot],
						ammount
					);		
				}

				SetPlayerChatBubble(playerid, "\n\n\n\n* Mete algo al maletero.\n\n\n", 0xffcb90FF, 20.0, 5000);
			}
			else ShowPlayerMessage(playerid, "~r~No puedes hacerlo con ese objeto", 4);
		}
		else ShowPlayerMessage(playerid, "~r~No tienes un item en la mano", 4);
		}
	return 1;
}

CMD:echar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /echar "COL_WHITE"[ID o nombre]");
	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~El jugador no esta conectado.", 3);
	if (playerid == params[0]) return ShowPlayerMessage(playerid, "~r~No puedes expulsar a ti mismo.", 3);

	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new vehicleid = GetPlayerVehicleID(playerid);

		if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Este no es tú vehículo.", 3);
		if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~Este no es tú vehículo.", 3);
		if (GetPlayerVehicleID(params[0]) != vehicleid) return ShowPlayerMessage(playerid, "~r~Este jugador no está en tu vehículo", 3);

		RemovePlayerFromVehicle(params[0]);

		SetPlayerChatBubble(playerid, "\n\n\n\n* Hecha a alguien de su vehículo.\n\n\n", 0xffcb90FF, 20.0, 5000);
		return 1;
	}

	ShowPlayerMessage(playerid, "~r~No estás en tu propiedad o en tu vehículo.", 3);
	return 1;
}

CMD:comprar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	CheckAndBuyProperty(playerid);
	return 1;
}

/*CMD:tienda(playerid, params[])
{
	ShowStore(playerid);
	return 1;
}*/

CMD:notificaciones(playerid, params[])
{
	ShowDialog(playerid, DIALOG_USER_NOTIFICATIONS);
	return 1;
}
alias:notificaciones("not")

CMD:canjear(playerid, params[])
{
	ShowDialog(playerid, DIALOG_GIFT);
	return 1;
}
alias:canjear("code", "giftcode")

CMD:dimitir(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	new str_text[128];
	new player_jobs = CountPlayerJobs(playerid);

	if (!player_jobs) return ShowPlayerMessage(playerid, "~r~No tienes un trabajo.", 2);

	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No estás depie.", 3);

	new work;
	if (sscanf(params, "d", work))
	{
		new works[32 * sizeof(work_info)], line_str[32], count;
		for(new i = 1; i != sizeof(work_info); i ++)
		{
			if (PLAYER_WORKS[playerid][i])
			{
				if (count > 0) strcat(works, ", ");

				format(line_str, sizeof line_str, "%s (%d)", work_info[i][work_info_NAME], i);
				strcat(works, line_str);

				count ++;
			}
		}

		SendClientMessageEx(playerid, COLOR_WHITE, "Trabajos: %s", works);
		SendClientMessage(playerid, COLOR_WHITE, "Syntax: /renunciar <Num. del trabajo>");
		return 1;
	}

	if (work < 1 || work >= sizeof work_info) return SendClientMessage(playerid, COLOR_WHITE, "El trabajo no es válido.");

	if (!PLAYER_WORKS[playerid][work])
	{
		format(str_text, sizeof(str_text), "No eres %s.", work_info[work][work_info_NAME]);
		return ShowPlayerNotification(playerid, str_text, 3);
	}

	if (PLAYER_TEMP[playerid][py_WORKING_IN] == work) return ShowPlayerMessage(playerid, "~r~Estás de servicio en ese trabajo, deja de trabajar para renunciar.", 3);

	new DB_Query[256];
	format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_WORKS` SET `SET` = '0' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", ACCOUNT_INFO[playerid][ac_ID], work);
	db_free_result(db_query(Database, DB_Query));

	if (work == WORK_POLICE)
	{
		format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_SKILLS` SET `TOTAL` = '0' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", ACCOUNT_INFO[playerid][ac_ID], work);
		db_free_result(db_query(Database, DB_Query));

		PLAYER_SKILLS[playerid][work] = 0;
	}

	format(str_text, sizeof(str_text), "Has abandonado tu trabajo de %s.", work_info[work][work_info_NAME]);
	ShowPlayerNotification(playerid, str_text, 3);
	PLAYER_WORKS[playerid][work] = false;
	return 1;
}
alias:dimitir("renunciar")

CMD:motor(playerid, params[])
{
	SetEngineAction(playerid);
	return 1;
}

CMD:mecanico(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_MECHANIC]) return ShowPlayerMessage(playerid, "~r~No eres mecánico.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_NONE && PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_MECHANIC)
	{
		//ShowPlayerMessage(playerid, "~r~Ya estas en servicio en otro trabajo.", 3);
		return 1;
	}

	if (GetPlayerVirtualWorld(playerid) != 0) return ShowPlayerMessage(playerid, "~r~No estás en el sitio correcto.", 3);
	if (GetPlayerInterior(playerid) != 0) return ShowPlayerMessage(playerid, "~r~No estás en el sitio correcto.", 3);
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No estás depie.", 3);
	if (!IsPlayerInRangeOfPoint(playerid, 1.0,-69.941520, -1181.400634, 1.750000)) return ShowPlayerMessage(playerid, "~r~No estás en el sitio correcto.", 3);

	if (!PLAYER_TEMP[playerid][py_WORKING_IN]) StartPlayerJob(playerid, WORK_MECHANIC);
	else EndPlayerJob(playerid);
	return 1;
}

/*CMD:menu(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	ShowRangeUser(playerid);
	SendClientMessage(playerid, COLOR_RED, "AVISO:"COL_WHITE" Esto es viejo, presione la tecla N para abrir el nuevo inventario.");
	return 1;
}*/

/*CMD:plantar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (GetPlayerVirtualWorld(playerid) != 0) return ShowPlayerMessage(playerid, "~r~No estás en el sitio correcto.", 3);
	if (GetPlayerInterior(playerid) != 0) return ShowPlayerMessage(playerid, "~r~No estás en el sitio correcto.", 3);
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No estás depie.", 3);
	if (PLAYER_TEMP[playerid][py_PLANTING]) return ShowPlayerMessage(playerid, "~r~Ya estas plantado algo.", 3);

	new str_text[128];

	if (gettime() < PLAYER_TEMP[playerid][py_LAST_PLANT_TIME] + 5)
	{
		new time = (60-(gettime()-PLAYER_TEMP[playerid][py_LAST_PLANT_TIME]));
		format(str_text, sizeof(str_text), "Tienes que esperar %s minutos para volver a plantar.", TimeConvert(time));
		ShowPlayerMessage(playerid, str_text, 4);
		return 1;
	}

	if (GetPlayerPlantedPlants(playerid) > 25) return ShowPlayerMessage(playerid, "~r~Tienes muchas plantas, recógelas para seguir", 4);

	for(new i = 0; i != MAX_PLANTS; i ++)
	{
		if (!PLANTS[i][plant_VALID]) continue;

		new Float:x, Float:y, Float:z;
		GetDynamicObjectPos(PLANTS[i][plant_OBJECT_ID], x, y, z);
		if (IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z))
		{
			ShowPlayerMessage(playerid, "Aquí ya hay una planta, aléjate un poco para plantar.", 4);
			return 1;
		}
	}

	ShowDialog(playerid, DIALOG_PLANT_PLANTS);
	return 1;
}*/

CMD:no(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No estás depie.", 3);
	if (IsPlayerJumping(playerid)) return 1;
	
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	ClearAnimations(playerid);

	return 1;
}

CMD:cagar(playerid, params[])
{
	if ((gettime() - PLAYER_TEMP[playerid][py_LIMIT_SHIT]) < 30) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 30 segundos para volver a hacer esto.", 3);

	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No estás depie.", 3);

	ApplyAnimation(playerid, "ped", "SEAT_down", 4.000000, 0, 1, 1, 1, 0);
	SetTimerEx("StopShitting", 3000, false, "i", playerid);

	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);

	new shit_particle = CreateDynamicObject(18678, x, y, z - 2.8, 0.0, 0.0, 0.0);
	SetTimerEx("DestroyParticleObject", 1000, false, "i", shit_particle);

	SetPlayerChatBubble(playerid, "\n\n\n\n* Se baja los pantalones para cagar.\n\n\n", 0xffcb90FF, 20.0, 5000);
	PLAYER_TEMP[playerid][py_LIMIT_SHIT] = gettime();
	return 1;
}
alias:cagar("defecar")

CMD:parar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED || IsPlayerInAnyVehicle(playerid) || PLAYER_TEMP[playerid][py_CUFFED]) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 0, true);
	ClearAnimations(playerid);

	PLAYER_TEMP[playerid][py_IN_MARKET] = false;
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][41]);

	if (PLAYER_TEMP[playerid][py_SELFIE])
	{
		PLAYER_TEMP[playerid][py_SELFIE] = false;
		TogglePlayerControllableEx(playerid, true);
		SetCameraBehindPlayer(playerid);
		ApplyAnimation(playerid, "PED", "ATM", 4.1, 0, 1, 1, 0, 1, 1);
	}
	return 1;
}

CMD:rendirse(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_HANDSUP); //rendirse
	return 1;
}

CMD:blowjob(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "BLOWJOBZ", "BJ_COUCH_LOOP_W", 4.0, 1, 1, 1, 0, 0);//blowjob
	return 1;
}

CMD:sexo(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /sexo "COL_WHITE"<playerid>");
	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador Desconectado.", 2);

	new Float:x, Float:y, Float:z;
	GetPlayerPos(params[0], x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no está cerca tuya.", 2);

	new str_text[144];
	format(str_text, sizeof(str_text), "* %s le hace sexo oral a %s.", PLAYER_TEMP[playerid][py_RP_NAME], PLAYER_TEMP[params[0]][py_RP_NAME]);
	ProxDetector(playerid, 15.0, str_text, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 85);

	ApplyAnimation(playerid, "BLOWJOBZ", "BJ_COUCH_LOOP_W", 4.0, 1, 1, 1, 0, 0);
	return 1;
}

CMD:rodar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid,"PED","BIKE_fallR",4.0,0,1,1,1,0);
	return 1;
}

CMD:borracho(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid,"PED", "WALK_DRUNK",4.0,1,1,1,1,500);//borracho
	return 1;
}

CMD:bomba(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0,0);//bomba
	return 1;
}

CMD:apuntar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation( playerid,"ped", "ARRESTgun", 4.0, 0, 1, 1, 1,500);
	return 1;
}

CMD:reir(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid, "RAPPING", "Laugh_01", 4.0, 0, 0, 0, 0, 0);//reir
	return 1;
}

CMD:amenazar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid, "SHOP", "ROB_Loop_Threat", 4.0, 0, 0, 0, 1, 500);//amenazar
	return 1;
}

CMD:paja(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "PAULNMAC", "wank_loop", 4.0, 1, 0, 0, 1, 0);
	return 1;
}

CMD:herido(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "SWEET", "LaFin_Sweet", 4.0, 0, 1, 1, 1, 0);
	return 1;
}

CMD:cruzarbrazos(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, 1, 1, 1, 0, 4000);
	return 1;
}

CMD:recostarse(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid,"SUNBATHE", "Lay_Bac_in", 4.0, 0, 0, 0, 1, 0);//recostarse
	return 1;
}

CMD:cubrirse(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid, "ped", "cower", 4.0, 1, 0, 0, 0, 0);//crubrirse
	return 1;
}

CMD:vomitar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0);//vomitar
	return 1;
}

CMD:comer(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
	return 1;
}

CMD:despedir(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "KISSING", "BD_GF_Wave", 3.0, 0, 0, 0, 0, 0);//despedir
	return 1;
}

CMD:nalgada(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "SWEET", "sweet_ass_slap", 4.0, 0, 0, 0, 0, 0);//nalgada
	return 1;
}

CMD:agonizar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "WUZI", "CS_Dead_Guy", 4.0, 0, 0, 0, 1, 0);//agonizar
	return 1;
}

CMD:besar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "KISSING", "Playa_Kiss_02", 4.0, 0, 0, 0, 0, 0);//besar
	return 1;
}

CMD:crack(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 1, 0);//crack
	return 1;
}

CMD:mear(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    SetPlayerSpecialAction(playerid, 68);//mear
	return 1;
}

CMD:sentarse(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid, "SUNBATHE", "ParkSit_M_in", 4.000000, 0, 1, 1, 1, 0);//sentarse
	return 1;
}

CMD:asiento(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid, "ped", "SEAT_down", 4.000000, 0, 1, 1, 1, 0);
	return 1;
}

CMD:fucku(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation( playerid,"ped", "fucku", 4.0, 0, 1, 1, 1, 1 );//fucku
	return 1;
}

CMD:taichi(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "PARK", "Tai_Chi_Loop",  4.1,7,5,1,1,1);//taichi
	return 1;
}

CMD:beber(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "BAR", "dnk_stndM_loop", 4.0, 0, 1, 1, 0, 4000);//beber
	return 1;
}

CMD:boxear(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "GYMNASIUM", "gym_shadowbox",  4.1,7,5,1,1,1);//boxear
	return 1;
}

CMD:saludar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /saludar "COL_WHITE"<playerid>");
	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador Desconectado.", 2);

	new Float:x, Float:y, Float:z;
	GetPlayerPos(params[0], x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 30.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no está cerca tuya.", 2);

	new str_text[144];
	format(str_text, sizeof(str_text), "* %s saluda a %s.", PLAYER_TEMP[playerid][py_RP_NAME], PLAYER_TEMP[params[0]][py_RP_NAME]);
	ProxDetector(playerid, 15.0, str_text, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 85);

	ApplyAnimation(playerid,"GANGS", "hndshkfa_swt", 4.1, 0, 0, 0, 0, 0); //saludar
	return 1;
}

CMD:llorar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid,"GRAVEYARD","mrnF_loop",4.1,0,0,0,0,0);//llorar
	return 1;
}

CMD:rapear(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid,"RAPPING","RAP_B_Loop",4.0,1,0,0,0,8000);//rapear
	return 1;
}

CMD:astrip(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid,"STRIP","strip_A",4.1,7,5,1,1,1);//strip
	return 1;
}

CMD:bailar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    if (sscanf(params, "d", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /bailar [1-4]");

	switch(params[0])
	{
	    case 1: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
		case 2: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
		case 3: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
		case 4: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE4);
		default: SendClientMessage(playerid, COLOR_WHITE, "Syntax: /bailar [1-4]");
	}
	return 1;
}

CMD:alentar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid,"ON_LOOKERS","shout_02",4.1,7,5,1,1,1);//alentar
	return 1;
}

CMD:hablar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid,"PED","IDLE_chat",4.1,7,5,1,1,1);//hablar
	return 1;
}

/*CMD:clickslot(playerid, params[])
{
	new slot;
	if (sscanf(params, "d", slot)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /clickslot <slot>");
	if (slot < 0) return 0;
	if (slot > 11) return 0;

	PLAYER_TEMP[playerid][py_INVENTORY_TYPE] = 0;
	ClickInventorySlot(playerid, slot, true);
	return 1;
}

CMD:equipitem(playerid, params[])
{
	new type;
	if (sscanf(params, "d", type)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /equipitem <tipo>");
	if (type < 0) return 0;

	EquipItemByType(playerid, type);
	return 1;
}*/

CMD:mafia(playerid, params[])
{
	if (PLAYER_WORKS[playerid][WORK_MAFIA])
	{
		PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
		PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
		ShowDialog(playerid, DIALOG_MAFIA_LIST);
		return 1;
	}
	
	if (PLAYER_WORKS[playerid][WORK_ENEMY_MAFIA])
	{
		PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
		PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
		ShowDialog(playerid, DIALOG_ENEMY_MAFIA_LIST);
		return 1;
	}

	if (PLAYER_WORKS[playerid][WORK_OSBORN])
	{
		PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
		PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
		ShowDialog(playerid, DIALOG_OSBORN_MAFIA_LIST);
		return 1;
	}

	if (PLAYER_WORKS[playerid][WORK_CONNOR])
	{
		PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
		PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
		ShowDialog(playerid, DIALOG_CONNOR_MAFIA_LIST);
		return 1;
	}

	if (PLAYER_WORKS[playerid][WORK_DIVISO])
	{
		PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
		PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
		ShowDialog(playerid, DIALOG_DIVISO_MAFIA_LIST);
		return 1;
	}

	if (PLAYER_WORKS[playerid][WORK_SINDACCO])
	{
		PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
		PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
		ShowDialog(playerid, DIALOG_SINDACCO_MAFIA_LIST);
		return 1;
	}
	
	ShowPlayerMessage(playerid, "~r~No eres mafioso.", 3);
	return 1;
}

CMD:vip(playerid, params[])
{
	if (ACCOUNT_INFO[playerid][ac_SU]) ShowDialog(playerid, DIALOG_SU);
	else ShowDialog(playerid, DIALOG_SU_BUY);
	return 1;
}

CMD:minero(playerid)
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (PLAYER_WORKS[playerid][WORK_MINER])
	{
		if (PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] != 9999)
		{
			new slot = PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT];
			if (PLAYER_VISUAL_INV[playerid][slot_TYPE][slot] == 52)
			{
				for(new i = 0; i < sizeof ROCKS_OBJ; i ++)
				{
					if (ROCKS_OBJ[i][r_ACTIVATED])
					{
						if (IsPlayerInRangeOfPoint(playerid, 1.5, ROCKS_OBJ[i][r_X], ROCKS_OBJ[i][r_Y], ROCKS_OBJ[i][r_Z]))
						{
							StartMining(playerid, i);
							return 1;
						}
					}
				}
			}
		}

		// Drop rock (finished miner job)
		if (PLAYER_TEMP[playerid][py_ROCK])
		{
			for(new i = 0; i != sizeof DROP_ROCK_POS; i ++)
			{
				if (IsPlayerInRangeOfPoint(playerid, 1.0, DROP_ROCK_POS[i][mp_X], DROP_ROCK_POS[i][mp_Y], DROP_ROCK_POS[i][mp_Z]))
				{
					PLAYER_TEMP[playerid][py_ROCK] = false;
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					ApplyAnimation(playerid, "CARRY", "PUTDWN", 4.1, false, false, false, false, 0, false);
					RemovePlayerAttachedObject(playerid, 9);
					PayPlayerMiner(playerid);
					DropPlayerRock(playerid, i);
				}	
			}
		}
	}
	return 1;
}

#define MIN_SECONDS_BETWEEN_COMMANDS 1 // Deben pasar al menos 1 segundos entre comando y comando.
public OnPlayerCommandReceived(playerid, cmd[], params[], flags)
{
	Logger_Debug("OnPlayerCommandReceived %d %s %s",playerid,cmd,params); // This is a debug line!

	if (PLAYER_TEMP[playerid][py_KICKED]) return 0;
	if (PLAYER_TEMP[playerid][py_STEAL_SUSPICION]) return KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);

	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < 8)
	{
		if (PLAYER_TEMP[playerid][py_GAME_STATE] != GAME_STATE_NORMAL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_HOSPITAL || PLAYER_TEMP[playerid][py_NEW_USER])
		{
			ShowPlayerMessage(playerid, "~r~Ahora no puedes usar comandos.", 3);
			return 0;
		}
	}

	if (PLAYER_TEMP[playerid][py_SELECT_TEXTDRAW]) return ShowPlayerMessage(playerid, "Pulsa ~y~ESC~w~ para cerrar el menú.", 4);

	new interval = GetTickDiff(GetTickCount(), PLAYER_TEMP[playerid][py_ANTIFLOOD_COMMANDS]);
	if (interval < MIN_SECONDS_BETWEEN_COMMANDS)
	{
		if (ac_Info[CHEAT_COMMAND_SPAMMER][ac_Enabled])
		{
			if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_COMMAND_SPAMMER][p_ac_info_IMMUNITY])
			{
				if (interval < 50)
				{
					if (!ac_Info[CHEAT_COMMAND_SPAMMER][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_COMMAND_SPAMMER, float(interval));
					else
					{
						if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_COMMAND_SPAMMER][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_COMMAND_SPAMMER][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_COMMAND_SPAMMER][p_ac_info_DETECTIONS] = 0;
						else PLAYER_AC_INFO[playerid][CHEAT_COMMAND_SPAMMER][p_ac_info_DETECTIONS] ++;

						PLAYER_AC_INFO[playerid][CHEAT_COMMAND_SPAMMER][p_ac_info_LAST_DETECTION] = gettime();
						if (PLAYER_AC_INFO[playerid][CHEAT_COMMAND_SPAMMER][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_COMMAND_SPAMMER][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_COMMAND_SPAMMER, float(interval));
					}
				}
			}
		}
		SendClientMessage(playerid, COLOR_WHITE, "¡Tranquilo, quemarás el teclado!");
		return 0;
	}

	if (flags)
	{
		if (flags > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
		{
			SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" No tienes permisos suficientes.");
			return 0;
		}

		if (!PLAYER_TEMP[playerid][py_ADMIN_SERVICE])
		{
		    ShowPlayerMessage(playerid, "~r~Debes estar de servicio como admin, usa /duty.", 3);
			return 0;
		}
	}

	PLAYER_TEMP[playerid][py_ANTIFLOOD_COMMANDS] = GetTickCount();
	return 1;
}

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags) 
{
	Logger_Debug("OnPlayerCommandPerformed %d %s %s",playerid,params,result); // This is a debug line!

	Logger_Info("%s (%d): /%s %s", PLAYER_TEMP[playerid][py_NAME], playerid, cmd, params);
    if (result == -1) 
    { 
		SendClientMessageEx(playerid, COLOR_WHITE, "El comando "COL_RED"/%s "COL_WHITE"no existe, usa "COL_RED"/ayuda"COL_WHITE".", cmd);
        return 0; 
    }
    return 1; 
}