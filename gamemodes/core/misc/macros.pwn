#define safe_db_query(%0) db_free_result(db_query(Database, %0))

// Misc config
#define MAX_BAD_LOGIN_ATTEMPS 	3
#define REP_MULTIPLIER 			64 // Original: 12
#define TIME_FOR_REP 			1020000
#define REP_FOR_PAYDAY 			3 // Original: 3
#define CMD_LOGGIN 				0

// VIP
#define MAX_NU_VEHICLES 		3
#define MAX_NU_PROPERTIES 		1
#define MAX_NU_WORKS 			8
#define MAX_NU_TOYS 			4
#define MAX_NU_VOBJECTS 		5
#define MAX_SU_VEHICLES 		6
#define MAX_SU_PROPERTIES 		4
#define MAX_SU_WORKS 			8
#define MAX_SU_VOBJECTS 		10

// Coin
#define SERVER_COIN 			"Hycoins"