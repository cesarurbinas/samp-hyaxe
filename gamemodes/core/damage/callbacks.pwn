#if defined DAMAGE_CALLBACKS
	#endinput
#endif

#define DAMAGE_CALLBACKS

public OnPlayerConnect(playerid)
{
	g_rgbitsPlayerFlags[playerid] = 0b00000000;

	g_ptdDamageGiven[playerid] = CreatePlayerTextDraw(playerid, 146.000000, 355.000000, "Kai_Vinter_~g~~h~~h~~h~+24 (120 hp)~n~~g~~h~~h~~h~(Escopeta de combate - Torso)");
	PlayerTextDrawFont(playerid, g_ptdDamageGiven[playerid], 1);
	PlayerTextDrawLetterSize(playerid, g_ptdDamageGiven[playerid], 0.187500, 1.000000);
	PlayerTextDrawTextSize(playerid, g_ptdDamageGiven[playerid], 422.500000, 72.000000);
	PlayerTextDrawSetOutline(playerid, g_ptdDamageGiven[playerid], 0);
	PlayerTextDrawSetShadow(playerid, g_ptdDamageGiven[playerid], 1);
	PlayerTextDrawAlignment(playerid, g_ptdDamageGiven[playerid], 1);
	PlayerTextDrawColor(playerid, g_ptdDamageGiven[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, g_ptdDamageGiven[playerid], 135);
	PlayerTextDrawBoxColor(playerid, g_ptdDamageGiven[playerid], 50);
	PlayerTextDrawUseBox(playerid, g_ptdDamageGiven[playerid], 0);
	PlayerTextDrawSetProportional(playerid, g_ptdDamageGiven[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, g_ptdDamageGiven[playerid], 0);

	g_ptdDamageTaken[playerid] = CreatePlayerTextDraw(playerid, 486.000000, 355.000000, "Kai_Vinter_~r~~h~~h~~h~-24 (154 hp)~n~~r~~h~~h~~h~(Escopeta de combate - Cabeza)");
	PlayerTextDrawFont(playerid, g_ptdDamageTaken[playerid], 1);
	PlayerTextDrawLetterSize(playerid, g_ptdDamageTaken[playerid], 0.187500, 1.000000);
	PlayerTextDrawTextSize(playerid, g_ptdDamageTaken[playerid], 422.500000, 72.000000);
	PlayerTextDrawSetOutline(playerid, g_ptdDamageTaken[playerid], 0);
	PlayerTextDrawSetShadow(playerid, g_ptdDamageTaken[playerid], 1);
	PlayerTextDrawAlignment(playerid, g_ptdDamageTaken[playerid], 3);
	PlayerTextDrawColor(playerid, g_ptdDamageTaken[playerid], -1);
	PlayerTextDrawBackgroundColor(playerid, g_ptdDamageTaken[playerid], 135);
	PlayerTextDrawBoxColor(playerid, g_ptdDamageTaken[playerid], 50);
	PlayerTextDrawUseBox(playerid, g_ptdDamageTaken[playerid], 0);
	PlayerTextDrawSetProportional(playerid, g_ptdDamageTaken[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, g_ptdDamageTaken[playerid], 0);

	Damage_ResetInformer(playerid);

	g_iLastDamageTick[playerid] = g_iLastDamageTick[MAX_PLAYERS];
	
	Player_SetTeam(playerid, NO_TEAM);

	Player_SetHealth(playerid, 100);
	Player_SetArmour(playerid, 0);
	
	#if defined Damage_OnPlayerConnect
		return Damage_OnPlayerConnect(playerid);
	#else
		return 1;
	#endif
}

public OnPlayerDisconnect(playerid, reason)
{
	KillTimer(GetPVarInt(playerid, "damage_inf_timer"));

	PlayerTextDrawDestroy(playerid, g_ptdDamageGiven[playerid]);
	PlayerTextDrawDestroy(playerid, g_ptdDamageTaken[playerid]);

	#if defined Damage_OnPlayerDisconnect
		return Damage_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}

public OnPlayerSpawn(playerid)
{
	SetPlayerTeam(playerid, DEFAULT_TEAM);

	g_rgbitsPlayerFlags[playerid] &= ~e_bmPlayerDead;
	
	Player_SetHealth(playerid, 100);
	Player_SetArmour(playerid, 0);

	#if defined Damage_OnPlayerSpawn
		return Damage_OnPlayerSpawn(playerid);
	#else
		return 1;
	#endif
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if (g_rgbitsPlayerFlags[playerid] & e_bmPlayerDead)
		return 0;
	
	g_rgbitsPlayerFlags[playerid] |= e_bmPlayerDead;

	g_iPlayerHealth[playerid] = 0;
	g_iPlayerArmour[playerid] = 0;

	#if defined Damage_OnPlayerDeath
		return Damage_OnPlayerDeath(playerid, killerid, reason);
	#else
		return 1;
	#endif
}

public OnPlayerGiveDamage(playerid, damagedid, Float:amount, weaponid, bodypart)
{
	if (!IsPlayerConnected(playerid)
		|| !IsPlayerConnected(damagedid)
		|| (g_iPlayerTeam[playerid] == g_iPlayerTeam[damagedid] && g_iPlayerTeam[playerid] != NO_TEAM))
	{
		return 0;
	}

	if (weaponid <= WEAPON_SNIPER)
	{
		amount = g_rgiWeaponsDamage[weaponid][bodypart - 3];
	}
	else
	{
		if (amount <= 0.9) amount = 1.0;
	}

	if (OnPlayerDamage(damagedid, playerid, floatround(amount), weaponid, bodypart))
	{
		Damage_Send(damagedid, playerid, amount, weaponid);
	}
	return 0;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	if (issuerid != INVALID_PLAYER_ID && weaponid < 50 && weaponid != WEAPON_FLAMETHROWER)
	{
		return 0;
	}

	if (amount <= 0.9) amount = 1.0;

	OnPlayerDamage(playerid, issuerid, floatround(amount), weaponid, bodypart);
	Damage_Send(playerid, issuerid, amount, weaponid);
	return 0;
}

IPacket:207(playerid, BitStream:bs)
{
	new onfoot_data[PR_OnFootSync];

	BS_IgnoreBits(bs, 8);
	BS_ReadOnFootSync(bs, onfoot_data);

	onfoot_data[PR_health] = g_iPlayerHealth[playerid];
	onfoot_data[PR_armour] = g_iPlayerArmour[playerid];

	BS_SetWriteOffset(bs, 8);
	BS_WriteOnFootSync(bs, onfoot_data);
	return 1;
}

public OnPlayerDamage(playerid, issuerid, amount, weaponid, bodypart)
{
	if (IsPlayerPaused(playerid)) return 0;

	if (issuerid != INVALID_PLAYER_ID && weaponid == 23)
	{
	   SetPlayerChatBubble(playerid, "\n\n\n\n* Cae al piso al recibir el choque eléctrico de un tazer.\n\n\n", 0xffcb90FF, 20.0, 5000);
	   FreezePlayer(playerid, 15000);
	   ApplyAnimation(playerid,"PED","BIKE_fallR",4.0,0,1,1,1,0);
       ShowPlayerMessage(playerid, "~y~Te dieron una descarga eléctrica con un Tazer.", 3);
	   return 1;
	}

	if (IsPlayerConnected(issuerid))
	{
		new p_interior = GetPlayerInterior(issuerid);

		if (p_interior == 25 || p_interior == 26 || p_interior == 27)
		{
			SetPlayerPosEx(issuerid, 509.152374, -723.324951, 19.869243, 340.0, 0, 0);
			SetPlayerTime(issuerid, SERVER_TIME[0], SERVER_TIME[1]);
		}

		if (!PLAYER_TEMP[issuerid][py_BOXING])
		{
			if (IsPlayerInRangeOfPoint(issuerid, 30.0, -17.344648, 99.261329, 1100.822021))
			{
				SetPlayerPosEx(issuerid, 950.341247, -987.135864, 38.743835, 322.0, 0, 0);
				ShowPlayerMessage(issuerid, "~r~Solos los boxeadores pueden pegar", 4);
			}
		}

		if (PLAYER_MISC[playerid][MISC_DAMAGE_INFORMER])
		{
			KillTimer(GetPVarInt(playerid, "damage_inf_timer"));
			SetPVarInt(playerid, "damage_inf_timer", SetTimerEx("TIMER_RemoveDamageInformer", 4000, false, "i", playerid));
			
			g_iDamageTaken[playerid][issuerid] += amount;

			if (!g_sDamageTakenText[playerid][0])
			{
				format(
					g_sDamageTakenText[playerid],
					128,
					"%s_~r~~h~~h~~h~-%d (%d hp)~n~~r~~h~~h~~h~(%s - %s)~n~",
					PLAYER_TEMP[playerid][py_NAME],
					g_iDamageTaken[playerid][issuerid],
					((g_iPlayerHealth[playerid] + g_iPlayerArmour[playerid]) - amount),
					g_rgszWeaponName[weaponid],
					g_rgszBodyPart[bodypart - 3]
				);
			}
			else
			{
				new
					player_pos_in_td = strfind(PLAYER_TEMP[playerid][py_NAME], g_sDamageTakenText[playerid]),
					end_pos;
				
				if (player_pos_in_td != -1)
				{
					end_pos = strfind(g_sDamageTakenText[playerid], "~n~~n~", .pos = player_pos_in_td);

					strdel(g_sDamageTakenText[playerid], player_pos_in_td, (end_pos + 6));

					strins(
						g_sDamageTakenText[playerid],
						sprintf(
							"~w~_~w~%s_~r~~h~~h~~h~-%d (%d hp)~n~~r~~h~~h~~h~(%s - %s)~n~~n~",
							PLAYER_TEMP[playerid][py_NAME],
							g_iDamageTaken[playerid][issuerid],
							((g_iPlayerHealth[playerid] + g_iPlayerArmour[playerid]) - amount),
							g_rgszWeaponName[weaponid],
							g_rgszBodyPart[bodypart - 3]
						),
						player_pos_in_td
					);
				}
				else
				{
					new
						lines[3] = { -1, ... };
					
					lines[0] = strfind(g_sDamageTakenText[playerid], "~w~_~w~");

					if (lines[0] != -1) lines[1] = strfind(g_sDamageTakenText[playerid], "~w~_~w~", .pos = (lines[0] + 7));
					if (lines[1] != -1) lines[2] = strfind(g_sDamageTakenText[playerid], "~w~_~w~", .pos = (lines[1] + 7));

					if (lines[2] == -1)
					{
						format(
							g_sDamageTakenText[playerid],
							128,
							"%s~w~_~w~%s_~r~~h~~h~~h~-%d (%d hp)~n~~r~~h~~h~~h~(%s - %s)~n~~n~",
							g_sDamageTakenText[playerid],
							PLAYER_TEMP[playerid][py_NAME],
							g_iDamageTaken[playerid][issuerid],
							((g_iPlayerHealth[playerid] + g_iPlayerArmour[playerid]) - amount),
							g_rgszWeaponName[weaponid],
							g_rgszBodyPart[bodypart - 3]
						);
					}
					else
					{
						new line_selected = random(3);

						strdel(g_sDamageTakenText[playerid], lines[line_selected], strfind(g_sDamageTakenText[playerid], "~n~~n~", .pos = lines[line_selected]));

						strins(
							g_sDamageTakenText[playerid],
							sprintf(
								"~w~_~w~%s_~r~~h~~h~~h~-%d (%d hp)~n~~r~~h~~h~~h~(%s - %s)~n~~n~",
								PLAYER_TEMP[playerid][py_NAME],
								g_iDamageTaken[playerid][issuerid],
								((g_iPlayerHealth[playerid] + g_iPlayerArmour[playerid]) - amount),
								g_rgszWeaponName[weaponid],
								g_rgszBodyPart[bodypart - 3]
							),
							lines[line_selected]
						);
					}
				}
			}

			PlayerTextDrawSetString(playerid, g_ptdDamageTaken[playerid], TextToSpanish(g_sDamageTakenText[playerid]));
			PlayerTextDrawShow(playerid, g_ptdDamageTaken[playerid]);
		}

		if (PLAYER_MISC[issuerid][MISC_DAMAGE_INFORMER])
		{
			KillTimer(GetPVarInt(issuerid, "damage_inf_timer"));
			SetPVarInt(issuerid, "damage_inf_timer", SetTimerEx("TIMER_RemoveDamageInformer", 4000, false, "i", issuerid));

			g_iDamageGiven[issuerid][playerid] += amount;
		}
	}

	Logger_Debug("OnPlayerDamage(playerid: %d, issuerid: %d, amount: %d, weaponid: %d, bodypart: %d)", playerid, issuerid, amount, weaponid, bodypart);
	return 1;
}

#if defined Damage_OnPlayerDeath
	forward Damage_OnPlayerDeath(playerid, killerid, reason);
#endif

#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif

#define OnPlayerDeath Damage_OnPlayerDeath

#if defined Damage_OnPlayerSpawn
	forward Damage_OnPlayerSpawn(playerid);
#endif

#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif

#define OnPlayerSpawn Damage_OnPlayerSpawn

#if defined Damage_OnPlayerConnect
	forward Damage_OnPlayerConnect(playerid);
#endif

#if defined _ALS_OnPlayerConnect
	#undef OnPlayerConnect
#else
	#define _ALS_OnPlayerConnect
#endif

#define OnPlayerConnect Damage_OnPlayerConnect

#if defined Damage_OnPlayerDisconnect
	forward Damage_OnPlayerDisconnect(playerid, reason);
#endif

#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect Damage_OnPlayerDisconnect