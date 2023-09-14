forward DisableRefMark(playerid);
public DisableRefMark(playerid)
{
	#if DEBUG_MODE == 1
		printf("DisableRefMark"); // debug juju
	#endif

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][43]);
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][38]);

    new city[45], zone[45];
    GetPlayerZones(playerid, city, zone);
    new message[144];
    format(message, sizeof message, "~b~%s~w~ se perdió (%s).", PLAYER_TEMP[playerid][py_RP_NAME], zone);
    SendPoliceNotification(message, 6);
    SetPlayerColorEx(playerid, PLAYER_COLOR);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if (IsPlayerConnected(i))
        {
            if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
            {
                if (PLAYER_WORKS[i][WORK_POLICE])
                {
                    if (PLAYER_TEMP[i][py_WORKING_IN] == WORK_POLICE)
                    {
                        SetPlayerMarkerForPlayer(i, playerid, 0x6060FF00);
                        SetPlayerColorEx(playerid, 0x6060FF00);
                    }
                }
            }
        }
    }
    return 1;
}

forward UpdateWantedLevelMark();
public UpdateWantedLevelMark()
{
    #if DEBUG_MODE == 1
        printf("UpdateWantedLevelMark"); // debug juju
    #endif

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if (IsPlayerConnected(i))
        {
            if (PLAYER_MISC[i][MISC_SEARCH_LEVEL] > 0)
            {
                SendPoliceMark(i, 0xCB2828FF);
            }

            if (PLAYER_TEMP[i][py_CUFFED] == true)
            {
                SendPoliceMark(i, 0x2DAA24FF);
            }
        }
    }
    return 1;
}