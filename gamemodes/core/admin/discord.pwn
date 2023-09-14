// Utils
//#if defined FINAL_BUILD
DCC_IsUserModerator(DCC_User:user)
{
	new DCC_Guild:guild = DCC_FindGuildById("586980198910656521");
	
	new role_count;
	DCC_GetGuildMemberRoleCount(guild, user, role_count);
	for (new i; i != role_count; i++)
	{
		new DCC_Role:role;
		DCC_GetGuildMemberRole(guild, user, i, role);
		
		new role_name[64];
		DCC_GetRoleName(role, role_name);
		
		if (strfind(role_name, "Moderador", true) != -1) return true;
	}
	return false;
}

DCC_IsUserAdministrator(DCC_User:user)
{
	new DCC_Guild:guild = DCC_FindGuildById("586980198910656521");
	
	new role_count;
	DCC_GetGuildMemberRoleCount(guild, user, role_count);
	for (new i; i != role_count; i++)
	{
		new DCC_Role:role;
		DCC_GetGuildMemberRole(guild, user, i, role);
		
		new role_name[64];
		DCC_GetRoleName(role, role_name);
		
		if (strfind(role_name, "Owner", true) != -1) return true;
	}
	return false;
}

// Users commands
DC_CMD:id(DCC_User:userid, params[], DCC_Message:message)
{
    new DCC_Channel:channelid;
    DCC_GetMessageChannel(message, channelid);

    new to_player;
	if (sscanf(params, "u", to_player)) return SendDiscordMessage(channelid, ":warning: Uso: `!id <id o nombre>`");
	if (!IsPlayerConnected(to_player)) return SendDiscordMessage(channelid, ":x: Jugador desconectado");

	new
		str_text[164],
		player_version[32],
		acid
	;

	GetPlayerVersion(to_player, player_version, sizeof player_version);

	if (ACCOUNT_INFO[to_player][ac_ID] == 0)
	{
		acid = minrand(80000, 90000);
	}
	else acid = ACCOUNT_INFO[to_player][ac_ID];

	format(str_text, sizeof(str_text), "• Nombre: %s (%d) [Nivel %d] | ID de cuenta: %d\n• Versión: %s | PacketLoss: %.2f | Ping: %d",
		PLAYER_TEMP[to_player][py_NAME],
		to_player,
		GetPlayerScore(to_player),
		acid,
		player_version,
		NetStats_PacketLossPercent(to_player),
		GetPlayerPing(to_player)
	);

    SendDiscordMessage(channelid, str_text);
    return 1;
}

DC_CMD:runtime(DCC_User:userid, params[], DCC_Message:message)
{
    new DCC_Channel:channelid;
    DCC_GetMessageChannel(message, channelid);
    SendDiscordMessage(channelid, "El servidor se ha iniciado: %s", ReturnTimelapse(ServerInitTime, gettime()));
    return 1;
}

// Moderation commands
DC_CMD:sampmute(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");

	new to_player, reason[32], time;
	if (sscanf(params, "uds[32]", to_player, time, reason)) return SendDiscordMessage(channelid, ":warning: Uso: `!mute <id o nombre> <tiempo> <razon>`");
	if (time > 65535 || -1 >= time) return SendDiscordMessage(channelid, ":x: Intervalo de minutos incorrecto. (0 - 65535)");
	if (!IsPlayerConnected(to_player)) return SendDiscordMessage(channelid, ":x: Jugador desconectado");
	if (PLAYER_MISC[to_player][MISC_MUTE] > gettime()) return SendDiscordMessage(channelid, "Jugador ya esta muteado");

	if(!time)
	{
		if(!PLAYER_MISC[to_player][MISC_MUTES]) return SendDiscordMessage(channelid, ":x: No puedes usar el valor 0 con usuarios sin muteos.");
		time = 60 * PLAYER_MISC[to_player][MISC_MUTES]; // 60 minutes * mute amount
	}
	
	new seconds = time * 60;

	SendClientMessageEx(to_player, COLOR_ORANGE, "[Alerta]"COL_WHITE" Fuiste silenciado del canal de dudas y anuncios por %s - Tiempo: %d", reason, time);
	PLAYER_MISC[to_player][MISC_MUTES] ++;
	PLAYER_MISC[to_player][MISC_MUTE] = gettime() + seconds;
	SavePlayerMisc(to_player);

	new str[145];
    format(str, 145, "[Dudas] "COL_WHITE"%s (%d) fue silenciado del canal de dudas/anuncios: %s", ACCOUNT_INFO[to_player][ac_NAME], to_player, reason);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if ((PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_DEAD) && ACCOUNT_INFO[i][ac_DOUBT_CHANNEL])
			{
				SendResponsiveMessage(i, COLOR_DARK_GREEN, str, 125);
			}
		}
	}
	return 1;
}

