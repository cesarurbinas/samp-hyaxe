GetFreeDropItemSlot()
{
    new i = MAX_DROP_ITEMS;
    while (--i != 0)
    {
        if (!DROP_ITEMS[i][itm_VALID]) return i;
    }
    return -1;
}

CreateDropItem(type, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid, interiorid, const owner[] = "Null", ammount = 1)
{
	new index = GetFreeDropItemSlot();
	if (index == -1) return print("[DEBUG] Error: Todos los slots de item sueltos estan ocupados.");

	DROP_ITEMS[index][itm_ID] = CreateDynamicObject(ITEM_INFO[type][item_MODELID], x, y, z, rx, ry, rz, worldid, interiorid, .streamdistance = 80.0, .drawdistance = 80.0);
	DROP_ITEMS[index][itm_VALID] = true;
	DROP_ITEMS[index][itm_TYPE] = type;
	DROP_ITEMS[index][itm_AMMOUNT] = ammount;
	DROP_ITEMS[index][itm_WORLD] = worldid;
	DROP_ITEMS[index][itm_INTERIOR] = interiorid;
	format(DROP_ITEMS[index][itm_OWNER], 24, owner);

	if (interiorid == 0)
	{
		CA_FindZ_For2DCoord(x, y, z);
		
		switch(type)
		{
			case 57: z += 0.3;
			case 64: z += 0.4;
		}

		MoveDynamicObject(DROP_ITEMS[index][itm_ID], x, y, z, 12.0, rx, ry, rz);
	}

	new str_text[72];
	format(str_text, sizeof(str_text), "{FFFFFF}%s", ITEM_INFO[type][item_NAME]);
	DROP_ITEMS[index][itm_LABEL] = CreateDynamic3DTextLabel(str_text, 0xFFFFFF00, x, y, z + 0.4, 3.0, .testlos = true, .worldid = worldid, .interiorid = interiorid);

	SetTimerEx("DeleteDropItem", DELETE_ITEM_TIME, false, "i", index);
	return 1;
}

