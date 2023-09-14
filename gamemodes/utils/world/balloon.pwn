SetBalloonAction(balloon_id, Float:x, Float:y, Float:z, Float:speed)
{
	HOTAIR_BALLOONS[balloon_id][balloon_ACTIVE] = true;
	StopDynamicObject(HOTAIR_BALLOONS[balloon_id][balloon_OBJECT_ID]);
	MoveDynamicObject(HOTAIR_BALLOONS[balloon_id][balloon_OBJECT_ID], x, y, z, speed, 0.0, 0.0, 10.0);
	return 1;
}

BackBalloonToStart(balloon_id, Float:speed)
{
	HOTAIR_BALLOONS[balloon_id][balloon_ACTIVE] = false;
	StopDynamicObject(HOTAIR_BALLOONS[balloon_id][balloon_OBJECT_ID]);
	MoveDynamicObject(HOTAIR_BALLOONS[balloon_id][balloon_OBJECT_ID], HOTAIR_BALLOONS[balloon_id][balloon_X], HOTAIR_BALLOONS[balloon_id][balloon_Y], HOTAIR_BALLOONS[balloon_id][balloon_Z], speed, 0.0, 0.0, HOTAIR_BALLOONS[balloon_id][balloon_RZ]);
	return 1;
}

forward RestartBalloon(balloon_id);
public RestartBalloon(balloon_id)
{
	#if DEBUG_MODE == 1
		printf("RestartBalloon"); // debug juju
	#endif

	BackBalloonToStart(balloon_id, 10.0);
	return 1;
}

forward UpBalloon(balloon_id);
public UpBalloon(balloon_id)
{
	#if DEBUG_MODE == 1
		printf("UpBalloon"); // debug juju
	#endif

	SetBalloonAction(balloon_id, float(minrand(200, 300)), -float(minrand(1700, 1950)), 90.0, 10.0);
	return 1;
}

CheckBallonAction(playerid)
{
	// Buy
	if (IsPlayerInRangeOfPoint(playerid, 1.0, -370.339721, -1634.205932, 25.057666))
	{
		if (PLAYER_MISC[playerid][MISC_BALLOON]) return ShowPlayerMessage(playerid, "~r~Ya tienes un boleto", 2);
		if (CHARACTER_INFO[playerid][ch_CASH] <= 200) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente", 2, 1150);
     	
     	PLAYER_MISC[playerid][MISC_BALLOON] = true;
     	ShowPlayerNotification(playerid, "Sube a un globo y presiona la tecla Y para comenzar el viaje.", 4);
     	GivePlayerCash(playerid, -200);
		return 1;
	}

	// Start
	if (PLAYER_MISC[playerid][MISC_BALLOON])
	{
		for(new i = 0; i != sizeof HOTAIR_BALLOONS; i ++)
		{
			if (IsPlayerInRangeOfPoint(playerid, 1.5, HOTAIR_BALLOONS[i][balloon_X], HOTAIR_BALLOONS[i][balloon_Y], HOTAIR_BALLOONS[i][balloon_Z]))
			{
				if (HOTAIR_BALLOONS[i][balloon_ACTIVE] == false)
				{
					PLAYER_MISC[playerid][MISC_BALLOON] = false;
					SetBalloonAction(i, HOTAIR_BALLOONS[i][balloon_X], HOTAIR_BALLOONS[i][balloon_Y], 60.0, 10.0);
					SetTimerEx("UpBalloon", 4000, false, "i", i);
					SetTimerEx("RestartBalloon", 60000, false, "i", i);
					ShowPlayerNotification(playerid, "¡Trata de no saltar o moverte demasiado porque te puedes caer!", 3);
					return 1;
				}
			}
		}
	}
	return 1;
}