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
				new forplayerid = INVALID_PLAYER_ID;
				for(new x = 0, j = GetPlayerPoolSize(); x <= j; x++)
				{
					if (!IsPlayerConnected(x)) continue;

					if (PLAYER_TEMP[x][py_IN_MISSION])
					{
						if (PLAYER_TEMP[x][py_MISSION] == START_MISSION[mission][ems_TYPE])
						{
							new Float:n_x, Float:n_y, Float:n_z;

							FCNPC_GetPosition(npcid, n_x, n_y, n_z);

							if (GetPlayerDistanceFromPoint(x, n_x, n_y, n_z) <= 30.0)
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

				if (FCNPC_IsSpawned(npcid) && !FCNPC_IsDead(npcid))
				{
					FCNPC_StopAim(npcid);

					FCNPC_AimAtPlayer(npcid, forplayerid, true, 1000);
					FCNPC_GoToPlayer(npcid, forplayerid);

					SetPlayerMarkerForPlayer(forplayerid, npcid, 0xCB2828FF);
                    SetPlayerColor(npcid, 0xCB2828FF);
				}
			}
		}
	}
	return 1;
}