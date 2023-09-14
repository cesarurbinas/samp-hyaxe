#if defined CORE_NOTIFICATIONS_CALLBACKS
	#endinput
#endif

#define CORE_NOTIFICATIONS_CALLBACKS

public OnPlayerConnect(playerid)
{
	g_ptdNotificationBg_0{playerid} = CreatePlayerTextDraw(playerid, 89.000000, 312.000000, "_");
	PlayerTextDrawLetterSize(playerid, g_ptdNotificationBg_0{playerid}, 0.600000, 2.500004);
	PlayerTextDrawTextSize(playerid, g_ptdNotificationBg_0{playerid}, 298.500000, 162.500000);
	PlayerTextDrawAlignment(playerid, g_ptdNotificationBg_0{playerid}, 2);
	PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg_0{playerid}, 0x00000000);
	PlayerTextDrawUseBox(playerid, g_ptdNotificationBg_0{playerid}, 1);

	g_ptdNotificationBg_1{playerid} = CreatePlayerTextDraw(playerid, 89.000000, 312.000000, "_");
	PlayerTextDrawLetterSize(playerid, g_ptdNotificationBg_1{playerid}, 0.600000, 2.500004);
	PlayerTextDrawTextSize(playerid, g_ptdNotificationBg_1{playerid}, 298.500000, 162.500000);
	PlayerTextDrawAlignment(playerid, g_ptdNotificationBg_1{playerid}, 2);
	PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg_1{playerid}, 0x00000000);
	PlayerTextDrawUseBox(playerid, g_ptdNotificationBg_1{playerid}, 1);

	g_ptdNotificationBg_2{playerid} = CreatePlayerTextDraw(playerid, 89.000000, 312.000000, "_");
	PlayerTextDrawLetterSize(playerid, g_ptdNotificationBg_2{playerid}, 0.600000, 2.500004);
	PlayerTextDrawTextSize(playerid, g_ptdNotificationBg_2{playerid}, 298.500000, 162.500000);
	PlayerTextDrawAlignment(playerid, g_ptdNotificationBg_2{playerid}, 2);
	PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg_2{playerid}, 0x00000000);
	PlayerTextDrawUseBox(playerid, g_ptdNotificationBg_2{playerid}, 1);

	g_ptdNotificationBg2_0{playerid} = CreatePlayerTextDraw(playerid, 89.000000, 313.000000, "_");
	PlayerTextDrawLetterSize(playerid, g_ptdNotificationBg2_0{playerid}, 0.600000, 2.250005);
	PlayerTextDrawTextSize(playerid, g_ptdNotificationBg2_0{playerid}, 298.500000, 160.000000);
	PlayerTextDrawAlignment(playerid, g_ptdNotificationBg2_0{playerid}, 2);
	PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg2_0{playerid}, 0x4D4D4D00);
	PlayerTextDrawUseBox(playerid, g_ptdNotificationBg2_0{playerid}, 1);

	g_ptdNotificationBg2_1{playerid} = CreatePlayerTextDraw(playerid, 89.000000, 313.000000, "_");
	PlayerTextDrawLetterSize(playerid, g_ptdNotificationBg2_1{playerid}, 0.600000, 2.250005);
	PlayerTextDrawTextSize(playerid, g_ptdNotificationBg2_1{playerid}, 298.500000, 160.000000);
	PlayerTextDrawAlignment(playerid, g_ptdNotificationBg2_1{playerid}, 2);
	PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg2_1{playerid}, 0x4D4D4D00);
	PlayerTextDrawUseBox(playerid, g_ptdNotificationBg2_1{playerid}, 1);

	g_ptdNotificationBg2_2{playerid} = CreatePlayerTextDraw(playerid, 89.000000, 313.000000, "_");
	PlayerTextDrawLetterSize(playerid, g_ptdNotificationBg2_2{playerid}, 0.600000, 2.250005);
	PlayerTextDrawTextSize(playerid, g_ptdNotificationBg2_2{playerid}, 298.500000, 160.000000);
	PlayerTextDrawAlignment(playerid, g_ptdNotificationBg2_2{playerid}, 2);
	PlayerTextDrawBoxColor(playerid, g_ptdNotificationBg2_2{playerid}, 0x4D4D4D00);
	PlayerTextDrawUseBox(playerid, g_ptdNotificationBg2_2{playerid}, 1);

	g_ptdNotificationText_0{playerid} = CreatePlayerTextDraw(playerid, 11.000000, 316.000000, "_");
	PlayerTextDrawFont(playerid, g_ptdNotificationText_0{playerid}, 1);
	PlayerTextDrawLetterSize(playerid, g_ptdNotificationText_0{playerid}, 0.212498, 1.049998);
	PlayerTextDrawTextSize(playerid, g_ptdNotificationText_0{playerid}, 400.000000, 17.000000);
	PlayerTextDrawSetShadow(playerid, g_ptdNotificationText_0{playerid}, 0);
	PlayerTextDrawColor(playerid, g_ptdNotificationText_0{playerid}, 0xD3D3D300);

	g_ptdNotificationText_1{playerid} = CreatePlayerTextDraw(playerid, 11.000000, 316.000000, "_");
	PlayerTextDrawFont(playerid, g_ptdNotificationText_1{playerid}, 1);
	PlayerTextDrawLetterSize(playerid, g_ptdNotificationText_1{playerid}, 0.212498, 1.049998);
	PlayerTextDrawTextSize(playerid, g_ptdNotificationText_1{playerid}, 400.000000, 17.000000);
	PlayerTextDrawSetShadow(playerid, g_ptdNotificationText_1{playerid}, 0);
	PlayerTextDrawColor(playerid, g_ptdNotificationText_1{playerid}, 0xD3D3D300);

	g_ptdNotificationText_2{playerid} = CreatePlayerTextDraw(playerid, 11.000000, 316.000000, "_");
	PlayerTextDrawFont(playerid, g_ptdNotificationText_2{playerid}, 1);
	PlayerTextDrawLetterSize(playerid, g_ptdNotificationText_2{playerid}, 0.212498, 1.049998);
	PlayerTextDrawTextSize(playerid, g_ptdNotificationText_2{playerid}, 400.000000, 17.000000);
	PlayerTextDrawSetShadow(playerid, g_ptdNotificationText_2{playerid}, 0);
	PlayerTextDrawColor(playerid, g_ptdNotificationText_2{playerid}, 0xD3D3D300);

	g_ptdNotificationBar_0{playerid} = CreatePlayerTextDraw(playerid, 12.000000, 334.000000, "_");
	PlayerTextDrawLetterSize(playerid, g_ptdNotificationBar_0{playerid}, 0.845832, -0.349997);
	PlayerTextDrawTextSize(playerid, g_ptdNotificationBar_0{playerid}, NOTIFICATION_BAR_START, 75.000000);
	PlayerTextDrawBoxColor(playerid, g_ptdNotificationBar_0{playerid}, 0xB6363600);
	PlayerTextDrawUseBox(playerid, g_ptdNotificationBar_0{playerid}, 1);

	g_ptdNotificationBar_1{playerid} = CreatePlayerTextDraw(playerid, 12.000000, 334.000000, "_");
	PlayerTextDrawLetterSize(playerid, g_ptdNotificationBar_1{playerid}, 0.845832, -0.349997);
	PlayerTextDrawTextSize(playerid, g_ptdNotificationBar_1{playerid}, NOTIFICATION_BAR_START, 75.000000);
	PlayerTextDrawBoxColor(playerid, g_ptdNotificationBar_1{playerid}, 0xB6363600);
	PlayerTextDrawUseBox(playerid, g_ptdNotificationBar_1{playerid}, 1);

	g_ptdNotificationBar_2{playerid} = CreatePlayerTextDraw(playerid, 12.000000, 334.000000, "_");
	PlayerTextDrawLetterSize(playerid, g_ptdNotificationBar_2{playerid}, 0.845832, -0.349997);
	PlayerTextDrawTextSize(playerid, g_ptdNotificationBar_2{playerid}, NOTIFICATION_BAR_START, 75.000000);
	PlayerTextDrawBoxColor(playerid, g_ptdNotificationBar_2{playerid}, 0xB6363600);
	PlayerTextDrawUseBox(playerid, g_ptdNotificationBar_2{playerid}, 1);

	#if defined Notifications_OnPlayerConnect
		return Notifications_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}

public OnPlayerDisconnect(playerid, reason)
{
	KillTimer(GetPVarInt(playerid, "notification_timer_0"));
	KillTimer(GetPVarInt(playerid, "notification_timer_1"));
	KillTimer(GetPVarInt(playerid, "notification_timer_2"));

	#if defined Notifications_OPDisconnect
		return Notifications_OPDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}

#if defined Notifications_OPDisconnect
	forward Notifications_OPDisconnect(playerid, reason);
#endif

#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect Notifications_OPDisconnect

#if defined Notifications_OnPlayerConnect
	forward Notifications_OnPlayerConnect(playerid);
#endif

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#define OnPlayerConnect Notifications_OnPlayerConnect