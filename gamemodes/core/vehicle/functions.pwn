SetVehicleVirtualWorldEx(vehicleid, worldid)
{
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_TP_IMMUNITY] = gettime() + 5;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_WORLD] = worldid;

	for(new i = 0; i != MAX_SU_VOBJECTS; i ++)
	{
		if (!VEHICLE_OBJECTS[vehicleid][i][vobject_VALID]) continue;
		if (VEHICLE_OBJECTS[vehicleid][i][vobject_OBJECT_ID] == INVALID_STREAMER_ID) continue;

		Streamer_SetIntData(STREAMER_TYPE_OBJECT, VEHICLE_OBJECTS[vehicleid][i][vobject_OBJECT_ID], E_STREAMER_WORLD_ID, GLOBAL_VEHICLES[vehicleid][gb_vehicle_WORLD]);
	}

	SetVehicleVirtualWorld(vehicleid, worldid);
	return 1;
}

TextureCountryFlag(objectid, index, country)
{
	new text_flag[128], material_size, font[24], font_size, text_alignment;
	switch(country)
	{
		case 0: // Alemania
		{
			text_flag      = "{231f20}ggg\n{e01f26}ggg\n{e3bc22}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 1: // Argentina
		{
			text_flag      = "{1FBEF2}ggg\n"COL_WHITE"ggg\n{1FBEF2}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 2: // Austria
		{
			text_flag      = "{d81e05}ggg\n"COL_WHITE"ggg\n{d81e05}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 3: // Belgica
		{
			text_flag      = "{000000}g{ffd600}g{e80000}g\n{000000}g{ffd600}g{e80000}g\n{000000}g{ffd600}g{e80000}g";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 4: // Bolivia con mar
		{
			text_flag      = "{d52b1e}ggg\n{f9e300}ggg\n{007934}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 5: // Bulgaria
		{
			text_flag      = ""COL_WHITE"ggg\n{00966e}ggg\n{d62612}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 6: // Chile
		{
			text_flag      = "{04019a}g"COL_WHITE"gg\n{fe0002}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 7: // Colombia
		{
			text_flag      = "{fcd116}ggg\n{003893}ggg\n{ce1126}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 0;
		}
		case 8: // El Salvador
		{
			text_flag      = "{0f47af}ggg\n"COL_WHITE"ggg\n{0f47af}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 9: // España
		{
			text_flag      = "{c60b1e}ggg\n{ffc400}ggg\n{c60b1e}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 10: // Estonia
		{
			text_flag      = "{3a75c4}ggg\n{000000}ggg\n"COL_WHITE"ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 11: // Francia
		{
			text_flag      = "{00209f}g"COL_WHITE"g{f42a41}g\n{00209f}g"COL_WHITE"g{f42a41}g\n{00209f}g"COL_WHITE"g{f42a41}g";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 12: // Guatemala
		{
			text_flag      = "{4997d0}g"COL_WHITE"g{4997d0}g\n{4997d0}g"COL_WHITE"g{4997d0}g\n{4997d0}g"COL_WHITE"g{4997d0}g";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1; 
		}
		case 13: // Holanda
		{
			text_flag      = "{ad1b28}ggg\n{fefefe}ggg\n{204589}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 14: // Hungria
		{
			text_flag      = "{d2232c}ggg\n"COL_WHITE"ggg\n{008d46}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 15: // India
		{
			text_flag      = "{ff9933}ggg\n"COL_WHITE"ggg\n{138808}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 16: // Indonesia
		{
			text_flag      = "{ce1126}ggg\n"COL_WHITE"ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 60;
			text_alignment = 1;
		}
		case 17: // Irlanda
		{
			text_flag      = "{009e60}g"COL_WHITE"g{f77f00}g\n{009e60}g"COL_WHITE"g{f77f00}g\n{009e60}g"COL_WHITE"g{f77f00}g";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 18: // Italia
		{
			text_flag      = "{009246}g"COL_WHITE"g{ce2b37}g\n{009246}g"COL_WHITE"g{ce2b37}g\n{009246}g"COL_WHITE"g{ce2b37}g";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 19: // Lituania
		{
			text_flag      = "{fdb913}ggg\n{006a44}ggg\n{c1272d}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 20: // Luxemburgo
		{
			text_flag      = "{ef2b2d}ggg\n"COL_WHITE"ggg\n{00a3dd}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 21: // Madagascar
		{
			text_flag      = ""COL_WHITE"g{d11f33}gg\n"COL_WHITE"g{00a651}gg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 60;
			text_alignment = 1;
		}
		case 22: // Malta
		{
			text_flag      = ""COL_WHITE"g{d11f33}g\n"COL_WHITE"g{d11f33}g\n"COL_WHITE"g{d11f33}g";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 60;
			text_alignment = 1;
		}
		case 23: // Mali
		{
			text_flag      = "{14b53a}g{fcd116}g{ce1126}g\n{14b53a}g{fcd116}g{ce1126}g\n{14b53a}g{fcd116}g{ce1126}g";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 24: // México
		{
			text_flag      = "{006847}g"COL_WHITE"g{ce1126}g\n{006847}g"COL_WHITE"g{ce1126}g\n{006847}g"COL_WHITE"g{ce1126}g";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 25: // Nigeria
		{
			text_flag      = "{008751}g"COL_WHITE"g{008751}g\n{008751}g"COL_WHITE"g{008751}g\n{008751}g"COL_WHITE"g{008751}g";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 26: // Panamá
		{
			text_flag      = ""COL_WHITE"g{d21034}g\n{0067c6}g"COL_WHITE"g";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 60;
			text_alignment = 0;
		}
		case 27: // Paraguay
		{
			text_flag      = "{d52b1e}ggg\n"COL_WHITE"ggg\n{0038a8}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 28: // Perú
		{
			text_flag      = "{e30000}g"COL_WHITE"g{e30000}g\n{e30000}g"COL_WHITE"g{e30000}g\n{e30000}g"COL_WHITE"g{e30000}g";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 29: // Polonia
		{
			text_flag      = ""COL_WHITE"ggg\n{dc143c}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 60;
			text_alignment = 1;
		}
		case 30: // Rumania
		{
			text_flag      = "{002b7f}g{fcd116}g{ce1126}g\n{002b7f}g{fcd116}g{ce1126}g\n{002b7f}g{fcd116}g{ce1126}g";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 31: // Rusia
		{
			text_flag      = ""COL_WHITE"ggg\n{054da2}ggg\n{e01f26}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
		case 32: // Ucrania
		{
			text_flag      = "{3a75c4}ggg\n{f9dd16}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 60;
			text_alignment = 1;
		}
		case 33: // Venezuela
		{
			text_flag      = "{f7d117}ggg\n{0033ab}ggg\n{cf142b}ggg";
			material_size  = 60;
			font           = "Webdings";
			font_size      = 55;
			text_alignment = 1;
		}
	}

	SetDynamicObjectMaterialText
	(
		objectid,
		index,
		text_flag,
		material_size,
		font,
		font_size,
		0,
		COLOR_WHITE,
		0,
		text_alignment
	);
	return 1;
}

RegisterNewVehicleObject(vehicleid, slot)
{
	new DBResult:Result, DB_Query[1500];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `VEHICLE_OBJECTS`\
		(\
			`ID_VEHICLE`, `TYPE`, `NAME`, `MODELID`,\
			`OFF_X`, `OFF_Y`, `OFF_Z`, `ROT_X`, `ROT_Y`, `ROT_Z`,\
			`ATTACHED`,\
			`COLOR_0`, `COLOR_1`, `COLOR_2`, `COLOR_3`, `COLOR_4`,\
			`TEXT`, `FONT`, `FONT_SIZE`, `FONT_BOLD`, `FONT_COLOR`\
		)\
		VALUES\
		(\
			'%d', '%d', '%q', '%d',\
			'%f', '%f', '%f', '%f', '%f', '%f',\
			'%d',\
			'%d', '%d', '%d', '%d', '%d',\
			'%q', '%q', '%d', '%d', '%d'\
		);\
		SELECT MAX(`ID`) FROM `VEHICLE_OBJECTS`;\
	",
		PLAYER_VEHICLES[vehicleid][player_vehicle_ID], VEHICLE_OBJECTS[vehicleid][slot][vobject_TYPE], VEHICLE_OBJECTS[vehicleid][slot][vobject_NAME], VEHICLE_OBJECTS[vehicleid][slot][vobject_MODELID],
		VEHICLE_OBJECTS[vehicleid][slot][vobject_OFFSET][0], VEHICLE_OBJECTS[vehicleid][slot][vobject_OFFSET][1], VEHICLE_OBJECTS[vehicleid][slot][vobject_OFFSET][2], VEHICLE_OBJECTS[vehicleid][slot][vobject_ROT][0], VEHICLE_OBJECTS[vehicleid][slot][vobject_ROT][1], VEHICLE_OBJECTS[vehicleid][slot][vobject_ROT][2],
		VEHICLE_OBJECTS[vehicleid][slot][vobject_ATTACHED],
		VEHICLE_OBJECTS[vehicleid][slot][vobject_COLORS][0], VEHICLE_OBJECTS[vehicleid][slot][vobject_COLORS][1], VEHICLE_OBJECTS[vehicleid][slot][vobject_COLORS][2], VEHICLE_OBJECTS[vehicleid][slot][vobject_COLORS][3], VEHICLE_OBJECTS[vehicleid][slot][vobject_COLORS][4],
		VEHICLE_OBJECTS[vehicleid][slot][vobject_text_TEXT], VEHICLE_OBJECTS[vehicleid][slot][vobject_text_FONT], VEHICLE_OBJECTS[vehicleid][slot][vobject_text_FONT_SIZE], VEHICLE_OBJECTS[vehicleid][slot][vobject_text_BOLD], VEHICLE_OBJECTS[vehicleid][slot][vobject_text_FONT_COLOR]
	);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result)) VEHICLE_OBJECTS[vehicleid][slot][vobject_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);
	return 1;
}

UpdateVehicleObject(vehicleid, slot)
{
	new DB_Query[1500];
	format(DB_Query, sizeof DB_Query,

		"UPDATE `VEHICLE_OBJECTS` SET \
			`ID_VEHICLE` = '%d', `TYPE` = '%d', `NAME` = '%q', `MODELID` = '%d',\
			`OFF_X` = '%f', `OFF_Y` = '%f', `OFF_Z` = '%f', `ROT_X` = '%f', `ROT_Y` = '%f', `ROT_Z` = '%f',\
			`ATTACHED` = '%d',\
			`COLOR_0` = '%d', `COLOR_1` = '%d', `COLOR_2` = '%d', `COLOR_3` = '%d', `COLOR_4` = '%d',\
			`TEXT` = '%q', `FONT` = '%q', `FONT_SIZE` = '%d', `FONT_BOLD` = '%d', `FONT_COLOR` = '%d' \
		WHERE `ID` = '%d';\
		",
			PLAYER_VEHICLES[vehicleid][player_vehicle_ID], VEHICLE_OBJECTS[vehicleid][slot][vobject_TYPE], VEHICLE_OBJECTS[vehicleid][slot][vobject_NAME], VEHICLE_OBJECTS[vehicleid][slot][vobject_MODELID],
			VEHICLE_OBJECTS[vehicleid][slot][vobject_OFFSET][0], VEHICLE_OBJECTS[vehicleid][slot][vobject_OFFSET][1], VEHICLE_OBJECTS[vehicleid][slot][vobject_OFFSET][2], VEHICLE_OBJECTS[vehicleid][slot][vobject_ROT][0], VEHICLE_OBJECTS[vehicleid][slot][vobject_ROT][1], VEHICLE_OBJECTS[vehicleid][slot][vobject_ROT][2],
			VEHICLE_OBJECTS[vehicleid][slot][vobject_ATTACHED],
			VEHICLE_OBJECTS[vehicleid][slot][vobject_COLORS][0], VEHICLE_OBJECTS[vehicleid][slot][vobject_COLORS][1], VEHICLE_OBJECTS[vehicleid][slot][vobject_COLORS][2], VEHICLE_OBJECTS[vehicleid][slot][vobject_COLORS][3], VEHICLE_OBJECTS[vehicleid][slot][vobject_COLORS][4],
			VEHICLE_OBJECTS[vehicleid][slot][vobject_text_TEXT], VEHICLE_OBJECTS[vehicleid][slot][vobject_text_FONT], VEHICLE_OBJECTS[vehicleid][slot][vobject_text_FONT_SIZE], VEHICLE_OBJECTS[vehicleid][slot][vobject_text_BOLD], VEHICLE_OBJECTS[vehicleid][slot][vobject_text_FONT_COLOR],
			VEHICLE_OBJECTS[vehicleid][slot][vobject_ID]
	);

	db_free_result(db_query(Database, DB_Query));
	return 1;
}

GetPlayerVehicleIdFromDbId(veh_did)
{
	for(new i = 0; i != MAX_VEHICLES; i ++)
	{
		if (!GLOBAL_VEHICLES[i][gb_vehicle_VALID]) continue;
		if (!PLAYER_VEHICLES[i][player_vehicle_VALID]) continue;

		if (PLAYER_VEHICLES[i][player_vehicle_ID] == veh_did) return i;
	}
	return INVALID_VEHICLE_ID;
}

UpdateTuningShop(playerid)
{
	if (PLAYER_TEMP[playerid][py_TUNING_PICKUP] != INVALID_STREAMER_ID)
	{
		DestroyDynamicPickup(PLAYER_TEMP[playerid][py_TUNING_PICKUP]);
		PLAYER_TEMP[playerid][py_TUNING_PICKUP] = INVALID_STREAMER_ID;
	}
	PLAYER_TEMP[playerid][py_TUNING_PICKUP] = CreateDynamicPickup(Tuning_Shop_Objects[ PLAYER_TEMP[playerid][py_SELECT_TUNING_OBJECT] ][tuning_object_MODELID], 1, 1557.881225,-2174.210449,13.587863, playerid + MAX_PLAYERS, COLOR_WHITE, playerid);

	new td_str[128];
	format(td_str, sizeof td_str, "_%d/%d~n~Precio:_%s$", PLAYER_TEMP[playerid][py_SELECT_TUNING_OBJECT] + 1, sizeof Tuning_Shop_Objects, number_format_thousand( Tuning_Shop_Objects[ PLAYER_TEMP[playerid][py_SELECT_TUNING_OBJECT] ][tuning_object_PRICE] ) );
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_TUNING_SHOP], td_str);
	return 1;
}

CancelPlayerTuningShop(playerid)
{
	SetCameraBehindPlayer(playerid);

	if (PLAYER_TEMP[playerid][py_TUNING_PICKUP] != INVALID_STREAMER_ID)
	{
		DestroyDynamicPickup(PLAYER_TEMP[playerid][py_TUNING_PICKUP]);
		PLAYER_TEMP[playerid][py_TUNING_PICKUP] = INVALID_STREAMER_ID;
	}
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_SHOP_TUNING][0]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_SHOP_TUNING][1]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_SHOP_TUNING][2]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_SHOP_TUNING][3]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_SHOP_TUNING][4]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_TUNING_SHOP]);
	CancelSelectTextDrawEx(playerid);

	PLAYER_TEMP[playerid][py_TUNING_GARAGE_SHOP] = false;
	return 1;
}

GetVehicleFreeObjectSlot(vehicleid)
{
	for(new i = 0; i != MAX_SU_VOBJECTS; i ++)
	{
		if (!VEHICLE_OBJECTS[vehicleid][i][vobject_VALID]) return i;
	}
	return -1;
}

UpdateVehicleMaterialObject(vehicleid, slot)
{
	switch(VEHICLE_OBJECTS[vehicleid][slot][vobject_TYPE])
	{
		case VOBJECT_TYPE_OBJECT:
		{
			for(new i = 0; i != MAX_VEHICLE_OBJECTS_INDEXS; i ++)
			{
				SetDynamicObjectMaterial(VEHICLE_OBJECTS[vehicleid][slot][vobject_OBJECT_ID], i, -1, "none", "none", VEHICLE_OBJECTS[vehicleid][slot][vobject_COLORS][i]);
			}
		}
		case VOBJECT_TYPE_TEXT:
		{
			SetDynamicObjectMaterialText
			(
				VEHICLE_OBJECTS[vehicleid][slot][vobject_OBJECT_ID],
				0,
				VEHICLE_OBJECTS[vehicleid][slot][vobject_text_TEXT],
				130,
				VEHICLE_OBJECTS[vehicleid][slot][vobject_text_FONT],
				VEHICLE_OBJECTS[vehicleid][slot][vobject_text_FONT_SIZE],
				VEHICLE_OBJECTS[vehicleid][slot][vobject_text_BOLD],
				VEHICLE_OBJECTS[vehicleid][slot][vobject_text_FONT_COLOR],
				0,
				OBJECT_MATERIAL_TEXT_ALIGN_CENTER
			);
		}
		case VOBJECT_TYPE_COUNTRY_FLAG: TextureCountryFlag(VEHICLE_OBJECTS[vehicleid][slot][vobject_OBJECT_ID], 1, VEHICLE_OBJECTS[vehicleid][slot][vobject_COLORS][0]);
		case VOBJECT_TYPE_COUNTRY_PANEL: TextureCountryFlag(VEHICLE_OBJECTS[vehicleid][slot][vobject_OBJECT_ID], 0, VEHICLE_OBJECTS[vehicleid][slot][vobject_COLORS][0]);
	}
	return 1;
}

UpdateVehicleAttachedObject(vehicleid, slot)
{
	if (VEHICLE_OBJECTS[vehicleid][slot][vobject_ATTACHED])
	{
		if (VEHICLE_OBJECTS[vehicleid][slot][vobject_OBJECT_ID] == INVALID_STREAMER_ID)
		{
			VEHICLE_OBJECTS[vehicleid][slot][vobject_OBJECT_ID] = CreateDynamicObject( VEHICLE_OBJECTS[vehicleid][slot][vobject_MODELID], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
		}

		for(new i = 0; i != MAX_VEHICLE_OBJECTS_INDEXS; i ++)
		{
			SetDynamicObjectMaterial(VEHICLE_OBJECTS[vehicleid][slot][vobject_OBJECT_ID], i, -1, "none", "none", VEHICLE_OBJECTS[vehicleid][slot][vobject_COLORS][i]);
		}
		
		new Float:v_size[3];
		GetVehicleModelInfo(GLOBAL_VEHICLES[ vehicleid ][gb_vehicle_MODELID], VEHICLE_MODEL_INFO_SIZE, v_size[0], v_size[1], v_size[2]);

		if (
				(VEHICLE_OBJECTS[ vehicleid ][ slot ][vobject_OFFSET][0] >= v_size[0] || -v_size[0] >= VEHICLE_OBJECTS[ vehicleid ][ slot ][vobject_OFFSET][0]) || 
				(VEHICLE_OBJECTS[ vehicleid ][ slot ][vobject_OFFSET][1] >= v_size[1] || -v_size[1] >= VEHICLE_OBJECTS[ vehicleid ][ slot ][vobject_OFFSET][1]) ||
				(VEHICLE_OBJECTS[ vehicleid ][ slot ][vobject_OFFSET][2] >= v_size[2] || -v_size[2] >= VEHICLE_OBJECTS[ vehicleid ][ slot ][vobject_OFFSET][2])
			)
		{
			VEHICLE_OBJECTS[ vehicleid ][ slot ][vobject_OFFSET][0] = 0.0;
			VEHICLE_OBJECTS[ vehicleid ][ slot ][vobject_OFFSET][1] = 0.0;
			VEHICLE_OBJECTS[ vehicleid ][ slot ][vobject_OFFSET][2] = 0.0;
			VEHICLE_OBJECTS[ vehicleid ][ slot ][vobject_ROT][0] = 0.0;
			VEHICLE_OBJECTS[ vehicleid ][ slot ][vobject_ROT][1] = 0.0;
			VEHICLE_OBJECTS[ vehicleid ][ slot ][vobject_ROT][2] = 0.0;
			return 0;
		}

		AttachDynamicObjectToVehicle(
			VEHICLE_OBJECTS[vehicleid][slot][vobject_OBJECT_ID],
			vehicleid,
			VEHICLE_OBJECTS[vehicleid][slot][vobject_OFFSET][0],
			VEHICLE_OBJECTS[vehicleid][slot][vobject_OFFSET][1],
			VEHICLE_OBJECTS[vehicleid][slot][vobject_OFFSET][2],
			VEHICLE_OBJECTS[vehicleid][slot][vobject_ROT][0],
			VEHICLE_OBJECTS[vehicleid][slot][vobject_ROT][1],
			VEHICLE_OBJECTS[vehicleid][slot][vobject_ROT][2]
		);
	}
	else
	{
		if (VEHICLE_OBJECTS[vehicleid][slot][vobject_OBJECT_ID] != INVALID_STREAMER_ID)
		{
			DestroyDynamicObject(VEHICLE_OBJECTS[vehicleid][slot][vobject_OBJECT_ID]);
			VEHICLE_OBJECTS[vehicleid][slot][vobject_OBJECT_ID] = INVALID_STREAMER_ID;
		}
	}
	return 1;
}

EditVehicleObject(playerid, vehicleid, slot)
{
	if (PLAYER_TEMP[playerid][py_PIVOT_OBJECT] != INVALID_OBJECT_ID)
	{
		DestroyPlayerObject(playerid, PLAYER_TEMP[playerid][py_PIVOT_OBJECT]);
		PLAYER_TEMP[playerid][py_PIVOT_OBJECT] = INVALID_OBJECT_ID;
	}
	
	PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] = slot;
	GetVehiclePos(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][0], GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][1], GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][2]);
	
	new Float:x, Float:y, Float:z;
	x = GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][0] + VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][0];
	y = GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][1] + VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][1];
	z = GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][2] + VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][2];
	
	PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][0] = VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][0];
	PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][1] = VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][1];
	PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][2] = VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][2];
	PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][3] = VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ROT][0];
	PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][4] = VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ROT][1];
	PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][5] = VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ROT][2];
	
	for(new i = 0; i != MAX_VEHICLE_OBJECTS_INDEXS; i ++)
	{
		SetDynamicObjectMaterial(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OBJECT_ID], i, -1, "none", "none", VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_COLORS][i]);
	}

	PLAYER_TEMP[playerid][py_PIVOT_OBJECT] = CreatePlayerObject(playerid, 999, x, y, z, VEHICLE_OBJECTS[vehicleid][slot][vobject_ROT][0], VEHICLE_OBJECTS[vehicleid][slot][vobject_ROT][1], VEHICLE_OBJECTS[vehicleid][slot][vobject_ROT][2]);
	SetPlayerObjectMaterial(playerid, PLAYER_TEMP[playerid][py_PIVOT_OBJECT], 0, 0, "null", "null");
	SetPlayerObjectMaterial(playerid, PLAYER_TEMP[playerid][py_PIVOT_OBJECT], 1, 0, "null", "null");

	Streamer_Update(playerid);
	EditPlayerObject(playerid, PLAYER_TEMP[playerid][py_PIVOT_OBJECT]);
	return 1;
}

