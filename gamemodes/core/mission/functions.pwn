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
    }

    // Init NPC AI Process
    SetTimer("NPC_Update", 30000, true); // 30 seconds
    return 1;
}

CheckMissionPlace(playerid)
{
    new area = IsPlayerInAnyDynamicArea(playerid);

    if (area)
    {
        new info[2];
        Streamer_GetArrayData(STREAMER_TYPE_AREA, PLAYER_TEMP[playerid][py_LAST_AREA], E_STREAMER_EXTRA_ID, info);

        new
            type = info[0],
            index = info[1]
        ;

        if (type == KEY_TYPE_MISSION)
        {
            // Init
            new players_in_mission;

            PLAYER_TEMP[playerid][py_IN_MISSION] = true;
            PLAYER_TEMP[playerid][py_MISSION] = index;

            // Enter message
            for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
            {
                if (!IsPlayerConnected(i)) continue;
                if (PLAYER_TEMP[i][py_IN_MISSION] && PLAYER_TEMP[i][py_MISSION] == index)
                {
                    ShowPlayerMessage(i, sprintf("%s se ha unido a la misión.", PLAYER_TEMP[playerid][py_NAME]),  4);
                    players_in_mission ++;
                }
            }

            if (players_in_mission > 1) START_MISSION[index][ems_TYPE] = random(START_MISSION[index][ems_MAX_MISSIONS]);

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
                                FCNPC_SetWeapon(SWEET_DEALERS[i][sd_ID], DEALER_WEAPONS[ random(sizeof(DEALER_WEAPONS))]);
	                            FCNPC_SetAmmo(SWEET_DEALERS[i][sd_ID], 9999);

                                FCNPC_SetVirtualWorld(SWEET_DEALERS[i][sd_ID], 0);

                                NPC_Update();

                                SetPlayerMarkerForPlayer(playerid, SWEET_DEALERS[i][sd_ID], 0xCB2828FF);
                                SetPlayerColor(SWEET_DEALERS[i][sd_ID], 0xCB2828FF);
                            }
                            
                            ShowPlayerMessage(playerid, "Elimina a los ~r~Dealers~w~ colados en el barrio.", 5);
                        }
                    }
                }
            }
        }
    }
    return 1;
}