DC_CMD:sampunmute(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");

	new to_player;
    if (sscanf(params, "u", to_player)) return SendDiscordMessage(channelid, ":warning: Uso: `!unmute <player_id>`");
    if (!IsPlayerConnected(to_player)) return SendDiscordMessage(channelid, ":x: Jugador desconectado");

	if (gettime() > PLAYER_MISC[to_player][MISC_MUTE]) return SendDiscordMessage(channelid, ":x: Este jugador no está silenciado.");

	SendClientMessage(to_player, COLOR_DARK_GREEN, "[Dudas]"COL_WHITE" Ya puedes volver a enviar dudas.");
	PLAYER_MISC[to_player][MISC_MUTE] = 0;
	SavePlayerMisc(to_player);
	return 1;
}

DC_CMD:jail(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new to_player, reason[64], time;
    if (sscanf(params, "uds[64]", to_player, time, reason)) return SendDiscordMessage(channelid, ":warning: `!jail <player_id> <minutos> <razón>`");
	if (time < 0 || time > 1440) return SendDiscordMessage(channelid, ":x: Intervalo de minutos incorrecto.");
    if (!IsPlayerConnected(to_player)) return SendDiscordMessage(channelid, ":x: Jugador desconectado");

	if(CHARACTER_INFO[to_player][ch_STATE] == ROLEPLAY_STATE_JAIL) return SendDiscordMessage(channelid, ":x: Este jugador ya esta encarcelado.");
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

    if (PLAYER_TEMP[to_player][py_WANT_MECHANIC])
    {
	   PLAYER_TEMP[to_player][py_WANT_MECHANIC] = false;
	   DisablePlayerMechanicMark(to_player);
    }
    if (PLAYER_TEMP[to_player][py_PLAYER_IN_CALL]) EndPhoneCall(to_player);
    if (PLAYER_TEMP[to_player][py_GPS_MAP]) HidePlayerGpsMap(to_player);

    JailPlayer(to_player, time * 60);
    SetPlayerSpecialAction(to_player, SPECIAL_ACTION_NONE);

    new dialog[250];
	format(dialog, sizeof dialog, ""COL_WHITE"Has sido jaielado, razón: %s.\nRecuerde que a los 10 jails sera baneado permanentemente.", reason);
	ShowPlayerDialog(to_player, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Entiendo", "");

	SendDiscordMessage(channelid, "Jugador jaileado");
	return 1;
}

DC_CMD:unjail(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new to_player;
	if (sscanf(params, "u", to_player)) return SendDiscordMessage(channelid, ":warning: `!unjail <player_id>`");
	if (!IsPlayerConnected(to_player)) return SendDiscordMessage(channelid, ":x: Jugador desconectado");

	if (CHARACTER_INFO[to_player][ch_STATE] != ROLEPLAY_STATE_JAIL) return SendDiscordMessage(channelid, ":x: El jugador no está en jail.");

	UnjailPlayer(to_player);
	SendDiscordMessage(channelid, "El jugador `%s (%d)` ahora está en libertad.", ACCOUNT_INFO[to_player][ac_NAME], to_player);
	return 1;
}

DC_CMD:sampban(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new to_player, reason[32];
	if (sscanf(params, "us[32]", to_player, reason)) return SendDiscordMessage(channelid, ":warning: Uso: `!ban <player_id> <razon>`");
	if (!IsPlayerConnected(to_player)) return SendDiscordMessage(channelid, ":x: Jugador desconectado");

	if (PLAYER_TEMP[to_player][py_KICKED]) return SendDiscordMessage(channelid, ":x: El jugador ya está expulsado.");
	if (!ACCOUNT_INFO[to_player][ac_ID]) return KickEx(to_player, 100);

	AddPlayerBan(ACCOUNT_INFO[to_player][ac_ID], ACCOUNT_INFO[to_player][ac_NAME], ACCOUNT_INFO[to_player][ac_IP], 11, TYPE_BAN, reason);

	new dialog[250];
	format(dialog, sizeof dialog, ""COL_WHITE"Has sido baneado, razón: %s", reason);
	ShowPlayerDialog(to_player, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Entiendo", "");
	KickEx(to_player, 500);
	PLAYER_MISC[to_player][MISC_BANS] ++;
	SavePlayerMisc(to_player);

	SendDiscordMessage(channelid, "Jugador (`nick: '%s' dbid: '%d', id: '%d'`) baneado.", ACCOUNT_INFO[to_player][ac_NAME], ACCOUNT_INFO[to_player][ac_ID], to_player);
	return 1;
}

DC_CMD:sampunban(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new name[24];
	if (sscanf(params, "s[24]", name)) return SendDiscordMessage(channelid, ":warning: Uso: `!unban <nombre completo>`");

	new DBResult:Result, DB_Query[128];
	format(DB_Query, sizeof DB_Query, "SELECT * FROM `BANS` WHERE `NAME` = '%q';", name);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		format(DB_Query, sizeof DB_Query, "DELETE FROM `BANS` WHERE `NAME` = '%q';", name);
		db_free_result(db_query(Database, DB_Query));

		SendDiscordMessage(channelid, "El usuario `%s` ha sido desbaneado.", name);
	}
	else SendDiscordMessage(channelid, "El nombre `%s` no está en la lista de baneados.", name);
	db_free_result(Result);
	return 1;
}

DC_CMD:dban(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);

	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");

	new reason[32], to_account;
	if (sscanf(params, "ds[32]", to_account, reason)) return SendDiscordMessage(channelid, ":x: `!dban <DB-ID> <razon>`");

	new DBResult:Result, DB_Query[160];
	format(DB_Query, sizeof DB_Query, "SELECT `ID`, `IP`, `NAME`, `CONNECTED`, `PLAYERID`, `ADMIN_LEVEL` FROM `ACCOUNTS` WHERE `ID` = '%d';", to_account);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		new id, ip[16], get_name[24], connected, player_id;

		id = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "IP", ip, 16);
		db_get_field_assoc(Result, "NAME", get_name, 24);
		connected = db_get_field_assoc_int(Result, "CONNECTED");
		player_id = db_get_field_assoc_int(Result, "PLAYERID");

		if (connected) SendDiscordMessage(channelid, "JUGADOR '%s' DB-ID '%d' conectado utilice !ban, su player_id: %d.", get_name, id, player_id);
		else
		{
			new DBResult:is_banned;
			format(DB_Query, sizeof DB_Query, "SELECT * FROM `BANS` WHERE `NAME` = '%q' OR `IP` = '%q';", get_name, ip);
			is_banned = db_query(Database, DB_Query);

			if (db_num_rows(is_banned))
			{
				new expire_date[24];
				db_get_field_assoc(is_banned, "EXPIRE_DATE", expire_date, 24);

				if (!strcmp(expire_date, "0", false)) SendDiscordMessage(channelid, "JUGADOR (Nombre: '%s' DB-ID: '%d') ya está baneado (permanentemente).", get_name, id);
				else SendDiscordMessage(channelid, "JUGADOR (Nombre: '%s' DB-ID: '%d') ya está baneado (temporalmente, fecha de readmisión: %s).", get_name, id, expire_date);
			}
			else
			{
				AddPlayerBan(id, get_name, ip, 11, TYPE_BAN, reason);
				SendDiscordMessage(channelid, "Jugador (nick: '%s' db_id: '%d') baneado.", get_name, id);
			}

			db_free_result(is_banned);
		}
	}
	else SendDiscordMessage(channelid, ":x: No se encontro la DB-ID.");
	db_free_result(Result);
	return 1;
}

