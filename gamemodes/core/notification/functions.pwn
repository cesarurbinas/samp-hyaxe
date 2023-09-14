#if defined CORE_NOTIFICATIONS_FUNCTIONS
	#endinput
#endif

#define CORE_NOTIFICATIONS_FUNCTIONS

_Notification_StartNewOne(playerid)
{
	for (new i = (MAX_NOTIFICATIONS_WAITING_MSGS - 1); i != -1; --i)
	{
		if (g_rgszNotificationWaitingList[playerid][i]{0})
		{
			new buffer[256];

			strunpack(buffer, g_rgszNotificationWaitingList[playerid][i]);
			g_rgszNotificationWaitingList[playerid][i]{0} = '\0';

			Notification_Show(playerid, buffer, false);
			return 1;
		}
	}
	return 0;
}

Notification_AutoPos_0(playerid, bool:only_pos = false)
{
	if (!IsPlayerConnected(playerid))
		return 0;
	
	if (!g_szNotificationText_0[playerid]{0})
		return 0;

	new
		total_jumps = 0,
		jump_pos = -3,
		Float:current_offset = 5.8,
		Float:current_size = 0.7,
		Float:current_bar_size = 23.0;

	g_iNotificationOffset_0[playerid] = 312.0;
	g_iNotificationBg2Size_0[playerid] = 2.500004;

	while ((jump_pos = strfind(g_szNotificationText_0[playerid], "~n~", .pos = (jump_pos + 3))) != -1)
	{
		g_iNotificationOffset_0[playerid] -= current_offset;
		g_iNotificationBg2Size_0[playerid] += current_size;

		current_offset += 2.7;
		current_size += 0.2;
		
		++total_jumps;
	}

	current_bar_size += ((total_jumps == 1) ? 4.8 : (total_jumps > 1) ? ((6.9 + (total_jumps - 2)) * total_jumps) : 0.0);

	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg_0{playerid}, 89.000000, g_iNotificationOffset_0[playerid]);
	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg2_0{playerid}, 89.000000, (g_iNotificationOffset_0[playerid] + 1.0));
	PlayerTextDrawSetPos(playerid, g_ptdNotificationText_0{playerid}, 11.000000, (g_iNotificationOffset_0[playerid] + 2.0));
	PlayerTextDrawSetPos(playerid, g_ptdNotificationBar_0{playerid}, 12.000000, (g_iNotificationOffset_0[playerid] + current_bar_size));

	if (!only_pos)
	{
		PlayerTextDrawLetterSize(playerid, g_ptdNotificationBg_0{playerid}, 0.600000, g_iNotificationBg2Size_0[playerid]);
		PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg_0{playerid}, 0x00000000);

		PlayerTextDrawLetterSize(playerid, g_ptdNotificationBg2_0{playerid}, 0.600000, (g_iNotificationBg2Size_0[playerid] - 0.249999));
		PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg2_0{playerid}, 0x00000000);

		PlayerTextDrawSetString(playerid, g_ptdNotificationText_0{playerid}, g_szNotificationText_0[playerid]);
		PlayerTextDrawColor(playerid, g_ptdNotificationText_0{playerid}, 0xe6e6e600);

		PlayerTextDrawTextSize(playerid, g_ptdNotificationBar_0{playerid}, NOTIFICATION_BAR_START, 75.000000);
		PlayerTextDrawBoxColor(playerid, g_ptdNotificationBar_0{playerid}, 0xec413400);
	}

	PlayerTextDrawShow(playerid, g_ptdNotificationBg_0{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBg2_0{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationText_0{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBar_0{playerid});
	return 1;
}

Notification_AutoPos_1(playerid, bool:only_pos = false)
{
	if (!IsPlayerConnected(playerid))
		return 0;
	
	if (!g_szNotificationText_1[playerid]{0})
		return 0;

	new
		total_jumps = 0,
		jump_pos = -3,
		Float:current_offset = 5.8,
		Float:current_size = 0.7,
		Float:current_bar_size = 23.0;

	g_iNotificationOffset_1[playerid] = g_iNotificationOffset_0[playerid] - 32.0;
	g_iNotificationBg2Size_1[playerid] = 2.500004;

	while ((jump_pos = strfind(g_szNotificationText_1[playerid], "~n~", .pos = (jump_pos + 3))) != -1)
	{
		g_iNotificationOffset_1[playerid] -= current_offset;
		g_iNotificationBg2Size_1[playerid] += current_size;

		current_offset += 2.7;
		current_size += 0.2;

		++total_jumps;
	}

	current_bar_size += ((total_jumps == 1) ? 4.8 : (total_jumps > 1) ? ((6.9 + (total_jumps - 2)) * total_jumps) : 0.0);

	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg_1{playerid}, 89.000000, g_iNotificationOffset_1[playerid]);
	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg2_1{playerid}, 89.000000, (g_iNotificationOffset_1[playerid] + 1.0));
	PlayerTextDrawSetPos(playerid, g_ptdNotificationText_1{playerid}, 11.000000, (g_iNotificationOffset_1[playerid] + 2.0));
	PlayerTextDrawSetPos(playerid, g_ptdNotificationBar_1{playerid}, 12.000000, (g_iNotificationOffset_1[playerid] + current_bar_size));

	if (!only_pos)
	{
		PlayerTextDrawLetterSize(playerid, g_ptdNotificationBg_1{playerid}, 0.600000, g_iNotificationBg2Size_1[playerid]);
		PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg_1{playerid}, 0x00000000);

		PlayerTextDrawLetterSize(playerid, g_ptdNotificationBg2_1{playerid}, 0.600000, (g_iNotificationBg2Size_1[playerid] - 0.249999));
		PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg2_1{playerid}, 0x00000000);

		PlayerTextDrawSetString(playerid, g_ptdNotificationText_1{playerid}, g_szNotificationText_1[playerid]);
		PlayerTextDrawColor(playerid, g_ptdNotificationText_1{playerid}, 0xe6e6e600);

		PlayerTextDrawTextSize(playerid, g_ptdNotificationBar_1{playerid}, NOTIFICATION_BAR_START, 75.000000);
		PlayerTextDrawBoxColor(playerid, g_ptdNotificationBar_1{playerid}, 0xec413400);
	}

	PlayerTextDrawShow(playerid, g_ptdNotificationBg_1{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBg2_1{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationText_1{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBar_1{playerid});
	return 1;
}

Notification_AutoPos_2(playerid, bool:only_pos = false)
{
	if (!IsPlayerConnected(playerid))
		return 0;
	
	if (!g_szNotificationText_2[playerid]{0})
		return 0;

	new
		total_jumps = 0,
		jump_pos = -3,
		Float:current_offset = 5.8,
		Float:current_size = 0.7,
		Float:current_bar_size = 23.0;

	g_iNotificationOffset_2[playerid] = g_iNotificationOffset_1[playerid] - 32.0;
	g_iNotificationBg2Size_2[playerid] = 2.500004;

	while ((jump_pos = strfind(g_szNotificationText_2[playerid], "~n~", .pos = (jump_pos + 3))) != -1)
	{
		g_iNotificationOffset_2[playerid] -= current_offset;
		g_iNotificationBg2Size_2[playerid] += current_size;

		current_offset += 2.7;
		current_size += 0.2;
		
		++total_jumps;
	}

	current_bar_size += ((total_jumps == 1) ? 4.8 : (total_jumps > 1) ? ((6.9 + (total_jumps - 2)) * total_jumps) : 0.0);

	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg_2{playerid}, 89.000000, g_iNotificationOffset_2[playerid]);
	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg2_2{playerid}, 89.000000, (g_iNotificationOffset_2[playerid] + 1.0));
	PlayerTextDrawSetPos(playerid, g_ptdNotificationText_2{playerid}, 11.000000, (g_iNotificationOffset_2[playerid] + 2.0));
	PlayerTextDrawSetPos(playerid, g_ptdNotificationBar_2{playerid}, 12.000000, (g_iNotificationOffset_2[playerid] + current_bar_size));

	if (!only_pos)
	{
		PlayerTextDrawLetterSize(playerid, g_ptdNotificationBg_2{playerid}, 0.600000, g_iNotificationBg2Size_2[playerid]);
		PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg_2{playerid}, 0x00000000);

		PlayerTextDrawLetterSize(playerid, g_ptdNotificationBg2_2{playerid}, 0.600000, (g_iNotificationBg2Size_2[playerid] - 0.249999));
		PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg2_2{playerid}, 0x00000000);

		PlayerTextDrawSetString(playerid, g_ptdNotificationText_2{playerid}, g_szNotificationText_2[playerid]);
		PlayerTextDrawColor(playerid, g_ptdNotificationText_2{playerid}, 0xe6e6e600);

		PlayerTextDrawTextSize(playerid, g_ptdNotificationBar_2{playerid}, NOTIFICATION_BAR_START, 75.000000);
		PlayerTextDrawBoxColor(playerid, g_ptdNotificationBar_2{playerid}, 0xec413400);
	}

	PlayerTextDrawShow(playerid, g_ptdNotificationBg_2{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBg2_2{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationText_2{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBar_2{playerid});
	return 1;
}

Notification_Show(playerid, const message[], bool:auto_jump = true)
{
	if (!IsPlayerConnected(playerid))
		return 0;
	
	new
		buffer[250];
	
	strcat(buffer, message);

	if (auto_jump)
	{
		for (new i = (NOTIFICATION_LIMIT_TEXT - 1), len = strlen(message); i <= len; i += NOTIFICATION_LIMIT_TEXT)
		{
			strins(buffer, "~n~", i);
		}
	}
	
	if (!g_szNotificationText_0[playerid]{0})
	{
		strpack(g_szNotificationText_0[playerid], buffer);
		g_iNotificationCount_0{playerid} = 0;

		Notification_AutoPos_0(playerid);
		Notification_AutoPos_1(playerid, true);
		Notification_AutoPos_2(playerid, true);

		KillTimer(GetPVarInt(playerid, "notification_timer_0"));
		SetPVarInt(playerid, "notification_timer_0", SetTimerEx("TIMER_NotificationAlpha_0", 10, true, "i", playerid));
	}
	else if (!g_szNotificationText_1[playerid]{0})
	{
		strpack(g_szNotificationText_1[playerid], buffer);
		g_iNotificationCount_1{playerid} = 0;

		Notification_AutoPos_0(playerid, true);
		Notification_AutoPos_1(playerid);
		Notification_AutoPos_2(playerid, true);

		KillTimer(GetPVarInt(playerid, "notification_timer_1"));
		SetPVarInt(playerid, "notification_timer_1", SetTimerEx("TIMER_NotificationAlpha_1", 10, true, "i", playerid));
	}
	else if (!g_szNotificationText_2[playerid]{0})
	{
		strpack(g_szNotificationText_2[playerid], buffer);
		g_iNotificationCount_2{playerid} = 0;
		
		Notification_AutoPos_0(playerid, true);
		Notification_AutoPos_1(playerid, true);
		Notification_AutoPos_2(playerid);

		KillTimer(GetPVarInt(playerid, "notification_timer_2"));
		SetPVarInt(playerid, "notification_timer_2", SetTimerEx("TIMER_NotificationAlpha_2", 10, true, "i", playerid));
	}
	else
	{
		for (new i = (MAX_NOTIFICATIONS_WAITING_MSGS - 1); i != -1; --i)
		{
			if (!g_rgszNotificationWaitingList[playerid][i]{0})
			{
				strpack(g_rgszNotificationWaitingList[playerid][i], buffer);
				return true;
			}
		}
		return false;
	}
	return true;
}