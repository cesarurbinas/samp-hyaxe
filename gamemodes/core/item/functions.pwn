IsWeaponType(type)
{
	switch(type)
	{
		case 12..33: return true;
	}
	return false;
}

IsDrugType(type)
{
	switch(type)
	{
		case 3, 4, 6, 7, 8, 38: return true;
	}
	return false;
}

TypeToWeapon(type)
{
	switch(type)
	{
		case 12: return 5;
		case 13: return 3;
		case 14: return 4;
		case 15: return 6;
		case 16: return 7;
		case 17: return 17;
		case 18: return 2;
		case 19: return 1;
		case 20: return 22;
		case 21: return 23;
		case 22: return 24;
		case 23: return 25;
		case 24: return 26;
		case 25: return 28;
		case 26: return 29;
		case 27: return 30;
		case 28: return 31;
		case 29: return 32;
		case 30: return 33;
		case 31: return 41;
		case 32: return 43;
		case 33: return 46;
		
		default: return 0;
	}
	return false;
}

WeaponToType(weapon)
{
	switch(weapon)
	{
		case 5: return 12;
		case 3: return 13;
		case 4: return 14;
		case 6: return 15;
		case 7: return 16;
		case 17: return 17;
		case 2: return 18;
		case 1: return 19;
		case 23: return 21;
		case 22: return 20;
		case 24: return 22;
		case 25: return 23;
		case 26: return 24;
		case 28: return 25;
		case 29: return 26;
		case 30: return 27;
		case 31: return 28;
		case 32: return 29;
		case 33: return 30;
		case 41: return 31;
		case 43: return 32;
		case 46: return 33;
		
		default: return 0;
	}
	return false;
}

GetFreeDropItemSlot()
{
    new i = MAX_DROP_ITEMS;
    while (--i != 0)
    {
        if (!DROP_ITEMS[i][itm_VALID]) return i;
    }
    return -1;
}