DC_CMD:dtban(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new reason[32], to_account, days;
	if (sscanf(params, "dds[32]", to_account, days, reason)) return SendDiscordMessage(channelid, ":warning: Uso: `!dtban <DB-ID> <dias> <razon>`");
	if (days <= 0 || days > 9999) return SendDiscordMessage(channelid, ":warning: `!dtban <DB-ID> <dias> <razon>`");

	new DBResult:Result, DB_Query[160];
	format(DB_Query, sizeof DB_Query, "SELECT `ID`, `IP`, `NAME`, `CONNECTED`, `PLAYERID` FROM `ACCOUNTS` WHERE `ID` = '%d';", to_account);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		new id, ip[16], get_name[24], connected, player_id;

		id = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "IP", ip, 16);
		db_get_field_assoc(Result, "NAME", get_name, 24);
		connected = db_get_field_assoc_int(Result, "CONNECTED");
		player_id = db_get_field_assoc_int(Result, "PLAYERID");

		if (connected) SendDiscordMessage(channelid, "JUGADOR `%s` DB-ID `%d` conectado utilice `!ban`, su player_id: `%d`.", get_name, id, player_id);
		else
		{
			new DBResult:is_banned;
			format(DB_Query, sizeof DB_Query, "SELECT * FROM `BANS` WHERE `NAME` = '%q' OR `IP` = '%q';", get_name, ip);
			is_banned = db_query(Database, DB_Query);

			if (db_num_rows(is_banned))
			{
				new expire_date[24];
				db_get_field_assoc(is_banned, "EXPIRE_DATE", expire_date, 24);

				if (!strcmp(expire_date, "0", false)) SendDiscordMessage(channelid, "JUGADOR (`Nombre: '%s' DB-ID: '%d'`) ya está baneado (permanentemente).", get_name, id);
				else SendDiscordMessage(channelid, "JUGADOR (`Nombre: '%s' DB-ID: '%d'`) ya está baneado (`temporalmente, fecha de readmisión: %s`).", get_name, id, expire_date);
			}
			else
			{
				AddPlayerBan(id, get_name, ip, 11, TYPE_TEMP_BAN, reason, days);
				SendDiscordMessage(channelid, "Jugador (`nick: %s dbid: %d`) baneado por `%d` días.", get_name, id, days);
			}

			db_free_result(is_banned);
		}
	}
	else SendDiscordMessage(channelid, ":x: No se encontro la DB-ID.");
	db_free_result(Result);
	return 1;
}