SetVehicleLightsAction(playerid)
{
	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_LIGHTS])
		{
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_LIGHTS] = 0;
			UpdateVehicleParams(vehicleid);

			ShowPlayerMessage(playerid, "Luces ~r~apagadas", 2);

			if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID]) SetPlayerChatBubble(playerid, "\n\n\n\n* Ha apagado las luces de su vehículo.\n\n\n", 0xffcb90FF, 20.0, 5000);
			else SetPlayerChatBubble(playerid, "\n\n\n\n* Ha apagado las luces de su vehículo.\n\n\n", 0xffcb90FF, 20.0, 5000);
		}
		else
		{
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_LIGHTS] = 1;
			UpdateVehicleParams(vehicleid);

			ShowPlayerMessage(playerid, "Luces ~g~encendidas", 2);

			if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID]) SetPlayerChatBubble(playerid, "\n\n\n\n* Ha encendido las luces de su vehículo.\n\n\n", 0xffcb90FF, 20.0, 5000);
			else SetPlayerChatBubble(playerid, "\n\n\n\n* Ha encendido las luces de su vehículo.\n\n\n", 0xffcb90FF, 20.0, 5000);
		}
	}
	return 1;
}

CheckPlayerDoors(playerid)
{
	new vehicleid = INVALID_VEHICLE_ID;
	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		vehicleid = GetPlayerVehicleID(playerid);
	}
	else if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		vehicleid = GetPlayerCameraTargetVehicle(playerid);
	}

	if (vehicleid == INVALID_VEHICLE_ID) return 0;
	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return 0;
	if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID] || IsPlayerInKeys(PLAYER_VEHICLES[vehicleid][player_vehicle_ID], ACCOUNT_INFO[playerid][ac_ID]))
	{
		new Float:x, Float:y, Float:z;
		GetVehiclePos(vehicleid, x, y, z);
		if (GetPlayerDistanceFromPoint(playerid, x, y, z) < 10.0)
		{
			if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_DOORS] == 0)
			{
			    CloseVehicle(playerid, vehicleid);
			    return 0;
		    }
		    else
		    {
			    OpenVehicle(playerid, vehicleid);
			}
		}
	}
	return 1;
}

