forward FirstGay();
public FirstGay()
{
	initial_lgbt = INVALID_PLAYER_ID;

	while(initial_lgbt == INVALID_PLAYER_ID)
	{
		for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
		{
			if (IsPlayerConnected(i))
			{
				if (PLAYER_MISC[i][MISC_GAMEMODE] == 2)
				{
					new rand = random(10);
					if (rand == 7)
					{
						is_lgbt[i] = true;
						initial_lgbt = i;
					}
					break;
				}
			}
		}
	}

	SetPlayerSkin(initial_lgbt, 252);
	ShowPlayerAlert(initial_lgbt, "Homosexual!", 0xe562e7FF, 4);
	GivePlayerReputation(initial_lgbt, 2, false);
	GiveGoldIngot(initial_lgbt, 5);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_MISC[i][MISC_GAMEMODE] == 2)
			{
				new str_text[128];
				format(str_text, sizeof(str_text), "Alejense de %s, es el ~p~Homosexual~w~!", PLAYER_TEMP[initial_lgbt][py_NAME]);
				ShowPlayerNotification(i, str_text);
			}
		}
	}
	return 1;
}

forward ChangeLgbtMap();
public ChangeLgbtMap()
{
	lgbt_map_index = random(sizeof(LGBT_MAPS));

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_MISC[i][MISC_GAMEMODE] == 2)
			{
				new str_text[128];
				format(str_text, sizeof(str_text), "El mapa se va a cambiar en 30 segundos, siguiente mapa: ~y~%s", LGBT_MAPS[lgbt_map_index][lm_NAME]);
				ShowPlayerNotification(i, str_text);
			}
		}
	}

	initial_lgbt = INVALID_PLAYER_ID;
	SetTimer("NextLgbtMap", 30000, false);
	return 1;
}

forward NextLgbtMap();
public NextLgbtMap()
{
	KillTimer(lgbt_timers[0]);
	lgbt_timers[0] = SetTimer("ChangeLgbtMap", 600000, false);

	lgtb_players = 0;
	lgbt_started = false;

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_MISC[i][MISC_GAMEMODE] == 2)
			{
				PlayerExitGamemode(i, false);

				minigames_page[i] = 2;
				PlayerJoinGamemode(i, false);
			}
		}
	}	
	return 1;
}