forward PlantingUp(playerid, seeds);
public PlantingUp(playerid, seeds)
{
	#if DEBUG_MODE == 1
		printf("PlantingUp"); // debug juju
	#endif

	if (PLAYER_TEMP[playerid][py_PLANTING_PROGRESS] < 100)
	{
		PLAYER_TEMP[playerid][py_PLANTING_PROGRESS] += minrand(5, 20);
		if (PLAYER_TEMP[playerid][py_PLANTING_PROGRESS] > 100) PLAYER_TEMP[playerid][py_PLANTING_PROGRESS] = 100;

		ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.1, true, false, false, false, 0);
		UpdatePlantSizeTextdrawPlant(playerid);
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][12]);
		PLAYER_TEMP[playerid][py_TIMERS][12] = SetTimerEx("PlantingUp", 1000, false, "id", playerid, seeds);
		return 1;
	}

	PLAYER_TEMP[playerid][py_WORKING_IN] = WORK_NONE;
	PLAYER_TEMP[playerid][py_PLANTING] = false;
	PLAYER_TEMP[playerid][py_PLANTING_PROGRESS] = 0;

	TogglePlayerControllableEx(playerid, true);
	ClearAnimations(playerid);

	//objeto planta: 2244

	new index = GetAvaiblePlantIndex();
	if (index == -1)
	{

		switch(seed_info[ PLAYER_TEMP[playerid][py_PLANTING_PLANT_SELECTED] ][seed_info_PLANT_TYPE])
		{
			case PLANT_TYPE_MEDICINE: PLAYER_MISC[playerid][MISC_SEED_MEDICINE] += plant_info[ PLAYER_TEMP[playerid][py_PLANTING_PLANT_SELECTED] ][plant_info_SEEDS];
			case PLANT_TYPE_CANNABIS: PLAYER_MISC[playerid][MISC_SEED_CANNABIS] += plant_info[ PLAYER_TEMP[playerid][py_PLANTING_PLANT_SELECTED] ][plant_info_SEEDS];
			case PLANT_TYPE_CRACK: PLAYER_MISC[playerid][MISC_SEED_CRACK] += plant_info[ PLAYER_TEMP[playerid][py_PLANTING_PLANT_SELECTED] ][plant_info_SEEDS];
		}

		ShowPlayerMessage(playerid, "~r~No queda espacio para más plantas, prueba más tarde.", 3);
		return 1;
	}

	GetPlayerPos(playerid, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2]);
	GetPlayerFacingAngle(playerid, CHARACTER_INFO[playerid][ch_ANGLE]);
	CHARACTER_INFO[playerid][ch_POS][0] += (1.0 * floatsin(-CHARACTER_INFO[playerid][ch_ANGLE], degrees));
	CHARACTER_INFO[playerid][ch_POS][1] += (1.0 * floatcos(-CHARACTER_INFO[playerid][ch_ANGLE], degrees));
	CHARACTER_INFO[playerid][ch_POS][2] -= 0.75;

	PLANTS[index][plant_VALID] = true;
	PLANTS[index][plant_GROWING] = true;
	PLANTS[index][plant_INVISIBLE] = true;
	PLANTS[index][plant_GROWING_PROGRESS] = frandom(10.0, 8.0, 2);
	PLANTS[index][plant_TYPE] = PLAYER_TEMP[playerid][py_PLANTING_PLANT_SELECTED];
	PLANTS[index][plant_PLANTED_BY_ACCOUNT_ID] = ACCOUNT_INFO[playerid][ac_ID];
	format(PLANTS[index][plant_PLANTED_BY_NAME], 24, "%s", PLAYER_TEMP[playerid][py_RP_NAME]);
	PLANTS[index][plant_OBJECT_ID] = CreateDynamicObject(2244, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], 0.0, 0.0, CHARACTER_INFO[playerid][ch_ANGLE], GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
	SetDynamicObjectMaterial(PLANTS[index][plant_OBJECT_ID], 2, 2244, "plants_tabletop", "CJ_PLANT", 0x00F0F0F0);

	if (GetPlayerInterior(playerid) == 0)
	{
		CA_FindZ_For2DCoord(CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2]);
		MoveDynamicObject(PLANTS[index][plant_OBJECT_ID], CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], 12.0, 0.0, 0.0, CHARACTER_INFO[playerid][ch_ANGLE]);
	}

	new info[2];
	info[0] = OBJECT_TYPE_PLANT;
	info[1] = index;
	Streamer_SetArrayData(STREAMER_TYPE_OBJECT, PLANTS[index][plant_OBJECT_ID], E_STREAMER_EXTRA_ID, info);

	new label_str[256];
	format(label_str, sizeof label_str, ""COL_YELLOW"%s"COL_WHITE" de %s\n"COL_WHITE"Creciendo: %.1f%%", plant_info[ PLANTS[index][plant_TYPE] ][plant_info_NAME], PLANTS[index][plant_PLANTED_BY_NAME], PLANTS[index][plant_GROWING_PROGRESS]);
	PLANTS[index][plant_LABEL_ID] = CreateDynamic3DTextLabel(label_str, 0xF0F0F000, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2] + 0.25, 10.0, .testlos = false, .interiorid = GetPlayerInterior(playerid), .worldid = GetPlayerVirtualWorld(playerid));

	KillTimer(PLANTS[index][plant_TIMER]);
	PLANTS[index][plant_TIMER] = SetTimerEx("GrowPlantUp", 15000, false, "d", index);

	SavePlayerSkills(playerid);
	ShowPlayerMessage(playerid, "Ahora espera a que la planta crezca, si pasan más de 5 minutos después~n~de que la planta haya crecido se destruirá.", 4);
	Streamer_Update(playerid);
	return 1;
}

