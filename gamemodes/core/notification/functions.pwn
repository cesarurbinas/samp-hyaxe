ShowNotification(playerid, const text[], time = 0)
{
	static
		free_pos,
		Float:pos_y,
		PlayerText:temp_td
	;

	free_pos = GetFreeNotificationSlot(playerid);
	if (free_pos == -1) return 0;

	pos_y = 143.333282;

	for(new i; i < free_pos; i++)
	{
		pos_y += 16.0 + (strlen(NotificationData[playerid][i][nt_TEXT]) * 0.4);
	}

	format(NotificationData[playerid][free_pos][nt_TEXT], 128, text);

	temp_td = CreatePlayerTextDraw(playerid, 25.000000, pos_y + 6.0, NotificationData[playerid][free_pos][nt_TEXT]);
	PlayerTextDrawLetterSize(playerid, temp_td, 0.287999, 1.249997);
	PlayerTextDrawTextSize(playerid, temp_td, 160.000000, 0.000000);
	PlayerTextDrawAlignment(playerid, temp_td, 1);
	PlayerTextDrawColor(playerid, temp_td, -1);
	PlayerTextDrawUseBox(playerid, temp_td, 1);
	PlayerTextDrawBoxColor(playerid, temp_td, 255);
	PlayerTextDrawSetShadow(playerid, temp_td, 0);
	PlayerTextDrawSetOutline(playerid, temp_td, 0);
	PlayerTextDrawBackgroundColor(playerid, temp_td, 255);
	PlayerTextDrawFont(playerid, temp_td, 1);
	PlayerTextDrawSetProportional(playerid, temp_td, 1);
	PlayerTextDrawSetShadow(playerid, temp_td, 0);
	PlayerTextDrawShow(playerid, temp_td);

	NotificationData[playerid][free_pos][nt_TD] = temp_td;

	LastNotificationID ++;

	if (time == 0)
	{
		NotificationData[playerid][free_pos][nt_TIME_OUT] = 0;
		NotificationData[playerid][free_pos][nt_TIMER] = 0;
	}
	else
	{
		NotificationData[playerid][free_pos][nt_TIME_OUT] = time + gettime();
		NotificationData[playerid][free_pos][nt_TIMER] = SetTimerEx("DestroyNotification", time * 1000, false, "dd", playerid, LastNotificationID);
	}

	NotificationData[playerid][free_pos][nt_ID] = LastNotificationID;
	return LastNotificationID;
}


FindNotificationPosById(playerid, notification_id)
{
	for(new i = 0; i < MAX_NOTIFICATIONS; i++)
	{
		if (NotificationData[playerid][i][nt_ID] == notification_id) return i;
	}
	return -1;
}

GetFreeNotificationSlot(playerid)
{
	for(new i = 0; i < MAX_NOTIFICATIONS; i++)
	{
		if (NotificationData[playerid][i][nt_ID] == 0)
		{
			return i;
		}
	}
	return -1;
}

ShowPlayerMessage(playerid, const message[], seconds = 0, sound = 0)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][17]);

	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_MESSAGE], TextToSpanish(message));
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_MESSAGE]);

	if (seconds) PLAYER_TEMP[playerid][py_TIMERS][17] = SetTimerEx("HidePlayerMessage", seconds * 1000, false, "i", playerid);
	if (sound) PlayerPlaySoundEx(playerid, sound, 0.0, 0.0, 0.0);
	return 1;
}

ShowPlayerAlert(playerid, const message[], color = -1, seconds = 0, sound = 0)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][20]);

	PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_ALERT], color);
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_ALERT], TextToSpanish(message));
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_ALERT]);

	if (seconds) PLAYER_TEMP[playerid][py_TIMERS][20] = SetTimerEx("HidePlayerAlert", seconds * 1000, false, "i", playerid);
	if (sound) PlayerPlaySoundEx(playerid, sound, 0.0, 0.0, 0.0);
	return 1;
}