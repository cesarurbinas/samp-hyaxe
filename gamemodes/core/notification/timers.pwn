#if defined CORE_NOTIFICATIONS_TIMERS
	#endinput
#endif

#define CORE_NOTIFICATIONS_TIMERS

forward TIMER_NotificationAlpha_0(playerid);
public TIMER_NotificationAlpha_0(playerid)
{
	if (g_iNotificationCount_0{playerid} == 255)
	{
		g_iNotificationCount_0{playerid} = NOTIFICATION_BAR_START;
		
		KillTimer(GetPVarInt(playerid, "notification_timer_0"));
		SetPVarInt(playerid, "notification_timer_0", SetTimerEx("TIMER_NotificationMoveBar_0", 22, true, "i", playerid));
		return 1;
	}

	g_iNotificationCount_0{playerid} += 5;

	if (g_iNotificationCount_0{playerid} <= 100) PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg_0{playerid}, Color_SetAlpha(100, g_iNotificationCount_0{playerid}));
	if (g_iNotificationCount_0{playerid} <= 75) PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg2_0{playerid}, Color_SetAlpha(1296911691, g_iNotificationCount_0{playerid}));
	PlayerTextDrawColor(playerid, g_ptdNotificationText_0{playerid}, Color_SetAlpha(-741092353, g_iNotificationCount_0{playerid}));
	PlayerTextDrawBoxColor(playerid, g_ptdNotificationBar_0{playerid}, Color_SetAlpha(-1237960961, g_iNotificationCount_0{playerid}));

	PlayerTextDrawShow(playerid, g_ptdNotificationBg_0{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBg2_0{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationText_0{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBar_0{playerid});
	return 1;
}

forward TIMER_NotificationMoveBar_0(playerid);
public TIMER_NotificationMoveBar_0(playerid)
{
	if (g_iNotificationCount_0{playerid} <= NOTIFICATION_BAR_END)
	{
		g_iNotificationCount_0{playerid} = 0;

		PlayerTextDrawHide(playerid, g_ptdNotificationBar_0{playerid});

		KillTimer(GetPVarInt(playerid, "notification_timer_0"));
		SetPVarInt(playerid, "notification_timer_0", SetTimerEx("TIMER_NotificationMoveRight_0", 15, true, "i", playerid));
		return 1;
	}

	--g_iNotificationCount_0{playerid};

	PlayerTextDrawTextSize(playerid, g_ptdNotificationBar_0{playerid}, g_iNotificationCount_0{playerid}, 75.000000);
	PlayerTextDrawShow(playerid, g_ptdNotificationBar_0{playerid});
	return 1;
}

forward TIMER_NotificationMoveRight_0(playerid);
public TIMER_NotificationMoveRight_0(playerid)
{
	if (g_iNotificationCount_0{playerid} >= 25)
	{
		g_iNotificationCount_0{playerid} = 0;

		KillTimer(GetPVarInt(playerid, "notification_timer_0"));
		SetPVarInt(playerid, "notification_timer_0", SetTimerEx("TIMER_NotificationMoveLeft_0", 10, true, "ii", playerid, 3));
		return 1;
	}

	++g_iNotificationCount_0{playerid};

	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg_0{playerid}, (89.000000 + g_iNotificationCount_0{playerid}), g_iNotificationOffset_0[playerid]);
	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg2_0{playerid}, (89.000000 + g_iNotificationCount_0{playerid}), (g_iNotificationOffset_0[playerid] + 1.0));
	PlayerTextDrawSetPos(playerid, g_ptdNotificationText_0{playerid}, (11.000000 + g_iNotificationCount_0{playerid}), (g_iNotificationOffset_0[playerid] + 2.0));

	PlayerTextDrawShow(playerid, g_ptdNotificationBg_0{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBg2_0{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationText_0{playerid});

	if (g_iNotificationCount_0{playerid} <= 20)
	{
		switch (g_iNotificationCount_0{playerid})
		{
			case 5:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_0"));
				SetPVarInt(playerid, "notification_timer_0", SetTimerEx("TIMER_NotificationMoveRight_0", 10, true, "i", playerid));
			}
			case 10:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_0"));
				SetPVarInt(playerid, "notification_timer_0", SetTimerEx("TIMER_NotificationMoveRight_0", 8, true, "i", playerid));
			}
			case 15:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_0"));
				SetPVarInt(playerid, "notification_timer_0", SetTimerEx("TIMER_NotificationMoveRight_0", 5, true, "i", playerid));
			}
			case 20:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_0"));
				SetPVarInt(playerid, "notification_timer_0", SetTimerEx("TIMER_NotificationMoveRight_0", 30, true, "i", playerid));
			}
		}
	}
	return 1;
}