OpenVehicle(playerid, vehicleid)
{
	if (!ACCOUNT_INFO[playerid][ac_SU] && !PLAYER_VEHICLES[vehicleid][player_vehicle_ACCESSIBLE])
	{
		ShowPlayerMessage(playerid, "Este vehículo está bloqueado, desbloquéalo siendo ~p~VIP", 3);
		return 1;
	}

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_DOORS] = 0;
	UpdateVehicleParams(vehicleid);
	SetPlayerChatBubble(playerid, "\n\n\n\n* Ha abierto las puertas de su vehículo.\n\n\n", 0xffcb90FF, 20.0, 5000);

	new str_text[64];
	format(str_text, sizeof(str_text), "~n~~n~%s ~g~destrabado", VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME]);
	ShowPlayerMessage(playerid, str_text, 1);

	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
	return 1;
}

CloseVehicle(playerid, vehicleid)
{
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_LAST_CLOSED_TIME] = gettime();
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_DOORS] = 1;
	UpdateVehicleParams(vehicleid);
	SetPlayerChatBubble(playerid, "\n\n\n\n* Ha cerrado las puertas de su vehículo.\n\n\n", 0xffcb90FF, 20.0, 5000);

	new str_text[64];
	format(str_text, sizeof(str_text), "~n~~n~%s ~r~trabado", VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME]);
	ShowPlayerMessage(playerid, str_text, 1);

	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
	return 1;
}