DC_CMD:tban(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new to_player, days, reason[32];
	if (sscanf(params, "uds[32]", to_player, days, reason)) return SendDiscordMessage(channelid, ":warning: Uso: `!tban <player_id> <dias> <razon>`");
	if (!IsPlayerConnected(to_player)) return SendDiscordMessage(channelid, ":x: Jugador desconectado");

	if (days <= 0 || days > 9999) return SendDiscordMessage(channelid, ":warning: Uso: `!ban <player_id> <dias> <razon>`");

	if (PLAYER_TEMP[to_player][py_KICKED]) return SendDiscordMessage(channelid, ":x: El jugador ya está expulsado.");
	if (!ACCOUNT_INFO[to_player][ac_ID]) return KickEx(to_player, 100);

	AddPlayerBan(ACCOUNT_INFO[to_player][ac_ID], ACCOUNT_INFO[to_player][ac_NAME], ACCOUNT_INFO[to_player][ac_IP], 11, TYPE_TEMP_BAN, reason, days);

	new dialog[250];
	format(dialog, sizeof dialog, ""COL_WHITE"Fuiste baneado por %d días, razón: %s", days, reason);
	ShowPlayerDialog(to_player, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Entiendo", "");
	KickEx(to_player, 500);
	PLAYER_MISC[to_player][MISC_BANS] ++;
	SavePlayerMisc(to_player);

	SendDiscordMessage(channelid, "Jugador (`nick: %s dbid: %d, pid: %d`) baneado por `%d` días.", ACCOUNT_INFO[to_player][ac_NAME], ACCOUNT_INFO[to_player][ac_ID], to_player, days);
	return 1;
}

DC_CMD:sampkick(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new to_player, reason[64];
	if (sscanf(params, "us[64]", to_player, reason)) return SendDiscordMessage(channelid, ":warning: Uso: `!kick <player_id> <razon>`");
	if (!IsPlayerConnected(to_player)) return SendDiscordMessage(channelid, ":x: Jugador desconectado");

	if (PLAYER_TEMP[to_player][py_KICKED]) return SendDiscordMessage(channelid, ":x: El jugador ya está expulsado.");
	if (!ACCOUNT_INFO[to_player][ac_ID]) return KickEx(to_player, 100);

	AddPlayerBadHistory(ACCOUNT_INFO[to_player][ac_ID], 11, TYPE_KICK, reason);

	new dialog[170];
	format(dialog, sizeof dialog, ""COL_WHITE"Has sido expulsado, razón: %s", reason);
	ShowPlayerDialog(to_player, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Entiendo", "");
	KickEx(to_player, 500);
	PLAYER_MISC[to_player][MISC_KICKS] ++;
	SavePlayerMisc(to_player);

	SendDiscordMessage(channelid, "Jugador (`nick: %s dbid: %d, pid: %d`) expulsado.", ACCOUNT_INFO[to_player][ac_NAME], ACCOUNT_INFO[to_player][ac_ID], to_player);
	return 1;
}

DC_CMD:ls(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new to_player;
    if (sscanf(params, "u", to_player)) return SendDiscordMessage(channelid, ":warning: Uso: `/ls <player_id>`");
    if (!IsPlayerConnected(to_player)) return SendDiscordMessage(channelid, ":x: Jugador desconectado");
	if(CHARACTER_INFO[to_player][ch_STATE] == ROLEPLAY_STATE_JAIL) return SendDiscordMessage(channelid, ":x: No puedes usar esto con jugadores en la cárcel.");

	CHARACTER_INFO[to_player][ch_STATE] = ROLEPLAY_STATE_NORMAL;
	CHARACTER_INFO[to_player][ch_INTERIOR_EXTRA] = 0;
	PLAYER_TEMP[to_player][py_INTERIOR_INDEX] = 0;
	CHARACTER_INFO[to_player][ch_INTERIOR] = 0;
	CHARACTER_INFO[to_player][ch_POLICE_JAIL_TIME] = 0;
    SetPlayerPosEx(to_player, 1555.400390, -1675.611694, 16.195312, 0.0, 0, 0, true);
	SendDiscordMessage(channelid, "Jugador '%s (%d)' fue llevado a LS.", ACCOUNT_INFO[to_player][ac_NAME], to_player);
	return 1;
}

DC_CMD:lsdb(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new to_account;
	if (sscanf(params, "d", to_account)) return SendDiscordMessage(channelid, ":warning: Uso: `/lsdb <DB-ID>`");

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

		if(jailtime > 0) return SendDiscordMessage(channelid, ":x: Este jugador esta en prisión, no puedes enviarlo a otra posición.");
		if(connected) SendDiscordMessage(channelid, ":warning: JUGADOR `%s` DB-ID `%d` conectado utilice `!ls`, su player_id: `%d`.", get_name, id, player_id);
		else
		{
			format(DB_Query, sizeof DB_Query, "UPDATE `CHARACTER` SET `POS_X` = '1555.400390', `POS_Y` = '-1675.611694', `POS_Z` = 16.195312, `ANGLE` = '0.0', `STATE` = '%d', `INTERIOR` = '0', `LOCAL_INTERIOR` = '0', `POLICE_JAIL_TIME` = '0' WHERE `ID_USER` = '%d';", ROLEPLAY_STATE_NORMAL, to_account);
			db_free_result(db_query(Database, DB_Query));

			SendDiscordMessage(channelid, "Jugador `%s - DB-ID %d` ahora aparecerá en LS.", get_name, id);
		}
	}
	else SendDiscordMessage(channelid, "No se encontro la DB-ID.");
	db_free_result(Result);
	return 1;
}

DC_CMD:getname(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new db_id;
	if (sscanf(params, "d", db_id)) return SendDiscordMessage(channelid, ":warning: Uso: `!getname <DB-ID>`");

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

		SendDiscordMessage(channelid, "Nombre: `%s` DB-ID: `%d` Conectado: `%d` Playerid: `%d`", get_name, id, connected, player_id);
	}
	else SendDiscordMessage(channelid, ":x: Sin resultados.");
	db_free_result(Result);
	return 1;
}