forward TIMER_NotificationMoveLeft_0(playerid, count);
public TIMER_NotificationMoveLeft_0(playerid, count)
{
	if (g_iNotificationCount_0{playerid} >= 180)
	{
		g_szNotificationText_0[playerid]{0} = '\0';

		PlayerTextDrawHide(playerid, g_ptdNotificationBg_0{playerid});
		PlayerTextDrawHide(playerid, g_ptdNotificationBg2_0{playerid});
		PlayerTextDrawHide(playerid, g_ptdNotificationText_0{playerid});

		KillTimer(GetPVarInt(playerid, "notification_timer_0"));
		_Notification_StartNewOne(playerid);
		return 1;
	}

	g_iNotificationCount_0{playerid} += count;

	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg_0{playerid}, ((89.000000 + 25.0) - g_iNotificationCount_0{playerid}), g_iNotificationOffset_0[playerid]);
	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg2_0{playerid}, ((89.000000 + 25.0) - g_iNotificationCount_0{playerid}), (g_iNotificationOffset_0[playerid] + 1.0));
	PlayerTextDrawSetPos(playerid, g_ptdNotificationText_0{playerid}, ((11.000000 + 25.0) - g_iNotificationCount_0{playerid}), (g_iNotificationOffset_0[playerid] + 2.0));

	PlayerTextDrawShow(playerid, g_ptdNotificationBg_0{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBg2_0{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationText_0{playerid});

	if (g_iNotificationCount_0{playerid} <= 20)
	{
		switch (g_iNotificationCount_0{playerid})
		{
			case 5:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_0"));
				SetPVarInt(playerid, "notification_timer_0", SetTimerEx("TIMER_NotificationMoveLeft_0", 7, true, "ii", playerid, 3));
			}
			case 10:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_0"));
				SetPVarInt(playerid, "notification_timer_0", SetTimerEx("TIMER_NotificationMoveLeft_0", 4, true, "ii", playerid, 3));
			}
			case 15:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_0"));
				SetPVarInt(playerid, "notification_timer_0", SetTimerEx("TIMER_NotificationMoveLeft_0", 2, true, "ii", playerid, 3));
			}
			case 20:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_0"));
				SetPVarInt(playerid, "notification_timer_0", SetTimerEx("TIMER_NotificationMoveLeft_0", 1, true, "ii", playerid, 5));
			}
		}
	}
	return 1;
}

