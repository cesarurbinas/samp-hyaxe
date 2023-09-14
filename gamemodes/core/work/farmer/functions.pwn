GrabPlant(playerid)
{
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 0;

	for(new i = 0; i != MAX_PLANTS; i ++)
	{
		if (!PLANTS[i][plant_VALID] || PLANTS[i][plant_GROWING]) continue;

		new Float:x, Float:y, Float:z;
		GetDynamicObjectPos(PLANTS[i][plant_OBJECT_ID], x, y, z);
		if (IsPlayerInRangeOfPoint(playerid, 1.5, x, y, z))
		{
			if (PLANTS[i][plant_PLANTED_BY_ACCOUNT_ID] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~Esta planta no es tuya", 3);

			KillTimer(PLANTS[i][plant_TIMER]);
			switch(seed_info[ PLANTS[i][plant_TYPE] ][seed_info_PLANT_TYPE])
			{
				case PLANT_TYPE_MEDICINE:
				{
					PLAYER_MISC[playerid][MISC_MEDICINE] += 10;
					ShowPlayerNotification(playerid, "~g~+10~w~ medicamentos", 4);
					SavePlayerMisc(playerid);
				}
				case PLANT_TYPE_CANNABIS:
				{
					PLAYER_MISC[playerid][MISC_CANNABIS] += 10;
					ShowPlayerNotification(playerid, "~g~+10~w~ marihuana", 4);
					SavePlayerMisc(playerid);
				}
				case PLANT_TYPE_CRACK:
				{
					PLAYER_MISC[playerid][MISC_CRACK] += 10;
					ShowPlayerNotification(playerid, "~g~+10~w~ crack", 4);
				    SavePlayerMisc(playerid);
				}
			}

			DestroyDynamicObject(PLANTS[i][plant_OBJECT_ID]);
			DestroyDynamic3DTextLabel(PLANTS[i][plant_LABEL_ID]);
			ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, 0, 1, 1, 0, 0, 1);

			new tmp_PLANTS[PLANTS_ENUM]; PLANTS[i] = tmp_PLANTS;
			return 1;
		}
	}

	return 1;
}

StartPlanting(playerid, type)
{
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No estás depie.", 3);
	if (PLAYER_TEMP[playerid][py_PLANTING]) return ShowPlayerMessage(playerid, "~r~Ya estas plantado algo.", 3);

	new str_text[128];

	if (gettime() < PLAYER_TEMP[playerid][py_LAST_PLANT_TIME] + 5)
	{
		new time = (60-(gettime()-PLAYER_TEMP[playerid][py_LAST_PLANT_TIME]));
		format(str_text, sizeof(str_text), "Tienes que esperar %s minutos para volver a plantar.", TimeConvert(time));
		ShowPlayerMessage(playerid, str_text, 4);
		return 1;
	}

	if (GetPlayerPlantedPlants(playerid) > 25) return ShowPlayerMessage(playerid, "~r~Tienes muchas plantas, recógelas para seguir", 4);

	for(new i = 0; i != MAX_PLANTS; i ++)
	{
		if (!PLANTS[i][plant_VALID]) continue;

		new Float:x, Float:y, Float:z;
		GetDynamicObjectPos(PLANTS[i][plant_OBJECT_ID], x, y, z);
		if (IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z))
		{
			ShowPlayerMessage(playerid, "Aquí ya hay una planta, aléjate un poco para plantar.", 4);
			return 1;
		}
	}

	switch(seed_info[type][seed_info_PLANT_TYPE])
	{
		case PLANT_TYPE_MEDICINE:
		{
			if (plant_info[type][plant_info_SEEDS] > PLAYER_MISC[playerid][MISC_SEED_MEDICINE])
			{
				ShowPlayerMessage(playerid, "~r~No tienes las semillas necesarias para plantar esta planta.", 3);
				return 1;
			}
			PLAYER_MISC[playerid][MISC_SEED_MEDICINE] -= plant_info[type][plant_info_SEEDS];
		}
		case PLANT_TYPE_CANNABIS:
		{
			if (plant_info[type][plant_info_SEEDS] > PLAYER_MISC[playerid][MISC_SEED_CANNABIS])
			{
				ShowPlayerMessage(playerid, "~r~No tienes las semillas necesarias para plantar esta planta.", 3);
				return 1;
			}
			PLAYER_MISC[playerid][MISC_SEED_CANNABIS] -= plant_info[type][plant_info_SEEDS];
		}
		case PLANT_TYPE_CRACK:
		{
			if (plant_info[type][plant_info_SEEDS] > PLAYER_MISC[playerid][MISC_SEED_CRACK])
			{
				ShowPlayerMessage(playerid, "~r~No tienes las semillas necesarias para plantar esta planta.", 3);
				return 1;
			}
			PLAYER_MISC[playerid][MISC_SEED_CRACK] -= plant_info[type][plant_info_SEEDS];
		}
	}

	format(str_text, sizeof(str_text), "Estas plantando %s, has gastado %d semillas.", plant_info[type][plant_info_NAME], plant_info[type][plant_info_SEEDS]);
	ShowPlayerNotification(playerid, str_text, 5);

	PLAYER_TEMP[playerid][py_LAST_PLANT_TIME] = gettime();
	PLAYER_TEMP[playerid][py_PLANTING_PLANT_SELECTED] = type;
	PLAYER_TEMP[playerid][py_PLANTING] = true;
	PLAYER_TEMP[playerid][py_PLANTING_PROGRESS] = minrand(0, 5);
	UpdatePlantSizeTextdrawPlant(playerid);

	TogglePlayerControllableEx(playerid, false);
	SetCameraBehindPlayer(playerid);
	ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.1, true, false, false, false, 0);

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][12]);
	PLAYER_TEMP[playerid][py_TIMERS][12] = SetTimerEx("PlantingUp", 1000, false, "id", playerid, plant_info[type][plant_info_SEEDS]);
	return 1;
}

UpdatePlantSizeTextdrawPlant(playerid)
{
	new str_text[64];
	format(str_text, sizeof(str_text), "Plantando ~g~%d %", PLAYER_TEMP[playerid][py_PLANTING_PROGRESS]);
	ShowPlayerMessage(playerid, str_text, 2);
	return 1;
}

CancelPlayerPlanting(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][12]);
	PLAYER_TEMP[playerid][py_PLANTING] = false;
	PLAYER_TEMP[playerid][py_PLANTING_PROGRESS] = 0;

	TogglePlayerControllableEx(playerid, true);
	ClearAnimations(playerid);
	return 1;
}

GetAvaiblePlantIndex()
{
	for(new i = 0; i != sizeof PLANTS; i ++)
	{
		if (!PLANTS[i][plant_VALID]) return i;
	}
	return -1;
}