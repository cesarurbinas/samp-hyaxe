CreateMissionsPlaces()
{
    // Main checkpoint
    for(new i = 0; i < sizeof(START_MISSION); i ++)
    {
        if (START_MISSION[i][ems_ENABLED])
        {
            new area = CreateDynamicCircle(START_MISSION[i][ems_X], START_MISSION[i][ems_Y], 5.0);

            new info[2];
            info[0] = KEY_TYPE_MISSION;
            info[1] = i; // Index
            Streamer_SetArrayData(STREAMER_TYPE_AREA, area, E_STREAMER_EXTRA_ID, info);

            AddKeyArea(START_MISSION[i][ems_X], START_MISSION[i][ems_Y], 0.8, KEY_TYPE_Y);
            
            CreateDynamicMapIcon(
                START_MISSION[i][ems_X],
                START_MISSION[i][ems_Y],
                START_MISSION[i][ems_Z],
                START_MISSION[i][ems_MAPICON], COLOR_WHITE, 0, 0
            );
        }
    }

    // Sweet come back
    START_MISSION[SWEET_MISSION][ems_COME_BACK_AREA] = CreateDynamicCircle(490.1550, -1666.5117, 6.0);

    // Sweet NPC's
    for(new i = 0; i < sizeof(SWEET_DEALERS); i++)
    {
        SWEET_DEALERS[i][sd_ID] = FCNPC_Create(sprintf("Dealer_%d", i));
        NPC_INFO[ SWEET_DEALERS[i][sd_ID] ][ni_MISSION] = SWEET_MISSION;
        NPC_INFO[ SWEET_DEALERS[i][sd_ID] ][ni_INDEX] = i;
        
        FCNPC_Spawn(
            SWEET_DEALERS[i][sd_ID],
            DEALER_SKIN[ random(sizeof(DEALER_SKIN))],
            SWEET_DEALERS[i][sd_X],
            SWEET_DEALERS[i][sd_Y],
            SWEET_DEALERS[i][sd_Z]
        );

        FCNPC_SetVirtualWorld(SWEET_DEALERS[i][sd_ID], 1);
        FCNPC_SetInvulnerable(SWEET_DEALERS[i][sd_ID], true);
    }

    // Init NPC AI Process
    SetTimer("NPC_Update", 5000, true); // 5 seconds
    return 1;
}

SetMissionPlayerMarkers(playerid)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
            if (PLAYER_TEMP[i][py_IN_MISSION])
            {
                if (PLAYER_TEMP[i][py_MISSION] == PLAYER_TEMP[playerid][py_MISSION])
                {
			        SetPlayerMarkerForPlayer(playerid, i, 0x46ABE5FF);
                }
			}
		}
	}
	return 1;
}

MissionFailed(playerid, bool:disconnected = false)
{
    PLAYER_TEMP[playerid][py_IN_MISSION] = false;

    if (!disconnected)
    {
        ShowPlayerAlert(playerid, "~r~FALLIDO", 0xd5900aFF, 4);
        ShowPlayerMessage(playerid, sprintf("~r~%s", FAILED_MSGS[ random(sizeof(FAILED_MSGS))]), 4);
    }

    // Exit message
    new players_in_mission;
    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if (!IsPlayerConnected(i)) continue;

        if (PLAYER_TEMP[i][py_IN_MISSION])
        {
            if (PLAYER_TEMP[i][py_MISSION] == PLAYER_TEMP[playerid][py_MISSION])
            {
                if (!disconnected) ShowPlayerNotification(i, sprintf("%s ha fracasado la misión.", PLAYER_TEMP[playerid][py_NAME]),  3);
                else ShowPlayerNotification(i, sprintf("%s se ha ido la misión.", PLAYER_TEMP[playerid][py_NAME]),  3);
                
                SetPlayerMarkerForPlayer(i, playerid, PLAYER_COLOR);
                players_in_mission ++;
            }
        }
    }

    // Reset mission env
    switch(PLAYER_TEMP[playerid][py_MISSION])
	{
		case SWEET_MISSION:
		{
            // Reset npc color
            for(new i = 0; i < sizeof(SWEET_DEALERS); i++)
            {
                SetPlayerMarkerForPlayer(playerid, SWEET_DEALERS[i][sd_ID], PLAYER_COLOR);
            }

            // Respawn
            if (players_in_mission <= 1)
            {
                for(new i = 0; i < sizeof(SWEET_DEALERS); i++)
                {
                    FCNPC_SetVirtualWorld(SWEET_DEALERS[i][sd_ID], 1);
                }
            }
        }
    }
}

