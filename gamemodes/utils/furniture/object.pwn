/*GetFurnitureTypeName(type)
{
	new name[64];

	switch(type)
	{
		case 0: name = "Cama";
		case 1: name = "Cuadro";
		case 2: name = "Decoración";
		case 3: name = "Electrodoméstico";
		case 4: name = "Iluminación";
		case 5: name = "Mesa";
		case 6: name = "Silla";
	}
	return name;
}*/

CreatePropertyObjects(property_id, interior, world)
{
	new DBResult:Result, DB_Query[140];
	format(DB_Query, sizeof DB_Query, "SELECT * FROM `PROPERTY_OBJECTS` WHERE `ID_PROPERTY` = '%d' ORDER BY `MODELID`;", property_id);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result) > 0)
	{
		for(new i; i < db_num_rows(Result); i++ )
		{
			PROPERTY_OBJECT[ property_id ][pobj_VALID] = true;
			PROPERTY_OBJECT[ property_id ][pobj_PROPERTY_ID] = property_id;
			PROPERTY_OBJECT[ property_id ][pobj_DB_ID] = db_get_field_assoc_int(Result, "ID");
			PROPERTY_OBJECT[ property_id ][pobj_MODELID] = db_get_field_assoc_int(Result, "MODELID");
			PROPERTY_OBJECT[ property_id ][pobj_TYPE] = db_get_field_assoc_int(Result, "TYPE");
			db_get_field_assoc(Result, "NAME", PROPERTY_OBJECT[ property_id ][pobj_NAME], 264);
			PROPERTY_OBJECT[ property_id ][pobj_POS][0] = db_get_field_assoc_float(Result, "X");
			PROPERTY_OBJECT[ property_id ][pobj_POS][1] = db_get_field_assoc_float(Result, "Y");
			PROPERTY_OBJECT[ property_id ][pobj_POS][2] = db_get_field_assoc_float(Result, "Z");
			PROPERTY_OBJECT[ property_id ][pobj_ROTATION][0] = db_get_field_assoc_float(Result, "RX");
			PROPERTY_OBJECT[ property_id ][pobj_ROTATION][1] = db_get_field_assoc_float(Result, "RY");
			PROPERTY_OBJECT[ property_id ][pobj_ROTATION][2] = db_get_field_assoc_float(Result, "RZ");
			PROPERTY_OBJECT[ property_id ][pobj_WORLD] = world;
			PROPERTY_OBJECT[ property_id ][pobj_INTERIOR] = interior;

			PROPERTY_OBJECT[ property_id ][pobj_ID] = CreateDynamicObject(
				PROPERTY_OBJECT[ property_id ][pobj_MODELID],
				PROPERTY_OBJECT[ property_id ][pobj_POS][0],
				PROPERTY_OBJECT[ property_id ][pobj_POS][1],
				PROPERTY_OBJECT[ property_id ][pobj_POS][2],
				PROPERTY_OBJECT[ property_id ][pobj_ROTATION][0],
				PROPERTY_OBJECT[ property_id ][pobj_ROTATION][1],
				PROPERTY_OBJECT[ property_id ][pobj_ROTATION][2],
				PROPERTY_OBJECT[ property_id ][pobj_WORLD],
				PROPERTY_OBJECT[ property_id ][pobj_INTERIOR]
			);
			db_next_row(Result);
		}
		db_free_result(Result);
	}
	return 1;
}

AddPropertyObject(playerid, property_id, name[], type, interior, world)
{
	PROPERTY_OBJECT[ property_id ][pobj_VALID] = true;
	PROPERTY_OBJECT[ property_id ][pobj_PROPERTY_ID] = property_id;
	PROPERTY_OBJECT[ property_id ][pobj_TYPE] = type;
	PROPERTY_OBJECT[ property_id ][pobj_INTERIOR] = interior;
	PROPERTY_OBJECT[ property_id ][pobj_WORLD] = world;
	format(PROPERTY_OBJECT[ property_id ][pobj_NAME], 32, "%s", name);

	PROPERTY_OBJECT[ property_id ][pobj_ID] = CreateDynamicObject(
		PROPERTY_OBJECT[ property_id ][pobj_MODELID],
		PROPERTY_OBJECT[ property_id ][pobj_POS][0],
		PROPERTY_OBJECT[ property_id ][pobj_POS][1],
		PROPERTY_OBJECT[ property_id ][pobj_POS][2],
		PROPERTY_OBJECT[ property_id ][pobj_ROTATION][0],
		PROPERTY_OBJECT[ property_id ][pobj_ROTATION][1],
		PROPERTY_OBJECT[ property_id ][pobj_ROTATION][2],
		PROPERTY_OBJECT[ property_id ][pobj_WORLD],
		PROPERTY_OBJECT[ property_id ][pobj_INTERIOR]
	);

	new DBResult:Result, DB_Query[340];

	Result = db_query(Database, "SELECT MAX(`ID`) FROM `PROPERTY_OBJECTS`;");
	if (db_num_rows(Result)) PROPERTY_OBJECT[ property_id ][pobj_DB_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);

	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PROPERTY_OBJECTS`\
		(\
			`ID`, `ID_PROPERTY`, `MODELID`, `TYPE`, `X`, `Y`, `Z`, `RX`, `RY`, `RZ`, `NAME`\
		)\
		VALUES\
		(\
			'%d', '%d', '%d', '%d', '%f', '%f', '%f', '%f', '%f', '%f', '%s'\
		);\
	",
		PROPERTY_OBJECT[ property_id ][pobj_DB_ID],
		property_id,
		PROPERTY_OBJECT[ property_id ][pobj_MODELID],
		PROPERTY_OBJECT[ property_id ][pobj_TYPE],
		PROPERTY_OBJECT[ property_id ][pobj_POS][0],
		PROPERTY_OBJECT[ property_id ][pobj_POS][1],
		PROPERTY_OBJECT[ property_id ][pobj_POS][2],
		PROPERTY_OBJECT[ property_id ][pobj_ROTATION][0],
		PROPERTY_OBJECT[ property_id ][pobj_ROTATION][1],
		PROPERTY_OBJECT[ property_id ][pobj_ROTATION][2],
		PROPERTY_OBJECT[ property_id ][pobj_NAME]
	);
	db_free_result(db_query(Database, DB_Query));

	PLAYER_TEMP[playerid][py_EDITING_OBJ] = PROPERTY_OBJECT[ property_id ][pobj_ID];
	EditingMode(playerid, PLAYER_TEMP[playerid][py_EDITING_OBJ]);
	return 1;
}