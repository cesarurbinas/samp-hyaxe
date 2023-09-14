#if defined DAMAGE_FUNCTIONS
	#endinput
#endif

#define DAMAGE_FUNCTIONS

Player_SetHealth(playerid, amount)
{
	if (!IsPlayerConnected(playerid))
		return 0;

	g_iPlayerHealth[playerid] = amount;
	SetPlayerHealth(playerid, amount);
	return 1;
}

Player_SetArmour(playerid, amount)
{
	if (!IsPlayerConnected(playerid))
		return 0;
		
	g_iPlayerArmour[playerid] = amount;
	SetPlayerArmour(playerid, amount);
	return 1;
}

Damage_Send(to, from, Float:amount, weaponid)
{
	if (g_rgbitsPlayerFlags[to] & e_bmPlayerDead || (IsPlayerConnected(from) && g_rgbitsPlayerFlags[from] & e_bmPlayerDead))
		return 0;
	
	if (GetTickCount() < g_iLastDamageTick[to])
		return 0;

	new armour, damage = floatround(amount);

	if ((armour = g_iPlayerArmour[to]) >= 1)
	{
		if ((g_iPlayerArmour[to] - damage) <= 0)
		{
			Player_SetArmour(to, 0);
			Damage_Send(to, from, -(armour - amount), weaponid);
		}
		else
		{
			Player_SetArmour(to, g_iPlayerArmour[to] - damage);
		}
	}
	else
	{
		if ((g_iPlayerHealth[to] - damage) <= 0)
		{
			// OnPlayerDeath(to, from, weaponid);

			if (CHARACTER_INFO[to][ch_STATE] != ROLEPLAY_STATE_CRACK)
			{
				CHARACTER_INFO[to][ch_STATE] = ROLEPLAY_STATE_CRACK;

				ApplyAnimation(to, "PED", "CAR_CRAWLOUTRHS", 4.1, false, true, true, false, 0, false);

				SetPlayerHud(to);
				SetCameraBehindPlayer(to);
				TogglePlayerControllableEx(to, false);
				KillTimer(PLAYER_TEMP[to][py_TIMERS][3]);
				PLAYER_TEMP[to][py_TIMERS][3] = SetTimerEx("TogglePlayerControl", 2000, false, "ib", to, true);

				KillTimer(PLAYER_TEMP[to][py_TIMERS][16]);
				PLAYER_TEMP[to][py_TIMERS][16] = SetTimerEx("HealthDown", 3000, false, "i", to);

				PLAYER_TEMP[to][py_INJURED_POS][0] = CHARACTER_INFO[to][ch_POS][0];
				PLAYER_TEMP[to][py_INJURED_POS][1] = CHARACTER_INFO[to][ch_POS][1];
				PLAYER_TEMP[to][py_INJURED_POS][2] = CHARACTER_INFO[to][ch_POS][2];
				PLAYER_TEMP[to][py_INJURED_POS][3] = CHARACTER_INFO[to][ch_ANGLE];

				TogglePlayerControllableEx(to, false);
				SetPlayerColorEx(to, PLAYER_COLOR);

				Player_SetHealth(to, 50);
			}
			else
			{
				OnPlayerDeath(to, from, weaponid);
				g_rgbitsPlayerFlags[to] |= e_bmPlayerDead;

				Player_SetHealth(to, 0);
			}
		}
		else
		{
			Player_SetHealth(to, g_iPlayerHealth[to] - damage);
		}
	}

	g_iLastDamageTick[to] = GetTickCount() + 100;
	return 1;
}

Damage_ResetInformer(playerid)
{
	KillTimer(GetPVarInt(playerid, "damage_inf_timer"));

	g_sDamageGivenText[playerid][0] =
	g_sDamageTakenText[playerid][0] = '\0';

	g_iDamageTaken[playerid] = g_iDamageTaken[MAX_PLAYERS];
	g_iDamageGiven[playerid] = g_iDamageGiven[MAX_PLAYERS];

	PlayerTextDrawHide(playerid, g_ptdDamageGiven[playerid]);
	PlayerTextDrawHide(playerid, g_ptdDamageTaken[playerid]);
	return 1;
}