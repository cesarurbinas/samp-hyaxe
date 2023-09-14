GetFreeDropItemSlot()
{
    new i = MAX_DROP_ITEMS;
    while (--i != 0)
    {
        if (!DROP_ITEMS[i][itm_VALID]) return i;
    }
    return -1;
}

CreateDropItem(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid, interiorid, const name[] = "Null", const owner[] = "Null", type, ammount = 1, color = 0x00F7F7F7)
{
	new index = GetFreeDropItemSlot();
	if (index == -1) return print("[DEBUG] Error: Todos los slots de item sueltos estan ocupados.");

	DROP_ITEMS[index][itm_ID] = CreateDynamicObject(modelid, x, y, z, rx, ry, rz, worldid, interiorid);
	DROP_ITEMS[index][itm_MODELID] = modelid;
	DROP_ITEMS[index][itm_VALID] = true;
	DROP_ITEMS[index][itm_TYPE] = type;
	DROP_ITEMS[index][itm_AMMOUNT] = ammount;
	DROP_ITEMS[index][itm_COLOR] = color;
	DROP_ITEMS[index][itm_WORLD] = worldid;
	DROP_ITEMS[index][itm_INTERIOR] = interiorid;
	format(DROP_ITEMS[index][itm_NAME], 64, name);
	format(DROP_ITEMS[index][itm_OWNER], 24, owner);

	//SetDynamicObjectMaterial(DROP_ITEMS[index][itm_ID], 0, -1, "none", "none", color);

	if (interiorid == 0)
	{
		CA_FindZ_For2DCoord(x, y, z);
		MoveDynamicObject(DROP_ITEMS[index][itm_ID], x, y, z, 12.0, rx, ry, rz);
	}

	new str_text[72];
	format(str_text, sizeof(str_text), "{FFFFFF}%s", name);
	DROP_ITEMS[index][itm_LABEL] = CreateDynamic3DTextLabel(str_text, 0xFFFFFF00, x, y, z + 0.4, 3.0, .testlos = true, .worldid = worldid, .interiorid = interiorid);

	SetTimerEx("DeleteDropItem", DELETE_ITEM_TIME, false, "i", index);
	return 1;
}

forward DeleteDropItem(index);
public DeleteDropItem(index)
{
	DestroyDynamicObject(DROP_ITEMS[index][itm_ID]);
	DestroyDynamic3DTextLabel(DROP_ITEMS[index][itm_LABEL]);

	DROP_ITEMS[index][itm_VALID] = false;
	DROP_ITEMS[index][itm_ID] = INVALID_STREAMER_ID;
	DROP_ITEMS[index][itm_MODELID] = INVALID_STREAMER_ID;
	DROP_ITEMS[index][itm_LABEL] = Text3D:INVALID_STREAMER_ID;
	DROP_ITEMS[index][itm_TYPE] = 0;
	DROP_ITEMS[index][itm_AMMOUNT] = 0;
	DROP_ITEMS[index][itm_WORLD] = 0;
	DROP_ITEMS[index][itm_INTERIOR] = 0;
	DROP_ITEMS[index][itm_OWNER] = EOS;
	DROP_ITEMS[index][itm_NAME] = EOS;
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