AddItemToProperty(property_id, type, extra)
{
	new
		id,
		DB_Query[164],
		DBResult:Result
	;

	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PROPERTY_STORAGE`\
		(\
			`ID_PROPERTY`, `TYPE`, `EXTRA`\
		)\
		VALUES\
		(\
			'%d', '%d', '%d'\
		);\
		SELECT MAX(`ID`) FROM `PROPERTY_STORAGE`;\
	",
		property_id,
		type,
		extra
	);

	Result = db_query(Database, DB_Query);
	if (db_num_rows(Result)) id = db_get_field_int(Result, 0);
	db_free_result(Result);

	return id;
}

ItemAlreadyInProperty(property_id, type)
{
	new
		DBResult:Result,
		DB_Query[140],
		id
	;

	format(DB_Query, sizeof DB_Query, "SELECT * FROM `PROPERTY_STORAGE` WHERE `TYPE` = '%d' AND `ID_PROPERTY` = '%d';", type, property_id);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		for(new i; i < db_num_rows(Result); i++ )
		{
			id = db_get_field_assoc_int(Result, "ID");
			break;
		}
		db_free_result(Result);

		return id;
	}

	if (db_num_rows(Result)) return true;
	return false;
}

GetPropertyItemsCount(property_id)
{
	new
		DBResult:Result,
		DB_Query[140],
		count
	;

	format(DB_Query, sizeof DB_Query, "SELECT * FROM `PROPERTY_STORAGE` WHERE `ID_PROPERTY` = '%d';", property_id);
	Result = db_query(Database, DB_Query);

	count = db_num_rows(Result);
	db_free_result(Result);

	return count;
}

AddItemToVehicle(vehicle_id, type, extra)
{
	new
		id,
		DB_Query[164],
		DBResult:Result
	;

	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `VEHICLE_STORAGE`\
		(\
			`ID_VEHICLE`, `TYPE`, `EXTRA`\
		)\
		VALUES\
		(\
			'%d', '%d', '%d'\
		);\
		SELECT MAX(`ID`) FROM `VEHICLE_STORAGE`;\
	",
		vehicle_id,
		type,
		extra
	);

	Result = db_query(Database, DB_Query);
	if (db_num_rows(Result)) id = db_get_field_int(Result, 0);
	db_free_result(Result);

	return id;
}

ItemAlreadyInVehicle(vehicle_id, type)
{
	new
		DBResult:Result,
		DB_Query[140],
		id
	;

	format(DB_Query, sizeof DB_Query, "SELECT * FROM `VEHICLE_STORAGE` WHERE `TYPE` = '%d' AND `ID_VEHICLE` = '%d';", type, vehicle_id);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		for(new i; i < db_num_rows(Result); i++ )
		{
			id = db_get_field_assoc_int(Result, "ID");
			break;
		}
		db_free_result(Result);

		return id;
	}

	if (db_num_rows(Result)) return true;
	return false;
}

GetVehicleItemsCount(vehicle_id)
{
	new
		DBResult:Result,
		DB_Query[140],
		count
	;

	format(DB_Query, sizeof DB_Query, "SELECT * FROM `VEHICLE_STORAGE` WHERE `ID_VEHICLE` = '%d';", vehicle_id);
	Result = db_query(Database, DB_Query);

	count = db_num_rows(Result);
	db_free_result(Result);

	return count;
}

PlayerAlreadyHasItem(playerid, type)
{
	new
		DBResult:Result,
		DB_Query[140],
		id
	;

	format(DB_Query, sizeof DB_Query, "SELECT * FROM `PLAYER_INVENTORY` WHERE `TYPE` = '%d' AND `ID_USER` = '%d';", type, ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		for(new i; i < db_num_rows(Result); i++ )
		{
			id = db_get_field_assoc_int(Result, "ID");
			break;
		}
		db_free_result(Result);

		return id;
	}

	if (db_num_rows(Result)) return true;
	return false;
}

AddPlayerItem(playerid, type, extra = 1)
{
	new
		DB_Query[164],
		already_exists = PlayerAlreadyHasItem(playerid, type)
	;

	if (ITEM_INFO[type][item_SINGLE_SLOT])
		already_exists = false;

	if (already_exists)
	{
		format(DB_Query, sizeof DB_Query,
			"UPDATE `PLAYER_INVENTORY` SET `EXTRA` = EXTRA + '%d' WHERE `ID` = '%d';",
			extra,
			already_exists
		);
		db_free_result(db_query(Database, DB_Query));
	}
	else
	{
		new
			id,
			DBResult:Result
		;

		format(DB_Query, sizeof DB_Query,
		"\
			INSERT INTO `PLAYER_INVENTORY`\
			(\
				`ID_USER`, `TYPE`, `EXTRA`\
			)\
			VALUES\
			(\
				'%d', '%d', '%d'\
			);\
			SELECT MAX(`ID`) FROM `PLAYER_INVENTORY`;\
		",
			ACCOUNT_INFO[playerid][ac_ID],
			type,
			extra
		);

		Result = db_query(Database, DB_Query);
		if (db_num_rows(Result)) id = db_get_field_int(Result, 0);
		db_free_result(Result);

		return id;
	}
	return false;
}

SubtractItem(playerid, type, ammount = 1)
{
	new
		DB_Query[164],
		already_exists = PlayerAlreadyHasItem(playerid, type)
	;

	if (already_exists && !ITEM_INFO[type][item_SINGLE_SLOT])
	{
		format(DB_Query, sizeof DB_Query,
			"UPDATE `PLAYER_INVENTORY` SET `EXTRA` = EXTRA - '%d' WHERE `ID` = '%d';",
			extra,
			already_exists
		);
		db_free_result(db_query(Database, DB_Query));
	}
	
	if (already_exists && ITEM_INFO[type][item_SINGLE_SLOT])
	{
		format(DB_Query, sizeof DB_Query,
			"DELETE FROM `PLAYER_INVENTORY` WHERE `ID` = '%d';",
			already_exists
		);
		db_free_result(db_query(Database, DB_Query));
	}
	return 1;
}

TypeToWeapon(type)
{
	new weapon;
	switch(type)
	{
		case 12: weapon = 5;//bat
		case 13: weapon = 3;//porra
		case 14: weapon = 4;//knife
		case 15: weapon = 6;//pala
		case 16: weapon = 7;//pool
		case 17: weapon = 17;
		case 18: weapon = 2;//golf
		case 19: weapon = 1;//punio
		case 22: weapon = 22;
		case 23: weapon = 23;
		case 24: weapon = 24;
		case 25: weapon = 25;
		case 26: weapon = 26;
		case 28: weapon = 28;
		case 29: weapon = 29;
		case 30: weapon = 30;
		case 31: weapon = 31;
		case 32: weapon = 32;
		case 33: weapon = 33;
		case 41: weapon = 41;
		case 43: weapon = 43;
		case 46: weapon = 46;
	}
	return weapon;
}

IsWeaponType(type)
{
	switch(type)
	{
		case 12: return true;//bat
		case 13: return true;//porra
		case 14: return true;//knife
		case 15: return true;//pala
		case 16: return true;//pool
		case 17: return true;
		case 18: return true;//golf
		case 19: return true;//punio
		case 22: return true;
		case 23: return true;
		case 24: return true;
		case 25: return true;
		case 26: return true;
		case 28: return true;
		case 29: return true;
		case 30: return true;
		case 31: return true;
		case 32: return true;
		case 33: return true;
		case 41: return true;
		case 43: return true;
		case 46: return true;
	}
	return false;
}

IsFullInventory(playerid)
{
	new free_slot = inv_GetFreeSlot(playerid);
	if(!free_slot) return 1;
	else return 0;
}

SetItemToBody(playerid, type)
{
	RemovePlayerAttachedObject(playerid, 9);

	switch(type)
	{
		case 0: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.2470, 0.0139, 0.0519, 0.5999, -102.4999, 0.4000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
		case 1: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.2470, 0.0139, 0.0069, 90.3999, 175.6999, 7.3000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
		case 2: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.0850, 0.0189, 0.0069, -157.9001, 175.6999, 7.3000, 1.2790, 1.3560, 1.4689, 0xFFFFFFFF, 0xFFFFFFFF);
		case 3, 4: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.0850, 0.0389, 0.0069, -81.2000, 175.6999, 7.3000, 0.3079, 0.3089, 0.2209, 0xFFFFFFFF, 0xFFFFFFFF);
		case 5: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.1430, 0.0249, 0.0149, -81.2000, -88.4000, 7.3000, 0.4980, 1.6589, 0.9489, 0xFFFFFFFF, 0xFFFFFFFF);
		case 6..8: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.1430, 0.0249, 0.0149, -81.2000, -88.4000, 7.3000, 0.4980, 0.5799, 0.9489, 0xFFFFFFFF, 0xFFFFFFFF);
		case 9, 10, 11, 55: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.2910, -0.0060, 0.0149, -81.2000, -88.4000, 95.5000, 0.6470, 0.5799, 0.9489, 0xFFFFFFFF, 0xFFFFFFFF);
		case 12..42: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.0040, -0.0000, -0.0000, 0.5999, -0.2000, 0.4000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
		case 50: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.0970, 0.0429, 0.0149, 2.7999, -83.7000, -81.7000, 1.0330, 1.1429, 0.8569, 0xFFFFFFFF, 0xFFFFFFFF);
		case 51: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.0620, 0.0199, 0.0149, 9.1999, 171.9999, 103.0999, 0.8920, 0.9029, 1.0589, 0xFFFFFFFF, 0xFFFFFFFF);
		case 52: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.0789, 0.0000, 0.2580, -86.0000, -97.5000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
		case 53: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.0699, 0.0289, 0.0000, -75.9000, -5.8000, -84.7999, 0.6219, 0.6579, 0.5109, 0xFFFFFFFF, 0xFFFFFFFF);
		case 54: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
		case 56: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.0649, 0.0180, 0.0260, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
		case 57: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.2209, 0.0000, 0.0539, -4.3999, -90.0999, 41.0000, 0.4979, 0.5780, 0.5470, 0xFFFFFFFF, 0xFFFFFFFF);
		case 58..60: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.0659, 0.0549, 0.0000, 78.6999, 0.0000, 0.0000, 0.4990, 0.5360, 0.6230, 0xFFFFFFFF, 0xFFFFFFFF);
		case 61, 62, 63: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.1480, 0.0000, 0.0000, -0.9000, -98.7000, 0.0000, 0.8480, 0.8320, 0.6209, 0xFFFFFFFF, 0xFFFFFFFF);
	}
	return 1;
}

ResetItemBody(playerid)
{
	RemovePlayerAttachedObject(playerid, 9);
	ResetPlayerWeapons(playerid);
	PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] = 9999;
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	return 1;
}