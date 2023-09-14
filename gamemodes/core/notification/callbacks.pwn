forward DestroyNotification(playerid, notification_id);
public DestroyNotification(playerid, notification_id)
{
	printf("destroy");
	static pos;

	pos = FindNotificationPosById(playerid, notification_id);
	if (pos == -1) return 0;

	if (NotificationData[playerid][pos][nt_TIMER] != 0)
	{
		KillTimer(NotificationData[playerid][pos][nt_TIMER]);
	}

	PlayerTextDrawHide(playerid, NotificationData[playerid][pos][nt_TD]);
	PlayerTextDrawDestroy(playerid, NotificationData[playerid][pos][nt_TD]);
	NotificationData[playerid][pos][nt_ID] = 0;

	if (pos + 1 >= MAX_NOTIFICATIONS) return 1;

	for(new j = pos + 1, time; j < MAX_NOTIFICATIONS; j++)
	{
		if (NotificationData[playerid][j][nt_ID] == 0) continue;

		if (NotificationData[playerid][j][nt_TIME_OUT] == 0)
		{
			ShowPlayerNotification(playerid, NotificationData[playerid][j][nt_TEXT], -1);
		}
		else
		{
			time = NotificationData[playerid][j][nt_TIME_OUT] - gettime();
			if (time > 0)
			{
				ShowPlayerNotification(playerid, NotificationData[playerid][j][nt_TEXT], time);
			}
		}

		DestroyNotification(playerid, NotificationData[playerid][j][nt_ID]);
		return 1;
	}
	return 1;
}