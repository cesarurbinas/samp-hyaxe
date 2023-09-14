new BOT_ADDRESS[][] =
{
	"51.222.21.190",
	"192.95.10.233",
	"51.222.21.191",
	"51.38.208.149",
	"127.0.0.1"
};

isBotConnection(playerid)
{
	for(new x = 0; x < sizeof(BOT_ADDRESS); x ++)
    {
        if (strfind(PLAYER_TEMP[playerid][py_IP], BOT_ADDRESS[x], true) != -1)
        {
        	return true;
    	}
    }
	return false;
}

RegisterBot(playerid)
{
	ACCOUNT_INFO[playerid][ac_ID] = minrand(30000, 40000);
	SetPlayerScore(playerid, minrand(1, 5));
	PLAYER_TEMP[playerid][py_BOT] = true;

	for(new i = 0; i < 52; i++)
	{
		EnableAntiCheatForPlayer(playerid, i, false);
	}
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	if (PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] != 0)
	{
		if (!PLAYER_WORKS[forplayerid][WORK_POLICE]) return 1;
		if (PLAYER_TEMP[forplayerid][py_WORKING_IN] != WORK_POLICE) return 1;
		SetPlayerMarkerForPlayer(forplayerid, playerid, COLOR_RED);
	}
    return 1;
}

forward DisablePlayerPoliceSearchLevel(playerid);
public DisablePlayerPoliceSearchLevel(playerid)
{
	#if DEBUG_MODE == 1
		printf("DisablePlayerPoliceSearchLevel"); // debug juju
	#endif

	SetPlayerPoliceSearchLevel(playerid, 0);
	SetPlayerWantedLevel(playerid, 0);
	SendPoliceMark(playerid, PLAYER_COLOR);
	PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] = 0;
	SavePlayerMisc(playerid);

	new str_text[164],
		city[45],
		zone[45];

    GetPlayerZones(playerid, city, zone);
	format(str_text, sizeof(str_text), "%s se fugo (~r~%s~w~).", PLAYER_TEMP[playerid][py_NAME], zone);
	SendPoliceNotification(str_text, 4);
	return 1;
}

forward IsValidVehicleAbuse(playerid, vehicleid);
public IsValidVehicleAbuse(playerid, vehicleid)
{
	#if DEBUG_MODE == 1
		printf("IsValidVehicleAbuse"); // debug juju
	#endif

	new Float:speed = GetPlayerSpeed(playerid);
	if (speed > 15.0)
	{
 		PLAYER_TEMP[playerid][py_SURFING_VEHICLE] = 0;
 		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][31]);
 		NeuroJail(playerid, 30, "PG");
 	}
 	return 1;
}

forward UpdatePrisionTime(playerid);
public UpdatePrisionTime(playerid)
{
	/*#if DEBUG_MODE == 1
		printf("UpdatePrisionTime"); // debug juju
	#endif*/

	new 
		time = CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] - (gettime() - PLAYER_TEMP[playerid][py_ENTER_JAIL_TIME]),
		str_text[128];

	format(str_text, sizeof(str_text), "~r~Encarcelado~w~~n~%s minutos.", TimeConvert(time));
	
	ShowPlayerMessage(playerid, str_text, 1);

	if (time <= 0)
	{
		UnjailPlayer(playerid);
	}

	SetPlayerColor(playerid, PLAYER_COLOR);
	return 1;
}

forward SavePrisionTime(playerid);
public SavePrisionTime(playerid)
{
	#if DEBUG_MODE == 1
		printf("SavePrisionTime"); // debug juju
	#endif

	SaveUserData(playerid);
	return 1;
}

SendPoliceMark(playerid, color)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
	    if (IsPlayerConnected(i))
	    {
	        if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
	        {
	            if (PLAYER_WORKS[i][WORK_POLICE])
	            {
	                if (PLAYER_TEMP[i][py_WORKING_IN] == WORK_POLICE)
	                {
	                    SetPlayerMarkerForPlayer(i, playerid, color);
	                }
	            }
	        }
	    }
	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerConnect %d",playerid); // debug juju
		if (IsPlayerNPC(playerid))
		{
			printf("[npc] NPC Joined: %d", playerid);
		}
	#endif

	//printf("[%d] OnPlayerConnect 1", playerid);
	SetPlayerColor(playerid, PLAYER_COLOR);
	//printf("[%d] OnPlayerConnect 2", playerid);
	PLAYER_TEMP[playerid][py_GAME_STATE] = GAME_STATE_CONNECTED;
	PLAYER_TEMP[playerid][py_INTERIOR_INDEX] = 0;
	PLAYER_TEMP[playerid][py_PROPERTY_INDEX] = 0;
	PLAYER_TEMP[playerid][py_CLUB_INDEX] = 0;
	PLAYER_TEMP[playerid][py_CUTTING] = 0;
	PLAYER_TEMP[playerid][py_CUTTING_PROGRESS] = 0;
	PLAYER_TEMP[playerid][py_MUSIC_BOOMBOX] = -1;
	PLAYER_TEMP[playerid][py_GODMODE] = false;
	PLAYER_TEMP[playerid][py_HUD_TEXTDRAWS] = false;
	PLAYER_TEMP[playerid][py_SEE_ACMD_LOG] = true;
	PLAYER_TEMP[playerid][py_SEE_AC_LOG] = true;
	PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID] = INVALID_PLAYER_ID;
	PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID] = INVALID_PLAYER_ID;
	PLAYER_TEMP[playerid][py_GPS_CHECKPOINT] = INVALID_STREAMER_ID;
	PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT] = INVALID_STREAMER_ID;
	PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT] = INVALID_STREAMER_ID;
	PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER] = INVALID_PLAYER_ID;
	PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] = INVALID_VEHICLE_ID;
	PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] = INVALID_VEHICLE_ID;
	PLAYER_TEMP[playerid][py_CHECK_OBJECT] = 0;
	PLAYER_TEMP[playerid][py_PIVOT_OBJECT] = INVALID_OBJECT_ID;
	PLAYER_TEMP[playerid][py_DL_LABEL] = INVALID_3DTEXT_ID;
	//printf("[%d] OnPlayerConnect 2", playerid);
	for(new i = 0; i != MAX_OBJECTS_PER_ROUTE; i ++) TRASH_PLAYER_OBJECTS[playerid][i] = INVALID_STREAMER_ID;
	//printf("[%d] OnPlayerConnect 3", playerid);
	PLAYER_TEMP[playerid][py_SERIAL] = EOS;
	//printf("[%d] OnPlayerConnect 4", playerid);
	GetPlayerName(playerid, PLAYER_TEMP[playerid][py_NAME], 24);
	GetPlayerIp(playerid, PLAYER_TEMP[playerid][py_IP], 16);
	gpci(playerid, PLAYER_TEMP[playerid][py_SERIAL], 50);
	SendClientCheck(playerid, 0x48, 0, 0, 2);
	//printf("[%d] OnPlayerConnect 5", playerid);
	#if defined VOICE_CHAT
		if (!SvGetVersion(playerid))
		{
			SendClientMessage(playerid, 0xec4134FF, "[AVISO]{FFFFFF} Instale/Actualize Hyaxe Client en {ec4134}www.hyaxe.com/client");
		}
		
		if (!SvHasMicro(playerid))
		{
			SendClientMessage(playerid, 0xec4134FF, "[AVISO]{FFFFFF} No tienes un micrófono conectado");
		}
		
		lstream[playerid] = SvCreateDLStreamAtPlayer(40.0, SV_INFINITY, playerid, 0x81df79ff, "E");
		if (lstream[playerid])
		{
			SendClientMessage(playerid, 0xec4134FF, "[DEBUG]{FFFFFF} Streaming iniciado");
			SvAddKey(playerid, 0x5A);
		}
	#endif

	//printf("[%d] OnPlayerConnect 5", playerid);
	if (isBotConnection(playerid))
	{
		RegisterBot(playerid);
		return 0;
	}

	if (!IsPlayerNPC(playerid))
	{
		CheckProxy(playerid);

		if (GetPlayersInIP(PLAYER_TEMP[playerid][py_IP]) > 5)
		{
			GetPlayerIp(playerid, PLAYER_TEMP[playerid][py_IP], 16);
		    
		    SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado por exceder el máximo de conexiones");
		    KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
			return 0;
		}
	}
	//printf("[%d] OnPlayerConnect 6", playerid);
	EnablePlayerCameraTarget(playerid, true);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	TogglePlayerControllableEx(playerid, true);
	ResetPlayerMoney(playerid);
	CancelSelectTextDrawEx(playerid);
	SetPlayerScore(playerid, 0);
	ResetPlayerWeapons(playerid);
	SetPlayerColorEx(playerid, PLAYER_COLOR);
	CancelEdit(playerid);
	//printf("[%d] OnPlayerConnect 7", playerid);
	new DB_Query[550], DBResult:ban_Result;
	format(DB_Query, sizeof DB_Query, "SELECT DATETIME('NOW') AS `NOW`, `BANS`.*, `BAD_HISTORY`.* FROM `BANS`, `BAD_HISTORY` WHERE (`BANS`.`NAME` = '%q' OR `BANS`.`IP` = '%q' OR `BANS`.`GPCI` = '%q') AND `BAD_HISTORY`.`ID` = `BANS`.`ID_HISTORY`;", PLAYER_TEMP[playerid][py_NAME], PLAYER_TEMP[playerid][py_IP], PLAYER_TEMP[playerid][py_SERIAL]);
	ban_Result = db_query(Database, DB_Query);
	//printf("[%d] OnPlayerConnect 8", playerid);
	if (!IsPlayerNPC(playerid) && db_num_rows(ban_Result))
	{
		new now[24], name[24], expire_date[24], type, by, text[128], date[24];

		db_get_field_assoc(ban_Result, "NOW", now, 24);
		db_get_field_assoc(ban_Result, "NAME", name, 24);
		db_get_field_assoc(ban_Result, "EXPIRE_DATE", expire_date, 24);
		type = db_get_field_assoc_int(ban_Result, "TYPE");
		by = db_get_field_assoc_int(ban_Result, "BY");
		db_get_field_assoc(ban_Result, "TEXT", text, 128);
		db_get_field_assoc(ban_Result, "DATE", date, 24);

		if (type == TYPE_BAN)
		{
			new dialog[480];
			format(dialog, sizeof dialog,

				"\
					"COL_WHITE"Esta IP, cuenta o serial está suspendida permanentemente.\n\
					\n\
					Tu nombre: %s\n\
					\n\
					Nombre: %s\n\
					Expulsado por: %s\n\
					Fecha expulsión: %s\n\
					Razón: %s\n\
					\n\
				",

				PLAYER_TEMP[playerid][py_NAME],
				name, GetDatabaseUserName(by), date, text
			);

			ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
			KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
		}
		else if (type == TYPE_TEMP_BAN)
		{
			new DBResult:still_banned_Result;
			format(DB_Query, sizeof DB_Query, "SELECT * FROM `BANS` WHERE (`NAME` = '%q' OR `IP` = '%q') AND DATETIME('NOW') >= `EXPIRE_DATE`;", PLAYER_TEMP[playerid][py_NAME], PLAYER_TEMP[playerid][py_IP]);
			still_banned_Result = db_query(Database, DB_Query);

			if (db_num_rows(still_banned_Result))
			{
				format(DB_Query, sizeof DB_Query, "DELETE FROM `BANS` WHERE (`NAME` = '%q' OR `IP` = '%q');", PLAYER_TEMP[playerid][py_NAME], PLAYER_TEMP[playerid][py_IP]);
				db_free_result(db_query(Database, DB_Query));
			}
			else
			{
				new dialog[500];
				format(dialog, sizeof dialog,

					"\
						"COL_WHITE"Esta IP o cuenta está suspendida temporalmente.\n\
						\n\
						Tu nombre: %s\n\
						Tu IP: %s\n\
						\n\
						Nombre: %s\n\
						Expulsado por: %s\n\
						Fecha expulsión: %s\n\
						Razón: %s\n\
						\n\
						Fecha actual: %s\n\
						Fecha readmisión: %s\n\
						\n\
					",

					PLAYER_TEMP[playerid][py_NAME], PLAYER_TEMP[playerid][py_IP],
					name, GetDatabaseUserName(by), date, text, now, expire_date
				);

				ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
				KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
			}
			db_free_result(still_banned_Result);
		}
	}
	db_free_result(ban_Result);
	//printf("[%d] OnPlayerConnect 9", playerid);
	if (PLAYER_TEMP[playerid][py_KICKED]) return 1;
	//printf("[%d] OnPlayerConnect 10", playerid);
	PLAYER_TEMP[playerid][py_USER_VALID_NAME] = true;
	PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] = 9999;
	SetRolePlayNames(playerid);
	//printf("[%d] OnPlayerConnect 11", playerid);
	// Account pre-load
	new DBResult:Result;
	format(DB_Query, sizeof(DB_Query),
	"\
		SELECT CUENTA.*, REGISTRO.DATE, PERSONAJE.INTERIOR, PERSONAJE.LOCAL_INTERIOR, PERSONAJE.POS_X, PERSONAJE.POS_Y, PERSONAJE.POS_Z, PERSONAJE.ANGLE, PERSONAJE.STATE AS PSTATE FROM `CUENTA`, `REGISTRO`, `PERSONAJE` WHERE CUENTA.`NAME` = '%q' AND REGISTRO.`ID_USER` = CUENTA.`ID` AND PERSONAJE.`ID_USER` = CUENTA.`ID`;\
		UPDATE `CUENTA` SET `CONNECTED` = '1', `PLAYERID` = '%d' WHERE `NAME` = '%q';\
	", PLAYER_TEMP[playerid][py_NAME], playerid, PLAYER_TEMP[playerid][py_NAME]);
	Result = db_query(Database, DB_Query);
	//printf("[%d] OnPlayerConnect 12", playerid);

	if (!IsPlayerNPC(playerid))
	{
		if (db_num_rows(Result))
		{
			ACCOUNT_INFO[playerid][ac_ID] = db_get_field_assoc_int(Result, "ID");
			db_get_field_assoc(Result, "IP", ACCOUNT_INFO[playerid][ac_IP], 16);
			db_get_field_assoc(Result, "NAME", ACCOUNT_INFO[playerid][ac_NAME], 24);
			db_get_field_assoc(Result, "GPCI", ACCOUNT_INFO[playerid][ac_SERIAL], 50);
			db_get_field_assoc(Result, "EMAIL", ACCOUNT_INFO[playerid][ac_EMAIL], 32);
			db_get_field_assoc(Result, "PASS", ACCOUNT_INFO[playerid][ac_PASS], 64 + 1);
			db_get_field_assoc(Result, "SALT", ACCOUNT_INFO[playerid][ac_SALT], 16);

			db_get_field_assoc(Result, "LAST_CONNECTION", ACCOUNT_INFO[playerid][ac_LAST_CONNECTION], 24);
			ACCOUNT_INFO[playerid][ac_TIME_PLAYING] = db_get_field_assoc_int(Result, "TIME-PLAYING");
			ACCOUNT_INFO[playerid][ac_LEVEL] = db_get_field_assoc_int(Result, "LEVEL");
			ACCOUNT_INFO[playerid][ac_REP] = db_get_field_assoc_int(Result, "REP");
			ACCOUNT_INFO[playerid][ac_STATE] = db_get_field_assoc_int(Result, "STATE");
			db_get_field_assoc(Result, "DATE", ACCOUNT_INFO[playerid][reg_DATE], 24);
			ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL] = db_get_field_assoc_int(Result, "DOUBT_CHANNEL");
			ACCOUNT_INFO[playerid][ac_TIME_FOR_REP] = db_get_field_assoc_int(Result, "TIME_FOR_REP");
			ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] = db_get_field_assoc_int(Result, "ADMIN_LEVEL");
			ACCOUNT_INFO[playerid][ac_PAYDAY_REP] = db_get_field_assoc_int(Result, "PAYDAY_REP");
			ACCOUNT_INFO[playerid][ac_SU] = db_get_field_assoc_int(Result, "SU");
			db_get_field_assoc(Result, "SU_EXPIRE_DATE", ACCOUNT_INFO[playerid][ac_SU_EXPIRE_DATE], 24);
			ACCOUNT_INFO[playerid][ac_SD] = db_get_field_assoc_int(Result, "SD");


			CHARACTER_INFO[playerid][ch_INTERIOR] = db_get_field_assoc_int(Result, "INTERIOR");
			CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = db_get_field_assoc_int(Result, "LOCAL_INTERIOR");
			CHARACTER_INFO[playerid][ch_WORLD] = db_get_field_assoc_int(Result, "WORLD");
			CHARACTER_INFO[playerid][ch_POS][0] = db_get_field_assoc_float(Result, "POS_X");
			CHARACTER_INFO[playerid][ch_POS][1] = db_get_field_assoc_float(Result, "POS_Y");
			CHARACTER_INFO[playerid][ch_POS][2] = db_get_field_assoc_float(Result, "POS_Z");
			CHARACTER_INFO[playerid][ch_ANGLE] = db_get_field_assoc_float(Result, "ANGLE");
			CHARACTER_INFO[playerid][ch_STATE] = db_get_field_assoc_int(Result, "PSTATE");

			switch(CHARACTER_INFO[playerid][ch_STATE])
			{
				case ROLEPLAY_STATE_INTERIOR:
				{
					new index = GetEnterExitIndexById(CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA]);
					if (index == -1)
					{
						CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
						CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
						new index_pos = minrand(0, sizeof(NewUserPos));
						CHARACTER_INFO[playerid][ch_POS][0] = NewUserPos[index_pos][0];
						CHARACTER_INFO[playerid][ch_POS][1] = NewUserPos[index_pos][1];
						CHARACTER_INFO[playerid][ch_POS][2] = NewUserPos[index_pos][2];
						CHARACTER_INFO[playerid][ch_ANGLE] = NewUserPos[index_pos][3];
						CHARACTER_INFO[playerid][ch_INTERIOR] = 0;
						CHARACTER_INFO[playerid][ch_WORLD] = 0;
					}
					else
					{
						CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
						CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
						CHARACTER_INFO[playerid][ch_POS][0] = ENTER_EXIT[index][ee_EXT_X];
						CHARACTER_INFO[playerid][ch_POS][1] = ENTER_EXIT[index][ee_EXT_Y];
						CHARACTER_INFO[playerid][ch_POS][2] = ENTER_EXIT[index][ee_EXT_Z];
						CHARACTER_INFO[playerid][ch_ANGLE] = ENTER_EXIT[index][ee_EXT_ANGLE];
						CHARACTER_INFO[playerid][ch_INTERIOR] = ENTER_EXIT[index][ee_EXT_INTERIOR];
						CHARACTER_INFO[playerid][ch_WORLD] = ENTER_EXIT[index][ee_EXT_WORLD];
					}
				}
				case ROLEPLAY_STATE_OWN_PROPERTY:
				{
					new index = GetPropertyIndexByID(CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA]);
					if (index == -1)
					{
						CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
						CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
						new index_pos = minrand(0, sizeof(NewUserPos));
						CHARACTER_INFO[playerid][ch_POS][0] = NewUserPos[index_pos][0];
						CHARACTER_INFO[playerid][ch_POS][1] = NewUserPos[index_pos][1];
						CHARACTER_INFO[playerid][ch_POS][2] = NewUserPos[index_pos][2];
						CHARACTER_INFO[playerid][ch_ANGLE] = NewUserPos[index_pos][3];
						CHARACTER_INFO[playerid][ch_INTERIOR] = 0;
						CHARACTER_INFO[playerid][ch_WORLD] = 0;
					}
					else
					{
						if (PROPERTY_INFO[index][property_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID])
						{
							CHARACTER_INFO[playerid][ch_POS][0] = PROPERTY_INTERIORS[ PROPERTY_INFO[index][property_ID_INTERIOR] ][property_INT_X];
							CHARACTER_INFO[playerid][ch_POS][1] = PROPERTY_INTERIORS[ PROPERTY_INFO[index][property_ID_INTERIOR] ][property_INT_Y];
							CHARACTER_INFO[playerid][ch_POS][2] = PROPERTY_INTERIORS[ PROPERTY_INFO[index][property_ID_INTERIOR] ][property_INT_Z];
							CHARACTER_INFO[playerid][ch_ANGLE] = PROPERTY_INTERIORS[ PROPERTY_INFO[index][property_ID_INTERIOR] ][property_INT_ANGLE];
							CHARACTER_INFO[playerid][ch_INTERIOR] = PROPERTY_INTERIORS[ PROPERTY_INFO[index][property_ID_INTERIOR] ][property_INT_INTERIOR];
						}
						else
						{
							CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
							CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
							CHARACTER_INFO[playerid][ch_POS][0] = PROPERTY_INFO[index][property_EXT_X];
							CHARACTER_INFO[playerid][ch_POS][1] = PROPERTY_INFO[index][property_EXT_Y];
							CHARACTER_INFO[playerid][ch_POS][2] = PROPERTY_INFO[index][property_EXT_Z];
							CHARACTER_INFO[playerid][ch_ANGLE] = PROPERTY_INFO[index][property_EXT_ANGLE];
							CHARACTER_INFO[playerid][ch_INTERIOR] = PROPERTY_INFO[index][property_EXT_INTERIOR];
						}
					}
				}
				case ROLEPLAY_STATE_GUEST_PROPERTY:
				{
					new index = GetPropertyIndexByID(CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA]);
					if (index == -1)
					{
						CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
						CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
						new index_pos = minrand(0, sizeof(NewUserPos));
						CHARACTER_INFO[playerid][ch_POS][0] = NewUserPos[index_pos][0];
						CHARACTER_INFO[playerid][ch_POS][1] = NewUserPos[index_pos][1];
						CHARACTER_INFO[playerid][ch_POS][2] = NewUserPos[index_pos][2];
						CHARACTER_INFO[playerid][ch_ANGLE] = NewUserPos[index_pos][3];
						CHARACTER_INFO[playerid][ch_INTERIOR] = 0;
					}
					else
					{
						CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
						CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
						CHARACTER_INFO[playerid][ch_POS][0] = PROPERTY_INFO[index][property_EXT_X];
						CHARACTER_INFO[playerid][ch_POS][1] = PROPERTY_INFO[index][property_EXT_Y];
						CHARACTER_INFO[playerid][ch_POS][2] = PROPERTY_INFO[index][property_EXT_Z];
						CHARACTER_INFO[playerid][ch_ANGLE] = PROPERTY_INFO[index][property_EXT_ANGLE];
						CHARACTER_INFO[playerid][ch_INTERIOR] = PROPERTY_INFO[index][property_EXT_INTERIOR];
					}
				}
				case ROLEPLAY_STATE_OWN_CLUB:
				{
					new index = GetClubIndexByID(CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA]);
					if (index == -1)
					{
						CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
						CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
						new index_pos = minrand(0, sizeof(NewUserPos));
						CHARACTER_INFO[playerid][ch_POS][0] = NewUserPos[index_pos][0];
						CHARACTER_INFO[playerid][ch_POS][1] = NewUserPos[index_pos][1];
						CHARACTER_INFO[playerid][ch_POS][2] = NewUserPos[index_pos][2];
						CHARACTER_INFO[playerid][ch_ANGLE] = NewUserPos[index_pos][3];
						CHARACTER_INFO[playerid][ch_INTERIOR] = 0;
						CHARACTER_INFO[playerid][ch_WORLD] = 0;
					}
					else
					{
						CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
						CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
						CHARACTER_INFO[playerid][ch_POS][0] = CLUBS_INFO[index][club_X];
						CHARACTER_INFO[playerid][ch_POS][1] = CLUBS_INFO[index][club_Y];
						CHARACTER_INFO[playerid][ch_POS][2] = CLUBS_INFO[index][club_Z];
						CHARACTER_INFO[playerid][ch_ANGLE] = CLUBS_INFO[index][club_ANGLE];
						CHARACTER_INFO[playerid][ch_INTERIOR] = 0;
					}
				}
			}

			PlayAudioStreamForPlayer(playerid, INTRO_MUSIC[random(sizeof(INTRO_MUSIC))]); // Música
			PLAYER_TEMP[playerid][py_USER_EXIT] = true;
			ClearPlayerChatBox(playerid);
		}
		else
		{
			PlayAudioStreamForPlayer(playerid, INTRO_MUSIC[random(sizeof(INTRO_MUSIC))]); // Música
			ClearPlayerChatBox(playerid);
		}
	}
	
	db_free_result(Result);
	//printf("[%d] OnPlayerConnect 13", playerid);
	CreatePlayerTextDraws(playerid);
	//printf("[%d] OnPlayerConnect 14", playerid);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerDisconnect %d %d",playerid, reason); // debug juju
	#endif

	if (ACCOUNT_INFO[playerid][ac_ID] != 0)
	{
		new DB_Query[128];
		format(DB_Query, sizeof DB_Query, "UPDATE `CUENTA` SET `CONNECTED` = '0', PLAYERID = '-1' WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
		db_free_result(db_query(Database, DB_Query));
	}

	#if defined VOICE_CHAT
		if (lstream[playerid])
		{
			SvDeleteStream(lstream[playerid]);
			lstream[playerid] = SV_NULL;
		}
	#endif

  	if (PLAYER_TEMP[playerid][py_USER_LOGGED]) // ha pasado la pantalla de registro/login y ha estado jugando
  	{
  		ACCOUNT_INFO[playerid][ac_TIME_PLAYING] += gettime() - PLAYER_TEMP[playerid][py_TIME_PLAYING];
  		if (PLAYER_TEMP[playerid][py_USER_EXIT])
  		{
			if (CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] && CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL)
				CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] -= gettime() - PLAYER_TEMP[playerid][py_ENTER_JAIL_TIME];

			if (PLAYER_MISC[playerid][MISC_SEARCH_LEVEL])
			{
				CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_JAIL;
    			CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] = 600 * PLAYER_MISC[playerid][MISC_SEARCH_LEVEL];
				CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID] =
				PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] = 0;
				SetPlayerPosEx(playerid, JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID] ][jail_X], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_Y], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_Z], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_ANGLE], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_INTERIOR], 0, true);
			}

			if (PLAYER_TEMP[playerid][py_COMBAT_MODE])
			{
				ResetPlayerWeaponsEx(playerid);
				SavePlayerWeaponsData(playerid);
			}

			if (PLAYER_TEMP[playerid][py_BOXING])
			{
				for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
				{
					if (PLAYER_TEMP[i][py_BOX_PLAYER] == playerid && PLAYER_TEMP[i][py_BOX_BETTING])
					{
						ShowPlayerNotification(i, "Te hemos devuelto el dinero porque el luchador que apostaste se ha ido del ring.", 6);
						GivePlayerCash(i, PLAYER_TEMP[i][py_BOX_BET]);
						PLAYER_TEMP[i][py_BOX_PLAYER] = INVALID_PLAYER_ID;
						PLAYER_TEMP[i][py_BOX_BET] = 0;
						PLAYER_TEMP[i][py_BOX_BETTING] = false;
					}
				}

				new str_text[128];
				format(str_text, sizeof(str_text), "%s se ha ido del ring.", PLAYER_TEMP[playerid][py_NAME]);
				SendBoxMessage(str_text, 3);
			}

			if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 5000)
			{
				SaveUserData(playerid);
	  			SavePlayerMisc(playerid);
	  		}
  			if (PLAYER_MISC[playerid][MISC_GAMEMODE] == 0) SavePlayerVehicles(playerid, true);

  			if (PLAYER_CREW[playerid][player_crew_VALID]) CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ONLINE_MEMBERS] --;

	  		if (PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] != INVALID_VEHICLE_ID)
	  		{
	  			if (GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][gb_vehicle_LAST_DRIVER] == playerid) GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][gb_vehicle_LAST_DRIVER] = INVALID_PLAYER_ID;
	  		}

	  		if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	  		{
	  			new vehicleid = GetPlayerVehicleID(playerid);
	  			if (vehicleid)
	  			{
	  				GLOBAL_VEHICLES[ vehicleid ][gb_vehicle_TP_IMMUNITY] = gettime() + 5;
	  				GLOBAL_VEHICLES[ vehicleid ][gb_vehicle_DRIVER] = INVALID_PLAYER_ID;
	  				GLOBAL_VEHICLES[ vehicleid ][gb_vehicle_LAST_DRIVER] = INVALID_PLAYER_ID;
	  				GLOBAL_VEHICLES[ vehicleid ][gb_vehicle_OCCUPIED] = false;
	  			}
	  		}

	  		if (PLAYER_TEMP[playerid][py_PIVOT_OBJECT] != INVALID_OBJECT_ID) DestroyPlayerObject(playerid, PLAYER_TEMP[playerid][py_PIVOT_OBJECT]);

	  		EndPlayerJob(playerid, false);

	  		if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL) CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] -= gettime() - PLAYER_TEMP[playerid][py_ENTER_JAIL_TIME];

	  		GetPlayerPos(playerid, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2]);
	  		GetPlayerFacingAngle(playerid, CHARACTER_INFO[playerid][ch_ANGLE]);
	  		CHARACTER_INFO[playerid][ch_WORLD] = GetPlayerVirtualWorld(playerid);
	  		CHARACTER_INFO[playerid][ch_INTERIOR] = GetPlayerInterior(playerid);
	  		PLAYER_TEMP[playerid][py_TIME_PASSED_LAST_REP] = gettime() * 1000 - PLAYER_TEMP[playerid][py_TIME_PASSED_LAST_REP];
	  		ACCOUNT_INFO[playerid][ac_TIME_FOR_REP] -= PLAYER_TEMP[playerid][py_TIME_PASSED_LAST_REP];

	  		if (CHARACTER_INFO[playerid][ch_HEALTH] <= 0.0) CHARACTER_INFO[playerid][ch_HEALTH] = 1.0;
	  		if (CHARACTER_INFO[playerid][ch_HEALTH] >= 100.0) CHARACTER_INFO[playerid][ch_HEALTH] = 100.0;
	  		if (CHARACTER_INFO[playerid][ch_ARMOUR] >= 100.0) CHARACTER_INFO[playerid][ch_ARMOUR] = 100.0;

	  		if (!PLAYER_TEMP[playerid][py_PLAYER_SPECTATE])
	  		{
		  		new disconnect_message[128];
		  		switch(reason)
		  		{
		  			case 0: format(disconnect_message, sizeof disconnect_message, "[ID: %d] (( %s se ha desconectado, razón: crash ))", playerid, PLAYER_TEMP[playerid][py_RP_NAME]);
		  			case 1: format(disconnect_message, sizeof disconnect_message, "[ID: %d] (( %s se ha desconectado, razón: salida voluntaria ))", playerid, PLAYER_TEMP[playerid][py_RP_NAME]);
		  			case 2: format(disconnect_message, sizeof disconnect_message, "[ID: %d] (( %s se ha desconectado, razón: expulsado por el servidor ))", playerid, PLAYER_TEMP[playerid][py_RP_NAME]);
		  		}
		  		NearbyMessage(CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_INTERIOR], GetPlayerVirtualWorld(playerid), 15.0, COLOR_FADE1, disconnect_message);
		  	}

	  		if (PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) EndPhoneCall(playerid);

			if (PlayerHasBoombox(playerid))
			{
				for(new i = 0; i < MAX_BOOMBOXS; i++)
				{
					if (BOOMBOX[i][bb_OWNER] == ACCOUNT_INFO[playerid][ac_ID])
						DestroyBoombox(i);
				}
			}

			if (PLAYER_TEMP[playerid][py_DL_LABEL] != INVALID_3DTEXT_ID)
			{
				DestroyDynamic3DTextLabel(PLAYER_TEMP[playerid][py_DL_LABEL]);
				KillTimer(PLAYER_TEMP[playerid][py_DL_TIMER]);
				PLAYER_TEMP[playerid][py_DL_LABEL] = INVALID_3DTEXT_ID;
			}
  		}
  	}

	DestroyPlayerCheckpoints(playerid);
	DestroyPlayerTextDraws(playerid);

	if (PLAYER_MISC[playerid][MISC_CONFIG_FP]) DestroyObject(PLAYER_TEMP[playerid][py_FP_OBJ]);
 	for(new i = 0; i != MAX_TIMERS_PER_PLAYER; i++) KillTimer(PLAYER_TEMP[playerid][py_TIMERS][i]);
  	
  	ResetPlayerVariables(playerid);
  	return 1;
}

forward RestorePlayerPos(playerid, Float:x, Float: y, Float: z);
public RestorePlayerPos(playerid, Float:x, Float: y, Float: z)
{
	#if DEBUG_MODE == 1
		printf("RestorePlayerPos"); // debug juju
	#endif

	if (GetPlayerInterior(playerid) == 0) return 0;
	SetPlayerPosEx(playerid, x, y, z, 90.0, 0, 0);
	return 1;
}

forward StopDrugEffect(playerid);
public StopDrugEffect(playerid)
{
	#if DEBUG_MODE == 1
		printf("StopDrugEffect"); // debug juju
	#endif

    SetPlayerDrunkLevel(playerid, 0);
    new p_int = GetPlayerInterior(playerid);
	if (p_int != 25 || p_int != 26 || p_int != 27)
	{
    	SetPlayerTime(playerid, SERVER_TIME[0], SERVER_TIME[1]);
    }

    SetPlayerWeather(playerid, SERVER_WEATHER);
    return 1;
}

forward InjuredAnimationCut(playerid);
public InjuredAnimationCut(playerid)
{
	#if DEBUG_MODE == 1
		printf("InjuredAnimationCut"); // debug juju
	#endif

	ApplyAnimation(playerid, "SWEET", "SWEET_INJUREDLOOP", 4.1, true, false, false, 1, 0, 1);
	PLAYER_TEMP[playerid][py_IN_INJURED_ANIMATION] = false;
	return 1;
}

forward SavePlayerData(playerid);
public SavePlayerData(playerid)
{
	#if DEBUG_MODE == 1
		printf("SavePlayerData"); // debug juju
	#endif

	SaveUserData(playerid);
	SavePlayerVehicles(playerid, false);
	SavePlayerMisc(playerid);
	SavePlayerWeaponsData(playerid);

	/*if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
	{
		if (GetPlayerPing(playerid) >= 300)
			Anticheat_Kick(playerid, "Ping alto");
	}*/

	return 1;
}