DC_CMD:player(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	
	new name[24];
	if (sscanf(params, "s[24]", name)) return SendDiscordMessage(channelid, ":warning: Uso: `!player <nombre o parte del nombre>`");

	new DBResult:Result, DB_Query[264];
	format(DB_Query, sizeof DB_Query, "SELECT `ID`, `NAME`, `LAST_CONNECTION` FROM `ACCOUNTS` WHERE `NAME` LIKE '%%%q%%' LIMIT 3;", name);
	Result = db_query(Database, DB_Query);

	new count;
	for(new i = 0; i < db_num_rows(Result); i ++)
	{
		new id, get_name[24], last_connection[32];

		id = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "NAME", get_name, 24);
		db_get_field_assoc(Result, "LAST_CONNECTION", last_connection, 32);

		SendDiscordMessage(channelid, "Nombre: `%s (id: %d)` | `%s`", get_name, id, last_connection);

		count ++;
		db_next_row(Result);
	}
	db_free_result(Result);

	if (!count)
		SendDiscordMessage(channelid, ":x: No existen usuarios con esos nombres", count);
	return 1;
}

DC_CMD:getid(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new name[24];
	if (sscanf(params, "s[24]", name)) return SendDiscordMessage(channelid, ":warning: Uso: `!getid <nombre o parte del nombre>`");

	new DBResult:Result, DB_Query[128];
	format(DB_Query, sizeof DB_Query, "SELECT `ID`, `NAME`, `LAST_CONNECTION` FROM `ACCOUNTS` WHERE `NAME` LIKE '%%%q%%' LIMIT 5;", name);
	Result = db_query(Database, DB_Query);

	new count;
	for(new i = 0; i < db_num_rows(Result); i ++)
	{
		new id, get_name[24], last_connection[32];

		id = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "NAME", get_name, 24);
		db_get_field_assoc(Result, "LAST_CONNECTION", last_connection, 32);

		SendDiscordMessage(channelid, "Nombre: `%s`, DB-ID: `%d`, Ult. Con: `%s`", get_name, id, last_connection);

		count ++;
		db_next_row(Result);
	}
	db_free_result(Result);

	SendDiscordMessage(channelid, "Se encontraron `%d` coincidencias, el límite es 5.", count);
	return 1;
}