SetEngineAction(playerid)
{
    if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] == 481 || GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] == 509 || GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] == 510)
		{
			if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE])
        	{
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 1;
				UpdateVehicleParams(vehicleid);
			}
			return 1;
		}

        if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE] == VEHICLE_TYPE_WORK)
        {
            if (TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADING]) return ShowPlayerMessage(playerid, "~r~Debes esperar a que se termine de cargar el camión.", 3);
            if (TRUCK_VEHICLE[vehicleid][truck_vehicle_UNLOADING]) return ShowPlayerMessage(playerid, "~r~Debes esperar a que se termine de descargar el camión.", 3);
        }
        
        if (PLAYER_TEMP[playerid][py_IN_TUNING_GARAGE]) return ShowPlayerMessage(playerid, "~r~Primero debes terminar de hacer lo que estés haciendo.", 2);
        
        KillTimer(PLAYER_TEMP[playerid][py_TIMERS][7]);
        if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE])
        {
            PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_NOFUEL][p_ac_info_IMMUNITY] = gettime() + 15;
            GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 0;
            UpdateVehicleParams(vehicleid);
            
            if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID]) ShowPlayerMessage(playerid, "Vehículo ~r~detenido", 2);
            else ShowPlayerMessage(playerid, "Vehículo ~r~detenido", 2);

            SetPlayerChatBubble(playerid, "\n\n\n\n* Ha apagado su vehículo.\n\n\n", 0xffcb90FF, 20.0, 5000);
        }
        else
        {
        	ShowPlayerMessage(playerid, "Encendiendo...", 2);
            PLAYER_TEMP[playerid][py_TIMERS][7] = SetTimerEx("StartVehicleEngine", 1000, false, "ii", playerid, vehicleid);
        }
    }

    if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK)
	{
		new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    SetPlayerPos(playerid, x, y, z);
	    ApplyAnimation(playerid, "SWEET", "SWEET_INJUREDLOOP", 4.1, true, false, false, 1, 0, 1);
	}
    return 1;
}


AddTestVehicle(bool:static_veh, modelid, Float:X, Float:Y, Float:Z, Float:Angle, Color1, Color2, respawn_delay = 0, bool:siren = false)
{
	new vehicle_id = INVALID_VEHICLE_ID;
	if (static_veh) vehicle_id = AddStaticVehicleEx(modelid, X, Y, Z, Angle, Color1, Color2, respawn_delay, siren);
	else vehicle_id = CreateVehicle(modelid, X, Y, Z, Angle, Color1, Color2, COLOR_WHITE, false);

	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_VALID] = true;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_TYPE] = VEHICLE_TYPE_TEST;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] = modelid;
	format(GLOBAL_VEHICLES[vehicle_id][gb_vehicle_NUMBER_PLATE], 32, "B1G 1337");
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X] = X;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y] = Y;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z] = Z;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_ANGLE] = Angle;

	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][0] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X];
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][1] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y];
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][2] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z];

	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_HEALTH] = 1000.0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_PANELS] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_DOORS] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_LIGHTS] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_TIRES] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_1] = Color1;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_2] = Color2;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PAINTJOB] = 3; // No paintjob
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MAX_GAS] = VEHICLE_INFO[modelid - 400][vehicle_info_MAX_GAS];
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_GAS] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MAX_GAS];
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_INTERIOR] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_WORLD] = 0;

	SetVehicleToRespawnEx(vehicle_id);
	return vehicle_id;
}

