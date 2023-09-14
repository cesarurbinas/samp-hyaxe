AddPropertyKey(property_id, user_id)
{
	new DB_Query[164];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PROPERTY_KEYS`\
		(\
			`PROPERTY_ID`, `USER_ID`\
		)\
		VALUES\
		(\
			'%d', '%d'\
		);\
	",
		property_id,
		user_id
	);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

bool:IsPlayerInPropertyKeys(property_id, user_id)
{
	new DBResult:Result, DB_Query[164], bool:is_valid;
	format(DB_Query, sizeof DB_Query, "SELECT * FROM `PROPERTY_KEYS` WHERE `PROPERTY_ID` = '%d' AND `USER_ID` = '%d';", property_id, user_id);

	Result = db_query(Database, DB_Query);
	if (db_num_rows(Result)) is_valid = true;
	else is_valid = false;
	
	db_free_result(Result);
	return is_valid;
}

GetUsedPropertyKeys(property_id)
{
	new DBResult:Result, DB_Query[164], total;
	format(DB_Query, sizeof DB_Query, "SELECT * FROM `PROPERTY_KEYS` WHERE `PROPERTY_ID` = '%d';", property_id);

	Result = db_query(Database, DB_Query);
	total = db_num_rows(Result);
	
	db_free_result(Result);
	return total;
}

ClearPropertyKeys(property_id)
{
	new DB_Query[164];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `PROPERTY_KEYS` WHERE `PROPERTY_ID` = '%d';", property_id);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

RemovePropertyKey(property_id, user_id)
{
	new DB_Query[164];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `PROPERTY_KEYS` WHERE `PROPERTY_ID` = '%d' AND `USER_ID` = '%d';", property_id, user_id);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}