forward AddPlayerReputation(playerid);
public AddPlayerReputation(playerid)
{
	#if DEBUG_MODE == 1
		printf("AddPlayerReputation"); // debug juju
	#endif

	new neccessary_rep = ACCOUNT_INFO[playerid][ac_LEVEL] * REP_MULTIPLIER;
	if (ACCOUNT_INFO[playerid][ac_REP] < neccessary_rep)
	{
		ACCOUNT_INFO[playerid][ac_REP] ++;

		if (ACCOUNT_INFO[playerid][ac_REP] >= neccessary_rep) NextLevel(playerid);

		ACCOUNT_INFO[playerid][ac_PAYDAY_REP] ++;
		if (ACCOUNT_INFO[playerid][ac_PAYDAY_REP] >= REP_FOR_PAYDAY)
		{
			#if defined VOICE_CHAT
			if (SvGetVersion(playerid))
			{
				PlayerPayday(playerid);
			}
			else ShowPlayerNotification(playerid, "Instale el cliente de Hyaxe en www.hyaxe.com/client");
			#endif

			PlayerPayday(playerid);
			ACCOUNT_INFO[playerid][ac_PAYDAY_REP] = 0;
		}

		ACCOUNT_INFO[playerid][ac_TIME_PLAYING] += gettime() - PLAYER_TEMP[playerid][py_TIME_PLAYING];
		PLAYER_TEMP[playerid][py_TIME_PLAYING] = gettime();
		new DB_Query[256];
		format(DB_Query, sizeof DB_Query,

			"\
				UPDATE `CUENTA` SET `TIME-PLAYING` = '%d', `LEVEL` = '%d', `REP` = '%d', `TIME_FOR_REP` = '%d', `PAYDAY_REP` = '%d' WHERE `ID` = '%d';\
			",
				ACCOUNT_INFO[playerid][ac_TIME_PLAYING], ACCOUNT_INFO[playerid][ac_LEVEL], ACCOUNT_INFO[playerid][ac_REP], TIME_FOR_REP, ACCOUNT_INFO[playerid][ac_PAYDAY_REP], ACCOUNT_INFO[playerid][ac_ID]
		);
		printf("%s", DB_Query);

		db_free_result(db_query(Database, DB_Query));

		ACCOUNT_INFO[playerid][ac_TIME_FOR_REP] = TIME_FOR_REP;
		PLAYER_TEMP[playerid][py_TIME_PASSED_LAST_REP] = gettime() * 1000;

		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][2]);
		PLAYER_TEMP[playerid][py_TIMERS][2] = SetTimerEx("AddPlayerReputation", ACCOUNT_INFO[playerid][ac_TIME_FOR_REP], false, "i", playerid);
		return 1;
	}
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][2]);
	return 0;
}

forward CheckCrunchAnimation(playerid);
public CheckCrunchAnimation(playerid)
{
	#if DEBUG_MODE == 1
		printf("CheckCrunchAnimation"); // debug juju
	#endif

	if (!IsPlayerConnected(playerid)) return 0;
	if (PLAYER_MISC[playerid][MISC_CONFIG_FP])
	{
		new anim = GetPlayerAnimationIndex(playerid);
		if (anim != 1274 &&
			anim != 1159 &&
			anim != 1158 &&
			anim != 1365 &&
			anim != 640 &&
			anim != 361 &&
			anim != 1274 &&
			anim != 1070 &&
			anim != 1069)
		{
			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][40]);
			SetFirstPerson(playerid, true);
		}
	}
	return 1;
}

forward TogglePlayerControl(playerid, bool:controlable);
public TogglePlayerControl(playerid, bool:controlable)
{
	#if DEBUG_MODE == 1
		printf("TogglePlayerControl"); // debug juju
	#endif

	return TogglePlayerControllableEx(playerid, controlable);
}

forward HealthUp(playerid);
public HealthUp(playerid)
{
	#if DEBUG_MODE == 1
		printf("HealthUp"); // debug juju
	#endif

	if (CHARACTER_INFO[playerid][ch_STATE] != ROLEPLAY_STATE_HOSPITAL) return 1;

	if (PLAYER_TEMP[playerid][py_HOSPITAL_LIFE] < 100)
	{
		if (ACCOUNT_INFO[playerid][ac_SU] >= 2) PLAYER_TEMP[playerid][py_HOSPITAL_LIFE] += 10;
		else PLAYER_TEMP[playerid][py_HOSPITAL_LIFE] += 5;

		if (PLAYER_TEMP[playerid][py_HOSPITAL_LIFE] > 100) PLAYER_TEMP[playerid][py_HOSPITAL_LIFE] = 100;
		UpdateHospitalSizeTextdrawLife(playerid);
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][4]);
		PLAYER_TEMP[playerid][py_TIMERS][4] = SetTimerEx("HealthUp", 1000, false, "i", playerid);
	}
	else
	{
		if (ACCOUNT_INFO[playerid][ac_SU] >= 2) CHARACTER_INFO[playerid][ch_HEALTH] = 100.0;
		else CHARACTER_INFO[playerid][ch_HEALTH] = 50.0;

		SetPlayerHealthEx(playerid, CHARACTER_INFO[playerid][ch_HEALTH]);

		ClearPlayerChatBox(playerid);
		ShowPlayerMessage(playerid, "Te has recuperado.", 2);
		TogglePlayerControllableEx(playerid, true);
		SetPlayerPosEx(playerid, PLAYER_TEMP[playerid][py_HP_POS_DATA][0], PLAYER_TEMP[playerid][py_HP_POS_DATA][1], PLAYER_TEMP[playerid][py_HP_POS_DATA][2], PLAYER_TEMP[playerid][py_HP_POS_DATA][3], 3, 2, 1);
		new price = ACCOUNT_INFO[playerid][ac_LEVEL] * 200;
		if (price > 1000) price = 1000;
		price += minrand(100, 200);

		if (price > CHARACTER_INFO[playerid][ch_CASH])
		{
			price = CHARACTER_INFO[playerid][ch_CASH];
			if (price < 0) price = 0;
		}

		new pay_str[64];
		if (PLAYER_WORKS[playerid][WORK_POLICE] || ACCOUNT_INFO[playerid][ac_SU] >= 2)
		{
			ShowPlayerNotification(playerid, "No se te ha cobrado por ser VIP", 4);
		}
		else
		{
			format(pay_str, sizeof(pay_str), "El coste de los servicios médicos ofrecidos es de %s$", number_format_thousand(price));
			ShowPlayerNotification(playerid, pay_str, 4);
			GivePlayerCash(playerid, -price);
		}

		CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
		PLAYER_TEMP[playerid][py_INTERIOR_INDEX] = -1;

		if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED)
		{
			CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_JAIL;
			CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] = 300;
			CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID] = 0;
			PLAYER_TEMP[playerid][py_ENTER_JAIL_TIME] = gettime();
			SetSpawnInfo(playerid, DEFAULT_TEAM, CHARACTER_INFO[playerid][ch_SKIN], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID] ][jail_X], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_Y], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_Z], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_ANGLE], 0, 0, 0, 0, 0, 0);
			CHARACTER_INFO[playerid][ch_INTERIOR] = JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_INTERIOR];
			PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];

			new time = CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] - (gettime() - PLAYER_TEMP[playerid][py_ENTER_JAIL_TIME]);
			
			new str_text[128];
			format(str_text, sizeof(str_text), "~r~Encarcelado~w~~n~%s minutos.", TimeConvert(time));
			ShowPlayerMessage(playerid, str_text, 1);

			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][38]);
			PLAYER_TEMP[playerid][py_TIMERS][38] = SetTimerEx("SavePrisionTime", 120000, true, "i", playerid);

			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][39]);
			PLAYER_TEMP[playerid][py_TIMERS][39] = SetTimerEx("UpdatePrisionTime", 1000, true, "i", playerid);
		}
		else
		{
			GetHospitalSpawnPosition(PLAYER_TEMP[playerid][py_HOSPITAL], CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], CHARACTER_INFO[playerid][ch_INTERIOR], CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA], CHARACTER_INFO[playerid][ch_STATE]);
			SetSpawnInfo(playerid, DEFAULT_TEAM, CHARACTER_INFO[playerid][ch_SKIN], CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], 0, 0, 0, 0, 0, 0);
			PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];
		}
		PLAYER_TEMP[playerid][py_PLAYER_FINISH_HOSPITAL] = true;

		ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 0, true);
		ClearAnimations(playerid);	
	}
	return 1;
}

forward HungryThirstDown(playerid);
public HungryThirstDown(playerid)
{
	/*#if DEBUG_MODE == 1
		printf("HungryThirstDown"); // debug juju
	#endif*/

	if (PLAYER_TEMP[playerid][py_GAME_STATE] != GAME_STATE_NORMAL) return HidePlayerHud(playerid);
	if (!PLAYER_TEMP[playerid][py_HUD_TEXTDRAWS]) return HidePlayerHud(playerid);

	new current_gettime = gettime();

	if (ACCOUNT_INFO[playerid][ac_SU])
	{
		if (current_gettime - PLAYER_TEMP[playerid][py_LAST_SU_CHECK] > 300)
		{
			CheckPlayerSuperUser(playerid);
		}
	}

	CHARACTER_INFO[playerid][ch_THIRST] -= floatdiv(float(INTERVAL_HUNGRY_THIRST_DOWN), floatmul(THIRST_HOURS_STOPPED, 36));
	CHARACTER_INFO[playerid][ch_HUNGRY] -= floatdiv(float(INTERVAL_HUNGRY_THIRST_DOWN), floatmul(HUNGRY_HOURS_STOPPED, 36));

	if (CHARACTER_INFO[playerid][ch_THIRST] <= 0.5) CHARACTER_INFO[playerid][ch_THIRST] = 0.5;
	if (CHARACTER_INFO[playerid][ch_HUNGRY] <= 0.5) CHARACTER_INFO[playerid][ch_HUNGRY] = 0.5;
	if (CHARACTER_INFO[playerid][ch_THIRST] < 30.0)
	{
		CHARACTER_INFO[playerid][ch_HEALTH] -= 2.0;

		if (CHARACTER_INFO[playerid][ch_THIRST] <= 1.0 || CHARACTER_INFO[playerid][ch_HEALTH] <= 0.5)
		{
		    SetPlayerDrunkLevel(playerid, 0);
			SetPlayerHealthEx(playerid, 0.0);
			CHARACTER_INFO[playerid][ch_THIRST] = 75.0;
			return 1;
		}

		SetPlayerHealthEx(playerid, CHARACTER_INFO[playerid][ch_HEALTH]);

		if (!PLAYER_TEMP[playerid][py_THIRST_MESSAGE])
		{
			ShowPlayerNotification(playerid, "Empiezas a tener sed, busca algo para tomar o acabarás muriendo.", 5);
			SetPlayerDrunkLevel(playerid, 4000);
			PLAYER_TEMP[playerid][py_THIRST_MESSAGE] = true;
		}
	}

	if (CHARACTER_INFO[playerid][ch_HUNGRY] < 30.0)
	{
		CHARACTER_INFO[playerid][ch_HEALTH] -= 2.0;

		if (CHARACTER_INFO[playerid][ch_HUNGRY] <= 1.0 || CHARACTER_INFO[playerid][ch_HEALTH] <= 0.5)
		{
		    SetPlayerDrunkLevel(playerid, 0);
			SetPlayerHealthEx(playerid, 0.0);
			CHARACTER_INFO[playerid][ch_HUNGRY] = 55.0;
			return 1;
		}

		SetPlayerHealthEx(playerid, CHARACTER_INFO[playerid][ch_HEALTH]);

		if (!PLAYER_TEMP[playerid][py_HUNGRY_MESSAGE])
		{
			ShowPlayerNotification(playerid, "Empiezas a tener hambre, busca algo para comer o acabarás muriendo.", 5);
			SetPlayerDrunkLevel(playerid, 4000);
			PLAYER_TEMP[playerid][py_HUNGRY_MESSAGE] = true;
		}
	}

	UpdatePlayerHud(playerid);
	return 1;
}

forward StartVehicleEngine(playerid, vehicleid);
public StartVehicleEngine(playerid, vehicleid)
{
	#if DEBUG_MODE == 1
		printf("StartVehicleEngine"); // debug juju
	#endif

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] == VEHICLE_STATE_DAMAGED) return ShowPlayerMessage(playerid, "~r~Motor dañado.", 1);
	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] <= 0.1) return ShowPlayerMessage(playerid, "~r~Sin gasolina.", 1);

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 1;
	UpdateVehicleParams(vehicleid);

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_ATTACHED_TO] != INVALID_VEHICLE_ID)
	{
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_ATTACHED_TO] = INVALID_VEHICLE_ID;
		DetachTrailerFromVehicle(vehicleid);
	}

	if (PLAYER_TEMP[playerid][py_TUTORIAL])
	{
		StopAudioStreamForPlayer(playerid);
		
		if (PLAYER_TEMP[playerid][py_TUTORIAL_STEP] == 5) PlayAudioStreamForPlayer(playerid, "http://tmp6.hyaxe.com/tutorial_5.mp3");
		PLAYER_TEMP[playerid][py_TUTORIAL_STEP] = 6;

		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
		PLAYER_TEMP[playerid][py_TIMERS][18] = SetTimerEx("ContinuePlayerIntro", 10000, false, "id", playerid, 3);
	}

	ShowPlayerMessage(playerid, "~g~Encendiendo...", 2);
	SetPlayerChatBubble(playerid, "\n\n\n\n* Ha encendido su vehículo.\n\n\n", 0xffcb90FF, 20.0, 5000);
	return 1;
}

forward UpdatePlayerSpeedo(playerid, vehicleid, Float:maxvel);
public UpdatePlayerSpeedo(playerid, vehicleid, Float:maxvel)
{
	/*#if DEBUG_MODE == 1
		printf("UpdatePlayerSpeedo"); // debug juju
	#endif*/

	if (vehicleid != GetPlayerVehicleID(playerid))
	{
		HidePlayerSpeedoMeter(playerid);
		ShowPlayerSpeedoMeter(playerid);

		GLOBAL_VEHICLES[vehicleid][gb_vehicle_TP_IMMUNITY] = gettime() + 5;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] = INVALID_PLAYER_ID;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_LAST_DRIVER] = playerid;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_OCCUPIED] = false;
		PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] = GetPlayerVehicleID(playerid);
		GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][gb_vehicle_OCCUPIED] = true;
		return 0;
	}

	new Float:vel = GetVehicleSpeed(vehicleid);

	if (ac_Info[CHEAT_VEHICLE_SPEED_HACK][ac_Enabled])
	{
		if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_SPEED_HACK][p_ac_info_IMMUNITY])
		{
			if (vel > maxvel + 100.0)
			{
				if (!ac_Info[CHEAT_VEHICLE_SPEED_HACK][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_VEHICLE_SPEED_HACK);
				else
				{
					if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_SPEED_HACK][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_VEHICLE_SPEED_HACK][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_SPEED_HACK][p_ac_info_DETECTIONS] = 0;
					else PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_SPEED_HACK][p_ac_info_DETECTIONS] ++;

					PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_SPEED_HACK][p_ac_info_LAST_DETECTION] = gettime();
					if (PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_SPEED_HACK][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_VEHICLE_SPEED_HACK][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_VEHICLE_SPEED_HACK);
				}
			}
		}
	}

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] == VEHICLE_STATE_NORMAL)
	{
		GetVehicleHealth(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH]);
		if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] < MIN_VEHICLE_HEALTH)
		{
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] = VEHICLE_STATE_DAMAGED;
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = MIN_VEHICLE_HEALTH;
			SetVehicleHealthEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH], playerid);

			GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 0;
			UpdateVehicleParams(vehicleid);
			ShowPlayerMessage(playerid, "~r~Motor dañado.", 2);

			if (random(10) == 5)
			{
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = 20.0;
				SetVehicleHealthEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH]);
				UpdateVehicleParams(vehicleid);
			}
		}
	}

	if (gettime() > PLAYER_TEMP[playerid][py_FUEL_DOWN_TIME] + 5)
	{
		if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE])
		{
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] -= floatmul(floatdiv(vel, maxvel), 0.1);

			if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] <= 0.1)
			{
				PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_NOFUEL][p_ac_info_IMMUNITY] = gettime() + 15;
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] = 0.0;
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 0;
				UpdateVehicleParams(vehicleid);

			    ShowPlayerMessage(playerid, "~r~El vehículo se ha quedado sin gasolina", 2);
			}
		}
		PLAYER_TEMP[playerid][py_FUEL_DOWN_TIME] = gettime();
	}

	if (PLAYER_TEMP[playerid][py_PLAYER_IN_PHONE]) return HidePlayerSpeedoMeter(playerid);

	new td_str[64],
		td_str_vel[64],
		Float:size_vel,
		Float:size_gasoline;

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] < 450.0)
	{
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][1]);
	}
	else
	{
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][1]);
	}

	size_vel = 544.0 + (floatround(vel) * 0.5);
	if (size_vel < 632.0)
	{
		PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][3], size_vel, 0.000000);
	}

	size_gasoline = 544.0 + (GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] * 0.9);
	if (size_gasoline < 632.0)
	{
		PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][5], size_gasoline, 0.000000);
	}

	PlayerTextDrawBoxColor(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][3], AdjustDarkness(VEHICLE_COLORS[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_2] ], 1.75));
	PlayerTextDrawBoxColor(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][2], VEHICLE_COLORS[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_2] ]);
	PlayerTextDrawBoxColor(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][5], AdjustDarkness(VEHICLE_COLORS[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_2] ], 1.75));
	PlayerTextDrawBoxColor(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][4], VEHICLE_COLORS[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_2] ]);

	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][2]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][3]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][4]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][5]);

	format(td_str, sizeof td_str, "%.1f", GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS]);
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][11], td_str);

	format(td_str_vel, sizeof td_str_vel, "%d", floatround(vel));
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][7], td_str_vel);

	GetVehiclePos(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][0], GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][1], GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][2]);
	return 1;
}

forward FixVehicleUpdate(playerid, vehicleid);
public FixVehicleUpdate(playerid, vehicleid)
{
	#if DEBUG_MODE == 1
		printf("FixVehicleUpdate"); // debug juju
	#endif

	if (vehicleid == INVALID_VEHICLE_ID)
	{
		PLAYER_TEMP[playerid][py_FIX_VALUE] = 0;
		ShowPlayerMessage(playerid, "~r~Cancelado", 3);
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][32]);
		ClearAnimations(playerid);
		return 0;
	}

	if (PLAYER_TEMP[playerid][py_FIX_VALUE] < 100)
	{
		PLAYER_TEMP[playerid][py_FIX_VALUE] += (5 + minrand(1, 8));
		if (PLAYER_TEMP[playerid][py_FIX_VALUE] > 100) PLAYER_TEMP[playerid][py_FIX_VALUE] = 100;

		ApplyAnimation(playerid, "COP_AMBIENT", "COPBROWSE_NOD", 4.1, true, false, false, false, 0, false);
		
		new str_text[64];
		format(str_text, sizeof(str_text), "Reparando ~r~%d%", PLAYER_TEMP[playerid][py_FIX_VALUE]);
		ShowPlayerMessage(playerid, str_text, 2);

		if (PLAYER_TEMP[playerid][py_FIX_VALUE] > 99)
		{
			PLAYER_TEMP[playerid][py_FIX_VALUE] = 0;
			ShowPlayerMessage(playerid, "Reparando ~r~100%", 2);
			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][32]);
			ClearAnimations(playerid);
			PLAYER_MISC[playerid][MISC_FIXKIT] -= 1;

			new Float:health;
			health = GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] + 150.0;
			if (health > 1000.0) health = 1000.0;

			GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = health;

			new driver = GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER];
			if (driver == INVALID_PLAYER_ID) SetVehicleHealthEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH]);
			else SetVehicleHealthEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH], driver);

			UpdateVehicleParams(vehicleid);

			ResetItemBody(playerid);
			SavePlayerMisc(playerid);
		}
	}
	return 1;
}

forward DisableGangRefMark(playerid);
public DisableGangRefMark(playerid)
{
	#if DEBUG_MODE == 1
		printf("DisableGangRefMark"); // debug juju
	#endif

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][38]);

    new city[45], zone[45];
    GetPlayerZones(playerid, city, zone);
    new message[144];
    format(message, sizeof message, "~r~%s~w~ se perdió (%s).", PLAYER_TEMP[playerid][py_RP_NAME], zone);
    SetPlayerColorEx(playerid, PLAYER_COLOR);

    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_CREW[i][player_crew_VALID])
			{
				if (PLAYER_CREW[i][player_crew_ID] == PLAYER_CREW[playerid][player_crew_ID])
				{
					SetPlayerMarkerForPlayer(i, playerid, PLAYER_COLOR);
                    SetPlayerColorEx(playerid, PLAYER_COLOR);
                    ShowPlayerNotification(i, message, 4);
				}
			}
		}
	}
    return 1;
}

forward DisableMafiaRefMark(playerid);
public DisableMafiaRefMark(playerid)
{
	#if DEBUG_MODE == 1
		printf("DisableMafiaRefMark"); // debug juju
	#endif

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][38]);

    new 
		city[45],
		zone[45],
		message[144],
		mafia = GetPlayerMafia(playerid)
	;

    GetPlayerZones(playerid, city, zone);
    format(message, sizeof message, "~r~%s~w~ se perdió (%s).", PLAYER_TEMP[playerid][py_RP_NAME], zone);
    SetPlayerColorEx(playerid, PLAYER_COLOR);

    if (PlayerIsInMafia(playerid))
	{
	    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
		{
			if (IsPlayerConnected(i))
			{
				if (PLAYER_WORKS[i][mafia])
				{
					SetPlayerMarkerForPlayer(i, playerid, PLAYER_COLOR);
                    SetPlayerColorEx(playerid, PLAYER_COLOR);
                    ShowPlayerNotification(i, message, 4);
				}
			}
		}
	}
    return 1;
}

forward DisableCombatMode(playerid);
public DisableCombatMode(playerid)
{
	#if DEBUG_MODE == 1
		printf("DisableCombatMode"); // debug juju
	#endif

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][44]);
	ShowPlayerNotification(playerid, "Has salido del modo de combate.");
	PLAYER_TEMP[playerid][py_COMBAT_MODE] = false;
	return 1;
}

forward CuffPlayer(playerid);
public CuffPlayer(playerid)
{
	#if DEBUG_MODE == 1
		printf("CuffPlayer"); // debug juju
	#endif

	SetPlayerDrunkLevel(playerid, 0);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	CancelEdit(playerid);
	EndPlayerJob(playerid);
	PLAYER_TEMP[playerid][py_HUNGRY_MESSAGE] = false;
	PLAYER_TEMP[playerid][py_THIRST_MESSAGE] = false;
	PLAYER_TEMP[playerid][py_PLAYER_IN_ATM] = false;
	PLAYER_TEMP[playerid][py_PLAYER_IN_INV] = false;
	PLAYER_TEMP[playerid][py_CUFFED] = false;
	PLAYER_TEMP[playerid][py_CUFFING] = false;
	PLAYER_TEMP[playerid][py_PLAYER_WAITING_MP3_HTTP] = false;

	if (PLAYER_TEMP[playerid][py_WANT_MECHANIC])
	{
		PLAYER_TEMP[playerid][py_WANT_MECHANIC] = false;
		DisablePlayerMechanicMark(playerid);
	}

	if (PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) EndPhoneCall(playerid);
	if (PLAYER_TEMP[playerid][py_GPS_MAP]) HidePlayerGpsMap(playerid);

	PLAYER_TEMP[playerid][py_CUFFED] = true;
	PLAYER_TEMP[playerid][py_CUFFING] = false;
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CUFFED);
	TogglePlayerControllableEx(playerid, false);
	return 1;
}

forward UnjailPlayer(playerid);
public UnjailPlayer(playerid)
{
	#if DEBUG_MODE == 1
		printf("UnjailPlayer"); // debug juju
	#endif

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][15]);
	CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] = 0;
	CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_INTERIOR;
	CHARACTER_INFO[playerid][ch_JAILED_BY] = 0;
	CHARACTER_INFO[playerid][ch_JAIL_REASON][0] = EOS;
	
	//SetWeaponsForPlayer(playerid);
	SetPlayerArmedWeapon(playerid, 0);
	TogglePlayerControllableEx(playerid, true);

	for(new i = 0; i != sizeof ENTER_EXIT; i ++)
	{
		if (ENTER_EXIT[i][ee_INTERIOR_TYPE] == JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID] ][jail_INT])
		{
			CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = ENTER_EXIT[i][ee_ID];
			PLAYER_TEMP[playerid][py_PROPERTY_INDEX] = -1;
			PLAYER_TEMP[playerid][py_CLUB_INDEX] = -1;

			CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
			CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
			PLAYER_TEMP[playerid][py_INTERIOR_INDEX] = 0;
			CHARACTER_INFO[playerid][ch_INTERIOR] = 0;
			CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] = 0;
		    SetPlayerPosEx(playerid, 1555.400390, -1675.611694, 16.195312, 0.0, 0, 0, true);

			StopAudioStreamForPlayer(playerid);
			break;
		}
	}

	ShowPlayerMessage(playerid, "~g~Cumpliste tu condena.", 3);
	SetPlayerPoliceSearchLevel(playerid, 0);

	SetPlayerHealthEx(playerid, 100.0);

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][38]);
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][39]);
	return 1;
}

public OnIncomingPacket(playerid, packetid, BitStream:bs)
{
    if (packetid == PLAYER_SYNC)
    {
    	//if (PLAYER_TEMP[playerid][py_KICKED]) return 0;

        new onFootData[PR_OnFootSync];

        BS_IgnoreBits(bs, 8);
        BS_ReadOnFootSync(bs, onFootData);

        //new Float:spid = GetPlayerSpeed(playerid);
        //SendClientMessageEx(playerid, -1, "%f", spid);

        if (onFootData[PR_surfingVehicleId] != 0 && onFootData[PR_surfingVehicleId] != INVALID_VEHICLE_ID)
        {
            if ((floatabs(onFootData[PR_surfingOffsets][0]) >= 50.0) ||
                (floatabs(onFootData[PR_surfingOffsets][1]) >= 50.0) ||
                (floatabs(onFootData[PR_surfingOffsets][2]) >= 50.0)
            )
            {
                return 0;
            }

            /*if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
			{
	            new modelid = GetVehicleModel(onFootData[PR_surfingVehicleId]);

	            if (PLAYER_TEMP[playerid][py_SURFING_VEHICLE] != onFootData[PR_surfingVehicleId])
	            {
	            	if (GetPlayerSurfingVehicleID(playerid) != INVALID_VEHICLE_ID)
	            	{
			            if (ValidSurfingVehicle(modelid))
			            {
				            new Float:speed = GetPlayerSpeed(playerid);
							if (speed > 20.0)
							{
				         		PLAYER_TEMP[playerid][py_SURFING_VEHICLE] = onFootData[PR_surfingVehicleId];
				         		
				         		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][31]);
								PLAYER_TEMP[playerid][py_TIMERS][31] = SetTimerEx("IsValidVehicleAbuse", 10000, false, "ii", playerid, PLAYER_TEMP[playerid][py_SURFING_VEHICLE]);
				         	}
				         	else PLAYER_TEMP[playerid][py_SURFING_VEHICLE] = 0;
				        }
				    }
			    }
			}*/
        }
        else
        {
        	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][31]);
        	PLAYER_TEMP[playerid][py_SURFING_VEHICLE] = 0;
        }

        if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
        {
	        switch(onFootData[PR_animationId])
	        {
				case 157, 159, 161:
		        {
		            if (!IsPlayerInAnyVehicle(playerid))
		            {
		            	Anticheat_Ban(playerid, "Fly #0");
						return 0;
		            }
		        }
		        case 958, 959:
		        {
		        	if (onFootData[PR_weaponId] != WEAPON_PARACHUTE)
					{
						Anticheat_Ban(playerid, "Fly #1");
						return 0;
					}
		        }
		        case 799:
		        {
		            if (!IsPlayerInAnyVehicle(playerid))
		            {
						Anticheat_Ban(playerid, "Anti-L", 3);
						return 0;
		            }
		        }
		        case 695:
		        {
		            if (GetPlayerInterior(playerid) == 0)
		            {
						Anticheat_Kick(playerid, "SleepAnim");
						return 0;
		            }
		        }
		        case 1538, 1539, 1543:
		        {
		        	new Float:depth, Float:playerdepth;
		        	if (!CA_IsPlayerInWater(playerid, depth, playerdepth))
		        	{
		        		if (onFootData[PR_position][2] > 1.0)
						{
							Anticheat_Ban(playerid, "Fly #2");
							return 0;
						}
					}
		        }
		    }

		    if (onFootData[PR_weaponId] && onFootData[PR_weaponId] != 46)
		    {
		    	new 
		    		weapon_slot = GetWeaponSlot(onFootData[PR_weaponId]),
		    		weapon_id,
		    		weapon_ammo
		    	;

		    	if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_WEAPON][p_ac_info_IMMUNITY])
				{
			    	if (PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_ID] != onFootData[PR_weaponId])
			    		return OnPlayerCheatDetected(playerid, CHEAT_WEAPON, weapon_slot);

			    	if (!PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_VALID])
			    		return OnPlayerCheatDetected(playerid, CHEAT_WEAPON, weapon_slot);
			    }

			    if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_AMMO][p_ac_info_IMMUNITY])
			    {
			    	new server_ammo = PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_AMMO] + 150;
			    	GetPlayerWeaponData(playerid, weapon_slot, weapon_id, weapon_ammo);
			    	if (weapon_ammo != PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_AMMO])
			    	{
				    	if (weapon_ammo > server_ammo || weapon_ammo < -1)
				    	{
				    		Anticheat_Ban(playerid, "Ammo #0");
				    		//OnPlayerCheatDetected(playerid, CHEAT_AMMO, weapon_ammo);
				    	}
				    }
				}
		    	//SendClientMessageEx(playerid, -1, "id: %d, ammo: %d, wammo: %d, slot: %d, pid: %d", weapon_id, weapon_ammo, PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_AMMO], weapon_slot, onFootData[PR_weaponId]);
		    }

		    if (onFootData[PR_specialAction] == SPECIAL_ACTION_USEJETPACK)
			{
				Anticheat_Ban(playerid, "Jetpack");
				return 0;
			}
		}

	    /*Slapper*/
	    if (onFootData[PR_animationId] == 1666 && onFootData[PR_animationFlags] == 4356)
	    {
	    	return 0;
	    }

	    /*NOP Freeze*/
	    /*if (PLAYER_TEMP[playerid][py_CONTROL])
	    {
	    	if (IsPlayerMoving(playerid))
            {
            	nop aim
				return 0;
            }
	    }*/

        /*Box*/
        if (PLAYER_TEMP[playerid][py_BOXING])
        {
	        if (IsPlayerInRangeOfPoint(playerid, 1.0, -17.344648, 99.261329, 1100.822021))
			{
				PLAYER_TEMP[playerid][py_BOXING] = false;
				ShowPlayerNotification(playerid, "Te suspendieron de esta pelea por salir del ring.", 5);

				for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
				{
					if (PLAYER_TEMP[i][py_BOX_PLAYER] == playerid && PLAYER_TEMP[i][py_BOX_BETTING])
					{
						ShowPlayerNotification(i, "Te hemos devuelto el dinero porque el luchador que apostaste se ha ido del ring.", 6);
						GivePlayerCash(i, PLAYER_TEMP[i][py_BOX_BET]);
						PLAYER_TEMP[i][py_BOX_PLAYER] = INVALID_PLAYER_ID;
						PLAYER_TEMP[i][py_BOX_BET] = 0;
						PLAYER_TEMP[i][py_BOX_BETTING] = false;
					}
				}

				new str_text[128];
				format(str_text, sizeof(str_text), "%s se ha ido del ring.", PLAYER_TEMP[playerid][py_NAME]);
				SendBoxMessage(str_text, 3);
			}
		}
    }

    return 1;
}

