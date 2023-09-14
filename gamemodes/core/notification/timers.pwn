#if defined CORE_NOTIFICATIONS_TIMERS
	#endinput
#endif

#define CORE_NOTIFICATIONS_TIMERS

forward TIMER_NotificationHide(playerid, count);
public TIMER_NotificationHide(playerid, count)
{
	print("hide");
	g_ActiveNotification[playerid] = false;
	PlayerTextDrawHide(playerid, g_ptdNotification{playerid});

	for (new i = (MAX_NOTIFICATIONS_WAITING_MSGS - 1); i != -1; --i)
	{
		if (WAITING_NOTIFICATIONS[i][wn_VALID])
		{
			print("waiting");
			printf("waited (%d, %d seconds): %s", i, WAITING_NOTIFICATIONS[i][wn_TIME], WAITING_NOTIFICATIONS[i][wn_TEXT]);
			ShowPlayerNotification(
				playerid,
				WAITING_NOTIFICATIONS[i][wn_TEXT],
				WAITING_NOTIFICATIONS[i][wn_TIME],
				WAITING_NOTIFICATIONS[i][wn_SOUND]
			);

			WAITING_NOTIFICATIONS[i][wn_VALID] = false;
			WAITING_NOTIFICATIONS[i][wn_TEXT] = EOS;
			return 1;
		}
	}
	return 1;
}