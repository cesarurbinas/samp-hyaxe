OpenMafiaDoor(playerid)
{
	new bool:open;
	for(new i = 0; i != sizeof MAFIA_DOORS; i ++)
	{
		switch(MAFIA_DOORS[i][mafia_door_TYPE])
		{
			case DOOR_TYPE_MAFIA:
			{
				if (PLAYER_WORKS[playerid][ MAFIA_DOORS[i][mafia_door_MAFIA] ]) open = true;
			}
			case DOOR_TYPE_USER:
			{
				if (ACCOUNT_INFO[playerid][ac_ID] == MAFIA_DOORS[i][mafia_door_MAFIA]) open = true;
			}
		}

		if (open)
		{
			if (GetPlayerInterior(playerid) != MAFIA_DOORS[i][mafia_door_INTERIOR] || GetPlayerVirtualWorld(playerid) != MAFIA_DOORS[i][mafia_door_WORLD]) continue;
			if (IsDynamicObjectMoving(MAFIA_DOORS[i][mafia_door_OBJECT_ID]) || !MAFIA_DOORS[i][mafia_door_CLOSED]) continue;

			new Float:range = 15.0;
			switch (MAFIA_DOORS[i][mafia_door_MODELID])
			{
				case 19861: range = 3.0;
				case 974: range = 5.0;
				case 1495: range = 2.0;
			}

			if (IsPlayerInRangeOfPoint(playerid, range, MAFIA_DOORS[i][mafia_door_X], MAFIA_DOORS[i][mafia_door_Y], MAFIA_DOORS[i][mafia_door_Z]))
			{
				KillTimer(MAFIA_DOORS[i][mafia_door_TIMER]);
				MAFIA_DOORS[i][mafia_door_TIMER] = SetTimerEx("CloseMafiaDoor", 10000, false, "i", i);

				new Float:distance = 15.0;
				if (MAFIA_DOORS[i][mafia_door_MODELID] == 8378)
					distance = 50.0;

				MoveDynamicObject(MAFIA_DOORS[i][mafia_door_OBJECT_ID], MAFIA_DOORS[i][mafia_door_X], MAFIA_DOORS[i][mafia_door_Y], MAFIA_DOORS[i][mafia_door_Z] - distance, 2.0, 0.0, 0.0, MAFIA_DOORS[i][mafia_door_RZ]);
				MAFIA_DOORS[i][mafia_door_CLOSED] = false;
			}
		}
	}
	return 1;
}