public OnPlayerSpawn(playerid)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerSpawn",playerid); // debug juju
	#endif

	TextDrawShowForPlayer(playerid, Textdraws[textdraw_LOGO]);
	SetPlayerScore(playerid, ACCOUNT_INFO[playerid][ac_LEVEL]);
	StopAudioStreamForPlayer(playerid);
	
	switch(PLAYER_MISC[playerid][MISC_GAMEMODE])
	{
		case 0:
		{
			if (PLAYER_TEMP[playerid][py_GAME_STATE] == GAME_STATE_OCCUPIED) // Primer spawn
			{
				PLAYER_TEMP[playerid][py_TIME_PLAYING] = gettime();
				PLAYER_TEMP[playerid][py_USER_LOGGED] = true;

				if (PLAYER_CREW[playerid][player_crew_VALID]) SetPlayerGangZones(playerid);
				SetPlayerSkillLevels(playerid);
				ApplyAnimation(playerid, "SWAT", "null", 0.0, 0, 0, 0, 0, 0);
				ApplyAnimation(playerid, "MEDIC", "null", 0.0, 0, 0, 0, 0, 0);

				switch(CHARACTER_INFO[playerid][ch_STATE])
				{
					case ROLEPLAY_STATE_NORMAL:
					{
						SetPlayerHud(playerid);
						SetCameraBehindPlayer(playerid);
						TogglePlayerControllableEx(playerid, false);
						if (!PLAYER_TEMP[playerid][py_NEW_USER])
						{
							KillTimer(PLAYER_TEMP[playerid][py_TIMERS][3]);
							PLAYER_TEMP[playerid][py_TIMERS][3] = SetTimerEx("TogglePlayerControl", 2000, false, "ib", playerid, true);
						}
						else SetPlayerVirtualWorld(playerid, playerid);
					}
					case ROLEPLAY_STATE_JAIL:
					{
						CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_JAIL;
						if (CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] < 5) CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] = 5;
						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][15]);
						PLAYER_TEMP[playerid][py_TIMERS][15] = SetTimerEx("UnjailPlayer", CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] * 1000, false, "i", playerid);

						PLAYER_TEMP[playerid][py_ENTER_JAIL_TIME] = gettime();
						SetPlayerPosEx(playerid, JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID] ][jail_X], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_Y], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_Z], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_ANGLE], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_INTERIOR], 0, true);
						Streamer_UpdateEx(playerid, JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID] ][jail_X], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_Y], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_Z], 0, JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_INTERIOR], .freezeplayer = 1);
						new time = CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] - (gettime() - PLAYER_TEMP[playerid][py_ENTER_JAIL_TIME]);

						new str_text[128];
						format(str_text, sizeof(str_text), "~r~Encarcelado~w~~n~%s minutos.", TimeConvert(time));
						ShowPlayerMessage(playerid, str_text, 1);

						new DBResult:NameR, query[65];
						format(query, sizeof(query), "SELECT `NAME` FROM `CUENTA` WHERE `ID` = %d LIMIT 1;", CHARACTER_INFO[playerid][ch_JAILED_BY]);
						NameR = db_query(Database, query);
						if (db_num_rows(NameR))
						{
							new name[25];
							db_get_field_assoc(NameR, "NAME", name);
							format(str_text, sizeof(str_text), "Fuiste encarcelado por %s. Razón: %s.", name, CHARACTER_INFO[playerid][ch_JAIL_REASON]);
							SendClientMessage(playerid, 0xF0F0F0CC, str_text);
						}
						db_free_result(NameR);

						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][38]);
						PLAYER_TEMP[playerid][py_TIMERS][38] = SetTimerEx("SavePrisionTime", 60000, true, "i", playerid);

						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][39]);
						PLAYER_TEMP[playerid][py_TIMERS][39] = SetTimerEx("UpdatePrisionTime", 1000, true, "i", playerid);

		    			ResetPlayerWeapons(playerid);
		    			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		    			DeleteIlegalInv(playerid);
		    			SetPlayerColorEx(playerid, PLAYER_COLOR);

						SetPlayerHud(playerid);
						SetCameraBehindPlayer(playerid);
						TogglePlayerControllableEx(playerid, false);
						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][3]);
						PLAYER_TEMP[playerid][py_TIMERS][3] = SetTimerEx("TogglePlayerControl", 2000, false, "ib", playerid, true);
					}
					case ROLEPLAY_STATE_ARRESTED:
					{
						CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] = 300;

						CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_JAIL;
						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][15]);
						PLAYER_TEMP[playerid][py_TIMERS][15] = SetTimerEx("UnjailPlayer", CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] * 1000, false, "i", playerid);

						PLAYER_TEMP[playerid][py_ENTER_JAIL_TIME] = gettime();
						SetPlayerPosEx(playerid, JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID] ][jail_X], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_Y], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_Z], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_ANGLE], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_INTERIOR], 0, true);

						new time = CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] - (gettime() - PLAYER_TEMP[playerid][py_ENTER_JAIL_TIME]);

						new str_text[128];
						format(str_text, sizeof(str_text), "~r~Encarcelado~w~~n~%s minutos.", TimeConvert(time));
						ShowPlayerMessage(playerid, str_text, 1);

						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][38]);
						PLAYER_TEMP[playerid][py_TIMERS][38] = SetTimerEx("SavePrisionTime", 60000, true, "i", playerid);

						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][39]);
						PLAYER_TEMP[playerid][py_TIMERS][39] = SetTimerEx("UpdatePrisionTime", 900, true, "i", playerid);

						SetPlayerHud(playerid);
						SetCameraBehindPlayer(playerid);
						TogglePlayerControllableEx(playerid, false);
						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][3]);
						PLAYER_TEMP[playerid][py_TIMERS][3] = SetTimerEx("TogglePlayerControl", 2000, false, "ib", playerid, true);
					}
					case ROLEPLAY_STATE_OWN_PROPERTY:
					{
						new index = GetPropertyIndexByID(CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA]);
						if (index == -1)
						{
							CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
							CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
							new index_pos = minrand(0, sizeof(NewUserPos));
							CHARACTER_INFO[playerid][ch_POS][0] = NewUserPos[index_pos][0];
							CHARACTER_INFO[playerid][ch_POS][1] = NewUserPos[index_pos][1];
							CHARACTER_INFO[playerid][ch_POS][2] = NewUserPos[index_pos][2];
							CHARACTER_INFO[playerid][ch_ANGLE] = NewUserPos[index_pos][3];
							CHARACTER_INFO[playerid][ch_INTERIOR] = 0;

							SetPlayerPosEx(playerid, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], CHARACTER_INFO[playerid][ch_INTERIOR], 0);
						}
						else
						{
							if (PROPERTY_INFO[index][property_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID])
							{
								SetPlayerInterior(playerid, PROPERTY_INTERIORS[ PROPERTY_INFO[index][property_ID_INTERIOR] ][property_INT_INTERIOR]);
								SetPlayerVirtualWorld(playerid, PROPERTY_INFO[index][property_ID]);
							}
							else
							{
								CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
								CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
								CHARACTER_INFO[playerid][ch_POS][0] = PROPERTY_INFO[index][property_EXT_X];
								CHARACTER_INFO[playerid][ch_POS][1] = PROPERTY_INFO[index][property_EXT_Y];
								CHARACTER_INFO[playerid][ch_POS][2] = PROPERTY_INFO[index][property_EXT_Z];
								CHARACTER_INFO[playerid][ch_ANGLE] = PROPERTY_INFO[index][property_EXT_ANGLE];
								CHARACTER_INFO[playerid][ch_INTERIOR] = PROPERTY_INFO[index][property_EXT_INTERIOR];

								SetPlayerPosEx(playerid, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], CHARACTER_INFO[playerid][ch_INTERIOR], 0);
							}
						}

						SetPlayerHud(playerid);
						SetCameraBehindPlayer(playerid);
						TogglePlayerControllableEx(playerid, false);
						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][3]);
						PLAYER_TEMP[playerid][py_TIMERS][3] = SetTimerEx("TogglePlayerControl", 2000, false, "ib", playerid, true);
					}
					case ROLEPLAY_STATE_HOSPITAL:
					{
						Logger_Debug("OK 2");

						PLAYER_TEMP[playerid][py_HOSPITAL] = GetNearestHospitalForPlayer(playerid);
						PLAYER_TEMP[playerid][py_PLAYER_FINISH_HOSPITAL] = false;
						PLAYER_TEMP[playerid][py_GAME_STATE] = GAME_STATE_DEAD;

						TogglePlayerControllableEx(playerid, true);
						SetPlayerInterior(playerid, 3);
						SetPlayerVirtualWorld(playerid, 2);
						CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
						PLAYER_TEMP[playerid][py_INTERIOR_INDEX] = -1;
						PLAYER_TEMP[playerid][py_PROPERTY_INDEX] = -1;
						PLAYER_TEMP[playerid][py_CLUB_INDEX] = -1;

						PLAYER_TEMP[playerid][py_HOSPITAL_LIFE] = 35;
						UpdateHospitalSizeTextdrawLife(playerid);
						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][4]);
						PLAYER_TEMP[playerid][py_TIMERS][4] = SetTimerEx("HealthUp", 3000, false, "i", playerid);

						if (ACCOUNT_INFO[playerid][ac_SU] >= 2) DeleteIlegalInv(playerid);
						else DeleteIlegalInv(playerid, true);

						new random_pos = minrand(0, 12); 
						PLAYER_TEMP[playerid][py_HP_POS_DATA][0] = Hp_Spawn_Interior_Pos[random_pos][0];
						PLAYER_TEMP[playerid][py_HP_POS_DATA][1] = Hp_Spawn_Interior_Pos[random_pos][1];
						PLAYER_TEMP[playerid][py_HP_POS_DATA][2] = Hp_Spawn_Interior_Pos[random_pos][2];
						PLAYER_TEMP[playerid][py_HP_POS_DATA][3] = Hp_Spawn_Interior_Pos[random_pos][3];

						SetPlayerPosEx(playerid, Hp_Spawn_Interior_Pos[random_pos][0], Hp_Spawn_Interior_Pos[random_pos][1], Hp_Spawn_Interior_Pos[random_pos][2], Hp_Spawn_Interior_Pos[random_pos][3], 3, 2);
						TogglePlayerControllableEx(playerid, false);
						ApplyAnimation(playerid, "INT_HOUSE", "BED_In_R", 4.1, 0, 0, 0, 1, 0);
						ShowPlayerNotification(playerid, "Fuiste ingresado en el centro médico más cercano.", 3);
					}
					case ROLEPLAY_STATE_CRACK:
					{
						Logger_Debug("OK 1");

						SetPlayerHud(playerid);
						SetCameraBehindPlayer(playerid);
						TogglePlayerControllableEx(playerid, false);
						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][3]);
						PLAYER_TEMP[playerid][py_TIMERS][3] = SetTimerEx("TogglePlayerControl", 2000, false, "ib", playerid, true);

						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][16]);
						PLAYER_TEMP[playerid][py_TIMERS][16] = SetTimerEx("HealthDown", 3000, false, "i", playerid);

						PLAYER_TEMP[playerid][py_INJURED_POS][0] = CHARACTER_INFO[playerid][ch_POS][0];
						PLAYER_TEMP[playerid][py_INJURED_POS][1] = CHARACTER_INFO[playerid][ch_POS][1];
						PLAYER_TEMP[playerid][py_INJURED_POS][2] = CHARACTER_INFO[playerid][ch_POS][2];
						PLAYER_TEMP[playerid][py_INJURED_POS][3] = CHARACTER_INFO[playerid][ch_ANGLE];

						TogglePlayerControllableEx(playerid, false);
						SetPlayerColorEx(playerid, PLAYER_COLOR);
					}
					case ROLEPLAY_STATE_BOX:
					{
						Logger_Debug("OK 3");

						if (PLAYER_MISC[playerid][MISC_GAMEMODE] == 2)
						{
							/*SetSpawnInfo(playerid, DEFAULT_TEAM,
								PLAYER_MISC[playerid][MISC_SKIN],
								LGBT_MAPS[lgbt_map_index][lm_X],
								LGBT_MAPS[lgbt_map_index][lm_Y],
								LGBT_MAPS[lgbt_map_index][lm_Z],
								LGBT_MAPS[lgbt_map_index][lm_ANGLE],
								0, 0, 0, 0, 0, 0
							);

							CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
							PLAYER_TEMP[playerid][py_PLAYER_FINISH_HOSPITAL] = true;
							CHARACTER_INFO[playerid][ch_INTERIOR] = LGBT_MAPS[lgbt_map_index][lm_INTERIOR];
							
							SetPlayerPosEx(playerid,
								LGBT_MAPS[lgbt_map_index][lm_X],
								LGBT_MAPS[lgbt_map_index][lm_Y],
								LGBT_MAPS[lgbt_map_index][lm_Z],
								LGBT_MAPS[lgbt_map_index][lm_ANGLE],
								LGBT_MAPS[lgbt_map_index][lm_INTERIOR],
								LGBT_MAPS[lgbt_map_index][lm_WORLD],
								false, true
							);

							SetPlayerFacingAngle(playerid, LGBT_MAPS[lgbt_map_index][lm_ANGLE]);
							SetCameraBehindPlayer(playerid);*/
						}
						else
						{
							SetSpawnInfo(playerid, DEFAULT_TEAM, PLAYER_TEMP[playerid][py_SKIN], -25.157732, 87.987953, 1098.070190, 0.481732, 0, 0, 0, 0, 0, 0);
							SetCameraBehindPlayer(playerid);
							SetPlayerPosEx(playerid, -25.157732, 87.987953, 1098.070190, 0.481732, 16, 0, false);
							CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
							PLAYER_TEMP[playerid][py_PLAYER_FINISH_HOSPITAL] = true;
						}
						return 1;
					}
					case ROLEPLAY_STATE_OWN_CLUB:
					{
						new index = GetClubIndexByID(CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA]);
						if (index == -1)
						{
							CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
							CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
							new index_pos = minrand(0, sizeof(NewUserPos));
							CHARACTER_INFO[playerid][ch_POS][0] = NewUserPos[index_pos][0];
							CHARACTER_INFO[playerid][ch_POS][1] = NewUserPos[index_pos][1];
							CHARACTER_INFO[playerid][ch_POS][2] = NewUserPos[index_pos][2];
							CHARACTER_INFO[playerid][ch_ANGLE] = NewUserPos[index_pos][3];
							CHARACTER_INFO[playerid][ch_INTERIOR] = 0;
							CHARACTER_INFO[playerid][ch_WORLD] = 0;
							SetPlayerPosEx(playerid, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], CHARACTER_INFO[playerid][ch_INTERIOR], 0);
						}
						else
						{
							CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
							CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
							CHARACTER_INFO[playerid][ch_POS][0] = CLUBS_INFO[index][club_X];
							CHARACTER_INFO[playerid][ch_POS][1] = CLUBS_INFO[index][club_Y];
							CHARACTER_INFO[playerid][ch_POS][2] = CLUBS_INFO[index][club_Z];
							CHARACTER_INFO[playerid][ch_ANGLE] = CLUBS_INFO[index][club_ANGLE];
							CHARACTER_INFO[playerid][ch_INTERIOR] = 0;
							SetPlayerPosEx(playerid, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], CHARACTER_INFO[playerid][ch_INTERIOR], 0);
						}
					}
				}

				new neccessary_rep = ACCOUNT_INFO[playerid][ac_LEVEL] * REP_MULTIPLIER;
				if (ACCOUNT_INFO[playerid][ac_REP] < neccessary_rep)
				{
					if (ACCOUNT_INFO[playerid][ac_TIME_FOR_REP] > TIME_FOR_REP) ACCOUNT_INFO[playerid][ac_TIME_FOR_REP] = TIME_FOR_REP;
					if (ACCOUNT_INFO[playerid][ac_TIME_FOR_REP] <= 900) ACCOUNT_INFO[playerid][ac_TIME_FOR_REP] = 3000;

					PLAYER_TEMP[playerid][py_TIME_PASSED_LAST_REP] = gettime() * 1000;
					PLAYER_TEMP[playerid][py_TIMERS][2] = SetTimerEx("AddPlayerReputation", ACCOUNT_INFO[playerid][ac_TIME_FOR_REP], false, "i", playerid);
				}
				else NextLevel(playerid);

				if (PLAYER_PHONE[playerid][player_phone_VALID])
				{
					new DBResult:Result, DB_Query[220];
					format(DB_Query, sizeof(DB_Query),
						"\
							SELECT COUNT() FROM `PHONE_MESSAGES` WHERE `TO` = '%d' AND `OFFLINE` = '1' ORDER BY `DATE` DESC LIMIT 10;\
							UPDATE `PHONE_MESSAGES` SET `OFFLINE` = '0' WHERE `TO` = '%d';\
						",
					PLAYER_PHONE[playerid][player_phone_NUMBER],
					PLAYER_PHONE[playerid][player_phone_NUMBER]);

					Result = db_query(Database, DB_Query);
					if (db_num_rows(Result))
					{
						new new_messages = db_get_field_int(Result, 0);
						if (new_messages > 0)
						{
							new str_text[128];
							format(str_text, sizeof(str_text), "Tienes %d SMS sin leer", new_messages);
							ShowPlayerNotification(playerid, str_text, 4);
						}
					}
					db_free_result(Result);
				}
			}
			else if (PLAYER_TEMP[playerid][py_GAME_STATE] == GAME_STATE_DEAD) // Viene de morir
			{
				if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_HOSPITAL)
				{
					if (!PLAYER_TEMP[playerid][py_PLAYER_FINISH_HOSPITAL])
					{
						SetPlayerInterior(playerid, 3);
						SetPlayerVirtualWorld(playerid, 2);
						PLAYER_TEMP[playerid][py_PLAYER_FINISH_HOSPITAL] = false;
						CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_HOSPITAL;
						CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
						PLAYER_TEMP[playerid][py_INTERIOR_INDEX] = -1;
						PLAYER_TEMP[playerid][py_PROPERTY_INDEX] = -1;
						PLAYER_TEMP[playerid][py_CLUB_INDEX] = -1;

						PLAYER_TEMP[playerid][py_HOSPITAL_LIFE] = 35;
						UpdateHospitalSizeTextdrawLife(playerid);
						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][4]);
						PLAYER_TEMP[playerid][py_TIMERS][4] = SetTimerEx("HealthUp", 3000, false, "i", playerid);

						if (ACCOUNT_INFO[playerid][ac_SU] >= 2) DeleteIlegalInv(playerid);
						else DeleteIlegalInv(playerid, true);

						ClearPlayerChatBox(playerid);
						if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED)
						{
							ShowPlayerNotification(playerid, "Estas en el centro médico más cercano, cuando te recuperes te llevaran a la cárcel.", 3);
							SetPlayerPoliceSearchLevel(playerid, 0);
						}
						else
						{
						    ShowPlayerNotification(playerid, "Fuiste ingresado en el centro médico más cercano.", 3);
						}

						ResetItemBody(playerid);

						new random_pos = minrand(0, 12);
						PLAYER_TEMP[playerid][py_HP_POS_DATA][0] = Hp_Spawn_Interior_Pos[random_pos][0];
						PLAYER_TEMP[playerid][py_HP_POS_DATA][1] = Hp_Spawn_Interior_Pos[random_pos][1];
						PLAYER_TEMP[playerid][py_HP_POS_DATA][2] = Hp_Spawn_Interior_Pos[random_pos][2];
						PLAYER_TEMP[playerid][py_HP_POS_DATA][3] = Hp_Spawn_Interior_Pos[random_pos][3];

						SetPlayerPosEx(playerid, Hp_Spawn_Interior_Pos[random_pos][0], Hp_Spawn_Interior_Pos[random_pos][1], Hp_Spawn_Interior_Pos[random_pos][2], Hp_Spawn_Interior_Pos[random_pos][3], 3, 2);
						TogglePlayerControllableEx(playerid, false);
						ApplyAnimation(playerid,"INT_HOUSE","BED_In_R", 4.1, 0, 0, 0, 1, 0);
					}
				}
				else if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK)
				{
					SetPlayerHud(playerid);
					SetPlayerHealthEx(playerid, 60.0);
					TogglePlayerControllableEx(playerid, false);
					KillTimer(PLAYER_TEMP[playerid][py_TIMERS][3]);
					PLAYER_TEMP[playerid][py_TIMERS][3] = SetTimerEx("TogglePlayerControl", 2000, false, "ib", playerid, true);

					KillTimer(PLAYER_TEMP[playerid][py_TIMERS][16]);
					PLAYER_TEMP[playerid][py_TIMERS][16] = SetTimerEx("HealthDown", 3000, false, "i", playerid);

					SetPlayerColorEx(playerid, PLAYER_COLOR);
				}

				SetPlayerSkin(playerid, PLAYER_TEMP[playerid][py_SKIN]);
			}

			if (PLAYER_TEMP[playerid][py_PLAYER_FINISH_HOSPITAL])
			{
				if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL)
				{
					KillTimer(PLAYER_TEMP[playerid][py_TIMERS][15]);
					PLAYER_TEMP[playerid][py_TIMERS][15] = SetTimerEx("UnjailPlayer", CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] * 1000, false, "i", playerid);
				}

				SetPlayerInterior(playerid, CHARACTER_INFO[playerid][ch_INTERIOR]);
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerHud(playerid);
				TogglePlayerControllableEx(playerid, false);
				PLAYER_TEMP[playerid][py_PLAYER_FINISH_HOSPITAL] = false;
				KillTimer(PLAYER_TEMP[playerid][py_TIMERS][3]);
				SetCameraBehindPlayer(playerid);
				PLAYER_TEMP[playerid][py_TIMERS][3] = SetTimerEx("TogglePlayerControl", 2000, false, "ib", playerid, true);
			}

			if (PLAYER_TEMP[playerid][py_NOCHE_DE_SEXO]) SetPlayerTime(playerid, 0, 0);
			else SetPlayerTime(playerid, SERVER_TIME[0], SERVER_TIME[1]);
			
			SetPlayerWeather(playerid, SERVER_WEATHER);

			PLAYER_TEMP[playerid][py_GAME_STATE] = GAME_STATE_NORMAL;
			SetPlayerSkin(playerid, PLAYER_TEMP[playerid][py_SKIN]);
			SetPlayerToys(playerid);
			SetPlayerArmedWeapon(playerid, 0);
			SetPlayerNormalColor(playerid);
			SetTracingColor(playerid, COLOR_RED);
			PreloadAnims(playerid);

			if (PLAYER_CREW[playerid][player_crew_VALID])
			{
				for(new i = 0; i < sizeof GRAFFITIS_OBJ; i ++)
				{
					if (GRAFFITIS_OBJ[i][g_ACTIVATED])
						SetPlayerMapIcon(playerid, 0, GRAFFITIS_OBJ[i][g_X], GRAFFITIS_OBJ[i][g_Y], GRAFFITIS_OBJ[i][g_Z], 63, 0, MAPICON_GLOBAL);
				}
			}

			if (CHARACTER_INFO[playerid][ch_HEALTH] <= 0.0) CHARACTER_INFO[playerid][ch_HEALTH] = 1.0;
			if (CHARACTER_INFO[playerid][ch_HEALTH] >= 100.0) CHARACTER_INFO[playerid][ch_HEALTH] = 100.0;
			if (CHARACTER_INFO[playerid][ch_ARMOUR] >= 100.0) CHARACTER_INFO[playerid][ch_ARMOUR] = 100.0;

			SetPlayerHealthEx(playerid, CHARACTER_INFO[playerid][ch_HEALTH]);
			SetPlayerArmourEx(playerid, CHARACTER_INFO[playerid][ch_ARMOUR]);

			lastShotTick[playerid] = GetTickCount();
			
			if (PLAYER_MISC[playerid][MISC_CONFIG_FP])
			{
				SetFirstPerson(playerid, true);
			}

			if (PLAYER_TEMP[playerid][py_WORKING_IN] == WORK_POLICE) SetPlayerColorEx(playerid, 0x6060FF00);

			PLAYER_TEMP[playerid][py_CONTROL] = false;

			PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY] = gettime() + 3;
			PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_IMMUNITY] = gettime() + 3;
			PLAYER_AC_INFO[playerid][CHEAT_PLAYER_HEALTH][p_ac_info_IMMUNITY] = gettime() + 3;
			PLAYER_AC_INFO[playerid][CHEAT_PLAYER_ARMOUR][p_ac_info_IMMUNITY] = gettime() + 3;
			PLAYER_AC_INFO[playerid][CHEAT_UNOCCUPIED_VEHICLE_TP][p_ac_info_IMMUNITY] = gettime() + 5;

			SetPlayerInterior(playerid, CHARACTER_INFO[playerid][ch_INTERIOR]);
		}
		case 2:
		{
			/*ResetPlayerWeapons(playerid);
			ResetPlayerMoney(playerid);

			SetPlayerHealthEx(playerid, 100.0);

			SetPlayerVirtualWorld(playerid, LGBT_MAPS[lgbt_map_index][lm_WORLD]);

			SetSpawnInfo(playerid, DEFAULT_TEAM,
				PLAYER_MISC[playerid][MISC_SKIN],
				LGBT_MAPS[lgbt_map_index][lm_X],
				LGBT_MAPS[lgbt_map_index][lm_Y],
				LGBT_MAPS[lgbt_map_index][lm_Z],
				LGBT_MAPS[lgbt_map_index][lm_ANGLE],
				0, 0, 0, 0, 0, 0
			);

			SetPlayerInterior(playerid, LGBT_MAPS[lgbt_map_index][lm_INTERIOR]);
			PLAYER_TEMP[playerid][py_GAME_STATE] = GAME_STATE_NORMAL;*/
		}
	}

	if (PLAYER_TEMP[playerid][py_GODMODE])
	{
		PLAYER_AC_INFO[playerid][CHEAT_PLAYER_HEALTH][p_ac_info_IMMUNITY] = gettime() + 3;
		
		CHARACTER_INFO[playerid][ch_HEALTH] = cellmax;
		Player_SetHealth(playerid, cellmax);
	}
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerDeath %d %d %d", playerid, killerid, reason); // debug juju
	#endif

	if (IsPlayerNPC(playerid)) return 0;
	if (PLAYER_TEMP[playerid][py_KICKED]) return 0;
	if (!PLAYER_TEMP[playerid][py_USER_LOGGED]) return 0;

	PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_PLAYER_HEALTH][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_NOFUEL][p_ac_info_IMMUNITY] = gettime() + 15;
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][16]);

	if (!ACCOUNT_INFO[playerid][ac_SU]) SetPlayerArmourEx(playerid, 0.0);

	if (ac_Info[CHEAT_DEATH_SPAMMER][ac_Enabled])
	{
		if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_DEATH_SPAMMER][p_ac_info_IMMUNITY])
		{
			new interval = GetTickDiff(GetTickCount(), PLAYER_TEMP[playerid][py_ANTIFLOOD_DEATH]);
			if (interval < 50)
			{
				if (!ac_Info[CHEAT_DEATH_SPAMMER][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_DEATH_SPAMMER, float(interval));
				else
				{
					if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_DEATH_SPAMMER][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_DEATH_SPAMMER][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_DEATH_SPAMMER][p_ac_info_DETECTIONS] = 0;
					else PLAYER_AC_INFO[playerid][CHEAT_DEATH_SPAMMER][p_ac_info_DETECTIONS] ++;

					PLAYER_AC_INFO[playerid][CHEAT_DEATH_SPAMMER][p_ac_info_LAST_DETECTION] = gettime();
					if (PLAYER_AC_INFO[playerid][CHEAT_DEATH_SPAMMER][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_DEATH_SPAMMER][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_DEATH_SPAMMER, float(interval));
				}
			}
			PLAYER_TEMP[playerid][py_ANTIFLOOD_DEATH] = GetTickCount();
		}
	}

	HidePlayerMessage(playerid);

	if (PLAYER_TEMP[playerid][py_SELECT_TEXTDRAW])
	{
		if (PLAYER_TEMP[playerid][py_PLAYER_IN_ATM]) HideBankMenu(playerid);
		if (PLAYER_TEMP[playerid][py_PLAYER_IN_INV]) HideInventory(playerid);
		if (PLAYER_TEMP[playerid][py_PLAYER_IN_PHONE]) HidePhone(playerid);
	}

	switch(PLAYER_MISC[playerid][MISC_GAMEMODE])
	{
		case 0:
		{
			if (PLAYER_TEMP[playerid][py_NEW_USER])
			{
				PLAYER_MISC[playerid][MISC_CONFIG_HUD] = true;
				PLAYER_MISC[playerid][MISC_CONFIG_ADMIN] = true;

				SavePlayerMisc(playerid);
				ApplyAnimation(playerid, "PED", "KO_SPIN_R", 4.1, 1, false, false, false, 0, false);
				PLAYER_TEMP[playerid][py_NEW_USER] = false;
				SetPlayerVirtualWorld(playerid, 0);
				SetCameraBehindPlayer(playerid);
				KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
			}

			StopAudioStreamForPlayer(playerid);
			SetPlayerDrunkLevel(playerid, 0);
			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][3]);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			GetPlayerPos(playerid, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2]);
			GetPlayerFacingAngle(playerid, CHARACTER_INFO[playerid][ch_ANGLE]);
			CHARACTER_INFO[playerid][ch_INTERIOR] = GetPlayerInterior(playerid);
			CHARACTER_INFO[playerid][ch_WORLD] = GetPlayerVirtualWorld(playerid);

			SetPlayerPosEx(
				playerid,
				CHARACTER_INFO[playerid][ch_POS][0],
				CHARACTER_INFO[playerid][ch_POS][1],
				CHARACTER_INFO[playerid][ch_POS][2] + 0.1,
				CHARACTER_INFO[playerid][ch_ANGLE],
				CHARACTER_INFO[playerid][ch_INTERIOR],
				CHARACTER_INFO[playerid][ch_WORLD]
			);

			HidePlayerHud(playerid);
			CancelEdit(playerid);
			//SetNormalPlayerMarkers(playerid);
			if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) EndPlayerJob(playerid, false);
			PLAYER_TEMP[playerid][py_HUNGRY_MESSAGE] = false;
			PLAYER_TEMP[playerid][py_THIRST_MESSAGE] = false;
			PLAYER_TEMP[playerid][py_PLAYER_IN_ATM] = false;
			PLAYER_TEMP[playerid][py_PLAYER_IN_INV] = false;
			PLAYER_TEMP[playerid][py_CUFFED] = false;
			PLAYER_TEMP[playerid][py_CUFFING] = false;
			PLAYER_TEMP[playerid][py_PLAYER_WAITING_MP3_HTTP] = false;

			if (PLAYER_TEMP[playerid][py_WANT_MECHANIC])
			{
				PLAYER_TEMP[playerid][py_WANT_MECHANIC] = false;
				DisablePlayerMechanicMark(playerid);
			}

			if (PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) EndPhoneCall(playerid);
			if (PLAYER_TEMP[playerid][py_GPS_MAP]) HidePlayerGpsMap(playerid);
			if (PLAYER_TEMP[playerid][py_TUNING_GARAGE_SHOP]) CancelPlayerTuningShop(playerid);

			if (PLAYER_TEMP[playerid][py_IN_TUNING_GARAGE])
			{
				PLAYER_TEMP[playerid][py_IN_TUNING_GARAGE] = false;
				SetVehicleVirtualWorldEx(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], 0);
				SetVehiclePosEx(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], 1591.011352, -2144.425048, 13.554687);
				SetVehicleZAngle(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], 0.0);
			}

			if (PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] != INVALID_VEHICLE_ID)
			{
				if (TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_JOB_STARTED])
				{
					if (PLAYER_TEMP[playerid][py_TRASH_DRIVER])
					{
						ShowPlayerMessage(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], "~r~El trabajo se ha cancelado porque tu compañero ha dejado de trabajar.", 3);
						CancelTrashWork(playerid, TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);
					}

					if (PLAYER_TEMP[playerid][py_TRASH_PASSENGER])
					{
						ShowPlayerMessage(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], "~r~El trabajo se ha cancelado porque tu compañero ha dejado de trabajar.", 3);
						CancelTrashWork(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], playerid, PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);
					}
				}
			}

			if (IsPlayerConnected(killerid) && CHARACTER_INFO[killerid][ch_STATE] == ROLEPLAY_STATE_NORMAL && CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_NORMAL)
			{
				new 
					str_victim[164],
					str_killer[64],
					gunname[32],
					Float:x, Float:y, Float:z;

				format(str_killer, sizeof str_killer, "Heriste a ~y~%s", PLAYER_TEMP[playerid][py_NAME]);
				ShowPlayerMessage(killerid, str_killer, 3);

				GetWeaponName(reason, gunname, sizeof(gunname));
				GetPlayerPos(killerid, x, y, z);

				format(str_killer, sizeof str_killer, "Heriste a %s con %s desde %.1f metros.", PLAYER_TEMP[playerid][py_NAME], gunname, GetPlayerDistanceFromPoint(playerid, x, y, z));
				SavePlayerNotification(killerid, str_killer);

				format(str_victim, sizeof(str_victim), "%s te hirió con %s desde %.1f metros.", PLAYER_TEMP[killerid][py_NAME], gunname, GetPlayerDistanceFromPoint(playerid, x, y, z));
				ShowPlayerNotification(playerid, str_victim, 4);
				SavePlayerNotification(playerid, str_victim);

				format(str_victim, sizeof(str_victim), "[KILL] %s (%d) hirió a %s (%d) con %s desde %.1f metros.", PLAYER_TEMP[killerid][py_NAME], killerid, PLAYER_TEMP[playerid][py_NAME], playerid, gunname, GetPlayerDistanceFromPoint(playerid, x, y, z));
				SendMessageToAdmins(COLOR_ANTICHEAT, str_victim, 1);

				if (!PLAYER_WORKS[killerid][WORK_POLICE])
					AddMentalState(killerid, 1);

				GetPlayerPos(playerid, x, y, z);
				SetPlayerPosEx(playerid, x, y, z + 1, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));

				if (ACCOUNT_INFO[killerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
				{
					new p_interior = GetPlayerInterior(killerid);

					if (p_interior == 25 || p_interior == 26 || p_interior == 27)
					{
						NeuroJail(killerid, 30, "DM (Minero)");
						return 1;
					}

					if (reason == 49 || reason == 50)
					{
						NeuroJail(killerid, 30, "VK");
						return 1;
					}

					if (GetPlayerDistanceFromPoint(playerid, x, y, z) > 300.0)
					{
						Anticheat_Ban(playerid, "Aimbot #0");
						return 0;
					}
				}
			}

			if (IsPlayerConnected(killerid) && CHARACTER_INFO[killerid][ch_STATE] == ROLEPLAY_STATE_NORMAL && CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK)
			{
				PlayerBloodParticle(playerid);

				new 
					str_victim[164],
					str_killer[64],
					gunname[32],
					Float:x, Float:y, Float:z;

				format(str_killer, sizeof str_killer, "Asesinaste a ~r~%s", PLAYER_TEMP[playerid][py_NAME]);
				ShowPlayerMessage(killerid, str_killer, 3);

				GetWeaponName(reason, gunname, sizeof(gunname));
				GetPlayerPos(killerid, x, y, z);

				format(str_killer, sizeof str_killer, "Asesinaste a %s con %s desde %.1f metros.", PLAYER_TEMP[playerid][py_NAME], gunname, GetPlayerDistanceFromPoint(playerid, x, y, z));
				SavePlayerNotification(killerid, str_killer);

				format(str_victim, sizeof(str_victim), "%s te mató con %s desde %.1f metros.", PLAYER_TEMP[killerid][py_NAME], gunname, GetPlayerDistanceFromPoint(playerid, x, y, z));
				SavePlayerNotification(playerid, str_victim);

				format(str_victim, sizeof(str_victim), "[KILL] %s (%d) mató a %s (%d) con %s desde %.1f metros.", PLAYER_TEMP[killerid][py_NAME], killerid, PLAYER_TEMP[playerid][py_NAME], playerid, gunname, GetPlayerDistanceFromPoint(playerid, x, y, z));
				SendMessageToAdmins(COLOR_ANTICHEAT, str_victim, 1);

				GetPlayerPos(playerid, x, y, z);
				SetPlayerPosEx(playerid, x, y, z + 1, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));

				SetPlayerRangePoliceSearchLevel(killerid, 2, 100.0, "Homicidio");
			}

			if (IsPlayerConnected(killerid))
			{
				if (PLAYER_TEMP[killerid][py_BOXING] && PLAYER_TEMP[playerid][py_BOXING])
				{
					new final_pay = 100;

					for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
					{
						if (PLAYER_TEMP[i][py_BOX_PLAYER] == playerid && PLAYER_TEMP[i][py_BOX_BETTING])
						{
							ShowPlayerNotification(i, "EL jugador que apostaste ha perdido, ya puedes apostar nuevamente.", 5);
							final_pay += PLAYER_TEMP[i][py_BOX_BET];

							PLAYER_TEMP[i][py_BOX_PLAYER] = INVALID_PLAYER_ID;
							PLAYER_TEMP[i][py_BOX_BET] = 0;
							PLAYER_TEMP[i][py_BOX_BETTING] = false;
						}

						if (PLAYER_TEMP[i][py_BOX_PLAYER] == killerid && PLAYER_TEMP[i][py_BOX_BETTING])
						{
							ShowPlayerNotification(i, "EL jugador que apostaste ha ganado, ya puedes apostar nuevamente.", 5);
							final_pay += PLAYER_TEMP[i][py_BOX_BET];
							PLAYER_TEMP[i][py_BOX_PLAYER] = INVALID_PLAYER_ID;
							PLAYER_TEMP[i][py_BOX_BET] = 0;
							PLAYER_TEMP[i][py_BOX_BETTING] = false;

							GivePlayerCash(i, final_pay, false);
							GivePlayerReputation(i);
						}
					}

					GivePlayerCash(killerid, PLAYER_TEMP[killerid][py_BOX_PAY]);
					ShowPlayerNotification(killerid, "Pelea ganada, espera a que alguien vuelva a apostar por ti.", 4);
					GivePlayerReputation(killerid);
					PLAYER_TEMP[killerid][py_BOX_PAY] = 0;
					GivePlayerHealthEx(killerid, 25.0);
					PLAYER_SKILLS[killerid][WORK_BOX] ++;

					ShowPlayerNotification(playerid, "Has perdido, vuelve a la oficina si quieres participar.", 4);

					PLAYER_TEMP[playerid][py_BOXING] = false;
					PLAYER_TEMP[playerid][py_BOX_PAY] = 0;

					PLAYER_TEMP[playerid][py_PLAYER_FINISH_HOSPITAL] = true;
					SetSpawnInfo(playerid, DEFAULT_TEAM, PLAYER_TEMP[playerid][py_SKIN], -25.157732, 87.987953, 1098.070190, 0.481732, 0, 0, 0, 0, 0, 0);
					CHARACTER_INFO[playerid][ch_INTERIOR] = 16;

					CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_BOX;
					SetPlayerPosEx(playerid, -25.157732, 87.987953, 1098.070190, 0.481732, 16, 0, false);
					return 1;
				}
			}

			if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL)
			{
				KillTimer(PLAYER_TEMP[playerid][py_TIMERS][15]);
				PLAYER_TEMP[playerid][py_PLAYER_FINISH_HOSPITAL] = true;
				CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] -= gettime() - PLAYER_TEMP[playerid][py_ENTER_JAIL_TIME];
				if (CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] < 5) CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] = 5;
				PLAYER_TEMP[playerid][py_ENTER_JAIL_TIME] = gettime();
				SetSpawnInfo(playerid, DEFAULT_TEAM, PLAYER_TEMP[playerid][py_SKIN], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID] ][jail_X], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_Y], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_Z], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_ANGLE], 0, 0, 0, 0, 0, 0);
				CHARACTER_INFO[playerid][ch_INTERIOR] = JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_INTERIOR];
			}
			else
			{
				if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || GetPlayerInterior(playerid) != 0 || GetPlayerVirtualWorld(playerid) != 0)
				{
					Logger_Debug("[2] OK 1");
					if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_NORMAL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) PLAYER_TEMP[playerid][py_HOSPITAL] = GetNearestHospitalForPlayer(playerid);
					if (PLAYER_TEMP[playerid][py_HOSPITAL] == -1) PLAYER_TEMP[playerid][py_HOSPITAL] = 1;
					CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_HOSPITAL;
					PLAYER_TEMP[playerid][py_PLAYER_FINISH_HOSPITAL] = false;
					KillTimer(PLAYER_TEMP[playerid][py_TIMERS][16]);
					SetSpawnInfo(playerid, DEFAULT_TEAM, PLAYER_TEMP[playerid][py_SKIN], CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], 0, 0, 0, 0, 0, 0);
				}
				else
				{
					CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_CRACK;

					GetPlayerPos(playerid, PLAYER_TEMP[playerid][py_INJURED_POS][0], PLAYER_TEMP[playerid][py_INJURED_POS][1], PLAYER_TEMP[playerid][py_INJURED_POS][2]);
					GetPlayerFacingAngle(playerid, PLAYER_TEMP[playerid][py_INJURED_POS][3]);

					SetSpawnInfo(playerid, DEFAULT_TEAM, PLAYER_TEMP[playerid][py_SKIN], PLAYER_TEMP[playerid][py_INJURED_POS][0], PLAYER_TEMP[playerid][py_INJURED_POS][1], PLAYER_TEMP[playerid][py_INJURED_POS][2], PLAYER_TEMP[playerid][py_INJURED_POS][3], 0, 0, 0, 0, 0, 0);
					SetPlayerPos(playerid,PLAYER_TEMP[playerid][py_INJURED_POS][0], PLAYER_TEMP[playerid][py_INJURED_POS][1], PLAYER_TEMP[playerid][py_INJURED_POS][2]+1);
				
					TogglePlayerSpectating(playerid, false);

					PlayerBloodParticle(playerid);
				}
			}

			PLAYER_TEMP[playerid][py_IN_MARKET] = false;
			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][41]);
		}
		case 2:
		{
			/*SetSpawnInfo(playerid, DEFAULT_TEAM,
				PLAYER_MISC[playerid][MISC_SKIN],
				LGBT_MAPS[lgbt_map_index][lm_X],
				LGBT_MAPS[lgbt_map_index][lm_Y],
				LGBT_MAPS[lgbt_map_index][lm_Z],
				LGBT_MAPS[lgbt_map_index][lm_ANGLE],
				0, 0, 0, 0, 0, 0
			);

			CHARACTER_INFO[playerid][ch_INTERIOR] = LGBT_MAPS[lgbt_map_index][lm_INTERIOR];
			
			SetPlayerPosEx(playerid,
				LGBT_MAPS[lgbt_map_index][lm_X],
				LGBT_MAPS[lgbt_map_index][lm_Y],
				LGBT_MAPS[lgbt_map_index][lm_Z],
				LGBT_MAPS[lgbt_map_index][lm_ANGLE],
				LGBT_MAPS[lgbt_map_index][lm_INTERIOR],
				LGBT_MAPS[lgbt_map_index][lm_WORLD],
				false, true
			);

			SetPlayerFacingAngle(playerid, LGBT_MAPS[lgbt_map_index][lm_ANGLE]);
			//PLAYER_TEMP[playerid][py_GAME_STATE] = GAME_STATE_NORMAL;

			PLAYER_TEMP[playerid][py_PLAYER_FINISH_HOSPITAL] = true;
			CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_BOX;*/
		}
	}

	PLAYER_TEMP[playerid][py_GAME_STATE] = GAME_STATE_DEAD;
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerRequestClass %d %d",playerid, classid); // debug juju
	#endif

	if (PLAYER_TEMP[playerid][py_GAME_STATE] == GAME_STATE_CONNECTED) // Recién conectado
	{
		if (!PLAYER_TEMP[playerid][py_USER_VALID_NAME] || PLAYER_TEMP[playerid][py_KICKED]) return 0;
		
		TogglePlayerSpectatingEx(playerid, true);

		if (PLAYER_TEMP[playerid][py_USER_EXIT])
		{
			// Usuario registrado
			/*if (ACCOUNT_INFO[playerid][ac_ID] == 0 || strcmp(PLAYER_TEMP[playerid][py_NAME], ACCOUNT_INFO[playerid][ac_NAME], false)) // No coincide
			{
				KickEx(playerid, 100);
				return 1;
			}*/

			if (strcmp(PLAYER_TEMP[playerid][py_IP], ACCOUNT_INFO[playerid][ac_IP], false)) // La IP actual no es la misma IP de la última conexión
			{
				new ip_change[40];
				format(ip_change, sizeof(ip_change), "%s > %s", ACCOUNT_INFO[playerid][ac_IP], PLAYER_TEMP[playerid][py_IP]);

				new DB_Query[160];
				format
				(
					DB_Query, sizeof DB_Query,
					"\
						INSERT INTO `ADDRESS_LOG`\
						(\
							`ID_USER`, `CONTENT`, 'DATE'\
						)\
						VALUES\
						(\
							'%d', '%q', '%d'\
						);\
					",
					ACCOUNT_INFO[playerid][ac_ID],
					ip_change,
					gettime()
				);
				db_free_result(db_query(Database, DB_Query));

				ShowPlayerMessage(playerid, "~r~Tu dirección IP ha cambiado desde tu última conexión.", 5);
				PLAYER_TEMP[playerid][py_STEAL_SUSPICION] = true;
			}
			
			if (strcmp(PLAYER_TEMP[playerid][py_SERIAL], ACCOUNT_INFO[playerid][ac_SERIAL], false))
			{
				format(ACCOUNT_INFO[playerid][ac_SERIAL], 50, "%s", PLAYER_TEMP[playerid][py_SERIAL]);
			}

			ShowDialog(playerid, DIALOG_LOGIN);
            SetIntroCamera(playerid);
            PreloadAnimLibs(playerid);
		}
		else
		{
			/* NAME CHECk */
			PLAYER_TEMP[playerid][py_USER_VALID_NAME] = true;

			if (CheckNameFilterViolation(PLAYER_TEMP[playerid][py_NAME])) PLAYER_TEMP[playerid][py_USER_VALID_NAME] = false;
			if (!IsValidRPName(PLAYER_TEMP[playerid][py_NAME])) PLAYER_TEMP[playerid][py_USER_VALID_NAME] = false;

			if (!PLAYER_TEMP[playerid][py_USER_VALID_NAME])
			{
				ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED""SERVER_NAME"", ""COL_WHITE"Tu nombre no es adecuado usa: "COL_RED"N"COL_WHITE"ombre_"COL_RED"A"COL_WHITE"pellido.\n\
					Recuerda que los nombres como Miguel_Gamer o que contentan insultos\n\
					no están permitidos, procura ponerte un nombre que parezca real.", "Cerrar", "");
				KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
				return 0;
			}
			
			SetIntroCamera(playerid);
			ShowDialog(playerid, DIALOG_REGISTER);
		}
	}
	else if (PLAYER_TEMP[playerid][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[playerid][py_GAME_STATE] == GAME_STATE_DEAD) // Viene de jugar
	{
		SetSpawnInfo(playerid, DEFAULT_TEAM, PLAYER_TEMP[playerid][py_SKIN], CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], 0, 0, 0, 0, 0, 0);
		SpawnPlayer(playerid);
		return 0;
	}

	PLAYER_TEMP[playerid][py_GAME_STATE] = GAME_STATE_OCCUPIED;
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerRequestSpawn %d",playerid); // debug juju
	#endif

	if (PLAYER_TEMP[playerid][py_GAME_STATE] == GAME_STATE_CONNECTED) CallLocalFunction("OnPlayerRequestClass", "dd", playerid, 0);
    return 0;
}