AddPersonalVehicle(playerid, modelid, Float:X, Float:Y, Float:Z, Float:Angle, Color1, Color2, Float:max_gas)
{
	new vehicle_id = INVALID_VEHICLE_ID;
	vehicle_id = CreateVehicle(modelid, X, Y, Z, Angle, Color1, Color2, -1);

	if (vehicle_id == INVALID_VEHICLE_ID) return false;

	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_VALID] = true;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_TYPE] = VEHICLE_TYPE_PERSONAL;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] = modelid;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X] = X;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y] = Y;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z] = Z;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_ANGLE] = Angle;

	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][0] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X];
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][1] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y];
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][2] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z];

	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_HEALTH] = 1000.0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_PANELS] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_DOORS] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_LIGHTS] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_TIRES] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_1] = Color1;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_2] = Color2;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PAINTJOB] = 3; // No paintjob
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MAX_GAS] = max_gas;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_GAS] = max_gas;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_INTERIOR] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_WORLD] = 0;

	PLAYER_VEHICLES[vehicle_id][player_vehicle_VALID] = true;
	PLAYER_VEHICLES[vehicle_id][player_vehicle_OWNER_ID] = ACCOUNT_INFO[playerid][ac_ID];
	RegisterNewPlayerVehicle(playerid, vehicle_id);

	SetVehicleToRespawnEx(vehicle_id);
	return vehicle_id;
}

RegisterNewPlayerVehicle(playerid, vehicleid)
{
	new DBResult:Result, DB_Query[400];
	format
	(
		DB_Query, sizeof DB_Query,
		"\
			INSERT INTO `PLAYER_VEHICLES`\
			(\
				`ID_USER`, `MODELID`, `SPAWN_X`, `SPAWN_Y`, `SPAWN_Z`, `SPAWN_ANGLE`, `COLOR_1`, `COLOR_2`, `GAS`, `MAX_GAS`\
			)\
			VALUES\
			(\
				'%d', '%d', '%f', '%f', '%f', '%f', '%d', '%d', '%f', '%f'\
			);\
			SELECT MAX(`ID`) FROM `PLAYER_VEHICLES`;\
		",
		ACCOUNT_INFO[playerid][ac_ID],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_X],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Y],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Z],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_ANGLE],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_1],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_2],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS]
	);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		PLAYER_VEHICLES[vehicleid][player_vehicle_ID] = db_get_field_int(Result, 0);
		format(GLOBAL_VEHICLES[vehicleid][gb_vehicle_NUMBER_PLATE], 32, "%04d %c%c%c", PLAYER_VEHICLES[vehicleid][player_vehicle_ID], getRandomLetter(), getRandomLetter(), getRandomLetter());

		DB_Query[0] = EOS;
		format
		(
			DB_Query, sizeof DB_Query,
			"\
				INSERT INTO `PLAYER_VEHICLE_COMPONENTS` (`ID_VEHICLE`) VALUES ('%d');\
				UPDATE `PLAYER_VEHICLES` SET `PLATE` = '%q' WHERE `ID` = '%d';\
			",
				PLAYER_VEHICLES[vehicleid][player_vehicle_ID],
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_NUMBER_PLATE], PLAYER_VEHICLES[vehicleid][player_vehicle_ID]
		);
		db_free_result(db_query(Database, DB_Query));
	}
	db_free_result(Result);

	return 1;
}

