LoadClubs()
{
	new DBResult:Result;

	Result = db_query(Database, "SELECT * FROM `CLUB_INFO`;");

	if (db_num_rows(Result))
	{
		for(new i; i < db_num_rows(Result); i++ )
		{
			CLUBS_INFO[i][club_VALID] = true;
			CLUBS_INFO[i][club_ID] = db_get_field_assoc_int(Result, "ID");
			CLUBS_INFO[i][club_USER_ID] = db_get_field_assoc_int(Result, "USER_ID");
			db_get_field_assoc(Result, "NAME", CLUBS_INFO[i][club_NAME], 32);
			db_get_field_assoc(Result, "WELCOME", CLUBS_INFO[i][club_WELCOME], 64);
			CLUBS_INFO[i][club_X] = db_get_field_assoc_float(Result, "X");
			CLUBS_INFO[i][club_Y] = db_get_field_assoc_float(Result, "Y");
			CLUBS_INFO[i][club_Z] = db_get_field_assoc_float(Result, "Z");
			CLUBS_INFO[i][club_ANGLE] = db_get_field_assoc_float(Result, "ANGLE");
			CLUBS_INFO[i][club_STATE] = db_get_field_assoc_int(Result, "STATE");
			CLUBS_INFO[i][club_INTERIOR] = db_get_field_assoc_int(Result, "INTERIOR");
			CLUBS_INFO[i][club_BALANCE] = db_get_field_assoc_int(Result, "BALANCE");
			CLUBS_INFO[i][club_USER_ID] = db_get_field_assoc_int(Result, "USER_ID");
			CLUBS_INFO[i][club_ENTER_PRICE] = db_get_field_assoc_int(Result, "ENTER_PRICE");
			CLUBS_INFO[i][club_PRICE] = db_get_field_assoc_int(Result, "PRICE");
			CLUBS_INFO[i][club_RADIO] = db_get_field_assoc_int(Result, "RADIO");

			new label_str[264];
			if (CLUBS_INFO[i][club_USER_ID] == 0) format(label_str, 264, ""COL_WHITE"%d %s (%s)\nEntrada: %s\n"COL_GREEN"En venta", i, CLUBS_INFO[i][club_NAME], (CLUBS_INFO[i][club_STATE] ? ""COL_GREEN"Abierto"COL_WHITE"" : ""COL_RED"Cerrado"COL_WHITE""), GetClubEnterPrice(i));
			else
			{
				new 
					DBResult:Result_info_owner,
					DB_Query[128],
					owner[24]
				;

				format(DB_Query, sizeof DB_Query, "SELECT `NAME` FROM `CUENTA` WHERE `ID` = %d;", CLUBS_INFO[i][club_USER_ID]);
				Result_info_owner = db_query(Database, DB_Query);

				if (db_num_rows(Result_info_owner))
				{
					db_get_field_assoc(Result_info_owner, "NAME", owner, 24);
					format(label_str, 164, ""COL_WHITE"%d %s (%s)\nEntrada: %s\nPropietario:{35A7FF} %s", i, CLUBS_INFO[i][club_NAME], (CLUBS_INFO[i][club_STATE] ? ""COL_GREEN"Abierto"COL_WHITE"" : ""COL_RED"Cerrado"COL_WHITE""), GetClubEnterPrice(i), owner);
				}
			}

			CLUBS_INFO[i][club_EXT_LABEL_ID] = CreateDynamic3DTextLabel(label_str, 0xF7F7F700, CLUBS_INFO[i][club_X], CLUBS_INFO[i][club_Y], CLUBS_INFO[i][club_Z] + 0.25, 5.0, .testlos = true, .worldid = 0, .interiorid = 0);
			CLUBS_INFO[i][club_EXT_PICKUP_ID] = CreateDynamicPickup(19902, 1, CLUBS_INFO[i][club_X], CLUBS_INFO[i][club_Y], CLUBS_INFO[i][club_Z] - 0.7, 0, 0);
			CLUBS_INFO[i][club_INT_PICKUP_ID] = CreateDynamicPickup(
				19902,
				1,
				CLUBS_INTERIORS[ CLUBS_INFO[i][club_INTERIOR] ][interior_X],
				CLUBS_INTERIORS[ CLUBS_INFO[i][club_INTERIOR] ][interior_Y],
				CLUBS_INTERIORS[ CLUBS_INFO[i][club_INTERIOR] ][interior_Z],
				CLUBS_INFO[i][club_ID],
				CLUBS_INTERIORS[ CLUBS_INFO[i][club_INTERIOR] ][interior_ID]
			);

			CreateDynamic3DTextLabel(
				""COL_WHITE"Comprar productos",
				0xF7F7F700,
				CLUBS_INTERIORS[ CLUBS_INFO[i][club_INTERIOR] ][interior_BUY_X],
				CLUBS_INTERIORS[ CLUBS_INFO[i][club_INTERIOR] ][interior_BUY_Y],
				CLUBS_INTERIORS[ CLUBS_INFO[i][club_INTERIOR] ][interior_BUY_Z] + 0.25,
				3.0,
				.testlos = true,
				.worldid = CLUBS_INFO[i][club_ID],
				.interiorid = CLUBS_INTERIORS[ CLUBS_INFO[i][club_INTERIOR] ][interior_ID]
			);
			AddKeyArea(CLUBS_INTERIORS[ CLUBS_INFO[i][club_INTERIOR] ][interior_BUY_X], CLUBS_INTERIORS[ CLUBS_INFO[i][club_INTERIOR] ][interior_BUY_Y], 0.8, KEY_TYPE_Y);

			CreateDynamicMapIcon(CLUBS_INFO[i][club_X], CLUBS_INFO[i][club_Y], CLUBS_INFO[i][club_Z], 48, COLOR_WHITE, 0, 0);

			new info[3];
			info[0] = PICKUP_TYPE_CLUB;
			info[1] = i; // Index
			info[2] = 1; // Pickup Interior
			Streamer_SetArrayData(STREAMER_TYPE_PICKUP, CLUBS_INFO[i][club_INT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

			info[0] = PICKUP_TYPE_CLUB;
			info[1] = i; // Index
			info[2] = 2; // Pickup Exterior
			Streamer_SetArrayData(STREAMER_TYPE_PICKUP, CLUBS_INFO[i][club_EXT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

			AddKeyArea(CLUBS_INFO[i][club_X], CLUBS_INFO[i][club_Y], 0.8, KEY_TYPE_ENTER);

			db_next_row(Result);
		}
		db_free_result(Result);
	}
	return 1;
}

CreateClub(const name[], const welcome[], Float:x, Float:y, Float:z, Float:angle, interior, price)
{
	new 
		DBResult:Result,
		DB_Query[340],
		index,
		info[3]
	;

	Result = db_query(Database, "SELECT MAX(`ID`) FROM `CLUB_INFO`;");
	if (db_num_rows(Result)) index = db_get_field_int(Result, 0) + 1;
	db_free_result(Result);

	CLUBS_INFO[index][club_VALID] = true;
	CLUBS_INFO[index][club_USER_ID] = 0;

	format(CLUBS_INFO[index][club_NAME], 32, "%s", name);
	format(CLUBS_INFO[index][club_WELCOME], 64, "%s", welcome);

	CLUBS_INFO[index][club_PRICE] = price;
	CLUBS_INFO[index][club_INTERIOR] = interior;

	CLUBS_INFO[index][club_X] = x;
	CLUBS_INFO[index][club_Y] = y;
	CLUBS_INFO[index][club_Z] = z;
	CLUBS_INFO[index][club_ANGLE] = angle;

	CLUBS_INFO[index][club_STATE] = 1;
	CLUBS_INFO[index][club_RADIO] = 100;

	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `CLUB_INFO`\
		(\
			`NAME`, `WELCOME`, `X`, `Y`, `Z`, `ANGLE`, `INTERIOR`, `PRICE`\
		)\
		VALUES\
		(\
			'%q', '%q', '%f', '%f', '%f', '%f', '%d', '%d'\
		);\
		SELECT MAX(`ID`) FROM `CLUB_INFO`;\
	",
		CLUBS_INFO[index][club_NAME],
		CLUBS_INFO[index][club_WELCOME],
		CLUBS_INFO[index][club_X],
		CLUBS_INFO[index][club_Y],
		CLUBS_INFO[index][club_Z],
		CLUBS_INFO[index][club_ANGLE],
		CLUBS_INFO[index][club_INTERIOR],
		CLUBS_INFO[index][club_PRICE]
	);
	Result = db_query(Database, DB_Query);
	if (db_num_rows(Result)) CLUBS_INFO[index][club_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);

	new label_str[264];
	format(label_str, 264, ""COL_WHITE"%d %s (%s)\nEntrada: %s\n"COL_GREEN"En venta", index, CLUBS_INFO[index][club_NAME], (CLUBS_INFO[index][club_STATE] ? ""COL_GREEN"Abierto"COL_WHITE"" : ""COL_RED"Cerrado"COL_WHITE""), GetClubEnterPrice(index));
	CLUBS_INFO[index][club_EXT_LABEL_ID] = CreateDynamic3DTextLabel(label_str, 0xF7F7F700, CLUBS_INFO[index][club_X], CLUBS_INFO[index][club_Y], CLUBS_INFO[index][club_Z] + 0.25, 5.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CLUBS_INFO[index][club_EXT_PICKUP_ID] = CreateDynamicPickup(19902, 1, CLUBS_INFO[index][club_X], CLUBS_INFO[index][club_Y], CLUBS_INFO[index][club_Z] - 0.7, 0, 0);
	CLUBS_INFO[index][club_INT_PICKUP_ID] = CreateDynamicPickup(
		19902,
		1,
		CLUBS_INTERIORS[ CLUBS_INFO[index][club_INTERIOR] ][interior_X],
		CLUBS_INTERIORS[ CLUBS_INFO[index][club_INTERIOR] ][interior_Y],
		CLUBS_INTERIORS[ CLUBS_INFO[index][club_INTERIOR] ][interior_Z],
		CLUBS_INFO[index][club_ID],
		CLUBS_INTERIORS[ CLUBS_INFO[index][club_INTERIOR] ][interior_ID]
	);

	CreateDynamic3DTextLabel(
		""COL_WHITE"Comprar productos",
		0xF7F7F700,
		CLUBS_INTERIORS[ CLUBS_INFO[index][club_INTERIOR] ][interior_BUY_X],
		CLUBS_INTERIORS[ CLUBS_INFO[index][club_INTERIOR] ][interior_BUY_Y],
		CLUBS_INTERIORS[ CLUBS_INFO[index][club_INTERIOR] ][interior_BUY_Z] + 0.25,
		3.0,
		.testlos = true,
		.worldid = CLUBS_INFO[index][club_ID],
		.interiorid = CLUBS_INTERIORS[ CLUBS_INFO[index][club_INTERIOR] ][interior_ID]
	);
	AddKeyArea(CLUBS_INTERIORS[ CLUBS_INFO[index][club_INTERIOR] ][interior_BUY_X], CLUBS_INTERIORS[ CLUBS_INFO[index][club_INTERIOR] ][interior_BUY_Y], 0.8, KEY_TYPE_Y);

	CreateDynamicMapIcon(CLUBS_INFO[index][club_X], CLUBS_INFO[index][club_Y], CLUBS_INFO[index][club_Z], 48, COLOR_WHITE, 0, 0);

	info[0] = PICKUP_TYPE_CLUB;
	info[1] = index; // Index
	info[2] = 1; // Pickup Interior
	Streamer_SetArrayData(STREAMER_TYPE_PICKUP, CLUBS_INFO[index][club_INT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

	info[0] = PICKUP_TYPE_CLUB;
	info[1] = index; // Index
	info[2] = 2; // Pickup Exterior
	Streamer_SetArrayData(STREAMER_TYPE_PICKUP, CLUBS_INFO[index][club_EXT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

	AddKeyArea(CLUBS_INFO[index][club_X], CLUBS_INFO[index][club_Y], 0.8, KEY_TYPE_ENTER);

	AddClubProduct(CLUBS_INFO[index][club_ID], "Sprunk", 0, 10, 100);
	AddClubProduct(CLUBS_INFO[index][club_ID], "Sandwich de queso", 1, 15, 120);
	return 1;
}

BuyClub(playerid, index)
{
	if (CLUBS_INFO[index][club_PRICE] > ACCOUNT_INFO[playerid][ac_SD]) return ShowPlayerMessage(playerid, "~r~No tienes los hycoins suficientes.", 3);
	ACCOUNT_INFO[playerid][ac_SD] -= CLUBS_INFO[index][club_PRICE];

	new DB_Query[264];
	format(DB_Query, sizeof(DB_Query), "UPDATE `CUENTA` SET `SD` = '%d' WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	CLUBS_INFO[index][club_USER_ID] = ACCOUNT_INFO[playerid][ac_ID];
	CLUBS_INFO[index][club_BALANCE] = 0;
	CLUBS_INFO[index][club_STATE] = 1;

	format(DB_Query, sizeof DB_Query,
	"\
		UPDATE `CLUB_INFO` SET \
			`USER_ID` = '%d', \
			`BALANCE` = '%d', \
			`STATE` = '%d' \
		WHERE `ID` = '%d';\
	",
		CLUBS_INFO[index][club_USER_ID],
		CLUBS_INFO[index][club_BALANCE],
		CLUBS_INFO[index][club_STATE],
		CLUBS_INFO[index][club_ID]
	);
	db_free_result(db_query(Database, DB_Query));

	if (PLAYER_PHONE[playerid][player_phone_VALID])
	{
		new message[64];
		format(message, sizeof message, "PROPIEDAD COMPRADA: -%d HYCOINS", CLUBS_INFO[index][club_PRICE]);
		RegisterPhoneMessage(6740, PLAYER_PHONE[playerid][player_phone_NUMBER], message);

		new str_buy[164];
		format(str_buy, sizeof(str_buy), "~y~Propiedad comprada~w~~n~Compraste el %s, pulsa la tecla H para ver las opciones.", CLUBS_INFO[index][club_NAME]);
		ShowPlayerNotification(playerid, str_buy, 5);
	}

	new str_text[264];
	format(str_text, 264, ""COL_WHITE"%d %s (%s)\nEntrada: %s\nPropietario:{35A7FF} %s", index, CLUBS_INFO[index][club_NAME], (CLUBS_INFO[index][club_STATE] ? ""COL_GREEN"Abierto"COL_WHITE"" : ""COL_RED"Cerrado"COL_WHITE""), GetClubEnterPrice(index), PLAYER_TEMP[playerid][py_NAME]);
	UpdateDynamic3DTextLabelText(CLUBS_INFO[index][club_EXT_LABEL_ID], 0xF7F7F700, str_text);
	return 1;
}

ReleaseClub(index)
{
	new 
		DB_Query[340],
		label_str[264]
	;
	
	CLUBS_INFO[index][club_USER_ID] = 0;
	CLUBS_INFO[index][club_BALANCE] = 0;
	CLUBS_INFO[index][club_STATE] = 1;

	format(DB_Query, sizeof DB_Query,
	"\
		UPDATE `CLUB_INFO` SET \
			`USER_ID` = '%d', \
			`BALANCE` = '%d', \
			`STATE` = '%d' \
		WHERE `ID` = '%d';\
	",
		CLUBS_INFO[index][club_USER_ID],
		CLUBS_INFO[index][club_BALANCE],
		CLUBS_INFO[index][club_STATE],
		CLUBS_INFO[index][club_ID]
	);
	db_free_result(db_query(Database, DB_Query));

	new str_text[264];
	format(label_str, 264, ""COL_WHITE"%d %s (%s)\nEntrada: %s\n"COL_GREEN"En venta", index, CLUBS_INFO[index][club_NAME], (CLUBS_INFO[index][club_STATE] ? ""COL_GREEN"Abierto"COL_WHITE"" : ""COL_RED"Cerrado"COL_WHITE""), GetClubEnterPrice(index));
	UpdateDynamic3DTextLabelText(CLUBS_INFO[index][club_EXT_LABEL_ID], 0xF7F7F700, str_text);
	return 1;
}

AddClubProduct(club_id, const name[], type, extra, price)
{
	new DBResult:Result, DB_Query[340];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `CLUB_PRODUCTS`\
		(\
			`CLUB_ID`, `NAME`, `TYPE`, `EXTRA`, `PRICE`\
		)\
		VALUES\
		(\
			'%d', '%q', '%d', '%d', '%d'\
		);\
		SELECT MAX(`ID`) FROM `CLUB_PRODUCTS`;\
	",
		club_id, name, type, extra, price
	);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result)) return db_get_field_int(Result, 0);
	db_free_result(Result);
	return 1;
}

DeleteClubProduct(product_id)
{
	new DB_Query[150];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `CLUB_PRODUCTS` WHERE `ID` = '%d';", product_id);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

GetClubEnterPrice(club_id)
{
	new price[128];
	if (CLUBS_INFO[club_id][club_ENTER_PRICE] <= 0) format(price, sizeof(price), ""COL_GREEN"Gratis"COL_WHITE"");
	else format(price, sizeof(price), ""COL_YELLOW"%d$"COL_WHITE"", CLUBS_INFO[club_id][club_ENTER_PRICE]);
	return price;
}

GetClubIndexByID(id)
{
	for(new i = 0; i != MAX_CLUBS; i ++)
	{
		if (!CLUBS_INFO[i][club_VALID]) continue;
		if (CLUBS_INFO[i][club_ID] == id) return i;
	}
	return -1;
}