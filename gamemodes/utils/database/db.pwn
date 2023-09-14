#if defined UTILS_DATABASE
	#endinput
#endif

#define UTILS_DATABASE

new
	DB:Database,
	MySQL:RemoteDatabase
;

public OnGameModeInit()
{
	if (!(Database = db_open("DATABASE/server.db")))
	{
		Logger_Error("No se pudo abrir la base de datos interna.");
		return SendRconCommand("exit");
	}

	RemoteDatabase = mysql_connect("127.0.0.1", "root", "", "hyaxe");

	if (mysql_errno())
	{
		Logger_Error("No se pudo abrir la base de datos remota.");
		return SendRconCommand("exit");
	}

	Logger_Info("Conexión con la base de datos establecida.");

	safe_db_query( "\
		PRAGMA FOREIGN_KEYS = ON;\
		UPDATE `ACCOUNTS` SET `CONNECTED` = '0', PLAYERID = '-1';\
	");

	#if defined DB_OnGameModeInit
		return DB_OnGameModeInit();
	#else
		return 1;
	#endif
}

#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit DB_OnGameModeInit
#if defined DB_OnGameModeInit
	forward DB_OnGameModeInit();
#endif