public OnPlayerText(playerid, text[])
{
	#if DEBUG_MODE == 1
		printf("OnPlayerText %d %s",playerid,text); // debug juju
	#endif

	if (PLAYER_TEMP[playerid][py_KICKED]) return 0;
	if (PLAYER_TEMP[playerid][py_STEAL_SUSPICION]) return KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
	
	// general
	if (PLAYER_TEMP[playerid][py_GAME_STATE] != GAME_STATE_NORMAL || PLAYER_TEMP[playerid][py_SELECT_TEXTDRAW] || PLAYER_TEMP[playerid][py_NEW_USER]) { ShowPlayerMessage(playerid, "~r~Ahora no puedes hablar.", 2); return 0; }
	if (text[0] == '#' && ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] != 0 && PLAYER_TEMP[playerid][py_ADMIN_SERVICE])
	{
		new string[144];
	    format(string, sizeof(string), "[C-A]"COL_WHITE" %s (%d): %s", PLAYER_TEMP[playerid][py_NAME], playerid, text[1]);
		SendMessageToAdmins(0x80E266FF, string);
		return 0;
	}

	new interval = GetTickDiff(GetTickCount(), PLAYER_TEMP[playerid][py_ANTIFLOOD_TALK]);
	if (interval < MIN_SECONDS_BETWEEN_TALKS)
	{
		if (ac_Info[CHEAT_TEXT_SPAMMER][ac_Enabled])
		{
			if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_TEXT_SPAMMER][p_ac_info_IMMUNITY])
			{
				if (interval < 50)
				{
					if (!ac_Info[CHEAT_TEXT_SPAMMER][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_TEXT_SPAMMER, float(interval));
					else
					{
						if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_TEXT_SPAMMER][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_TEXT_SPAMMER][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_TEXT_SPAMMER][p_ac_info_DETECTIONS] = 0;
						else PLAYER_AC_INFO[playerid][CHEAT_TEXT_SPAMMER][p_ac_info_DETECTIONS] ++;

						PLAYER_AC_INFO[playerid][CHEAT_TEXT_SPAMMER][p_ac_info_LAST_DETECTION] = gettime();
						if (PLAYER_AC_INFO[playerid][CHEAT_TEXT_SPAMMER][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_TEXT_SPAMMER][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_TEXT_SPAMMER, float(interval));
					}
				}
			}
		}

		if (!PLAYER_WORKS[playerid][WORK_POLICE])
		{
			SendClientMessage(playerid, COLOR_RED, "Aviso:"COL_WHITE" Estás enviando mensajes demasiado rápido.");
			return 0;
		}
	}
	PLAYER_TEMP[playerid][py_ANTIFLOOD_TALK] = GetTickCount();

	if (PLAYER_MISC[playerid][MISC_JAILS] >= 50)
	{
		Anticheat_Ban(playerid, "50 Jails");
	}

	if (GetPlayerScore(playerid) <= 1)
	{
		if (CheckSpamViolation(text))
		{
			Anticheat_Ban(playerid, "Spawm (IC)");
			return 0;
		}
	}
	// end general

	switch(PLAYER_MISC[playerid][MISC_GAMEMODE])
	{
		case 0:
		{
			if (PLAYER_TEMP[playerid][py_POLICE_CALL_NAME])
			{
				format(PLAYER_TEMP[playerid][py_POLICE_CALL_NAME_STR], 24, "%s", text);
				SendClientMessage(playerid, COLOR_YELLOW, "Operadora:"COL_WHITE" De acuerdo, describe brevemente lo que sucede para enviar una patrulla.");
				PLAYER_TEMP[playerid][py_POLICE_CALL_NAME] = false;
				PLAYER_TEMP[playerid][py_POLICE_CALL_DESCRIPTION] = true;
				return 0;
			}

			if (PLAYER_TEMP[playerid][py_POLICE_CALL_DESCRIPTION])
			{
				PLAYER_TEMP[playerid][py_PLAYER_IN_CALL] = false;
				PLAYER_TEMP[playerid][py_POLICE_CALL_NAME] = false;
				PLAYER_TEMP[playerid][py_POLICE_CALL_DESCRIPTION] = false;


				new city[45], zone[45];
				GetPlayerZones(playerid, city, zone);

				new message[144];
				format(message, sizeof message, "{4286f4}[Central policía] "COL_WHITE"Reporte "COL_WHITE"[%s (%d), gps: %s, %s]: "COL_WHITE"%s", PLAYER_TEMP[playerid][py_POLICE_CALL_NAME_STR], playerid, city, zone, text);
				SendPoliceRadioMessage(-1, COLOR_WHITE, message);

				SendClientMessage(playerid, COLOR_YELLOW, "Operadora:"COL_WHITE" Su petición fue enviada, en breve una patrulla acudirá.");
				ShowPlayerMessage(playerid, "Llamada finalizada.", 2);
				return 0;
			}

			new str_text[190];
			new CrewColorChat = getPlayerCrewColor(playerid);
			if (text[0] == '!')
			{
				if (PLAYER_WORKS[playerid][WORK_POLICE] && PLAYER_TEMP[playerid][py_WORKING_IN] == WORK_POLICE)
				{
					if (text[1] == '!') format(str_text, sizeof str_text, "[Depto. De Policía] "COL_WHITE"(( %s: %s ))", PLAYER_TEMP[playerid][py_RP_NAME], text[2]);
					else format(str_text, sizeof str_text, "[Depto. De Policía] "COL_WHITE"%s %s: %s", PLAYER_TEMP[playerid][py_RP_NAME], POLICE_RANKS[ PLAYER_SKILLS[playerid][WORK_POLICE] ], text[1]);

					SendPoliceRadioMessage(PLAYER_TEMP[playerid][py_POLICE_RADIO], COLOR_LIGHT_BLUE, str_text);
					return 0;
				}

				if (PLAYER_WORKS[playerid][WORK_MAFIA])
				{
					if (text[1] == '!') format(str_text, sizeof str_text, "[FSB] "COL_WHITE"(( %s: %s ))", PLAYER_TEMP[playerid][py_RP_NAME], text[2]);
					else format(str_text, sizeof str_text, "[FSB] "COL_WHITE"%s %s: %s", PLAYER_TEMP[playerid][py_RP_NAME], MAFIA_RANKS[ PLAYER_SKILLS[playerid][WORK_MAFIA] ], text[1]);

					SendMafiaMessage(0xa912e2FF, str_text);
					return 0;
				}

				if (PLAYER_WORKS[playerid][WORK_ENEMY_MAFIA])
				{
					if (text[1] == '!') format(str_text, sizeof str_text, "[TSA] "COL_WHITE"(( %s: %s ))", PLAYER_TEMP[playerid][py_RP_NAME], text[2]);
					else format(str_text, sizeof str_text, "[TSA] "COL_WHITE"%s %s: %s", PLAYER_TEMP[playerid][py_RP_NAME], ENEMY_MAFIA_RANKS[ PLAYER_SKILLS[playerid][WORK_ENEMY_MAFIA] ], text[1]);

					SendEnemyMafiaMessage(0xf5e30aFF, str_text);
					return 0;
				}

				if (PLAYER_WORKS[playerid][WORK_OSBORN])
				{
					if (text[1] == '!') format(str_text, sizeof str_text, "[Familia Osborn] "COL_WHITE"(( %s: %s ))", PLAYER_TEMP[playerid][py_RP_NAME], text[2]);
					else format(str_text, sizeof str_text, "[Familia Osborn] "COL_WHITE"%s %s: %s", PLAYER_TEMP[playerid][py_RP_NAME], OSBORN_RANKS[ PLAYER_SKILLS[playerid][WORK_OSBORN] ], text[1]);

					SendOsbornMafiaMessage(0x3a3eabFF, str_text);
					return 0;
				}

				if (PLAYER_WORKS[playerid][WORK_CONNOR])
				{
					if (text[1] == '!') format(str_text, sizeof str_text, "[TFC] "COL_WHITE"(( %s: %s ))", PLAYER_TEMP[playerid][py_RP_NAME], text[2]);
					else format(str_text, sizeof str_text, "[TFC] "COL_WHITE"%s %s: %s", PLAYER_TEMP[playerid][py_RP_NAME], CONNOR_RANKS[ PLAYER_SKILLS[playerid][WORK_CONNOR] ], text[1]);

					SendConnorMafiaMessage(0xc33d3dFF, str_text);
					return 0;
				}

				if (PLAYER_WORKS[playerid][WORK_DIVISO])
				{
					if (text[1] == '!') format(str_text, sizeof str_text, "[GNR] "COL_WHITE"(( %s: %s ))", PLAYER_TEMP[playerid][py_RP_NAME], text[2]);
					else format(str_text, sizeof str_text, "[GNR] "COL_WHITE"%s %s: %s", PLAYER_TEMP[playerid][py_RP_NAME], DIVISO_RANKS[ PLAYER_SKILLS[playerid][WORK_DIVISO] ], text[1]);

					SendDivisoMafiaMessage(0xE55B5BFF, str_text);
					return 0;
				}

				if (PLAYER_WORKS[playerid][WORK_SINDACCO])
				{
					if (text[1] == '!') format(str_text, sizeof str_text, "[TFS] "COL_WHITE"(( %s: %s ))", PLAYER_TEMP[playerid][py_RP_NAME], text[2]);
					else format(str_text, sizeof str_text, "[TFS] "COL_WHITE"%s %s: %s", PLAYER_TEMP[playerid][py_RP_NAME], SINDACCO_RANKS[ PLAYER_SKILLS[playerid][WORK_DIVISO] ], text[1]);

					SendSindaccoMafiaMessage(0xFFFFFFFF, str_text);
					return 0;
				}

				if (PLAYER_CREW[playerid][player_crew_VALID])
				{
					if (text[1] == '!') format(str_text, sizeof str_text, "[%s] "COL_WHITE"%s - %s: (( %s ))", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_NAME], PLAYER_TEMP[playerid][py_RP_NAME], text[2]);
					else format(str_text, sizeof str_text, "[%s] "COL_WHITE"%s - %s: %s", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_NAME], PLAYER_TEMP[playerid][py_RP_NAME], text[1]);

					SendMessageToCrewMembers(PLAYER_CREW[playerid][player_crew_ID], CrewColorChat, str_text);
					return 0;
				}
			}

			if (PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE] == CALL_STATE_ESTABLISHED)
			{
				format(str_text, 144, "%s "COL_RED"(teléfono){E6E6E6}: %s", PLAYER_TEMP[playerid][py_RP_NAME], text);
				SendClientMessageEx(PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID], COLOR_WHITE, ""COL_RED"Teléfono (%s):"COL_WHITE" %s", convertPhoneNumber(PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID], PLAYER_PHONE[playerid][player_phone_NUMBER]), text);
			}
			else
			{
				if (GetPlayerDrunkLevel(playerid) > 2000) format(str_text, 144, "%s (mareado): %s", PLAYER_TEMP[playerid][py_RP_NAME], text);
				else format(str_text, 144, "%s: %s", PLAYER_TEMP[playerid][py_RP_NAME], text);
			}

			//Do code
			strreplace(str_text, "[", "{dbc766}[");
			strreplace(str_text, "]", "]{E6E6E6}");

			//Negrita code
			strreplace(str_text, "<", "{A8A8A8}");
			strreplace(str_text, ">", "{E6E6E6}");

			// Send message
			ProxDetector(playerid, 15.0, str_text, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5, 85);
			SetPlayerChatBubble(playerid, text, 0xea3d3dFF, 15.0, 15000);

			if (PLAYER_TEMP[playerid][py_COMBAT_MODE])
			{
				if (CheckKillEvadeAttemp(text))
				{
					ResetPlayerWeaponsEx(playerid);
					SavePlayerWeaponsData(playerid);

					if (CHARACTER_INFO[playerid][ch_CASH] >= 5000) GivePlayerCash(playerid, -5000, false);
				
					ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", ""COL_WHITE"Tus armas fueron reseteados y te sacamos 5.000$ por\nintentar evadir muerte.", "Cerrar", "");
				}
			}
		}
		/*case 2:
		{
			new str_text[288];
			if (is_lgbt[playerid]) format(str_text, sizeof(str_text), "{e562e7}[LGBT]"COL_WHITE" %s (%d): %s", PLAYER_TEMP[playerid][py_NAME], playerid, text);
			else format(str_text, sizeof(str_text), "{6286e7}[NORMAL]"COL_WHITE" %s (%d): %s", PLAYER_TEMP[playerid][py_NAME], playerid, text);

			SendLGBTMessage(COLOR_WHITE, str_text);
		}*/
	}
	return 0;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerEnterDynamicArea %d %d",playerid, areaid); // debug juju
	#endif

	PLAYER_TEMP[playerid][py_LAST_AREA] = areaid;

	new
		info[2],
		type
	;
	
	type = Streamer_GetIntData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID);
	Streamer_GetArrayData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID, info);

	switch(type)
	{
		case KEY_TYPE_ENTER: ShowPlayerKeyMessage(playerid, "ENTER");
		case KEY_TYPE_Y: ShowPlayerKeyMessage(playerid, "Y");
		case KEY_TYPE_H: ShowPlayerKeyMessage(playerid, "H");
		case KEY_TYPE_ALT: ShowPlayerKeyMessage(playerid, "ALT");
	}

	switch(info[0])
	{
		case AREA_TYPE_NONE:
		{
			if (areaid == Mechanic_Area)
			{
				if (PLAYER_TEMP[playerid][py_WANT_MECHANIC])
				{
					PLAYER_TEMP[playerid][py_WANT_MECHANIC] = false;
					DisablePlayerMechanicMark(playerid);
				}
			}
		}
		case AREA_TYPE_GANGZONE:
		{
			new index = info[1];

			if (TERRITORIES[index][territory_VALID])
			{
				PLAYER_TEMP[playerid][py_LAST_TERRITORY] = index;
				if (TERRITORIES[index][territory_WAR])
				{
					new str_text[164];
					format(str_text, sizeof(str_text), "Este territorio está siendo atacado por la banda %s, es mejor alejarse.", CREW_INFO[ TERRITORIES[index][territory_ATTACKER_CREW_INDEX] ][crew_NAME]);
					ShowPlayerNotification(playerid, str_text, 6);
				}
				else if (TERRITORIES[index][territory_OCCUPIED])
				{
					new str_text[164];
					format(str_text, sizeof(str_text), "Este territorio es de la banda %s.", CREW_INFO[ TERRITORIES[index][territory_CREW_INDEX] ][crew_NAME]);
					ShowPlayerNotification(playerid, str_text, 6);	
				}
			}
		}
	}
	return 1;
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerLeaveDynamicArea %d %d",playerid, areaid); // debug juju
	#endif

	PLAYER_TEMP[playerid][py_LAST_AREA] = INVALID_STREAMER_ID;

	new
		info[2],
		type
	;

	type = Streamer_GetIntData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID);
	Streamer_GetArrayData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID, info);

	switch(type)
	{
		case KEY_TYPE_ENTER, KEY_TYPE_Y, KEY_TYPE_H, KEY_TYPE_ALT:
		{
			DestroyNotification(playerid, PLAYER_TEMP[playerid][py_KEY_NOT]);
			PLAYER_TEMP[playerid][py_KEY_NOT] = MAX_NOTIFICATIONS;
		}
	}

	switch(info[0])
	{
		case AREA_TYPE_NONE:
		{
			if (areaid == Farmer_Area)
			{
				if (PLAYER_TEMP[playerid][py_WORKING_IN] == WORK_FARMER) EndPlayerJob(playerid);
			}
			else if (areaid == Harvest_Area)
			{
				if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
				{
					if (PLAYER_TEMP[playerid][py_WORKING_IN] == WORK_HARVESTER)
					{
						ShowPlayerNotification(playerid, "Has abandonado el trabajo de cosechador porque te has alejado de la zona.", 3);
						EndPlayerJob(playerid);
					}
				}
			}
		}
		case AREA_TYPE_GANGZONE:
		{
			new index = info[1];

			if (TERRITORIES[index][territory_VALID])
			{
				if (PLAYER_CREW[playerid][player_crew_VALID])
				{
					SetPlayerNormalColor(playerid);
					TextDrawHideForPlayer(playerid, Textdraws[textdraw_TERRITORY_BOX]);
					TextDrawHideForPlayer(playerid, TERRITORIES[index][territory_TEXTDRAW]);
				}
			}
		}
		case KEY_TYPE_MISSION:
		{
			DestroyDynamicCP(PLAYER_TEMP[playerid][py_TEMP_CP]);
		}
	}
	
	return 1;
}