forward GrowPlantUp(plant);
public GrowPlantUp(plant)
{
	#if DEBUG_MODE == 1
		printf("GrowPlantUp"); // debug juju
	#endif

	if (!PLANTS[plant][plant_VALID] || !PLANTS[plant][plant_GROWING]) return 0;

	if (PLANTS[plant][plant_GROWING_PROGRESS] < 100.0)
	{
		PLANTS[plant][plant_GROWING_PROGRESS] += floatdiv(25, plant_info[ PLANTS[plant][plant_TYPE] ][plant_info_SEEDS]);
		if (PLANTS[plant][plant_GROWING_PROGRESS] > 100.0) PLANTS[plant][plant_GROWING_PROGRESS] = 100.0;

		if (PLANTS[plant][plant_INVISIBLE] && PLANTS[plant][plant_GROWING_PROGRESS] > 50.0)
		{
			PLANTS[plant][plant_INVISIBLE] = false;
			SetDynamicObjectMaterial(PLANTS[plant][plant_OBJECT_ID], 2, 2244, "plants_tabletop", "CJ_PLANT", COLOR_WHITE);
		}

		new label_str[256];
		format(label_str, sizeof label_str, ""COL_YELLOW"%s"COL_WHITE" de %s\n"COL_WHITE"Creciendo: %.1f%%", plant_info[ PLANTS[plant][plant_TYPE] ][plant_info_NAME], PLANTS[plant][plant_PLANTED_BY_NAME], PLANTS[plant][plant_GROWING_PROGRESS]);
		UpdateDynamic3DTextLabelText(PLANTS[plant][plant_LABEL_ID], 0xF0F0F000, label_str);

		KillTimer(PLANTS[plant][plant_TIMER]);
		PLANTS[plant][plant_TIMER] = SetTimerEx("GrowPlantUp", 15000, false, "d", plant);
		return 1;
	}

	SetDynamicObjectMaterial(PLANTS[plant][plant_OBJECT_ID], 2, 2244, "plants_tabletop", "CJ_PLANT", 0xFFff0000);

	PLANTS[plant][plant_GROWING] = false;
	PLANTS[plant][plant_EXPIRE_TIME] = 1000;

	new label_str[256];
	format(label_str, sizeof label_str, ""COL_YELLOW"%s"COL_WHITE" de %s\n"COL_WHITE"Expira en %s minutos", plant_info[ PLANTS[plant][plant_TYPE] ][plant_info_NAME], PLANTS[plant][plant_PLANTED_BY_NAME], TimeConvert(PLANTS[plant][plant_EXPIRE_TIME]));
	UpdateDynamic3DTextLabelText(PLANTS[plant][plant_LABEL_ID], 0xF0F0F000, label_str);

	KillTimer(PLANTS[plant][plant_TIMER]);
	PLANTS[plant][plant_TIMER] = SetTimerEx("ExpirePlantTime", 1000, false, "d", plant);
	return 1;
}

forward ExpirePlantTime(plant);
public ExpirePlantTime(plant)
{
	#if DEBUG_MODE == 1
		printf("ExpirePlantTime"); // debug juju
	#endif

	if (!PLANTS[plant][plant_VALID]) return 0;

	if (PLANTS[plant][plant_EXPIRE_TIME] > 0)
	{
		PLANTS[plant][plant_EXPIRE_TIME] --;

		new label_str[256];
		format(label_str, sizeof label_str, ""COL_YELLOW"%s"COL_WHITE" de %s\n"COL_WHITE"Expira en %s minutos", plant_info[ PLANTS[plant][plant_TYPE] ][plant_info_NAME], PLANTS[plant][plant_PLANTED_BY_NAME], TimeConvert(PLANTS[plant][plant_EXPIRE_TIME]));
		UpdateDynamic3DTextLabelText(PLANTS[plant][plant_LABEL_ID], 0xF0F0F000, label_str);

		KillTimer(PLANTS[plant][plant_TIMER]);
		PLANTS[plant][plant_TIMER] = SetTimerEx("ExpirePlantTime", 1000, false, "d", plant);
		return 1;
	}

	new Float:x, Float:y, Float:z;
	GetDynamicObjectPos(PLANTS[plant][plant_OBJECT_ID], x, y, z);
	CreateFlashObject(x, y, z - 1.3);

	DestroyDynamicObject(PLANTS[plant][plant_OBJECT_ID]);
	DestroyDynamic3DTextLabel(PLANTS[plant][plant_LABEL_ID]);

	new tmp_PLANTS[PLANTS_ENUM]; PLANTS[plant] = tmp_PLANTS;
	return 1;
}