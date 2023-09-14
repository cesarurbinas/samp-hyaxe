#define safe_db_query(%0) db_free_result(db_query(Database, %0))

// Misc config
#define MAX_BAD_LOGIN_ATTEMPS 	3
#define REP_MULTIPLIER 			32 // Original: 12
#define TIME_FOR_REP 			1020000
#define REP_FOR_PAYDAY 			3 // Original: 3

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
#define SERVER_COIN 			"Vulcoins"

// Needs
#define INTERVAL_HUNGRY_THIRST_DOWN     2 // 2 segundos de timer
#define THIRST_HOURS_STOPPED  9 // 9 horas parado si agua esta a 100 va a 0
#define HUNGRY_HOURS_STOPPED  12 // 12 horas parado si alimentacion esta a 100 va a 0

#define MIN_SECONDS_BETWEEN_TALKS 150 // Deben pasar al menos 1 segundos para volver a hablar.

#define MIN_VEHICLE_HEALTH 375.0

forward Float:GetDistanceBetweenPoints3D(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2);
forward Float:GetVehicleSpeed(vehicleid);
forward Float:frandom(Float:max, Float:min, dp);

/* Timers
0 = Kick
1 = Gangzone daño Rojo
2 = Añadir reputacion
3 = un/freeze player
4 = recuperar vida
5 = restart hambre sed
6 = esperando llamada
7 = esperar arrancar veh
8 = speedo
9 = cargando camion
10 = reciclando
11 = talando
12 = plantando
13 = gps mapa
14 = esposar
15 = jail time
16 = health down
17 = msg td
18 = intro
19 = anti cj
*/

#define MAX_PLAYER_MAP_GPS_POINTS 20
#define MAX_BANK_TRANSACTIONS_DIALOG 5

#define MAX_ROUTES  5
#define MAX_OBJECTS_PER_ROUTE 20
#define MAX_PLAYER_GPS_SAVES 10

#define MIN_TIME_BETWEEN_DOUBT 30 // Delay para dudas
#define MIN_TIME_BETWEEN_GLOBAL 2 // Delay para chat global
#define MIN_TIME_BETWEEN_ANN 300 // Delay para anuncios