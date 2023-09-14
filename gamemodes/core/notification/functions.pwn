#if defined CORE_NOTIFICATIONS_FUNCTIONS
	#endinput
#endif

#define CORE_NOTIFICATIONS_FUNCTIONS

// /testsound 1137
ShowPlayerNotification(playerid, const message[], time = 3, sound = 0)
{
	if (!IsPlayerConnected(playerid))
		return 0;

	new str_text[264];
	format(str_text, sizeof(str_text), "%s", TextToSpanish(message));

	//printf("active: %d", g_ActiveNotification[playerid]);

	if (g_ActiveNotification[playerid])
	{
		//print("active");
		for (new i = (MAX_NOTIFICATIONS_WAITING_MSGS - 1); i != -1; --i)
		{
			if (!WAITING_NOTIFICATIONS[i][wn_VALID])
			{
				//print("added");
				//printf("new (%d, %d seconds): %s", i, time, str_text);
				WAITING_NOTIFICATIONS[i][wn_VALID] = true;
				WAITING_NOTIFICATIONS[i][wn_TIME] = time;
				WAITING_NOTIFICATIONS[i][wn_SOUND] = sound;
				format(WAITING_NOTIFICATIONS[i][wn_TEXT], 264, "%s", str_text);
				break;
			}
		}
	}
	else
	{
		//print("normal");
		g_ActiveNotification[playerid] = true;
		
		PlayerTextDrawSetString(playerid, g_ptdNotification{playerid}, str_text);
		PlayerTextDrawShow(playerid, g_ptdNotification{playerid});
		
		if (sound)
			PlayerPlaySoundEx(playerid, sound, 0.0, 0.0, 0.0);

		SetTimerEx("TIMER_NotificationHide", time * 1000, false, "i", playerid);
	}
	return 1;
}