forward RespawnMinerRock(rock_id);
public RespawnMinerRock(rock_id)
{
	Logger_Debug("RespawnMinerRock"); // This is a debug line!

	SetRandomRockType(rock_id);

	new color_type = GetRockColorType(ROCKS_OBJ[rock_id][r_TYPE]);
	ROCKS_OBJ[rock_id][r_OBJECT_ID] = CreateDynamicObject(ROCKS_OBJ[rock_id][r_MODELID], ROCKS_OBJ[rock_id][r_X], ROCKS_OBJ[rock_id][r_Y], ROCKS_OBJ[rock_id][r_Z], ROCKS_OBJ[rock_id][r_RX], ROCKS_OBJ[rock_id][r_RY], ROCKS_OBJ[rock_id][r_RZ], ROCKS_OBJ[rock_id][r_WORLD], ROCKS_OBJ[rock_id][r_INTERIOR]);
	SetDynamicObjectMaterial(ROCKS_OBJ[rock_id][r_OBJECT_ID], 0, -1, "none", "none", color_type);
	ROCKS_OBJ[rock_id][r_ACTIVATED] = true;
	return 1;
}

forward PutPlayerRock(playerid, rock_type);
public PutPlayerRock(playerid, rock_type)
{
	Logger_Debug("PutPlayerRock"); // This is a debug line!

	ResetItemBody(playerid);

	PLAYER_TEMP[playerid][py_ROCK] = true;
	PLAYER_TEMP[playerid][py_ACTUAL_ROCK] = rock_type;

	SetPlayerAttachedObject(playerid, 9, 3930, 1, 0.1760, 0.4369, 0.0000, 0.0000, 0.0000, 30.5999, 0.5240, 0.5149, 0.6189, GetRockColorType(rock_type), -1);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	return 1;
}

forward UpdateMining(playerid, rock_id);
public UpdateMining(playerid, rock_id)
{
	Logger_Debug("UpdateMining"); // This is a debug line!

	if (GetPlayerInterior(playerid) == 0)
	{
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][35]);
		return 0;
	}

	new str_text[64];
	PLAYER_TEMP[playerid][py_MINING_PROGRESS] += minrand(1, 5);

	format(str_text, sizeof(str_text), "Picando %s...~n~~r~%d %", GetRockNameType(ROCKS_OBJ[rock_id][r_TYPE]), PLAYER_TEMP[playerid][py_MINING_PROGRESS]);
	ShowPlayerMessage(playerid, str_text, 2);
	ApplyAnimation(playerid, "SWORD", "SWORD_4", 4.1, true, false, false, false, 0, true);

	if (PLAYER_TEMP[playerid][py_MINING_PROGRESS] > 98)
	{
		ShowPlayerMessage(playerid, "Ve a una ~r~procesadora~w~ para entregar el material.", 4);

		ClearAnimations(playerid);
		TogglePlayerControllableEx(playerid, true);

		PLAYER_TEMP[playerid][py_MINING_PROGRESS] = 0;
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][35]);

		SetTimerEx("PutPlayerRock", 800, false, "id", playerid, ROCKS_OBJ[rock_id][r_TYPE]);
		ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.1, false, false, false, false, 0, false);

		DestroyDynamicObject(ROCKS_OBJ[rock_id][r_OBJECT_ID]);
	}
	return 1;
}

forward DeleteDroppedRock(obj_id);
public DeleteDroppedRock(obj_id)
{
	Logger_Debug("DeleteDroppedRock"); // This is a debug line!

	DestroyDynamicObject(obj_id);
	return 1;
}

forward FixProcessorUpdate(playerid, processor_id, type);
public FixProcessorUpdate(playerid, processor_id, type)
{
	Logger_Debug("FixProcessorUpdate"); // This is a debug line!

	switch(type)
	{
		case 0:
		{
			if (ROCK_PROCESSOR[processor_id][rp_FUEL] < 100.0)
			{
				ROCK_PROCESSOR[processor_id][rp_FUEL] += float(5 + minrand(1, 8));
				if (ROCK_PROCESSOR[processor_id][rp_FUEL] > 100.0) ROCK_PROCESSOR[processor_id][rp_FUEL] = 100.0;

				ApplyAnimation(playerid, "COP_AMBIENT", "COPBROWSE_NOD", 4.1, true, false, false, false, 0, false);
				
				new str_text[64];
				format(str_text, sizeof(str_text), "Cargando gasolina ~r~%.1f%", ROCK_PROCESSOR[processor_id][rp_FUEL]);
				ShowPlayerMessage(playerid, str_text, 2);

				if (ROCK_PROCESSOR[processor_id][rp_FUEL] > 99)
				{
					ShowPlayerMessage(playerid, "Cargando gasolina ~r~100%", 2);
					KillTimer(PLAYER_TEMP[playerid][py_TIMERS][32]);
					ClearAnimations(playerid);
					ResetItemBody(playerid);
					ROCK_PROCESSOR[processor_id][rp_REPAIR] = false;
					PayPlayerProcessor(playerid, processor_id);
				}
			}
		}
		case 1:
		{
			if (ROCK_PROCESSOR[processor_id][rp_HEALTH] < 100.0)
			{
				ROCK_PROCESSOR[processor_id][rp_HEALTH] += float(5 + minrand(1, 8));
				if (ROCK_PROCESSOR[processor_id][rp_HEALTH] > 100.0) ROCK_PROCESSOR[processor_id][rp_HEALTH] = 100.0;

				ApplyAnimation(playerid, "COP_AMBIENT", "COPBROWSE_NOD", 4.1, true, false, false, false, 0, false);
				
				new str_text[64];
				format(str_text, sizeof(str_text), "Reparando ~r~%.1f%", ROCK_PROCESSOR[processor_id][rp_HEALTH]);
				ShowPlayerMessage(playerid, str_text, 2);

				if (ROCK_PROCESSOR[processor_id][rp_HEALTH] > 99)
				{
					ShowPlayerMessage(playerid, "Reparando ~r~100%", 2);
					KillTimer(PLAYER_TEMP[playerid][py_TIMERS][32]);
					ClearAnimations(playerid);
					ResetItemBody(playerid);
					ROCK_PROCESSOR[processor_id][rp_REPAIR] = false;
					PayPlayerProcessor(playerid, processor_id);
				}
			}
		}
	}

	UpdateRockProcessorLabel(processor_id);
	return 1;
}