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
					FCNPC_GoToPlayer(npcid, forplayerid);

					SetPlayerMarkerForPlayer(forplayerid, npcid, 0xCB2828FF);
					SetPlayerColor(npcid, 0xCB2828FF);
				}
				else
				{
					SetPlayerColor(npcid, PLAYER_COLOR);
				}
			}
		}
	}
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

					// Check lives npc's
					new npc_lives;
					for(new i = 0; i < sizeof(SWEET_DEALERS); i++)
					{
						if (FCNPC_IsSpawned(SWEET_DEALERS[i][sd_ID]) && !FCNPC_IsDead(SWEET_DEALERS[i][sd_ID]))
							npc_lives ++;
					}

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
							}
						}

						// Mission win
						if (npc_lives <= 0)
						{
							GivePlayerReputation(i, 1, false);
							ShowPlayerAlert(i, "COMPLETADA~n~~w~+EXP", 0xd5900aFF, 5);
							GivePlayerCash(i, 1000 + (300 * PLAYER_TEMP[i][py_MISSION_POINTS]));
							PLAYER_TEMP[i][py_IN_MISSION] = false;
						}
					}
				}
			}
		}
	}
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
	return 1;
}