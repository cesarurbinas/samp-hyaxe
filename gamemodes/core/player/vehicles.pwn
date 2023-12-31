enum Player_Vehicles_Info
{
	bool:player_vehicle_VALID,
	player_vehicle_ID,
	player_vehicle_OWNER_ID,
	bool:player_vehicle_ACCESSIBLE
};
new PLAYER_VEHICLES[MAX_VEHICLES][Player_Vehicles_Info];

AddPlayerKey(vehicle_id, user_id)
{
	new DB_Query[164];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `VEHICLE_KEYS`\
		(\
			`VEHICLE_ID`, `USER_ID`\
		)\
		VALUES\
		(\
			'%d', '%d'\
		);\
	",
		vehicle_id,
		user_id
	);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

bool:IsPlayerInKeys(vehicle_id, user_id)
{
	new DBResult:Result, DB_Query[164], bool:is_valid;
	format(DB_Query, sizeof DB_Query, "SELECT * FROM `VEHICLE_KEYS` WHERE `VEHICLE_ID` = '%d' AND `USER_ID` = '%d';", vehicle_id, user_id);

	Result = db_query(Database, DB_Query);
	if (db_num_rows(Result)) is_valid = true;
	else is_valid = false;
	
	db_free_result(Result);
	return is_valid;
}

GetUsedKeys(vehicle_id)
{
	new DBResult:Result, DB_Query[164], total;
	format(DB_Query, sizeof DB_Query, "SELECT * FROM `VEHICLE_KEYS` WHERE `VEHICLE_ID` = '%d';", vehicle_id);

	Result = db_query(Database, DB_Query);
	total = db_num_rows(Result);
	
	db_free_result(Result);
	return total;
}

ClearVehicleKeys(vehicle_id)
{
	new DB_Query[164];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `VEHICLE_KEYS` WHERE `VEHICLE_ID` = '%d';", vehicle_id);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

RemovePlayerKey(vehicle_id, user_id)
{
	new DB_Query[164];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `VEHICLE_KEYS` WHERE `VEHICLE_ID` = '%d' AND `USER_ID` = '%d';", vehicle_id, user_id);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}