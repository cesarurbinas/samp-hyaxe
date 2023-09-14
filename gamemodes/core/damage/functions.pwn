#if defined DAMAGE_FUNCTIONS
	#endinput
#endif

#define DAMAGE_FUNCTIONS

Player_SetHealth(playerid, amount)
{
	if (!IsPlayerConnected(playerid))
		return 0;

	g_iPlayerHealth[playerid] = amount;
	CHARACTER_INFO[playerid][ch_HEALTH] = amount;
	SetPlayerHealth(playerid, amount);
	return 1;
}

Player_SetArmour(playerid, amount)
{
	if (!IsPlayerConnected(playerid))
		return 0;
		
	g_iPlayerArmour[playerid] = amount;
	CHARACTER_INFO[playerid][ch_ARMOUR] = amount;
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
			OnPlayerDeath(to, from, weaponid);
			g_rgbitsPlayerFlags[to] |= e_bmPlayerDead;

			Player_SetHealth(to, 0);
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