public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerEnterDynamicCP %d %d",playerid, checkpointid); // debug juju
	#endif

	new info[1];
	Streamer_GetArrayData(STREAMER_TYPE_CP, checkpointid, E_STREAMER_EXTRA_ID, info);

	switch(info[0])
	{
		case CHECKPOINT_TYPE_GPS:
		{
			DestroyDynamicCP(PLAYER_TEMP[playerid][py_GPS_CHECKPOINT]);
	 		CancelTracing(playerid);
			PLAYER_TEMP[playerid][py_GPS_CHECKPOINT] = INVALID_STREAMER_ID;
		}
		case CHECKPOINT_TYPE_UNLOAD_TRUCK:
		{
			if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
			if (!PLAYER_WORKS[playerid][WORK_TRUCK]) return 1;
			if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_TRUCK) return 1;

			new vehicleid = GetPlayerVehicleID(playerid);
			if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE] != VEHICLE_TYPE_WORK) return 1;
			if (WORK_VEHICLES[vehicleid][work_vehicle_WORK] != WORK_TRUCK) return 1;
			if (TRUCK_VEHICLE[vehicleid][truck_vehicle_DELIVERED]) return 1;
			if (TRUCK_VEHICLE[vehicleid][truck_vehicle_UNLOADING]) return 1;
			if (TRUCK_VEHICLE[vehicleid][truck_vehicle_DRIVER_USER_ID] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~Solo aceptaremos la carga del conductor de este camión.", 3);

			DestroyDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]);
	 		CancelTracing(playerid);
			PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT] = INVALID_STREAMER_ID;

			SetVehicleVelocity(vehicleid, 0.0, 0.0, 0.0);

			GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 0;
			UpdateVehicleParams(vehicleid);

			TRUCK_VEHICLE[vehicleid][truck_vehicle_UNLOADING] = true;

			PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] = 5;
			UpdatePlayerLoadingTruckSize(playerid);
			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][7]);
			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][9]);
			PLAYER_TEMP[playerid][py_TIMERS][9] = SetTimerEx("TruckUnLoadUp", 1000, false, "ii", playerid, vehicleid);
		}
		case CHECKPOINT_TYPE_FINISH_TRUCK:
		{
			if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
			if (!PLAYER_WORKS[playerid][WORK_TRUCK]) return 1;
			if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_TRUCK) return 1;

			new vehicleid = GetPlayerVehicleID(playerid);
			if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE] != VEHICLE_TYPE_WORK) return 1;
			if (WORK_VEHICLES[vehicleid][work_vehicle_WORK] != WORK_TRUCK) return 1;
			if (!TRUCK_VEHICLE[vehicleid][truck_vehicle_DELIVERED]) return 1;
			if (TRUCK_VEHICLE[vehicleid][truck_vehicle_UNLOADING]) return 1;
			if (TRUCK_VEHICLE[vehicleid][truck_vehicle_DRIVER_USER_ID] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~Solo le pagaremos al conductor que entregó la mercancía.", 3);

			DestroyDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]);
	 		CancelTracing(playerid);
			PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT] = INVALID_STREAMER_ID;

			SetVehicleVelocity(vehicleid, 0.0, 0.0, 0.0);

			new work_extra_payment;
			if (work_info[WORK_TRUCK][work_info_EXTRA_PAY] > 0 && work_info[WORK_TRUCK][work_info_EXTRA_PAY_EXP] > 0)
			{
				work_extra_payment = (work_info[WORK_TRUCK][work_info_EXTRA_PAY] * floatround(floatdiv(PLAYER_SKILLS[playerid][WORK_TRUCK], work_info[WORK_TRUCK][work_info_EXTRA_PAY_EXP])));
				if (work_info[WORK_TRUCK][work_info_EXTRA_PAY_LIMIT] != 0) if (work_extra_payment > work_info[WORK_TRUCK][work_info_EXTRA_PAY_LIMIT]) work_extra_payment = work_info[WORK_TRUCK][work_info_EXTRA_PAY_LIMIT];

				if (ACCOUNT_INFO[playerid][ac_SU]) work_extra_payment += SU_WORK_EXTRA_PAY;
			}
			GivePlayerCash(playerid, Truck_Contents[ TRUCK_VEHICLE[vehicleid][truck_vehicle_POINT] ][truck_content_MONEY] + work_extra_payment);
			PLAYER_SKILLS[playerid][WORK_TRUCK] ++;
			SavePlayerSkills(playerid);

			SetVehicleToRespawnEx(vehicleid);
			GivePlayerReputation(playerid);
		}
		case CHECKPOINT_TYPE_TRASH:
		{
			if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 1;
			if (!PLAYER_WORKS[playerid][WORK_TRASH]) return DestroyPlayerTrashCheckpoint(playerid);
			if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_TRASH) return DestroyPlayerTrashCheckpoint(playerid);
			if (!PLAYER_TEMP[playerid][py_TRASH_PASSENGER]) return 1;

			new driver = TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID];
			ShowPlayerMessage(driver, "Espera mientras tu ~y~compañero~w~ recoge la basura.", 4);

			new Float:offset = floatdiv(PLAYER_SKILLS[playerid][WORK_TRASH], 10);
			if (offset > 30.0) offset = 30.0;

			PLAYER_TEMP[playerid][py_RECYCLE_BIN_VALUE] = 5;
			UpdatePlayerTrashRecycleSize(playerid);

			TogglePlayerControllableEx(playerid, false);
			SetCameraBehindPlayer(playerid);
			ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.1, true, false, false, false, 0);

			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][10]);
			PLAYER_TEMP[playerid][py_TIMERS][10] = SetTimerEx("RecycleUp", 1000, false, "i", playerid);
		}
		case CHECKPOINT_TYPE_FINISH_TRASH:
		{
			if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
			if (!PLAYER_WORKS[playerid][WORK_TRASH]) return DestroyPlayerTrashCheckpoint(playerid);
			if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_TRASH) return DestroyPlayerTrashCheckpoint(playerid);
			if (!PLAYER_TEMP[playerid][py_TRASH_DRIVER]) return 1;

			new route = TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_ROUTE];
			new money = TRASH_OBJECTS[route][trash_route_MONEY];

			new driver_work_extra_payment, passenger_work_extra_payment;
			if (work_info[WORK_TRASH][work_info_EXTRA_PAY] > 0 && work_info[WORK_TRASH][work_info_EXTRA_PAY_EXP] > 0)
			{
				driver_work_extra_payment = (work_info[WORK_TRASH][work_info_EXTRA_PAY] * floatround(floatdiv(PLAYER_SKILLS[playerid][WORK_TRASH], work_info[WORK_TRASH][work_info_EXTRA_PAY_EXP])));
				if (work_info[WORK_TRASH][work_info_EXTRA_PAY_LIMIT] != 0) if (driver_work_extra_payment > work_info[WORK_TRASH][work_info_EXTRA_PAY_LIMIT]) driver_work_extra_payment = work_info[WORK_TRASH][work_info_EXTRA_PAY_LIMIT];
				if (ACCOUNT_INFO[playerid][ac_SU]) driver_work_extra_payment += SU_WORK_EXTRA_PAY;

				passenger_work_extra_payment = (work_info[WORK_TRASH][work_info_EXTRA_PAY] * floatround(floatdiv(PLAYER_SKILLS[ TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID] ][WORK_TRASH], work_info[WORK_TRASH][work_info_EXTRA_PAY_EXP])));
				if (work_info[WORK_TRASH][work_info_EXTRA_PAY_LIMIT] != 0) if (passenger_work_extra_payment > work_info[WORK_TRASH][work_info_EXTRA_PAY_LIMIT]) passenger_work_extra_payment = work_info[WORK_TRASH][work_info_EXTRA_PAY_LIMIT];
				if (ACCOUNT_INFO[ TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID] ][ac_SU]) passenger_work_extra_payment += SU_WORK_EXTRA_PAY;
			}

			GivePlayerCash(playerid, money + driver_work_extra_payment + 1000);
			SavePlayerSkills(playerid);
			PLAYER_SKILLS[playerid][WORK_TRASH] ++;
			SavePlayerSkills(playerid);
			GivePlayerReputation(playerid);
			GivePlayerReputation(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID]);

			GivePlayerCash(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], money + passenger_work_extra_payment);
			PLAYER_SKILLS[ TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID] ][WORK_TRASH] ++;
			SavePlayerSkills(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID]);

			CancelTrashWork(playerid, TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);
		}
		/*case CHECKPOINT_TYPE_CLEANER:
		{
			DestroyDynamicCP(PLAYER_TEMP[playerid][py_CLEANER_CHECKPOINT]);
			PLAYER_TEMP[playerid][py_CLEANER_FINAL] = CreateDynamicCP(1633.112792, -1885.244140, 13.278512, 7.0, 0, 0, playerid, 9999999999.0);
			StartTracing(playerid, 1633.112792, -1885.244140, 13.278512);

			new n_info[1];
			n_info[0] = CHECKPOINT_TYPE_FINISH_CLEANER;
			Streamer_SetArrayData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_CLEANER_FINAL], E_STREAMER_EXTRA_ID, n_info);

			ShowPlayerMessage(playerid, "Vuelve a recibir la paga.", 4);
		}
		case CHECKPOINT_TYPE_FINISH_CLEANER:
		{
			if (PLAYER_TEMP[playerid][py_CLEANER_INDEX] == 99) return 0;

			new 
				Float:distance = GetPlayerDistanceFromPoint(playerid, CleanerRoutes[ PLAYER_TEMP[playerid][py_CLEANER_INDEX] ][0], CleanerRoutes[ PLAYER_TEMP[playerid][py_CLEANER_INDEX] ][1], CleanerRoutes[ PLAYER_TEMP[playerid][py_CLEANER_INDEX] ][2]),
				payment = (floatround(distance) * 2),
				str_text[64];

			DestroyDynamicCP(PLAYER_TEMP[playerid][py_CLEANER_FINAL]);
			GivePlayerCash(playerid, payment);
			RemovePlayerFromVehicle(playerid);
			PLAYER_TEMP[playerid][py_CLEANER_INDEX] = 99;
		}*/
		default: return 1;
	}
	return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ, Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{	
	#if DEBUG_MODE == 1
		printf("OnPlayerEditAttachedObject %d %d", playerid, response); // debug juju
	#endif

	if (index != PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT]) return 0;

	if (response)
	{
		if (fScaleX >= 1.5 || fScaleY >= 1.5 || fScaleZ >= 1.5)
		{
			ShowPlayerMessage(playerid, "~r~El tamaño del accesorio es demasiado grande.", 3);

			RemovePlayerAttachedObject(playerid, PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT]);
			if (PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ATTACHED])
			{
				SetPlayerAttachedObject
				(
					playerid,
					PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_MODELID],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_BONE],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_X],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_Y],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_Z],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_X],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_Y],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_Z],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_X],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_Y],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_Z],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_COLOR_1],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_COLOR_2]
					);
			}
			return 1;
		}

		if ((fOffsetX >= 0.6 || -0.6 >= fOffsetX) || (fOffsetY >= 0.6 || -0.6 >= fOffsetY) || (fOffsetZ >= 0.6 || -0.6 >= fOffsetZ))
		{
			ShowPlayerMessage(playerid, "~r~La posición del objeto está demasiado lejos de ti.", 3);

			RemovePlayerAttachedObject(playerid, PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT]);
			if (PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ATTACHED])
			{
				SetPlayerAttachedObject
				(
					playerid,
					PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_MODELID],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_BONE],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_X],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_Y],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_Z],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_X],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_Y],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_Z],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_X],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_Y],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_Z],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_COLOR_1],
					PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_COLOR_2]
					);
			}

			return 1;
		}

		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_X] = fOffsetX;
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_Y] = fOffsetY;
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_Z] = fOffsetZ;
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_X] = fRotX;
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_Y] = fRotY;
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_Z] = fRotZ;
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_X] = fScaleX;
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_Y] = fScaleY;
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_Z] = fScaleZ;

		if (!PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ATTACHED]) PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ATTACHED] = true;

		SendClientMessageEx(playerid, COLOR_WHITE, ""COL_WHITE"Accesorio "COL_RED"'%s' "COL_WHITE"actualizado.", PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_NAME]);
		ShowPlayerMessage(playerid, "Accesorio actualizado", 2);
	}
	else
	{
		RemovePlayerAttachedObject(playerid, PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT]);
		if (PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ATTACHED])
		{
			SetPlayerAttachedObject
			(
				playerid,
				PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT],
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_MODELID],
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_BONE],
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_X],
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_Y],
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_Z],
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_X],
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_Y],
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_Z],
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_X],
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_Y],
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_Z],
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_COLOR_1],
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_COLOR_2]
				);
		}
		ShowPlayerMessage(playerid, "Has cancelado la edición", 2);
	}
	return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	PLAYER_TEMP[playerid][py_MAP_X] = fX;
	PLAYER_TEMP[playerid][py_MAP_Y] = fY;
	PLAYER_TEMP[playerid][py_MAP_Z] = fZ;
    return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] >= CMD_MODERATOR)
	{
		if (ACCOUNT_INFO[clickedplayerid][ac_ADMIN_LEVEL] > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL]) return SendClientMessage(playerid, COLOR_WHITE, "El rango administrativo de este jugador es superior al tuyo.");

		new Float:p[4];
		GetPlayerPos(clickedplayerid, p[0], p[1], p[2]);
		GetPlayerFacingAngle(clickedplayerid, p[3]);

		SetPlayerPosEx(playerid, p[0], p[1], p[2], p[3], GetPlayerInterior(clickedplayerid), GetPlayerVirtualWorld(clickedplayerid), false, true);
		SetPlayerFacingAngle(playerid, p[3] + 180.0);

		SendCmdLogToAdmins(playerid, "goto", sprintf("%d", clickedplayerid));
	}
    return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    if (clickedid == Text:INVALID_TEXT_DRAW)
    {
		if (PLAYER_TEMP[playerid][py_PLAYER_IN_INV] && GetTickCount() > g_iInvLastTick[playerid]) HideInventory(playerid);

		PLAYER_TEMP[playerid][py_SELECT_TEXTDRAW] = false;

		if (PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_ENABLED])
		{
			ExitPlayerPropertyConstructor(playerid);
			return 1;
		}

		if (PLAYER_TEMP[playerid][py_PLAYER_IN_ATM]) HideBankMenu(playerid);

		if (PLAYER_TEMP[playerid][py_PLAYER_IN_PHONE])
		{
			HidePhone(playerid);

			if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER) ShowPlayerSpeedoMeter(playerid);
		}

		if (PLAYER_TEMP[playerid][py_TUNING_GARAGE_SHOP])
		{
			CancelPlayerTuningShop(playerid);
			ShowObjTuning(playerid);
		}
		
		return 1;
	}

	if (PLAYER_TEMP[playerid][py_TUNING_GARAGE_SHOP])
	{
		if (clickedid == Textdraws[textdraw_SHOP_TUNING][2]) //Comprar
		{
			new slot = GetVehicleFreeObjectSlot(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID]);
			if (!ACCOUNT_INFO[playerid][ac_SU] && slot >= MAX_NU_VOBJECTS)
			{
				PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
				ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP~w~ para tener más objetos.", 4);
				return 1;
			}

			if (slot == -1)
			{
			    ShowPlayerMessage(playerid, "~r~No hay más espacio para objetos en este vehículo.", 3);
				return 1;
			}

			if (Tuning_Shop_Objects[ PLAYER_TEMP[playerid][py_SELECT_TUNING_OBJECT] ][tuning_object_PRICE] > CHARACTER_INFO[playerid][ch_CASH])
			{
				PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
				ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				return 1;
			}

			GivePlayerCash(playerid, -Tuning_Shop_Objects[ PLAYER_TEMP[playerid][py_SELECT_TUNING_OBJECT] ][tuning_object_PRICE]);

			VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_VALID] = true;
			VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_TYPE] = VOBJECT_TYPE_OBJECT;
			VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_ID] = 0;
			VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_MODELID] = Tuning_Shop_Objects[ PLAYER_TEMP[playerid][py_SELECT_TUNING_OBJECT] ][tuning_object_MODELID];
			format(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_NAME], 32, "%s", Tuning_Shop_Objects[ PLAYER_TEMP[playerid][py_SELECT_TUNING_OBJECT] ][tuning_object_NAME]);
			VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_ATTACHED] = true;
			UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], slot);

			RegisterNewVehicleObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], slot);
			CancelPlayerTuningShop(playerid);

			ShowDialog(playerid, DIALOG_VOBJECT_OBJECTS);
			//EditVehicleObject(playerid, PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], slot);
			return 1;
		}
		else if (clickedid == Textdraws[textdraw_SHOP_TUNING][3]) //Siguiente
		{
			if (PLAYER_TEMP[playerid][py_SELECT_TUNING_OBJECT] == (sizeof(Tuning_Shop_Objects) - 1)) PLAYER_TEMP[playerid][py_SELECT_TUNING_OBJECT] = 0;
			else PLAYER_TEMP[playerid][py_SELECT_TUNING_OBJECT] ++;
			UpdateTuningShop(playerid);
			return 1;
		}
		else if (clickedid == Textdraws[textdraw_SHOP_TUNING][4]) //Anterior
		{
			if (PLAYER_TEMP[playerid][py_SELECT_TUNING_OBJECT] == 0) PLAYER_TEMP[playerid][py_SELECT_TUNING_OBJECT] = sizeof(Tuning_Shop_Objects) - 1;
			else PLAYER_TEMP[playerid][py_SELECT_TUNING_OBJECT] --;
			UpdateTuningShop(playerid);
			return 1;
		}
		return 1;
	}

	if (PLAYER_TEMP[playerid][py_PLAYER_IN_PHONE])
	{
		if (clickedid == Textdraws[textdraw_PHONE_MENU][12]) ShowDialog(playerid, DIALOG_PHONE);
		else if (clickedid == Textdraws[textdraw_PHONE_MENU][13]) ShowDialog(playerid, DIALOG_PHONE_MESSAGE_LIST);
		else if (clickedid == Textdraws[textdraw_PHONE_MENU][14]) ShowDialog(playerid, DIALOG_PHONE_BOOK);
		else if (clickedid == Textdraws[textdraw_PHONE_MENU][15])
		{
			if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No estás depie.", 3);
			if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes sacarte fotos.", 3);

			HidePhone(playerid);
			PLAYER_TEMP[playerid][py_SELFIE] = true;

			new Float:x, Float:y, Float:z,
				Float:angle,
				Float:cam_x, Float:cam_y;

			GetPlayerPos(playerid, x, y, z);
			GetPlayerFacingAngle(playerid, angle);

			if (angle >= 360.0) angle = 0.0;
			angle += 1.25;
			cam_x = x + 1.4 * floatcos(angle, degrees);
			cam_y = y + 1.4 * floatsin(angle, degrees);
			SetPlayerCameraPos(playerid, cam_x, cam_y, z + 1.0);
			SetPlayerCameraLookAt(playerid, x, y, z + 1);
			SetPlayerFacingAngle(playerid, angle - 90.0);
			TogglePlayerControllableEx(playerid, false);
			ApplyAnimation(playerid, "PED", "gang_gunstand", 4.1, 1, 1, 1, 1, 1, 1);
			SetPlayerChatBubble(playerid, "\n\n\n\n* Saca su celular para sacarse una selfie.\n\n\n", 0xffcb90FF, 20.0, 5000);
			ShowPlayerMessage(playerid, "Presiona ~r~ALT~w~ para salir.", 2);
		}
	}

	if (PLAYER_TEMP[playerid][py_PLAYER_IN_ATM])
    {
		if (clickedid == Textdraws[textdraw_BANK_MENU][3])
		{
			HideBankMenu(playerid);
			ShowDialog(playerid, DIALOG_BANK_DEPOSIT);
			return 1;
		}
		else if (clickedid == Textdraws[textdraw_BANK_MENU][4])
		{
			HideBankMenu(playerid);
            ShowDialog(playerid, DIALOG_BANK_WITHDRAW);
			return 1;
		}
		else if (clickedid == Textdraws[textdraw_BANK_MENU][5])
		{
			HideBankMenu(playerid);
            ShowDialog(playerid, DIALOG_BANK_TRANSFER);
			return 1;
		}
		else if (clickedid == Textdraws[textdraw_BANK_MENU][6])
		{
			HideBankMenu(playerid);
            ShowDialog(playerid, DIALOG_BANK_TRANSACTIONS);
			return 1;
		}
	}
	return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
	if (PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_ENABLED])
	{
		if (playertextid == PlayerTextdraws[playerid][ptextdraw_PROPERTY_CONSTRUCTOR][2]) //Anterior
		{
			if (PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO] == 0) PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO] = sizeof(PROPERTY_INTERIORS) - 1;
			else PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO] --;
			UpdatePlayerPropertyContructor(playerid);
			return 1;
		}
		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_PROPERTY_CONSTRUCTOR][3]) //Siguiente
		{
			if (PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO] == (sizeof(PROPERTY_INTERIORS) - 1)) PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO] = 0;
			else PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO] ++;
			UpdatePlayerPropertyContructor(playerid);
			return 1;
		}
		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_PROPERTY_CONSTRUCTOR][4]) //Crear
		{
			Create_PlayerPropertyConstructo(playerid);
			return 1;
		}
		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_PROPERTY_CONSTRUCTOR][5]) //Cancelar
		{
			ExitPlayerPropertyConstructor(playerid);
			return 1;
		}
		return 1;
	}

	if (PLAYER_TEMP[playerid][py_PLAYER_IN_INV])
	{
		if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][0])
		{
			HideInventory(playerid);
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][1])
		{
			PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], COLOR_RED);
			PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2], COLOR_WHITE);
			PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3], COLOR_WHITE);
			PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40], COLOR_WHITE);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);
			HideCrew(playerid);
			ShowInventory(playerid);
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][2])
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID])
			{
				if (PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~Los policías no pueden tener banda.", 3);

				new index = GetAvaibleCrewIndex();
				if (index == -1)
				{
				    ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew y no se puede crear una porque~n~no hay espacio disponible.", 5);
					return 1;
				}

				ShowDialog(playerid, DIALOG_CREATE_CREW);
				return 1;
			}

			ShowCrew(playerid);

			PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], COLOR_WHITE);
			PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2], COLOR_RED);
			PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3], COLOR_WHITE);
			PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40], COLOR_WHITE);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][3])
		{
			HideCrew(playerid);
			ShowDialog(playerid, DIALOG_PLAYER_GPS);
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][40])
		{
			ShowHelpMenu(playerid);
			PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], COLOR_WHITE);
			PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2], COLOR_WHITE);
			PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3], COLOR_WHITE);
			PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40], COLOR_RED);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][37])
		{
			HideInventory(playerid);
			ShowRangeUser(playerid);
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][5])
		{
			if (PLAYER_TOYS[playerid][0][player_toy_VALID])
			{
				HideInventory(playerid);
				PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] = 0;
				ShowDialog(playerid, DIALOG_PLAYER_TOY_MENU);
			}
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][6])
		{
			if (PLAYER_TOYS[playerid][1][player_toy_VALID])
			{
				HideInventory(playerid);
				PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] = 1;
				ShowDialog(playerid, DIALOG_PLAYER_TOY_MENU);
			}
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][7])
		{
			if (PLAYER_TOYS[playerid][2][player_toy_VALID])
			{
				HideInventory(playerid);
				PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] = 2;
				ShowDialog(playerid, DIALOG_PLAYER_TOY_MENU);
			}
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][8])
		{
			if (PLAYER_TOYS[playerid][3][player_toy_VALID])
			{
				HideInventory(playerid);
				PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] = 3;
				ShowDialog(playerid, DIALOG_PLAYER_TOY_MENU);
			}
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][9])
		{
			if (PLAYER_TOYS[playerid][4][player_toy_VALID])
			{
				HideInventory(playerid);
				PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] = 4;
				ShowDialog(playerid, DIALOG_PLAYER_TOY_MENU);
			}
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV_CREW][9])
		{
			if (PLAYER_CREW[playerid][player_crew_RANK] == 0)
			{
				new DB_Query[128], DBResult:Result_count, total;
				format(DB_Query, sizeof DB_Query, "SELECT COUNT() FROM `PLAYER_CREW` WHERE `ID_CREW` = '%d' AND `RANK` = '0';", PLAYER_CREW[playerid][player_crew_ID]);
				Result_count = db_query(Database, DB_Query);

				if (db_num_rows(Result_count)) total = db_get_field_int(Result_count, 0);
				db_free_result(Result_count);

				if (total <= 1)
				{
					ShowPlayerMessage(playerid, "~r~No puedes abandonar la banda porque eres el~n~único miembro con el rango principal.", 3);
					return 1;
				}
				PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
			}

			ShowDialog(playerid, DIALOG_CREW_LEAVE);
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV_CREW][10])
		{
			PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
			ShowDialog(playerid, DIALOG_CREW_MENU);
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV_CREW][11])
		{
			new 
				dialog[664],
				time = (gettime() - GraffitiGetTime);

			format(dialog, sizeof dialog, "\
				"COL_WHITE"Las disputas son cada 50 minutos, la última fue hace %s.", TimeConvert(time));

			ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Disputas", dialog, "Cerrar", "");
			PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][41])
		{
			/* Header */
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47], "Bienvenido a Hyaxe");
			
			/* Body */
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48], TextToSpanish("~w~La idea de Hyaxe surgió en 2018, pero no fue hasta mediados de 2019 que comenzó a desarrollarse, con tiempos más activos y otros no tanto, pasó por varios cambios, primero fue un juego de roles y luego de supervivencia, nos quedamos con la primera opción porque la encontramos más rentable en SA:MP. Con el tiempo ampliamos nuestras fronteras a nuevos juegos como GTA:V, Rust, entre otros, las personas que trabajan en Hyaxe son pocas, pero esperamos que en el futuro aumente el número de miembros del equipo."));
			
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48]);

			PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][42])
		{
			/* Header */
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47], "Trabajos");
			
			/* Body */
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48], TextToSpanish("~w~Los trabajos es un sistema en el que los jugadores pueden obtener recompensas, como dinero, hycoins, entre otros. Llevando a cabo diversas tareas, como picar, recoger basura, transportar cargas, etc. Esto dependerá del trabajo que elija, puede ser basurero, cosechador, pescador, minero o un trabajo especial como la policía, pero para esto debe postularse en ~r~foro.hyaxe.com~w~, solo cuando las aplicaciones estén abiertas. Cuando consigas un trabajo, renunciarás automáticamente a todos los otros, a menos que sean especiales (como policía), cuanto más trabajes, más experiencia tendrás, con más experiencia podrás desbloquear pagos más altos. También puedes comprar una membresía VIP en ~r~www.hyaxe.com/store~w~ con la cual vas a desbloquear pagas extras."));
			
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48]);

			PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][43])
		{
			/* Header */
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47], "Las bandas");
			
			/* Body */
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48], TextToSpanish("~w~Las bandas son una forma para que los jugadores formen grupos sociales con sistemas del servidor, lo que también brinda nuevas posibilidades de rol y nuevas formas de obtener ganancias. Para las bandas hemos desarrollado un sistema de particular, Las Disputas, hay dos tipos, la disputa de graffiti, donde las pandillas luchan por quien pinta primero el graffiti, y las disputas de Mercados Negros, que es casi lo mismo, solo que es un poco más complicado para ganarlos. Para crear una banda, haga clic en ~r~Banda~w~, debe tener el nivel 2 y tener 10,000. Puede poner una descripción, administrar, crear roles y configurar sus permisos, todo a través de una interfaz fácil de entender."));
			
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48]);

			PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][44])
		{
			/* Header */
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47], "Vehiculos");
			
			/* Body */
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48], TextToSpanish("~w~Puede comprar un vehículo en cualquier concesionario, puede ubicar uno haciendo click en ~r~Mapa~w~ o usar uno gratuito como los que aparecen en el lobby.~n~~n~Teclas:~n~Abrir puertas ~r~>~w~ Espacio + Y~n~Encender/apagar luces ~r~>~w~ Espacio + N~n~Administrar ~r~>~w~ 2"));
			
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48]);

			PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][45])
		{
			/* Header */
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47], "Propiedades");
			
			/* Body */
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48], TextToSpanish("~w~Una propiedad te servirá para esconderse de la policía, hacer fiestas y muchos más. Por ahora, este sistema no esta muy avanzado en comparación con todo lo demás en el servidor, pero en el futuro se va a poder decorar el interior, colocar almacenes, dar la llave a amigos y mucho más."));
			
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48]);

			PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
			return 1;
		}
		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][46])
		{
			/* Header */
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47], "Hyaxe Client");
			
			/* Body */
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48], TextToSpanish("~w~Hyaxe Client es un cliente personalizado que incluye nuevas características al servidor, como por ejemplo, un chat de voz. Es muy fácil instalarlo, solo visite ~r~www.hyaxe.com/client~w~, si se le dificulta busque en YouTube: ~r~Chat de voz Hyaxe tutorial~w~. Muchos usuarios hicieron tutoriales, aprovéchelo."));
			
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48]);

			PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][10]) ClickInventorySlot(playerid, 10);
		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][11]) ClickInventorySlot(playerid, 11);
		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][12]) ClickInventorySlot(playerid, 12);
		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][13]) ClickInventorySlot(playerid, 13);
		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][14]) ClickInventorySlot(playerid, 14);
		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][15]) ClickInventorySlot(playerid, 15);
		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][16]) ClickInventorySlot(playerid, 16);
		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][17]) ClickInventorySlot(playerid, 17);
		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][18]) ClickInventorySlot(playerid, 18);
		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][19]) ClickInventorySlot(playerid, 19);
		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][20]) ClickInventorySlot(playerid, 20);
		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][21]) ClickInventorySlot(playerid, 21);
		return 1;
	}
    return 1;
}

