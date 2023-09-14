#if defined CORE_NOTIFICATIONS_CALLBACKS
	#endinput
#endif

#define CORE_NOTIFICATIONS_CALLBACKS

public OnPlayerConnect(playerid)
{
	g_ptdNotification{playerid} = CreatePlayerTextDraw(playerid, 24.000000, 139.000000, "_");
	PlayerTextDrawFont(playerid, g_ptdNotification{playerid}, 1);
	PlayerTextDrawLetterSize(playerid, g_ptdNotification{playerid}, 0.341666, 1.750000);
	PlayerTextDrawTextSize(playerid, g_ptdNotification{playerid}, 187.000000, 17.000000);
	PlayerTextDrawSetOutline(playerid, g_ptdNotification{playerid}, 0);
	PlayerTextDrawSetShadow(playerid, g_ptdNotification{playerid}, 0);
	PlayerTextDrawAlignment(playerid, g_ptdNotification{playerid}, 1);
	PlayerTextDrawColor(playerid, g_ptdNotification{playerid}, -741092353);
	PlayerTextDrawBackgroundColor(playerid, g_ptdNotification{playerid}, 255);
	PlayerTextDrawBoxColor(playerid, g_ptdNotification{playerid}, 195);
	PlayerTextDrawUseBox(playerid, g_ptdNotification{playerid}, 1);
	PlayerTextDrawSetProportional(playerid, g_ptdNotification{playerid}, 1);
	PlayerTextDrawSetSelectable(playerid, g_ptdNotification{playerid}, 0);

	#if defined Notifications_OnPlayerConnect
		return Notifications_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}

public OnPlayerDisconnect(playerid, reason)
{
	g_ActiveNotification[playerid] = false;

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