public FCNPC_OnFinishPlayback(npcid)
{
	for(new traindriver = 0; traindriver < MAX_STANDARD_NPC_TRAINDRIVERS; traindriver++)
    {
		if (npcid == TrainDriverNPCs[traindriver])
        {
			TrainDriverNextPlayback(traindriver);
			break;
		}
	}
    
	for(new pilot = 0; pilot < MAX_STANDARD_NPC_PILOTS; pilot++)
    {
		if (npcid == PilotNPCs[pilot])
        {
			PilotNextPlayback(pilot);
			break;
		}
	}
	return 1;
}

public FCNPC_OnVehicleTakeDamage(npcid, issuerid, vehicleid, Float:amount, weaponid, Float:fX, Float:fY, Float:fZ)
{
	for(new traindriver = 0; traindriver < MAX_STANDARD_NPC_TRAINDRIVERS; traindriver++)
    {
		if (npcid == TrainDriverNPCs[traindriver]) return 0;
	}

	for(new pilot = 0; pilot < MAX_STANDARD_NPC_PILOTS; pilot++)
    {
		if (npcid == PilotNPCs[pilot]) return 0;
	}
	return 1;
}

public NPC_Update()
{
	for(new i = 0; i < sizeof(NPC_INFO); i++)
	{
		if (!FCNPC_IsValid(i)) continue;
		
		new npcid = i;
		new mission = NPC_INFO[npcid][ni_MISSION];

		switch(mission)
		{
			case SWEET_MISSION:
			{
				if (FCNPC_IsSpawned(npcid) && !FCNPC_IsDead(npcid))
				{
					new forplayerid = INVALID_PLAYER_ID;
					for(new x = 0, j = GetPlayerPoolSize(); x <= j; x++)
					{
						if (!IsPlayerConnected(x)) continue;

						if (PLAYER_TEMP[x][py_IN_MISSION])
						{
							if (PLAYER_TEMP[x][py_MISSION] == mission)
							{
								new Float:n_x, Float:n_y, Float:n_z;

								FCNPC_GetPosition(npcid, n_x, n_y, n_z);

								if (GetPlayerDistanceFromPoint(x, n_x, n_y, n_z) <= 40.0)
								{
									forplayerid = x;
									break;
								}
							}
						}
					}

					if (forplayerid == INVALID_PLAYER_ID)
					{
						FCNPC_StopAim(npcid);
						continue;
					}

					FCNPC_StopAim(npcid);

					FCNPC_AimAtPlayer(npcid, forplayerid, true, 1000);
					
					if (!NPC_INFO[npcid][ni_STATIC_FIRE])
						FCNPC_GoToPlayer(npcid, forplayerid);

					SetPlayerMarkerForPlayer(forplayerid, npcid, 0xCB2828FF);
					SetPlayerColor(npcid, 0xCB2828FF);
				}
				else
				{
					SetPlayerColor(npcid, PLAYER_COLOR);

					if (FCNPC_IsDead(npcid))
					{
						for(new x = 0, j = GetPlayerPoolSize(); x <= j; x++)
						{
							if (!IsPlayerConnected(x)) continue;

							if (PLAYER_TEMP[x][py_IN_MISSION])
							{
								if (PLAYER_TEMP[x][py_MISSION] == mission)
								{
									SetPlayerMarkerForPlayer(x, npcid, PLAYER_COLOR);
								}
							}
						}
					}
				}
			}
		}
	}
	return 1;
}

public FCNPC_OnSpawn(npcid)
{
	SetPlayerTeam(npcid, DEFAULT_TEAM);
	g_rgbitsPlayerFlags[npcid] &= ~e_bmPlayerDead;
	return 1;
}

