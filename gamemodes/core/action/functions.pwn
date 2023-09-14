#define ShowActionForPlayer(%0,%1, Internal_ShowActionForPlayer(%0,#%1,

stock Internal_ShowActionForPlayer(playerid, tda_callback[], tda_description[], tda_title[] = "AVISO", action_time = 10000)
{
	if (g_PlayerActionsData[playerid][tda_action_timer] != 0)
	{
		HideActionForPlayer(playerid);
	}

	format(g_PlayerActionsData[playerid][tda_action_name], 32, "TDA_%s", tda_callback);

	g_PlayerActionsData[playerid][tda_action_percent] = 0.0;
	g_PlayerActionsData[playerid][tda_action_ms] = action_time;
	g_PlayerActionsData[playerid][tda_action_timer] = SetTimerEx("OnPlayerUpdateAction", ACTION_TIMER_UPDATE_RATE, true, "d", playerid);

	g_PlayerActionsTD[playerid][0] = CreatePlayerTextDraw(playerid, 245.000000, 208.000000, "bg");
	PlayerTextDrawBackgroundColor(playerid, g_PlayerActionsTD[playerid][0], 0);
	PlayerTextDrawFont(playerid, g_PlayerActionsTD[playerid][0], 1);
	PlayerTextDrawLetterSize(playerid, g_PlayerActionsTD[playerid][0], 0.500000, 7.320001);
	PlayerTextDrawColor(playerid, g_PlayerActionsTD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, g_PlayerActionsTD[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, g_PlayerActionsTD[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, g_PlayerActionsTD[playerid][0], 1);
	PlayerTextDrawUseBox(playerid, g_PlayerActionsTD[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, g_PlayerActionsTD[playerid][0], 168430280);
	PlayerTextDrawTextSize(playerid, g_PlayerActionsTD[playerid][0], 396.000000, 0.000000);
	PlayerTextDrawShow(playerid, g_PlayerActionsTD[playerid][0]);

	g_PlayerActionsTD[playerid][1] = CreatePlayerTextDraw(playerid, 252.000000, 211.000000, tda_title);
	PlayerTextDrawBackgroundColor(playerid, g_PlayerActionsTD[playerid][1], 0);
	PlayerTextDrawFont(playerid, g_PlayerActionsTD[playerid][1], 1);
	PlayerTextDrawLetterSize(playerid, g_PlayerActionsTD[playerid][1], 0.180000, 0.899999);
	PlayerTextDrawColor(playerid, g_PlayerActionsTD[playerid][1], -1);
	PlayerTextDrawSetOutline(playerid, g_PlayerActionsTD[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, g_PlayerActionsTD[playerid][1], 1);
	PlayerTextDrawShow(playerid, g_PlayerActionsTD[playerid][1]);

	g_PlayerActionsTD[playerid][2] = CreatePlayerTextDraw(playerid, 254.000000, 218.000000, "i");
	PlayerTextDrawBackgroundColor(playerid, g_PlayerActionsTD[playerid][2], 0);
	PlayerTextDrawFont(playerid, g_PlayerActionsTD[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, g_PlayerActionsTD[playerid][2], 0.166999, 1.780000);
	PlayerTextDrawColor(playerid, g_PlayerActionsTD[playerid][2], -156);
	PlayerTextDrawSetOutline(playerid, g_PlayerActionsTD[playerid][2], 0);
	PlayerTextDrawSetProportional(playerid, g_PlayerActionsTD[playerid][2], 1);
	PlayerTextDrawSetShadow(playerid, g_PlayerActionsTD[playerid][2], 1);
	PlayerTextDrawShow(playerid, g_PlayerActionsTD[playerid][2]);

	g_PlayerActionsTD[playerid][3] = CreatePlayerTextDraw(playerid, 258.699981, 222.100006, tda_description);
	PlayerTextDrawBackgroundColor(playerid, g_PlayerActionsTD[playerid][3], 0);
	PlayerTextDrawFont(playerid, g_PlayerActionsTD[playerid][3], 1);
	PlayerTextDrawLetterSize(playerid, g_PlayerActionsTD[playerid][3], 0.165999, 0.960000);
	PlayerTextDrawColor(playerid, g_PlayerActionsTD[playerid][3], -106);
	PlayerTextDrawSetOutline(playerid, g_PlayerActionsTD[playerid][3], 0);
	PlayerTextDrawSetProportional(playerid, g_PlayerActionsTD[playerid][3], 1);
	PlayerTextDrawSetShadow(playerid, g_PlayerActionsTD[playerid][3], 1);
	PlayerTextDrawUseBox(playerid, g_PlayerActionsTD[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, g_PlayerActionsTD[playerid][3], 0);
	PlayerTextDrawTextSize(playerid, g_PlayerActionsTD[playerid][3], 387.000000, 0.000000);
	PlayerTextDrawShow(playerid, g_PlayerActionsTD[playerid][3]);

	g_PlayerActionsTD[playerid][4] = CreatePlayerTextDraw(playerid, 287.000000, 251.000000, "Y");
	PlayerTextDrawAlignment(playerid, g_PlayerActionsTD[playerid][4], 2);
	PlayerTextDrawBackgroundColor(playerid, g_PlayerActionsTD[playerid][4], 0);
	PlayerTextDrawFont(playerid, g_PlayerActionsTD[playerid][4], 1);
	PlayerTextDrawLetterSize(playerid, g_PlayerActionsTD[playerid][4], 0.236000, 1.099999);
	PlayerTextDrawColor(playerid, g_PlayerActionsTD[playerid][4], -1);
	PlayerTextDrawSetOutline(playerid, g_PlayerActionsTD[playerid][4], 0);
	PlayerTextDrawSetProportional(playerid, g_PlayerActionsTD[playerid][4], 1);
	PlayerTextDrawSetShadow(playerid, g_PlayerActionsTD[playerid][4], 1);
	PlayerTextDrawUseBox(playerid, g_PlayerActionsTD[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, g_PlayerActionsTD[playerid][4], 434182655);
	PlayerTextDrawTextSize(playerid, g_PlayerActionsTD[playerid][4], 307.399902, 40.000000);
	PlayerTextDrawShow(playerid, g_PlayerActionsTD[playerid][4]);

	g_PlayerActionsTD[playerid][5] = CreatePlayerTextDraw(playerid, 352.899993, 251.000000, "N");
	PlayerTextDrawAlignment(playerid, g_PlayerActionsTD[playerid][5], 2);
	PlayerTextDrawBackgroundColor(playerid, g_PlayerActionsTD[playerid][5], 0);
	PlayerTextDrawFont(playerid, g_PlayerActionsTD[playerid][5], 1);
	PlayerTextDrawLetterSize(playerid, g_PlayerActionsTD[playerid][5], 0.190000, 1.099999);
	PlayerTextDrawColor(playerid, g_PlayerActionsTD[playerid][5], -1);
	PlayerTextDrawSetOutline(playerid, g_PlayerActionsTD[playerid][5], 0);
	PlayerTextDrawSetProportional(playerid, g_PlayerActionsTD[playerid][5], 1);
	PlayerTextDrawSetShadow(playerid, g_PlayerActionsTD[playerid][5], 1);
	PlayerTextDrawUseBox(playerid, g_PlayerActionsTD[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, g_PlayerActionsTD[playerid][5], -11842561);
	PlayerTextDrawTextSize(playerid, g_PlayerActionsTD[playerid][5], 374.000000, 40.000000);
	PlayerTextDrawShow(playerid, g_PlayerActionsTD[playerid][5]);

	g_PlayerActionsTD[playerid][6] = CreatePlayerTextDraw(playerid, 245.699920, 274.699981, "progress");
	PlayerTextDrawBackgroundColor(playerid, g_PlayerActionsTD[playerid][6], 0);
	PlayerTextDrawFont(playerid, g_PlayerActionsTD[playerid][6], 1);
	PlayerTextDrawLetterSize(playerid, g_PlayerActionsTD[playerid][6], 0.480000, -0.170000);
	PlayerTextDrawColor(playerid, g_PlayerActionsTD[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, g_PlayerActionsTD[playerid][6], 0);
	PlayerTextDrawSetProportional(playerid, g_PlayerActionsTD[playerid][6], 1);
	PlayerTextDrawSetShadow(playerid, g_PlayerActionsTD[playerid][6], 1);
	PlayerTextDrawUseBox(playerid, g_PlayerActionsTD[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, g_PlayerActionsTD[playerid][6], -7929601);
	PlayerTextDrawTextSize(playerid, g_PlayerActionsTD[playerid][6], 395.400024, 0.000000);
	PlayerTextDrawShow(playerid, g_PlayerActionsTD[playerid][6]);

	#if ACTION_SOUND_MENU != 0
		PlayerPlaySound(playerid, ACTION_SOUND_MENU, 0.0, 0.0, 0.0);
	#endif

	#if ACTION_FREEZE_PLAYER == 1
		TogglePlayerControllable(playerid, 0);
	#endif
}

stock HideActionForPlayer(playerid)
{
	if (g_PlayerActionsData[playerid][tda_action_timer] != 0)
	{
		KillTimer(g_PlayerActionsData[playerid][tda_action_timer]);

		g_PlayerActionsData[playerid][tda_action_timer] = 0;

		for (new i = 0; i < sizeof g_PlayerActionsTD[]; ++i)
		{
			PlayerTextDrawDestroy(playerid, g_PlayerActionsTD[playerid][i]);
		}
		#if ACTION_FREEZE_PLAYER == 1
			TogglePlayerControllable(playerid, 1);
		#endif
	}
}
