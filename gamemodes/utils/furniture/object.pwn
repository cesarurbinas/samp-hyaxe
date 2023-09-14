GetFurnitureTypeName(type)
{
	new name[64];

	switch(type)
	{
		case 0: name = "Cama";
		case 1: name = "Cuadro";
		case 2: name = "Deco.";
		case 3: name = "Elec.";
		case 4: name = "Ilum.";
		case 5: name = "Mesa";
		case 6: name = "Silla";
	}
	return name;
}

GetFreeSlotPropertyObject()
{
    for(new i = 0, j = MAX_FURNITURE_OBJECTS; i <= j; i++)
	{
		if (!PROPERTY_OBJECT[i][pobj_VALID]) return i;
	}
	return false;
}

CreatePropertyObjects(property_id, interior, world)
{
	new
		DBResult:Result,
		DB_Query[140]
	;

	format(DB_Query, sizeof DB_Query, "SELECT * FROM `PROPERTY_OBJECTS` WHERE `ID_PROPERTY` = '%d' ORDER BY `MODELID`;", property_id);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		for(new i; i < db_num_rows(Result); i++ )
		{
			new slot = GetFreeSlotPropertyObject();
			PROPERTY_OBJECT[ slot ][pobj_VALID] = true;
			PROPERTY_OBJECT[ slot ][pobj_PROPERTY_ID] = db_get_field_assoc_int(Result, "ID_PROPERTY");
			PROPERTY_OBJECT[ slot ][pobj_DB_ID] = db_get_field_assoc_int(Result, "ID");
			PROPERTY_OBJECT[ slot ][pobj_MODELID] = db_get_field_assoc_int(Result, "MODELID");
			PROPERTY_OBJECT[ slot ][pobj_TYPE] = db_get_field_assoc_int(Result, "TYPE");
			db_get_field_assoc(Result, "NAME", PROPERTY_OBJECT[ slot ][pobj_NAME], 264);
			PROPERTY_OBJECT[ slot ][pobj_POS][0] = db_get_field_assoc_float(Result, "X");
			PROPERTY_OBJECT[ slot ][pobj_POS][1] = db_get_field_assoc_float(Result, "Y");
			PROPERTY_OBJECT[ slot ][pobj_POS][2] = db_get_field_assoc_float(Result, "Z");
			PROPERTY_OBJECT[ slot ][pobj_ROTATION][0] = db_get_field_assoc_float(Result, "RX");
			PROPERTY_OBJECT[ slot ][pobj_ROTATION][1] = db_get_field_assoc_float(Result, "RY");
			PROPERTY_OBJECT[ slot ][pobj_ROTATION][2] = db_get_field_assoc_float(Result, "RZ");
			PROPERTY_OBJECT[ slot ][pobj_WORLD] = world;
			PROPERTY_OBJECT[ slot ][pobj_INTERIOR] = interior;

			PROPERTY_OBJECT[ slot ][pobj_ID] = CreateDynamicObject(
				PROPERTY_OBJECT[ slot ][pobj_MODELID],
				PROPERTY_OBJECT[ slot ][pobj_POS][0],
				PROPERTY_OBJECT[ slot ][pobj_POS][1],
				PROPERTY_OBJECT[ slot ][pobj_POS][2],
				PROPERTY_OBJECT[ slot ][pobj_ROTATION][0],
				PROPERTY_OBJECT[ slot ][pobj_ROTATION][1],
				PROPERTY_OBJECT[ slot ][pobj_ROTATION][2],
				PROPERTY_OBJECT[ slot ][pobj_WORLD],
				PROPERTY_OBJECT[ slot ][pobj_INTERIOR]
			);
			db_next_row(Result);
		}
		db_free_result(Result);
	}
	return 1;
}