forward TIMER_NotificationAlpha_1(playerid);
public TIMER_NotificationAlpha_1(playerid)
{
	if (g_iNotificationCount_1{playerid} == 255)
	{
		g_iNotificationCount_1{playerid} = NOTIFICATION_BAR_START;
		
		KillTimer(GetPVarInt(playerid, "notification_timer_1"));
		SetPVarInt(playerid, "notification_timer_1", SetTimerEx("TIMER_NotificationMoveBar_1", 22, true, "i", playerid));
		return 1;
	}

	g_iNotificationCount_1{playerid} += 5;

	if (g_iNotificationCount_1{playerid} <= 100) PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg_1{playerid}, Color_SetAlpha(100, g_iNotificationCount_1{playerid}));
	if (g_iNotificationCount_1{playerid} <= 75) PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg2_1{playerid}, Color_SetAlpha(1296911691, g_iNotificationCount_1{playerid}));
	PlayerTextDrawColor(playerid, g_ptdNotificationText_1{playerid}, Color_SetAlpha(-741092353, g_iNotificationCount_1{playerid}));
	PlayerTextDrawBoxColor(playerid, g_ptdNotificationBar_1{playerid}, Color_SetAlpha(-1237960961, g_iNotificationCount_1{playerid}));

	PlayerTextDrawShow(playerid, g_ptdNotificationBg_1{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBg2_1{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationText_1{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBar_1{playerid});
	return 1;
}

forward TIMER_NotificationMoveBar_1(playerid);
public TIMER_NotificationMoveBar_1(playerid)
{
	if (g_iNotificationCount_1{playerid} <= NOTIFICATION_BAR_END)
	{
		g_iNotificationCount_1{playerid} = 0;

		PlayerTextDrawHide(playerid, g_ptdNotificationBar_1{playerid});

		KillTimer(GetPVarInt(playerid, "notification_timer_1"));
		SetPVarInt(playerid, "notification_timer_1", SetTimerEx("TIMER_NotificationMoveRight_1", 15, true, "i", playerid));
		return 1;
	}

	--g_iNotificationCount_1{playerid};

	PlayerTextDrawTextSize(playerid, g_ptdNotificationBar_1{playerid}, g_iNotificationCount_1{playerid}, 75.000000);
	PlayerTextDrawShow(playerid, g_ptdNotificationBar_1{playerid});
	return 1;
}

forward TIMER_NotificationMoveRight_1(playerid);
public TIMER_NotificationMoveRight_1(playerid)
{
	if (g_iNotificationCount_1{playerid} >= 25)
	{
		g_iNotificationCount_1{playerid} = 0;

		KillTimer(GetPVarInt(playerid, "notification_timer_1"));
		SetPVarInt(playerid, "notification_timer_1", SetTimerEx("TIMER_NotificationMoveLeft_1", 10, true, "ii", playerid, 3));
		return 1;
	}

	++g_iNotificationCount_1{playerid};

	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg_1{playerid}, (89.000000 + g_iNotificationCount_1{playerid}), g_iNotificationOffset_1[playerid]);
	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg2_1{playerid}, (89.000000 + g_iNotificationCount_1{playerid}), (g_iNotificationOffset_1[playerid] + 1.0));
	PlayerTextDrawSetPos(playerid, g_ptdNotificationText_1{playerid}, (11.000000 + g_iNotificationCount_1{playerid}), (g_iNotificationOffset_1[playerid] + 2.0));

	PlayerTextDrawShow(playerid, g_ptdNotificationBg_1{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBg2_1{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationText_1{playerid});

	if (g_iNotificationCount_1{playerid} <= 20)
	{
		switch (g_iNotificationCount_1{playerid})
		{
			case 5:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_1"));
				SetPVarInt(playerid, "notification_timer_1", SetTimerEx("TIMER_NotificationMoveRight_1", 10, true, "i", playerid));
			}
			case 10:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_1"));
				SetPVarInt(playerid, "notification_timer_1", SetTimerEx("TIMER_NotificationMoveRight_1", 8, true, "i", playerid));
			}
			case 15:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_1"));
				SetPVarInt(playerid, "notification_timer_1", SetTimerEx("TIMER_NotificationMoveRight_1", 5, true, "i", playerid));
			}
			case 20:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_1"));
				SetPVarInt(playerid, "notification_timer_1", SetTimerEx("TIMER_NotificationMoveRight_1", 30, true, "i", playerid));
			}
		}
	}
	return 1;
}

