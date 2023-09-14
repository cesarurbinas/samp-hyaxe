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