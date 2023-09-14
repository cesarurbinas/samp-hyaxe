CMD:antecedente(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);

	new to_player, reason[128];
	if (sscanf(params, "us[128]", to_player, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /antecedentes <playerid> <razon>");
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (to_player == playerid) return 1;

	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No se puede añadir algo a este jugador ahora.", 3);
	if (PLAYER_WORKS[to_player][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No se puede añadir algo a este jugador porque es policía.", 3);

	AddPlayerPoliceHistory(to_player, ACCOUNT_INFO[playerid][ac_NAME], reason);
	SendPoliceNotification(sprintf("%s ha actualizado el historial de ~y~%s~w~.", PLAYER_TEMP[playerid][py_RP_NAME], PLAYER_TEMP[to_player][py_RP_NAME]), 4);
	return 1;
}

CMD:limpiar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);
	if (PLAYER_SKILLS[playerid][WORK_POLICE] < 11) return ShowPlayerNotification(playerid, "No tienes rango suficiente.", 3);

	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /limpiar <playerid>");
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No se puede eliminar el historial policial de este jugador ahora.", 3);

	new DB_Query[128];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `POLICE_HISTORY` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[to_player][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	SendPoliceNotification(sprintf("%s ha borrado el historial de ~y~%s~w~.", PLAYER_TEMP[playerid][py_RP_NAME], PLAYER_TEMP[to_player][py_RP_NAME]), 4);
	return 1;
}

CMD:historial(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);

	ShowDialog(playerid, DIALOG_POLICE_BYC);
	return 1;
}

CMD:c(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerNotification(playerid, "Ahora no puedes usar comandos.", 3);

	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_SKILLS[playerid][WORK_POLICE] < 1) return ShowPlayerNotification(playerid, "No tienes rango suficiente.", 3);

	new to_player, level, reason[32];
	if (sscanf(params, "uds[32]", to_player, level, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /c <ID o nombre> <1/6> <razon>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (to_player == playerid) return ShowPlayerMessage(playerid, "~r~No puedes darte cargos a tu mismo");
	if (PLAYER_WORKS[to_player][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~Este jugador es miembro de la policía.", 3);
	if (level > 6) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /c <ID o nombre> <1/6> <razon>");
	if (strlen(reason) >= 24) return ShowPlayerMessage(playerid, "~r~Como máximo puedes introducir una razón de 32 caracteres.", 3);

	PLAYER_TEMP[to_player][py_POLICE_REASON] = reason;

	new str_text[128];
	format(str_text, sizeof(str_text), "%s le puso %d cargos a ~r~%s~w~ (%s).", PLAYER_TEMP[playerid][py_NAME], level, PLAYER_TEMP[to_player][py_NAME], reason);
	SendPoliceNotification(str_text, 4);

	SetPlayerPoliceSearchLevel(to_player, level);
	return 1;
}

CMD:cargos(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerNotification(playerid, "Ahora no puedes usar comandos.", 3);

	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_SKILLS[playerid][WORK_POLICE] < 1) return ShowPlayerNotification(playerid, "No tienes rango suficiente.", 3);

	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /cargos <ID o nombre>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (to_player == playerid) return ShowPlayerMessage(playerid, "~r~No puedes verte a tu mismo");
	if (PLAYER_WORKS[to_player][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~Este jugador es miembro de la policía.", 3);
	if (!PLAYER_TEMP[to_player][py_POLICE_REASON]) return ShowPlayerMessage(playerid, "~r~Este jugador no tiene razones de cargos.", 3);

	SendClientMessageEx(playerid, COLOR_WHITE, "%s tiene cargos por "COL_RED"%s", PLAYER_TEMP[to_player][py_NAME], PLAYER_TEMP[to_player][py_POLICE_REASON]);
	return 1;
}

CMD:documento(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerNotification(playerid, "Ahora no puedes usar comandos.", 3);

	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_SKILLS[playerid][WORK_POLICE] < 1) return ShowPlayerNotification(playerid, "No tienes rango suficiente.", 3);

	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /documento <ID o nombre>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	new Float:x, Float:y, Float:z;
	GetPlayerPos(to_player, x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no está cerca tuya.", 2);

	SetPlayerChatBubble(playerid, "\n\n\n\n* Revisa el documento de alguien\n\n\n", 0xffcb90FF, 20.0, 5000);

	new
		caption[64],
		dialog[144],
		drive[3],
		dni[64]
	;

	if (PLAYER_MISC[to_player][MISC_DRIVE] != 0) drive = "Si";
	else drive = "No";

	if (PLAYER_MISC[to_player][MISC_DNI]) format(dni, sizeof(dni), "%d", PLAYER_MISC[to_player][MISC_DNI]);
	else dni = "No";

	format(caption, sizeof(caption), ""COL_RED"%s", PLAYER_TEMP[to_player][py_NAME]);
	format(dialog, sizeof(dialog), ""COL_WHITE"Documento: %s\nLicencia de conducir: %s", dni, drive);

	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, caption, dialog, "Cerrar", "");
	return 1;
}