forward TIMER_NotificationMoveLeft_1(playerid, count);
public TIMER_NotificationMoveLeft_1(playerid, count)
{
	if (g_iNotificationCount_1{playerid} >= 180)
	{
		g_szNotificationText_1[playerid]{0} = '\0';

		PlayerTextDrawHide(playerid, g_ptdNotificationBg_1{playerid});
		PlayerTextDrawHide(playerid, g_ptdNotificationBg2_1{playerid});
		PlayerTextDrawHide(playerid, g_ptdNotificationText_1{playerid});

		KillTimer(GetPVarInt(playerid, "notification_timer_1"));
		_Notification_StartNewOne(playerid);
		return 1;
	}

	g_iNotificationCount_1{playerid} += count;

	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg_1{playerid}, ((89.000000 + 25.0) - g_iNotificationCount_1{playerid}), g_iNotificationOffset_1[playerid]);
	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg2_1{playerid}, ((89.000000 + 25.0) - g_iNotificationCount_1{playerid}), (g_iNotificationOffset_1[playerid] + 1.0));
	PlayerTextDrawSetPos(playerid, g_ptdNotificationText_1{playerid}, ((11.000000 + 25.0) - g_iNotificationCount_1{playerid}), (g_iNotificationOffset_1[playerid] + 2.0));

	PlayerTextDrawShow(playerid, g_ptdNotificationBg_1{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBg2_1{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationText_1{playerid});

	if (g_iNotificationCount_1{playerid} <= 20)
	{
		switch (g_iNotificationCount_1{playerid})
		{
			case 5:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_1"));
				SetPVarInt(playerid, "notification_timer_1", SetTimerEx("TIMER_NotificationMoveLeft_1", 7, true, "ii", playerid, 3));
			}
			case 10:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_1"));
				SetPVarInt(playerid, "notification_timer_1", SetTimerEx("TIMER_NotificationMoveLeft_1", 4, true, "ii", playerid, 3));
			}
			case 15:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_1"));
				SetPVarInt(playerid, "notification_timer_1", SetTimerEx("TIMER_NotificationMoveLeft_1", 2, true, "ii", playerid, 3));
			}
			case 20:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_1"));
				SetPVarInt(playerid, "notification_timer_1", SetTimerEx("TIMER_NotificationMoveLeft_1", 1, true, "ii", playerid, 5));
			}
		}
	}
	return 1;
}

forward TIMER_NotificationAlpha_2(playerid);
public TIMER_NotificationAlpha_2(playerid)
{
	if (g_iNotificationCount_2{playerid} == 255)
	{
		g_iNotificationCount_2{playerid} = NOTIFICATION_BAR_START;
		
		KillTimer(GetPVarInt(playerid, "notification_timer_2"));
		SetPVarInt(playerid, "notification_timer_2", SetTimerEx("TIMER_NotificationMoveBar_2", 22, true, "i", playerid));
		return 1;
	}

	g_iNotificationCount_2{playerid} += 5;

	if (g_iNotificationCount_2{playerid} <= 100) PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg_2{playerid}, Color_SetAlpha(100, g_iNotificationCount_2{playerid}));
	if (g_iNotificationCount_2{playerid} <= 75) PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg2_2{playerid}, Color_SetAlpha(1296911691, g_iNotificationCount_2{playerid}));
	PlayerTextDrawColor(playerid, g_ptdNotificationText_2{playerid}, Color_SetAlpha(-741092353, g_iNotificationCount_2{playerid}));
	PlayerTextDrawBoxColor(playerid, g_ptdNotificationBar_2{playerid}, Color_SetAlpha(-1237960961, g_iNotificationCount_2{playerid}));

	PlayerTextDrawShow(playerid, g_ptdNotificationBg_2{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBg2_2{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationText_2{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBar_2{playerid});
	return 1;
}

forward TIMER_NotificationMoveBar_2(playerid);
public TIMER_NotificationMoveBar_2(playerid)
{
	if (g_iNotificationCount_2{playerid} <= NOTIFICATION_BAR_END)
	{
		g_iNotificationCount_2{playerid} = 0;

		PlayerTextDrawHide(playerid, g_ptdNotificationBar_2{playerid});

		KillTimer(GetPVarInt(playerid, "notification_timer_2"));
		SetPVarInt(playerid, "notification_timer_2", SetTimerEx("TIMER_NotificationMoveRight_2", 15, true, "i", playerid));
		return 1;
	}

	--g_iNotificationCount_2{playerid};

	PlayerTextDrawTextSize(playerid, g_ptdNotificationBar_2{playerid}, g_iNotificationCount_2{playerid}, 75.000000);
	PlayerTextDrawShow(playerid, g_ptdNotificationBar_2{playerid});
	return 1;
}

forward TIMER_NotificationMoveRight_2(playerid);
public TIMER_NotificationMoveRight_2(playerid)
{
	if (g_iNotificationCount_2{playerid} >= 25)
	{
		g_iNotificationCount_2{playerid} = 0;

		KillTimer(GetPVarInt(playerid, "notification_timer_2"));
		SetPVarInt(playerid, "notification_timer_2", SetTimerEx("TIMER_NotificationMoveLeft_2", 10, true, "ii", playerid, 3));
		return 1;
	}

	++g_iNotificationCount_2{playerid};

	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg_2{playerid}, (89.000000 + g_iNotificationCount_2{playerid}), g_iNotificationOffset_2[playerid]);
	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg2_2{playerid}, (89.000000 + g_iNotificationCount_2{playerid}), (g_iNotificationOffset_2[playerid] + 1.0));
	PlayerTextDrawSetPos(playerid, g_ptdNotificationText_2{playerid}, (11.000000 + g_iNotificationCount_2{playerid}), (g_iNotificationOffset_2[playerid] + 2.0));

	PlayerTextDrawShow(playerid, g_ptdNotificationBg_2{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBg2_2{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationText_2{playerid});

	if (g_iNotificationCount_2{playerid} <= 20)
	{
		switch (g_iNotificationCount_2{playerid})
		{
			case 5:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_2"));
				SetPVarInt(playerid, "notification_timer_2", SetTimerEx("TIMER_NotificationMoveRight_2", 10, true, "i", playerid));
			}
			case 10:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_2"));
				SetPVarInt(playerid, "notification_timer_2", SetTimerEx("TIMER_NotificationMoveRight_2", 8, true, "i", playerid));
			}
			case 15:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_2"));
				SetPVarInt(playerid, "notification_timer_2", SetTimerEx("TIMER_NotificationMoveRight_2", 5, true, "i", playerid));
			}
			case 20:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_2"));
				SetPVarInt(playerid, "notification_timer_2", SetTimerEx("TIMER_NotificationMoveRight_2", 30, true, "i", playerid));
			}
		}
	}
	return 1;
}

