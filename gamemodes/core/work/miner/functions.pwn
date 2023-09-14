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
	
	new time = GetRockMiningTime(ROCKS_OBJ[rock_id][r_TYPE]);
	if (PLAYER_MISC[playerid][MISC_MINER_MULTIPLIER])
	{
		time = (time / 2);
		PLAYER_MISC[playerid][MISC_MINER_MULTIPLIER] -= 1;
	}
	if (time < 300) time = 300;

	PLAYER_TEMP[playerid][py_TIMERS][35] = SetTimerEx("UpdateMining", time, true, "ii", playerid, rock_id);
	
	ApplyAnimation(playerid, "SWORD", "SWORD_4", 4.1, true, false, false, false, 0, true);
	SetTimerEx("RespawnMinerRock", 60000, false, "i", rock_id);
	return 1;
}

GetRockColorType(rock_type)
{
	switch(rock_type)
	{
		case 0: return 0xFF000000; // Carbon
		case 1: return 0xFFffff00; // Azufre
		case 2: return 0xFFcfcfcf; // Hierro
		case 3: return 0xFFffae00; // Jaspe
		case 4: return 0xFFff0000; // Ruby
		case 5: return 0xFF59ff00; // Esmeralda
		case 6: return 0xFFf5d80b; // Oro
		case 7: return 0xFFe30bf5; // Cuarzo
		case 8: return 0xFF0bf5ea; // Diamante
		case 9: return 0xFF0bf5ea; // Bismuto
		case 10: return 0xFF0042ff; // Lapislázuli
		case 11: return 0xFFeceff8; // Platino
		default: return 0xFFFFFFFF;
	}
	return 1;
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

PayPlayerProcessor(playerid, processor_id)
{
	new pay = minrand(500, 1500);

	if (ACCOUNT_INFO[playerid][ac_SU]) pay += minrand(200, 500);

	GivePlayerCash(playerid, pay);
	
	PLAYER_SKILLS[playerid][WORK_MINER] ++;
	SavePlayerSkills(playerid);

	if (random(2) == 1) GivePlayerReputation(playerid);

	new str_text[164];
	format(str_text, sizeof(str_text), "~r~%s~w~ ha reparado la procesadora ~y~#%d~w~.", PLAYER_TEMP[playerid][py_NAME], processor_id);
	ShowPlayerNotificationToRange(playerid, 20.0, str_text, 10);
	return 1;
}

CheckRepairRockProcessor(playerid)
{
	for(new i = 0; i != sizeof ROCK_PROCESSOR; i ++)
	{
		if (IsPlayerInRangeOfPoint(playerid, 4.0, ROCK_PROCESSOR[i][rp_X], ROCK_PROCESSOR[i][rp_Y], ROCK_PROCESSOR[i][rp_Z]))
		{
			if (ROCK_PROCESSOR[i][rp_FUEL] <= 0.0 || ROCK_PROCESSOR[i][rp_HEALTH] <= 0.0)
			{
				if (ROCK_PROCESSOR[i][rp_REPAIR]) return ShowPlayerMessage(playerid, "~r~Otro usuario ya se encuentra reparando la procesadora.", 4);
				
				ROCK_PROCESSOR[i][rp_REPAIR] = true;
				ResetItemBody(playerid);

				PLAYER_TEMP[playerid][py_ROCK] = false;
				PLAYER_TEMP[playerid][py_MINING] = false;
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
				ApplyAnimation(playerid, "CARRY", "PUTDWN", 4.1, false, false, false, false, 0, false);
				RemovePlayerAttachedObject(playerid, 9);

				SetPlayerChatBubble(playerid, "\n\n\n\n* Se pone a reparar la procesadora.\n\n\n", 0xffcb90FF, 20.0, 5000);
				KillTimer(PLAYER_TEMP[playerid][py_TIMERS][32]);

				if (ROCK_PROCESSOR[i][rp_FUEL] <= 0.0)
				{
					PLAYER_TEMP[playerid][py_TIMERS][32] = SetTimerEx("FixProcessorUpdate", 1000, true, "iid", playerid, i, 0);
				}
				else PLAYER_TEMP[playerid][py_TIMERS][32] = SetTimerEx("FixProcessorUpdate", 1000, true, "iid", playerid, i, 1);
			}
			break;
		}
	}
	return 1;
}

DropPlayerRock(playerid, place_id)
{
	for(new i = 0; i != sizeof ROCK_PROCESSOR; i ++)
	{
		if (IsPlayerInRangeOfPoint(playerid, 4.0, ROCK_PROCESSOR[i][rp_X], ROCK_PROCESSOR[i][rp_Y], ROCK_PROCESSOR[i][rp_Z]))
		{
			if (ROCK_PROCESSOR[i][rp_FUEL] <= 0.0 || ROCK_PROCESSOR[i][rp_HEALTH] <= 0.0) return 0;
			
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

			// Update proccessor usage
			ROCK_PROCESSOR[i][rp_FUEL] -= float(minrand(1, 6));
			ROCK_PROCESSOR[i][rp_HEALTH] -= float(minrand(1, 3));
			
			UpdateRockProcessorLabel(i);
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

UpdateRockProcessorLabel(processor_id)
{
	if (ROCK_PROCESSOR[processor_id][rp_FUEL] <= 0.0) ROCK_PROCESSOR[processor_id][rp_FUEL] = 0.0;
	if (ROCK_PROCESSOR[processor_id][rp_HEALTH] <= 0.0) ROCK_PROCESSOR[processor_id][rp_HEALTH] = 0.0;

	new str_text[164];
	format(str_text, sizeof(str_text), ""COL_RED"Procesadora #%d\n"COL_WHITE"Suelta los materiales aqui.\n\nGasolina: %.1f\nEstado: %.1f%", processor_id, ROCK_PROCESSOR[processor_id][rp_FUEL], ROCK_PROCESSOR[processor_id][rp_HEALTH]);
	printf("update 1: %s", str_text);
	if (ROCK_PROCESSOR[processor_id][rp_FUEL] <= 0.0) strcat(str_text, "\n"COL_YELLOW"Requiere gasolina");
	if (ROCK_PROCESSOR[processor_id][rp_HEALTH] <= 0.0) strcat(str_text, "\n"COL_YELLOW"Requiere reparación");
	printf("update 2: %s", str_text);
	UpdateDynamic3DTextLabelText(ROCK_PROCESSOR[processor_id][rp_LABEL], 0xF7F7F7FF, str_text);
	return 1;
}

CreateMinerRocks()
{
	for(new i = 0; i != sizeof ROCK_PROCESSOR; i ++)
	{
		ROCK_PROCESSOR[i][rp_FUEL] = float(minrand(2, 10));
		ROCK_PROCESSOR[i][rp_HEALTH] = float(minrand(2, 10));

		#if defined FINAL_BUILD
			ROCK_PROCESSOR[i][rp_FUEL] = float(minrand(10, 100));
			ROCK_PROCESSOR[i][rp_HEALTH] = float(minrand(10, 100));
		#endif

		new str_text[164];
		format(str_text, sizeof(str_text), ""COL_RED"Procesadora #%d\n"COL_WHITE"Suelta los materiales aqui­.\n\nGasolina: %.1f\nEstado: %.1f%", i, ROCK_PROCESSOR[i][rp_FUEL], ROCK_PROCESSOR[i][rp_HEALTH]);
		//printf("create 1: %s", str_text);
		ROCK_PROCESSOR[i][rp_LABEL] = CreateDynamic3DTextLabel(str_text, 0xF7F7F7FF, ROCK_PROCESSOR[i][rp_X], ROCK_PROCESSOR[i][rp_Y], ROCK_PROCESSOR[i][rp_Z] + 4.0, 35.0, .testlos = true, .worldid = -1, .interiorid = -1);
	}

	for(new i = 0; i < sizeof ROCKS_OBJ; i ++)
	{
		SetRandomRockType(i);

		ROCKS_OBJ[i][r_OBJECT_ID] = CreateDynamicObject(ROCKS_OBJ[i][r_MODELID], ROCKS_OBJ[i][r_X], ROCKS_OBJ[i][r_Y], ROCKS_OBJ[i][r_Z], ROCKS_OBJ[i][r_RX], ROCKS_OBJ[i][r_RY], ROCKS_OBJ[i][r_RZ], ROCKS_OBJ[i][r_WORLD], ROCKS_OBJ[i][r_INTERIOR]);
		new color_type = GetRockColorType(ROCKS_OBJ[i][r_TYPE]);

		/*new str_text[32];
		format(str_text, sizeof(str_text), "{ffffff}%s", GetRockNameType(ROCKS_OBJ[i][r_TYPE]));
		CreateDynamic3DTextLabel(str_text, 0xF7F7F700, ROCKS_OBJ[i][r_X], ROCKS_OBJ[i][r_Y], ROCKS_OBJ[i][r_Z] + 1.0, 10.0, .testlos = true, .worldid = ROCKS_OBJ[i][r_WORLD], .interiorid = ROCKS_OBJ[i][r_INTERIOR]);*/

		SetDynamicObjectMaterial(ROCKS_OBJ[i][r_OBJECT_ID], 0, -1, "none", "none", color_type);
		ROCKS_OBJ[i][r_ACTIVATED] = true;
	}
	return 1;
}