public FCNPC_OnDeath(npcid, killerid, reason)
{
	new mission = NPC_INFO[npcid][ni_MISSION];

	switch(mission)
	{
		case SWEET_MISSION:
		{
			if (PLAYER_TEMP[killerid][py_IN_MISSION])
			{
				if (PLAYER_TEMP[killerid][py_MISSION] == mission)
				{
					// Give mission participation points
					PLAYER_TEMP[killerid][py_MISSION_POINTS] ++;

					SetMissionPlayerMarkers(killerid);

					switch(PLAYER_TEMP[killerid][py_MISSION_TYPE])
					{
						case 0, 2:
						{
							// Check lives npc's
							new npc_lives;
							for(new i = 0; i < sizeof(SWEET_DEALERS); i++)
							{
								if (FCNPC_IsSpawned(SWEET_DEALERS[i][sd_ID]) && !FCNPC_IsDead(SWEET_DEALERS[i][sd_ID]))
									npc_lives ++;
							}

							SetPlayerRangePoliceSearchLevel(killerid, 2, 200.0, "Homicidio");

							// Change color and check mission win
							for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
							{
								if (!IsPlayerConnected(i)) continue;

								// Color
								if (PLAYER_TEMP[i][py_IN_MISSION])
								{
									if (PLAYER_TEMP[i][py_MISSION] == mission)
									{
										SetPlayerMarkerForPlayer(i, npcid, PLAYER_COLOR);
										SetPlayerColor(npcid, PLAYER_COLOR);

										// Mission win
										if (npc_lives <= 0)
										{
											GivePlayerReputation(i, 1, false);
											ShowPlayerAlert(i, "COMPLETADA~n~~w~+EXP", 0xd5900aFF, 5);

											SetPlayerMarkerForPlayer(i, killerid, PLAYER_COLOR);
											SetPlayerMarkerForPlayer(killerid, i, PLAYER_COLOR);

											GivePlayerCash(i, 1000 + (400 * PLAYER_TEMP[i][py_MISSION_POINTS]));
											PLAYER_TEMP[i][py_IN_MISSION] = false;
										}
									}
								}
							}

							// Respawn npcs
							if (npc_lives <= 0)
							{
								for(new i = 0; i < sizeof(SWEET_DEALERS); i++)
								{
									FCNPC_SetVirtualWorld(SWEET_DEALERS[i][sd_ID], 1);
								}
							}
						}
					}
				}
			}
		}
	}

	if (g_rgbitsPlayerFlags[npcid] & e_bmPlayerDead)
		return 0;
	
	g_rgbitsPlayerFlags[npcid] |= e_bmPlayerDead;

	g_iPlayerHealth[npcid] = 0;
	g_iPlayerArmour[npcid] = 0;
	return 1;
}

public FCNPC_OnTakeDamage(npcid, issuerid, Float:amount, weaponid, bodypart)
{
	new mission = NPC_INFO[npcid][ni_MISSION];

	switch(mission)
	{
		case SWEET_MISSION:
		{
			if (FCNPC_IsSpawned(npcid) && !FCNPC_IsDead(npcid))
			{
				if (PLAYER_TEMP[issuerid][py_IN_MISSION])
				{
					if (PLAYER_TEMP[issuerid][py_MISSION] == mission)
					{
						FCNPC_AimAtPlayer(npcid, issuerid, true, 1000);
						FCNPC_GoToPlayer(npcid, issuerid);
					}
				}
			}
			else
			{
				SetPlayerMarkerForPlayer(issuerid, npcid, PLAYER_COLOR);
				SetPlayerColor(npcid, PLAYER_COLOR);
			}
		}
	}

	if (amount <= 0.9) amount = 1.0;

	OnPlayerDamage(npcid, issuerid, floatround(amount), weaponid, bodypart);
	Damage_Send(npcid, issuerid, amount, weaponid);
	return 1;
}

public FCNPC_OnGiveDamage(npcid, damagedid, Float:amount, weaponid, bodypart)
{
	#if DEBUG_MODE == 1
		printf("FCNPC_OnGiveDamage npc: %d, damageid: %d, amount: %f, weapon: %d, bodypart: %d", npcid, damagedid, amount, weaponid, bodypart); // debug juju
	#endif

	if (amount <= 0.9) amount = 1.0;

	OnPlayerDamage(damagedid, npcid, floatround(amount), weaponid, bodypart);
	Damage_Send(damagedid, npcid, amount, weaponid);
	return 0;
}