DC_CMD:setpass(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new to_account, new_pass[MAX_PASS_LENGTH + 1];
	if (sscanf(params, "ds[19]", to_account, new_pass)) return SendDiscordMessage(channelid, ":warning: Uso: `!setpass <DB-ID> <pass>`");

	new DBResult:Result, DB_Query[160];
	format(DB_Query, sizeof DB_Query, "SELECT `ID`, `NAME`, `CONNECTED`, `PLAYERID` FROM `ACCOUNTS` WHERE `ID` = '%d';", to_account);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		new id, get_name[24], connected, player_id;

		id = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "NAME", get_name, 24);
		connected = db_get_field_assoc_int(Result, "CONNECTED");
		player_id = db_get_field_assoc_int(Result, "PLAYERID");

		if (connected) SendDiscordMessage(channelid, "JUGADOR `%s` DB-ID `%d` conectado, player_id: `%d`, no es necario cambiar la contraseña.", get_name, id, player_id);
		else
		{
			new salt[16], salt_ex[16], pass_ex[64 + 1];
			getRandomSalt(salt);
			format(salt_ex, 16, "%s", salt);

			SHA256_PassHash(new_pass, salt_ex, pass_ex, 64 + 1);

			format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `SALT` = '%q', `PASS` = '%q' WHERE `ID` = '%d';", salt_ex, pass_ex, id);
			db_free_result(db_query(Database, DB_Query));

			SendDiscordMessage(channelid, "La contraseña de `%s` ahora es: `%s`", get_name, new_pass);
		}
	}
	else SendDiscordMessage(channelid, ":x: No se encontro la DB-ID.");
	db_free_result(Result);
	return 1;
}

