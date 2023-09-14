StartMining(playerid, rock_id)
{
	new p_interior = GetPlayerInterior(playerid);
	if (p_interior < 25 || p_interior > 27) return 0;

	new str_text[64];
	ApplyAnimation(playerid, "SWORD", "SWORD_4", 4.1, true, false, false, false, 0, true);
	
	format(str_text, sizeof(str_text), "Picando %s...~n~~r~0 %", GetRockNameType(ROCKS_OBJ[rock_id][r_TYPE]));
	ShowPlayerMessage(playerid, str_text, 2);

	TogglePlayerControllableEx(playerid, false);
	
	ROCKS_OBJ[rock_id][r_ACTIVATED] = false;
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][35]);
	PLAYER_TEMP[playerid][py_TIMERS][35] = SetTimerEx("UpdateMining", GetRockMiningTime(ROCKS_OBJ[rock_id][r_TYPE]), true, "ii", playerid, rock_id);
	ApplyAnimation(playerid, "SWORD", "SWORD_4", 4.1, true, false, false, false, 0, true);
	SetTimerEx("RespawnMinerRock", 60000, false, "i", rock_id);
	return 1;
}

GetRockColorType(rock_type)
{
	new rock_color = 0xFFFFFFFF;

	switch(rock_type)
	{
		case 0: rock_color = 0xFF000000; // Carbon
		case 1: rock_color = 0xFFffff00; // Azufre
		case 2: rock_color = 0xFFcfcfcf; // Hierro
		case 3: rock_color = 0xFFffae00; // Jaspe
		case 4: rock_color = 0xFFff0000; // Ruby
		case 5: rock_color = 0xFF59ff00; // Esmeralda
		case 6: rock_color = 0xFFf5d80b; // Oro
		case 7: rock_color = 0xFFe30bf5; // Cuarzo
		case 8: rock_color = 0xFF0bf5ea; // Diamante
		case 9: rock_color = 0xFF0bf5ea; // Bismuto
		case 10: rock_color = 0xFF0042ff; // Lapislázuli
		case 11: rock_color = 0xFFeceff8; // Platino
	}
	return rock_color;
}

PayPlayerMiner(playerid)
{
	new pay = 50;

	switch(PLAYER_TEMP[playerid][py_ACTUAL_ROCK])
	{
		case 0: pay = 80;
		case 1: pay = 76;
		case 2: pay = 95;
		case 3: pay = 100;
		case 4: pay = 120;
		case 5: pay = 450;
		case 6: pay = 250;
		case 7: pay = 300;
		case 8: pay = 550;
		case 9: pay = 180;
		case 10: pay = 320;
		case 11: pay = 400;	
	}

	if (ACCOUNT_INFO[playerid][ac_SU]) pay += minrand(200, 500);

	GivePlayerCash(playerid, pay);
	
	PLAYER_SKILLS[playerid][WORK_MINER] ++;
	SavePlayerSkills(playerid);

	if (random(2) == 1) GivePlayerReputation(playerid);
	return 1;
}

DropPlayerRock(playerid, place_id)
{
	for(new i = 0; i != sizeof ROCK_PROCESSOR; i ++)
	{
		if (IsPlayerInRangeOfPoint(playerid, 3.0, ROCK_PROCESSOR[i][rp_X], ROCK_PROCESSOR[i][rp_Y], ROCK_PROCESSOR[i][rp_Z]))
		{
			new obj_id = CreateDynamicObject(
												3930,
												(DROP_ROCK_POS[ place_id ][mp_X] + 0.1760),
												(DROP_ROCK_POS[ place_id ][mp_Y] + 0.4369),
												(DROP_ROCK_POS[ place_id ][mp_Z] - 0.3),
												0.0000,
												0.0000,
												30.5999,
												GetPlayerVirtualWorld(playerid),
												GetPlayerInterior(playerid)
											);

			SetDynamicObjectMaterial(obj_id, 0, -1, "none", "none", GetRockColorType(PLAYER_TEMP[playerid][py_ACTUAL_ROCK]));

			MoveDynamicObject(
								obj_id,
								ROCK_PROCESSOR[i][rp_X],
								ROCK_PROCESSOR[i][rp_Y],
								ROCK_PROCESSOR[i][rp_Z] - 1.0,
								1.8,
								0.0000,
								0.0000,
								30.5999 + 190.0
							);

			SetTimerEx("DeleteDroppedRock", 3000, false, "i", obj_id);
			break;
		}
	}
	return 1;
}

