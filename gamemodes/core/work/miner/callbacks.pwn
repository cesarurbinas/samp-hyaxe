forward RespawnMinerRock(rock_id);
public RespawnMinerRock(rock_id)
{
	#if DEBUG_MODE == 1
		printf("RespawnMinerRock"); // debug juju
	#endif

	SetRandomRockType(index);

	new color_type = GetRockColorType(ROCKS_OBJ[rock_id][r_TYPE]);
	ROCKS_OBJ[rock_id][r_OBJECT_ID] = CreateDynamicObject(ROCKS_OBJ[rock_id][r_MODELID], ROCKS_OBJ[rock_id][r_X], ROCKS_OBJ[rock_id][r_Y], ROCKS_OBJ[rock_id][r_Z], ROCKS_OBJ[rock_id][r_RX], ROCKS_OBJ[rock_id][r_RY], ROCKS_OBJ[rock_id][r_RZ], ROCKS_OBJ[rock_id][r_WORLD], ROCKS_OBJ[rock_id][r_INTERIOR]);
	SetDynamicObjectMaterial(ROCKS_OBJ[rock_id][r_OBJECT_ID], 0, -1, "none", "none", color_type);
	ROCKS_OBJ[rock_id][r_ACTIVATED] = true;
	return 1;
}

forward PutPlayerRock(playerid, rock_type);
public PutPlayerRock(playerid, rock_type)
{
	#if DEBUG_MODE == 1
		printf("PutPlayerRock"); // debug juju
	#endif

	ResetItemBody(playerid);

	PLAYER_TEMP[playerid][py_ROCK] = true;
	PLAYER_TEMP[playerid][py_ACTUAL_ROCK] = rock_type;

	SetPlayerAttachedObject(playerid, 9, 3930, 1, 0.1760, 0.4369, 0.0000, 0.0000, 0.0000, 30.5999, 0.5240, 0.5149, 0.6189, hy_ARGBToRGBA(GetRockColorType(ROCKS_OBJ[rock_type][r_TYPE])), hy_ARGBToRGBA(GetRockColorType(ROCKS_OBJ[rock_type][r_TYPE])));
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	return 1;
}

forward UpdateMining(playerid, rock_id);
public UpdateMining(playerid, rock_id)
{
	#if DEBUG_MODE == 1
		printf("UpdateMining"); // debug juju
	#endif

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
	#if DEBUG_MODE == 1
		printf("DeleteDroppedRock"); // debug juju
	#endif

	DestroyDynamicObject(obj_id);
	return 1;
}