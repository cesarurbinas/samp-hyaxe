LoadClubs()
{
	new DBResult:Result;

	Result = db_query(Database, "SELECT * FROM `CLUB_INFO`;");

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
			db_next_row(Result);
		}
		db_free_result(Result);
	}
	return 1;
}

LoadClubProducts(club_id)
{
	return 1;
}

CreateClub(const name[], const welcome[], interior, price)
{
	return 1;
}

AddClubProduct(club_id, const name[], type, extra, price)
{
	return 1;
}

DeleteClubProduct(product_id)
{
	return 1;
}