GetRockMiningTime(rock_type)
{
	switch(rock_type)
	{
		case 0: return 990;
		case 1: return 900;
		case 2: return 1050;
		case 3: return 1000;
		case 4: return 800;
		case 5: return 1500;
		case 6: return 850;
		case 7: return 1000;
		case 8: return 1500;
		case 9: return 1300;
		case 10: return 500;
		case 11: return 800;
	}
	return 1000;
}

GetRockNameType(rock_type)
{
	new rock_name[32];

	switch(rock_type)
	{
		case 0: rock_name = "Carbón";
		case 1: rock_name = "Azufre";
		case 2: rock_name = "Hierro";
		case 3: rock_name = "Jaspe";
		case 4: rock_name = "Ruby";
		case 5: rock_name = "Esmeralda";
		case 6: rock_name = "Oro";
		case 7: rock_name = "Cuarzo";
		case 8: rock_name = "Diamante";
		case 9: rock_name = "Bismuto";
		case 10: rock_name = "Lapislázuli";
		case 11: rock_name = "Platino";
	}
	return rock_name;
}

GetRockMineType(rock_type)
{
	switch(rock_type)
	{
		case 0..2: return 0;
		case 3..7: return 1;
		case 8..11: return 2;
	}
	return 0;
}

SetRandomRockType(index)
{
	switch(GetRockMineType(ROCKS_OBJ[index][r_TYPE]))
	{
		case 0: ROCKS_OBJ[index][r_TYPE] = minrand(0, 3);
		case 1: ROCKS_OBJ[index][r_TYPE] = minrand(4, 8);
		case 2: ROCKS_OBJ[index][r_TYPE] = minrand(8, 12);
		default: ROCKS_OBJ[index][r_TYPE] = minrand(0, 3);
	}
}

CreateMinerRocks()
{
	for(new i = 0; i < sizeof ROCKS_OBJ; i ++)
	{
		SetRandomRockType(i);

		ROCKS_OBJ[i][r_OBJECT_ID] = CreateDynamicObject(ROCKS_OBJ[i][r_MODELID], ROCKS_OBJ[i][r_X], ROCKS_OBJ[i][r_Y], ROCKS_OBJ[i][r_Z], ROCKS_OBJ[i][r_RX], ROCKS_OBJ[i][r_RY], ROCKS_OBJ[i][r_RZ], ROCKS_OBJ[i][r_WORLD], ROCKS_OBJ[i][r_INTERIOR]);
		new color_type = GetRockColorType(ROCKS_OBJ[i][r_TYPE]);

		// Test
		new str_text[32];
		format(str_text, sizeof(str_text), "{ffffff}%s", GetRockNameType(ROCKS_OBJ[i][r_TYPE]));
		CreateDynamic3DTextLabel(str_text, 0xF7F7F700, ROCKS_OBJ[i][r_X], ROCKS_OBJ[i][r_Y], ROCKS_OBJ[i][r_Z] + 1.0, 10.0, .testlos = true, .worldid = ROCKS_OBJ[i][r_WORLD], .interiorid = ROCKS_OBJ[i][r_INTERIOR]);

		SetDynamicObjectMaterial(ROCKS_OBJ[i][r_OBJECT_ID], 0, -1, "none", "none", color_type);
		ROCKS_OBJ[i][r_ACTIVATED] = true;
	}
	return 1;
}