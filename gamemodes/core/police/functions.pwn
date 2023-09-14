AddPlayerPoliceHistory(playerid, const by[], const reason[])
{
	if (!ACCOUNT_INFO[playerid][ac_ID]) return 0;

	new DB_Query[512];
	format(DB_Query, sizeof DB_Query,

		"\
			INSERT INTO `POLICE_HISTORY` (`ID_USER`, `BY`, `TEXT`) VALUES ('%d', '%q', '%q');\
			DELETE FROM `POLICE_HISTORY` WHERE `ID_USER` = '%d' AND `ID_USER` NOT IN (SELECT `ID_USER` FROM `POLICE_HISTORY` WHERE `ID_USER` = '%d' ORDER BY `DATE` DESC LIMIT 20);\
		",

		ACCOUNT_INFO[playerid][ac_ID], by, reason,
		ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_ID]
	);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

GetFreePoliceObjectSlot()
{
	for(new i = 0; i != MAX_POLICE_OBJECTS; i ++)
	{
		if (!POLICE_OBJECTS[i][police_object_VALID]) return i;
	}
	return -1;
}

DeleteIlegalInv(playerid, bool:drugs = false)
{
	if (!PLAYER_WORKS[playerid][WORK_POLICE])
	{
		new DB_Query[90];
		format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_WEAPONS` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
		db_free_result(db_query(Database, DB_Query));
		ResetPlayerWeaponsEx(playerid); // LMFAOO HAHAHA!
	}

	if (drugs)
	{
		PLAYER_MISC[playerid][MISC_SEED_CANNABIS] = 0;
		PLAYER_MISC[playerid][MISC_SEED_CRACK] = 0;
		PLAYER_MISC[playerid][MISC_CANNABIS] = 0;
		PLAYER_MISC[playerid][MISC_CRACK] = 0;
		SavePlayerMisc(playerid);
	}

	return 1;
}