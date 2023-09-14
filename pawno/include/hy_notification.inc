#if defined hy_notification_include
	#endinput
#endif

#define hy_notification_include
#include <a_samp>

#if !defined MAX_NOTIFICATIONS
	#define MAX_NOTIFICATIONS 3
#endif

enum HY_NOTIFICATIONS_ENUM
{
	HYN_ID,
	PlayerText:HYN_TD,
	HYN_TEXT[128],
	HYN_LINES,
	HYN_POS[2],
	HYN_TIME_OUT,
	HYN_TIMER
}

static
	NOTIFICATIONS_DATA[MAX_PLAYERS][MAX_NOTIFICATIONS][HY_NOTIFICATIONS_ENUM],
	hy_LAST_ID = 0
;

stock hy_ShowNotification(playerid, const text[], time = 0)
{
	static
		free_pos,
		lines_count,
		Float:pos_y,
		PlayerText:temp_td
	;

	free_pos = hy_GetFreeNotificationSlot(playerid);
	if (free_pos == -1) return 0;

	lines_count = hy_GetLineOfString(text);

	pos_y = 125.833366;

	for(new i; i < free_pos; i++)
	{
		pos_y += 12.0 + (NOTIFICATIONS_DATA[playerid][i][HYN_LINES] * 16.0) + 5.0;

		new test[128];
		format(test, 128, "%s", NOTIFICATIONS_DATA[playerid][i][HYN_TEXT]);
		SendClientMessage(playerid, -1, test);
	}

	if (lines_count > 1)
	{
		pos_y -= (lines_count - 1) * 30.0;
	}

	NOTIFICATIONS_DATA[playerid][free_pos][HYN_LINES] = lines_count;
	format(NOTIFICATIONS_DATA[playerid][free_pos][HYN_TEXT], 128, text);

	temp_td = CreatePlayerTextDraw(playerid, 498.470672, pos_y + 6.0, NOTIFICATIONS_DATA[playerid][free_pos][HYN_TEXT]);
	PlayerTextDrawLetterSize(playerid, temp_td, 0.287999, 1.249997);
	PlayerTextDrawTextSize(playerid, temp_td, 604.000000, 0.000000);
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

static stock hy_FindNotificationPosById(playerid, notification_id)
{
	for(new i = 0; i < MAX_NOTIFICATIONS; i++)
	{
		if (NOTIFICATIONS_DATA[playerid][i][HYN_ID] == notification_id) return i;
	}
	return -1;
}

static stock hy_GetLineOfString(const string[])
{
	new
		lines_count = 1,
		perv_step_pos = 0,
		step_pos = 0
	;

	for(new i = 0; i < 128; i++)
	{
		if (string[i] == '\0') break;
		step_pos = strfind(string, "~n~", false, perv_step_pos);
		
		if (step_pos == -1)
		{
			break;
		}
		else
		{
			perv_step_pos = step_pos + 3;
			lines_count ++;
		}
	}
	return lines_count;
}

static stock hy_GetFreeNotificationSlot(playerid)
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