CheckMissionPlace(playerid)
{
    new bool:valid, index;
    for(new i = 0; i < sizeof(START_MISSION); i ++)
    {
        if (START_MISSION[i][ems_ENABLED])
        {
            if (IsPlayerInRangeOfPoint(playerid, 3.5, START_MISSION[i][ems_X], START_MISSION[i][ems_Y], START_MISSION[i][ems_Z]))
			{
                index = i;
                valid = true;
                break;
            }
        }
    }

    if (valid)
    {
        if (PLAYER_TEMP[playerid][py_IN_MISSION])
            return ShowPlayerMessage(playerid, "~r~Primero termina la misión actual.", 4);
        
        // Init
        new players_in_mission;

        PLAYER_TEMP[playerid][py_IN_MISSION] = true;
        PLAYER_TEMP[playerid][py_MISSION] = index;
        PLAYER_TEMP[playerid][py_MISSION_POINTS] = 0;

        // Enter message
        for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
        {
            if (!IsPlayerConnected(i)) continue;

            if (PLAYER_TEMP[i][py_IN_MISSION])
            {
                if (PLAYER_TEMP[i][py_MISSION] == index)
                {
                    ShowPlayerNotification(i, sprintf("%s se ha unido a la misión.", PLAYER_TEMP[playerid][py_NAME]),  3);
                    SetPlayerMarkerForPlayer(i, playerid, 0x46ABE5FF);
                    players_in_mission ++;
                }
            }
        }

        SetMissionPlayerMarkers(playerid);

        if (players_in_mission <= 1) START_MISSION[index][ems_TYPE] = random(START_MISSION[index][ems_MAX_MISSIONS]);
        PLAYER_TEMP[playerid][py_MISSION_TYPE] = START_MISSION[index][ems_TYPE];
        START_MISSION[index][ems_COME_BACK] = false;

        // Show message
        switch(index)
        {
            // Sweet missions
            case SWEET_MISSION:
            {
                // Mission messages
                switch(START_MISSION[index][ems_TYPE])
                {
                    // Dealers exterminate
                    case 0:
                    {
                        for(new i = 0; i < sizeof(SWEET_DEALERS); i++)
                        {
                            if (players_in_mission <= 1)
                            {
                                PLAYER_TEMP[ SWEET_DEALERS[i][sd_ID] ][py_GAME_STATE] = GAME_STATE_NORMAL;
                                CHARACTER_INFO[ SWEET_DEALERS[i][sd_ID] ][ch_STATE] = ROLEPLAY_STATE_NORMAL;
                                NPC_INFO[ SWEET_DEALERS[i][sd_ID] ][ni_STATIC_FIRE] = false;

                                SetPlayerHealthEx(SWEET_DEALERS[i][sd_ID], 80.0);
                                FCNPC_SetHealth(SWEET_DEALERS[i][sd_ID], 80.0);

                                FCNPC_ClearAnimations(SWEET_DEALERS[i][sd_ID]);
                                FCNPC_Respawn(SWEET_DEALERS[i][sd_ID]);
                                FCNPC_SetSkin(SWEET_DEALERS[i][sd_ID], DEALER_SKIN[ random(sizeof(DEALER_SKIN))]);

                                FCNPC_SetPosition(
                                    SWEET_DEALERS[i][sd_ID],
                                    SWEET_DEALERS[i][sd_X],
                                    SWEET_DEALERS[i][sd_Y],
                                    SWEET_DEALERS[i][sd_Z]
                                );
                                FCNPC_SetAngle(SWEET_DEALERS[i][sd_ID], SWEET_DEALERS[i][sd_ANGLE]);

                                FCNPC_SetWeapon(SWEET_DEALERS[i][sd_ID], DEALER_WEAPONS[ random(sizeof(DEALER_WEAPONS))]);
                                FCNPC_SetAmmo(SWEET_DEALERS[i][sd_ID], 9999);
                                FCNPC_UseInfiniteAmmo(SWEET_DEALERS[i][sd_ID], true);

                                FCNPC_SetVirtualWorld(SWEET_DEALERS[i][sd_ID], 0);
                                FCNPC_SetInvulnerable(SWEET_DEALERS[i][sd_ID], false);
                                FCNPC_AimAtPlayer(SWEET_DEALERS[i][sd_ID], playerid, true, 1000);
                            }

                            if (FCNPC_IsSpawned(SWEET_DEALERS[i][sd_ID]) && !FCNPC_IsDead(SWEET_DEALERS[i][sd_ID]))
                                SetPlayerMarkerForPlayer(playerid, SWEET_DEALERS[i][sd_ID], 0xCB2828FF);
                            
                            SetPlayerColor(SWEET_DEALERS[i][sd_ID], 0xCB2828FF);
                        }
                        
                        ShowPlayerMessage(playerid, "Elimina a los ~r~Dealers~w~ colados en el barrio.", 15);
                        SetTimer("NPC_Update", 3000, false);
                    }

                    // Drug stealer
                    case 1:
                    {
                        if (players_in_mission <= 1)
                        {
                            START_MISSION[index][ems_SPECIAL_INDEX] = random( sizeof(INIT_DRUG_STEAL) );

                            new drug_pickup = CreateDynamicPickup(
                                1212, 1,
                                INIT_DRUG_STEAL[ START_MISSION[index][ems_SPECIAL_INDEX] ][0],
                                INIT_DRUG_STEAL[ START_MISSION[index][ems_SPECIAL_INDEX] ][1],
                                INIT_DRUG_STEAL[ START_MISSION[index][ems_SPECIAL_INDEX] ][2],
                                0, 0
                            );
                        
                            new info[3];
                            info[0] = PICKUP_TYPE_DRUG;
                            info[1] = 0; // Index
                            info[2] = 0; // Nada
                            Streamer_SetArrayData(STREAMER_TYPE_PICKUP, drug_pickup, E_STREAMER_EXTRA_ID, info);
                        }

                        for(new i = 0; i < 6; i++)
                        {
                            if (players_in_mission <= 1)
                            {
                                PLAYER_TEMP[ SWEET_DEALERS[i][sd_ID] ][py_GAME_STATE] = GAME_STATE_NORMAL;
                                CHARACTER_INFO[ SWEET_DEALERS[i][sd_ID] ][ch_STATE] = ROLEPLAY_STATE_NORMAL;
                                NPC_INFO[ SWEET_DEALERS[i][sd_ID] ][ni_STATIC_FIRE] = true;

                                SetPlayerHealthEx(SWEET_DEALERS[i][sd_ID], 80.0);
                                FCNPC_SetHealth(SWEET_DEALERS[i][sd_ID], 80.0);

                                FCNPC_ClearAnimations(SWEET_DEALERS[i][sd_ID]);
                                FCNPC_Respawn(SWEET_DEALERS[i][sd_ID]);
                                FCNPC_SetSkin(SWEET_DEALERS[i][sd_ID], BALLAS_SKINS[ random(sizeof(BALLAS_SKINS))]);

                                new
                                    Float:x = INIT_DRUG_STEAL[ START_MISSION[index][ems_SPECIAL_INDEX] ][0],
                                    Float:y = INIT_DRUG_STEAL[ START_MISSION[index][ems_SPECIAL_INDEX] ][1],
                                    Float:z = INIT_DRUG_STEAL[ START_MISSION[index][ems_SPECIAL_INDEX] ][2]
                                ;

                                x = ( x + ( float_random( 20.0 ) - mathfrandom( -20.0, 20.0 ) ) );
	                            y = ( y + ( float_random( 20.0 ) - mathfrandom( -20.0, 20.0 ) ) );

                                CA_FindZ_For2DCoord(x, y, z);

                                FCNPC_SetPosition(
                                    SWEET_DEALERS[i][sd_ID],
                                    x,
                                    y,
                                    z + 0.3
                                );
                                FCNPC_SetAngle(SWEET_DEALERS[i][sd_ID], mathfrandom(10.0, 180.0));

                                FCNPC_SetWeapon(SWEET_DEALERS[i][sd_ID], DEALER_WEAPONS[ random(sizeof(DEALER_WEAPONS))]);
                                FCNPC_SetAmmo(SWEET_DEALERS[i][sd_ID], 9999);
                                FCNPC_UseInfiniteAmmo(SWEET_DEALERS[i][sd_ID], true);

                                FCNPC_SetVirtualWorld(SWEET_DEALERS[i][sd_ID], 0);
                                FCNPC_SetInvulnerable(SWEET_DEALERS[i][sd_ID], false);
                                FCNPC_AimAtPlayer(SWEET_DEALERS[i][sd_ID], playerid, true, 1000);
                            }

                            if (FCNPC_IsSpawned(SWEET_DEALERS[i][sd_ID]) && !FCNPC_IsDead(SWEET_DEALERS[i][sd_ID]))
                                SetPlayerMarkerForPlayer(playerid, SWEET_DEALERS[i][sd_ID], 0xCB2828FF);
                            
                            SetPlayerColor(SWEET_DEALERS[i][sd_ID], 0xCB2828FF);
                        }

                        SetPlayer_GPS_Checkpoint(
                            playerid,
                            INIT_DRUG_STEAL[ START_MISSION[index][ems_SPECIAL_INDEX] ][0],
                            INIT_DRUG_STEAL[ START_MISSION[index][ems_SPECIAL_INDEX] ][1],
                            INIT_DRUG_STEAL[ START_MISSION[index][ems_SPECIAL_INDEX] ][2],
                            0, 0
                        );

                        new city[45], zone[45];
	                    GetPointZone(
                            INIT_DRUG_STEAL[ START_MISSION[index][ems_SPECIAL_INDEX] ][0],
                            INIT_DRUG_STEAL[ START_MISSION[index][ems_SPECIAL_INDEX] ][1],
                            city, zone
                        );
                        
                        ShowPlayerMessage(playerid, sprintf("Roba la ~b~cocaina~w~ de los Ballas en %s.", zone), 20);
                    }
                }
            }
        }
    }
    return 1;
}