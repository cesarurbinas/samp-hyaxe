CMD:jailoff(playerid, params[])
{
	new dbid, minutes, reason[65];
	if(sscanf(params, "dds[65]", dbid, minutes, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Uso: /jailoff (dbid) (minutos) (razón)");
	if(minutes <= 0 || minutes > 1440) return SendClientMessage(playerid, COLOR_WHITE, "Solo puedes jailear por 1440 minutos.");
	if(dbid <= 0) return SendClientMessage(playerid, COLOR_WHITE, "DB-ID inválida.");

	printf("jailoff %d %d %s", dbid, minutes, reason);

	new DBResult:Result, query[175];
	format(query, sizeof(query), "SELECT CUENTA.`NAME`, CUENTA.`CONNECTED`, PERSONAJE.`POLICE_JAIL_TIME` FROM `CUENTA`, `PERSONAJE` WHERE CUENTA.`ID` = %d AND PERSONAJE.`ID_USER` = CUENTA.`ID` LIMIT 1;", dbid);
	Result = db_query(Database, query);
	if(!db_num_rows(Result))
	{
		db_free_result(Result);
		return SendClientMessage(playerid, COLOR_WHITE, "Jugador no encontrado.");
	}

	if(db_get_field_assoc_int(Result, "CONNECTED"))
	{
		SendClientMessage(playerid, COLOR_WHITE, "Este jugador ya está conectado.");
		db_free_result(Result);
		return 1;
	}

	if(db_get_field_assoc_int(Result, "POLICE_JAIL_TIME"))
	{
		db_free_result(Result);
		return SendClientMessage(playerid, COLOR_WHITE, "Este jugador ya esta en prisión.");
	}

	new name[25];
	db_get_field_assoc(Result, "NAME", name);
	db_free_result(Result);

	new update_query[260];
	format(update_query, sizeof(update_query), "\
		UPDATE `PERSONAJE` SET \
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
    format(str, 145, "[ADMIN] %s (%d) jaileó offline a %s (%d): %s.", ACCOUNT_INFO[playerid][ac_NAME], playerid, name, dbid, reason);
    SendMessageToAdmins(COLOR_ANTICHEAT, str);

    new webhook[264];
	format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
	SendDiscordWebhook(webhook, 1);

	return 1;
}

CMD:unjailoff(playerid, params[])
{
	new dbid;
	if(sscanf(params, "d", dbid)) return SendClientMessage(playerid, COLOR_WHITE, "USO: /unjailoff (dbid)");
	if(dbid <= 0) return SendClientMessage(playerid, COLOR_WHITE, "DB-ID inválida.");

	new DBResult:Result, query[175];
	format(query, sizeof(query), "SELECT CUENTA.`NAME`, PERSONAJE.`POLICE_JAIL_TIME` FROM `CUENTA`, `PERSONAJE` WHERE CUENTA.`ID` = %d AND PERSONAJE.`ID_USER` = %d LIMIT 1;", dbid, dbid);
	Result = db_query(Database, query);
	if(!db_num_rows(Result)) 
	{
		db_free_result(Result);
		return SendClientMessage(playerid, COLOR_WHITE, "Jugador no encontrado.");
	}
	
	if(!db_get_field_assoc_int(Result, "POLICE_JAIL_TIME"))
	{
		db_free_result(Result);
		return SendClientMessage(playerid, COLOR_WHITE, "Este jugador no está jaileado.");
	}

	new name[25];
	db_get_field_assoc(Result, "NAME", name);

	db_free_result(Result);

	new update_query[375];
	format(update_query, sizeof(update_query), "\
		UPDATE `PERSONAJE` SET \
			`POLICE_JAIL_TIME` = 0, \
			`POLICE_JAIL_ID` = 0, \
			`STATE` = %d, \
			`JAIL_REASON` = NULL, \
			`JALED_BY` = 0, \
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
    format(str, 145, "[ADMIN] %s (%d) unjaileó offline a %s (%d).", ACCOUNT_INFO[playerid][ac_NAME], playerid, name, dbid);
    SendMessageToAdmins(COLOR_ANTICHEAT, str);

    new webhook[264];
	format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
	SendDiscordWebhook(webhook, 1);

	return 1;
}