LoadPlayerVehicles(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[360];
	format(DB_Query, sizeof(DB_Query), "SELECT `PLAYER_VEHICLES`.*, `PLAYER_VEHICLE_COMPONENTS`.* FROM `PLAYER_VEHICLES`, `PLAYER_VEHICLE_COMPONENTS` WHERE `PLAYER_VEHICLES`.`ID_USER` = '%d' AND `PLAYER_VEHICLE_COMPONENTS`.`ID_VEHICLE` = `PLAYER_VEHICLES`.`ID` ORDER BY `PLAYER_VEHICLES`.`ID` DESC LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], MAX_SU_VEHICLES);
	Result = db_query(Database, DB_Query);

	new total_vehicles;
	for(new i; i < db_num_rows(Result); i++ )
	{
		if (total_vehicles >= MAX_SU_VEHICLES)
		{
			printf("[debug]  MAX_SU_VEHICLES superado al cargar de base de datos.");
			break;
		}

		new modelid, Float:pos[4], color[2];
		modelid = db_get_field_assoc_int(Result, "MODELID");
		pos[0] = db_get_field_assoc_float(Result, "SPAWN_X");
		pos[1] = db_get_field_assoc_float(Result, "SPAWN_Y");
		pos[2] = db_get_field_assoc_float(Result, "SPAWN_Z");
		pos[3] = db_get_field_assoc_float(Result, "SPAWN_ANGLE");
		color[0] = db_get_field_assoc_int(Result, "COLOR_1");
		color[1] = db_get_field_assoc_int(Result, "COLOR_2");

		new vehicle_id = INVALID_VEHICLE_ID;
		vehicle_id = CreateVehicle
		(
			modelid,
			pos[0],
			pos[1],
			pos[2],
			pos[3],
			color[0],
			color[1],
			-1
		);

		if (vehicle_id == INVALID_VEHICLE_ID)
		{
			db_free_result(Result);
			return false;
		}

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_VALID] = true;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_TYPE] = VEHICLE_TYPE_PERSONAL;

		PLAYER_VEHICLES[vehicle_id][player_vehicle_VALID] = true;
		PLAYER_VEHICLES[vehicle_id][player_vehicle_OWNER_ID] = ACCOUNT_INFO[playerid][ac_ID];
		PLAYER_VEHICLES[vehicle_id][player_vehicle_ID] = db_get_field_assoc_int(Result, "ID");
		PLAYER_VEHICLES[vehicle_id][player_vehicle_ACCESSIBLE] = true;

		db_get_field_assoc(Result, "PLATE", GLOBAL_VEHICLES[vehicle_id][gb_vehicle_NUMBER_PLATE], 32);
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] = modelid;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X] = pos[0];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y] = pos[1];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z] = pos[2];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_ANGLE] = pos[3];

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][0] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][1] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][2] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z];

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_HEALTH] = db_get_field_assoc_float(Result, "HEALTH");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_PANELS] = db_get_field_assoc_int(Result, "DAMAGE_PANELS");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_DOORS] = db_get_field_assoc_int(Result, "DAMAGE_DOORS");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_LIGHTS] = db_get_field_assoc_int(Result, "DAMAGE_LIGHTS");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_TIRES] = db_get_field_assoc_int(Result, "DAMAGE_TIRES");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_1] = color[0];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_2] = color[1];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PAINTJOB] = db_get_field_assoc_int(Result, "PAINTJOB");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MAX_GAS] = db_get_field_assoc_float(Result, "MAX_GAS");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_GAS] = db_get_field_assoc_float(Result, "GAS");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PARAMS_DOORS] = db_get_field_assoc_int(Result, "CLOSED");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_STATE] = db_get_field_assoc_int(Result, "STATE");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_INTERIOR] = db_get_field_assoc_int(Result, "INTERIOR");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_WORLD] = db_get_field_assoc_int(Result, "WORLD");

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][0] = db_get_field_assoc_int(Result, "SLOT_0");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][1] = db_get_field_assoc_int(Result, "SLOT_1");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][2] = db_get_field_assoc_int(Result, "SLOT_2");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][3] = db_get_field_assoc_int(Result, "SLOT_3");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][4] = db_get_field_assoc_int(Result, "SLOT_4");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][5] = db_get_field_assoc_int(Result, "SLOT_5");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][6] = db_get_field_assoc_int(Result, "SLOT_6");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][7] = db_get_field_assoc_int(Result, "SLOT_7");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][8] = db_get_field_assoc_int(Result, "SLOT_8");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][9] = db_get_field_assoc_int(Result, "SLOT_9");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][10] = db_get_field_assoc_int(Result, "SLOT_10");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][11] = db_get_field_assoc_int(Result, "SLOT_11");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][12] = db_get_field_assoc_int(Result, "SLOT_12");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][13] = db_get_field_assoc_int(Result, "SLOT_13");

		if (!ACCOUNT_INFO[playerid][ac_SU])
		{
			if (total_vehicles >= MAX_NU_VEHICLES)
			{
				GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PARAMS_DOORS] = 1;
				PLAYER_VEHICLES[vehicle_id][player_vehicle_ACCESSIBLE] = false;
			}
		}

		new DBResult:Result_vobjects, vobjects;
		format(DB_Query, sizeof(DB_Query), "SELECT * FROM `VEHICLE_OBJECTS` WHERE `ID_VEHICLE` = '%d' LIMIT %d;", PLAYER_VEHICLES[vehicle_id][player_vehicle_ID], MAX_SU_VOBJECTS);
		Result_vobjects = db_query(Database, DB_Query);

		for(new z; z < db_num_rows(Result_vobjects); z++ )
		{
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_VALID] = true;
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_ID] = db_get_field_assoc_int(Result_vobjects, "ID");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_TYPE] = db_get_field_assoc_int(Result_vobjects, "TYPE");
			db_get_field_assoc(Result_vobjects, "NAME", VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_NAME], 32);
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_MODELID] = db_get_field_assoc_int(Result_vobjects, "MODELID");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_OFFSET][0] = db_get_field_assoc_float(Result_vobjects, "OFF_X");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_OFFSET][1] = db_get_field_assoc_float(Result_vobjects, "OFF_Y");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_OFFSET][2] = db_get_field_assoc_float(Result_vobjects, "OFF_Z");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_ROT][0] = db_get_field_assoc_float(Result_vobjects, "ROT_X");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_ROT][1] = db_get_field_assoc_float(Result_vobjects, "ROT_Y");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_ROT][2] = db_get_field_assoc_float(Result_vobjects, "ROT_Z");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_ATTACHED] = db_get_field_assoc_int(Result_vobjects, "ATTACHED");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_COLORS][0] = db_get_field_assoc_int(Result_vobjects, "COLOR_0");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_COLORS][1] = db_get_field_assoc_int(Result_vobjects, "COLOR_1");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_COLORS][2] = db_get_field_assoc_int(Result_vobjects, "COLOR_2");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_COLORS][3] = db_get_field_assoc_int(Result_vobjects, "COLOR_3");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_COLORS][4] = db_get_field_assoc_int(Result_vobjects, "COLOR_4");
			db_get_field_assoc(Result_vobjects, "TEXT", VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_text_TEXT], 32);
			db_get_field_assoc(Result_vobjects, "FONT", VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_text_FONT], 24);
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_text_FONT_SIZE] = db_get_field_assoc_int(Result_vobjects, "FONT_SIZE");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_text_BOLD] = db_get_field_assoc_int(Result_vobjects, "FONT_BOLD");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_text_FONT_COLOR] = db_get_field_assoc_int(Result_vobjects, "FONT_COLOR");
			UpdateVehicleAttachedObject(vehicle_id, vobjects);
			UpdateVehicleMaterialObject(vehicle_id, vobjects);

			vobjects ++;
			db_next_row(Result_vobjects);
		}
		db_free_result(Result_vobjects);

		SetVehicleToRespawnEx(vehicle_id);

		new max_slots = VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_BOOT_SLOTS];
		if (max_slots > 0)
		{
			new DBResult:boot_Result, boot_DB_Query[90], boot_slot;
			format(boot_DB_Query, sizeof(boot_DB_Query), "SELECT * FROM `VEHICLE_BOOT` WHERE `ID_VEHICLE` = '%d' LIMIT %d;", PLAYER_VEHICLES[vehicle_id][player_vehicle_ID], max_slots);
			boot_Result = db_query(Database, boot_DB_Query);
			for(new x; x < db_num_rows(boot_Result); x++ )
			{
				VEHICLE_BOOT[vehicle_id][boot_slot][vehicle_boot_VALID] = true;
				VEHICLE_BOOT[vehicle_id][boot_slot][vehicle_boot_OBJECT_ID] = db_get_field_assoc_int(boot_Result, "ID_OBJECT");
				VEHICLE_BOOT[vehicle_id][boot_slot][vehicle_boot_TYPE] = db_get_field_assoc_int(boot_Result, "TYPE");
				VEHICLE_BOOT[vehicle_id][boot_slot][vehicle_boot_INT] = db_get_field_assoc_int(boot_Result, "INT");
				VEHICLE_BOOT[vehicle_id][boot_slot][vehicle_boot_INT_EXTRA] = db_get_field_assoc_int(boot_Result, "INT_EXTRA");

				if (VEHICLE_BOOT[vehicle_id][boot_slot][vehicle_boot_INT_EXTRA] > 1000)
					VEHICLE_BOOT[vehicle_id][boot_slot][vehicle_boot_INT_EXTRA] = 100;

				boot_slot ++;
				db_next_row(boot_Result);
			}
			db_free_result(boot_Result);
		}

		total_vehicles ++;
		db_next_row(Result);
	}
	db_free_result(Result);
	return 1;
}

