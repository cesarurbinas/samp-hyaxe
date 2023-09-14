#if defined CORE_NOTIFICATIONS_FUNCTIONS
	#endinput
#endif

#define CORE_NOTIFICATIONS_FUNCTIONS

ShowPlayerNotification(playerid, const message[], time = 3, sound = 0)
{
	if (!IsPlayerConnected(playerid))
		return 0;

	new str_text[264];
	format(str_text, sizeof(str_text), "%s", TextToSpanish(message));

	time = time * 1000;

	if (g_ActiveNotification[playerid])
	{
		for (new i = (MAX_NOTIFICATIONS_WAITING_MSGS - 1); i != -1; --i)
		{
			if (!WAITING_NOTIFICATIONS[i][wn_VALID])
			{
				WAITING_NOTIFICATIONS[i][wn_VALID] = true;
				WAITING_NOTIFICATIONS[i][wn_TIME] = time;
				WAITING_NOTIFICATIONS[i][wn_SOUND] = sound;
				format(WAITING_NOTIFICATIONS[i][wn_TEXT], 264, "%s", message);
				break;
			}
		}
	}
	else
	{
		PlayerTextDrawSetString(playerid, g_ptdNotification{playerid}, message);
		PlayerTextDrawShow(playerid, g_ptdNotification{playerid});
		if (sound) PlayerPlaySoundEx(playerid, sound, 0.0, 0.0, 0.0);

		SetPVarInt(playerid, "notification_timer", SetTimerEx("TIMER_NotificationHide", time, false, "i", playerid));

		g_ActiveNotification[playerid] = true;
	}
	return 1;
}