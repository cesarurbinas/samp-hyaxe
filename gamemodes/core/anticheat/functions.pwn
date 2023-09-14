bool:IsPlayerJumping(playerid)
{
	switch(GetPlayerAnimationIndex(playerid))
	{
		case 1128 .. 1138, 1195 .. 1198, 1438 .. 1440, 1061 .. 1064: return true;
	}
	return false;
}

Anticheat_Ban(playerid, reason[], days = 0)
{
	// Alert user ban
	SendClientMessageEx(playerid, COLOR_OCTA, "[ANTI-CHEAT]"COL_WHITE" Fuiste baneado, razón: %s.", reason);

	new days_string[32];
	if (!days) format(days_string, 32, "Permanente");
	else format(days_string, 32, "%d dias", days);

	new dialog[250];
	format(dialog, sizeof dialog, "\
		"COL_WHITE"Has sido baneado del servidor por el anticheat.\n\
		Razón: %s\n\
		Duración: %s\n\n\
		¿Fue un error? Si es así, apele el baneo en nuestro foro: foro.hyaxe.com\
	", reason, days_string);
	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_OCTA"Octa Anticheat", dialog, "Cerrar", "");
	
	// Add ban
	AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, reason, days);

	// Send alert to admins/discord
	new str_text[144];
	format(str_text, sizeof(str_text), "[ADMIN] Octa baneó a %s (%d): %s (%s).", ACCOUNT_INFO[playerid][ac_NAME], playerid, reason, days_string);
	SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 2);
	SendDiscordWebhook(str_text, 1);

	// Save ban count
	PLAYER_MISC[playerid][MISC_BANS] ++;
	SavePlayerMisc(playerid);

	// Kick user
	KickEx(playerid, 500);
	return 1;
}

Anticheat_Kick(playerid, reason[])
{
	// Alert user kick
	SendClientMessageEx(playerid, COLOR_OCTA, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado, razón: %s.", reason);

	new dialog[250];
	format(dialog, sizeof dialog, "\
		"COL_WHITE"Has sido expulsado del servidor por el anticheat.\n\
		Razón: %s\n\
		¿Fue un error? Si es así, reporte en nuestro foro: foro.hyaxe.com\
	", reason, days_string);
	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_OCTA"Octa Anticheat", dialog, "Cerrar", "");
	
	// Send alert to admins/discord
	new str_text[144];
	format(str_text, sizeof(str_text), "[ADMIN] Octa kickeó a %s (%d): %s.", ACCOUNT_INFO[playerid][ac_NAME], playerid, reason);
	SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 2);
	SendDiscordWebhook(str_text, 1);

	// Kick user
	KickEx(playerid, 500);
	return 1;
}