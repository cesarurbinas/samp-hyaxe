#if defined CORE_NOTIFICATIONS_TIMERS
	#endinput
#endif

#define CORE_NOTIFICATIONS_TIMERS

forward TIMER_NotificationHide(playerid, count);
public TIMER_NotificationHide(playerid, count)
{
	PlayerTextDrawHide(playerid, g_ptdNotification{playerid});

	KillTimer(GetPVarInt(playerid, "notification_timer"));
	g_ActiveNotification[playerid] = false;

	for (new i = (MAX_NOTIFICATIONS_WAITING_MSGS - 1); i != -1; --i)
	{
		if (WAITING_NOTIFICATIONS[i][wn_VALID])
		{
			ShowPlayerNotification(
				playerid,
				WAITING_NOTIFICATIONS[i][wn_TEXT],
				WAITING_NOTIFICATIONS[i][wn_TIME],
				WAITING_NOTIFICATIONS[i][wn_SOUND]
			);
			WAITING_NOTIFICATIONS[i][wn_VALID] = false;
			break;
		}
	}
	return 1;
}