SavePlayerVehicles(playerid, destroy = false)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	for(new i = 0; i != MAX_VEHICLES; i ++)
	{
		if (!PLAYER_VEHICLES[i][player_vehicle_VALID]) continue;
		if (PLAYER_VEHICLES[i][player_vehicle_OWNER_ID] != ACCOUNT_INFO[playerid][ac_ID]) continue;

		GetVehiclePos(i, GLOBAL_VEHICLES[i][gb_vehicle_SPAWN_X], GLOBAL_VEHICLES[i][gb_vehicle_SPAWN_Y], GLOBAL_VEHICLES[i][gb_vehicle_SPAWN_Z]);
		GetVehicleZAngle(i, GLOBAL_VEHICLES[i][gb_vehicle_SPAWN_ANGLE]);
		GetVehicleHealth(i, GLOBAL_VEHICLES[i][gb_vehicle_HEALTH]);
		if (GLOBAL_VEHICLES[i][gb_vehicle_HEALTH] > 1000.0) GLOBAL_VEHICLES[i][gb_vehicle_HEALTH] = 1000.0;
		if (GLOBAL_VEHICLES[i][gb_vehicle_HEALTH] < MIN_VEHICLE_HEALTH) GLOBAL_VEHICLES[i][gb_vehicle_HEALTH] = MIN_VEHICLE_HEALTH;
		GetVehicleDamageStatus(i, GLOBAL_VEHICLES[i][gb_vehicle_DAMAGE_PANELS], GLOBAL_VEHICLES[i][gb_vehicle_DAMAGE_DOORS], GLOBAL_VEHICLES[i][gb_vehicle_DAMAGE_LIGHTS], GLOBAL_VEHICLES[i][gb_vehicle_DAMAGE_TIRES]);
    	GLOBAL_VEHICLES[i][gb_vehicle_WORLD] = 0; /*GetVehicleVirtualWorld(i);*/

		new DB_Query[1700];
		format(DB_Query, sizeof DB_Query,
			"\
			UPDATE `PLAYER_VEHICLES` SET \
			`PLATE` = '%q',\
			`MODELID` = '%d',\
			`SPAWN_X` = '%f',\
			`SPAWN_Y` = '%f',\
			`SPAWN_Z` = '%f',\
			`SPAWN_ANGLE` = '%f',\
			`HEALTH` = '%f',\
			`DAMAGE_PANELS` = '%d',\
			`DAMAGE_DOORS` = '%d',\
			`DAMAGE_LIGHTS` = '%d',\
			`DAMAGE_TIRES` = '%d',\
			`COLOR_1` = '%d',\
			`COLOR_2` = '%d',\
			`PAINTJOB` = '%d',\
			`GAS` = '%f',\
			`MAX_GAS` = '%f',\
			`CLOSED` = '%d',\
			`INTERIOR` = '%d',\
			`WORLD` = '%d',\
			`STATE` = '%d' \
			WHERE `ID` = '%d';\
			",
			GLOBAL_VEHICLES[i][gb_vehicle_NUMBER_PLATE],
			GLOBAL_VEHICLES[i][gb_vehicle_MODELID],
			GLOBAL_VEHICLES[i][gb_vehicle_SPAWN_X],
			GLOBAL_VEHICLES[i][gb_vehicle_SPAWN_Y],
			GLOBAL_VEHICLES[i][gb_vehicle_SPAWN_Z],
			GLOBAL_VEHICLES[i][gb_vehicle_SPAWN_ANGLE],
			GLOBAL_VEHICLES[i][gb_vehicle_HEALTH],
			GLOBAL_VEHICLES[i][gb_vehicle_DAMAGE_PANELS],
			GLOBAL_VEHICLES[i][gb_vehicle_DAMAGE_DOORS],
			GLOBAL_VEHICLES[i][gb_vehicle_DAMAGE_LIGHTS],
			GLOBAL_VEHICLES[i][gb_vehicle_DAMAGE_TIRES],
			GLOBAL_VEHICLES[i][gb_vehicle_COLOR_1],
			GLOBAL_VEHICLES[i][gb_vehicle_COLOR_2],
			GLOBAL_VEHICLES[i][gb_vehicle_PAINTJOB],
			GLOBAL_VEHICLES[i][gb_vehicle_GAS],
			GLOBAL_VEHICLES[i][gb_vehicle_MAX_GAS],
			GLOBAL_VEHICLES[i][gb_vehicle_PARAMS_DOORS],
			GLOBAL_VEHICLES[i][gb_vehicle_INTERIOR],
			GLOBAL_VEHICLES[i][gb_vehicle_WORLD],
			GLOBAL_VEHICLES[i][gb_vehicle_STATE],

			PLAYER_VEHICLES[i][player_vehicle_ID]
		);

		printf("%s", DB_Query);
		db_free_result(db_query(Database, DB_Query));

		for(new x = 0; x != MAX_VEHICLE_COMPONENTS; x ++)
		{
			DB_Query[0] = EOS;

			format(DB_Query, sizeof DB_Query,
				"\
				UPDATE `PLAYER_VEHICLE_COMPONENTS` SET \
				`SLOT_0` = '%d',\
				`SLOT_1` = '%d',\
				`SLOT_2` = '%d',\
				`SLOT_3` = '%d',\
				`SLOT_4` = '%d',\
				`SLOT_5` = '%d',\
				`SLOT_6` = '%d',\
				`SLOT_7` = '%d',\
				`SLOT_8` = '%d',\
				`SLOT_9` = '%d',\
				`SLOT_10` = '%d',\
				`SLOT_11` = '%d',\
				`SLOT_12` = '%d',\
				`SLOT_13` = '%d' \
				WHERE `ID_VEHICLE` = '%d';\
				",
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][0],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][1],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][2],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][3],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][4],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][5],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][6],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][7],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][8],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][9],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][10],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][11],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][12],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][13],

				PLAYER_VEHICLES[i][player_vehicle_ID]
			);

			printf("%s", DB_Query);
			db_free_result(db_query(Database, DB_Query));
		}

		if (destroy) DestroyVehicleEx(i);
	}
	return 1;
}

UpdateVehicleParams(vehicleid)
{
	return SetVehicleParamsEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE], GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_LIGHTS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ALARM], GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_DOORS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_BONNET], GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_BOOT], GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_OBJECTIVE]);
}

SetVehicleHealthEx(vehicleid, Float:health, forplayerid = INVALID_PLAYER_ID)
{
	if (forplayerid != INVALID_PLAYER_ID) PLAYER_AC_INFO[forplayerid][CHEAT_VEHICLE_HEALTH][p_ac_info_IMMUNITY] = gettime() + 1;

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = health;
	if (health > 375.0) GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;
	SetVehicleHealth(vehicleid, health);
	return 1;
}

RepairVehicleEx(vehicleid, forplayerid = INVALID_PLAYER_ID)
{
	if (forplayerid != INVALID_PLAYER_ID) PLAYER_AC_INFO[forplayerid][CHEAT_VEHICLE_HEALTH][p_ac_info_IMMUNITY] = gettime() + 1;

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_LAST_REPAIR_TIME] = gettime();
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = 1000.0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_PANELS] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_DOORS] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_LIGHTS] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_TIRES] = 0;
	SetVehicleHealthEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH]);
	RepairVehicle(vehicleid);
	return 1;
}

SetVehiclePosEx(vehicleid, Float:x, Float:y, Float:z)
{
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_TP_IMMUNITY] = gettime() + 5;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][0] = x;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][1] = y;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][2] = z;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_ATTACHED_TO] = INVALID_VEHICLE_ID;
	return SetVehiclePos(vehicleid, x, y, z);
}

LinkVehicleToInteriorEx(vehicleid, interior)
{
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_TP_IMMUNITY] = gettime() + 5;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_INTERIOR] = interior;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_ATTACHED_TO] = INVALID_VEHICLE_ID;
	return LinkVehicleToInterior(vehicleid, interior);
}

SetVehicleToRespawnEx(vehicleid)
{
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWNED] = false;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_ATTACHED_TO] = INVALID_VEHICLE_ID;
	return SetVehicleToRespawn(vehicleid);
}

SetPlayerVehiclePark(playerid)
{
	new vehicleid = INVALID_VEHICLE_ID;
	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER || GetPlayerState(playerid) == PLAYER_STATE_PASSENGER) vehicleid = GetPlayerVehicleID(playerid);

	if (vehicleid == INVALID_VEHICLE_ID) return ShowPlayerMessage(playerid, "~r~No estás en tu vehículo para aparcarlo.", 2);
	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Este no es tú vehículo.", 2);
	if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~Este no es tú vehículo.", 2);

	new Float:x, Float:y, Float:z, Float:angle;
	GetVehiclePos(vehicleid, x, y, z);
	GetVehicleZAngle(vehicleid, angle);

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_X] = x;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Y] = y;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Z] = z;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_ANGLE] = angle;

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_LAST_CLOSED_TIME] = gettime();
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_LIGHTS] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_DOORS] = 1;
	UpdateVehicleParams(vehicleid);
	ShowPlayerNotification(playerid, "Has estacionado tu vehículo, cuando sea destruido o spawneado volverá a aparecer aquí.", 5);
	return 1;
}