CreateDropItem(type, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid, interiorid, const owner[] = "Null", ammount = 1, playerid = INVALID_PLAYER_ID)
{
	new index = GetFreeDropItemSlot();
	if (index == -1) return Logger_Error("Todos los slots de item sueltos estan ocupados.");

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

		if (playerid != INVALID_PLAYER_ID)
		{
			new Float:px, Float:py, Float:pz;
			GetPlayerPos(playerid, px, py, pz);

			if ( (pz + 2.0) < z )
			{
				x = px;
				y = py;
				z = pz - 0.9;
			}
		}
		
		switch(type)
		{
			case 41: z += 0.3;
			case 48: z += 0.7;
			case 33: z += 0.2;
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

DeletePlayerItems(playerid)
{
	if (PLAYER_WORKS[playerid][WORK_POLICE]) return 0;
	
	new DB_Query[140];

	format(DB_Query, sizeof DB_Query,
		"DELETE FROM `PLAYER_INVENTORY` WHERE `ID_USER` = '%d';",
		ACCOUNT_INFO[playerid][ac_ID]
	);
	db_free_result(db_query(Database, DB_Query));

	return 1;
}

DeleteIlegalItems(playerid, drugs = true)
{
	if (PLAYER_WORKS[playerid][WORK_POLICE]) return 0;
	
	new
		DBResult:Result,
		DB_Query[140],
		id,
		type
	;

	format(DB_Query, sizeof DB_Query, "SELECT * FROM `PLAYER_INVENTORY` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		for(new i; i < db_num_rows(Result); i++ )
		{
			id = db_get_field_assoc_int(Result, "ID");
			type = db_get_field_assoc_int(Result, "TYPE");
			
			if (IsWeaponType(type))
			{
				format(DB_Query, sizeof DB_Query,
					"DELETE FROM `PLAYER_INVENTORY` WHERE `ID` = '%d';",
					id
				);
				db_free_result(db_query(Database, DB_Query));
			}

			if (drugs && IsDrugType(type))
			{
				format(DB_Query, sizeof DB_Query,
					"DELETE FROM `PLAYER_INVENTORY` WHERE `ID` = '%d';",
					id
				);
				db_free_result(db_query(Database, DB_Query));
			}
			db_next_row(Result);
		}
		db_free_result(Result);
	}

	return 1;
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

SubtractItem(playerid, type, extra = 1)
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

		format(DB_Query, sizeof DB_Query, "SELECT * FROM `PLAYER_INVENTORY` WHERE `ID` = '%d';", already_exists);
		new DBResult:Result = db_query(Database, DB_Query);

		if (db_num_rows(Result))
		{
			for(new i; i < db_num_rows(Result); i++ )
			{
				new amount = db_get_field_assoc_int(Result, "EXTRA");
				if (amount <= 0)
				{
					format(DB_Query, sizeof DB_Query,
						"DELETE FROM `PLAYER_INVENTORY` WHERE `ID` = '%d';",
						already_exists
					);
					db_free_result(db_query(Database, DB_Query));
				}
				break;
			}
			db_free_result(Result);
		}
	}
	
	if (already_exists && ITEM_INFO[type][item_SINGLE_SLOT])
	{
		format(DB_Query, sizeof DB_Query,
			"DELETE FROM `PLAYER_INVENTORY` WHERE `ID` = '%d';",
			already_exists
		);
		db_free_result(db_query(Database, DB_Query));
	}

	ResetItemBody(playerid);
	return 1;
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
		case 9, 10, 11, 39: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.2910, -0.0060, 0.0149, -81.2000, -88.4000, 95.5000, 0.6470, 0.5799, 0.9489, 0xFFFFFFFF, 0xFFFFFFFF);
		case 12..33: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.0040, -0.0000, -0.0000, 0.5999, -0.2000, 0.4000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
		case 34: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.0970, 0.0429, 0.0149, 2.7999, -83.7000, -81.7000, 1.0330, 1.1429, 0.8569, 0xFFFFFFFF, 0xFFFFFFFF);
		case 35: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.0620, 0.0199, 0.0149, 9.1999, 171.9999, 103.0999, 0.8920, 0.9029, 1.0589, 0xFFFFFFFF, 0xFFFFFFFF);
		case 36: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.0789, 0.0000, 0.2580, -86.0000, -97.5000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
		case 37: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.0699, 0.0289, 0.0000, -75.9000, -5.8000, -84.7999, 0.6219, 0.6579, 0.5109, 0xFFFFFFFF, 0xFFFFFFFF);
		case 38: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
		case 40: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.0649, 0.0180, 0.0260, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
		case 41: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.2209, 0.0000, 0.0539, -4.3999, -90.0999, 41.0000, 0.4979, 0.5780, 0.5470, 0xFFFFFFFF, 0xFFFFFFFF);
		case 42..44: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.0659, 0.0549, 0.0000, 78.6999, 0.0000, 0.0000, 0.4990, 0.5360, 0.6230, 0xFFFFFFFF, 0xFFFFFFFF);
		case 45..47: SetPlayerAttachedObject(playerid, 9, ITEM_INFO[type][item_MODELID], 6, 0.1480, 0.0000, 0.0000, -0.9000, -98.7000, 0.0000, 0.8480, 0.8320, 0.6209, 0xFFFFFFFF, 0xFFFFFFFF);
		case 49: SetPlayerAttachedObject(playerid, 9, 2703, 6, 0.0659, 0.0290, 0.0000, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // CJ_BURG_1 attached to the Right Hand of Atom
		case 50: SetPlayerAttachedObject(playerid, 9, 2769, 6, 0.0710, 0.0530, 0.0300, 0.0000, -97.7999, 153.1000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // CJ_CJ_BURG2 attached to the Right Hand of Atom
		case 51: SetPlayerAttachedObject(playerid, 9, 2804, 6, 0.1209, 0.0380, 0.1460, 79.5999, 0.0000, 0.0000, 0.7179, 0.5869, 0.7480, 0xFFFFFFFF, 0xFFFFFFFF); // CJ_MEAT_1 attached to the Right Hand of Atom
		case 52: SetPlayerAttachedObject(playerid, 9, 19847, 6, 0.0769, 0.0300, 0.0150, -96.4999, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // LegHam1 attached to the Right Hand of Atom
		case 53: SetPlayerAttachedObject(playerid, 9, 19574, 6, 0.0619, 0.0520, 0.0000, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // Orange1 attached to the Right Hand of Atom
		case 54: SetPlayerAttachedObject(playerid, 9, 19883, 6, 0.0959, 0.0270, 0.0130, 104.7999, 13.6000, 0.0000, 1.0660, 1.1139, 1.5809, 0xFFFFFFFF, 0xFFFFFFFF); // BreadSlice1 attached to the Right Hand of Atom
		case 55: SetPlayerAttachedObject(playerid, 9, 19569, 6, 0.0839, 0.0899, -0.0969, 9.8000, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // MilkCarton1 attached to the Right Hand of Atom
		case 56: SetPlayerAttachedObject(playerid, 9, 19563, 6, 0.0909, 0.0719, -0.1079, 6.4000, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // JuiceBox1 attached to the Right Hand of Atom
		case 57: SetPlayerAttachedObject(playerid, 9, 19564, 6, 0.0909, 0.0719, -0.1079, 6.4000, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // JuiceBox2 attached to the Right Hand of Atom
		case 58: SetPlayerAttachedObject(playerid, 9, 11722, 6, 0.0629, 0.0469, 0.0689, 0.0000, 0.0000, 0.0000, 0.7380, 0.6900, 1.1240, 0xFFFFFFFF, 0xFFFFFFFF); // SauceBottle1 attached to the Right Hand of Atom
		case 59: SetPlayerAttachedObject(playerid, 9, 19567, 6, 0.1489, 0.1350, 0.0330, 104.7000, 5.4999, 94.8999, 0.8380, 0.8640, 0.7969, 0xFFFFFFFF, 0xFFFFFFFF); // IcecreamContainer1 attached to the Right Hand of Atom
		case 60: SetPlayerAttachedObject(playerid, 9, 19568, 6, 0.1489, 0.1350, 0.0330, 104.7000, 5.4999, 94.8999, 0.8380, 0.8640, 0.7969, 0xFFFFFFFF, 0xFFFFFFFF); // IcecreamContainer1 attached to the Right Hand of Atom
		case 61: SetPlayerAttachedObject(playerid, 9, 2814, 6, 0.2049, 0.0320, 0.0220, 97.1999, 0.0000, -173.1999, 0.7210, 0.7460, 0.6449, 0xFFFFFFFF, 0xFFFFFFFF); // GB_takeaway01 attached to the Right Hand of Atom
		case 62: SetPlayerAttachedObject(playerid, 9, 19564, 6, 0.0909, 0.0719, -0.1079, 6.4000, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // JuiceBox2 attached to the Right Hand of Atom
		case 63: SetPlayerAttachedObject(playerid, 9, 1484, 6, 0.0080, -0.0100, 0.0990, 0.0000, 36.5999, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // CJ_BEAR_BOTTLE attached to the Right Hand of Atom
		case 64: SetPlayerAttachedObject(playerid, 9, 19823, 6, 0.0839, 0.0469, -0.1159, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // AlcoholBottle4 attached to the Right Hand of Atom
		case 65: SetPlayerAttachedObject(playerid, 9, 19824, 6, 0.0619, 0.0639, -0.0939, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // AlcoholBottle5 attached to the Right Hand of Atom
		case 66: SetPlayerAttachedObject(playerid, 9, 1544, 6, 0.0509, 0.0200, -0.0910, 0.0000, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // CJ_BEER_B_1 attached to the Right Hand of Atom
		case 67: SetPlayerAttachedObject(playerid, 9, 2768, 6, 0.0959, 0.0480, 0.0190, 105.0999, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // CJ_CB_BURG attached to the Right Hand of Atom
		case 68: SetPlayerAttachedObject(playerid, 9, 19835, 6, 0.0729, 0.0409, 0.0290, 9.7000, 0.0000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF); // CoffeeCup1 attached to the Right Hand of Atom
		case 69: SetPlayerAttachedObject(playerid, 9, 2202, 6, 0.3539, -0.1079, 0.1069, 0.0000, -99.9000, 87.6999, 0.1739, 0.6760, 0.2420, 0xFFFFFFFF, 0xFFFFFFFF); // PHOTOCOPIER_2 attached to the Right Hand of Atom
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

ConsumeFood(playerid, food_id)
{
	if (PLAYER_TEMP[playerid][py_EATING]) return 0;
	PLAYER_TEMP[playerid][py_EATING] = true;

	new item_id = food_id + 49;
	SubtractItem(playerid, item_id);
	ShowPlayerNotification(playerid, sprintf("Has consumido: ~y~%s", ITEM_INFO[item_id][item_NAME]), 4);
	SetPlayerChatBubble(playerid, sprintf("\n\n\n\n* Consume alimento (%s).\n\n\n", ITEM_INFO[item_id][item_NAME]), 0xffcb90FF, 20.0, 5000);
	
	Add_Hungry_Thirst(playerid, FOOD_INFO[food_id][food_HUNGRY], FOOD_INFO[food_id][food_THIRST]);
	SetPlayerDrunkLevel(playerid, FOOD_INFO[food_id][food_DRUNK_LEVEL]);

	if (FOOD_INFO[food_id][food_ANIM])
	{
		ApplyAnimation(playerid, "BAR", "dnk_stndM_loop", 4.0, 0, 1, 1, 0, 2000);
		SetTimerEx("FinishEat", 2000, false, "i", playerid);
	}
	else
	{
		ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 0, 0, 0, 0, 0, 0);
		ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 4.1, false, true, true, false, 1000);
		SetTimerEx("FinishEat", 1000, false, "i", playerid);
	}
	return 1;
}