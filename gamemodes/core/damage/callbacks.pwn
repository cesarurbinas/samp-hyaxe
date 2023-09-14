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
	
	/*Player_SetHealth(playerid, 100);
	Player_SetArmour(playerid, 0);*/

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
	if (IsPlayerPaused(issuerid)) return 0;

	if (!PLAYER_TEMP[playerid][py_COMBAT_MODE] && IsPlayerPaused(playerid)) return 0;
	if (PLAYER_TEMP[playerid][py_GODMODE] && issuerid != INVALID_PLAYER_ID) return 0;

	new Float:x, Float:y, Float:z;
	
	GetPlayerPos(playerid, x, y, z);
	if (IsShortDistanceWeapon(weaponid, GetPlayerDistanceFromPoint(playerid, x, y, z))) return 0;

	if (issuerid != INVALID_PLAYER_ID && weaponid == 23)
	{
	   SetPlayerChatBubble(playerid, "\n\n\n\n* Cae al piso al recibir el choque eléctrico de un tazer.\n\n\n", 0xffcb90FF, 20.0, 5000);
	   FreezePlayer(playerid, 30000);
	   ApplyAnimation(playerid, "PED", "BIKE_fallR", 4.0, 0, 1, 1, 1, 0);
       ShowPlayerMessage(playerid, "~y~Te dieron una descarga eléctrica con un Tazer.", 3);
	   return 1;
	}

	if (IsPlayerConnected(issuerid))
	{
		switch(weaponid)
		{
			case 0:
			{
				GetPlayerPos(issuerid, x, y, z);

				if (GetPlayerDistanceFromPoint(playerid, x, y, z) >= 5.0)
				{
					PLAYER_TEMP[playerid][py_BIG_PUNCH] ++;
					if (PLAYER_TEMP[playerid][py_BIG_PUNCH] >= 5)
					{
						PLAYER_TEMP[playerid][py_BIG_PUNCH] = 0;

						new string[128];
						format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): Fist slapper (wp: %d, dist: %f)", ACCOUNT_INFO[issuerid][ac_NAME], issuerid, weaponid, dist);
						SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
						SendDiscordWebhook(string, 1);

						SendClientMessageEx(issuerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Razón: Fist slapper");
						KickEx(issuerid, 500);
					}
				}
			}
			case 22..27, 33, 34:
			{
				if (bodypart == 9)
				{
					new current_gettime = gettime();

					if (current_gettime - PLAYER_AC_INFO[playerid][CHEAT_HEAD_AIM][p_ac_info_LAST_DETECTION] > 30) PLAYER_AC_INFO[playerid][CHEAT_HEAD_AIM][p_ac_info_DETECTIONS] = 0;
					else PLAYER_AC_INFO[playerid][CHEAT_HEAD_AIM][p_ac_info_DETECTIONS] ++;

					PLAYER_AC_INFO[playerid][CHEAT_HEAD_AIM][p_ac_info_LAST_DETECTION] = current_gettime;
					if (PLAYER_AC_INFO[playerid][CHEAT_HEAD_AIM][p_ac_info_DETECTIONS] >= 5)
					{
						new dialog[250];
						format(dialog, sizeof dialog, ""COL_WHITE"Fuiste baneado, razón: Aimbot");
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
						
						AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, "Aimbot");

						KickEx(playerid, 500);
						PLAYER_MISC[playerid][MISC_BANS] ++;
						SavePlayerMisc(playerid);

						new str[144];
						format(str, 144, "[ADMIN] NeuroAdmin baneó a %s (%d): Aimbot.", ACCOUNT_INFO[playerid][ac_NAME], playerid);
						SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

						new webhook[144];
						format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
						SendDiscordWebhook(webhook, 1);
					}
				}
			}
		}

		if (!PLAYER_WORKS[issuerid][WORK_POLICE])
		{
			KillTimer(PLAYER_TEMP[issuerid][py_TIMERS][44]);
			PLAYER_TEMP[issuerid][py_TIMERS][44] = SetTimerEx("DisableCombatMode", 60000, false, "i", issuerid);
			
			if (!PLAYER_TEMP[issuerid][py_COMBAT_MODE]) ShowPlayerNotification(issuerid, "Has entrado en modo de combate.");
			PLAYER_TEMP[issuerid][py_COMBAT_MODE] = true;
		}

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
					512,
					"~w~_~w~%s_~r~~h~~h~~h~-%d (%d hp)~n~~r~~h~~h~~h~(%s - %s)~n~~n~",
					PLAYER_TEMP[issuerid][py_NAME],
					g_iDamageTaken[playerid][issuerid],
					((g_iPlayerHealth[playerid] + g_iPlayerArmour[playerid]) - amount),
					g_rgszWeaponName[weaponid],
					g_rgszBodyPart[bodypart - 3]
				);
			}
			else
			{
				new
					player_pos_in_td = strfind(g_sDamageTakenText[playerid], sprintf("~w~_~w~%s_~r~", PLAYER_TEMP[issuerid][py_NAME]));
				
				if (player_pos_in_td != -1)
				{
					strdel(g_sDamageTakenText[playerid], player_pos_in_td, (strfind(g_sDamageTakenText[playerid], "~n~~n~", .pos = player_pos_in_td) + 6));

					strins(
						g_sDamageTakenText[playerid],
						sprintf(
							"~w~_~w~%s_~r~~h~~h~~h~-%d (%d hp)~n~~r~~h~~h~~h~(%s - %s)~n~~n~",
							PLAYER_TEMP[issuerid][py_NAME],
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
							512,
							"%s~w~_~w~%s_~r~~h~~h~~h~-%d (%d hp)~n~~r~~h~~h~~h~(%s - %s)~n~~n~",
							g_sDamageTakenText[playerid],
							PLAYER_TEMP[issuerid][py_NAME],
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
								PLAYER_TEMP[issuerid][py_NAME],
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

			if (!g_sDamageGivenText[issuerid][0])
			{
				format(
					g_sDamageGivenText[issuerid],
					512,
					"~w~_~w~%s_~g~~h~~h~~h~-%d (%d hp)~n~~g~~h~~h~~h~(%s - %s)~n~~n~",
					PLAYER_TEMP[playerid][py_NAME],
					g_iDamageGiven[issuerid][playerid],
					((g_iPlayerHealth[playerid] + g_iPlayerArmour[playerid]) - amount),
					g_rgszWeaponName[weaponid],
					g_rgszBodyPart[bodypart - 3]
				);
			}
			else
			{
				new
					player_pos_in_td = strfind(g_sDamageGivenText[issuerid], sprintf("~w~_~w~%s_~g~", PLAYER_TEMP[playerid][py_NAME]));
				
				if (player_pos_in_td != -1)
				{
					strdel(g_sDamageGivenText[issuerid], player_pos_in_td, (strfind(g_sDamageGivenText[issuerid], "~n~~n~", .pos = player_pos_in_td) + 6));

					strins(
						g_sDamageGivenText[issuerid],
						sprintf(
							"~w~_~w~%s_~g~~h~~h~~h~-%d (%d hp)~n~~g~~h~~h~~h~(%s - %s)~n~~n~",
							PLAYER_TEMP[playerid][py_NAME],
							g_iDamageGiven[issuerid][playerid],
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
					
					lines[0] = strfind(g_sDamageGivenText[issuerid], "~w~_~w~");

					if (lines[0] != -1) lines[1] = strfind(g_sDamageGivenText[issuerid], "~w~_~w~", .pos = (lines[0] + 7));
					if (lines[1] != -1) lines[2] = strfind(g_sDamageGivenText[issuerid], "~w~_~w~", .pos = (lines[1] + 7));

					if (lines[2] == -1)
					{
						format(
							g_sDamageGivenText[issuerid],
							512,
							"%s~w~_~w~%s_~g~~h~~h~~h~-%d (%d hp)~n~~g~~h~~h~~h~(%s - %s)~n~~n~",
							g_sDamageGivenText[issuerid],
							PLAYER_TEMP[playerid][py_NAME],
							g_iDamageGiven[issuerid][playerid],
							((g_iPlayerHealth[playerid] + g_iPlayerArmour[playerid]) - amount),
							g_rgszWeaponName[weaponid],
							g_rgszBodyPart[bodypart - 3]
						);
					}
					else
					{
						new line_selected = random(3);

						strdel(g_sDamageGivenText[issuerid], lines[line_selected], strfind(g_sDamageGivenText[issuerid], "~n~~n~", .pos = lines[line_selected]));

						strins(
							g_sDamageGivenText[issuerid],
							sprintf(
								"~w~_~w~%s_~g~~h~~h~~h~-%d (%d hp)~n~~g~~h~~h~~h~(%s - %s)~n~~n~",
								PLAYER_TEMP[playerid][py_NAME],
								g_iDamageGiven[issuerid][playerid],
								((g_iPlayerHealth[playerid] + g_iPlayerArmour[playerid]) - amount),
								g_rgszWeaponName[weaponid],
								g_rgszBodyPart[bodypart - 3]
							),
							lines[line_selected]
						);
					}
				}
			}

			PlayerTextDrawSetString(issuerid, g_ptdDamageGiven[issuerid], TextToSpanish(g_sDamageGivenText[issuerid]));
			PlayerTextDrawShow(issuerid, g_ptdDamageGiven[issuerid]);
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