forward TIMER_NotificationMoveLeft_2(playerid, count);
public TIMER_NotificationMoveLeft_2(playerid, count)
{
	if (g_iNotificationCount_2{playerid} >= 180)
	{
		g_szNotificationText_2[playerid]{0} = '\0';

		PlayerTextDrawHide(playerid, g_ptdNotificationBg_2{playerid});
		PlayerTextDrawHide(playerid, g_ptdNotificationBg2_2{playerid});
		PlayerTextDrawHide(playerid, g_ptdNotificationText_2{playerid});

		KillTimer(GetPVarInt(playerid, "notification_timer_2"));
		_Notification_StartNewOne(playerid);
		return 1;
	}

	g_iNotificationCount_2{playerid} += count;

	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg_2{playerid}, ((89.000000 + 25.0) - g_iNotificationCount_2{playerid}), g_iNotificationOffset_2[playerid]);
	PlayerTextDrawSetPos(playerid, g_ptdNotificationBg2_2{playerid}, ((89.000000 + 25.0) - g_iNotificationCount_2{playerid}), (g_iNotificationOffset_2[playerid] + 1.0));
	PlayerTextDrawSetPos(playerid, g_ptdNotificationText_2{playerid}, ((11.000000 + 25.0) - g_iNotificationCount_2{playerid}), (g_iNotificationOffset_2[playerid] + 2.0));

	PlayerTextDrawShow(playerid, g_ptdNotificationBg_2{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationBg2_2{playerid});
	PlayerTextDrawShow(playerid, g_ptdNotificationText_2{playerid});

	if (g_iNotificationCount_2{playerid} <= 20)
	{
		switch (g_iNotificationCount_2{playerid})
		{
			case 5:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_2"));
				SetPVarInt(playerid, "notification_timer_2", SetTimerEx("TIMER_NotificationMoveLeft_2", 7, true, "ii", playerid, 3));
			}
			case 10:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_2"));
				SetPVarInt(playerid, "notification_timer_2", SetTimerEx("TIMER_NotificationMoveLeft_2", 4, true, "ii", playerid, 3));
			}
			case 15:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_2"));
				SetPVarInt(playerid, "notification_timer_2", SetTimerEx("TIMER_NotificationMoveLeft_2", 2, true, "ii", playerid, 3));
			}
			case 20:
			{
				KillTimer(GetPVarInt(playerid, "notification_timer_2"));
				SetPVarInt(playerid, "notification_timer_2", SetTimerEx("TIMER_NotificationMoveLeft_2", 1, true, "ii", playerid, 5));
			}
		}
	}
	return 1;
}