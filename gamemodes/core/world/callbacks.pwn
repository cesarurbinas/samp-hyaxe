new GraffitiLastInit;

forward UpdateThePutis();
public UpdateThePutis()
{
	//Logger_Debug("UpdateThePutis"); // This is a debug line!

	ApplyDynamicActorAnimation(Club_Bar_Actor[0], "BAR", "BARman_idle", 4.1, 1, 0, 0, 0, 0);
    ApplyDynamicActorAnimation(Club_Bar_Actor[1], "BAR", "BARman_idle", 4.1, 1, 0, 0, 0, 0);
    ApplyDynamicActorAnimation(Club_Bar_Actor[2], "BAR", "BARman_idle", 4.1, 1, 0, 0, 0, 0);

	new
		strip_anim = random(sizeof(RandomStripAnimations)),
		stripper = random(sizeof(Club_Strippers_Actor));

	ApplyDynamicActorAnimation(Club_Strippers_Actor[stripper], "STRIP", RandomStripAnimations[strip_anim], 4.1, 1, 0, 0, 0, 0);


	for(new i = 0; i != sizeof(Club_Actors); i ++)
	{
		ApplyDynamicActorAnimation(Club_Actors[i], "STRIP", RandomPayStripAnimations[random(sizeof(RandomPayStripAnimations))], 4.1, 1, 0, 0, 0, 0);
	}
	return 1;
}

forward UpdateWorldTime();
public UpdateWorldTime()
{
	//Logger_Debug("UpdateWorldTime"); // This is a debug line!

	SERVER_TIME[1] += 2;
	if (SERVER_TIME[1] > 60)
	{
		SERVER_TIME[1] = 0;

		SERVER_TIME[0] ++;
		if (SERVER_TIME[0] > 23) SERVER_TIME[0] = 0;
	}

	SetWorldTime(SERVER_TIME[0]);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_DEAD)
			{
				new p_int = GetPlayerInterior(i);
				
				if (PLAYER_TEMP[i][py_NOCHE_DE_SEXO]) SetPlayerTime(i, 0, 0);
				else SetPlayerTime(i, SERVER_TIME[0], SERVER_TIME[1]);

				switch(p_int)
				{
					case 25..27: SetPlayerTime(i, 2, 2);
				}
			}
		}
	}

	new minute;
	gettime(.minute = minute);
	if (minute == 25)
	{
		if ((gettime() - GraffitiLastInit) >= 120)
		{
			FirstGraffitiAnnounce();
			GraffitiLastInit = gettime();
		}
	}
	return 1;
}