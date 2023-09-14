CMD:jailoff(playerid, params[])
{
	new dbid, minutes, reason;
	if(sscanf(params, "dds[65]", dbid, minutes, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Uso: /jailoff (dbid) (minutos) (razón)");
	if(minutes <= 0 || minutes > 1440) return SendClientMessage(playerid, COLOR_WHITE, "Solo puedes jailear por 1440 minutos.");
	if(dbid <= 0) return SendClientMessage(playerid, COLOR_WHITE, "DB-ID inválida.");

	new DBResult:Result, query[165];
	format(query, sizeof(query), "SELECT CUENTA.`NAME`, PERSONAJE.`POLICE_JAIL_TIME` FROM `CUENTA`, `PERSONAJE` WHERE CUENTA.`ID` = %d AND PERSONAJE.`ID_USER` = CUENTA.`ID` LIMIT 1;", dbid);
	Result = db_query(Database, query);
	if(!db_num_rows(Result))
	{
		db_free_result(Result);
		return SendClientMessage(playerid, COLOR_WHITE, "Jugador no encontrado.");
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
	format(query, sizeof(query), "\
		UPDATE `PERSONAJE` SET \
			`POLICE_JAIL_TIME` = %d, \
			`POLICE_JAIL_ID` = 0, \
			`STATE` = %d, \
			`JAIL_REASON` = '%q', \
			`JAILED_BY` = %d \
		WHERE `ID_USER` = %d;",
	minutes * 60, ROLEPLAY_STATE_JAIL, reason, ACCOUNT_INFO[playerid][ac_ID]);
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