DC_CMD:setname(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new to_player, new_name[24];
	if (sscanf(params, "us[24]", to_player, new_name)) return SendDiscordMessage(channelid, ":warning: Uso: `!setname <player_id> <nuevo nombre>`");
	if (!IsPlayerConnected(to_player)) return SendDiscordMessage(channelid, ":x: Jugador desconectado");

	new DBResult:Result, DB_Query[256], bool:used;
	format(DB_Query, sizeof DB_Query, "SELECT `ID` FROM `ACCOUNTS` WHERE `NAME` = '%q';", new_name);
	Result = db_query(Database, DB_Query);
	if (db_num_rows(Result)) used = true;
	db_free_result(Result);
	if (used) return SendDiscordMessage(channelid, ":x: El nombre `%s` está en uso.", new_name);

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

	SendClientMessageEx(to_player, COLOR_WHITE, ""COL_WHITE"Tu nombre ha sido cambiado a %s", new_name);
	SendDiscordMessage(channelid, "El nombre del jugador ha sido cambiado a `%s`", new_name);
	return 1;
}

DC_CMD:staff(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new online_staff;
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
	   	if (IsPlayerConnected(i))
	    {
	    	if (PLAYER_TEMP[i][py_ADMIN_SERVICE])
	    	{
	    		SendDiscordMessage(channelid, "[%s] %s (%i)", ADMIN_LEVELS[ ACCOUNT_INFO[i][ac_ADMIN_LEVEL] ], PLAYER_TEMP[i][py_NAME], i);
	    		online_staff ++;
	    	}
	    }
	}

	if (online_staff == 0) SendDiscordMessage(channelid, ":x: No hay staff activos");

	return 1;
}

DC_CMD:setjails(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserAdministrator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new to_player, ammount;
    if (sscanf(params, "ud", to_player, ammount)) return SendDiscordMessage(channelid, ":warning: Uso: `!setjails <player_id> <ammount>`");
    if (!IsPlayerConnected(to_player)) return SendDiscordMessage(channelid, ":x: Jugador desconectado");

    PLAYER_MISC[to_player][MISC_JAILS] = ammount;
    SavePlayerMisc(to_player);
    SendDiscordMessage(channelid, "El jugador `%s` ahora tiene `%d` jaileos.", PLAYER_TEMP[to_player][py_NAME], ammount);
	return 1;
}

DC_CMD:getresponse(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserAdministrator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");

	new to_account;
	if (sscanf(params, "d", to_account)) return SendDiscordMessage(channelid, ":warning: Uso: `!getresponse <DB-ID>`");

	new DBResult:Result, DB_Query[160];

	// Security question
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `SECURITY_QUESTIONS` WHERE `ID_USER` = '%d';", to_account);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		new response[60];
		db_get_field_assoc(Result, "RESPONSE", response, 32);
		SendDiscordMessage(channelid, "Respuesta: %s", response);
	}
	else SendDiscordMessage(channelid, ":x: No se encontro la DB-ID.");
	db_free_result(Result);
	return 1;
}

DC_CMD:setmutes(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserAdministrator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new to_player, ammount;
    if (sscanf(params, "ud", to_player, ammount)) return SendDiscordMessage(channelid, ":warning: Uso: `!setmutes <player_id> <ammount>`");
    if (!IsPlayerConnected(to_player)) return SendDiscordMessage(channelid, ":x: Jugador desconectado");

    PLAYER_MISC[to_player][MISC_MUTES] = ammount;
    SavePlayerMisc(to_player);
    SendDiscordMessage(channelid, "El jugador `%s` ahora tiene `%d` muteos.", PLAYER_TEMP[to_player][py_NAME], ammount);
	return 1;
}

