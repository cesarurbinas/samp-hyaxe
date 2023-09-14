#include <a_samp>

#define MAX_NOTIFICATIONS 10

enum HY_NOTIFICATIONS_ENUM
{
	HYN_ID,
	PlayerText:HYN_TD,
	HYN_TEXT[128],
	HYN_POS[2],
	HYN_TIME_OUT,
	HYN_TIMER
}

static
	NOTIFICATIONS_DATA[MAX_PLAYERS][MAX_NOTIFICATIONS][HY_NOTIFICATIONS_ENUM],
	hy_LAST_ID = 0
;

hy_ShowNotification(playerid, const text[], time = 0)
{
	static
		free_pos,
		Float:pos_y,
		PlayerText:temp_td
	;

	free_pos = hy_GetFreeNotificationSlot(playerid);
	if (free_pos == -1) return 0;

	pos_y = 143.333282;

	for(new i; i < free_pos; i++)
	{
		pos_y += 16.0 + (strlen(NOTIFICATIONS_DATA[playerid][i][HYN_TEXT]) * 0.4);
	}

	format(NOTIFICATIONS_DATA[playerid][free_pos][HYN_TEXT], 128, text);

	temp_td = CreatePlayerTextDraw(playerid, 25.000000, pos_y + 6.0, NOTIFICATIONS_DATA[playerid][free_pos][HYN_TEXT]);
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

	NOTIFICATIONS_DATA[playerid][free_pos][HYN_TD] = temp_td;

	hy_LAST_ID ++;

	if (time == 0)
	{
		NOTIFICATIONS_DATA[playerid][free_pos][HYN_TIME_OUT] = 0;
		NOTIFICATIONS_DATA[playerid][free_pos][HYN_TIMER] = 0;
	}
	else
	{
		NOTIFICATIONS_DATA[playerid][free_pos][HYN_TIME_OUT] = time + gettime();
		NOTIFICATIONS_DATA[playerid][free_pos][HYN_TIMER] = SetTimerEx("hy_DestroyNotification", time * 1000, false, "dd", playerid, hy_LAST_ID);
	}

	NOTIFICATIONS_DATA[playerid][free_pos][HYN_ID] = hy_LAST_ID;
	return hy_LAST_ID;
}

forward hy_DestroyNotification(playerid, notification_id);
public hy_DestroyNotification(playerid, notification_id)
{
	static pos;

	pos = hy_FindNotificationPosById(playerid, notification_id);
	if (pos == -1) return 0;

	if (NOTIFICATIONS_DATA[playerid][pos][HYN_TIMER] != 0)
	{
		KillTimer(NOTIFICATIONS_DATA[playerid][pos][HYN_TIMER]);
	}

	PlayerTextDrawHide(playerid, NOTIFICATIONS_DATA[playerid][pos][HYN_TD]);
	PlayerTextDrawDestroy(playerid, NOTIFICATIONS_DATA[playerid][pos][HYN_TD]);
	NOTIFICATIONS_DATA[playerid][pos][HYN_ID] = 0;

	if (pos + 1 >= MAX_NOTIFICATIONS) return 1;

	for(new j = pos + 1, time; j < MAX_NOTIFICATIONS; j++)
	{
		if (NOTIFICATIONS_DATA[playerid][j][HYN_ID] == 0) continue;

		if (NOTIFICATIONS_DATA[playerid][j][HYN_TIME_OUT] == 0)
		{
			hy_ShowNotification(playerid, NOTIFICATIONS_DATA[playerid][j][HYN_TEXT], 0);
		}
		else
		{
			time = NOTIFICATIONS_DATA[playerid][j][HYN_TIME_OUT] - gettime();
			if (time > 0)
			{
				hy_ShowNotification(playerid, NOTIFICATIONS_DATA[playerid][j][HYN_TEXT], time);
			}
		}

		hy_DestroyNotification(playerid, NOTIFICATIONS_DATA[playerid][j][HYN_ID]);
		return 1;
	}
	return 1;
}

static hy_FindNotificationPosById(playerid, notification_id)
{
	for(new i = 0; i < MAX_NOTIFICATIONS; i++)
	{
		if (NOTIFICATIONS_DATA[playerid][i][HYN_ID] == notification_id) return i;
	}
	return -1;
}

static hy_GetFreeNotificationSlot(playerid)
{
	for(new i = 0; i < MAX_NOTIFICATIONS; i++)
	{
		if (NOTIFICATIONS_DATA[playerid][i][HYN_ID] == 0)
		{
			return i;
		}
	}
	return -1;
}

ShowPlayerMessage(playerid, const message[], seconds = 0, sound = 0, len = sizeof(message))
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][17]);

	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_MESSAGE], TextToSpanish(message, len));
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_MESSAGE]);

	if (seconds) PLAYER_TEMP[playerid][py_TIMERS][17] = SetTimerEx("HidePlayerMessage", seconds * 1000, false, "i", playerid);
	if (sound) PlayerPlaySoundEx(playerid, sound, 0.0, 0.0, 0.0);
	return 1;
}

forward HidePlayerMessage(playerid);
public HidePlayerMessage(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][17]);
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_MESSAGE], "_");
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_MESSAGE]);
	return 1;
}