public OnPlayerPickUpDynamicPickup(playerid, pickupid)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerPickUpDynamicPickup %d %d",playerid, pickupid); // debug juju
    #endif

	new info[3];
    Streamer_GetArrayData(STREAMER_TYPE_PICKUP, pickupid, E_STREAMER_EXTRA_ID, info);
    
	switch(info[0])
	{
		case PICKUP_TYPE_MONEY:
		{
			GivePlayerCash(playerid, minrand(10, 350), false);
			DestroyDynamicPickup(pickupid);
			return 0;
		}
	}

    PLAYER_TEMP[playerid][py_LAST_PICKUP_ID] = pickupid;
    return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	/*#if DEBUG_MODE == 1
		printf("OnPlayerKeyStateChange %d %d %d",playerid, newkeys, oldkeys); // debug juju
    #endif*/

	if (!IsPlayerConnected(playerid)) return 0;
	if (IsPlayerPaused(playerid)) return 0;
	if (PLAYER_TEMP[playerid][py_KICKED]) return 0;
	if (!PLAYER_TEMP[playerid][py_USER_LOGGED]) return 0;

    if (PRESSED(  KEY_SECONDARY_ATTACK  ))
    {
    	if (PLAYER_TEMP[playerid][py_IN_TUNING_GARAGE]) PLAYER_TEMP[playerid][py_IN_TUNING_GARAGE] = false;

        EnterSite(playerid);
		CheckRepairRockProcessor(playerid);

        if (IsPlayerInRangeOfPoint(playerid, 2.0, 3854.231933, -1265.252319, 7547.983398))
	    {
	    	SetPlayerPosEx(playerid, 2770.574462, -1628.717163, 12.177460, 358.490142, 0, 0, false);
	        return 1;
	    }

	    if (IsPlayerInRangeOfPoint(playerid, 1.5, 2284.304443, -1626.453613, 15.889787))
	    {
	    	SetPlayerPosEx(playerid, 3651.359375, -3218.666503, 2.333304, 0.0, 0, 0, false);
	    }

	    if (IsPlayerInRangeOfPoint(playerid, 1.5, 3651.359375, -3218.666503, 2.333304))
	    {
	    	SetPlayerPosEx(playerid, 2284.304443, -1626.453613, 15.889787, 0.0, 0, 0, false);
	    }

        if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		{
			if (PLAYER_TEMP[playerid][py_INTERIOR_INDEX] != -1)
			{
				if (ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE] == INTERIOR_CLUB)
				{
					if (IsPlayerInRangeOfPoint(playerid, 1.5, 1208.744140, -34.261119, 1000.953125) || IsPlayerInRangeOfPoint(playerid, 1.5, 1213.738037, -33.667881, 1000.953125))
		            {
		                if (CHARACTER_INFO[playerid][ch_CASH] <= 50) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);

            			ApplyAnimation(playerid, "STRIP", RandomPayStripAnimations[random(sizeof(RandomPayStripAnimations))], 4.1, 0, 0, 0, 0, 0);
            		    GivePlayerCash(playerid, -random(25), false);
            		    SetPlayerChatBubble(playerid, "\n\n\n\n* le pone billetes en la tanga de una puta\n\n\n", 0xffcb90FF, 20.0, 5000);
            		    return 1;
		            }
			    }
			}

			if (PLAYER_WORKS[playerid][WORK_POLICE])
			{
				for(new i = 0; i != sizeof POLICE_DOORS; i ++)
				{
					if (GetPlayerInterior(playerid) != POLICE_DOORS[i][police_door_INTERIOR] || GetPlayerVirtualWorld(playerid) != POLICE_DOORS[i][police_door_WORLD]) continue;
					if (IsDynamicObjectMoving(POLICE_DOORS[i][police_door_OBJECT_ID]) || !POLICE_DOORS[i][police_door_CLOSED]) continue;

					new Float:pos[4];

					pos[0] = POLICE_DOORS[i][police_door_X] + (1.0 * floatsin(-POLICE_DOORS[i][police_door_RZ], degrees));
					pos[1] = POLICE_DOORS[i][police_door_Y] + (1.0 * floatcos(-POLICE_DOORS[i][police_door_RZ], degrees));
					pos[2] = POLICE_DOORS[i][police_door_X] + (-1.0 * floatsin(-POLICE_DOORS[i][police_door_RZ], degrees));
					pos[3] = POLICE_DOORS[i][police_door_Y] + (-1.0 * floatcos(-POLICE_DOORS[i][police_door_RZ], degrees));

					if (IsPlayerInRangeOfPoint(playerid, 1.8, pos[0], pos[1], POLICE_DOORS[i][police_door_Z]))
					{
						KillTimer(POLICE_DOORS[i][police_door_TIMER]);
						POLICE_DOORS[i][police_door_TIMER] = SetTimerEx("ClosePoliceDoor", 3000, false, "i", i);
						MoveDynamicObject(POLICE_DOORS[i][police_door_OBJECT_ID], POLICE_DOORS[i][police_door_X], POLICE_DOORS[i][police_door_Y] - 1.4, POLICE_DOORS[i][police_door_Z] + 0.01, 2.0, 0.0, 0.0, POLICE_DOORS[i][police_door_RZ]);
						POLICE_DOORS[i][police_door_CLOSED] = false;
						break;
					}
					else if (IsPlayerInRangeOfPoint(playerid, 1.8, pos[2], pos[3], POLICE_DOORS[i][police_door_Z]))
					{
						KillTimer(POLICE_DOORS[i][police_door_TIMER]);
						POLICE_DOORS[i][police_door_TIMER] = SetTimerEx("ClosePoliceDoor", 3000, false, "i", i);
						MoveDynamicObject(POLICE_DOORS[i][police_door_OBJECT_ID], POLICE_DOORS[i][police_door_X], POLICE_DOORS[i][police_door_Y] + 1.4, POLICE_DOORS[i][police_door_Z] + 0.01, 2.0, 0.0, 0.0, POLICE_DOORS[i][police_door_RZ]);
						POLICE_DOORS[i][police_door_CLOSED] = false;
						break;
					}
				}
			}

			for(new i = 0; i != sizeof JAIL_DOORS; i ++)
			{
				if (GetPlayerInterior(playerid) != JAIL_DOORS[i][jail_door_INTERIOR] || GetPlayerVirtualWorld(playerid) != JAIL_DOORS[i][jail_door_WORLD]) continue;
				if (IsDynamicObjectMoving(JAIL_DOORS[i][jail_door_OBJECT_ID]) || !JAIL_DOORS[i][jail_door_CLOSED]) continue;

				new Float:pos[4];

				pos[0] = JAIL_DOORS[i][jail_door_X] + (1.0 * floatsin(-JAIL_DOORS[i][jail_door_RZ], degrees));
				pos[1] = JAIL_DOORS[i][jail_door_Y] + (1.0 * floatcos(-JAIL_DOORS[i][jail_door_RZ], degrees));
				pos[2] = JAIL_DOORS[i][jail_door_X] + (-1.0 * floatsin(-JAIL_DOORS[i][jail_door_RZ], degrees));
				pos[3] = JAIL_DOORS[i][jail_door_Y] + (-1.0 * floatcos(-JAIL_DOORS[i][jail_door_RZ], degrees));

				if (IsPlayerInRangeOfPoint(playerid, 1.8, pos[0], pos[1], JAIL_DOORS[i][jail_door_Z]))
				{
					KillTimer(JAIL_DOORS[i][jail_door_TIMER]);
					JAIL_DOORS[i][jail_door_TIMER] = SetTimerEx("CloseJailDoor", 3000, false, "i", i);
					MoveDynamicObject(JAIL_DOORS[i][jail_door_OBJECT_ID], JAIL_DOORS[i][jail_door_X], JAIL_DOORS[i][jail_door_Y] - 1.3, JAIL_DOORS[i][jail_door_Z] + 0.01, 1.0, 0.0, 0.0, JAIL_DOORS[i][jail_door_RZ]);
					JAIL_DOORS[i][jail_door_CLOSED] = false;
					break;
				}
				else if (IsPlayerInRangeOfPoint(playerid, 1.8, pos[2], pos[3], JAIL_DOORS[i][jail_door_Z]))
				{
					KillTimer(JAIL_DOORS[i][jail_door_TIMER]);
					JAIL_DOORS[i][jail_door_TIMER] = SetTimerEx("CloseJailDoor", 3000, false, "i", i);
					MoveDynamicObject(JAIL_DOORS[i][jail_door_OBJECT_ID], JAIL_DOORS[i][jail_door_X], JAIL_DOORS[i][jail_door_Y] + 1.3, JAIL_DOORS[i][jail_door_Z] + 0.01, 1.0, 0.0, 0.0, JAIL_DOORS[i][jail_door_RZ]);
					JAIL_DOORS[i][jail_door_CLOSED] = false;
					break;
				}
			}

			if (IsPlayerInRangeOfPoint(playerid, 2.0, 1881.801635, -1688.519531, 5216.709960))
		    {
		    	SetPlayerPosEx(playerid, 1555.400390, -1675.611694, 16.195312, 180.0, 0, 0, false);
		    }

		    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1881.341674, -1727.080688, 5216.709960))
		    {
		    	SetPlayerPosEx(playerid, 1568.651977, -1690.080688, 6.218750, 180.0, 0, 0, false);
		    }
		}
        return 1;
    }

	if (PRESSED(KEY_CTRL_BACK))
	{
		if (PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] != 9999)
			DropItemSlot(playerid);
	}

	if (PRESSED( KEY_HANDBRAKE | KEY_YES ))
    {
		CheckPlayerDoors(playerid);
		return 1;
	}
	
	if (PRESSED( KEY_YES ))
    {
    	if (PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] != 9999) UseItemSlot(playerid);

    	CheckRodShop(playerid);
    	CheckFixKitShop(playerid);
    	CheckMinerShop(playerid);
    	CheckFishSell(playerid);
    	CheckBlackMarket(playerid);
    	CheckDrugBlackMarket(playerid);
		CheckWorkSite(playerid);
		CheckClothShop(playerid);
        CheckAtmPlayerAndExecute(playerid);
        CheckShopAndExecute(playerid);
        CheckAndExecuteHospitalShop(playerid);
        CheckAndExecuteGasoline(playerid);
        CheckFoodShop(playerid);
        CheckPoliceEquipeSite(playerid);
        CheckMafiaEquipeSite(playerid);
        CheckPlayerHouseDoor(playerid);
        CheckFarmerShop(playerid);
        CheckBallonAction(playerid);
        CheckAmbulance(playerid);
        CheckBoxClub(playerid);
        CheckClubMenu(playerid);
        CheckRegister(playerid);

        #if defined HALLOWEEN_MODE
       		CheckPumpkinWitch(playerid);
		#endif

       	#if defined CHRISTMAS_MODE
       		CheckRocketStore(playerid);
		#endif

        for(new i = 0; i != sizeof TELE_MIRRORS; i ++)
		{
			if (IsPlayerInRangeOfPoint(playerid, 1.0, TELE_MIRRORS[i][teleview_X], TELE_MIRRORS[i][teleview_Y], TELE_MIRRORS[i][teleview_Z]))
			{
				if (GetPlayerVirtualWorld(playerid) == TELE_MIRRORS[i][teleview_WORLD])
				{
					if (GetPlayerInterior(playerid) == TELE_MIRRORS[i][teleview_INTERIOR])
					{
						SetTeleView(playerid);
						break;
					}
				}
			}
		}

		if (IsPlayerInRangeOfPoint(playerid, 1.0, 1722.2310, -1253.8021, 471.1665))
			ShowDialog(playerid, DIALOG_ELECTRONIC_SHOP);
	}

	if (PRESSED( KEY_YES | KEY_WALK ))
    {
		CheckAndOpenBoot(playerid, 1);
		return 1;
	}
	if (PRESSED( KEY_NO | KEY_WALK ))
    {
		CheckAndOpenBoot(playerid, 0);
		return 1;
	}
	else if (PRESSED( KEY_WALK ))
	{
		if (PLAYER_TEMP[playerid][py_EDITING_MODE])
		{
			CancelEditingMode(playerid);
			return 1;
		}

		if (PLAYER_TEMP[playerid][py_IN_TELE])
		{
			CloseTeleView(playerid);
			return 1;
		}

		if (PLAYER_WORKS[playerid][WORK_MINER])
		{
			// Start mining if only take a mallet
			if (!PLAYER_TEMP[playerid][py_MINING])
			{
				if (PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] != 9999)
				{
					new slot = PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT];
					if (PLAYER_VISUAL_INV[playerid][slot_TYPE][slot] == 52)
					{
						for(new i = 0; i < sizeof ROCKS_OBJ; i ++)
						{
							if (ROCKS_OBJ[i][r_ACTIVATED])
							{
								if (IsPlayerInRangeOfPoint(playerid, 1.8, ROCKS_OBJ[i][r_X], ROCKS_OBJ[i][r_Y], ROCKS_OBJ[i][r_Z]))
								{
									PLAYER_TEMP[playerid][py_MINING] = true;
									StartMining(playerid, i);
									return 1;
								}
							}
						}
					}
				}
			}

			// Drop rock (finished miner job)
			if (PLAYER_TEMP[playerid][py_ROCK])
			{
				for(new i = 0; i != sizeof DROP_ROCK_POS; i ++)
				{
					if (IsPlayerInRangeOfPoint(playerid, 1.8, DROP_ROCK_POS[i][mp_X], DROP_ROCK_POS[i][mp_Y], DROP_ROCK_POS[i][mp_Z]))
					{
						if (DropPlayerRock(playerid, i))
						{
							PLAYER_TEMP[playerid][py_ROCK] = false;
							PLAYER_TEMP[playerid][py_MINING] = false;
							SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
							ApplyAnimation(playerid, "CARRY", "PUTDWN", 4.1, false, false, false, false, 0, false);
							RemovePlayerAttachedObject(playerid, 9);
							PayPlayerMiner(playerid);
							EquipItemByType(playerid, 52);
						}
						else return ShowPlayerMessage(playerid, "~r~La procesadora no se encuentra estable para~n~trabajar. Pulse ENTER para arreglarla.", 4);
					}	
				}
			}
		}

		if (PLAYER_TEMP[playerid][py_SELFIE])
		{
			PLAYER_TEMP[playerid][py_SELFIE] = false;
			TogglePlayerControllableEx(playerid, true);
			SetCameraBehindPlayer(playerid);
			ApplyAnimation(playerid, "PED", "ATM", 4.1, 0, 1, 1, 0, 1, 1);
			return 1;
		}

		if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		{
			CheckStallPoint(playerid);

			for(new i = 0; i != MAX_DROP_ITEMS; i ++)
			{
				if (DROP_ITEMS[i][itm_VALID])
				{
					new Float:x, Float:y, Float:z; 
					Streamer_GetFloatData(STREAMER_TYPE_OBJECT, DROP_ITEMS[i][itm_ID], E_STREAMER_X, x);
					Streamer_GetFloatData(STREAMER_TYPE_OBJECT, DROP_ITEMS[i][itm_ID], E_STREAMER_Y, y);
					Streamer_GetFloatData(STREAMER_TYPE_OBJECT, DROP_ITEMS[i][itm_ID], E_STREAMER_Z, z);

					if (GetPlayerInterior(playerid) == DROP_ITEMS[i][itm_INTERIOR])
					{
						if (GetPlayerVirtualWorld(playerid) == DROP_ITEMS[i][itm_WORLD])
						{
							if (IsPlayerInRangeOfPoint(playerid, 1.5, x, y, z))
							{
								if (DROP_ITEMS[i][itm_TYPE] == 64)
								{
									ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 1000, true);

									new gift = random(10);

									switch(gift)
									{
										case 4:
										{
											new DB_Query[164], hycoins = minrand(1, 5);

											ACCOUNT_INFO[playerid][ac_SD] += hycoins;

											format(DB_Query, sizeof DB_Query, "UPDATE `CUENTA` SET `SD` = '%d' WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_ID]);
											db_free_result(db_query(Database, DB_Query));

											format(DB_Query, sizeof(DB_Query), "~g~[HYCOINS]~w~ Has encontrado %d Hycoins", hycoins);
											ShowPlayerMessage(playerid, DB_Query, 4);
										}
										default:
										{
											GivePlayerCash(playerid, minrand(1000, 5000), false);
										}
									}

									DeleteDropItem(i);
									return 1;
								}

								if (PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] >= 15) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);

								new free_slot = inv_GetFreeSlot(playerid);
								if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);

								DROP_ITEMS[i][itm_VALID] = false;

								new item_name[84];
								format(item_name, sizeof(item_name), "~n~~n~~n~~w~%s", DROP_ITEMS[i][itm_NAME]);
								GameTextForPlayer(playerid, TextToSpanish(item_name), 2000, 5);

								ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 1000, true);
								GrabItem(playerid, DROP_ITEMS[i][itm_TYPE], DROP_ITEMS[i][itm_AMMOUNT], DROP_ITEMS[i][itm_COLOR]);
								DeleteDropItem(i);
								if (PLAYER_TEMP[playerid][py_PLAYER_IN_INV]) ShowInventory(playerid);
								return 1;
							}
						}
					}
				}
			}
		}
	}

	if (PRESSED( KEY_HANDBRAKE | KEY_NO ))
    {
		SetVehicleLightsAction(playerid);
		return 1;
	}
	else if (PRESSED( KEY_NO ))
    {
    	if (PLAYER_MISC[playerid][MISC_GAMEMODE] == 0)
    	{
    		if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_WOODCUTTER) ShowInventory(playerid);
    	}
	}

	if (PRESSED( KEY_SPRINT | KEY_YES ))
    {
		CheckPlayerDoors(playerid);
		return 1;
	}

	if (PRESSED( KEY_SPRINT ))
	{
		//printf("KEY_SPRINT 1");
		if (PLAYER_TEMP[playerid][py_FISHING] && PLAYER_WORKS[playerid][WORK_FISHER])
		{
			//printf("KEY_SPRINT 2");
			ManualUpdateFish(playerid);
			//printf("KEY_SPRINT 3");
		}

		//printf("KEY_SPRINT 4");
		if (PLAYER_TEMP[playerid][py_EDITING_MODE])
    	{
    		//printf("KEY_SPRINT 5");
    		new Float:x, Float:y, Float:z;
    		if (PLAYER_TEMP[playerid][py_EDITING_MODE_TYPE] == 0)
    		{
    			//printf("KEY_SPRINT 6");
				GetDynamicObjectPos(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y, z);
				SetDynamicObjectPos(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y, z - 0.1);
				SetPlayerCameraLookAt(playerid, x, y, z);
				//printf("KEY_SPRINT 7");
			}
			//printf("KEY_SPRINT 8");
		}
		//printf("KEY_SPRINT 9");
	}

	if (PRESSED( KEY_SUBMISSION ))
    {
    	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    	{
    		ShowDialog(playerid, DIALOG_VEHICLE_OPTIONS);
    	}
    	else if (GetPlayerState(playerid) == PLAYER_STATE_PASSENGER)
    	{
    		ShowDialog(playerid, DIALOG_PASSENGER_OPTIONS);
    	}
    }

	if (PRESSED( KEY_CTRL_BACK ))
    {
		ShowPropertyOptions(playerid);
		CheckClubOptions(playerid);
		CheckCraneSiteRequest(playerid);
		ShellingThings(playerid);
		CheckTrashJobSite(playerid);
		CheckMedicJobSite(playerid);
		//CheckAndReload(playerid);
		OpenMafiaDoor(playerid);

		if (PLAYER_TEMP[playerid][py_EDITING_MODE])
    	{
    		if (PLAYER_TEMP[playerid][py_EDITING_MODE_TYPE] == 0) SetEditModeType(playerid, 1);
    		else SetEditModeType(playerid, 0);
    	}
	}

	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_WOODCUTTER)
	{
		if (PRESSED( KEY_ANALOG_UP  ))
		{
			if (IsPlayerInAnyVehicle(playerid)) return 0;
			inv_AccommodateItems(playerid, false);
			ClickInventorySlot(playerid, 6, true);
		}

		if (PRESSED( KEY_ANALOG_DOWN  ))
		{
			if (IsPlayerInAnyVehicle(playerid)) return 0;
			inv_AccommodateItems(playerid, false);
			ClickInventorySlot(playerid, 5, true);
		}

		if (PRESSED( KEY_ANALOG_LEFT  ))
		{
			if (IsPlayerInAnyVehicle(playerid)) return 0;
			inv_AccommodateItems(playerid, false);
			ClickInventorySlot(playerid, 10, true);
		}

		if (PRESSED( KEY_ANALOG_RIGHT  ))
		{
			if (IsPlayerInAnyVehicle(playerid)) return 0;
			inv_AccommodateItems(playerid, false);
			ClickInventorySlot(playerid, 2, true);
		}
	}

	if (PRESSED(KEY_FIRE))
	{
		if (GetPlayerVirtualWorld(playerid) == 0 && GetPlayerInterior(playerid) == 0)
		{
			if (GetPlayerWeapon(playerid) == 41)
			{
				if (PLAYER_CREW[playerid][player_crew_VALID])
				{
					if (!PLAYER_WORKS[playerid][WORK_POLICE] && !PLAYER_TEMP[playerid][py_WORKING_IN])
					{
						for(new i = 0; i < sizeof GRAFFITIS_OBJ; i ++)
						{
							if (IsPlayerInRangeOfPoint(playerid, 3.0, GRAFFITIS_OBJ[i][g_X], GRAFFITIS_OBJ[i][g_Y], GRAFFITIS_OBJ[i][g_Z]))
							{
								if (GRAFFITIS_OBJ[i][g_ACTIVATED])
								{
									if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return 0;
									PLAYER_TEMP[playerid][py_TIMERS][41] = SetTimerEx("UpdateGraffitiProgress", 1000, 1, "i", playerid);
								}
							}
						}
					}
				}
			}
		}

		if (PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] != 9999)
		{
			if (GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_SMOKE_CIGGY &&  PLAYER_VISUAL_INV[playerid][slot_TYPE][ PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] ] == 54)
			{
				if ((gettime() - PLAYER_TEMP[playerid][py_LIMIT_JOINT]) > 2)
				{
					PLAYER_TEMP[playerid][py_JOINT_USES] ++;
					GivePlayerHealthEx(playerid, 3.0);

					if (PLAYER_TEMP[playerid][py_JOINT_USES] > 10)
					{
						PLAYER_TEMP[playerid][py_JOINT_USES] = 0;
						PLAYER_MISC[playerid][MISC_JOINT] --;
						ResetItemBody(playerid);
						ShowPlayerMessage(playerid, "~r~Porro acabado", 3);
					}
					PLAYER_TEMP[playerid][py_LIMIT_JOINT] = gettime();
				}
			}
		}
	}
	else if (RELEASED(KEY_FIRE))
	{
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][41]);
	}

	if (PRESSED( KEY_CROUCH ))
	{
		if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			if (PLAYER_TEMP[playerid][py_GAME_STATE] == GAME_STATE_NORMAL)
			{
				for(new i = 0; i != sizeof San_Andreas_Barriers; i ++)
				{
					if (IsPlayerInRangeOfPoint(playerid, 15.0, San_Andreas_Barriers[i][barrier_X], San_Andreas_Barriers[i][barrier_Y], San_Andreas_Barriers[i][barrier_Z]))
					{
						if (GetPlayerInterior(playerid) == San_Andreas_Barriers[i][barrier_INTERIOR] && GetPlayerVirtualWorld(playerid) == San_Andreas_Barriers[i][barrier_WORLD])
						{
							if (San_Andreas_Barriers[i][barrier_VEHICLE_TYPE] == VEHICLE_TYPE_WORK)
							{
								if (!PLAYER_WORKS[playerid][WORK_POLICE] && PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE)
								{
									if (!PLAYER_WORKS[playerid][ San_Andreas_Barriers[i][barrier_VEHICLE_TYPE_IN] ]) break;
								}
							}
							if (IsDynamicObjectMoving(San_Andreas_Barriers[i][barrier_OBJECT_ID]) && !San_Andreas_Barriers[i][barrier_CLOSING]) break;

							KillTimer(San_Andreas_Barriers[i][barrier_TIMER]);
							San_Andreas_Barriers[i][barrier_TIMER] = SetTimerEx("CloseBarrier", 5000, false, "i", i);
							MoveDynamicObject(San_Andreas_Barriers[i][barrier_OBJECT_ID], San_Andreas_Barriers[i][barrier_X], San_Andreas_Barriers[i][barrier_Y], San_Andreas_Barriers[i][barrier_Z] + 0.72967 + 0.01, 0.0065, 0.0, 0.0, San_Andreas_Barriers[i][barrier_ROTATION]);
							San_Andreas_Barriers[i][barrier_CLOSING] = false;
							break;
						}
						else break;
					}
				}

				if (PLAYER_WORKS[playerid][WORK_POLICE])
				{
					if (GetPlayerInterior(playerid) == 0 && GetPlayerVirtualWorld(playerid) == 0)
					{
						for(new i = 0; i != sizeof POLICE_GARAGE_DOORS; i ++)
						{
							if (IsPlayerInRangeOfPoint(playerid, 20.0, POLICE_GARAGE_DOORS[i][police_gdoor_CLOSED_X], POLICE_GARAGE_DOORS[i][police_gdoor_CLOSED_Y], POLICE_GARAGE_DOORS[i][police_gdoor_CLOSED_Z]))
							{
								if (IsDynamicObjectMoving(POLICE_GARAGE_DOORS[i][police_gdoor_OBJECT_ID]) && !POLICE_GARAGE_DOORS[i][police_gdoor_CLOSING]) break;

								KillTimer(POLICE_GARAGE_DOORS[i][police_gdoor_TIMER]);
								POLICE_GARAGE_DOORS[i][police_gdoor_TIMER] = SetTimerEx("ClosePoliceGarageDoor", 5000, false, "i", i);
								MoveDynamicObject(POLICE_GARAGE_DOORS[i][police_gdoor_OBJECT_ID], POLICE_GARAGE_DOORS[i][police_gdoor_OPENED_X], POLICE_GARAGE_DOORS[i][police_gdoor_OPENED_Y], POLICE_GARAGE_DOORS[i][police_gdoor_OPENED_Z], POLICE_GARAGE_DOORS[i][police_gdoor_MOVE_SPEED], POLICE_GARAGE_DOORS[i][police_gdoor_OPENED_RX], POLICE_GARAGE_DOORS[i][police_gdoor_OPENED_RY], POLICE_GARAGE_DOORS[i][police_gdoor_OPENED_RZ]);
								POLICE_GARAGE_DOORS[i][police_gdoor_CLOSING] = false;
								break;
							}
						}
					}
				}

				OpenMafiaDoor(playerid);
			}

			CheckMechanicMenu(playerid);
			CheckTruckPointAndLoad(playerid);
			CheckHeliPort(playerid);
		}

		if (GetPlayerState(playerid == PLAYER_STATE_ONFOOT))
		{
			if (PLAYER_MISC[playerid][MISC_CONFIG_FP])
			{
				if (GetPlayerAnimationIndex(playerid == 1274))
				{
					SetFirstPersonPos(playerid, 0.0, 0.36, 0.0);
					KillTimer(PLAYER_TEMP[playerid][py_TIMERS][40]);
					PLAYER_TEMP[playerid][py_TIMERS][40] = SetTimerEx("CheckCrunchAnimation", 500, true, "i", playerid);
				}
			}
		}

		if (PLAYER_TEMP[playerid][py_EDITING_MODE])
    	{
    		new Float:x, Float:y, Float:z;
    		if (PLAYER_TEMP[playerid][py_EDITING_MODE_TYPE] == 0)
    		{
				GetDynamicObjectPos(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y, z);
				SetDynamicObjectPos(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y, z + 0.1);
				SetPlayerCameraLookAt(playerid, x, y, z);
			}
		}

		if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK)
		{
			if (!PLAYER_TEMP[playerid][py_CUFFED])
			{
				if (PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] == 0)
				{
					ShowDialog(playerid, DIALOG_DEATH);
				}
			}
		}

		CheckMarketAttack(playerid);
		GrabPlant(playerid);
		return 1;
	}

	// CBUG
	/*if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
	{
		if ((newkeys & (KEY_FIRE | KEY_CROUCH)) == (KEY_FIRE | KEY_CROUCH) && (oldkeys & (KEY_FIRE | KEY_CROUCH)) != (KEY_FIRE | KEY_CROUCH))
	    {
	    	ApplyAnimation(playerid, "GYMNASIUM", "gym_tread_falloff", 1.0, 0, 0, 0, 0, 0);
	    }

	    if ((newkeys & KEY_CROUCH) && !((newkeys & KEY_FIRE) || (newkeys & KEY_HANDBRAKE)) && GetPlayerSpecialAction(playerid) != SPECIAL_ACTION_DUCK )
	    {
	    	ApplyAnimation(playerid, "GYMNASIUM", "gym_tread_falloff", 1.0, 0, 0, 0, 0, 0);
	    }
	}*/

	if (newkeys & KEY_HANDBRAKE && !IsPlayerInAnyVehicle(playerid)) PLAYER_TEMP[playerid][py_AIM_DATA] = 1;
	else if (oldkeys & KEY_HANDBRAKE) PLAYER_TEMP[playerid][py_AIM_DATA] = 0;
	return 1;
}

public OnPlayerGiveDamageDynamicActor(playerid, STREAMER_TAG_ACTOR:actorid, Float:amount, weaponid, bodypart)
{
	if (!IsDynamicActorInvulnerable(actorid))
	{
		new
			Float:actual_health,
			Float:new_health,
			type
		;

		type = Streamer_GetIntData(STREAMER_TYPE_ACTOR, actorid, E_STREAMER_EXTRA_ID);
		GetDynamicActorHealth(actorid, actual_health);

		//new_health = actual_health - (amount / 2);
		new_health = (actual_health - amount);
		if (new_health <= 0.0)
		{
			// Death
			new_health = 0.0;

			ActorBloodParticle(actorid);
			ApplyDynamicActorAnimation(actorid, "WUZI", "CS_Dead_Guy", 4.0, 1, 1, 1, 0, 0);

			switch(type)
			{
				case ACTOR_TYPE_SHOP:
				{
					SetPlayerPoliceSearchLevel(playerid, PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] + 2);
					format(PLAYER_TEMP[playerid][py_POLICE_REASON], 32, "Homicidio");
					ShowPlayerMessage(playerid, "~b~Has cometido un crimen: Homicidio", 5);	
				}
			}

			SetTimerEx("RespawnDynamicActor", 120000, false, "id", actorid, type);
			SetDynamicActorInvulnerable(actorid, true);
		}
		
		SetDynamicActorHealth(actorid, new_health);
		//SendClientMessageEx(playerid, -1, "amount: %f, actual: %f, new: %f", amount, actual_health, new_health);
	}
	return 1;
}

