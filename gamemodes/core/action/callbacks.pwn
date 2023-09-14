public OnPlayerConnect(playerid)
{
	g_PlayerActionsData[playerid][tda_action_timer] = 0;

	#if defined Action_OnPlayerConnect
		return Action_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#define OnPlayerConnect Action_OnPlayerConnect
#if defined Action_OnPlayerConnect
	forward Action_OnPlayerConnect(playerid);
#endif

public OnPlayerDisconnect(playerid, reason)
{
	if (g_PlayerActionsData[playerid][tda_action_timer] != 0)
	{
		HideActionForPlayer(playerid);
	}

	#if defined Action_OnPlayerDisconnect
		return Action_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect Action_OnPlayerDisconnect
#if defined Action_OnPlayerDisconnect
	forward Action_OnPlayerDisconnect(playerid, reason);
#endif

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (g_PlayerActionsData[playerid][tda_action_timer] != 0)
	{
		if (newkeys & KEY_YES)
		{
			CallLocalFunction(g_PlayerActionsData[playerid][tda_action_name], "dd", playerid, ACTION_RESPONSE_YES);

			HideActionForPlayer(playerid);

			return 1;
		}
		if (newkeys & KEY_NO)
		{
			CallLocalFunction(g_PlayerActionsData[playerid][tda_action_name], "dd", playerid, ACTION_RESPONSE_NO);

			HideActionForPlayer(playerid);

			return 1;
		}
	}

	#if defined Action_OnPlayerKeyStateChange
		return Action_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerKeyStateChange
	#undef OnPlayerKeyStateChange
#else
	#define _ALS_OnPlayerKeyStateChange
#endif

#define OnPlayerKeyStateChange Action_OnPlayerKeyStateChange
#if defined Action_OnPlayerKeyStateChange
	forward Action_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
#endif

forward OnPlayerUpdateAction(playerid);
public OnPlayerUpdateAction(playerid)
{
	if (g_PlayerActionsData[playerid][tda_action_timer] != 0)
	{
		g_PlayerActionsData[playerid][tda_action_percent] += (100.0 / (float(g_PlayerActionsData[playerid][tda_action_ms]) / float(ACTION_TIMER_UPDATE_RATE)));

		PlayerTextDrawTextSize(playerid, g_PlayerActionsTD[playerid][6], 393.400024 - ((149.700104 / 100.0) * g_PlayerActionsData[playerid][tda_action_percent]), 0.000000);
		PlayerTextDrawShow(playerid, g_PlayerActionsTD[playerid][6]);

		if (g_PlayerActionsData[playerid][tda_action_percent] >= 100.0)
		{
			CallLocalFunction(g_PlayerActionsData[playerid][tda_action_name], "dd", playerid, ACTION_RESPONSE_NO_CHOOSE);

			HideActionForPlayer(playerid);
		}
	}
}