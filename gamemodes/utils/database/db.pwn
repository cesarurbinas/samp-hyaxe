#if defined UTILS_DATABASE
	#endinput
#endif

#define UTILS_DATABASE

new DB:Database;

ConnectDatabase()
{
	if (!(Database = db_open("DATABASE/server.db")))
	{
		Logger_Error("No se pudo abrir la base de datos.");
		return 0;
	}

	Logger_Info("Conexión con la base de datos establecida.");

	safe_db_query( "\
		PRAGMA FOREIGN_KEYS = ON;\
		UPDATE `CUENTA` SET `CONNECTED` = '0', PLAYERID = '-1';\
	");
	return 1;
}