public OnPlayerUpdate(playerid)
{
	g_iPlayerLastUpdate[playerid] = GetTickCount();

	if (PLAYER_TEMP[playerid][py_KICKED]) return 1;
	if (PLAYER_TEMP[playerid][py_GAME_STATE] != GAME_STATE_NORMAL) return 1;
	if (!PLAYER_TEMP[playerid][py_USER_LOGGED]) return 0;

	new player_state = GetPlayerState(playerid);
	if (player_state == PLAYER_STATE_SPAWNED || player_state == PLAYER_STATE_SPECTATING) return 1;

	new 
		player_action = GetPlayerSpecialAction(playerid),
		current_gettime = gettime()
	;

	if (ac_Info[CHEAT_JETPACK][ac_Enabled])
	{
		if (player_action == SPECIAL_ACTION_USEJETPACK)
		{
			if (current_gettime > PLAYER_AC_INFO[playerid][CHEAT_JETPACK][p_ac_info_IMMUNITY])
			{
				if (!ac_Info[CHEAT_JETPACK][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_JETPACK);
				else
				{
					if (current_gettime - PLAYER_AC_INFO[playerid][CHEAT_JETPACK][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_JETPACK][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_JETPACK][p_ac_info_DETECTIONS] = 0;
					else PLAYER_AC_INFO[playerid][CHEAT_JETPACK][p_ac_info_DETECTIONS] ++;

					PLAYER_AC_INFO[playerid][CHEAT_JETPACK][p_ac_info_LAST_DETECTION] = current_gettime;
					if (PLAYER_AC_INFO[playerid][CHEAT_JETPACK][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_JETPACK][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_JETPACK);
				}
			}
		}
	}

	new Float:dis, Float:vehicle_health, vehicleid = GetPlayerVehicleID(playerid);
	if (!vehicleid) dis = GetPlayerDistanceFromPoint(playerid, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2]);
	else
	{
		dis = GetVehicleDistanceFromPoint(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][0], GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][1], GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][2]);
		GetVehicleHealth(vehicleid, vehicle_health);
	}

	if (ac_Info[CHEAT_UNOCCUPIED_VEHICLE_TP][ac_Enabled] && vehicleid && player_state == PLAYER_STATE_PASSENGER)
	{
		if (floatabs(dis) > 20.0)
		{
			if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] == INVALID_PLAYER_ID)
			{
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_TP_IMMUNITY] = current_gettime + 5;
			}
		}
	}

	if (ac_Info[CHEAT_HIGH_POS][ac_Enabled])
	{
		if (current_gettime > PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY])
		{
			if (floatabs(dis) > 43.0 && CHARACTER_INFO[playerid][ch_POS][2] > -97.0)
			{
				if (player_state != PLAYER_STATE_PASSENGER)
				{
					if (!ac_Info[CHEAT_HIGH_POS][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_HIGH_POS, dis);
					else
					{
						if (current_gettime - PLAYER_AC_INFO[playerid][CHEAT_HIGH_POS][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_HIGH_POS][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_HIGH_POS][p_ac_info_DETECTIONS] = 0;
						else PLAYER_AC_INFO[playerid][CHEAT_HIGH_POS][p_ac_info_DETECTIONS] ++;

						PLAYER_AC_INFO[playerid][CHEAT_HIGH_POS][p_ac_info_LAST_DETECTION] = current_gettime;
						if (PLAYER_AC_INFO[playerid][CHEAT_HIGH_POS][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_HIGH_POS][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_HIGH_POS, dis);
					}
				}
			}
		}
	}

	switch(player_state)
	{
		case PLAYER_STATE_ONFOOT:
		{
			if (ac_Info[CHEAT_PLAYER_SPEED][ac_Enabled])
			{
				if (current_gettime > PLAYER_AC_INFO[playerid][CHEAT_PLAYER_SPEED][p_ac_info_IMMUNITY])
				{
					new Float:speed = GetPlayerSpeed(playerid);
					if (speed > 700.0)
					{
						if (!ac_Info[CHEAT_PLAYER_SPEED][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_PLAYER_SPEED, speed);
						else
						{
							if (current_gettime - PLAYER_AC_INFO[playerid][CHEAT_PLAYER_SPEED][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_PLAYER_SPEED][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_PLAYER_SPEED][p_ac_info_DETECTIONS] = 0;
							else PLAYER_AC_INFO[playerid][CHEAT_PLAYER_SPEED][p_ac_info_DETECTIONS] ++;

							PLAYER_AC_INFO[playerid][CHEAT_PLAYER_SPEED][p_ac_info_LAST_DETECTION] = current_gettime;
							if (PLAYER_AC_INFO[playerid][CHEAT_PLAYER_SPEED][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_PLAYER_SPEED][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_PLAYER_SPEED, speed);
						}
					}
				}
			}

			if (ac_Info[CHEAT_POS][ac_Enabled])
			{
				if (current_gettime > PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY])
				{
					if (GetPlayerSurfingVehicleID(playerid) == INVALID_VEHICLE_ID && GetPlayerSurfingObjectID(playerid) == INVALID_OBJECT_ID && player_action != SPECIAL_ACTION_ENTER_VEHICLE && player_action != SPECIAL_ACTION_EXIT_VEHICLE)
					{
						if (floatabs(dis) > 6.0 && CHARACTER_INFO[playerid][ch_POS][2] > -97.0)
						{
							if (!ac_Info[CHEAT_POS][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_POS, dis);
							else
							{
								if (current_gettime - PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_POS][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_DETECTIONS] = 0;
								else PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_DETECTIONS] ++;

								PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_LAST_DETECTION] = current_gettime;
								if (PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_POS][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_POS, dis);
							}
						}
					}
				}
			}
		}

		case PLAYER_STATE_DRIVER:
		{
			new Float:Vehicle_Speed = GetVehicleSpeed(vehicleid);

			if (ac_Info[CHEAT_VEHICLE_SPEED_HACK][ac_Enabled])
			{
				if (current_gettime > PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_SPEED_HACK][p_ac_info_IMMUNITY])
				{
					if (Vehicle_Speed > 900.0)
					{
						if (!ac_Info[CHEAT_VEHICLE_SPEED_HACK][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_VEHICLE_SPEED_HACK);
						else
						{
							if (current_gettime - PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_SPEED_HACK][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_VEHICLE_SPEED_HACK][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_SPEED_HACK][p_ac_info_DETECTIONS] = 0;
							else PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_SPEED_HACK][p_ac_info_DETECTIONS] ++;

							PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_SPEED_HACK][p_ac_info_LAST_DETECTION] = current_gettime;
							if (PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_SPEED_HACK][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_VEHICLE_SPEED_HACK][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_VEHICLE_SPEED_HACK);
						}
					}
				}
			}

			if (ac_Info[CHEAT_VEHICLE_HEALTH][ac_Enabled])
			{
				if (vehicle_health > (GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] + 20.0))
				{
					if (current_gettime > PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_HEALTH][p_ac_info_IMMUNITY])
					{
						if (!ac_Info[CHEAT_VEHICLE_HEALTH][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_VEHICLE_HEALTH, (GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] + 5.0) - vehicle_health);
						else
						{
							if (current_gettime - PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_HEALTH][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_VEHICLE_HEALTH][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_HEALTH][p_ac_info_DETECTIONS] = 0;
							else PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_HEALTH][p_ac_info_DETECTIONS] ++;

							PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_HEALTH][p_ac_info_LAST_DETECTION] = current_gettime;
							if (PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_HEALTH][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_VEHICLE_HEALTH][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_VEHICLE_HEALTH);
						}
					}
				}
			}

			if (ac_Info[CHEAT_POS][ac_Enabled])
			{
				if (current_gettime > PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY])
				{
					if (Vehicle_Speed < 20.0 && floatabs(dis) >= 10.0 && GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][2] > -97.0)
					{
						if (!ac_Info[CHEAT_POS][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_POS, dis);
						else
						{
							if (current_gettime - PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_POS][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_DETECTIONS] = 0;
							else PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_DETECTIONS] ++;

							PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_LAST_DETECTION] = current_gettime;
							if (PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_POS][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_POS, dis);
						}
					}
				}
			}

			if (ac_Info[CHEAT_VEHICLE_NOFUEL][ac_Enabled])
			{
				new Keys, ud, lr;
				GetPlayerKeys(playerid, Keys, ud, lr);
				if (Keys == KEY_SPRINT)
				{
					//printf("sprint %d 4",playerid);
					if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] && Vehicle_Speed > 60.0 && GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][2] > -97.0 && VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400][vehicle_info_ENGINE])
					{
						//printf("sprint %d 5",playerid);
						if (current_gettime > PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_NOFUEL][p_ac_info_IMMUNITY])
						{
							//printf("sprint %d 6",playerid);
							if (!ac_Info[CHEAT_VEHICLE_NOFUEL][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_VEHICLE_NOFUEL);
							else
							{	
								//printf("sprint %d 7",playerid);
								if (current_gettime - PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_NOFUEL][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_VEHICLE_NOFUEL][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_NOFUEL][p_ac_info_DETECTIONS] = 0;
								else PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_NOFUEL][p_ac_info_DETECTIONS] ++;

								PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_NOFUEL][p_ac_info_LAST_DETECTION] = current_gettime;
								if (PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_NOFUEL][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_VEHICLE_NOFUEL][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_VEHICLE_NOFUEL);
							}
						}
					}
				}
			}
		}
	}

	GetPlayerPos(playerid, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2]);
	if (vehicleid)
	{
		GetVehiclePos(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][0], GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][1], GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][2]);
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = vehicle_health;
	}

	new 
		Keys,
		ud,
		lr,
		Float:x, Float:y, Float:z
	;

    GetPlayerKeys(playerid, Keys, ud, lr);

    if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK)
	{
		if (!PLAYER_TEMP[playerid][py_IN_INJURED_ANIMATION])
		{
			switch(ud)
			{
				case KEY_UP:
	    		{
					ApplyAnimation(playerid, "PED", "CAR_CRAWLOUTRHS", 4.1, false, true, true, false, 0, false);
					SetPlayerFacingAngle(playerid, CameraLookToAngle(playerid) + 90.0);

					PLAYER_TEMP[playerid][py_IN_INJURED_ANIMATION] = true;
					SetTimerEx("InjuredAnimationCut", 470, false, "i", playerid);
				}
			}
		}
    }

    if (PLAYER_TEMP[playerid][py_EDITING_MODE])
    {
    	switch(ud)
    	{
	    	case KEY_UP:
			{
				if (PLAYER_TEMP[playerid][py_EDITING_MODE_TYPE] == 0)
				{
					GetDynamicObjectPos(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y, z);
					SetDynamicObjectPos(PLAYER_TEMP[playerid][py_EDITING_OBJ], x + 0.1, y, z);
					SetPlayerCameraLookAt(playerid, x, y, z);
				}
				else
				{
					GetDynamicObjectRot(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y, z);
					SetDynamicObjectRot(PLAYER_TEMP[playerid][py_EDITING_OBJ], x + 3.0, y, z);
				}
			}

			case KEY_DOWN:
		    {
		    	if (PLAYER_TEMP[playerid][py_EDITING_MODE_TYPE] == 0)
		    	{
					GetDynamicObjectPos(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y, z);
					SetDynamicObjectPos(PLAYER_TEMP[playerid][py_EDITING_OBJ], x - 0.1, y, z);
					SetPlayerCameraLookAt(playerid, x, y, z);
				}
				else
				{
					GetDynamicObjectRot(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y, z);
					SetDynamicObjectRot(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y + 3.0, z);
				}
		    }
		}

		switch(lr)
		{
			case KEY_LEFT:
			{
				if (PLAYER_TEMP[playerid][py_EDITING_MODE_TYPE] == 0)
				{
					GetDynamicObjectPos(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y, z);
					SetDynamicObjectPos(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y + 0.1, z);
					SetPlayerCameraLookAt(playerid, x, y, z);
				}
				else
				{
					GetDynamicObjectRot(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y, z);
					SetDynamicObjectRot(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y, z - 1.5);
				}
			}

			case KEY_RIGHT:
			{
				if (PLAYER_TEMP[playerid][py_EDITING_MODE_TYPE] == 0)
				{
					GetDynamicObjectPos(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y, z);
					SetDynamicObjectPos(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y - 0.1, z);
					SetPlayerCameraLookAt(playerid, x, y, z);
				}
				else
				{
					GetDynamicObjectRot(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y, z);
					SetDynamicObjectRot(PLAYER_TEMP[playerid][py_EDITING_OBJ], x, y, z + 1.5);
				}
			}
		}
    }

    CheckRobActor(playerid);
	//SendClientMessageEx(playerid, -1, "%d", GetPlayerAnimationIndex(playerid));
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerStateChange %d %d %d",playerid, newstate, oldstate); // debug juju
	#endif

	if (PLAYER_TEMP[playerid][py_KICKED]) return 1;

	switch(oldstate)
	{
		case PLAYER_STATE_PASSENGER, PLAYER_STATE_DRIVER:
		{
			if (PLAYER_MISC[playerid][MISC_CONFIG_FP]) SetFirstPerson(playerid, true);
			PLAYER_TEMP[playerid][py_VEHICLEID] = -1;
		}
	}

	if (PLAYER_TEMP[playerid][py_GAME_STATE] == GAME_STATE_NORMAL)
	{
		if (newstate != PLAYER_STATE_SPAWNED && oldstate != PLAYER_STATE_SPAWNED)
		{
			if (ac_Info[CHEAT_STATE_SPAMMER][ac_Enabled])
			{
				if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_IMMUNITY])
				{
					new interval = GetTickDiff(GetTickCount(), PLAYER_TEMP[playerid][py_ANTIFLOOD_STATE]);

					if (interval < 50)
					{
						if (!ac_Info[CHEAT_STATE_SPAMMER][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_STATE_SPAMMER, float(interval));
						else
						{
							if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_STATE_SPAMMER][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_DETECTIONS] = 0;
							else PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_DETECTIONS] ++;

							PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_LAST_DETECTION] = gettime();
							if (PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_STATE_SPAMMER][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_STATE_SPAMMER, float(interval));
						}
					}
					PLAYER_TEMP[playerid][py_ANTIFLOOD_STATE] = GetTickCount();
				}
			}
		}
	}

    if (newstate == PLAYER_STATE_DRIVER)
    {
		new vehicleid = GetPlayerVehicleID(playerid);
		if (ac_Info[CHEAT_CAR_JACKING][ac_Enabled])
		{
			if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_OCCUPIED] && GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] != INVALID_PLAYER_ID)
			{
				if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_CAR_JACKING][p_ac_info_IMMUNITY])
				{
					if (!ac_Info[CHEAT_CAR_JACKING][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_CAR_JACKING);
					else
					{
						if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_CAR_JACKING][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_CAR_JACKING][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_CAR_JACKING][p_ac_info_DETECTIONS] = 0;
						else PLAYER_AC_INFO[playerid][CHEAT_CAR_JACKING][p_ac_info_DETECTIONS] ++;

						PLAYER_AC_INFO[playerid][CHEAT_CAR_JACKING][p_ac_info_LAST_DETECTION] = gettime();
						if (PLAYER_AC_INFO[playerid][CHEAT_CAR_JACKING][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_CAR_JACKING][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_CAR_JACKING);
					}

					PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] = INVALID_VEHICLE_ID;
					return 1;
				}
			}
		}

		SetPlayerArmedWeapon(playerid, 0);
		PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_HEALTH][p_ac_info_IMMUNITY] = gettime() + 1;
		PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY] = gettime() + 3;
		PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] = vehicleid;

		GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] = playerid;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_LAST_DRIVER] = playerid;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_OCCUPIED] = true;

		if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_DOORS] && VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400][vehicle_info_DRIVER_DOOR]) //cerrado
		{
			if (gettime() - GLOBAL_VEHICLES[vehicleid][gb_vehicle_LAST_CLOSED_TIME] > 5) // Si el tiempo que paso desde que cerro es mayor a 5
			{
				if (ac_Info[CHEAT_PLAYER_VEHICLE_DOORS][ac_Enabled])
				{
					if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_DOORS][p_ac_info_IMMUNITY])
					{
						if (!ac_Info[CHEAT_PLAYER_VEHICLE_DOORS][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_PLAYER_VEHICLE_DOORS);
						else
						{
							if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_DOORS][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_PLAYER_VEHICLE_DOORS][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_DOORS][p_ac_info_DETECTIONS] = 0;
							else PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_DOORS][p_ac_info_DETECTIONS] ++;

							PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_DOORS][p_ac_info_LAST_DETECTION] = gettime();
							if (PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_DOORS][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_PLAYER_VEHICLE_DOORS][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_PLAYER_VEHICLE_DOORS);
						}
					}
				}
			}
		}

		switch(GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE])
		{
			case VEHICLE_TYPE_NONE:
			{
				if (!VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400][vehicle_info_ENGINE])
				{
					GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 1;
					UpdateVehicleParams(vehicleid);
				}
			}
			case VEHICLE_TYPE_SELL:
			{
				PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] = vehicleid;

				new DBResult:Result, DB_Query[120], player_vehicles;
				format(DB_Query, sizeof(DB_Query), "SELECT COUNT(`ID_USER`) AS `VEHICLES` FROM `PLAYER_VEHICLES` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
				Result = db_query(Database, DB_Query);
				if (db_num_rows(Result)) player_vehicles = db_get_field_assoc_int(Result, "VEHICLES");
				db_free_result(Result);


				if (player_vehicles >= MAX_SU_VEHICLES) return ShowPlayerMessage(playerid, "~r~No puedes comprar más vehículos, el limite es de 6.", 3);
				if (!ACCOUNT_INFO[playerid][ac_SU])
				{
					if (player_vehicles >= MAX_NU_VEHICLES)
					{
						ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP~w~ para tener más vehículos.", 4);
					    return 1;
					}
				}

				ShowDialog(playerid, DIALOG_BUY_VEHICLE);
				return 1;
			}
			case VEHICLE_TYPE_WORK:
			{
				if (!PLAYER_WORKS[playerid][ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ])
				{
					if (ac_Info[CHEAT_PLAYER_VEHICLE_WORK][ac_Enabled])
					{
						if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_IMMUNITY])
						{
							if (!ac_Info[CHEAT_PLAYER_VEHICLE_WORK][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_PLAYER_VEHICLE_WORK);
							else
							{
								if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_PLAYER_VEHICLE_WORK][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_DETECTIONS] = 0;
								else PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_DETECTIONS] ++;

								PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_LAST_DETECTION] = gettime();
								if (PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_PLAYER_VEHICLE_WORK][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_PLAYER_VEHICLE_WORK);
							}
						}
					}
					return 1;
				}

				if (PLAYER_TEMP[playerid][py_WORKING_IN] && PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_VEHICLES[vehicleid][work_vehicle_WORK])
				{
					if (ac_Info[CHEAT_PLAYER_VEHICLE_WORK][ac_Enabled])
					{
						if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_IMMUNITY])
						{
							if (!ac_Info[CHEAT_PLAYER_VEHICLE_WORK][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_PLAYER_VEHICLE_WORK);
							else
							{
								if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_PLAYER_VEHICLE_WORK][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_DETECTIONS] = 0;
								else PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_DETECTIONS] ++;

								PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_LAST_DETECTION] = gettime();
								if (PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_PLAYER_VEHICLE_WORK][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_PLAYER_VEHICLE_WORK);
							}
						}
					}
					return 1;
				}

				if (WORK_VEHICLES[vehicleid][work_vehicle_NEED_DUTY])
				{
					if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_VEHICLES[vehicleid][work_vehicle_WORK])
					{
						if (ac_Info[CHEAT_PLAYER_VEHICLE_WORK][ac_Enabled])
						{
							if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_IMMUNITY])
							{
								if (!ac_Info[CHEAT_PLAYER_VEHICLE_WORK][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_PLAYER_VEHICLE_WORK);
								else
								{
									if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_PLAYER_VEHICLE_WORK][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_DETECTIONS] = 0;
									else PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_DETECTIONS] ++;

									PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_LAST_DETECTION] = gettime();
									if (PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_PLAYER_VEHICLE_WORK][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_PLAYER_VEHICLE_WORK);
								}
							}
						}
						return 1;
					}
				}

				if (WORK_VEHICLES[vehicleid][work_vehicle_EXP] > PLAYER_SKILLS[playerid][ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ])
				{
					if (ac_Info[CHEAT_PLAYER_VEHICLE_WORK][ac_Enabled])
					{
						if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_IMMUNITY])
						{
							if (!ac_Info[CHEAT_PLAYER_VEHICLE_WORK][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_PLAYER_VEHICLE_WORK);
							else
							{
								if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_PLAYER_VEHICLE_WORK][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_DETECTIONS] = 0;
								else PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_DETECTIONS] ++;

								PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_LAST_DETECTION] = gettime();
								if (PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_WORK][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_PLAYER_VEHICLE_WORK][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_PLAYER_VEHICLE_WORK);
							}
						}
					}
					return 1;
				}

				switch(WORK_VEHICLES[vehicleid][work_vehicle_WORK])
				{
					case WORK_HARVESTER: StartPlayerJob(playerid, WORK_VEHICLES[vehicleid][work_vehicle_WORK], vehicleid);
					case WORK_TRUCK:
					{
						if (TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADED])
						{
							if (TRUCK_VEHICLE[vehicleid][truck_vehicle_DRIVER_USER_ID] != ACCOUNT_INFO[playerid][ac_ID])
							{
							    ShowPlayerMessage(playerid, "~r~No eres el conductor de este camión.", 3);
								RemovePlayerFromVehicle(playerid);
								return 1;
							}
							else StartPlayerJob(playerid, WORK_VEHICLES[vehicleid][work_vehicle_WORK], vehicleid);
						}
						else StartPlayerJob(playerid, WORK_VEHICLES[vehicleid][work_vehicle_WORK], vehicleid);
					}
					case WORK_TRASH:
					{
						if (TRASH_VEHICLES[vehicleid][trash_vehicle_JOB_STARTED])
						{
							if (TRASH_VEHICLES[vehicleid][trash_vehicle_DRIVER_ID] != playerid)
							{
							    ShowPlayerMessage(playerid, "~r~No eres el conductor de este camión.", 3);
								RemovePlayerFromVehicle(playerid);
								return 1;
							}

							SetPlayerTrashCheckpoint(playerid, vehicleid);
						}
						else
						{
							if (PLAYER_TEMP[playerid][py_TRASH_DRIVER] || PLAYER_TEMP[playerid][py_TRASH_PASSENGER])
							{
						        ShowPlayerMessage(playerid, "~r~Ya estás trabajando con otro compañero.", 3);
								RemovePlayerFromVehicle(playerid);
								return 1;
							}

							PLAYER_TEMP[playerid][py_TRASH_DRIVER] = true;
							PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] = vehicleid;
							TRASH_VEHICLES[vehicleid][trash_vehicle_DRIVER_ID] = playerid;

							if (TRASH_VEHICLES[vehicleid][trash_vehicle_PASSENGER_ID] == INVALID_PLAYER_ID) ShowPlayerMessage(playerid, "~r~Necesitas un compañero para empezar a trabajar.", 3);
							else
							{
								new route = random(MAX_ROUTES);
								while(!TRASH_OBJECTS[route][trash_route_VALID])
								{
									route = random(MAX_ROUTES);
								}

								TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_JOB_STARTED] = true;
								TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_ROUTE] = route;
								TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_CP] = 0;

								SetPlayerTrashCheckpoint(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);
								SetPlayerTrashCheckpoint(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);

								CreatePlayerTrashRouteObjects(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], route);
								CreatePlayerTrashRouteObjects(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], route);

								ShowPlayerNotification(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], "Ruta asignada.", 2);
								ShowPlayerNotification(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], "Ruta asignada.", 2);
							}
						}
					}
				}
			}
		}
		if (VEHICLE_INFO[GetVehicleModel(vehicleid) - 400][vehicle_info_VALID] && !PLAYER_TEMP[playerid][py_IN_TUNING_GARAGE]) ShowPlayerSpeedoMeter(playerid);

		if (PLAYER_TEMP[playerid][py_WANT_MECHANIC])
		{
			if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] == VEHICLE_STATE_NORMAL)
			{
				PLAYER_TEMP[playerid][py_WANT_MECHANIC] = false;
				DisablePlayerMechanicMark(playerid);

				ShowPlayerMessage(playerid, "Tu mecánico se ha cancelado porque te has subido a un vehículo.", 3);
			}
		}

		if (PLAYER_MISC[playerid][MISC_CONFIG_FP]) SetFirstPerson(playerid, false);
    }
	else if (newstate == PLAYER_STATE_PASSENGER)
	{
		//drive-by
		if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE)
		{
			SetPlayerArmedWeapon(playerid, 0);
		}

		PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY] = gettime() + 3;

		new vehicleid = GetPlayerVehicleID(playerid);
		PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] = vehicleid;

		if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_DOORS] && VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400][vehicle_info_PASSENGER_DOOR]) //cerrado
		{
			if (gettime() - GLOBAL_VEHICLES[vehicleid][gb_vehicle_LAST_CLOSED_TIME] > 5) // Si el tiempo que paso desde que cerro es mayor a 5
			{
				if (ac_Info[CHEAT_PLAYER_VEHICLE_DOORS][ac_Enabled])
				{
					if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_DOORS][p_ac_info_IMMUNITY])
					{
						if (!ac_Info[CHEAT_PLAYER_VEHICLE_DOORS][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_PLAYER_VEHICLE_DOORS);
						else
						{
							if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_DOORS][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_PLAYER_VEHICLE_DOORS][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_DOORS][p_ac_info_DETECTIONS] = 0;
							else PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_DOORS][p_ac_info_DETECTIONS] ++;

							PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_DOORS][p_ac_info_LAST_DETECTION] = gettime();
							if (PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_DOORS][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_PLAYER_VEHICLE_DOORS][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_PLAYER_VEHICLE_DOORS);
						}
					}
				}
			}
		}

		if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE] == VEHICLE_TYPE_WORK)
		{
			switch(WORK_VEHICLES[vehicleid][work_vehicle_WORK])
			{
				case WORK_TRASH:
				{
					if (!PLAYER_WORKS[playerid][WORK_TRASH])
					{
						new str_text[128];
						format(str_text, sizeof(str_text), "Necesitas ser %s para manejar este vehículo.", work_info[ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ][work_info_NAME]);
						ShowPlayerMessage(playerid, str_text, 3);
						RemovePlayerFromVehicle(playerid);
						return 1;
					}

					if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_TRASH)
					{
				        ShowPlayerMessage(playerid, "~r~No estás de servicio como basurero, ve a vestirte en el puesto de la entrada del vertedero.", 3);
						RemovePlayerFromVehicle(playerid);
						return 1;
					}

					if (TRASH_VEHICLES[vehicleid][trash_vehicle_JOB_STARTED])
					{
						if (TRASH_VEHICLES[vehicleid][trash_vehicle_PASSENGER_ID] != playerid)
						{
						    ShowPlayerMessage(playerid, "~r~No eres el acompañante de este camión.", 3);
							RemovePlayerFromVehicle(playerid);
							return 1;
						}

						SetPlayerTrashCheckpoint(playerid, vehicleid);
					}
					else
					{
						if (PLAYER_TEMP[playerid][py_TRASH_DRIVER] || PLAYER_TEMP[playerid][py_TRASH_PASSENGER])
						{
						    ShowPlayerMessage(playerid, "~r~Ya estás trabajando con otro compañero.", 3);
							RemovePlayerFromVehicle(playerid);
							return 1;
						}

						PLAYER_TEMP[playerid][py_TRASH_PASSENGER] = true;
						PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] = vehicleid;
						TRASH_VEHICLES[vehicleid][trash_vehicle_PASSENGER_ID] = playerid;

						if (TRASH_VEHICLES[vehicleid][trash_vehicle_DRIVER_ID] == INVALID_PLAYER_ID) ShowPlayerMessage(playerid, "~r~Necesitas un compañero para empezar a trabajar.", 3);
						else
						{
							new route = random(MAX_ROUTES);
							while(!TRASH_OBJECTS[route][trash_route_VALID])
							{
								route = random(MAX_ROUTES);
							}

							TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_JOB_STARTED] = true;
							TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_ROUTE] = route;
							TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_CP] = 0;

							SetPlayerTrashCheckpoint(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);
							SetPlayerTrashCheckpoint(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);

							CreatePlayerTrashRouteObjects(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], route);
							CreatePlayerTrashRouteObjects(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], route);

							ShowPlayerNotification(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], "Ruta asignada.", 3);
							ShowPlayerNotification(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], "Ruta asignada.", 3);
						}
					}
				}
			}
		}

		if (PLAYER_TEMP[playerid][py_WANT_MECHANIC])
		{
			if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] == VEHICLE_STATE_NORMAL)
			{
				PLAYER_TEMP[playerid][py_WANT_MECHANIC] = false;
				DisablePlayerMechanicMark(playerid);

				ShowPlayerMessage(playerid, "Tu mecánico se ha cancelado porque te has subido a un vehículo.", 3);
			}
		}

		if (PLAYER_MISC[playerid][MISC_CONFIG_FP]) SetFirstPerson(playerid, false);
	}
	else if (newstate == PLAYER_STATE_SPECTATING)
	{
		if (!PLAYER_TEMP[playerid][py_PLAYER_SPECTATE])
		{
			if (ac_Info[CHEAT_SPECTATE][ac_Enabled])
			{
				if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_SPECTATE][p_ac_info_IMMUNITY])
				{
					if (!ac_Info[CHEAT_SPECTATE][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_SPECTATE);
					else
					{
						if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_SPECTATE][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_SPECTATE][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_SPECTATE][p_ac_info_DETECTIONS] = 0;
						else PLAYER_AC_INFO[playerid][CHEAT_SPECTATE][p_ac_info_DETECTIONS] ++;

						PLAYER_AC_INFO[playerid][CHEAT_SPECTATE][p_ac_info_LAST_DETECTION] = gettime();
						if (PLAYER_AC_INFO[playerid][CHEAT_SPECTATE][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_SPECTATE][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_SPECTATE);
					}
				}
			}
		}
	}
	if (oldstate == PLAYER_STATE_DRIVER)
	{
		PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY] = gettime() + 3;
		if (PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] != INVALID_VEHICLE_ID)
		{
			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][7]);


			if (GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][gb_vehicle_ATTACHED_TO] != INVALID_VEHICLE_ID)
			{
				GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][gb_vehicle_ATTACHED_TO] = INVALID_VEHICLE_ID;
				DetachTrailerFromVehicle(PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID]);
			}

			GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][gb_vehicle_TP_IMMUNITY] = gettime() + 5;
			GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][gb_vehicle_DRIVER] = INVALID_PLAYER_ID;
			GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][gb_vehicle_LAST_DRIVER] = playerid;
			GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][gb_vehicle_OCCUPIED] = false;

			if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);
			HidePlayerSpeedoMeter(playerid);

			if (GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][gb_vehicle_TYPE] == VEHICLE_TYPE_WORK)
			{
                switch(WORK_VEHICLES[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][work_vehicle_WORK])
                {
                    case WORK_HARVESTER, WORK_TRUCK: EndPlayerJob(playerid);
                }
            }
			if (PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] == PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID])
			{
				if (PLAYER_TEMP[playerid][py_TRASH_DRIVER])
				{
					if (TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_JOB_STARTED])
					{
						if (TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID] == playerid) ShowPlayerMessage(playerid, "Si quieres dejar de trabajar ve al vertedero y ponte tu ropa.", 3);
					}
					else
					{
						TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID] = INVALID_PLAYER_ID;
						PLAYER_TEMP[playerid][py_TRASH_DRIVER] = false;
						PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] = INVALID_VEHICLE_ID;
					}
				}
			}
		}
	}
	else if (oldstate == PLAYER_STATE_PASSENGER)
	{
		if (PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] == PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID])
		{
			if (PLAYER_TEMP[playerid][py_TRASH_PASSENGER])
			{
				if (TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_JOB_STARTED])
				{
					if (TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID] == playerid)
					{
						if (TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_CP] >= TRASH_OBJECTS[ TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_ROUTE] ][trash_route_OBJECTS]) ShowPlayerMessage(playerid, "Sube al camión para volver al vertedero y recibir la paga.", 3);
						else
						{
							new cp = TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_CP];
							new route = TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_ROUTE];
							new Float:distance =     GetPlayerDistanceFromPoint
													(
														playerid,
														TRASH_OBJECTS[ route ][trash_object_X][ cp ],
														TRASH_OBJECTS[ route ][trash_object_Y][ cp ],
														TRASH_OBJECTS[ route ][trash_object_Z][ cp ]
													);

							if (distance > 10.0) ShowPlayerMessage(playerid, "Vuelve a subir al camión.", 3);
							else
							{
								if (IsPlayerInDynamicCP(playerid, PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT]))
								{
									if (!PLAYER_WORKS[playerid][WORK_TRASH]) return DestroyPlayerTrashCheckpoint(playerid);
									if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_TRASH) return DestroyPlayerTrashCheckpoint(playerid);
									if (!PLAYER_TEMP[playerid][py_TRASH_PASSENGER]) return 1;

									new driver = TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID];
									ShowPlayerMessage(driver, "Espera mientras tu ~y~compañero~w~ recoge la basura.", 3);

									new Float:offset = floatdiv(PLAYER_SKILLS[playerid][WORK_TRASH], 10);
									if (offset > 30.0) offset = 30.0;

									PLAYER_TEMP[playerid][py_RECYCLE_BIN_VALUE] = 5;
									UpdatePlayerTrashRecycleSize(playerid);

									TogglePlayerControllableEx(playerid, false);
									SetCameraBehindPlayer(playerid);
									ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.1, true, false, false, false, 0);

									KillTimer(PLAYER_TEMP[playerid][py_TIMERS][10]);
									PLAYER_TEMP[playerid][py_TIMERS][10] = SetTimerEx("RecycleUp", 1000, false, "i", playerid);
									return 1;
								}
								ShowPlayerNotification(playerid, "Recoge la basura y sube al camión para continuar.", 4);
							}
						}
					}
				}
				else
				{
					TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID] = INVALID_PLAYER_ID;
					PLAYER_TEMP[playerid][py_TRASH_PASSENGER] = false;
					PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] = INVALID_VEHICLE_ID;
				}
			}
		}
	}
    return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerExitVehicle %d %d",playerid,vehicleid); // debug juju
	#endif

	if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);

	DisableRemoteVehicleCollisions(playerid, 1);

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] != INVALID_PLAYER_ID)
	{
		if (IsPlayerConnected(GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER]))
		{
			if (PLAYER_MISC[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] ][MISC_RADIO_STATION] < 100)
			{
				if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);
			}
		}
	}

	PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_IMMUNITY] = gettime() + 3;
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerEnterVehicle %d %d %d",playerid,vehicleid,ispassenger); // debug juju
	#endif

	PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_IMMUNITY] = gettime() + 3;

	PLAYER_TEMP[playerid][py_VEHICLEID] = vehicleid;

	if (PLAYER_TEMP[playerid][py_GAME_STATE] == GAME_STATE_NORMAL)
	{
		if (ac_Info[CHEAT_VEHICLE_ENTER_SPAMMER][ac_Enabled])
		{
			if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_ENTER_SPAMMER][p_ac_info_IMMUNITY])
			{
				new interval = GetTickDiff(GetTickCount(), PLAYER_TEMP[playerid][py_ANTIFLOOD_ENTER_VEHICLE]);

				if (interval < 50)
				{
					if (!ac_Info[CHEAT_VEHICLE_ENTER_SPAMMER][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_VEHICLE_ENTER_SPAMMER, float(interval));
					else
					{
						if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_ENTER_SPAMMER][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_VEHICLE_ENTER_SPAMMER][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_ENTER_SPAMMER][p_ac_info_DETECTIONS] = 0;
						else PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_ENTER_SPAMMER][p_ac_info_DETECTIONS] ++;

						PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_ENTER_SPAMMER][p_ac_info_LAST_DETECTION] = gettime();
						if (PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_ENTER_SPAMMER][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_VEHICLE_ENTER_SPAMMER][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_VEHICLE_ENTER_SPAMMER, float(interval));
					}
				}
				PLAYER_TEMP[playerid][py_ANTIFLOOD_ENTER_VEHICLE] = GetTickCount();
			}
		}
	}

	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK)
	{
		new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    SetPlayerPos(playerid, x, y, z);
	    ApplyAnimation(playerid, "SWEET", "SWEET_INJUREDLOOP", 4.1, true, false, false, 1, 0, 1);
	}

	new Float:sx, Float:sy, Float:sz;
	GetPlayerPos(playerid, sx, sy, sz);

	if (!ispassenger)
	{
		if (PLAYER_TEMP[playerid][py_CUFFED])
		{
			ShowPlayerMessage(playerid, "~r~No puedes hacer eso estando esposado.", 3);
			return 0;
		}

		if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_OCCUPIED])
		{
			if (PLAYER_TEMP[playerid][py_CJ_WARNINGS] >= 5)
			{
				KickEx(playerid);
				return 1;
			}

			PLAYER_TEMP[playerid][py_CJ_WARNINGS] ++;

			new str_text[128];
			format(str_text, sizeof(str_text), "Advertencia ~r~%d/5", PLAYER_TEMP[playerid][py_CJ_WARNINGS]);
			ShowPlayerNotification(playerid, str_text, 3);

			ShowPlayerMessage(playerid, "~r~No puedes robar vehículos ocupados.", 3);
			RemovePlayerFromVehicle(playerid);
			SetPlayerPos(playerid, sx, sy, sz);
			//SetPlayerVirtualWorld(playerid, playerid);
			TogglePlayerControllableEx(playerid, false);
			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][19]);
			PLAYER_TEMP[playerid][py_TIMERS][19] = SetTimerEx("CarJackingFinish", 1000, false, "i", playerid);
			return 1;
		}

		if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE] == VEHICLE_TYPE_WORK)
		{
			if (!PLAYER_WORKS[playerid][ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ])
			{
				new str_text[128];
				format(str_text, sizeof(str_text), "Necesitas ser %s para manejar este vehículo.", work_info[ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ][work_info_NAME]);
				ShowPlayerMessage(playerid, str_text, 3);

				RemovePlayerFromVehicle(playerid);
				SetPlayerPos(playerid, sx, sy, sz);
				return 1;
			}

			if (GLOBAL_VEHICLES[vehicleid][gp_vehicle_vip] && !ACCOUNT_INFO[playerid][ac_SU])
			{
			    ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP ~w~para usar éste vehículo.", 3);
				RemovePlayerFromVehicle(playerid);
				SetPlayerPos(playerid, sx, sy, sz);
				return 1;
			}

			if (PLAYER_TEMP[playerid][py_WORKING_IN] && PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_VEHICLES[vehicleid][work_vehicle_WORK])
			{
				new str_text[128];
				format(str_text, sizeof(str_text), "Tienes que dejar de estar de servicio como %s.", work_info[ PLAYER_TEMP[playerid][py_WORKING_IN] ][work_info_NAME]);
				ShowPlayerNotification(playerid, str_text, 3);

				RemovePlayerFromVehicle(playerid);
				SetPlayerPos(playerid, sx, sy, sz);
				return 1;
			}

			if (WORK_VEHICLES[vehicleid][work_vehicle_NEED_DUTY])
			{
				if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_VEHICLES[vehicleid][work_vehicle_WORK])
				{
					new str_text[128];
					format(str_text, sizeof(str_text), "Necesitas estar de servicio de %s para poder conducir éste vehículo.", work_info[ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ][work_info_NAME]);
					ShowPlayerNotification(playerid, str_text, 3);

					RemovePlayerFromVehicle(playerid);
					SetPlayerPos(playerid, sx, sy, sz);
					return 1;
				}
			}

			if (WORK_VEHICLES[vehicleid][work_vehicle_EXP] > PLAYER_SKILLS[playerid][ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ])
			{
				new str_text[128];
				format(str_text, sizeof(str_text), "Necesitas más experiencia en este trabajo para llevar éste vehículo. (%d/%d)", PLAYER_SKILLS[playerid][ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ], WORK_VEHICLES[vehicleid][work_vehicle_EXP]);
				ShowPlayerNotification(playerid, str_text, 3);

				RemovePlayerFromVehicle(playerid);
				SetPlayerPos(playerid, sx, sy, sz);
				return 1;
			}
		}
	}
	else
	{
		if (WORK_VEHICLES[vehicleid][work_vehicle_VALID] && WORK_VEHICLES[vehicleid][work_vehicle_WORK] == WORK_TRASH)
		{
			if (!PLAYER_WORKS[playerid][WORK_TRASH])
			{
				new str_text[128];
				format(str_text, sizeof(str_text), "Necesitas ser %s para manejar este vehículo.", work_info[ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ][work_info_NAME]);
				ShowPlayerMessage(playerid, str_text, 3);

				RemovePlayerFromVehicle(playerid);
				SetPlayerPos(playerid, sx, sy, sz);
				return 1;
			}

			if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_VEHICLES[vehicleid][work_vehicle_WORK])
			{
				SendClientMessageEx(playerid, COLOR_WHITE, "Necesitas estar de servicio como %s para poder conducir este vehículo.", work_info[ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ][work_info_NAME]);
				RemovePlayerFromVehicle(playerid);
				SetPlayerPos(playerid, sx, sy, sz);
				return 1;
			}
		}

		if (PLAYER_TEMP[playerid][py_CUFFED])
		{
			ShowPlayerMessage(playerid, "~r~No puedes hacer eso estando esposado.", 3);
			return 0;
		}
	}

	if (PLAYER_WORKS[playerid][WORK_FISHER])
	{
		if (!ispassenger)
		{
			if (IsPlayerInRangeOfPoint(playerid, 35.0, 2112.460205, -97.572998, 2.143339) && GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] == 453)
			{
				ShowPlayerMessage(playerid, "Dirígete a una ~y~boya~w~ para pescar.", 4);
			}
		}
	}

	if (PLAYER_MISC[playerid][MISC_RADIO_STATION] < 100)
	{
		if (!ispassenger)
		{
			if (GetPlayerInterior(playerid) == 0) PlayAudioStreamForPlayer(playerid, RADIO_STATIONS[ PLAYER_MISC[playerid][MISC_RADIO_STATION] ][r_URL]);
		}
	}

	if (ispassenger)
	{
		if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] != INVALID_PLAYER_ID)
		{
			if (IsPlayerConnected(GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER]))
			{
				if (PLAYER_MISC[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] ][MISC_RADIO_STATION] < 100)
				{
					PlayAudioStreamForPlayer(playerid, RADIO_STATIONS[ PLAYER_MISC[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] ][MISC_RADIO_STATION] ][r_URL]);
				}
			}
		}
	}

	/*if (PLAYER_WORKS[playerid][WORK_CLEANER])
	{
		if (!ispassenger)
		{
			if (IsPlayerInRangeOfPoint(playerid, 22.0, 1623.531616, -1894.376831, 13.550236) && GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] == 574)
			{
				PLAYER_TEMP[playerid][py_CLEANER_INDEX] = minrand(0, sizeof(CleanerRoutes));
				PLAYER_TEMP[playerid][py_CLEANER_CHECKPOINT] = CreateDynamicCP(CleanerRoutes[ PLAYER_TEMP[playerid][py_CLEANER_INDEX] ][0], CleanerRoutes[ PLAYER_TEMP[playerid][py_CLEANER_INDEX] ][1], CleanerRoutes[ PLAYER_TEMP[playerid][py_CLEANER_INDEX] ][2], 7.0, 0, 0, playerid, 9999999999.0);
				StartTracing(playerid, CleanerRoutes[ PLAYER_TEMP[playerid][py_CLEANER_INDEX] ][0], CleanerRoutes[ PLAYER_TEMP[playerid][py_CLEANER_INDEX] ][1], CleanerRoutes[ PLAYER_TEMP[playerid][py_CLEANER_INDEX] ][2]);
				
				new info[1];
				info[0] = CHECKPOINT_TYPE_CLEANER;
				Streamer_SetArrayData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_CLEANER_CHECKPOINT], E_STREAMER_EXTRA_ID, info);

				ShowPlayerMessage(playerid, "Dirígete al ~r~punto~w~ marcado.", 4);
			}
		}
	}*/

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] == 481 || GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] == 509 || GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] == 510)
	{
		if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE])
        {
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 1;
			UpdateVehicleParams(vehicleid);
		}
	}

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE] != VEHICLE_TYPE_WORK || PLAYER_TEMP[playerid][py_PACIFIC])
	{
		DisableRemoteVehicleCollisions(playerid, 0);
	}

	if (PLAYER_TEMP[playerid][py_TUTORIAL])
	{
		StopAudioStreamForPlayer(playerid);

		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
		PLAYER_TEMP[playerid][py_TIMERS][18] = SetTimerEx("ContinuePlayerIntro", 1000, false, "id", playerid, 5);
	}
	return 1;
}

