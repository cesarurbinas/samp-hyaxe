new DB:Database;

ConnectDatabase()
{
	Database = db_open("DATABASE/server.db");
	if(Database == DB:0)
	{
		printf("[debug] Error al conectar con base de datos\n");
		SendRconCommand("exit");
	}
	else
	{
		printf("[debug] Base de datos conectada");
		db_free_result(db_query(Database,
		"\
			PRAGMA FOREIGN_KEYS = ON;\
			UPDATE `CUENTA` SET `CONNECTED` = '0', PLAYERID = '-1';\
		"));
	}
	return 1;
}