AddPropertyObject(playerid, modelid, property_id, name[], type, interior, world)
{
	new 
		Float:pos[3],
		DBResult:Result,
		DB_Query[340],
		slot = GetFreeSlotPropertyObject()
	;

	PROPERTY_OBJECT[ slot ][pobj_VALID] = true;
	PROPERTY_OBJECT[ slot ][pobj_PROPERTY_ID] = property_id;
	PROPERTY_OBJECT[ slot ][pobj_MODELID] = modelid;
	PROPERTY_OBJECT[ slot ][pobj_TYPE] = type;
	PROPERTY_OBJECT[ slot ][pobj_INTERIOR] = interior;
	PROPERTY_OBJECT[ slot ][pobj_WORLD] = world;
	format(PROPERTY_OBJECT[ slot ][pobj_NAME], 32, "%s", name);

	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);

	PROPERTY_OBJECT[ slot ][pobj_POS][0] = (pos[0] + 0.6);
	PROPERTY_OBJECT[ slot ][pobj_POS][1] = (pos[1] + 0.6);
	PROPERTY_OBJECT[ slot ][pobj_POS][2] = pos[2];
	PROPERTY_OBJECT[ slot ][pobj_ROTATION][0] = 0.0;
	PROPERTY_OBJECT[ slot ][pobj_ROTATION][1] = 0.0;
	PROPERTY_OBJECT[ slot ][pobj_ROTATION][2] = 0.0;

	PROPERTY_OBJECT[ slot ][pobj_ID] = CreateDynamicObject(
		PROPERTY_OBJECT[ slot ][pobj_MODELID],
		PROPERTY_OBJECT[ slot ][pobj_POS][0],
		PROPERTY_OBJECT[ slot ][pobj_POS][1],
		PROPERTY_OBJECT[ slot ][pobj_POS][2],
		PROPERTY_OBJECT[ slot ][pobj_ROTATION][0],
		PROPERTY_OBJECT[ slot ][pobj_ROTATION][1],
		PROPERTY_OBJECT[ slot ][pobj_ROTATION][2],
		PROPERTY_OBJECT[ slot ][pobj_WORLD],
		PROPERTY_OBJECT[ slot ][pobj_INTERIOR]
	);

	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PROPERTY_OBJECTS`\
		(\
			`ID_PROPERTY`, `MODELID`, `TYPE`, `X`, `Y`, `Z`, `RX`, `RY`, `RZ`, `NAME`\
		)\
		VALUES\
		(\
			'%d', '%d', '%d', '%f', '%f', '%f', '%f', '%f', '%f', '%s'\
		);\
		SELECT MAX(`ID`) FROM `PROPERTY_OBJECTS`;\
	",
		PROPERTY_OBJECT[ slot ][pobj_PROPERTY_ID],
		PROPERTY_OBJECT[ slot ][pobj_MODELID],
		PROPERTY_OBJECT[ slot ][pobj_TYPE],
		PROPERTY_OBJECT[ slot ][pobj_POS][0],
		PROPERTY_OBJECT[ slot ][pobj_POS][1],
		PROPERTY_OBJECT[ slot ][pobj_POS][2],
		PROPERTY_OBJECT[ slot ][pobj_ROTATION][0],
		PROPERTY_OBJECT[ slot ][pobj_ROTATION][1],
		PROPERTY_OBJECT[ slot ][pobj_ROTATION][2],
		PROPERTY_OBJECT[ slot ][pobj_NAME]
	);
	Result = db_query(Database, DB_Query);
	if (db_num_rows(Result)) PROPERTY_OBJECT[ slot ][pobj_DB_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);

	PLAYER_TEMP[playerid][py_FURNITURE_SELECTED] = slot;
	PLAYER_TEMP[playerid][py_EDITING_OBJ] = PROPERTY_OBJECT[ slot ][pobj_ID];
	EditingMode(playerid, PLAYER_TEMP[playerid][py_EDITING_OBJ]);
	return 1;
}

UpdatePropertyObject(index, objectid)
{
	new DB_Query[364];

	GetDynamicObjectPos(
		objectid,
		PROPERTY_OBJECT[ index ][pobj_POS][0],
		PROPERTY_OBJECT[ index ][pobj_POS][1],
		PROPERTY_OBJECT[ index ][pobj_POS][2]
	);

	GetDynamicObjectRot(
		objectid,
		PROPERTY_OBJECT[ index ][pobj_ROTATION][0],
		PROPERTY_OBJECT[ index ][pobj_ROTATION][1],
		PROPERTY_OBJECT[ index ][pobj_ROTATION][2]
	);

	format(DB_Query, sizeof DB_Query,
	"\
		UPDATE `PROPERTY_OBJECTS` SET \
			`X` = '%f', \
			`Y` = '%f', \
			`Z` = '%f', \
			`RX` = '%f', \
			`RY` = '%f', \
			`RZ` = '%f' \
		WHERE `ID` = '%d';\
	",
		PROPERTY_OBJECT[ index ][pobj_POS][0],
		PROPERTY_OBJECT[ index ][pobj_POS][1],
		PROPERTY_OBJECT[ index ][pobj_POS][2],
		PROPERTY_OBJECT[ index ][pobj_ROTATION][0],
		PROPERTY_OBJECT[ index ][pobj_ROTATION][1],
		PROPERTY_OBJECT[ index ][pobj_ROTATION][2],
		PROPERTY_OBJECT[ index ][pobj_DB_ID]
	);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

DeletePropertyObject(object_id, index)
{
	new DB_Query[64];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `PROPERTY_OBJECTS` WHERE `ID` = '%d';", object_id);
	db_free_result(db_query(Database, DB_Query));

	PROPERTY_OBJECT[ index ][pobj_VALID] = false;
	DestroyDynamicObject(PROPERTY_OBJECT[ index ][pobj_ID]);
	return 1;
}