DC_CMD:expro(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserAdministrator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new id_property;
	if (sscanf(params, "d", id_property)) return SendDiscordMessage(channelid, ":warning: Uso: `!exproperty <id>`");
	if (id_property <= 0) return SendDiscordMessage(channelid, ":warning: Uso: `/exproperty < id > 0 >`");

	new index = GetPropertyIndexByID(id_property);
	if (index == -1) return SendDiscordMessage(channelid, ":x: ID no encontrada.");

	if (!PROPERTY_INFO[index][property_SOLD]) return SendDiscordMessage(channelid, ":x: Esta propiedad ya está en venta.");


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

	SendDiscordMessage(channelid, "Propiedad `%d` expropiada.", PROPERTY_INFO[ index ][property_ID]);
	return 1;
}

DC_CMD:asay(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserAdministrator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	if (isnull(params)) return SendDiscordMessage(channelid, ":warning: Uso: `!asay <message>`");
	
	new str[144];
	format(str, 144, "[Anuncio]"COL_WHITE" Admin Atom: (( %s ))", params);
	SendClientMessageToAll(0x717ebeFF, str);

	SendDiscordMessage(channelid, "Anuncio enviado");
	return 1;
}

DC_CMD:gift(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserAdministrator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
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

	SendDiscordMessage(channelid, "Regalo enviado");
	return 1;
}

DC_CMD:giftrep(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserAdministrator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
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

	SendDiscordMessage(channelid, "Regalo enviado");
	return 1;
}

DC_CMD:explode(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserAdministrator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new to_player;
    if (sscanf(params, "u", to_player)) return SendDiscordMessage(channelid, ":warning: `!explode <player_id>`");
    if (!IsPlayerConnected(to_player)) return SendDiscordMessage(channelid, ":x: Jugador desconectado");

	new Float:X, Float:Y, Float:Z;
	GetPlayerPos(to_player, X, Y, Z);
	CreateExplosion( X, Y, Z, 7, 10.0);
	SendDiscordMessage(channelid, "Jugador `%s (%d)` fue explotado.", ACCOUNT_INFO[to_player][ac_NAME], to_player);
	return 1;
}

DC_CMD:dudas(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserModerator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	if (isnull(params)) return SendDiscordMessage(channelid, ":warning: Uso: `!dudas <message>`");
	
	new str[364];
	format(str, sizeof(str), "[Dudas] "COL_WHITE"Discord: (( %s ))", params);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if ((PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_DEAD) && ACCOUNT_INFO[i][ac_DOUBT_CHANNEL])
			{
				SendResponsiveMessage(i, COLOR_DARK_GREEN, str, 135);
			}
		}
	}

	new DCC_Channel:channel;
	channel = DCC_FindChannelById("790742732829491230");
	SendDiscordMessage(channel, "%s", str);
	return 1;
}

DC_CMD:playerip(DCC_User:userid, params[], DCC_Message:message)
{
	new DCC_Channel:channelid;
	DCC_GetMessageChannel(message, channelid);
	if(!DCC_IsUserAdministrator(userid)) return SendDiscordMessage(channelid, ":x: No tienes permisos suficientes");
	
	new to_player;
    if (sscanf(params, "u", to_player)) return SendDiscordMessage(channelid, ":warning: `!playerip <player_id>`");
    if (!IsPlayerConnected(to_player)) return SendDiscordMessage(channelid, ":x: Jugador desconectado");

	SendDiscordMessage(channelid, "%s (%d): %s", ACCOUNT_INFO[to_player][ac_NAME], to_player, ACCOUNT_INFO[to_player][ac_IP]);
	return 1;
}
//#endif

// Callbacks
public OnDiscordCommandPerformed(const params[], success, DCC_Message:message)
{
	Logger_Debug("OnDiscordCommandPerformed %s %d",params,success); // This is a debug line!
    return 1;
}