public OnPlayerEnterDynamicRaceCP(playerid, checkpointid)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerEnterDynamicRaceCP %d %d",playerid,checkpointid); // debug juju
	#endif

	new info[1];
	Streamer_GetArrayData(STREAMER_TYPE_RACE_CP, checkpointid, E_STREAMER_EXTRA_ID, info);

	switch(info[0])
	{
		case CHECKPOINT_TYPE_HARVEST:
		{
			if (PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] == sizeof(HARVEST_CHECKPOINTS) - 1)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				if (vehicleid == INVALID_VEHICLE_ID) return 1;

				new work_extra_payment;
				if (work_info[WORK_HARVESTER][work_info_EXTRA_PAY] > 0 && work_info[WORK_HARVESTER][work_info_EXTRA_PAY_EXP] > 0)
				{
					work_extra_payment = (work_info[WORK_HARVESTER][work_info_EXTRA_PAY] * floatround(floatdiv(PLAYER_SKILLS[playerid][WORK_HARVESTER], work_info[WORK_HARVESTER][work_info_EXTRA_PAY_EXP])));
					if (work_info[WORK_HARVESTER][work_info_EXTRA_PAY_LIMIT] != 0) if (work_extra_payment > work_info[WORK_HARVESTER][work_info_EXTRA_PAY_LIMIT]) work_extra_payment = work_info[WORK_HARVESTER][work_info_EXTRA_PAY_LIMIT];

					if (ACCOUNT_INFO[playerid][ac_SU]) work_extra_payment += SU_WORK_EXTRA_PAY;
				}

				new money = minrand(570, 850) + WORK_HARVESTER;
			    new Float:x, Float:y, Float:z;
				GivePlayerCash(playerid, money);

				PLAYER_SKILLS[playerid][WORK_HARVESTER] ++;
			    SavePlayerSkills(playerid);
			    GetPlayerPos(playerid, x, y, z);
			    SetPlayerPos(playerid, x, y, z - 1);

			    new is_hycoin_best = minrand(0, 50);
			    if (is_hycoin_best == 38)
			    {
			    	new 
			    		random_hycoin = minrand(1, 3),
			    		coin_text[64];

			    	ACCOUNT_INFO[playerid][ac_SD] += random_hycoin;
			    	format(coin_text, sizeof(coin_text), "Acabas de ganar %d Hycoins.", random_hycoin);
			    	ShowPlayerNotification(playerid, coin_text, 4);
					new DB_Query[128];
					format(DB_Query, sizeof DB_Query, "UPDATE `CUENTA` SET `SD` = '%d' WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_ID]);
					db_free_result(db_query(Database, DB_Query));

					ApplyAnimation(playerid, "OTB", "WTCHRACE_WIN", 4.1, false, false, false, false, 0, false);
			    }

			    GivePlayerReputation(playerid);
				EndPlayerJob(playerid);
				return 1;
			}

			new str[50];
			format(str, sizeof str, "~n~~n~~n~~n~~n~~n~~n~~w~~h~~y~%d/%d", PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] + 1, sizeof(HARVEST_CHECKPOINTS));
			GameTextForPlayer(playerid, str, 2000, 3);
			PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);

			PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] ++;
			Set_HARVEST_Checkpoint(playerid);
		}
	}
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	if (WEAPON_INFO[weaponid][weapon_info_AMMO]) PLAYER_WEAPONS[playerid][ WEAPON_INFO[weaponid][weapon_info_SLOT] ][player_weapon_AMMO] --;
	
	if (PLAYER_WEAPONS[playerid][ WEAPON_INFO[weaponid][weapon_info_SLOT] ][player_weapon_AMMO] <= 0) PLAYER_WEAPONS[playerid][ WEAPON_INFO[weaponid][weapon_info_SLOT] ][player_weapon_AMMO] = 0;
	
	if (ac_Info[CHEAT_UNDETECTED_WEAPON][ac_Enabled])
	{
		if (GetPlayerWeapon(playerid) != weaponid)
		{
			if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_UNDETECTED_WEAPON][p_ac_info_IMMUNITY])
			{
				if (!ac_Info[CHEAT_UNDETECTED_WEAPON][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_UNDETECTED_WEAPON);
				else
				{
					if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_UNDETECTED_WEAPON][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_UNDETECTED_WEAPON][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_UNDETECTED_WEAPON][p_ac_info_DETECTIONS] = 0;
					else PLAYER_AC_INFO[playerid][CHEAT_UNDETECTED_WEAPON][p_ac_info_DETECTIONS] ++;

					PLAYER_AC_INFO[playerid][CHEAT_UNDETECTED_WEAPON][p_ac_info_LAST_DETECTION] = gettime();
					if (PLAYER_AC_INFO[playerid][CHEAT_UNDETECTED_WEAPON][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_UNDETECTED_WEAPON][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_UNDETECTED_WEAPON);
				}
			}
		}
	}

	if (weaponid == 23)
	{
		if (!PLAYER_WORKS[playerid][WORK_POLICE])
		{
			if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
			{
				Anticheat_Ban(playerid, "Tazer");
			}
		}
	}

	if (weaponid != 38 && weaponid > 18 && weaponid < 34 && hittype == BULLET_HIT_TYPE_PLAYER)
	{
		new 
			Float:vectors[6],
			Float:aim_distance,
			weapon_name[128]
		;
		
		GetPlayerPos(hitid, vectors[0], vectors[1], vectors[2]);
		aim_distance = GetPlayerDistanceFromPoint(playerid, vectors[0], vectors[1], vectors[2]);
		GetWeaponName(weaponid, weapon_name, sizeof(weapon_name));

		if (GetPlayerTargetPlayer(playerid) == INVALID_PLAYER_ID && aim_distance > 1 && aim_distance < 31 && PLAYER_TEMP[playerid][py_AIM_DATA] == 1)
		{
			PLAYER_TEMP[playerid][py_SILENT_AIM_COUNT] ++;
			if (PLAYER_TEMP[playerid][py_SILENT_AIM_COUNT] >= 10)
			{
				PLAYER_TEMP[playerid][py_SILENT_AIM_COUNT] = 0;
				PLAYER_TEMP[playerid][py_AIMBOT_COUNT] ++;

				new str_text[144];
				format(str_text, sizeof(str_text), "[ANTI-CHEAT] %s (%d): posible uso de Silent Aim #0 con: %s (Dist: %i mts)", ACCOUNT_INFO[playerid][ac_NAME], playerid, weapon_name, floatround(aim_distance));
				SendMessageToAdminsAC(COLOR_ANTICHEAT, str_text);
				SendDiscordWebhook(str_text, 1);
			}
			return 1;
		}

		GetPlayerLastShotVectors(playerid, vectors[0], vectors[1], vectors[2], vectors[3], vectors[4], vectors[5]);

		if (!IsPlayerInRangeOfPoint(hitid, 3.0, vectors[3], vectors[4], vectors[5]))
		{
			PLAYER_TEMP[playerid][py_PRO_AIM_COUNT] ++;
			if (PLAYER_TEMP[playerid][py_PRO_AIM_COUNT] >= 5)
			{
				PLAYER_TEMP[playerid][py_PRO_AIM_COUNT] = 0;
				PLAYER_TEMP[playerid][py_AIMBOT_COUNT] ++;

				new str_text[144];
				format(str_text, sizeof(str_text), "[ANTI-CHEAT] %s (%d): posible uso de Pro Aim #0 con: %s (Dist: %i mts)", ACCOUNT_INFO[playerid][ac_NAME], playerid, weapon_name, floatround(aim_distance));
				SendMessageToAdminsAC(COLOR_ANTICHEAT, str_text);
				SendDiscordWebhook(str_text, 1);
			}
		}
	}

	if (ac_Info[CHEAT_DRIVE_BY][ac_Enabled])
	{
		new player_state = GetPlayerState(playerid);
		if (player_state == PLAYER_STATE_DRIVER || player_state == PLAYER_STATE_PASSENGER)
		{
			if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_DRIVE_BY][p_ac_info_IMMUNITY])
			{
				if (!ac_Info[CHEAT_DRIVE_BY][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_DRIVE_BY);
				else
				{
					if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_DRIVE_BY][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_DRIVE_BY][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_DRIVE_BY][p_ac_info_DETECTIONS] = 0;
					else PLAYER_AC_INFO[playerid][CHEAT_DRIVE_BY][p_ac_info_DETECTIONS] ++;

					PLAYER_AC_INFO[playerid][CHEAT_DRIVE_BY][p_ac_info_LAST_DETECTION] = gettime();
					if (PLAYER_AC_INFO[playerid][CHEAT_DRIVE_BY][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_DRIVE_BY][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_DRIVE_BY);
				}
			}
		}
	}

	/*if (weaponid != 38)
	{
		if ((gettime() - PLAYER_TEMP[playerid][py_LAST_SHOT_TIME]) < 1)
		{
			PLAYER_TEMP[playerid][py_SHOT_DETECTIONS] ++;
		}
		else
		{
			PLAYER_TEMP[playerid][py_SHOT_DETECTIONS] = 0;
		}

		if (PLAYER_TEMP[playerid][py_SHOT_DETECTIONS] > 10)
		{
			KickEx(playerid, 100);
		}
		PLAYER_TEMP[playerid][py_LAST_SHOT_TIME] = gettime();
	}*/

	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
	{
		if (IsPlayerInSafeZone(playerid))
		{
			if (!PLAYER_WORKS[playerid][WORK_POLICE])
			{
				FreezePlayer(playerid, 2000);
				ShowPlayerMessage(playerid, "~r~No dispares en zona segura.", 3);
				SetPlayerPoliceSearchLevel(playerid, PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] + 3);
				format(PLAYER_TEMP[playerid][py_POLICE_REASON], 32, "Disturbios");
				ShowPlayerMessage(playerid, "~b~Has cometido un crimen: Disturbios", 5);
			}
		}

		/*if (ACCOUNT_INFO[playerid][ac_LEVEL] == 1)
		{
			SendClientMessage(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado por disparar siendo nivel 1.");
			TogglePlayerControllableEx(playerid, false);
			KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
		}*/

		if (PLAYER_WORKS[playerid][WORK_MEDIC] && PLAYER_TEMP[playerid][py_WORKING_IN] == WORK_MEDIC)
		{
			ShowPlayerMessage(playerid, "~r~No puedes disparar estando de medico.", 3);
			FreezePlayer(playerid, 3000);
		}

		if (GetPlayerVirtualWorld(playerid) == 1336)
		{
			ShowPlayerMessage(playerid, "~r~No puedes disparar dentro del estadio.", 3);
			FreezePlayer(playerid, 3000);
			SetPlayerPoliceSearchLevel(playerid, PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] + 3);
			format(PLAYER_TEMP[playerid][py_POLICE_REASON], 32, "Disturbios");
			ShowPlayerMessage(playerid, "~b~Has cometido un crimen: Disturbios", 5);
		}
	}

	/*if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK)
	{
		SendClientMessage(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado por disparar estando herido.");
		TogglePlayerControllableEx(playerid, false);
		KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
	}*/

	if (PLAYER_TEMP[playerid][py_EXPLOSION_BULLET])
	{
		CreateExplosion(fX, fY, fZ, 12, 1.0);
	}
	
	if (PLAYER_CREW[playerid][player_crew_VALID])
	{
		if (gettime() > CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_LAST_ATTACK] + 600)
		{
			if (PLAYER_TEMP[playerid][py_LAST_TERRITORY] != INVALID_STREAMER_ID)
			{
				if (IsPlayerInDynamicArea(playerid, TERRITORIES[ PLAYER_TEMP[playerid][py_LAST_TERRITORY] ][territory_AREA]))
				{
					if (TERRITORIES[ PLAYER_TEMP[playerid][py_LAST_TERRITORY] ][territory_CREW_ID] != PLAYER_CREW[playerid][player_crew_ID])
					{
						if (!TERRITORIES[ PLAYER_TEMP[playerid][py_LAST_TERRITORY] ][territory_WAR] && !CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_FIGHTING])
						{
							if (gettime() > TERRITORIES[ PLAYER_TEMP[playerid][py_LAST_TERRITORY] ][territory_LAST_ATTACK] + 600)
							{
								if (!TERRITORIES[ PLAYER_TEMP[playerid][py_LAST_TERRITORY] ][territory_OCCUPIED])
								{
									new attackers_in_area = CountCrewPlayersInTerritory(PLAYER_CREW[playerid][player_crew_INDEX], PLAYER_TEMP[playerid][py_LAST_TERRITORY]);
									if (attackers_in_area >= 4) StartTerritoryAttack(PLAYER_CREW[playerid][player_crew_INDEX], PLAYER_TEMP[playerid][py_LAST_TERRITORY], 300);
								}
								else
								{
									if (CREW_INFO[ TERRITORIES[ PLAYER_TEMP[playerid][py_LAST_TERRITORY] ][territory_CREW_INDEX] ][crew_VALID])
									{
										if (!CREW_INFO[ TERRITORIES[ PLAYER_TEMP[playerid][py_LAST_TERRITORY] ][territory_CREW_INDEX] ][crew_FIGHTING])
										{
											new attackers_in_area = CountCrewPlayersInTerritory(PLAYER_CREW[playerid][player_crew_INDEX], PLAYER_TEMP[playerid][py_LAST_TERRITORY]);
											if (attackers_in_area >= 4) StartTerritoryAttack(PLAYER_CREW[playerid][player_crew_INDEX], PLAYER_TEMP[playerid][py_LAST_TERRITORY], 300);
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	new weapon_id, ammo;
	GetPlayerWeaponData(playerid, WEAPON_INFO[weaponid][weapon_info_SLOT], weapon_id, ammo);
	if (ammo <= 0)
		PLAYER_WEAPONS[playerid][ WEAPON_INFO[weaponid][weapon_info_SLOT] ][player_weapon_AMMO] = 0;
    else PLAYER_WEAPONS[playerid][ WEAPON_INFO[weaponid][weapon_info_SLOT] ][player_weapon_AMMO] = ammo;

    return 1;
}

public OnPlayerSuspectedForAimbot(playerid, hitid, weaponid, warnings)
{
	new
		str_text[144],
		weapon_name[64]
	;
	GetWeaponName(weaponid, weapon_name, sizeof(weapon_name));
	
	if (warnings & WARNING_OUT_OF_RANGE_SHOT)
	{
		format(str_text, sizeof(str_text), "[ANTI-CHEAT] Aviso sobre %s (%d): Range Aimbot (%s)", PLAYER_TEMP[playerid][py_NAME], playerid, weapon_name);
		SendMessageToAdminsAC(COLOR_ANTICHEAT, str_text);
		SendDiscordWebhook(str_text, 1);
	}

	if (warnings & WARNING_PROAIM_TELEPORT)
	{
		format(str_text, sizeof(str_text), "[ANTI-CHEAT] Aviso sobre %s (%d): Pro Aimbot (%s)", PLAYER_TEMP[playerid][py_NAME], playerid, weapon_name);
		SendMessageToAdminsAC(COLOR_ANTICHEAT, str_text);
		SendDiscordWebhook(str_text, 1);
	}

	if (warnings & WARNING_RANDOM_AIM)
	{
		format(str_text, sizeof(str_text), "[ANTI-CHEAT] Aviso sobre %s (%d): Aimbot (%s)", PLAYER_TEMP[playerid][py_NAME], playerid, weapon_name);
		SendMessageToAdminsAC(COLOR_ANTICHEAT, str_text);
		SendDiscordWebhook(str_text, 1);

		PLAYER_TEMP[playerid][py_SING_AIM] ++;
		if (PLAYER_TEMP[playerid][py_SING_AIM] > 10)
		{
			PLAYER_TEMP[playerid][py_SING_AIM] = 0;
			Anticheat_Ban(playerid, "Aimbot #2");
		}
	}

	if (warnings & WARNING_CONTINOUS_SHOTS)
	{
		format(str_text, sizeof(str_text), "[ANTI-CHEAT] Aviso sobre %s (%d): 10 disparos acertados (weaponId: %d, hitId: %d)", PLAYER_TEMP[playerid][py_NAME], playerid, weaponid, hitid);
		SendMessageToAdminsAC(COLOR_ANTICHEAT, str_text);
		SendDiscordWebhook(str_text, 1);

		PLAYER_TEMP[playerid][py_TRUSTED_AIM] ++;
		if (PLAYER_TEMP[playerid][py_TRUSTED_AIM] > 5)
		{
			PLAYER_TEMP[playerid][py_TRUSTED_AIM] = 0;
			Anticheat_Ban(playerid, "Aimbot #1");
		}
	}
	return 0;
}

IPacket:AIM_SYNC(playerid, BitStream:bs)
{
    new aimData[PR_AimSync];
    
    BS_IgnoreBits(bs, 8);
    BS_ReadAimSync(bs, aimData);

    if (aimData[PR_aimZ] != aimData[PR_aimZ])
    {
        return 0;
    }

	//SendClientMessage(playerid, -1, "aim");
    return 1;
}

IPacket:BULLET_SYNC(playerid, BitStream:bs)
{
    new bulletData[PR_BulletSync];

    BS_IgnoreBits(bs, 8);
    BS_ReadBulletSync(bs, bulletData);

	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
	{
		PLAYER_TEMP[playerid][py_TOTAL_SHOT] ++;
		if (PLAYER_TEMP[playerid][py_TOTAL_SHOT] >= 5)
		{
			PLAYER_TEMP[playerid][py_TOTAL_SHOT] = 0;

			/*if (!IsShootingAnimation(GetPlayerAnimationIndex(playerid)))
			{
				return Anticheat_Ban(playerid, "Damager");
			}*/

			// Wall shot
			if (bulletData[PR_hitType] == 1)
			{
				new Float:ray_x, Float:ray_y, Float:ray_z;
				new ray = CA_RayCastLine(
					bulletData[PR_origin][0], bulletData[PR_origin][1], bulletData[PR_origin][2],
					bulletData[PR_hitPos][0], bulletData[PR_hitPos][1], bulletData[PR_hitPos][2],
					ray_x, ray_y, ray_z
				);

				if (ray && ray != WATER_OBJECT)
				{
					new str_text[144];
					format(str_text, sizeof(str_text), "[ANTI-CHEAT] Aviso sobre %s (%d): WallShot (object: %d, weaponId: %d, hitId: %d)", PLAYER_TEMP[playerid][py_NAME], playerid, ray, bulletData[PR_weaponId], bulletData[PR_hitId]);
					SendMessageToAdminsAC(COLOR_ANTICHEAT, str_text);
					SendDiscordWebhook(str_text, 1);

					PLAYER_TEMP[playerid][py_WALLSHOT_ALERTS] ++;
					if (PLAYER_TEMP[playerid][py_WALLSHOT_ALERTS] >= 3)
						Anticheat_Ban(playerid, "Wallshot");
				}
			}
		}
	}

    return 1;
}

#if defined VOICE_CHAT
	public SV_VOID:OnPlayerActivationKeyPress(SV_UINT:playerid, SV_UINT:keyid)
	{
		if (keyid == 0x5A && lstream[playerid]) SvAttachSpeakerToStream(lstream[playerid], playerid);

		if (in_gamemode_menu[playerid])
	    {
	    	switch(keyid)
	    	{
	    		case 0x41:
	    		{
	    			minigames_page[playerid] -= 1;
	    			UpdateGamemodesMenu(playerid);
	    		}
	    		case 0x44:
	    		{
	    			minigames_page[playerid] ++;
	    			UpdateGamemodesMenu(playerid);
	    		}
	    		case 0x57: ShowMainMenu(playerid);
	    		case 0x53: PlayerJoinGamemode(playerid);
	    	}
	    }
	}

	public SV_VOID:OnPlayerActivationKeyRelease(SV_UINT:playerid, SV_UINT:keyid)
	{
		if (keyid == 0x5A && lstream[playerid]) SvDetachSpeakerFromStream(lstream[playerid], playerid);
	}
#endif

#if defined FINAL_BUILD
	public OnRconLoginAttempt(ip[], password[], success)
	{
		#if DEBUG_MODE == 1
			printf("OnRconLoginAttempt %s %s",ip,password); // debug juju
	    #endif

	    new temp_ip[16];

	    for(new i = 0; i < MAX_PLAYERS; i++)
	    {
		   if (IsPlayerConnected(i))
		   {
			  	GetPlayerIp(i, temp_ip, sizeof(temp_ip));
			  	if (!strcmp(ip, temp_ip))
			  	{
				 	KickEx(i, 100);
			  	}
		   	}
	    }
	    return 1;
	}
#endif

public OnPlayerSelectDynamicObject(playerid, objectid, modelid, Float:x, Float:y, Float:z)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerSelectDynamicObject %d",playerid); // debug juju
	#endif

	new info[2];
	Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objectid, E_STREAMER_EXTRA_ID, info);
	if (info[0] == WORK_POLICE)
	{
		if (!PLAYER_WORKS[playerid][WORK_POLICE])
		{
			CancelEdit(playerid);
			ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
			return 1;
		}
		if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE)
		{
			CancelEdit(playerid);
			ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);
			return 1;
		}
		if (PLAYER_SKILLS[playerid][WORK_POLICE] < 8)
		{
			CancelEdit(playerid);
			ShowPlayerNotification(playerid, "No tienes rango suficiente.", 3);
			return 1;
		}

		SendClientMessageEx(playerid, COLOR_WHITE, "Este objeto fue colocado por %s. Usa 'ESC' para borrar el objeto.", POLICE_OBJECTS[ info[1] ][police_object_USER]);
		PLAYER_TEMP[playerid][py_SELECTED_POLICE_OBJECT_INDEX] = info[1];
		EditDynamicObject(playerid, objectid);
		return 1;
	}
	return 1;
}

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerEditDynamicObject",playerid); // debug juju
	#endif

	if (response == EDIT_RESPONSE_CANCEL)
	{
		new info[2];
		Streamer_GetArrayData(STREAMER_TYPE_OBJECT, objectid, E_STREAMER_EXTRA_ID, info);
		if (info[0] == WORK_POLICE)
		{
			if (!PLAYER_WORKS[playerid][WORK_POLICE])
			{
				CancelEdit(playerid);
				ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
				return 1;
			}
			if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE)
			{
				CancelEdit(playerid);
				ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);
				return 1;
			}
			if (PLAYER_SKILLS[playerid][WORK_POLICE] < 8)
			{
				CancelEdit(playerid);
				ShowPlayerNotification(playerid, "No tienes rango suficiente.", 3);
				return 1;
			}

			DestroyDynamicObject(POLICE_OBJECTS[ info[1] ][police_object_OBJECT_ID]);
			POLICE_OBJECTS[ info[1] ][police_object_VALID] = false;
			POLICE_OBJECTS[ info[1] ][police_object_USER][0] = EOS;
			POLICE_OBJECTS[ info[1] ][police_object_OBJECT_ID] = INVALID_STREAMER_ID;
			ShowPlayerMessage(playerid, "Objeto policial eliminado.", 2);
		}
	}
	return 1;
}

OnPlayerCheatDetected(playerid, cheat, Float:extra = 0.0)
{
	if (IsPlayerNPC(playerid)) return 1;
	if (!strcmp(PLAYER_TEMP[playerid][py_IP], "95.156.227.96")) return 0;
	if (PLAYER_TEMP[playerid][py_KICKED]) return 1;

	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
	{
		if (gettime() < PLAYER_TEMP[playerid][py_LAST_CHEAT_DETECTED_TIME] + 5) return 1;

		new ac_message[144], player_state = GetPlayerState(playerid);

		if (ac_Info[cheat][ac_Kick])
		{
			new bad_history[24];
			format(bad_history, sizeof bad_history, "ac, cheat (%02d)", cheat);
			AddPlayerBadHistory(ACCOUNT_INFO[playerid][ac_ID], 11, TYPE_KICK, bad_history);

			if (extra != 0.0) format(ac_message, sizeof ac_message, "[ANTI-CHEAT] Detección en %s (%d): %s (cd: %02d, ps: %02d, ping: %d, dec: %d:%d, extra: %.1f)", ACCOUNT_INFO[playerid][ac_NAME], playerid, ac_Info[cheat][ac_Name], cheat, player_state, GetPlayerPing(playerid), PLAYER_AC_INFO[playerid][cheat][p_ac_info_DETECTIONS], ac_Info[cheat][ac_Interval], extra);
			else format(ac_message, sizeof ac_message, "[ANTI-CHEAT] Detección en %s (%d): %s (cd: %02d, ps: %02d, ping: %d, dec: %d:%d)", ACCOUNT_INFO[playerid][ac_NAME], playerid, ac_Info[cheat][ac_Name], cheat, player_state, GetPlayerPing(playerid), PLAYER_AC_INFO[playerid][cheat][p_ac_info_DETECTIONS], ac_Info[cheat][ac_Interval]);

			TogglePlayerControllableEx(playerid, false);

			switch(cheat)
			{
				case CHEAT_PLAYER_ARMOUR, CHEAT_PLAYER_HEALTH:
				{
					CHARACTER_INFO[playerid][ch_HEALTH] = 20.0;
					CHARACTER_INFO[playerid][ch_ARMOUR] = 0.0;
				}
				case CHEAT_VEHICLE_NOFUEL:
				{
					PLAYER_TEMP[playerid][py_NOFUEL_ALERTS] ++;
					if (PLAYER_TEMP[playerid][py_NOFUEL_ALERTS] >= 3)
						Anticheat_Ban(playerid, "Vehicle Fuel");
				}
				case CHEAT_AMMO, CHEAT_JETPACK, CHEAT_TEXT_SPAMMER, CHEAT_COMMAND_SPAMMER, CHEAT_STATE_SPAMMER, CHEAT_DEATH_SPAMMER: Anticheat_Ban(playerid, ac_Info[cheat][ac_Name]);
				default: Anticheat_Kick(playerid, ac_Info[cheat][ac_Name]);
			}
		}
		else
		{
			if (extra != 0.0) format(ac_message, sizeof ac_message, "[ANTI-CHEAT] Aviso sobre %s (%d): %s (cd: %02d, ps: %02d, ping: %d, dec: %d:%d, extra: %.1f)", ACCOUNT_INFO[playerid][ac_NAME], playerid, ac_Info[cheat][ac_Name], cheat, player_state, GetPlayerPing(playerid), PLAYER_AC_INFO[playerid][cheat][p_ac_info_DETECTIONS], ac_Info[cheat][ac_Interval], extra);
			else format(ac_message, sizeof ac_message, "[ANTI-CHEAT] Aviso sobre %s (%d): %s (cd: %02d, ps: %02d, ping: %d, dec: %d:%d)", ACCOUNT_INFO[playerid][ac_NAME], playerid, ac_Info[cheat][ac_Name], cheat, player_state, GetPlayerPing(playerid), PLAYER_AC_INFO[playerid][cheat][p_ac_info_DETECTIONS], ac_Info[cheat][ac_Interval]);
		}

		SendMessageToAdminsAC(COLOR_ANTICHEAT, ac_message);
		SendDiscordWebhook(ac_message, 1);
		PLAYER_TEMP[playerid][py_LAST_CHEAT_DETECTED_TIME] = gettime();

		PLAYER_AC_INFO[playerid][CHEAT_JETPACK][p_ac_info_DETECTIONS] ++;

		if ( PLAYER_AC_INFO[playerid][CHEAT_JETPACK][p_ac_info_DETECTIONS] > 4)
			Anticheat_Kick(playerid, "Sobrepasar avisos");
	}

	return 1;
}

ResetPlayerVariables(playerid)
{
	new temp_PLAYER_TEMP[Temp_Enum]; PLAYER_TEMP[playerid] = temp_PLAYER_TEMP;
	new temp_ACCOUNT_INFO[Account_Enum]; ACCOUNT_INFO[playerid] = temp_ACCOUNT_INFO;
	new temp_CHARACTER_INFO[Character_Enum]; CHARACTER_INFO[playerid] = temp_CHARACTER_INFO;
	new temp_BANK_ACCOUNT[Bank_Account_Enum]; BANK_ACCOUNT[playerid] = temp_BANK_ACCOUNT;

	CancelTracing(playerid);

	new temp_PLAYER_TOYS[Player_Toys_Info];
	for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++) PLAYER_TOYS[playerid][i] = temp_PLAYER_TOYS;

	new temp_PLAYER_POCKET[Player_Pocket_Enum];
	for(new i = 0; i != MAX_PLAYER_POCKET_OBJECTS; i ++) PLAYER_POCKET[playerid][i] = temp_PLAYER_POCKET;

	new temp_PLAYER_PHONE[Phone_Info_Enum]; PLAYER_PHONE[playerid] = temp_PLAYER_PHONE;

	new temp_PLAYER_PHONE_BOOK[Phone_Book_Enum];
	for(new i = 0; i != MAX_PHONE_CONTACTS; i ++) PLAYER_PHONE_BOOK[playerid][i] = temp_PLAYER_PHONE_BOOK;

	new temp_PLAYER_GPS[Player_GPS_Enum];
	for(new i = 0; i != MAX_PLAYER_GPS_SAVES; i ++) PLAYER_GPS[playerid][i] = temp_PLAYER_GPS;

	new temp_PLAYER_OBJECT[Player_Objects_Enum]; PLAYER_OBJECT[playerid] = temp_PLAYER_OBJECT;

	for(new i = 0; i != sizeof(PLAYER_SKILLS[]); i ++) PLAYER_SKILLS[playerid][i] = 0;

	for(new i = 0; i != sizeof(PLAYER_WORKS[]); i ++) PLAYER_WORKS[playerid][i] = 0;

	for(new i = 0; i != sizeof(PLAYER_MISC[]); i ++) PLAYER_MISC[playerid][E_MISC_DATA:i] = 0;

	new temp_PLAYER_PROPERTY_CONSTRUCTO[PLAYER_PROPERTY_CONSTRUCTOR_ENU]; PLAYER_PROPERTY_CONSTRUCTOR[playerid] = temp_PLAYER_PROPERTY_CONSTRUCTO;

	PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER] = INVALID_PLAYER_ID;
	PLAYER_TEMP[playerid][py_ADMIN_SERVICE] = false;

	new tmp_PLAYER_WEAPONS[enum_PLAYER_WEAPONS];
	for(new i = 0; i != 13; i ++) PLAYER_WEAPONS[playerid][i] = tmp_PLAYER_WEAPONS;

	new tmp_PLAYER_AC_INFO[e_PLAYER_AC_INFO];
	for(new i = 0; i != sizeof(ac_Info); i ++) PLAYER_AC_INFO[playerid][i] = tmp_PLAYER_AC_INFO;

	new tmp_PLAYER_CREW[enum_PLAYER_CREW]; PLAYER_CREW[playerid] = tmp_PLAYER_CREW;
	return 1;
}

forward ContinuePlayerIntro(playerid, step);
public ContinuePlayerIntro(playerid, step)
{
	#if DEBUG_MODE == 1
		printf("ContinuePlayerIntro"); // debug juju
	#endif

	switch(step)
	{
		case 0:
		{
			ClearPlayerChatBox(playerid);

			CHARACTER_INFO[playerid][ch_CASH] = 30000;
			#if defined DM_MODE
            	CHARACTER_INFO[playerid][ch_CASH] = 200000;
			#endif

			new index_pos = minrand(0, sizeof(NewUserPos));
			CHARACTER_INFO[playerid][ch_POS][0] = NewUserPos[index_pos][0];
			CHARACTER_INFO[playerid][ch_POS][1] = NewUserPos[index_pos][1];
			CHARACTER_INFO[playerid][ch_POS][2] = NewUserPos[index_pos][2];
			CHARACTER_INFO[playerid][ch_ANGLE] = NewUserPos[index_pos][3];
			CHARACTER_INFO[playerid][ch_FIGHT_STYLE] = 4;
			CHARACTER_INFO[playerid][ch_HEALTH] = 100.0;
			CHARACTER_INFO[playerid][ch_ARMOUR] = 0.0;
			CHARACTER_INFO[playerid][ch_HUNGRY] = 90.0;
			CHARACTER_INFO[playerid][ch_THIRST] = 95.0;
			PLAYER_MISC[playerid][MISC_CONFIG_SOUNDS] = true;
			PLAYER_MISC[playerid][MISC_CONFIG_AUDIO] = true;
			PLAYER_MISC[playerid][MISC_CONFIG_HUD] = true;
			PLAYER_MISC[playerid][MISC_CONFIG_FP] = false;
			PLAYER_MISC[playerid][MISC_CONFIG_ADMIN] = false;
			PLAYER_MISC[playerid][MISC_GLOBAL_CHAT] = false;

			SetPlayerScore(playerid, ACCOUNT_INFO[playerid][ac_LEVEL]);
			PLAYER_TEMP[playerid][py_DOUBT_CHANNEL_TIME] = gettime();
			ResetPlayerWeapons(playerid);
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, CHARACTER_INFO[playerid][ch_CASH]);
			SetPlayerFightingStyle(playerid, CHARACTER_INFO[playerid][ch_FIGHT_STYLE]);
			SetPlayerHealthEx(playerid, CHARACTER_INFO[playerid][ch_HEALTH]);
			SetPlayerArmourEx(playerid, CHARACTER_INFO[playerid][ch_ARMOUR]);
			SetPlayerVirtualWorld(playerid, 0);
			SetSpawnInfo(playerid, DEFAULT_TEAM, CHARACTER_INFO[playerid][ch_SKIN], CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], 0, 0, 0, 0, 0, 0);
			SetPlayerInterior(playerid, CHARACTER_INFO[playerid][ch_INTERIOR]);
			PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];

			RegisterNewPlayer(playerid);
			PLAYER_TEMP[playerid][py_NEW_USER] = true;
			TogglePlayerSpectatingEx(playerid, false);

			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
			PLAYER_TEMP[playerid][py_TIMERS][18] = SetTimerEx("ContinuePlayerIntro", 500, false, "id", playerid, 1);

			if (!PLAYER_TEMP[playerid][py_ANDROID] && IsFakeClient(playerid))
				Anticheat_Ban(playerid, "Cliente externo");
		}
		case 1:
		{
			SavePlayerNotification(playerid, "Bienvenido a Hyaxe Roleplay");

			StopAudioStreamForPlayer(playerid);
			PLAYER_MISC[playerid][MISC_CONFIG_HUD] = true;
			PLAYER_MISC[playerid][MISC_CONFIG_ADMIN] = false;
			SetPlayerHud(playerid);
			PLAYER_TEMP[playerid][py_NEW_USER] = false;
			PLAYER_TEMP[playerid][py_TUTORIAL] = true;
			PLAYER_TEMP[playerid][py_TUTORIAL_STEP] = 1;
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);

			TogglePlayerControllableEx(playerid, true);
			ShowPlayerNotification(playerid, "Bienvenido a Hyaxe Roleplay, version experimental.", 12);
			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);

			SetPlayerPosEx(playerid, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], 0, 0);
			PLAYER_TEMP[playerid][py_TIMERS][18] = SetTimerEx("ContinuePlayerIntro", 2000, false, "id", playerid, 2);
		}
		case 2:
		{
			StopAudioStreamForPlayer(playerid);

			if (PLAYER_TEMP[playerid][py_TUTORIAL_STEP] == 1) PlayAudioStreamForPlayer(playerid, "http://tmp6.hyaxe.com/tutorial_1.mp3");
			PLAYER_TEMP[playerid][py_TUTORIAL_STEP] = 2;

			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
		}
		case 3:
		{
			StopAudioStreamForPlayer(playerid);
			
			if (PLAYER_TEMP[playerid][py_TUTORIAL_STEP] == 6) PlayAudioStreamForPlayer(playerid, "http://tmp6.hyaxe.com/tutorial_6.mp3");
			PLAYER_TEMP[playerid][py_TUTORIAL_STEP] = 7;

			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
			PLAYER_TEMP[playerid][py_TIMERS][18] = SetTimerEx("ContinuePlayerIntro", 51000, false, "id", playerid, 4);
		}
		case 4:
		{
			StopAudioStreamForPlayer(playerid);
			if (PLAYER_TEMP[playerid][py_TUTORIAL_STEP] == 7) PlayAudioStreamForPlayer(playerid, "http://tmp6.hyaxe.com/tutorial_7.mp3");
			PLAYER_TEMP[playerid][py_TUTORIAL] = false;

			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
		}
		case 5:
		{
			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
			StopAudioStreamForPlayer(playerid);

			if (PLAYER_TEMP[playerid][py_TUTORIAL_STEP] == 4) PlayAudioStreamForPlayer(playerid, "http://tmp6.hyaxe.com/tutorial_4.mp3");
			PLAYER_TEMP[playerid][py_TUTORIAL_STEP] = 5;
		}

	}
	return 1;
}

forward CarJackingFinish(playerid);
public CarJackingFinish(playerid)
{
	#if DEBUG_MODE == 1
		printf("CarJackingFinish"); // debug juju
	#endif

	TogglePlayerControllableEx(playerid, true);
	return 1;
}

public OnOutcomingRPC(playerid, rpcid, BitStream:bs)
{
	switch(rpcid)
	{
		case 155:
		{
			new 
				ping,
				BitStream:bs_two = BS_New()
			;

			if (!IsPlayerConnected(playerid)) return 0;

			for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	    	{
		    	if (IsPlayerConnected(i))
		    	{
		    		if (PLAYER_TEMP[i][py_BOT]) ping = minrand(100, 300);
					else ping = GetPlayerPing(i);

					BS_WriteValue(
						bs_two,
						PR_UINT16, i,
						PR_INT32, GetPlayerScore(i),
						PR_UINT32, ping
					);

		    		PR_SendRPC(bs_two, playerid, rpcid);
		    	}
		    }

			BS_Delete(bs_two);
			return 0;
		}
	}
	return 1;
}

public OnClientCheckResponse(playerid, actionid, memaddr, retndata)
{
    switch(actionid)
    {       
        case 0x48: PLAYER_TEMP[playerid][py_ANDROID] = true;
    }
    return 1;
}