AddVehicleComponents(vehicleid)
{
	for(new i = 0; i != MAX_VEHICLE_COMPONENTS; i ++)
	{
		RemoveVehicleComponent(vehicleid, i);

		if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_COMPONENTS][i]) continue;
		AddVehicleComponent(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_COMPONENTS][i]);
	}
	return 1;
}

DestroyVehicleEx(vehicleid)
{
	if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_VALID]) return false;

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] != INVALID_PLAYER_ID)
	{
		PLAYER_AC_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] ][CHEAT_VEHICLE_HEALTH][p_ac_info_IMMUNITY] = gettime() + 1;
		PLAYER_AC_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] ][CHEAT_STATE_SPAMMER][p_ac_info_IMMUNITY] = gettime() + 1;
	}

	if (DestroyVehicle(vehicleid))
	{
		if (IsValidDynamic3DTextLabel(GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL]))
		{
			DestroyDynamic3DTextLabel(GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL]);
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL] = Text3D:INVALID_STREAMER_ID;
		}

		new temp_GLOBAL_VEHICLES[Global_Vehicles_Info]; GLOBAL_VEHICLES[vehicleid] = temp_GLOBAL_VEHICLES;
		new temp_PLAYER_VEHICLES[Player_Vehicles_Info]; PLAYER_VEHICLES[vehicleid] = temp_PLAYER_VEHICLES;
		new temp_SELL_VEHICLES[SELL_VEHICLES_Enum]; SELL_VEHICLES[vehicleid] = temp_SELL_VEHICLES;

		new temp_VEHICLE_BOOT[enum_VEHICLE_BOOT];
		for(new i = 0; i != MAX_BOOT_SLOTS; i ++) VEHICLE_BOOT[vehicleid][i] = temp_VEHICLE_BOOT;

		new temp_VEHICLE_OBJECTS[e_VEHICLE_OBJECTS];
		for(new i = 0; i != MAX_SU_VOBJECTS; i ++)
		{
			if (VEHICLE_OBJECTS[vehicleid][i][vobject_OBJECT_ID] != INVALID_STREAMER_ID) DestroyDynamicObject(VEHICLE_OBJECTS[vehicleid][i][vobject_OBJECT_ID]);
			VEHICLE_OBJECTS[vehicleid][i] = temp_VEHICLE_OBJECTS;
		}

		return true;
	}
	return false;
}

ShowPlayerSpeedoMeter(playerid)
{
	if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 0;
	new vehicleid = GetPlayerVehicleID(playerid), modelid = GetVehicleModel(vehicleid);
	if (!VEHICLE_INFO[modelid - 400][vehicle_info_VALID]) return 0;
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][8]);

	new td_str[64];
	format(td_str, sizeof td_str, "%.1f", GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS]);
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][11], td_str);

	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][0]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][2]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][3]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][4]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][5]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][6]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][7]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][8]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][9]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][10]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][11]);

	PLAYER_TEMP[playerid][py_SPEEDOMETER] = true;
	PLAYER_TEMP[playerid][py_FUEL_DOWN_TIME] = gettime();
	PLAYER_TEMP[playerid][py_TIMERS][8] = SetTimerEx("UpdatePlayerSpeedo", 500, true, "iif", playerid, vehicleid, VEHICLE_INFO[modelid - 400][vehicle_info_MAX_VEL]);
	return 1;
}

HidePlayerSpeedoMeter(playerid)
{
	PLAYER_TEMP[playerid][py_SPEEDOMETER] = false;
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][8]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][0]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][1]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][2]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][3]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][4]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][5]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][6]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][7]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][8]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][9]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][10]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][11]);
	return 1;
}

Float:GetVehicleSpeed(vehicleid)
{
    new Float:vx, Float:vy, Float:vz;
    GetVehicleVelocity(vehicleid, vx, vy, vz);
	new Float:vel = floatmul(floatsqroot(floatadd(floatadd(floatpower(vx, 2), floatpower(vy, 2)),  floatpower(vz, 2))), 181.5);
	return vel;
}

VehiclePaintjob(modelid)
{
	switch(modelid)
	{
		case 483: return 1;
		case 534..536: return 3;
		case 558..562: return 3;
		case 565, 567: return 3;
		case 575: return 2;
		case 576: return 3;
	}
	return false;
}

/*GetPlayerVehicleAvaibleBootSlot(vehicleid)
{
	new max_slots = VEHICLE_INFO[GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400][vehicle_info_BOOT_SLOTS];
	if (max_slots > MAX_BOOT_SLOTS) max_slots = MAX_BOOT_SLOTS;

	for(new i = 0; i != max_slots; i ++)
	{
		if (!VEHICLE_BOOT[vehicleid][i][vehicle_boot_VALID]) return i;
	}
	return -1;
}

SavePlayerWeaponInVehicleBoot(playerid, weapon_slot, vehicleid, boot_slot)
{
	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_ID]) return 0;

	VEHICLE_BOOT[vehicleid][boot_slot][vehicle_boot_VALID] = true;
	VEHICLE_BOOT[vehicleid][boot_slot][vehicle_boot_TYPE] = BOOT_TYPE_WEAPON;
	VEHICLE_BOOT[vehicleid][boot_slot][vehicle_boot_INT] = PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_ID];
	VEHICLE_BOOT[vehicleid][boot_slot][vehicle_boot_INT_EXTRA] = PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_AMMO];

	new DBResult:Result, DB_Query[256];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `VEHICLE_BOOT`\
		(\
			`ID_VEHICLE`, `TYPE`, `INT`, `INT_EXTRA`\
		)\
		VALUES\
		(\
			'%d', '%d', '%d', '%d'\
		);\
		SELECT MAX(`ID_OBJECT`) FROM `VEHICLE_BOOT`;\
	",
		PLAYER_VEHICLES[vehicleid][player_vehicle_ID], VEHICLE_BOOT[vehicleid][boot_slot][vehicle_boot_TYPE], VEHICLE_BOOT[vehicleid][boot_slot][vehicle_boot_INT], VEHICLE_BOOT[vehicleid][boot_slot][vehicle_boot_INT_EXTRA]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result)) VEHICLE_BOOT[vehicleid][boot_slot][vehicle_boot_OBJECT_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);

	RemovePlayerSlotWeapon(playerid, weapon_slot, true);
	return 1;
}*/

CheckAndOpenBoot(playerid, type)
{
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 0;

	new vehicleid = GetPlayerCameraTargetVehicle(playerid);
	if (vehicleid == INVALID_VEHICLE_ID) return 0;
	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return 0;
	if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID] || IsPlayerInKeys(PLAYER_VEHICLES[vehicleid][player_vehicle_ID], ACCOUNT_INFO[playerid][ac_ID]))
	{
		PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] = vehicleid;
		ResetItemBody(playerid);

		switch(type)
		{
			case 0: ShowInventory(playerid, 3); // Sacar
			case 1: ShowInventory(playerid, 4); // Meter
		}
	}
	return 1;
}