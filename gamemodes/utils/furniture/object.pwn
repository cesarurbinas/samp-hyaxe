GetFurnitureTypeName(type)
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
}

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
			PROPERTY_OBJECT[ property_id ][pobj_MODELID] = db_get_field_assoc_int(Result, "MODELID");
			PROPERTY_OBJECT[ property_id ][pobj_TYPE] = db_get_field_assoc_int(Result, "TYPE");
			PROPERTY_OBJECT[ property_id ][pobj_NAME] = GetFurnitureTypeName( PROPERTY_OBJECT[ property_id ][pobj_TYPE] );
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