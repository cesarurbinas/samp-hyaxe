/*
 *      Hyaxe - San Andreas Multiplayer
 * 		Créditos: Atom
*/

#pragma option -(+
#pragma option -;+

/*
 * Modos de debug:
 *  - 0: No saldrá ningún mensaje de debug ni en la consola ni en el juego.
 *  - 1: Saldrán mensajes de debug solamente en la consola.
 *  - 2: Saldrán mensajes de debug en la consola y en el juego.
*/
#define DEBUG_MODE 1

#if DEBUG_MODE != 0
	#pragma option -d3
#endif

#pragma warning disable 239
#pragma warning disable 214

#pragma dynamic 15000

#include <a_samp>

#undef MAX_PLAYERS
#define MAX_PLAYERS 150

// Server information
#define SERVER_VERSION 			"Experimental v0.10 Snapshot 1 Build 10" // Old: Legacy v0.9 Build 10
#define SERVER_NAME 			"Hyaxe"
#define SERVER_WEBSITE 			"www.hyaxe.com"
#define SERVER_DISCORD 			"www.hyaxe.com/discord"

// Features
#define VOICE_CHAT
#define FINAL_BUILD

// Special events
//#define HALLOWEEN_MODE // Modo de halloween
//#define CHRISTMAS_MODE // Modo de navidad
//#define EASTER_MODE // Modo de pascuas

// Anti-Cheat
#define NO_SUSPICION_LOGS

#include <streamer>
#include <ColAndreas>
#include <YSF>

// Other Library
#include <physics>
#include <a_http>
#include <sscanf2>
#include <Pawn.RakNet> 
#include <Pawn.CMD>
#include <Pawn.Regex>
//#tryinclude <profiler>

// Macros
#include "core/misc/macros.pwn"
#include "core/misc/packets.pwn"

// Admin
#include "core/admin/level.pwn"

// Dialogs
#include "core/dialog/dialog_id.pwn"

// LGBT infection
//#include "core/lgbt_infection/header.pwn"

// Damage
#include "core/damage/header.pwn"

// Debes notifications
#include "core/notification/header.pwn"

// Libs
#include <hyaxe-anticheat>
#include <hyaxe-preview>
#include <route-tracing>
#include <strlib>
#include <extended-actor>
#include <hyaxe-select>
#include <discord-connector>
#include <discord-command>

// Anticheat
#include "core/anticheat/header.pwn"

// Voice Chat
#if defined VOICE_CHAT
    #include <hyaxe>
#endif

// Logger and flags
#include "core/logger/header.pwn"
#include "core/player/flags.pwn"

// Discord webhooks
#include "utils/discord/webhook.pwn"

// Lang
#include "core/languages/es.pwn"

// Database
#include "utils/database/db.pwn"

// Colors
#include "core/color/pallete.pwn"

// Weapons
#include "core/weapons/info.pwn"

// World
#include "core/world/extra.pwn"
#include "core/world/zones.pwn"

// Textdraws
#include "core/global/textdraws.pwn"

// Player util
#include "utils/player/header.pwn"

// Player
#include "core/player/account.pwn"
#include "core/player/temp.pwn"
#include "core/player/misc.pwn"
#include "core/player/character.pwn"
#include "core/player/textdraws.pwn"
#include "core/work/header.pwn"

// World
#include "core/world/header.pwn"
#include "core/world/callbacks.pwn"

// Damage
#include "core/damage/callbacks.pwn"
#include "core/damage/functions.pwn"
#include "core/damage/timers.pwn"

// Notification
#include "core/notification/callbacks.pwn"
#include "core/notification/functions.pwn"
#include "core/notification/timers.pwn"

// Miner
#include "core/work/miner/header.pwn"

// Farmer
#include "core/work/farmer/header.pwn"
#include "core/work/farmer/callbacks.pwn"
#include "core/work/farmer/functions.pwn"

// Miner
#include "core/work/miner/callbacks.pwn"
#include "core/work/miner/functions.pwn"

// Woodcutter
#include "core/work/woodcutter/header.pwn"
#include "core/work/woodcutter/callbacks.pwn"

// Player
#include "core/player/weapons.pwn"
#include "core/player/phone.pwn"
#include "core/player/toys.pwn"
#include "core/player/crew.pwn"
#include "core/player/visual_inventory.pwn"
#include "core/player/vehicles.pwn"
#include "core/player/objects.pwn"

// Properties 
#include "core/furniture/properties.pwn"
#include "core/furniture/list.pwn"

// Items
#include "core/item/data.pwn"
#include "utils/item/create.pwn"
#include "utils/item/info.pwn"
#include "utils/item/grab.pwn"

// Areas
#include "core/key_areas/areas.pwn"

// Audio
#include "core/audio/handlers.pwn"

// Vehicles
#include "core/vehicle/global_vehicles.pwn"
#include "core/vehicle/header.pwn"
#include "core/vehicle/tuning.pwn"
#include "core/vehicle/colors.pwn"
#include "core/vehicle/functions.pwn"
#include "core/vehicle/callbacks.pwn"

// Police
#include "core/police/info.pwn"
#include "core/police/callbacks.pwn"
#include "core/police/functions.pwn"
#include "core/police/commands.pwn"

// Animation preloading
#include "utils/animations/preload.pwn"

// Textdraws
#include "utils/textdraws/global.pwn"
#include "utils/textdraws/player.pwn"

// Textdraw easing
//#include "utils/easing/equations.pwn"

// Crews
#include "core/crew/header.pwn"
#include "core/crew/callbacks.pwn"
#include "core/crew/functions.pwn"

// Graffitis
#include "core/graffiti/header.pwn"
#include "core/graffiti/callbacks.pwn"
#include "core/graffiti/functions.pwn"

// World
#include "core/world/tele.pwn"
#include "utils/world/tele.pwn"
#include "core/world/balloon.pwn"
#include "utils/world/balloon.pwn"

// Black market
#include "core/black_market/header.pwn"
#include "core/black_market/callbacks.pwn"
#include "core/black_market/functions.pwn"

// Visual inventory
#include "utils/visual_inventory/show.pwn"
#include "utils/visual_inventory/accommodate.pwn"
#include "utils/visual_inventory/actions.pwn"

// Notifications
#include "utils/notification/show.pwn"

// World
//#include "core/world/enter_exit.pwn"

// Club's
#include "core/club/header.pwn"
#include "core/club/functions.pwn"
#include "core/club/callbacks.pwn"

// Dealer
#include "core/dealer/header.pwn"

// Player util
#include "utils/player/util.pwn"

// Edit mode
#include "utils/edit_mode/edit.pwn"
#include "utils/furniture/object.pwn"

// Admin
#include "core/admin/macros.pwn"
#include "core/admin/callbacks.pwn"
#include "core/admin/commands.pwn"

// Boombox
#include "core/boombox/main.pwn"

// Shops
#include "core/shops/electronic.pwn"

// Anticheat
#include "core/anticheat/functions.pwn"
//#include "core/anticheat/callbacks.pwn"
#include "core/anticheat/main.pwn"

// Soccer
#include "core/soccer/header.pwn"
#include "core/soccer/functions.pwn"
#include "core/soccer/callbacks.pwn"

// Stall
#include "core/stall/header.pwn"
#include "core/stall/functions.pwn"

// Dealers
#include "core/dealer/functions.pwn"

// Particles
#include "core/particles/functions.pwn"

// Store
#include "core/store/header.pwn"
#include "core/store/functions.pwn"
#include "core/store/callbacks.pwn"

// Fireworks
#include "core/fireworks/functions.pwn"

// Discord integration
#include "core/admin/discord.pwn"

// GUI
#include "core/gui/header.pwn"
#include "core/gui/functions.pwn"

// Channels
#include "core/channel/callbacks.pwn"
#include "core/channel/functions.pwn"

// Doors
#include "core/door/header.pwn"
#include "core/door/callbacks.pwn"
#include "core/door/functions.pwn"

// GPS
#include "core/gps/callbacks.pwn"
#include "core/gps/functions.pwn"

// Truck
#include "core/work/truck/callbacks.pwn"
#include "core/work/truck/functions.pwn"

// Trash
#include "core/work/trash/callbacks.pwn"
#include "core/work/trash/functions.pwn"

// Medic
#include "core/work/medic/callbacks.pwn"
#include "core/work/medic/functions.pwn"

// Select menu
#include "core/gui/select.pwn"

// Gamemodes
//#include "core/lgbt_infection/functions.pwn"
//#include "core/lgbt_infection/callbacks.pwn"

// Player commands
#include "core/player/commands.pwn"

// Special maps
#if defined HALLOWEEN_MODE
	#include "core/maps/halloween.pwn"
#endif

#if defined CHRISTMAS_MODE
	#include "core/maps/christmas.pwn"
#endif

#if defined EASTER_MODE
	#include "core/maps/easter.pwn"
#endif

main()
{
	printf("[info: hostname] "SERVER_HOSTNAME"");
	printf("[info: language] "SERVER_LANGUAGE"");
	printf("[info: website] "SERVER_WEBSITE"");
	printf("[info: discord] "SERVER_DISCORD"");
	printf("\n[build] Hyaxe SA-MP "SERVER_VERSION"\n");
}

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
/*enum b1g_enum
{
	PING,
	bool:FAKE_PING
}
new B1G_PLAYER[MAX_PLAYERS][b1g_enum];*/

=======
>>>>>>> refs/rewritten/hmm
enum
{
	TYPE_LEGAL,
	TYPE_ILLEGAL
};

=======
>>>>>>> 984894d (fixes)
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

#define MIN_VEHICLE_HEALTH 375.0
forward Float:GetDistanceBetweenPoints3D(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2);
forward Float:GetVehicleSpeed(vehicleid);
forward Float:frandom(Float:max, Float:min, dp);

=======
>>>>>>> 2298b56 (misc modules)
new Float:HARVEST_CHECKPOINTS[][] =
{
	{-328.332305, -1546.391357, 16.15409},
	{-250.803207, -1553.425415, 4.534295},
	{-224.260910, -1485.022827, 8.041003},
	{-308.437896, -1476.776977, 11.40934},
	{-283.487731, -1553.320068, 7.445997},
	{-258.756164, -1426.692993, 9.493670},
	{-178.887649, -1406.682250, 3.996473},
	{-177.676818, -1322.970581, 6.885325},
	{-305.899322, -1318.196533, 10.12089},
	{-325.471008, -1412.821777, 15.12606},
	{-191.962982, -1384.020019, 6.075732},
	{-214.637603, -1321.270507, 10.79362},
	{-263.975738, -1375.987426, 11.41642},
	{-308.705474, -1424.302001, 15.52844},
	{-287.710388, -1497.158325, 8.503927},
	{-387.908111, -1532.118774, 23.47214}
};

enum actors_info
{
	bool:a_IN_ROB,
	a_LAST_ROB,
	a_IN_ROB_PROGRESS
}
new a_TMP[MAX_ACTORS][actors_info];

=======
// Barrier
>>>>>>> 06e2d90 (fixes)
enum San_Andreas_Barriers_Info
{
	barrier_VEHICLE_TYPE,
	barrier_VEHICLE_TYPE_IN,
	Float:barrier_X,
	Float:barrier_Y,
	Float:barrier_Z,
	Float:barrier_ROTATION,
	barrier_INTERIOR,
	barrier_WORLD,
	barrier_OBJECT_ID,
	barrier_TIMER,
	bool:barrier_CLOSING
};
new San_Andreas_Barriers[][San_Andreas_Barriers_Info] = // usar VEHICLE_TYPE_NONE para que puedan pasar todos
{
	{VEHICLE_TYPE_WORK, WORK_NONE, -495.0410, -562.1307, 24.4932, 180.0, 0, 0, INVALID_STREAMER_ID, COLOR_WHITE, false}, // barrera camioneros
	{VEHICLE_TYPE_WORK, WORK_POLICE, 1544.69629, -1630.79651, 12.31840, -90.0, 0, 0, INVALID_STREAMER_ID, COLOR_WHITE, false}, // barrera POLICIA LS
	{VEHICLE_TYPE_WORK, WORK_POLICE, 2238.19897, 2450.41797, 9.80680, -90.0, 0, 0, INVALID_STREAMER_ID, COLOR_WHITE, false}, // barrera POLICIA LV
	{VEHICLE_TYPE_WORK, WORK_POLICE, -1572.20313, 658.83588, 6.07810, -90.0, 0, 0, INVALID_STREAMER_ID, COLOR_WHITE, false}, // barrera POLICIA SF 1
	{VEHICLE_TYPE_WORK, WORK_POLICE, -1701.42969, 687.59381, 23.88280, 90.0, 0, 0, INVALID_STREAMER_ID, COLOR_WHITE, false}, // barrera POLICIA SF 2
	{VEHICLE_TYPE_NONE, WORK_NONE, -1526.39063, 481.38281, 6.17970, 0.0, 0, 0, INVALID_STREAMER_ID, COLOR_WHITE, false}, // ejercito??
	{VEHICLE_TYPE_NONE, WORK_NONE, -82.1645, -1123.0260, 0.0373, 67.1102, 0, 0, INVALID_STREAMER_ID, COLOR_WHITE, false} // grua
};

// Mafia doors
enum
{
	DOOR_TYPE_ALL,
	DOOR_TYPE_MAFIA,
	DOOR_TYPE_USER,
	DOOR_TYPE_CREW
}

enum enum_MAFIA_DOORS
{
	mafia_door_MODELID,
	Float:mafia_door_X,
	Float:mafia_door_Y,
	Float:mafia_door_Z,
	Float:mafia_door_RZ,
	mafia_door_INTERIOR,
	mafia_door_WORLD,
	bool:mafia_door_CLOSED,
	mafia_door_TYPE,
	mafia_door_MAFIA,
	mafia_door_OBJECT_ID,
	mafia_door_TIMER
};
new MAFIA_DOORS[][enum_MAFIA_DOORS] =
{
	// Saints bloods
	{19912, 1523.2187, 2767.4199, 12.3219, -90.1996, 0, 0, true, DOOR_TYPE_MAFIA, WORK_MAFIA, INVALID_STREAMER_ID, -1},
	// MFB
	{19912, 2829.415527, -1561.982666, 12.851902, 89.400123, 0, 0, true, DOOR_TYPE_MAFIA, WORK_ENEMY_MAFIA, INVALID_STREAMER_ID, -1},
    {19912, 2821.517822, -1597.741455, 12.841901, -107.600006, 0, 0, true, DOOR_TYPE_MAFIA, WORK_ENEMY_MAFIA, INVALID_STREAMER_ID, -1},
    // Osborn
	{19912, -2350.201416, -662.360290, 120.741500, 30.000000, 0, 0, true, DOOR_TYPE_MAFIA, WORK_OSBORN, INVALID_STREAMER_ID, -1},
	{19912, -2464.229003, -488.837310, 105.451400, 30.000000, 0, 0, true, DOOR_TYPE_MAFIA, WORK_OSBORN, INVALID_STREAMER_ID, -1},
	{8378, -1166.879516, -202.562149, 23.027000, -65.000000, 0, 0, true, DOOR_TYPE_MAFIA, WORK_OSBORN, INVALID_STREAMER_ID, -1},
	// Maik santander
	{980, -272.37585, -2170.65015, 30.38364, 12.69130, 0, 0, true, DOOR_TYPE_USER, 8035, INVALID_STREAMER_ID, -1},
	// The Family Connor
	{19861, 424.916656, -1002.162231, 94.364418, 57.199977, 0, 0, true, DOOR_TYPE_MAFIA, WORK_CONNOR, INVALID_STREAMER_ID, -1},
	{974, 431.325744, -1005.314697, 90.215568, 2.699999, 0, 0, true, DOOR_TYPE_MAFIA, WORK_CONNOR, INVALID_STREAMER_ID, -1},
	{19912, 398.769317, -1005.721862, 94.109245, 181.399993, 0, 0, true, DOOR_TYPE_MAFIA, WORK_CONNOR, INVALID_STREAMER_ID, -1},
	{1495, 427.982513, -998.614196, 91.848510, 1.399999, 0, 0, true, DOOR_TYPE_MAFIA, WORK_CONNOR, INVALID_STREAMER_ID, -1},
	// Diviso Per Tutti
	{19313, 1308.06482, -2056.67798, 59.24806, 89.79598, 0, 0, true, DOOR_TYPE_MAFIA, WORK_DIVISO, INVALID_STREAMER_ID, -1}
};

// Camionero
new Float:LoadTrucksPoints[][] =
{
	{2430.781250, -2656.628662, 13.664062, 0.0},
	{2453.145751, -2568.576171, 13.656103, 0.0},
	{2453.460205, -2599.491943, 13.656026, 0.0},
	{2452.829101, -2627.258300, 13.663995 ,0.0}
};

enum TRUCK_VEHICLE_Info
{
	bool:truck_vehicle_LOADED,
	bool:truck_vehicle_LOADING,
	bool:truck_vehicle_UNLOADING,
	bool:truck_vehicle_DELIVERED,
	truck_vehicle_DRIVER_USER_ID,
	truck_vehicle_POINT,
};
new TRUCK_VEHICLE[MAX_VEHICLES][TRUCK_VEHICLE_Info];

enum Truck_Content_Info
{
	truck_content_EXP,
	truck_content_NAME[24],
	truck_content_MONEY,
	Float:truck_content_X,
	Float:truck_content_Y,
	Float:truck_content_Z
};
new Truck_Contents[][Truck_Content_Info] = //recos camionero
{
	{0, T_REC_0, 900, 1071.016235, -934.561523, 42.539730},
	{25, T_REC_1, 950, -185.473693, -280.008880, 1.603357},
	{50, T_REC_2, 1150, 667.775512, -458.185913, 16.335937},
	{70, T_REC_3, 1250, 645.397155, -522.815002, 16.335937},
	{100, T_REC_4, 1300, 1355.020385, 243.499816, 19.566932},
	{150, T_REC_5, 1400, 2337.287109, -53.487117, 26.484375},
	{200, T_REC_6, 1800, 2327.318115, -21.905473, 26.484375},
	{300, T_REC_7, 2000, 2338.490966, 60.734577, 26.484375}
};

// Basurero
enum Trash_Object_Info
{
	bool:trash_route_VALID,
	trash_route_OBJECTS,
	Float:trash_route_DISTANCE,
	trash_route_MONEY,
	trash_object_MODELID[MAX_OBJECTS_PER_ROUTE],
	Float:trash_object_X[MAX_OBJECTS_PER_ROUTE],
	Float:trash_object_Y[MAX_OBJECTS_PER_ROUTE],
	Float:trash_object_Z[MAX_OBJECTS_PER_ROUTE],
	Float:trash_object_RX[MAX_OBJECTS_PER_ROUTE],
	Float:trash_object_RY[MAX_OBJECTS_PER_ROUTE],
	Float:trash_object_RZ[MAX_OBJECTS_PER_ROUTE]
};
new TRASH_OBJECTS[MAX_ROUTES][Trash_Object_Info];
new TRASH_PLAYER_OBJECTS[MAX_PLAYERS][MAX_OBJECTS_PER_ROUTE];

enum TRASH_VEHICLES_INFO
{
	bool:trash_vehicle_JOB_STARTED,
	trash_vehicle_ROUTE,
	trash_vehicle_CP,
	trash_vehicle_DRIVER_ID,
	trash_vehicle_PASSENGER_ID
};
new TRASH_VEHICLES[MAX_VEHICLES][TRASH_VEHICLES_INFO];

=======
>>>>>>> 75def5d (store module)
// Atm
enum atm_bank_info
{
	atm_modelid,
	Float:atm_X,
	Float:atm_Y,
	Float:atm_Z,
	Float:atm_RX,
	Float:atm_RY,
	Float:atm_RZ,
	atm_WORLD,
	atm_INTERIOR
};
new ATM_BANK[][atm_bank_info] =
{
	{19324, 1319.238037, 340.231872, 19.152904, 0.000000, 0.000000, 64.699989},
	{19324, 2303.583740, 3.406874, 26.091539, 0.000000, 0.000000, 270.000000},
	{19324, 712.046325, -543.663879, 15.945730, 0.000000, 0.000000, 90.000000},
	{19324, 173.195358, -173.908737, 1.173805, 0.000000, 0.000000, 90.000000},
	{19324, 2021.162963, -1406.334594, 16.806646, 0.000000, 0.000000, 90.000000},
	{19324, 1186.187988, -1368.703002, 13.187811, 0.000000, 0.000000, 90.000000},
	{19324, 547.349426, -1261.883544, 16.384935, 0.000000, 0.000000, -144.400115},
	{19324, 1539.197265, -1603.699584, 13.170522, 0.000000, 0.000000, 270.000000},
	{19324, 1607.591796, -2204.406982, 13.177502, 0.000000, 0.000000, 180.000000},
	{19324, 2228.404052, -1715.259399, 13.155408, 0.000000, 0.000000, 270.000000},
	{19324, 1810.780395, -1876.730834, 13.224149, 0.000000, 0.000000, 450.000000},
	{19324, 1022.552307, -937.373962, 41.803440, 0.000000, 0.000000, -81.899993},
	{19324, 1918.745605, -1765.868041, 13.180094, 0.000000, 0.000000, 180.000000},
	{19324, -2127.926269, -2444.903320, 30.236198, 0.000000, 0.000000, 50.900016},
	{19324, -1976.735229, 309.361358, 34.794040, 0.000000, 0.000000, 0.000000},
	{19324, -1642.021728, 1207.664794, 6.816609, 0.000000, 0.000000, 133.800003},
	{19324, -2235.729736, 2370.975097, 4.633686, 0.000000, 0.000000, 135.800003},
	{19324, -2625.825927, 631.261413, 14.101068, 0.000000, 0.000000, 0.000000},
	{19324, -778.213012, 1501.443237, 23.508373, 0.000000, 0.000000, 0.000000},
	{19324, -792.469787, 2744.103515, 45.508438, 0.000000, 0.000000, 0.000000},
	{19324, -266.641815, 2686.121337, 62.293029, 0.000000, 0.000000, 90.000000},
	{19324, -1436.010009, 2617.189697, 55.444923, 0.000000, 0.000000, 90.000000},
	{19324, -75.126441, 1126.046264, 19.346963, 0.000000, 0.000000, 90.000000},
	{19324, 1627.274047, 1814.493408, 10.467087, 0.000000, 0.000000, 180.000000},
	{19324, 1704.924560, 1852.382324, 10.464756, 0.000000, 0.000000, 180.000000},
	{19324, 456.807006, -1486.700683, 30.736743, 0.000000, 0.000000, -70.699996},
	{19324, 2184.752197, -1139.379882, 24.193698, 0.000000, 0.000000, 270.000000},
	{2942, 1092.4537, -1803.6158, 13.2584, 0.0000, 0.0000, -176.1998},
	{2942, 1516.5130, 662.8303, 10.4726, 0.0000, 0.0000, 0.0000},
	{2942, 2340.5314, 2722.8740, 10.4767, 0.0000, 0.0000, 0.0000},
	{2942, 1977.8226, 716.3564, 10.4669, 0.0000, 0.0000, 88.8999},
	{2942, 2123.1389, 896.7738, 10.8202, 0.0000, 0.0000, 179.7000},
	{2942, 1661.3525, 1722.8962, 10.4866, 0.0000, 0.0000, 0.0000},
	{2942, 2072.2902, 2046.1706, 10.7098, 0.0000, 0.0000, 0.0000},
	{2942, 2102.2958, 2239.5700, 10.7026, 0.0000, 0.0000, 90.3999},
	{2942, 2187.6965, 2464.3610, 10.8439, 0.0000, 0.0000, 89.3000},
	{2942, 1580.5782, 2217.9934, 10.7060, 0.0000, 0.0000, 0.0000},
	{2942, 2791.2160, 2442.3928, 10.6767, 0.0000, 0.0000, -45.4999},
	{2942, -2420.1733, 983.2249, 44.9044, 0.0000, 0.0000, 89.1000},
	{2942, 1443.4044, 2644.8984, 11.0340, 0.0000, 0.0000, 0.0000},
	{2942, 1135.2883, 2043.7694, 10.4476, 0.0000, 0.0000, 179.2000},
	{2942, 2646.2478, 1129.6943, 10.7755, 0.0000, 0.0000, 0.0000},
	{2942, 2638.5576, 1678.3454, 10.6455, 0.0000, 0.0000, -90.8999},
	{2942, 2539.9543, 1847.2352, 10.6225, 0.0000, 0.0000, 0.0000},
	{2942, 2539.9543, 1797.7027, 10.6225, 0.0000, 0.0000, 179.9999},
	{2942, 2118.0822, 1382.8548, 10.4507, 0.0000, 0.0000, 0.0000},
	{2942, 1858.6237, 969.3432, 10.4221, 0.0000, 0.0000, 90.8999},
	{2942, 1557.5832, 987.2445, 10.4301, 0.0000, 0.0000, 89.9000},
	{2942, -135.2062, 1157.8636, 19.3804, 0.0000, 0.0000, 0.0000},
	{2942, -311.3013, 1299.4381, 53.2731, 0.0000, 0.0000, 89.5000},
	{2942, -89.8232, 1383.4298, 9.9032, 0.0000, 0.0000, 99.1999},
	{2942, -864.0909, 1536.5919, 22.2435, 0.0000, 0.0000, -179.4999},
	{2942, -1215.7551, 1825.5415, 41.3490, 0.0000, 0.0000, 45.5000},
	{2942, -1453.0655, 2592.3315, 55.4440, 0.0000, 0.0000, 179.5999},
	{2942, -1939.3734, 2375.9919, 49.3162, 0.0000, 0.0000, 110.7000},
	{2942, -2019.9095, -101.9899, 34.8026, 0.0000, 0.0000, 178.2000},
	{2942, -1960.1308, 153.5587, 27.3050, 0.0000, 0.0000, 89.6999},
	{2942, -1694.9470, 413.3671, 6.8242, 0.0000, 0.0000, 45.3000},
	{2942, -2683.9221, -283.5526, 6.7930, 0.0000, 0.0000, -134.5000},
	{2942, -2677.7692, 259.9306, 4.2935, 0.0000, 0.0000, -179.6000},
	{2942, -1876.8988, 824.4879, 34.8016, 0.0000, 0.0000, 179.1000},
	{2942, -2431.5390, 754.7960, 34.7489, 0.0000, 0.0000, 0.0000},
	{2942, -2491.6191, -33.6728, 25.3861, 0.0000, 0.0000, -90.3999},
	{2942, -2237.9602, 577.9385, 34.7804, 0.0000, 0.0000, 0.0000},
	{2942, -1927.5317, 719.1495, 45.0831, 0.0000, 0.0000, -179.6000},
	{2942, -1529.3118, 1015.6362, 6.7715, 0.0000, 0.0000, 0.0000},
	{2942, -1718.2503, 1355.0715, 6.8231, 0.0000, 0.0000, -46.3000},
	{2942, -1917.7750, 558.0651, 34.7785, 0.0000, 0.0000, 91.0000},
	{19324, 1146.10986, -2068.84424, 68.59467, 0.00000, 0.00000, 179.49406}
};

=======
>>>>>>> 9653897 (balloon module)
new
	DIALOG_FOOD_PIZZA_String[400],
	DIALOG_FOOD_CLUCKIN_String[400],
	DIALOG_FOOD_BURGER_String[400],
	DIALOG_247_LIST_String[34 + 55 * sizeof Supermarket_Product_List],
	DIALOG_PLAYER_GPS_SITE_0_String[90 * (sizeof(Hospital_Spawn_Positions) + 1)],
	DIALOG_PLAYER_GPS_SITE_7_String[90 * (sizeof(SELL_VEHICLES_SHOPS_SPAWN) + 1)],
	DIALOG_CREATE_CREW_COLOR_String[164];

<<<<<<< HEAD
IRPC:VehicleDestroyed(playerid, BitStream:bs)
{
    new vehicleid;

    BS_ReadUint16(bs, vehicleid);

    if (GetVehicleModel(vehicleid) < 400)
    {
        return 0;
    }

    return OnVehicleRequestDeath(vehicleid, playerid);
}

forward OnVehicleRequestDeath(vehicleid, killerid);
public OnVehicleRequestDeath(vehicleid, killerid)
{
	#if DEBUG_MODE == 1
		printf("OnVehicleRequestDeath %d %d",vehicleid, killerid); // debug juju
	#endif

    new Float:health;

    GetVehicleHealth(vehicleid, health);

    if (health >= 250.0)
    {
        return 0;
    }
    return 1;
}

IPacket:UNOCCUPIED_SYNC(playerid, BitStream:bs)
{
    new unoccupiedData[PR_UnoccupiedSync];
 
    BS_IgnoreBits(bs, 8);
    BS_ReadUnoccupiedSync(bs, unoccupiedData);
 
    if (GetVehicleModel(unoccupiedData[PR_vehicleId]) == 425) return 0;

    if ((unoccupiedData[PR_roll][0] == unoccupiedData[PR_direction][0]) &&
        (unoccupiedData[PR_roll][1] == unoccupiedData[PR_direction][1]) &&
        (unoccupiedData[PR_roll][2] == unoccupiedData[PR_direction][2])
    )
    {
        return 0;
    }

    if ((floatabs(unoccupiedData[PR_roll][0]) > 1.0) ||
        (floatabs(unoccupiedData[PR_roll][1]) > 1.0) ||
        (floatabs(unoccupiedData[PR_roll][2]) > 1.0) ||
        (floatabs(unoccupiedData[PR_direction][0]) > 1.0) ||
        (floatabs(unoccupiedData[PR_direction][1]) > 1.0) ||
        (floatabs(unoccupiedData[PR_direction][2]) > 1.0) ||
        (floatabs(unoccupiedData[PR_position][0]) > 20000.0) ||
        (floatabs(unoccupiedData[PR_position][1]) > 20000.0) ||
        (floatabs(unoccupiedData[PR_position][2]) > 20000.0) ||
        (floatabs(unoccupiedData[PR_angularVelocity][0]) > 1.0) ||
        (floatabs(unoccupiedData[PR_angularVelocity][1]) > 1.0) ||
        (floatabs(unoccupiedData[PR_angularVelocity][2]) > 1.0) ||
        (floatabs(unoccupiedData[PR_velocity][0]) > 100.0) ||
        (floatabs(unoccupiedData[PR_velocity][1]) > 100.0) ||
        (floatabs(unoccupiedData[PR_velocity][2]) > 100.0)
    )
    {
        return 0;
    }

    if ((unoccupiedData[PR_angularVelocity][0] >= 90000) &&
        (unoccupiedData[PR_angularVelocity][1] >= 90000) &&
        (unoccupiedData[PR_angularVelocity][2] >= 90000)
    )
    {
        return 0;
    }
    return 1;
}

IPacket:VEHICLE_SYNC(playerid, BitStream:bs)
{
    new inCarData[PR_InCarSync];

    BS_IgnoreBits(bs, 8);
    BS_ReadInCarSync(bs, inCarData);

    if (PLAYER_TEMP[playerid][py_KICKED]) return 0;

   	if (IsPlayerInAnyVehicle(playerid) && PLAYER_TEMP[playerid][py_VEHICLEID] != inCarData[PR_vehicleId])
	{
		if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] >= 2) return 1;
		
		new string[128];
		format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): Vehicle Grabber (1)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
		SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
		SendDiscordWebhook(string, 1);

		SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Razón: Vehicle Grabber (1)");
		KickEx(playerid, 500);
		return 0;
	}
    return 1;
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

    return 1;
}

NeuroJail(playerid, time, const reason[])
{
    StopAudioStreamForPlayer(playerid);
    CancelEdit(playerid);
    EndPlayerJob(playerid);

    PLAYER_MISC[playerid][MISC_JAILS] ++;
    SavePlayerMisc(playerid);

    if (PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) EndPhoneCall(playerid);
    if (PLAYER_TEMP[playerid][py_GPS_MAP]) HidePlayerGpsMap(playerid);

    JailPlayer(playerid, time * 60);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

    new str[144];
    format(str, 144, "[ADMIN] NeuroAdmin jaileó a %s (%d) por %s minutos: %s.", ACCOUNT_INFO[playerid][ac_NAME], playerid, TimeConvert(time * 60), reason);
    SendMessageToAdmins(COLOR_ANTICHEAT, str);

    new webhook[144];
    format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
	SendDiscordWebhook(webhook, 1);

	new dialog[250];
	format(dialog, sizeof dialog, ""COL_WHITE"NeuroAdmin te jaileó, razón: %s.\nRecuerde que a los 50 jails sera baneado permanentemente.", reason);
	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Entiendo", "");
	return 1;
}

<<<<<<< HEAD
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

            if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
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
			}
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
		            	new str_text[144];
						format(str_text, sizeof(str_text), "[ANTI-CHEAT] Kick sobre %s (%d): Fly (1)", PLAYER_TEMP[playerid][py_NAME], playerid);
					    SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 2);
					    SendDiscordWebhook(str_text, 1);
					    SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Razón: Fly (1)");
						KickEx(playerid, 500);
						return 0;
		            }
		        }
		        case 958, 959:
		        {
		        	if (onFootData[PR_weaponId] != WEAPON_PARACHUTE)
					{
						new str_text[144];
						format(str_text, sizeof(str_text), "[ANTI-CHEAT] Kick sobre %s (%d): Fly (2)", PLAYER_TEMP[playerid][py_NAME], playerid);
					    SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 2);
					    SendDiscordWebhook(str_text, 1);
					    SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Razón: Fly (2)");
						KickEx(playerid, 500);
						return 0;
					}
		        }
		        case 799:
		        {
		            if (!IsPlayerInAnyVehicle(playerid))
		            {
						new str_text[144];
						format(str_text, sizeof(str_text), "[ANTI-CHEAT] Kick sobre %s (%d): Anti-L", PLAYER_TEMP[playerid][py_NAME], playerid);
					    SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 2);
					    SendDiscordWebhook(str_text, 1);
					    SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Razón: Anti-L");
						KickEx(playerid, 500);
						return 0;
		            }
		        }
		        case 695:
		        {
		            if (GetPlayerInterior(playerid) == 0)
		            {
		            	new str_text[144];
						format(str_text, sizeof(str_text), "[ANTI-CHEAT] Kick sobre %s (%d): SleepAnim", PLAYER_TEMP[playerid][py_NAME], playerid);
					    SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 2);
					    SendDiscordWebhook(str_text, 1);
					    SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Razón: SleepAnim");
						KickEx(playerid, 500);
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
							new str_text[144];
							format(str_text, sizeof(str_text), "[ANTI-CHEAT] Kick sobre %s (%d): Fly (%f, %f)", PLAYER_TEMP[playerid][py_NAME], playerid, depth, playerdepth);
						    SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 2);
						    SendDiscordWebhook(str_text, 1);
						    SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Razón: Fly (3)");
							KickEx(playerid, 500);
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

			    	if (PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_VALID] == false)
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
				    		/*new string[128];
							format(string, sizeof(string), "[ANTI-CHEAT] Aviso sobre %s (%d): Ammo (client: %d, server: %d, check: %d)", PLAYER_TEMP[playerid][py_NAME], playerid, weapon_ammo, PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_AMMO], server_ammo);
							SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
							SendDiscordWebhook(string, 1);*/
				    		OnPlayerCheatDetected(playerid, CHEAT_AMMO, weapon_ammo);
				    	}
				    }
				}
		    	//SendClientMessageEx(playerid, -1, "id: %d, ammo: %d, wammo: %d, slot: %d, pid: %d", weapon_id, weapon_ammo, PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_AMMO], weapon_slot, onFootData[PR_weaponId]);
		    }

		    if (onFootData[PR_specialAction] == SPECIAL_ACTION_USEJETPACK)
			{
				new dialog[250];
				format(dialog, sizeof dialog, ""COL_WHITE"Fuiste baneado, razón: Jetpack");
				ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
				
				AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, "Jetpack");

				KickEx(playerid, 500);
				PLAYER_MISC[playerid][MISC_BANS] ++;
				SavePlayerMisc(playerid);

				new str[144];
				format(str, 144, "[ADMIN] NeuroAdmin baneó a %s (%d): Jetpack.", ACCOUNT_INFO[playerid][ac_NAME], playerid);
				SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

				new webhook[144];
				format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
				SendDiscordWebhook(webhook, 1);
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
            	new string[128];
				format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): NOP Animation", ACCOUNT_INFO[playerid][ac_NAME], playerid);
				SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
				SendDiscordWebhook(string, 1);
				KickEx(playerid);
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

<<<<<<< HEAD
/*public OnOutcomingRPC(playerid, rpcid, BitStream:bs)
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
		    		if (B1G_PLAYER[i][FAKE_PING] == true) ping = B1G_PLAYER[i][PING];
					else
					{
						ping = GetPlayerPing(i);
					}

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
}*/

/*SetPlayerFakePing(playerid, ping)
{
	if (!IsPlayerConnected(playerid)) return 0;

	if (ping == -1) return B1G_PLAYER[playerid][FAKE_PING] = false;

	B1G_PLAYER[playerid][FAKE_PING] = true;
	B1G_PLAYER[playerid][PING] = ping;
	return 1;
}*/

=======
>>>>>>> refs/rewritten/hmm
ClearPlayerChatBox(playerid, ammount = 20)
{
	for(new i = 0; i != ammount; i++) SendClientMessage(playerid, -1, " ");
	return 1;
}

=======
>>>>>>> 2298b56 (misc modules)
ReturnTimelapse(start, till)
{
    new ret[32];
	new seconds = till - start;

	const
		MINUTE = 60,
		HOUR = 60 * MINUTE,
		DAY = 24 * HOUR,
		MONTH = 30 * DAY;

	if (seconds == 1)
		format(ret, sizeof(ret), "hace un segundo");
	if (seconds < (1 * MINUTE))
		format(ret, sizeof(ret), "hace %i segundos", seconds);
	else if (seconds < (2 * MINUTE))
		format(ret, sizeof(ret), "hace un minuto");
	else if (seconds < (45 * MINUTE))
		format(ret, sizeof(ret), "hace %i minutos", (seconds / MINUTE));
	else if (seconds < (90 * MINUTE))
		format(ret, sizeof(ret), "hace una hora");
	else if (seconds < (24 * HOUR))
		format(ret, sizeof(ret), "hace %i horas", (seconds / HOUR));
	else if (seconds < (48 * HOUR))
		format(ret, sizeof(ret), "hace un día");
	else if (seconds < (30 * DAY))
		format(ret, sizeof(ret), "hace %i días", (seconds / DAY));
	else if (seconds < (12 * MONTH))
    {
		new months = floatround(seconds / DAY / 30);
      	if (months <= 1)
			format(ret, sizeof(ret), "hace un mes");
      	else
			format(ret, sizeof(ret), "%i meses", months);
	}
    else
    {
      	new years = floatround(seconds / DAY / 365);
      	if (years <= 1)
			format(ret, sizeof(ret), "hace un año");
      	else
			format(ret, sizeof(ret), "%i años", years);
	}
	return ret;
}
=======
>>>>>>> 75def5d (store module)

ResetPlayerVariables(playerid)
{
	minigames_page[playerid] = 0;
	in_main_menu[playerid] = false;
	in_gamemode_menu[playerid] = false;

	new temp_PLAYER_TEMP[Temp_Enum]; PLAYER_TEMP[playerid] = temp_PLAYER_TEMP;
	new temp_ACCOUNT_INFO[Account_Enum]; ACCOUNT_INFO[playerid] = temp_ACCOUNT_INFO;
	new temp_CHARACTER_INFO[Character_Enum]; CHARACTER_INFO[playerid] = temp_CHARACTER_INFO;
	new temp_BANK_ACCOUNT[Bank_Account_Enum]; BANK_ACCOUNT[playerid] = temp_BANK_ACCOUNT;

	CancelTracing(playerid);

	new temp_PLAYER_TOYS[Player_Toys_Info];
	for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++) PLAYER_TOYS[playerid][i] = temp_PLAYER_TOYS;

	new temp_PLAYER_POCKET[Player_Pocket_Enum];
	for(new i = 0; i != MAX_PLAYER_POCKET_OBJECTS; i ++) PLAYER_POCKET[playerid][i] = temp_PLAYER_POCKET;

<<<<<<< HEAD
	//B1G_PLAYER[playerid][FAKE_PING] = false;

=======
>>>>>>> refs/rewritten/hmm
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

DestroyPlayerCheckpoints(playerid)
{
	if (IsValidDynamic3DTextLabel(PLAYER_TEMP[playerid][py_POLICE_LABEL]))
	{
		DestroyDynamic3DTextLabel(PLAYER_TEMP[playerid][py_POLICE_LABEL]);
		PLAYER_TEMP[playerid][py_POLICE_LABEL] = Text3D:INVALID_STREAMER_ID;
	}

	if (IsValidDynamic3DTextLabel(PLAYER_TEMP[playerid][py_ADMIN_LABEL]))
	{
		DestroyDynamic3DTextLabel(PLAYER_TEMP[playerid][py_ADMIN_LABEL]);
		PLAYER_TEMP[playerid][py_ADMIN_LABEL] = Text3D:INVALID_STREAMER_ID;
	}

	if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_GPS_CHECKPOINT]))
	{
		DestroyDynamicCP(PLAYER_TEMP[playerid][py_GPS_CHECKPOINT]);
    	CancelTracing(playerid);
		PLAYER_TEMP[playerid][py_GPS_CHECKPOINT] = INVALID_STREAMER_ID;
	}

	if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]))
	{
		DestroyDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]);
    	CancelTracing(playerid);
		PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT] = INVALID_STREAMER_ID;
	}

	if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT]))
	{
		DestroyDynamicCP(PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT]);
    	CancelTracing(playerid);
		PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT] = INVALID_STREAMER_ID;
	}

	if (IsValidDynamicRaceCP(PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT]))
	{
		DestroyDynamicRaceCP(PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT]);
		PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT] = INVALID_STREAMER_ID;
	}
	return 1;
}

Log(const nombre[], const texto[])
{
    new dir[32], File:arc, txt[256];
    new log_D, log_M, log_A;
    new log_Seg, log_Min, log_Hor;

    getdate(log_A, log_M, log_D);
    gettime(log_Hor, log_Min, log_Seg);

    format(dir, sizeof(dir), "/LOGS_FILES/%s.log", nombre);
    format(txt, sizeof(txt), "[%02d/%02d/%d|%02d:%02d:%02d] %s\r\n", log_D, log_M, log_A,
    log_Hor, log_Min, log_Seg, texto);

    if (!fexist(dir))
    arc = fopen(dir, io_write);
    else
    arc = fopen(dir, io_append);
    fwrite(arc, txt);
    fclose(arc);
    return 1;
}

forward InitRandomGangEvent();
public InitRandomGangEvent()
{
	#if DEBUG_MODE == 1
		printf("InitRandomGangEvent"); // debug juju
	#endif

	/*new event = minrand(0, 6);
	switch(event)
	{
		case 3:
		{
			new market_id = minrand(0, sizeof(BLACK_MARKET_OBJ));
			InitBlackMarket(market_id);
		}
		default:
		{
			new graff_id = minrand(0, sizeof(GRAFFITIS_OBJ));
			InitGraffiti(graff_id);
		}
	}*/
	new graff_id = minrand(0, sizeof(GRAFFITIS_OBJ));
	InitGraffiti(graff_id);
	return 1;
}

/*GenString(strDest[], strLen = 10)
{
    while(strLen --)
        strDest[strLen] = random(2) ? (random(26) + (random(2) ? 'a' : 'A')) : (random(10) + '0');
}

AddGiftCode(code[], type, extra)
{
	new DB_Query[160];
	format
	(
		DB_Query, sizeof DB_Query,
		"\
			INSERT INTO `GIFTS_CODES`\
			(\
				`CODE`, `TYPE`, `EXTRA`, `USED`\
			)\
			VALUES\
			(\
				'%q', '%d', '%d', '0'\
			);\
		",
		code,
		type,
		extra
	);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}*/

/*forward SendGift();
public SendGift()
{
	#if DEBUG_MODE == 1
		printf("SendGift"); // debug juju
	#endif

	for(new i = 0, j = 10; i <= j; i++)
	{
		new
			code[10],
			type = minrand(0, 5),
			extra
		;

		switch(type)
		{
			case 0, 1, 2, 3, 5: type = 0;
			case 4: type = 3;
		}

		if (type == 0) extra = minrand(300, 1000);
		else extra = minrand(1, 2);

		GenString(code, 8);

		AddGiftCode(code, type, extra);
		HTTP(0, HTTP_HEAD, sprintf("51.161.31.157:1337/add_gift_from_server/%s", code), "", "");
	}
	return 1;
}*/

forward GiveAutoGift();
public GiveAutoGift()
{
	#if DEBUG_MODE == 1
		printf("GiveAutoGift"); // debug juju
	#endif

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
			{
				GivePlayerCash(i, 10000, false);
				ShowPlayerMessage(i, "~r~[REGALO]~w~ Te han dado 10.000$", 4);
			}
		}
	}
	return 1;
}

<<<<<<< HEAD
public OnGameModeInit()
{
	CA_RemoveBarriers();
	RemoveObjectCollisions();

	CA_Init();

	//SvDebug(SV_TRUE);

    // Server
	SetGameModeText(SERVER_MODE);

	SendRconCommand("hostname Hyaxe Dev | "SERVER_VERSION"");
	
	#if defined FINAL_BUILD
		SetTimer("GiveAutoGift", 300000, false);
		SendRconCommand("hostname "SERVER_HOSTNAME"");
    	//SetTimer("SendGift", 120000, true);
	#endif

	#if defined HALLOWEEN_MODE
		SendRconCommand("hostname "HALLOWEEN_HOSTNAME"");
		HalloweenMap();
	#endif

	#if defined CHRISTMAS_MODE
		SendRconCommand("hostname "CHRISTMAS_HOSTNAME"");
		ChristmasMap();
	#endif

	#if defined EASTER_MODE
		SendRconCommand("hostname "EASTER_HOSTNAME"");
		EasterMap();
	#endif

	SendRconCommand("language "SERVER_LANGUAGE"");
	SendRconCommand("weburl "SERVER_WEBSITE"");
	SendRconCommand("minconnectiontime 50");
	SendRconCommand("ackslimit 10000");
	SendRconCommand("messageslimit 5000");
	//SendRconCommand("conncookies 0");
	//SendRconCommand("cookielogging 0");
	SendRconCommand("chatlogging 1");

	UsePlayerPedAnims();
	DisableInteriorEnterExits();
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_GLOBAL);
	SetNameTagDrawDistance(25.0);
	EnableStuntBonusForAll(false);
	ManualVehicleEngineAndLights();
	FormatDialogStrings();

	SanAndreas();

	LoadServerInfo();
	UpdateEconomy();
	CreateGraffitis();
	CreateMinerRocks();

	SetTimer("UpdateWantedLevelMark", 30000, true);
<<<<<<< HEAD
	SetTimer("GiveAutoGift", 300000, false);
<<<<<<< HEAD
	//SetTimer("SendGift", 60000, true);
<<<<<<< HEAD
=======
>>>>>>> refs/rewritten/Retoques
=======
<<<<<<< HEAD
>>>>>>> 96c70ef (Optimizaciones)
=======
>>>>>>> 5643c50 (Arreglar cagada de atom)
>>>>>>> refs/rewritten/master-45
=======
	//SetTimer("SendGift", 120000, true);
>>>>>>> 882d7df (Horas del /est estaban bugeadas)
	SetTimer("FirstGraffitiAnnounce", 1500000, false);
	
=======

<<<<<<< HEAD
	#if defined FINAL_BUILD
		SetTimer("GiveAutoGift", 300000, false);
    	//SetTimer("SendGift", 120000, true);
	#endif

<<<<<<< HEAD
	SetTimer("FirstGraffitiAnnounce", 1500000, false);	
>>>>>>> 119039e (oooo chad on da house)
=======
=======
>>>>>>> aadac42 (bugsfixes)
	SetTimer("FirstGraffitiAnnounce", 1500000, false);
<<<<<<< HEAD
	SetTimer("InitLastGraffiti", 120000, false);
>>>>>>> abcefe6 (Iniciar el ultimo graffiti)
=======
	SetTimer("InitLastGraffiti", 60000, false);
>>>>>>> 58fa9ab (Graffitis random)

	GraffitiGetTime = gettime();
	MarketGetTime = gettime();
	
	/*lgbt_timers[0] = SetTimer("ChangeLgbtMap", 600000, false);
	lgbt_map_index = random(sizeof(LGBT_MAPS));*/

    Log("status", "Servidor iniciado ("SERVER_VERSION").");
    SendDiscordWebhook(":fire: Servidor iniciado ("SERVER_VERSION").", 1);
    ServerInitTime = gettime();
    return 1;
}

RemoveObjectCollisions()
{
	//taller temple
    CA_RemoveBuilding(5849, 1046.6797, -935.1953, 46.9922, 0.25);
    CA_RemoveBuilding(5854, 992.5313, -962.7344, 60.7813, 0.25);
    CA_RemoveBuilding(1266, 1029.1797, -939.5156, 52.7500, 0.25);
    CA_RemoveBuilding(1260, 1029.1797, -939.5156, 52.7500, 0.25);
    CA_RemoveBuilding(1294, 1034.7891, -950.3750, 46.4297, 0.25);
    CA_RemoveBuilding(5848, 1046.6797, -935.1953, 46.9922, 0.25);

    // base mc maik
    CA_RemoveBuilding(3276, -300.9375, -2148.4219, 28.3203, 0.25);
    CA_RemoveBuilding(3276, -297.1875, -2141.5703, 28.3203, 0.25);
    CA_RemoveBuilding(705, -220.5391, -2281.0156, 27.3906, 0.25);
    CA_RemoveBuilding(705, -208.9766, -2306.9531, 27.8906, 0.25);
    CA_RemoveBuilding(3276, -257.5625, -2241.5234, 28.3203, 0.25);
    CA_RemoveBuilding(3276, -263.8672, -2231.5781, 28.3203, 0.25);
    CA_RemoveBuilding(3276, -245.3984, -2225.9922, 28.6875, 0.25);
    CA_RemoveBuilding(3276, -245.4375, -2236.6875, 28.4141, 0.25);
    CA_RemoveBuilding(3276, -249.2031, -2244.3984, 28.4141, 0.25);
    CA_RemoveBuilding(703, -234.4453, -2259.2188, 28.0781, 0.25);
    CA_RemoveBuilding(17038, -280.1875, -2167.7031, 27.7891, 0.25);
    CA_RemoveBuilding(17037, -288.2734, -2163.5000, 30.0938, 0.25);
    CA_RemoveBuilding(17036, -285.3984, -2151.0469, 27.3828, 0.25);
    CA_RemoveBuilding(3276, -285.9297, -2139.2734, 28.3203, 0.25);
    CA_RemoveBuilding(3276, -274.5781, -2138.6328, 28.4922, 0.25);
    CA_RemoveBuilding(17039, -260.5391, -2182.6094, 26.6875, 0.25);
    CA_RemoveBuilding(17040, -257.5313, -2202.8359, 27.5781, 0.25);
    CA_RemoveBuilding(3276, -254.1406, -2170.7969, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -263.3906, -2140.5938, 28.8281, 0.25);
    CA_RemoveBuilding(3276, -258.0000, -2148.1094, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -256.2500, -2159.3203, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -251.3047, -2181.8047, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -248.0391, -2192.8125, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -244.8594, -2203.8672, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -243.7266, -2214.7266, 28.8984, 0.25);

	//Objetos removidos de LCN HQ
    CA_RemoveBuilding(726, 743.2422, -1151.4766, 20.8750, 0.25);
    CA_RemoveBuilding(733, 778.2109, -1207.2031, 13.5391, 0.25);
    CA_RemoveBuilding(729, 731.3906, -1223.1641, 12.5078, 0.25);
    CA_RemoveBuilding(733, 717.1172, -1236.2266, 12.0625, 0.25);
    CA_RemoveBuilding(726, 680.8594, -1293.3984, 12.3984, 0.25);
    CA_RemoveBuilding(732, 782.7969, -1304.0781, 12.3906, 0.25);
    CA_RemoveBuilding(620, 651.1094, -1305.9766, 12.5859, 0.25);
    CA_RemoveBuilding(620, 678.4844, -1251.7891, 12.0313, 0.25);
    CA_RemoveBuilding(620, 746.4922, -1303.4141, 11.6719, 0.25);
    CA_RemoveBuilding(620, 760.4531, -1304.1328, 12.2813, 0.25);
    CA_RemoveBuilding(620, 782.3438, -1277.8359, 12.2031, 0.25);
    CA_RemoveBuilding(620, 783.0625, -1245.7969, 12.5938, 0.25);

	// heix
	CA_RemoveBuilding(3578, 2526.4297, -2561.3047, 13.1719, 0.25);

	// plaza
	CA_RemoveBuilding(4057, 1479.5547, -1693.1406, 19.5781, 0.25);
	CA_RemoveBuilding(4210, 1479.5625, -1631.4531, 12.0781, 0.25);
	CA_RemoveBuilding(713, 1457.9375, -1620.6953, 13.4531, 0.25);
	CA_RemoveBuilding(713, 1496.8672, -1707.8203, 13.4063, 0.25);
	CA_RemoveBuilding(1283, 1430.1719, -1719.4688, 15.6250, 0.25);
	CA_RemoveBuilding(1226, 1451.6250, -1727.6719, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1467.9844, -1727.6719, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1485.1719, -1727.6719, 16.4219, 0.25);
	CA_RemoveBuilding(1280, 1468.9844, -1713.5078, 13.4531, 0.25);
	CA_RemoveBuilding(1231, 1479.6953, -1716.7031, 15.6250, 0.25);
	CA_RemoveBuilding(1226, 1505.1797, -1727.6719, 16.4219, 0.25);
	CA_RemoveBuilding(1280, 1488.7656, -1713.7031, 13.4531, 0.25);
	CA_RemoveBuilding(1289, 1504.7500, -1711.8828, 13.5938, 0.25);
	CA_RemoveBuilding(1258, 1445.0078, -1704.7656, 13.6953, 0.25);
	CA_RemoveBuilding(1226, 1433.7109, -1702.3594, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1433.7109, -1676.6875, 16.4219, 0.25);
	CA_RemoveBuilding(1258, 1445.0078, -1692.2344, 13.6953, 0.25);
	CA_RemoveBuilding(1226, 1433.7109, -1656.2500, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1433.7109, -1636.2344, 16.4219, 0.25);
	CA_RemoveBuilding(712, 1445.8125, -1650.0234, 22.2578, 0.25);
	CA_RemoveBuilding(1226, 1433.7109, -1619.0547, 16.4219, 0.25);
	CA_RemoveBuilding(1283, 1443.2031, -1592.9453, 15.6250, 0.25);
	CA_RemoveBuilding(673, 1457.7266, -1710.0625, 12.3984, 0.25);
	CA_RemoveBuilding(620, 1461.6563, -1707.6875, 11.8359, 0.25);
	CA_RemoveBuilding(1280, 1468.9844, -1704.6406, 13.4531, 0.25);
	CA_RemoveBuilding(700, 1463.0625, -1701.5703, 13.7266, 0.25);
	CA_RemoveBuilding(1231, 1479.6953, -1702.5313, 15.6250, 0.25);
	CA_RemoveBuilding(673, 1457.5547, -1697.2891, 12.3984, 0.25);
	CA_RemoveBuilding(1280, 1468.9844, -1694.0469, 13.4531, 0.25);
	CA_RemoveBuilding(1231, 1479.3828, -1692.3906, 15.6328, 0.25);
	CA_RemoveBuilding(4186, 1479.5547, -1693.1406, 19.5781, 0.25);
	CA_RemoveBuilding(620, 1461.1250, -1687.5625, 11.8359, 0.25);
	CA_RemoveBuilding(700, 1463.0625, -1690.6484, 13.7266, 0.25);
	CA_RemoveBuilding(641, 1458.6172, -1684.1328, 11.1016, 0.25);
	CA_RemoveBuilding(625, 1457.2734, -1666.2969, 13.6953, 0.25);
	CA_RemoveBuilding(1280, 1468.9844, -1682.7188, 13.4531, 0.25);
	CA_RemoveBuilding(712, 1471.4063, -1666.1797, 22.2578, 0.25);
	CA_RemoveBuilding(1231, 1479.3828, -1682.3125, 15.6328, 0.25);
	CA_RemoveBuilding(625, 1458.2578, -1659.2578, 13.6953, 0.25);
	CA_RemoveBuilding(712, 1449.8516, -1655.9375, 22.2578, 0.25);
	CA_RemoveBuilding(1231, 1477.9375, -1652.7266, 15.6328, 0.25);
	CA_RemoveBuilding(1280, 1479.6094, -1653.2500, 13.4531, 0.25);
	CA_RemoveBuilding(625, 1457.3516, -1650.5703, 13.6953, 0.25);
	CA_RemoveBuilding(625, 1454.4219, -1642.4922, 13.6953, 0.25);
	CA_RemoveBuilding(1280, 1467.8516, -1646.5938, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1472.8984, -1651.5078, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1465.9375, -1639.8203, 13.4531, 0.25);
	CA_RemoveBuilding(1231, 1466.4688, -1637.9609, 15.6328, 0.25);
	CA_RemoveBuilding(625, 1449.5938, -1635.0469, 13.6953, 0.25);
	CA_RemoveBuilding(1280, 1467.7109, -1632.8906, 13.4531, 0.25);
	CA_RemoveBuilding(1232, 1465.8906, -1629.9766, 15.5313, 0.25);
	CA_RemoveBuilding(1280, 1472.6641, -1627.8828, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1479.4688, -1626.0234, 13.4531, 0.25);
	CA_RemoveBuilding(3985, 1479.5625, -1631.4531, 12.0781, 0.25);
	CA_RemoveBuilding(4206, 1479.5547, -1639.6094, 13.6484, 0.25);
	CA_RemoveBuilding(1232, 1465.8359, -1608.3750, 15.3750, 0.25);
	CA_RemoveBuilding(1229, 1466.4844, -1598.0938, 14.1094, 0.25);
	CA_RemoveBuilding(1226, 1451.3359, -1596.7031, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1471.3516, -1596.7031, 16.4219, 0.25);
	CA_RemoveBuilding(1280, 1488.7656, -1704.5938, 13.4531, 0.25);
	CA_RemoveBuilding(700, 1494.2109, -1694.4375, 13.7266, 0.25);
	CA_RemoveBuilding(1280, 1488.7656, -1693.7344, 13.4531, 0.25);
	CA_RemoveBuilding(620, 1496.9766, -1686.8516, 11.8359, 0.25);
	CA_RemoveBuilding(641, 1494.1406, -1689.2344, 11.1016, 0.25);
	CA_RemoveBuilding(1280, 1488.7656, -1682.6719, 13.4531, 0.25);
	CA_RemoveBuilding(712, 1480.6094, -1666.1797, 22.2578, 0.25);
	CA_RemoveBuilding(712, 1488.2266, -1666.1797, 22.2578, 0.25);
	CA_RemoveBuilding(1280, 1486.4063, -1651.3906, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1491.3672, -1646.3828, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1493.1328, -1639.4531, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1486.1797, -1627.7656, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1491.2188, -1632.6797, 13.4531, 0.25);
	CA_RemoveBuilding(1232, 1494.4141, -1629.9766, 15.5313, 0.25);
	CA_RemoveBuilding(1232, 1494.3594, -1608.3750, 15.3750, 0.25);
	CA_RemoveBuilding(1226, 1488.5313, -1596.7031, 16.4219, 0.25);
	CA_RemoveBuilding(1229, 1498.0547, -1598.0938, 14.1094, 0.25);
	CA_RemoveBuilding(1288, 1504.7500, -1705.4063, 13.5938, 0.25);
	CA_RemoveBuilding(1287, 1504.7500, -1704.4688, 13.5938, 0.25);
	CA_RemoveBuilding(1286, 1504.7500, -1695.0547, 13.5938, 0.25);
	CA_RemoveBuilding(1285, 1504.7500, -1694.0391, 13.5938, 0.25);
	CA_RemoveBuilding(673, 1498.9609, -1684.6094, 12.3984, 0.25);
	CA_RemoveBuilding(625, 1504.1641, -1662.0156, 13.6953, 0.25);
	CA_RemoveBuilding(625, 1504.7188, -1670.9219, 13.6953, 0.25);
	CA_RemoveBuilding(620, 1503.1875, -1621.1250, 11.8359, 0.25);
	CA_RemoveBuilding(673, 1501.2813, -1624.5781, 12.3984, 0.25);
	CA_RemoveBuilding(673, 1498.3594, -1616.9688, 12.3984, 0.25);
	CA_RemoveBuilding(1226, 1504.8906, -1596.7031, 16.4219, 0.25);
	CA_RemoveBuilding(712, 1508.4453, -1668.7422, 22.2578, 0.25);
	CA_RemoveBuilding(625, 1505.6953, -1654.8359, 13.6953, 0.25);
	CA_RemoveBuilding(625, 1508.5156, -1647.8594, 13.6953, 0.25);
	CA_RemoveBuilding(625, 1513.2734, -1642.4922, 13.6953, 0.25);
	CA_RemoveBuilding(1258, 1510.8906, -1607.3125, 13.6953, 0.25);
	CA_RemoveBuilding(1226, 1524.8281, -1721.6328, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1524.8281, -1705.2734, 16.4219, 0.25);
	CA_RemoveBuilding(1229, 1524.2188, -1693.9688, 14.1094, 0.25);
	CA_RemoveBuilding(1226, 1524.8281, -1688.0859, 16.4219, 0.25);
	CA_RemoveBuilding(1229, 1524.2188, -1673.7109, 14.1094, 0.25);
	CA_RemoveBuilding(1226, 1524.8281, -1668.0781, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1524.8281, -1621.9609, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1525.3828, -1611.1563, 16.4219, 0.25);
	CA_RemoveBuilding(1283, 1528.9531, -1605.8594, 15.6250, 0.25);

	// minero
	CA_RemoveBuilding(791, 495.3439, -677.4840, 15.5468, 0.10); // vbg_fir_copse
	CA_RemoveBuilding(785, 495.3439, -677.4840, 15.5468, 0.10); // LOD Model of vbg_fir_copse
	CA_RemoveBuilding(791, 552.7189, -724.0310, 12.0546, 0.10); // vbg_fir_copse
	CA_RemoveBuilding(785, 552.7189, -724.0310, 12.0546, 0.10); // LOD Model of vbg_fir_copse
	CA_RemoveBuilding(791, 438.1409, -628.6480, 26.8593, 0.10); // vbg_fir_copse
	CA_RemoveBuilding(785, 438.1409, -628.6480, 26.8593, 0.10); // LOD Model of vbg_fir_copse

	// conce
	CA_RemoveBuilding(6409, 607.695, -1768.851, 15.234, 0.250);
	CA_RemoveBuilding(6406, 607.695, -1768.851, 15.234, 0.250);
	CA_RemoveBuilding(1308, 592.695, -1753.062, 13.750, 0.250);
	// Pescador
	CA_RemoveBuilding(933, 2159.409, -93.921, 1.804, 0.250);
	CA_RemoveBuilding(933, 2158.110, -94.140, 2.296, 0.250);
	CA_RemoveBuilding(923, 2160.350, -100.859, 2.609, 0.250);
	CA_RemoveBuilding(12991, 2161.629, -102.476, 1.750, 0.250);
	CA_RemoveBuilding(935, 2122.379, -83.382, 0.460, 0.250);
	CA_RemoveBuilding(935, 2119.820, -84.406, -0.070, 0.250);
	CA_RemoveBuilding(935, 2119.530, -82.890, -0.164, 0.250);
	CA_RemoveBuilding(935, 2120.520, -79.085, 0.218, 0.250);
	CA_RemoveBuilding(935, 2119.489, -73.617, 0.125, 0.250);
	CA_RemoveBuilding(935, 2117.840, -67.835, 0.132, 0.250);
	CA_RemoveBuilding(935, 2119.469, -69.734, 0.226, 0.250);
	CA_RemoveBuilding(1369, 2104.020, -105.265, 1.703, 0.250);
	
	//garaje tunin
	CA_RemoveBuilding(13062, 266.3594, 20.1328, 5.4844, 0.25);
	CA_RemoveBuilding(1440, 243.9531, 24.6172, 2.0156, 0.25);
	CA_RemoveBuilding(1684, 276.8438, -2.4297, 2.8828, 0.25);
	CA_RemoveBuilding(13059, 266.3594, 20.1328, 5.4844, 0.25);
	CA_RemoveBuilding(1440, 255.2734, 22.7734, 1.8984, 0.25);
	
	//Cosechador
	CA_RemoveBuilding(3276, -378.7734, -1459.0234, 25.4766, 0.25);

	//Camionero productos limpieza
	CA_RemoveBuilding(985, 2497.4063, 2777.0703, 11.5313, 0.25);
	CA_RemoveBuilding(986, 2497.4063, 2769.1094, 11.5313, 0.25);
	
	//Grua
	CA_RemoveBuilding(17350, -54.9922, -1130.7266, 4.5781, 0.25);
	CA_RemoveBuilding(1447, -89.9297, -1133.7500, 1.3906, 0.25);
	CA_RemoveBuilding(1438, -87.0547, -1132.6797, 0.0469, 0.25);
	CA_RemoveBuilding(1462, -79.2500, -1137.7188, 0.0547, 0.25);
	CA_RemoveBuilding(3285, -73.8047, -1141.4219, 1.9844, 0.25);
	CA_RemoveBuilding(17072, -54.9922, -1130.7266, 4.5781, 0.25);
	CA_RemoveBuilding(17073, -56.1250, -1130.1719, 4.4922, 0.25);
	CA_RemoveBuilding(1462, -84.3750, -1116.0938, 0.2578, 0.25);
	CA_RemoveBuilding(1447, -84.0547, -1117.2188, 1.3906, 0.25);
	CA_RemoveBuilding(1415, -68.3516, -1104.9922, 0.2188, 0.25);
	CA_RemoveBuilding(1462, -60.3594, -1116.9375, 0.2578, 0.25);
	CA_RemoveBuilding(1438, -63.6719, -1125.6953, 0.0469, 0.25);
	CA_RemoveBuilding(1438, -63.4141, -1115.4141, 0.0469, 0.25);
	CA_RemoveBuilding(1415, -63.8125, -1106.4219, 0.2188, 0.25);
	
	// Leñador
	CA_RemoveBuilding(785, -1878.7813, -2299.4531, 36.7578, 0.25);
    CA_RemoveBuilding(785, -1851.1719, -2419.8906, 28.8672, 0.25);
    CA_RemoveBuilding(785, -1916.5703, -2352.8203, 27.8984, 0.25);
    CA_RemoveBuilding(785, -1921.7813, -2233.5547, 64.0625, 0.25);
    CA_RemoveBuilding(785, -1868.4609, -2470.2734, 26.2813, 0.25);
    CA_RemoveBuilding(785, -1934.3438, -2401.9297, 26.5000, 0.25);
    CA_RemoveBuilding(791, -1868.4609, -2470.2734, 26.2813, 0.25);
    CA_RemoveBuilding(790, -1979.7188, -2371.9063, 34.7578, 0.25);
    CA_RemoveBuilding(791, -1934.3438, -2401.9297, 26.5000, 0.25);
    CA_RemoveBuilding(791, -1916.5703, -2352.8203, 27.8984, 0.25);
    CA_RemoveBuilding(790, -1891.0703, -2381.6875, 34.7578, 0.25);
    CA_RemoveBuilding(791, -1878.7813, -2299.4531, 36.7578, 0.25);
    CA_RemoveBuilding(18228, -1856.6875, -2321.2891, 38.1484, 0.25);
    CA_RemoveBuilding(791, -1851.1719, -2419.8906, 28.8672, 0.25);
    CA_RemoveBuilding(791, -1921.7813, -2233.5547, 64.0625, 0.25);

	return 1;
}

FormatDialogStrings()
{
	new Dialog_Lines_String[256];

		/* PIZZA FOOD */
	format(DIALOG_FOOD_PIZZA_String, sizeof DIALOG_FOOD_PIZZA_String, ""COL_WHITE"Producto\tPrecio\n");
	for(new i; i != sizeof PIZZA_FOOD; i ++)
	{
		format(Dialog_Lines_String, sizeof Dialog_Lines_String, ""COL_WHITE"%d. %s\t"COL_RED""COL_GREEN"%d$\n", i + 1, PIZZA_FOOD[i][food_NAME], PIZZA_FOOD[i][food_PRICE]);
		strcat(DIALOG_FOOD_PIZZA_String, Dialog_Lines_String);
	}

		/* CLUCKIN FOOD */
	format(DIALOG_FOOD_CLUCKIN_String, sizeof DIALOG_FOOD_CLUCKIN_String, ""COL_WHITE"Producto\t"COL_WHITE"Precio\n");
	for(new i; i != sizeof CLUCKIN_BELL_FOOD; i ++)
	{
		format(Dialog_Lines_String, sizeof Dialog_Lines_String, ""COL_WHITE"%d. %s\t"COL_RED""COL_GREEN"%d$\n", i + 1, CLUCKIN_BELL_FOOD[i][food_NAME], CLUCKIN_BELL_FOOD[i][food_PRICE]);
		strcat(DIALOG_FOOD_CLUCKIN_String, Dialog_Lines_String);
	}

		/* BURGER_SHOT FOOD */
	format(DIALOG_FOOD_BURGER_String, sizeof DIALOG_FOOD_BURGER_String, ""COL_WHITE"Producto\t"COL_WHITE"Precio\n");
	for(new i; i != sizeof BURGER_SHOT_FOOD; i ++)
	{
		format(Dialog_Lines_String, sizeof Dialog_Lines_String, ""COL_WHITE"%d. %s\t"COL_RED""COL_GREEN"%d$\n", i + 1, BURGER_SHOT_FOOD[i][food_NAME], BURGER_SHOT_FOOD[i][food_PRICE]);
		strcat(DIALOG_FOOD_BURGER_String, Dialog_Lines_String);
	}

		/* 24/7 LIST */
	format(DIALOG_247_LIST_String, sizeof DIALOG_247_LIST_String, ""COL_WHITE"Producto\t"COL_WHITE"Precio\n");
	for(new i = 0; i != sizeof Supermarket_Product_List; i ++)
	{
		format(Dialog_Lines_String, sizeof(Dialog_Lines_String), ""COL_WHITE"%d. %s\t"COL_RED""COL_GREEN"%d$\n", i + 1, Supermarket_Product_List[i][product_NAME], Supermarket_Product_List[i][product_PRICE]);
		strcat(DIALOG_247_LIST_String, Dialog_Lines_String);
	}

	//GPS
	new city[45], zone[45];

	//GPS Hospitales
	format(DIALOG_PLAYER_GPS_SITE_0_String, sizeof DIALOG_PLAYER_GPS_SITE_0_String, ""COL_WHITE"Lugar\t"COL_WHITE"Zona\n");
	for(new i = 0; i != sizeof(Hospital_Spawn_Positions); i++ )
	{
		GetPointZone(Hospital_Spawn_Positions[i][0], Hospital_Spawn_Positions[i][1], city, zone);
		format(Dialog_Lines_String, sizeof Dialog_Lines_String, ""COL_WHITE"Hospital %d\t"COL_WHITE"%s, %s\n", i + 1, city, zone);
		strcat(DIALOG_PLAYER_GPS_SITE_0_String, Dialog_Lines_String);
	}

	//GPS CONCES
	format(DIALOG_PLAYER_GPS_SITE_7_String, sizeof DIALOG_PLAYER_GPS_SITE_7_String, ""COL_WHITE"Lugar\t"COL_WHITE"Zona\n");
	for(new i = 0; i != sizeof(SELL_VEHICLES_SHOPS_SPAWN); i++ )
	{
		GetPointZone(SELL_VEHICLES_SHOPS_SPAWN[i][0], SELL_VEHICLES_SHOPS_SPAWN[i][1], city, zone);
		format(Dialog_Lines_String, sizeof Dialog_Lines_String, ""COL_WHITE"Concesionario %d\t"COL_WHITE"%s, %s\n", i + 1, city, zone);
		strcat(DIALOG_PLAYER_GPS_SITE_7_String, Dialog_Lines_String);
	}

	//Colores CREWS
	format(DIALOG_CREATE_CREW_COLOR_String, sizeof DIALOG_CREATE_CREW_COLOR_String, "");
	for(new i = 0; i != sizeof(CrewColors); i++)
	{
		format(Dialog_Lines_String, sizeof(Dialog_Lines_String), "{%06x}%s\n", CrewColors[i] >>> 8, CrewNameColors[i]);
		strcat(DIALOG_CREATE_CREW_COLOR_String, Dialog_Lines_String);
	}
<<<<<<< HEAD
=======

>>>>>>> refs/rewritten/hmsai
	return 1;
}

new Club_Strippers_Actor[6];
new  Club_Bar_Actor[4];
new Club_Actors[21];

new RandomStripAnimations[][] =
{
	"STR_A2B",
	"strip_G",
	"STR_B2C",
	"STR_C1",
	"STR_C2"
};

new RandomPayStripAnimations[][] =
{
	"PLY_CASH",
	"PUN_CASH",
	"PUN_HOLLER",
	"PUN_LOOP"
};

=======
>>>>>>> 75def5d (store module)
SanAndreas()
{
	CreateTextDraws();
	LoadEnterExits();
	LoadProperties();
	LoadCrews();
	LoadGangZones();
	LoadBlackMarkets();
	LoadClubs();

	gettime(SERVER_TIME[0], SERVER_TIME[1]);
	SetTimer("UpdateWorldTime", 60000, true);

	//ptas
	Club_Strippers_Actor[0] = CreateDynamicActor(246, 1209.416503, -36.272216, 1001.484375, 17.0, .worldid = 0, .interiorid = 3);
    Club_Strippers_Actor[1] = CreateDynamicActor(87, 1215.355712, -33.439422, 1001.382812, 85.3, .worldid = 0, .interiorid = 3);
	//ptas2
	Club_Strippers_Actor[2] = CreateDynamicActor(64, 1209.416503, -36.272216, 1001.484375, 17.0, .worldid = 1, .interiorid = 3);
    Club_Strippers_Actor[3] = CreateDynamicActor(63, 1215.355712, -33.439422, 1001.382812, 85.3, .worldid = 1, .interiorid = 3);
	//ptas3
	Club_Strippers_Actor[4] = CreateDynamicActor(75, 1209.416503, -36.272216, 1001.484375, 17.0, .worldid = 2, .interiorid = 3);
    Club_Strippers_Actor[5] = CreateDynamicActor(238, 1215.355712, -33.439422, 1001.382812, 85.3, .worldid = 2, .interiorid = 3);

	//cantina
    Club_Bar_Actor[0] = CreateDynamicActor(194, 1206.232788, -29.325387, 1000.953125, 270.0, .worldid = 0, .interiorid = 3);
	//cantina2
    Club_Bar_Actor[1] = CreateDynamicActor(171, 1206.232788, -29.325387, 1000.953125, 270.0, .worldid = 1, .interiorid = 3);
	//cantina3
    Club_Bar_Actor[2] = CreateDynamicActor(172, 1206.232788, -29.325387, 1000.953125, 270.0, .worldid = 2, .interiorid = 3);
	//cantina3
    Club_Bar_Actor[3] = CreateDynamicActor(172, 496.554840,-77.601684,998.765075,0.000000, .worldid = 2, .interiorid = 11);

    //carneros
	Club_Actors[0] = CreateDynamicActor(2, 1209.846191, -33.879096, 1000.953125, 180.626205, .worldid = 0, .interiorid = 3);
	Club_Actors[1] = CreateDynamicActor(15, 1207.873535, -34.441837, 1000.953125, 213.213790, .worldid = 0, .interiorid = 3);
	Club_Actors[2] = CreateDynamicActor(3, 1215.694702, -31.700962, 1000.953125, 158.379913, .worldid = 0, .interiorid = 3);
	Club_Actors[3] = CreateDynamicActor(19, 1214.740356, -35.461227, 1000.953125, 337.608306, .worldid = 0, .interiorid = 3);
	Club_Actors[4] = CreateDynamicActor(78, 1213.713012, -34.496170, 1000.953125, 293.427886, .worldid = 0, .interiorid = 3);
	Club_Actors[5] = CreateDynamicActor(20, 1211.037963, -36.378440, 1000.960571, 74.092475, .worldid = 0, .interiorid = 3);
	Club_Actors[6] = CreateDynamicActor(40, 1207.190307, -36.132881, 1000.953125, 277.761077, .worldid = 0, .interiorid = 3);
	//carneros
	Club_Actors[7] = CreateDynamicActor(45, 1209.846191, -33.879096, 1000.953125, 180.626205, .worldid = 1, .interiorid = 3);
	Club_Actors[8] = CreateDynamicActor(37, 1207.873535, -34.441837, 1000.953125, 213.213790, .worldid = 1, .interiorid = 3);
	Club_Actors[9] = CreateDynamicActor(28, 1215.694702, -31.700962, 1000.953125, 158.379913, .worldid = 1, .interiorid = 3);
	Club_Actors[10] = CreateDynamicActor(66, 1214.740356, -35.461227, 1000.953125, 337.608306, .worldid = 1, .interiorid = 3);
	Club_Actors[11] = CreateDynamicActor(67, 1213.713012, -34.496170, 1000.953125, 293.427886, .worldid = 1, .interiorid = 3);
	Club_Actors[12] = CreateDynamicActor(68, 1211.037963, -36.378440, 1000.960571, 74.092475, .worldid = 1, .interiorid = 3);
	Club_Actors[13] = CreateDynamicActor(69, 1207.190307, -36.132881, 1000.953125, 277.761077, .worldid = 1, .interiorid = 3);
	//carneros
	Club_Actors[14] = CreateDynamicActor(100, 1209.846191, -33.879096, 1000.953125, 180.626205, .worldid = 2, .interiorid = 3);
	Club_Actors[15] = CreateDynamicActor(101, 1207.873535, -34.441837, 1000.953125, 213.213790, .worldid = 2, .interiorid = 3);
	Club_Actors[16] = CreateDynamicActor(120, 1215.694702, -31.700962, 1000.953125, 158.379913, .worldid = 2, .interiorid = 3);
	Club_Actors[17] = CreateDynamicActor(112, 1214.740356, -35.461227, 1000.953125, 337.608306, .worldid = 2, .interiorid = 3);
	Club_Actors[18] = CreateDynamicActor(140, 1213.713012, -34.496170, 1000.953125, 293.427886, .worldid = 2, .interiorid = 3);
	Club_Actors[19] = CreateDynamicActor(142, 1211.037963, -36.378440, 1000.960571, 74.092475, .worldid = 2, .interiorid = 3);
	Club_Actors[20] = CreateDynamicActor(139, 1207.190307, -36.132881, 1000.953125, 277.761077, .worldid = 2, .interiorid = 3);

	UpdateThePutis();
	SetTimer("UpdateThePutis", 3000, true);

	// 3D Texts Ropas
	for(new i = 0; i < sizeof Clothing_Shop_Positions; i++)
	{
		new label_str[128];
		format(label_str, sizeof label_str, ""COL_WHITE"%s", Clothing_Shop_Positions[i][clothing_shop_NAME]);
		CreateDynamic3DTextLabel(label_str, 0xF7F7F700, Clothing_Shop_Positions[i][clothing_shop_X], Clothing_Shop_Positions[i][clothing_shop_Y], Clothing_Shop_Positions[i][clothing_shop_Z] + 0.25, 10.0, .testlos = true, .interiorid = Clothing_Shop_Positions[i][clothing_shop_INTERIOR]);
		AddKeyArea(Clothing_Shop_Positions[i][clothing_shop_X], Clothing_Shop_Positions[i][clothing_shop_Y], 0.8, KEY_TYPE_Y);
	}

	// 3D Texts Pedir comida
	for(new i = 0; i < sizeof Fast_Food_Positions; i++)
	{
		new label_str[128];
		format(label_str, sizeof label_str, ""COL_RED"%s\n"COL_WHITE"7 productos disponibles", Fast_Food_Positions[i][fast_food_NAME]);
		CreateDynamic3DTextLabel(label_str, 0xF7F7F7FF, Fast_Food_Positions[i][fast_food_X], Fast_Food_Positions[i][fast_food_Y], Fast_Food_Positions[i][fast_food_Z] + 0.25, 10.0, .testlos = true, .interiorid = Fast_Food_Positions[i][fast_food_INTERIOR]);
		AddKeyArea(Fast_Food_Positions[i][fast_food_X], Fast_Food_Positions[i][fast_food_Y], 0.8, KEY_TYPE_Y);
	}

	//Cajeros
	for(new i = 0; i < sizeof ATM_BANK; i ++)
	{
		CreateDynamicObject(19324, ATM_BANK[i][atm_X], ATM_BANK[i][atm_Y], ATM_BANK[i][atm_Z], ATM_BANK[i][atm_RX], ATM_BANK[i][atm_RY], ATM_BANK[i][atm_RZ], ATM_BANK[i][atm_WORLD], ATM_BANK[i][atm_INTERIOR]);
		AddKeyArea(ATM_BANK[i][atm_X], ATM_BANK[i][atm_Y], 0.8, KEY_TYPE_Y);

		ATM_BANK[i][atm_X] += (-0.5 * floatsin(-(ATM_BANK[i][atm_RZ] - 90.0), degrees));
		ATM_BANK[i][atm_Y] += (-0.5 * floatcos(-(ATM_BANK[i][atm_RZ] - 90.0), degrees));
		CreateDynamicMapIcon(ATM_BANK[i][atm_X], ATM_BANK[i][atm_Y], ATM_BANK[i][atm_Z], 52, COLOR_WHITE, ATM_BANK[i][atm_WORLD], ATM_BANK[i][atm_INTERIOR]);

		new atm_pickup_id = CreateDynamicPickup(0, 1, ATM_BANK[i][atm_X], ATM_BANK[i][atm_Y], ATM_BANK[i][atm_Z], ATM_BANK[i][atm_WORLD], ATM_BANK[i][atm_INTERIOR]), info[3];
		info[0] = PICKUP_TYPE_ATM;
		info[1] = i; // Index
		info[2] = 0; // Nada
		Streamer_SetArrayData(STREAMER_TYPE_PICKUP, atm_pickup_id, E_STREAMER_EXTRA_ID, info);
	}

	// 3D Texts Gasolinera
	for(new i = 0; i < sizeof Fuel_Stations; i++)
	{
		CreateDynamic3DTextLabel(""COL_RED"Gasolinera\n"COL_WHITE"3 productos disponibles", 0xF7F7F7FF, Fuel_Stations[i][0], Fuel_Stations[i][1], Fuel_Stations[i][2] + 0.25, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
		AddKeyArea(Fuel_Stations[i][0], Fuel_Stations[i][1], 1.5, KEY_TYPE_Y);
	}
	//Mercado negro
	CreateDynamic3DTextLabel(""COL_RED"Mercado negro\n"COL_WHITE"2 productos disponibles", 0xF7F7F7FF, 2164.021484, -1164.398925, -16.871662, 10.0, .testlos = true, .interiorid = -1, .worldid = -1);
	CreateDynamic3DTextLabel(""COL_RED"Mercado negro\n"COL_WHITE"2 productos disponibles", 0xF7F7F7FF, 2164.021484, -1164.398925, -16.871662, 10.0, .testlos = true, .interiorid = -1, .worldid = -1);
	CreateDynamic3DTextLabel(""COL_RED"Mercado negro (Drogas)\n"COL_WHITE"2 productos disponibles", 0xF7F7F7FF, 2310.057128, -1789.786865, 1600.751953, 10.0, .testlos = true, .interiorid = -1, .worldid = -1);

	//24/7
	CreateDynamic3DTextLabel(""COL_RED"Tienda 24/7\n"COL_WHITE"12 productos disponibles", 0xF7F7F7FF, -27.964675, -89.948631, 1003.546875, 10.0, .testlos = true, .interiorid = 18);

	// Electrónica
	CreateDynamic3DTextLabel(""COL_RED"Tienda Electrónica\n"COL_WHITE"4 productos disponibles", 0xF7F7F7FF, 1722.2310, -1253.8021, 471.1665, 10.0, .testlos = true, .interiorid = 17);
	
	// Farmacia
	CreateDynamic3DTextLabel(""COL_RED"Farmacia\n"COL_WHITE"3 productos disponibles", 0xF7F7F7FF, -198.002197, -1762.759643, 675.768737, 10.0, .testlos = true, .interiorid = 3);

	// club de la pelea
	CreateDynamic3DTextLabel(""COL_YELLOW"Club de la pelea\n"COL_WHITE"3 opciones disponibles", 0xF7F7F7FF, -11.283934, 88.862136, 1101.522705, 5.0, .testlos = true, .interiorid = 16, .worldid = 0);

	//Vehs venta
	for(new i = 0; i != sizeof SELL_INFO_VEHICLES; i ++)
	{
		if (SELL_INFO_VEHICLES[i][sell_info_COLOR_1] == -1) SELL_INFO_VEHICLES[i][sell_info_COLOR_1] = valid_work_vehicle_colors[random(sizeof(valid_work_vehicle_colors))];
		if (SELL_INFO_VEHICLES[i][sell_info_COLOR_2] == -1) SELL_INFO_VEHICLES[i][sell_info_COLOR_2] = valid_work_vehicle_colors[random(sizeof(valid_work_vehicle_colors))];

		new vehicle_id = INVALID_VEHICLE_ID;
		vehicle_id = CreateVehicle(SELL_INFO_VEHICLES[i][sel_info_vehicle_MODELID], SELL_INFO_VEHICLES[i][sell_info_SPAWN_X], SELL_INFO_VEHICLES[i][sell_info_SPAWN_Y], SELL_INFO_VEHICLES[i][sell_info_SPAWN_Z], SELL_INFO_VEHICLES[i][sell_info_SPAWN_ANGLE], SELL_INFO_VEHICLES[i][sell_info_COLOR_1], SELL_INFO_VEHICLES[i][sell_info_COLOR_2], COLOR_WHITE, false);

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_VALID] = true;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_TYPE] = VEHICLE_TYPE_SELL;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] = SELL_INFO_VEHICLES[i][sel_info_vehicle_MODELID];
		format(GLOBAL_VEHICLES[vehicle_id][gb_vehicle_NUMBER_PLATE], 32, "EN VENTA");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X] = SELL_INFO_VEHICLES[i][sell_info_SPAWN_X];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y] = SELL_INFO_VEHICLES[i][sell_info_SPAWN_Y];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z] = SELL_INFO_VEHICLES[i][sell_info_SPAWN_Z];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_ANGLE] = SELL_INFO_VEHICLES[i][sell_info_SPAWN_ANGLE];

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][0] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][1] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][2] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z];

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_HEALTH] = 1000.0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_PANELS] = 0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_DOORS] = 0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_LIGHTS] = 0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_TIRES] = 0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_1] = SELL_INFO_VEHICLES[i][sell_info_COLOR_1];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_2] = SELL_INFO_VEHICLES[i][sell_info_COLOR_2];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PAINTJOB] = 3; // No paintjob
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MAX_GAS] = 0.0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_GAS] = 0.0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;

		SELL_VEHICLES[vehicle_id][sell_vehicle_VALID] = true;
		SELL_VEHICLES[vehicle_id][sell_vehicle_SHOP] = SELL_INFO_VEHICLES[i][sell_info_SHOP];
		SELL_VEHICLES[vehicle_id][sell_vehicle_PRICE] = VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_PRICE];
		SELL_VEHICLES[vehicle_id][sell_vehicle_LEVEL] = 1; /*VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_LEVEL];*/
		SELL_VEHICLES[vehicle_id][sell_vehicle_EXTRA] = VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_COINS];
		SELL_VEHICLES[vehicle_id][sell_vehicle_VIP_LEVEL] = VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_VIP_LEVEL];

		if (SELL_VEHICLES[vehicle_id][sell_vehicle_VIP_LEVEL]) SELL_VEHICLES[vehicle_id][sell_vehicle_LEVEL] = 1;
		if (SELL_VEHICLES[vehicle_id][sell_vehicle_EXTRA]) SELL_VEHICLES[vehicle_id][sell_vehicle_PRICE] = 0;

		SetVehicleToRespawnEx(vehicle_id);


		new label_str[256];

		if (SELL_VEHICLES[vehicle_id][sell_vehicle_VIP_LEVEL])
		{
			if (SELL_VEHICLES[vehicle_id][sell_vehicle_EXTRA])
			{
				format
				(
					label_str,
						sizeof label_str,
						"\
							{F4DC42}Se requiere VIP (%d)\n\
							\n\
							"COL_RED"%s\n\n\
							"COL_WHITE"Coste: "COL_RED"%d "SERVER_COIN"\n\
							"COL_WHITE"Nivel: "COL_RED"%d\
						", SELL_VEHICLES[vehicle_id][sell_vehicle_VIP_LEVEL], VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_NAME], SELL_VEHICLES[vehicle_id][sell_vehicle_EXTRA], SELL_VEHICLES[vehicle_id][sell_vehicle_LEVEL]
				);
			}
			else
			{
				format
				(
					label_str,
						sizeof label_str,
						"\
							{F4DC42}Se requiere VIP (%d)\n\
							\n\
							"COL_RED"%s\n\n\
							"COL_WHITE"Precio: "COL_RED"%s$\n\
							"COL_WHITE"Nivel: "COL_RED"%d\
						", SELL_VEHICLES[vehicle_id][sell_vehicle_VIP_LEVEL], VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_NAME], number_format_thousand(SELL_VEHICLES[vehicle_id][sell_vehicle_PRICE]), SELL_VEHICLES[vehicle_id][sell_vehicle_LEVEL]
				);
			}
		}
		else
		{
			if (SELL_VEHICLES[vehicle_id][sell_vehicle_EXTRA])
			{
				format
				(
					label_str,
						sizeof label_str,
						"\
							"COL_RED"%s\n\n\
							"COL_WHITE"Coste: "COL_RED"%d "SERVER_COIN"\n\
							"COL_WHITE"Nivel: "COL_RED"%d\
						", VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_NAME], SELL_VEHICLES[vehicle_id][sell_vehicle_EXTRA], SELL_VEHICLES[vehicle_id][sell_vehicle_LEVEL]
				);
			}
			else
			{
				format
				(
					label_str,
						sizeof label_str,
						"\
							"COL_RED"%s\n\n\
							"COL_WHITE"Precio: "COL_RED"%s$\n\
							"COL_WHITE"Nivel: "COL_RED"%d\
						", VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_NAME], number_format_thousand(SELL_VEHICLES[vehicle_id][sell_vehicle_PRICE]), SELL_VEHICLES[vehicle_id][sell_vehicle_LEVEL]
				);
			}
		}


		SELL_VEHICLES[vehicle_id][sell_vehicle_LABEL_ID] = CreateDynamic3DTextLabel(label_str, 0xF7F7F700, 0.0, 0.0, 1.5, 10.0, .attachedvehicle = vehicle_id, .testlos = true, .worldid = 0, .interiorid = 0);
	}

	//Concesionarios
	for(new i = 0; i < sizeof SELL_VEHICLES_SHOPS_SPAWN; i++)
	{
		CreateDynamicMapIcon(SELL_VEHICLES_SHOPS_SPAWN[i][0], SELL_VEHICLES_SHOPS_SPAWN[i][1], SELL_VEHICLES_SHOPS_SPAWN[i][2], 55, COLOR_WHITE, 0, 0);
	}

	//Notario
	CreateDynamic3DTextLabel(""COL_WHITE"Vender una propiedad o vehículo", 0xF7F7F700, 1796.071655, -1414.565307, 2770.660156, 10.0, .testlos = true, .worldid = 20, .interiorid = 20);
	//Grua
	CreateDynamic3DTextLabel(""COL_WHITE"Servicio de grúa", 0xF7F7F700,  1795.293823,-1407.773681,2770.660156, 10.0, .testlos = true, .worldid = 20, .interiorid = 20);
	
	//San Andreas Vehicles
	for(new i = 0; i != sizeof San_Andreas_Vehicles; i ++)
	{

		if (San_Andreas_Vehicles[i][san_andreas_vehicle_COLOR_1] == -1) San_Andreas_Vehicles[i][san_andreas_vehicle_COLOR_1] = valid_work_vehicle_colors[random(sizeof(valid_work_vehicle_colors))];
		if (San_Andreas_Vehicles[i][san_andreas_vehicle_COLOR_2] == -1) San_Andreas_Vehicles[i][san_andreas_vehicle_COLOR_2] = valid_work_vehicle_colors[random(sizeof(valid_work_vehicle_colors))];

		new vehicle_id = INVALID_VEHICLE_ID, respawn_time = 300;

		if (San_Andreas_Vehicles[i][san_andreas_vehicle_TYPE] == VEHICLE_TYPE_WORK)
		{
			if (work_info[ San_Andreas_Vehicles[i][san_andreas_vehicle_TYPE_IN] ][work_info_TYPE] == WORK_TYPE_FAMILY)
			{
				respawn_time = 900;
			}
		}

		vehicle_id = CreateVehicle(San_Andreas_Vehicles[i][san_andreas_vehicle_MODELID], San_Andreas_Vehicles[i][san_andreas_vehicle_SPAWN_X], San_Andreas_Vehicles[i][san_andreas_vehicle_SPAWN_Y], San_Andreas_Vehicles[i][san_andreas_vehicle_SPAWN_Z], San_Andreas_Vehicles[i][san_andreas_vehicle_SPAWN_ANGLE], San_Andreas_Vehicles[i][san_andreas_vehicle_COLOR_1], San_Andreas_Vehicles[i][san_andreas_vehicle_COLOR_2], respawn_time, false);
		if (vehicle_id == INVALID_VEHICLE_ID) continue;

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_VALID] = true;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_TYPE] = San_Andreas_Vehicles[i][san_andreas_vehicle_TYPE];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] = San_Andreas_Vehicles[i][san_andreas_vehicle_MODELID];
		format(GLOBAL_VEHICLES[vehicle_id][gb_vehicle_NUMBER_PLATE], 32, "%c%c%c-%04d", getRandomLetter(), getRandomLetter(), getRandomLetter(), random(9999));
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X] = San_Andreas_Vehicles[i][san_andreas_vehicle_SPAWN_X];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y] = San_Andreas_Vehicles[i][san_andreas_vehicle_SPAWN_Y];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z] = San_Andreas_Vehicles[i][san_andreas_vehicle_SPAWN_Z];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_ANGLE] = San_Andreas_Vehicles[i][san_andreas_vehicle_SPAWN_ANGLE];

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][0] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][1] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][2] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z];

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_HEALTH] = 1000.0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_PANELS] = 0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_DOORS] = 0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_LIGHTS] = 0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_TIRES] = 0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_1] = San_Andreas_Vehicles[i][san_andreas_vehicle_COLOR_1];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_2] = San_Andreas_Vehicles[i][san_andreas_vehicle_COLOR_2];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PAINTJOB] = 3; // No paintjob
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MAX_GAS] = VEHICLE_INFO[ GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_MAX_GAS];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_GAS] = frandom(GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MAX_GAS], GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MAX_GAS] / 3, 2);
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;
		GLOBAL_VEHICLES[vehicle_id][gp_vehicle_vip] = San_Andreas_Vehicles[i][san_andreas_vehicle_vip];

		if (GLOBAL_VEHICLES[vehicle_id][gb_vehicle_TYPE] == VEHICLE_TYPE_WORK)
		{
			WORK_VEHICLES[vehicle_id][work_vehicle_VALID] = true;
			WORK_VEHICLES[vehicle_id][work_vehicle_WORK] = San_Andreas_Vehicles[i][san_andreas_vehicle_TYPE_IN];
			WORK_VEHICLES[vehicle_id][work_vehicle_EXP] = San_Andreas_Vehicles[i][san_andreas_vehicle_TYPE_IN_EXP];
			WORK_VEHICLES[vehicle_id][work_vehicle_NEED_DUTY] = work_info[ WORK_VEHICLES[vehicle_id][work_vehicle_WORK] ][work_info_NEED_DUTY];
		}

		SetVehicleToRespawnEx(vehicle_id);
	}

	//polcias
	for(new i = 0; i != sizeof POLICE_GARAGE_DOORS; i ++)
	{
		POLICE_GARAGE_DOORS[i][police_gdoor_OBJECT_ID] = CreateDynamicObject(POLICE_GARAGE_DOORS[i][police_gdoor_MODELID], POLICE_GARAGE_DOORS[i][police_gdoor_CLOSED_X], POLICE_GARAGE_DOORS[i][police_gdoor_CLOSED_Y], POLICE_GARAGE_DOORS[i][police_gdoor_CLOSED_Z], POLICE_GARAGE_DOORS[i][police_gdoor_CLOSED_RX], POLICE_GARAGE_DOORS[i][police_gdoor_CLOSED_RY], POLICE_GARAGE_DOORS[i][police_gdoor_CLOSED_RZ], 0, 0);
	}

	for(new i = 0; i != sizeof POLICE_DOORS; i ++)
	{
		POLICE_DOORS[i][police_door_OBJECT_ID] = CreateDynamicObject(POLICE_DOORS[i][police_door_MODELID], POLICE_DOORS[i][police_door_X], POLICE_DOORS[i][police_door_Y], POLICE_DOORS[i][police_door_Z], 0.0, 0.0, POLICE_DOORS[i][police_door_RZ], POLICE_DOORS[i][police_door_WORLD], POLICE_DOORS[i][police_door_INTERIOR]);
	}

	for(new i = 0; i != sizeof JAIL_DOORS; i ++)
	{
		JAIL_DOORS[i][jail_door_OBJECT_ID] = CreateDynamicObject(JAIL_DOORS[i][jail_door_MODELID], JAIL_DOORS[i][jail_door_X], JAIL_DOORS[i][jail_door_Y], JAIL_DOORS[i][jail_door_Z], 0.0, 0.0, JAIL_DOORS[i][jail_door_RZ], JAIL_DOORS[i][jail_door_WORLD], JAIL_DOORS[i][jail_door_INTERIOR]);
	}

	for(new i = 0; i != sizeof MAFIA_DOORS; i ++)
	{
		MAFIA_DOORS[i][mafia_door_OBJECT_ID] = CreateDynamicObject(MAFIA_DOORS[i][mafia_door_MODELID], MAFIA_DOORS[i][mafia_door_X], MAFIA_DOORS[i][mafia_door_Y], MAFIA_DOORS[i][mafia_door_Z], 0.0, 0.0, MAFIA_DOORS[i][mafia_door_RZ], MAFIA_DOORS[i][mafia_door_WORLD], MAFIA_DOORS[i][mafia_door_INTERIOR]);
	}

	for(new i = 0; i != sizeof TELE_MIRRORS; i ++)
	{
		TELE_MIRRORS[i][teleview_OBJECT_ID] = CreateDynamicObject(TELE_MIRRORS[i][teleview_MODELID], TELE_MIRRORS[i][teleview_X], TELE_MIRRORS[i][teleview_Y], TELE_MIRRORS[i][teleview_Z], 0.0, 0.0, TELE_MIRRORS[i][teleview_RZ], TELE_MIRRORS[i][teleview_WORLD], TELE_MIRRORS[i][teleview_INTERIOR]);
		AddKeyArea(TELE_MIRRORS[i][teleview_X], TELE_MIRRORS[i][teleview_Y], 0.8, KEY_TYPE_Y);
	}

	for(new i = 0; i != sizeof HOTAIR_BALLOONS; i ++)
	{
		HOTAIR_BALLOONS[i][balloon_OBJECT_ID] = CreateDynamicObject(HOTAIR_BALLOONS[i][balloon_MODELID], HOTAIR_BALLOONS[i][balloon_X], HOTAIR_BALLOONS[i][balloon_Y], HOTAIR_BALLOONS[i][balloon_Z], 0.0, 0.0, HOTAIR_BALLOONS[i][balloon_RZ], HOTAIR_BALLOONS[i][balloon_WORLD], HOTAIR_BALLOONS[i][balloon_INTERIOR]);
		AddKeyArea(HOTAIR_BALLOONS[i][balloon_X], HOTAIR_BALLOONS[i][balloon_Y], 0.8, KEY_TYPE_Y);
	}

	CreateDynamic3DTextLabel(""COL_RED"Balloon Express\n"COL_WHITE"Viaje en globo aerostático (200$)", 0xF7F7F7FF, -370.339721, -1634.205932, 25.057666, 5.0, .testlos = true, .worldid = 0, .interiorid = 0);

	CreateDynamic3DTextLabel(""COL_WHITE"Armamento para policías", 0xF7F7F700, 1867.665283, -1712.853515, 5216.709960, 5.0, .testlos = true, .worldid = 0, .interiorid = 6);

	//Safe Zones
	for(new i = 0; i != sizeof SAFE_ZONES; i ++)
	{
		SAFE_ZONES[i][safe_zone_AREA_ID] = CreateDynamicRectangle(SAFE_ZONES[i][safe_zone_MIN_X], SAFE_ZONES[i][safe_zone_MIN_Y], SAFE_ZONES[i][safe_zone_MAX_X], SAFE_ZONES[i][safe_zone_MAX_Y], SAFE_ZONES[i][safe_zone_WORLD], SAFE_ZONES[i][safe_zone_INTERIOR]);
	}

	//Trabajos
	for(new i = 1; i != sizeof obtain_work_coords; i ++)
	{
		new label_str[256];

		switch(work_info[i][work_info_TYPE])
		{
			case WORK_TYPE_NORMAL:
			{
				format(label_str, sizeof label_str, ""COL_WHITE"Trabajo %s", work_info[i][work_info_NAME]);
				CreateDynamic3DTextLabel(label_str, 0xF7F7F700, obtain_work_coords[i][obtain_work_X], obtain_work_coords[i][obtain_work_Y], obtain_work_coords[i][obtain_work_Z], 10.0, .testlos = true, .interiorid = obtain_work_coords[i][obtain_work_INTERIOR]);
				CreateDynamicPickup(1314, 1, obtain_work_coords[i][obtain_work_X], obtain_work_coords[i][obtain_work_Y], obtain_work_coords[i][obtain_work_Z], COLOR_WHITE, obtain_work_coords[i][obtain_work_INTERIOR]);
				if (obtain_work_coords[i][obtain_work_MAP_ICON]) CreateDynamicMapIcon(obtain_work_coords[i][obtain_work_MAP_ICON_X], obtain_work_coords[i][obtain_work_MAP_ICON_Y], obtain_work_coords[i][obtain_work_MAP_ICON_Z], obtain_work_coords[i][obtain_work_MAP_ICON_ID], COLOR_WHITE, 0, 0);
				
				AddKeyArea(obtain_work_coords[i][obtain_work_X], obtain_work_coords[i][obtain_work_Y], 0.8, KEY_TYPE_Y);
			}
		}
	}

	//Carga camioneros
	for(new i = 0; i != sizeof LoadTrucksPoints; i ++)
	{
		CreateDynamic3DTextLabel(""COL_WHITE"Punto de carga", 0xF7F7F700, LoadTrucksPoints[i][0], LoadTrucksPoints[i][1], LoadTrucksPoints[i][2], 15.0, .testlos = true, .worldid = 0, .interiorid = 0);
		CreateDynamicPickup(19607, 1, LoadTrucksPoints[i][0], LoadTrucksPoints[i][1], LoadTrucksPoints[i][2], 0, 0);
		AddKeyArea(LoadTrucksPoints[i][0], LoadTrucksPoints[i][1], 1.8, KEY_TYPE_H);
	}

	//Mecánico
	//Mechanic_Area = CreateDynamicRectangle(-915.255050, -1911.812377, -500.539089, -1979.635253, 0, 0);
	Mechanic_Area = CreateDynamicCircle(-89.0, -1170.0, 50,0);

	//Trash
	CreateDynamicPickup(1239, 1, 1626.089355, -2174.786132, 13.554687, 0, 0);
	CreateDynamic3DTextLabel(""COL_WHITE"Punto de control", 0xF7F7F700, 1626.089355, -2174.786132, 13.554687, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	
	//medico
	CreateDynamicPickup(1239, 1, -212.521926, -1739.015014, 675.768737, 2, 3);
	CreateDynamic3DTextLabel(""COL_WHITE"Punto de control", 0xF7F7F700, -212.521926, -1739.015014, 675.768737, 20.0, .testlos = true, .worldid = 2, .interiorid = 3);

	//registro civil
	CreateDynamic3DTextLabel(""COL_RED"Registro"COL_WHITE"\nAdquiere un documento o licencia de conducir", 0xF7F7F7FF, 1879.2662, -1701.0118, 5216.7100, 20.0, .testlos = true, .worldid = 0, .interiorid = 6);
	AddKeyArea(1879.2662, -1701.0118, 1.5, KEY_TYPE_Y);

	//base mafia
	CreateDynamic3DTextLabel("{a912e2}Family SaintBlood'S\n"COL_WHITE"Equipamiento", 0xF7F7F700, 1475.4032, 2773.5891, 10.8203, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel("{a912e2}Family SaintBlood'S\n"COL_WHITE"Equipamiento", 0xF7F7F700, -1387.1334, 492.8735, 2.1851, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel("{f5e30a}Triade di San Andreas\n"COL_WHITE"Equipamiento", 0xF7F7F700, 3855.066162, -1290.975585, 7547.983398, 20.0, .testlos = true, .worldid = 0, .interiorid = 28);
	CreateDynamic3DTextLabel("{3a3eab}Familia Osborn\n"COL_WHITE"Equipamiento", 0xF7F7F700, 882.789611, 1896.002319, -93.898712, 20.0, .testlos = true, .worldid = 0, .interiorid = 29);
	CreateDynamic3DTextLabel("{FFFFFF}The Family Connor\n"COL_WHITE"Equipamiento", 0xF7F7F700, 419.4871, -1001.7376, 92.8918, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel("{a9ee70}Diviso Per Tutti\n"COL_WHITE"Equipamiento", 0xF7F7F700, 1141.0912, -2064.0176, 69.0259, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel("{3a3eab}Familia Osborn\n"COL_WHITE"Equipamiento", 0xF7F7F700, 1298.5734, -799.0347, 84.1406, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_WHITE"Comprar armas", 0xF7F7F700, -190.378494, -2254.421386, 25.593534, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_WHITE"Comprar balas", 0xF7F7F700, -187.830596, -2249.291503, 24.332202, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);

	//meca
	for(new i = 0; i != sizeof(MECHANIC_POSITIONS); i++ )
	{
		new str_text[128];
		format(str_text, sizeof(str_text), ""COL_RED"Levantador nº %d\n"COL_WHITE"Acércate para usar", i + 1);
		CreateDynamic3DTextLabel(str_text, 0xF7F7F700, MECHANIC_POSITIONS[i][0], MECHANIC_POSITIONS[i][1], MECHANIC_POSITIONS[i][2] + 1.8, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
		AddKeyArea(MECHANIC_POSITIONS[i][0], MECHANIC_POSITIONS[i][1], 1.5, KEY_TYPE_H);
	}

	CreateDynamic3DTextLabel(""COL_RED"Taller mecánico\n"COL_WHITE"1 producto disponible", 0xF7F7F7FF, 1060.838256, -917.609741, 43.124679, 10.0, .testlos = true, .worldid = 0, .interiorid = 0);

	//pescador
	CreateDynamic3DTextLabel(""COL_RED"Boya\n"COL_WHITE"nº 1", 0xF7F7F7FF, 1955.022094, -189.402023, -2.332746 + 1.3, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Boya\n"COL_WHITE"nº 2", 0xF7F7F7FF, 2209.482421, -231.312026, -2.332746 + 1.3, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Boya\n"COL_WHITE"nº 3", 0xF7F7F7FF, 2209.482421, -231.312026, -2.332746 + 1.3, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Boya\n"COL_WHITE"nº 4", 0xF7F7F7FF, 1858.291503, -69.229499, -2.332746 + 1.3, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Comprar caña de pescar\n"COL_WHITE"1 producto disponible", 0xF7F7F7FF, 2125.901123, -65.776679, 1.585963, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Vender pescados\n"COL_WHITE"Venga aquí para vender sus peces", 0xF7F7F7FF, 2157.049560, -92.550987, 2.798943, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);

	// Minero
	CreateDynamic3DTextLabel(""COL_RED"Puesto para mineros\n"COL_WHITE"1 producto disponible", 0xF7F7F7FF, 509.910125, -708.205383, 19.242210, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	
	for(new i = 0; i != sizeof ROCK_PROCESSOR; i ++)
	{
		CreateDynamic3DTextLabel(""COL_RED"Procesadora\n"COL_WHITE"Suelta los materiales aquí", 0xF7F7F7FF, ROCK_PROCESSOR[i][rp_X], ROCK_PROCESSOR[i][rp_Y], ROCK_PROCESSOR[i][rp_Z] + 3, 25.0, .testlos = true, .worldid = -1, .interiorid = -1);
	}
	
	//heliport
	CreateDynamic3DTextLabel(""COL_RED"Helipuerto nº 1\n"COL_WHITE"Acércate para usar", 0xF7F7F700, 1876.87915, -2286.58911, 1.16550 + 15, 30.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Helipuerto nº 2\n"COL_WHITE"Acércate para usar", 0xF7F7F700, 1055.9615, -910.1790, 49.1911 + 1, 30.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Helipuerto nº 3\n"COL_WHITE"Acércate para usar", 0xF7F7F700, 1037.1727, -911.3947, 49.1911 + 1, 30.0, .testlos = true, .worldid = 0, .interiorid = 0);
	
	CreateDynamic3DTextLabel(""COL_RED"Muelle nº 1\n"COL_WHITE"Acércate para usar", 0xF7F7F700, 729.8204, -1512.3397, -0.5818 + 1, 40.0, .testlos = true, .worldid = 0, .interiorid = 0);
	
	//Ruta 0
	CreateTrashCheckpoint(0, 1440, 1576.18823, -1881.10181, 13.07472, 0.00000, 0.00000, 34.68000);
	CreateTrashCheckpoint(0, 1440, 1917.53015, -1759.69678, 13.03518, 0.00000, 0.00000, 55.38003);
	CreateTrashCheckpoint(0, 1440, 2257.18701, -1757.93884, 13.05839, 0.00000, 0.00000, -32.57999);
	CreateTrashCheckpoint(0, 1440, 2321.62183, -1652.59631, 13.58731, 0.00000, 1.50000, 0.00000);
	CreateTrashCheckpoint(0, 1440, 2136.64185, -1614.34924, 13.07250, 0.00000, 0.00000, 0.00000);
	CreateTrashCheckpoint(0, 1440, 1812.95654, -1583.28308, 13.05158, 0.00000, 0.00000, 108.30004);
	CreateTrashCheckpoint(0, 1440, 1835.05884, -1405.09631, 12.84951, 0.00000, 0.00000, -169.31958);
	CreateTrashCheckpoint(0, 1440, 2111.39307, -1374.47253, 23.48777, 0.00000, 0.00000, 43.80002);
	CreateTrashCheckpoint(0, 1440, 2340.17896, -1375.07373, 23.49526, 0.00000, 0.00000, -45.78000);
	CreateTrashCheckpoint(0, 1440, 2423.18457, -1247.28931, 23.32495, 0.00000, 0.00000, 0.00000);
	CreateTrashCheckpoint(0, 1440, 2408.37939, -1435.10327, 23.49789, 0.00000, 0.00000, 0.00000);
	CreateTrashCheckpoint(0, 1440, 2404.54272, -1883.71716, 13.07741, 0.00000, 0.00000, 49.98003);
	CreateTrashCheckpoint(0, 1440, 2303.04858, -1905.20337, 13.10007, 0.00000, 0.00000, -224.27972);
	CreateTrashCheckpoint(0, 1440, 1947.93640, -1981.96899, 13.04134, 0.00000, 0.00000, -182.69981);
	CreateTrashCheckpoint(0, 1440, 1760.00012, -1704.64282, 13.02292, 0.00000, 0.00000, -89.88001);

	//Ruta 1
	CreateTrashCheckpoint(1, 1440, 266.72211, -1433.95056, 13.22365, 0.00000, 0.00000, -131.94023);
	CreateTrashCheckpoint(1, 1440, 481.41916, -1316.46606, 15.24868, 0.00000, 0.00000, -233.09927);
	CreateTrashCheckpoint(1, 1440, 609.48804, -1414.38892, 13.16528, 0.00000, 0.00000, -177.59927);
	CreateTrashCheckpoint(1, 1440, 673.05725, -1312.57593, 13.06484, 0.00000, 0.00000, -0.12000);
	CreateTrashCheckpoint(1, 1440, 876.93158, -1337.84985, 13.03618, 0.00000, 0.00000, -94.02001);
	CreateTrashCheckpoint(1, 1440, 1014.79724, -1307.83337, 13.04088, 0.00000, 0.00000, -91.02003);
	CreateTrashCheckpoint(1, 1440, 928.27362, -1231.07397, 16.43071, 0.00000, 0.00000, -2.76000);
	CreateTrashCheckpoint(1, 1440, 974.32703, -1098.90576, 23.33282, 0.00000, 0.00000, 0.00000);
	CreateTrashCheckpoint(1, 1440, 1011.96045, -1029.09534, 31.61896, 0.00000, 0.00000, 0.00000);
	CreateTrashCheckpoint(1, 1440, 1130.96423, -1026.88684, 31.37872, 0.00000, 0.00000, 88.50000);
	CreateTrashCheckpoint(1, 1440, 1227.52466, -923.29681, 42.38168, 0.00000, 0.00000, 0.00000);
	CreateTrashCheckpoint(1, 1440, 1149.20667, -1292.30310, 13.14513, 0.00000, 0.00000, -90.83996);
	CreateTrashCheckpoint(1, 1440, 1324.76135, -913.80219, 36.60719, 0.00000, 5.00000, -12.18000);
	CreateTrashCheckpoint(1, 1440, 1438.44971, -1046.58569, 23.30455, 0.00000, 0.00000, 0.00000);
	CreateTrashCheckpoint(1, 1440, 1426.72534, -1150.02637, 23.32583, 0.00000, 0.00000, -57.60005);

	//Ruta 2
	CreateTrashCheckpoint(2, 1440, 177.89861, -1411.52124, 44.86136, 0.00000, 5.50000, -123.00010);
	CreateTrashCheckpoint(2, 1440, 347.04025, -1281.00696, 53.47940, 0.00000, 0.00000, -153.95987);
	CreateTrashCheckpoint(2, 1440, 504.53271, -1217.64954, 44.80725, 0.00000, -4.00000, -117.00010);
	CreateTrashCheckpoint(2, 1440, 626.74414, -1097.86841, 46.27120, 0.00000, -0.66000, 34.20001);
	CreateTrashCheckpoint(2, 1440, 690.64514, -1019.74518, 50.91731, 0.00000, 0.00000, 65.88000);
	CreateTrashCheckpoint(2, 1440, 876.47632, -865.94324, 76.99551, 0.00000, 0.00000, 0.00000);
	CreateTrashCheckpoint(2, 1440, 1029.65454, -791.63422, 102.38500, 0.00000, 3.50000, -128.39977);
	CreateTrashCheckpoint(2, 1440, 996.50922, -642.60034, 120.79243, 0.00000, 1.50000, -175.01944);
	CreateTrashCheckpoint(2, 1440, 1402.91345, -585.05438, 77.69649, 0.00000, -4.50000, -66.54000);
	CreateTrashCheckpoint(2, 1440, 1234.19727, -626.23657, 103.50398, 0.00000, 0.00000, -170.57962);
	CreateTrashCheckpoint(2, 1440, 1065.22083, -623.77979, 115.07451, 0.00000, 11.00000, 0.00000);
	CreateTrashCheckpoint(2, 1440, 898.74420, -708.74591, 109.96632, 0.00000, -12.50000, 67.08000);
	CreateTrashCheckpoint(2, 1440, 832.35669, -797.90161, 72.50480, 0.00000, -13.50000, 7.86000);
	CreateTrashCheckpoint(2, 1440, 677.09070, -878.62482, 67.03890, 0.00000, 11.50000, -121.20003);
	CreateTrashCheckpoint(2, 1440, 125.15490, -1289.90332, 46.98190, 0.00000, 1.50000, 86.94010);

	// Granjero
	Farmer_Area = CreateDynamicCircle(1461.8894, -83.2621, 65.0, 0, 0);
	CreateDynamicMapIcon(1461.8894, -83.2621, 65.0, 53, COLOR_WHITE, 0, 0);
	CreateDynamic3DTextLabel(""COL_WHITE"Tienda de semillas", 0xF7F7F700, -382.580657, -1426.404296, 26.219505, 5.0, .testlos = true, .worldid = 0, .interiorid = 0);

	// Cosechador
	Harvest_Area = CreateDynamicRectangle(-428.336059, -1667.658569, -116.565414, -1220.122070, 0, 0);

	// Key areas
	AddKeyArea(-27.964675, -89.948631, 0.8, KEY_TYPE_Y);
	AddKeyArea(2125.901123, -65.776679, 0.8, KEY_TYPE_Y);
	AddKeyArea(1060.838256, -917.609741, 0.8, KEY_TYPE_Y);
	AddKeyArea(509.910125, -708.205383, 0.8, KEY_TYPE_Y);
	AddKeyArea(2157.049560, -92.550987, 0.8, KEY_TYPE_Y);
	AddKeyArea(-198.002197, -1762.759643, 0.8, KEY_TYPE_Y);
	AddKeyArea(2164.021484, -1164.398925, 0.8, KEY_TYPE_Y);
	AddKeyArea(2162.462158, -1169.053222, 0.8, KEY_TYPE_Y);
	AddKeyArea(2310.057128, -1789.786865, 0.8, KEY_TYPE_Y);
	AddKeyArea(219.244018, 69.982215, 0.8, KEY_TYPE_Y);
	AddKeyArea(262.945587, 109.785270, 0.8, KEY_TYPE_Y);
	AddKeyArea(222.683914, 186.956054, 0.8, KEY_TYPE_Y);
	AddKeyArea(407.302886, 2531.673095, 0.8, KEY_TYPE_Y);
	AddKeyArea(219.244018, 69.982215, 0.8, KEY_TYPE_Y);
	AddKeyArea(-382.580657, -1426.404296, 0.8, KEY_TYPE_Y);
	AddKeyArea(1796.071655, -1414.565307, 1.5, KEY_TYPE_H);
	AddKeyArea(1207.234375, -29.231435, 1.5, KEY_TYPE_H);
	AddKeyArea(496.589172, -76.033905, 1.5, KEY_TYPE_H);
	AddKeyArea(1795.293823, -1407.773681, 1.5, KEY_TYPE_H);
	AddKeyArea(-370.339721, -1634.205932, 0.8, KEY_TYPE_Y);
	AddKeyArea(1722.2310, -1253.8021, 0.8, KEY_TYPE_Y);
	AddKeyArea(726.2478, -1276.3830, 0.8, KEY_TYPE_Y);
	AddKeyArea(976.715881, -1442.519775, 0.8, KEY_TYPE_Y);
	AddKeyArea(3855.066162, -1290.975585, 0.8, KEY_TYPE_Y);
	AddKeyArea(1626.089355, -2174.786132, 0.8, KEY_TYPE_H);
	AddKeyArea(-212.521926, -1739.015014, 0.8, KEY_TYPE_H);
	AddKeyArea(-11.283934, 88.862136, 0.8, KEY_TYPE_Y);

	/* v1.0 Features */

	// Stall
	CreateStalls();

	// Dealers
	CreateDealers();

	// Soccer
	CreateBall();
	Soccer_LoadCollisions();
	Soccer_LoadMap();
	return 1;
}

public OnGameModeInit()
{
	CA_RemoveBarriers();
	RemoveObjectCollisions();

	CA_Init();

	//SvDebug(SV_TRUE);

    // Server
	SetGameModeText(SERVER_MODE);

	SendRconCommand("hostname Hyaxe Dev | "SERVER_VERSION"");
	
	#if defined FINAL_BUILD
		SetTimer("GiveAutoGift", 300000, false);
		SendRconCommand("hostname "SERVER_HOSTNAME"");
    	//SetTimer("SendGift", 120000, true);
	#endif

	#if defined HALLOWEEN_MODE
		SendRconCommand("hostname "HALLOWEEN_HOSTNAME"");
		HalloweenMap();
	#endif

	#if defined CHRISTMAS_MODE
		SendRconCommand("hostname "CHRISTMAS_HOSTNAME"");
		ChristmasMap();
	#endif

	#if defined EASTER_MODE
		SendRconCommand("hostname "EASTER_HOSTNAME"");
		EasterMap();
	#endif

	SendRconCommand("language "SERVER_LANGUAGE"");
	SendRconCommand("weburl "SERVER_WEBSITE"");
	SendRconCommand("minconnectiontime 50");
	SendRconCommand("ackslimit 10000");
	SendRconCommand("messageslimit 5000");
	//SendRconCommand("conncookies 0");
	//SendRconCommand("cookielogging 0");
	SendRconCommand("chatlogging 1");

	UsePlayerPedAnims();
	DisableInteriorEnterExits();
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_GLOBAL);
	SetNameTagDrawDistance(25.0);
	EnableStuntBonusForAll(false);
	ManualVehicleEngineAndLights();
	FormatDialogStrings();

	SanAndreas();

	LoadServerInfo();
	UpdateEconomy();
	CreateGraffitis();
	CreateMinerRocks();

	SetTimer("UpdateWantedLevelMark", 30000, true);

	SetTimer("FirstGraffitiAnnounce", 1500000, false);
	SetTimer("InitLastGraffiti", 60000, false);

	GraffitiGetTime = gettime();
	MarketGetTime = gettime();
	
	/*lgbt_timers[0] = SetTimer("ChangeLgbtMap", 600000, false);
	lgbt_map_index = random(sizeof(LGBT_MAPS));*/

    Log("status", "Servidor iniciado ("SERVER_VERSION").");
    SendDiscordWebhook(":fire: Servidor iniciado ("SERVER_VERSION").", 1);
    ServerInitTime = gettime();
    return 1;
}

public OnGameModeExit()
{
	SendDiscordWebhook(":grey_exclamation: Servidor detenido.", 1);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (!IsPlayerConnected(i)) continue;

		if (CHARACTER_INFO[i][ch_POLICE_JAIL_TIME] > 0)
			CHARACTER_INFO[i][ch_POLICE_JAIL_TIME] -= gettime() - PLAYER_TEMP[i][py_ENTER_JAIL_TIME];
			
		SaveUserData(i);
		SavePlayerToysData(i);
		SavePlayerVehicles(i, false);
		SavePlayerSkills(i);
		SavePlayerWorks(i);
		SavePlayerMisc(i);

		GameTextForPlayer(i, "~w~Reiniciando...", 8000, 1);
	}

	#if DEBUG_MODE == 1
		printf("OnGameModeExit"); // debug juju
	#endif

	printf("Deteniendo servidor...");
	db_close(Database);
	Log("status", "Servidor detenido.");
	return 1;
}

RemoveObjectCollisions()
{
	//taller temple
    CA_RemoveBuilding(5849, 1046.6797, -935.1953, 46.9922, 0.25);
    CA_RemoveBuilding(5854, 992.5313, -962.7344, 60.7813, 0.25);
    CA_RemoveBuilding(1266, 1029.1797, -939.5156, 52.7500, 0.25);
    CA_RemoveBuilding(1260, 1029.1797, -939.5156, 52.7500, 0.25);
    CA_RemoveBuilding(1294, 1034.7891, -950.3750, 46.4297, 0.25);
    CA_RemoveBuilding(5848, 1046.6797, -935.1953, 46.9922, 0.25);

    // base mc maik
    CA_RemoveBuilding(3276, -300.9375, -2148.4219, 28.3203, 0.25);
    CA_RemoveBuilding(3276, -297.1875, -2141.5703, 28.3203, 0.25);
    CA_RemoveBuilding(705, -220.5391, -2281.0156, 27.3906, 0.25);
    CA_RemoveBuilding(705, -208.9766, -2306.9531, 27.8906, 0.25);
    CA_RemoveBuilding(3276, -257.5625, -2241.5234, 28.3203, 0.25);
    CA_RemoveBuilding(3276, -263.8672, -2231.5781, 28.3203, 0.25);
    CA_RemoveBuilding(3276, -245.3984, -2225.9922, 28.6875, 0.25);
    CA_RemoveBuilding(3276, -245.4375, -2236.6875, 28.4141, 0.25);
    CA_RemoveBuilding(3276, -249.2031, -2244.3984, 28.4141, 0.25);
    CA_RemoveBuilding(703, -234.4453, -2259.2188, 28.0781, 0.25);
    CA_RemoveBuilding(17038, -280.1875, -2167.7031, 27.7891, 0.25);
    CA_RemoveBuilding(17037, -288.2734, -2163.5000, 30.0938, 0.25);
    CA_RemoveBuilding(17036, -285.3984, -2151.0469, 27.3828, 0.25);
    CA_RemoveBuilding(3276, -285.9297, -2139.2734, 28.3203, 0.25);
    CA_RemoveBuilding(3276, -274.5781, -2138.6328, 28.4922, 0.25);
    CA_RemoveBuilding(17039, -260.5391, -2182.6094, 26.6875, 0.25);
    CA_RemoveBuilding(17040, -257.5313, -2202.8359, 27.5781, 0.25);
    CA_RemoveBuilding(3276, -254.1406, -2170.7969, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -263.3906, -2140.5938, 28.8281, 0.25);
    CA_RemoveBuilding(3276, -258.0000, -2148.1094, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -256.2500, -2159.3203, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -251.3047, -2181.8047, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -248.0391, -2192.8125, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -244.8594, -2203.8672, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -243.7266, -2214.7266, 28.8984, 0.25);

	//Objetos removidos de LCN HQ
    CA_RemoveBuilding(726, 743.2422, -1151.4766, 20.8750, 0.25);
    CA_RemoveBuilding(733, 778.2109, -1207.2031, 13.5391, 0.25);
    CA_RemoveBuilding(729, 731.3906, -1223.1641, 12.5078, 0.25);
    CA_RemoveBuilding(733, 717.1172, -1236.2266, 12.0625, 0.25);
    CA_RemoveBuilding(726, 680.8594, -1293.3984, 12.3984, 0.25);
    CA_RemoveBuilding(732, 782.7969, -1304.0781, 12.3906, 0.25);
    CA_RemoveBuilding(620, 651.1094, -1305.9766, 12.5859, 0.25);
    CA_RemoveBuilding(620, 678.4844, -1251.7891, 12.0313, 0.25);
    CA_RemoveBuilding(620, 746.4922, -1303.4141, 11.6719, 0.25);
    CA_RemoveBuilding(620, 760.4531, -1304.1328, 12.2813, 0.25);
    CA_RemoveBuilding(620, 782.3438, -1277.8359, 12.2031, 0.25);
    CA_RemoveBuilding(620, 783.0625, -1245.7969, 12.5938, 0.25);

	// heix
	CA_RemoveBuilding(3578, 2526.4297, -2561.3047, 13.1719, 0.25);

	// plaza
	CA_RemoveBuilding(4057, 1479.5547, -1693.1406, 19.5781, 0.25);
	CA_RemoveBuilding(4210, 1479.5625, -1631.4531, 12.0781, 0.25);
	CA_RemoveBuilding(713, 1457.9375, -1620.6953, 13.4531, 0.25);
	CA_RemoveBuilding(713, 1496.8672, -1707.8203, 13.4063, 0.25);
	CA_RemoveBuilding(1283, 1430.1719, -1719.4688, 15.6250, 0.25);
	CA_RemoveBuilding(1226, 1451.6250, -1727.6719, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1467.9844, -1727.6719, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1485.1719, -1727.6719, 16.4219, 0.25);
	CA_RemoveBuilding(1280, 1468.9844, -1713.5078, 13.4531, 0.25);
	CA_RemoveBuilding(1231, 1479.6953, -1716.7031, 15.6250, 0.25);
	CA_RemoveBuilding(1226, 1505.1797, -1727.6719, 16.4219, 0.25);
	CA_RemoveBuilding(1280, 1488.7656, -1713.7031, 13.4531, 0.25);
	CA_RemoveBuilding(1289, 1504.7500, -1711.8828, 13.5938, 0.25);
	CA_RemoveBuilding(1258, 1445.0078, -1704.7656, 13.6953, 0.25);
	CA_RemoveBuilding(1226, 1433.7109, -1702.3594, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1433.7109, -1676.6875, 16.4219, 0.25);
	CA_RemoveBuilding(1258, 1445.0078, -1692.2344, 13.6953, 0.25);
	CA_RemoveBuilding(1226, 1433.7109, -1656.2500, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1433.7109, -1636.2344, 16.4219, 0.25);
	CA_RemoveBuilding(712, 1445.8125, -1650.0234, 22.2578, 0.25);
	CA_RemoveBuilding(1226, 1433.7109, -1619.0547, 16.4219, 0.25);
	CA_RemoveBuilding(1283, 1443.2031, -1592.9453, 15.6250, 0.25);
	CA_RemoveBuilding(673, 1457.7266, -1710.0625, 12.3984, 0.25);
	CA_RemoveBuilding(620, 1461.6563, -1707.6875, 11.8359, 0.25);
	CA_RemoveBuilding(1280, 1468.9844, -1704.6406, 13.4531, 0.25);
	CA_RemoveBuilding(700, 1463.0625, -1701.5703, 13.7266, 0.25);
	CA_RemoveBuilding(1231, 1479.6953, -1702.5313, 15.6250, 0.25);
	CA_RemoveBuilding(673, 1457.5547, -1697.2891, 12.3984, 0.25);
	CA_RemoveBuilding(1280, 1468.9844, -1694.0469, 13.4531, 0.25);
	CA_RemoveBuilding(1231, 1479.3828, -1692.3906, 15.6328, 0.25);
	CA_RemoveBuilding(4186, 1479.5547, -1693.1406, 19.5781, 0.25);
	CA_RemoveBuilding(620, 1461.1250, -1687.5625, 11.8359, 0.25);
	CA_RemoveBuilding(700, 1463.0625, -1690.6484, 13.7266, 0.25);
	CA_RemoveBuilding(641, 1458.6172, -1684.1328, 11.1016, 0.25);
	CA_RemoveBuilding(625, 1457.2734, -1666.2969, 13.6953, 0.25);
	CA_RemoveBuilding(1280, 1468.9844, -1682.7188, 13.4531, 0.25);
	CA_RemoveBuilding(712, 1471.4063, -1666.1797, 22.2578, 0.25);
	CA_RemoveBuilding(1231, 1479.3828, -1682.3125, 15.6328, 0.25);
	CA_RemoveBuilding(625, 1458.2578, -1659.2578, 13.6953, 0.25);
	CA_RemoveBuilding(712, 1449.8516, -1655.9375, 22.2578, 0.25);
	CA_RemoveBuilding(1231, 1477.9375, -1652.7266, 15.6328, 0.25);
	CA_RemoveBuilding(1280, 1479.6094, -1653.2500, 13.4531, 0.25);
	CA_RemoveBuilding(625, 1457.3516, -1650.5703, 13.6953, 0.25);
	CA_RemoveBuilding(625, 1454.4219, -1642.4922, 13.6953, 0.25);
	CA_RemoveBuilding(1280, 1467.8516, -1646.5938, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1472.8984, -1651.5078, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1465.9375, -1639.8203, 13.4531, 0.25);
	CA_RemoveBuilding(1231, 1466.4688, -1637.9609, 15.6328, 0.25);
	CA_RemoveBuilding(625, 1449.5938, -1635.0469, 13.6953, 0.25);
	CA_RemoveBuilding(1280, 1467.7109, -1632.8906, 13.4531, 0.25);
	CA_RemoveBuilding(1232, 1465.8906, -1629.9766, 15.5313, 0.25);
	CA_RemoveBuilding(1280, 1472.6641, -1627.8828, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1479.4688, -1626.0234, 13.4531, 0.25);
	CA_RemoveBuilding(3985, 1479.5625, -1631.4531, 12.0781, 0.25);
	CA_RemoveBuilding(4206, 1479.5547, -1639.6094, 13.6484, 0.25);
	CA_RemoveBuilding(1232, 1465.8359, -1608.3750, 15.3750, 0.25);
	CA_RemoveBuilding(1229, 1466.4844, -1598.0938, 14.1094, 0.25);
	CA_RemoveBuilding(1226, 1451.3359, -1596.7031, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1471.3516, -1596.7031, 16.4219, 0.25);
	CA_RemoveBuilding(1280, 1488.7656, -1704.5938, 13.4531, 0.25);
	CA_RemoveBuilding(700, 1494.2109, -1694.4375, 13.7266, 0.25);
	CA_RemoveBuilding(1280, 1488.7656, -1693.7344, 13.4531, 0.25);
	CA_RemoveBuilding(620, 1496.9766, -1686.8516, 11.8359, 0.25);
	CA_RemoveBuilding(641, 1494.1406, -1689.2344, 11.1016, 0.25);
	CA_RemoveBuilding(1280, 1488.7656, -1682.6719, 13.4531, 0.25);
	CA_RemoveBuilding(712, 1480.6094, -1666.1797, 22.2578, 0.25);
	CA_RemoveBuilding(712, 1488.2266, -1666.1797, 22.2578, 0.25);
	CA_RemoveBuilding(1280, 1486.4063, -1651.3906, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1491.3672, -1646.3828, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1493.1328, -1639.4531, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1486.1797, -1627.7656, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1491.2188, -1632.6797, 13.4531, 0.25);
	CA_RemoveBuilding(1232, 1494.4141, -1629.9766, 15.5313, 0.25);
	CA_RemoveBuilding(1232, 1494.3594, -1608.3750, 15.3750, 0.25);
	CA_RemoveBuilding(1226, 1488.5313, -1596.7031, 16.4219, 0.25);
	CA_RemoveBuilding(1229, 1498.0547, -1598.0938, 14.1094, 0.25);
	CA_RemoveBuilding(1288, 1504.7500, -1705.4063, 13.5938, 0.25);
	CA_RemoveBuilding(1287, 1504.7500, -1704.4688, 13.5938, 0.25);
	CA_RemoveBuilding(1286, 1504.7500, -1695.0547, 13.5938, 0.25);
	CA_RemoveBuilding(1285, 1504.7500, -1694.0391, 13.5938, 0.25);
	CA_RemoveBuilding(673, 1498.9609, -1684.6094, 12.3984, 0.25);
	CA_RemoveBuilding(625, 1504.1641, -1662.0156, 13.6953, 0.25);
	CA_RemoveBuilding(625, 1504.7188, -1670.9219, 13.6953, 0.25);
	CA_RemoveBuilding(620, 1503.1875, -1621.1250, 11.8359, 0.25);
	CA_RemoveBuilding(673, 1501.2813, -1624.5781, 12.3984, 0.25);
	CA_RemoveBuilding(673, 1498.3594, -1616.9688, 12.3984, 0.25);
	CA_RemoveBuilding(1226, 1504.8906, -1596.7031, 16.4219, 0.25);
	CA_RemoveBuilding(712, 1508.4453, -1668.7422, 22.2578, 0.25);
	CA_RemoveBuilding(625, 1505.6953, -1654.8359, 13.6953, 0.25);
	CA_RemoveBuilding(625, 1508.5156, -1647.8594, 13.6953, 0.25);
	CA_RemoveBuilding(625, 1513.2734, -1642.4922, 13.6953, 0.25);
	CA_RemoveBuilding(1258, 1510.8906, -1607.3125, 13.6953, 0.25);
	CA_RemoveBuilding(1226, 1524.8281, -1721.6328, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1524.8281, -1705.2734, 16.4219, 0.25);
	CA_RemoveBuilding(1229, 1524.2188, -1693.9688, 14.1094, 0.25);
	CA_RemoveBuilding(1226, 1524.8281, -1688.0859, 16.4219, 0.25);
	CA_RemoveBuilding(1229, 1524.2188, -1673.7109, 14.1094, 0.25);
	CA_RemoveBuilding(1226, 1524.8281, -1668.0781, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1524.8281, -1621.9609, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1525.3828, -1611.1563, 16.4219, 0.25);
	CA_RemoveBuilding(1283, 1528.9531, -1605.8594, 15.6250, 0.25);

	// minero
	CA_RemoveBuilding(791, 495.3439, -677.4840, 15.5468, 0.10); // vbg_fir_copse
	CA_RemoveBuilding(785, 495.3439, -677.4840, 15.5468, 0.10); // LOD Model of vbg_fir_copse
	CA_RemoveBuilding(791, 552.7189, -724.0310, 12.0546, 0.10); // vbg_fir_copse
	CA_RemoveBuilding(785, 552.7189, -724.0310, 12.0546, 0.10); // LOD Model of vbg_fir_copse
	CA_RemoveBuilding(791, 438.1409, -628.6480, 26.8593, 0.10); // vbg_fir_copse
	CA_RemoveBuilding(785, 438.1409, -628.6480, 26.8593, 0.10); // LOD Model of vbg_fir_copse

	// conce
	CA_RemoveBuilding(6409, 607.695, -1768.851, 15.234, 0.250);
	CA_RemoveBuilding(6406, 607.695, -1768.851, 15.234, 0.250);
	CA_RemoveBuilding(1308, 592.695, -1753.062, 13.750, 0.250);
	// Pescador
	CA_RemoveBuilding(933, 2159.409, -93.921, 1.804, 0.250);
	CA_RemoveBuilding(933, 2158.110, -94.140, 2.296, 0.250);
	CA_RemoveBuilding(923, 2160.350, -100.859, 2.609, 0.250);
	CA_RemoveBuilding(12991, 2161.629, -102.476, 1.750, 0.250);
	CA_RemoveBuilding(935, 2122.379, -83.382, 0.460, 0.250);
	CA_RemoveBuilding(935, 2119.820, -84.406, -0.070, 0.250);
	CA_RemoveBuilding(935, 2119.530, -82.890, -0.164, 0.250);
	CA_RemoveBuilding(935, 2120.520, -79.085, 0.218, 0.250);
	CA_RemoveBuilding(935, 2119.489, -73.617, 0.125, 0.250);
	CA_RemoveBuilding(935, 2117.840, -67.835, 0.132, 0.250);
	CA_RemoveBuilding(935, 2119.469, -69.734, 0.226, 0.250);
	CA_RemoveBuilding(1369, 2104.020, -105.265, 1.703, 0.250);
	
	//garaje tunin
	CA_RemoveBuilding(13062, 266.3594, 20.1328, 5.4844, 0.25);
	CA_RemoveBuilding(1440, 243.9531, 24.6172, 2.0156, 0.25);
	CA_RemoveBuilding(1684, 276.8438, -2.4297, 2.8828, 0.25);
	CA_RemoveBuilding(13059, 266.3594, 20.1328, 5.4844, 0.25);
	CA_RemoveBuilding(1440, 255.2734, 22.7734, 1.8984, 0.25);
	
	//Cosechador
	CA_RemoveBuilding(3276, -378.7734, -1459.0234, 25.4766, 0.25);

	//Camionero productos limpieza
	CA_RemoveBuilding(985, 2497.4063, 2777.0703, 11.5313, 0.25);
	CA_RemoveBuilding(986, 2497.4063, 2769.1094, 11.5313, 0.25);
	
	//Grua
	CA_RemoveBuilding(17350, -54.9922, -1130.7266, 4.5781, 0.25);
	CA_RemoveBuilding(1447, -89.9297, -1133.7500, 1.3906, 0.25);
	CA_RemoveBuilding(1438, -87.0547, -1132.6797, 0.0469, 0.25);
	CA_RemoveBuilding(1462, -79.2500, -1137.7188, 0.0547, 0.25);
	CA_RemoveBuilding(3285, -73.8047, -1141.4219, 1.9844, 0.25);
	CA_RemoveBuilding(17072, -54.9922, -1130.7266, 4.5781, 0.25);
	CA_RemoveBuilding(17073, -56.1250, -1130.1719, 4.4922, 0.25);
	CA_RemoveBuilding(1462, -84.3750, -1116.0938, 0.2578, 0.25);
	CA_RemoveBuilding(1447, -84.0547, -1117.2188, 1.3906, 0.25);
	CA_RemoveBuilding(1415, -68.3516, -1104.9922, 0.2188, 0.25);
	CA_RemoveBuilding(1462, -60.3594, -1116.9375, 0.2578, 0.25);
	CA_RemoveBuilding(1438, -63.6719, -1125.6953, 0.0469, 0.25);
	CA_RemoveBuilding(1438, -63.4141, -1115.4141, 0.0469, 0.25);
	CA_RemoveBuilding(1415, -63.8125, -1106.4219, 0.2188, 0.25);
	
	// Leñador
	CA_RemoveBuilding(785, -1878.7813, -2299.4531, 36.7578, 0.25);
    CA_RemoveBuilding(785, -1851.1719, -2419.8906, 28.8672, 0.25);
    CA_RemoveBuilding(785, -1916.5703, -2352.8203, 27.8984, 0.25);
    CA_RemoveBuilding(785, -1921.7813, -2233.5547, 64.0625, 0.25);
    CA_RemoveBuilding(785, -1868.4609, -2470.2734, 26.2813, 0.25);
    CA_RemoveBuilding(785, -1934.3438, -2401.9297, 26.5000, 0.25);
    CA_RemoveBuilding(791, -1868.4609, -2470.2734, 26.2813, 0.25);
    CA_RemoveBuilding(790, -1979.7188, -2371.9063, 34.7578, 0.25);
    CA_RemoveBuilding(791, -1934.3438, -2401.9297, 26.5000, 0.25);
    CA_RemoveBuilding(791, -1916.5703, -2352.8203, 27.8984, 0.25);
    CA_RemoveBuilding(790, -1891.0703, -2381.6875, 34.7578, 0.25);
    CA_RemoveBuilding(791, -1878.7813, -2299.4531, 36.7578, 0.25);
    CA_RemoveBuilding(18228, -1856.6875, -2321.2891, 38.1484, 0.25);
    CA_RemoveBuilding(791, -1851.1719, -2419.8906, 28.8672, 0.25);
    CA_RemoveBuilding(791, -1921.7813, -2233.5547, 64.0625, 0.25);

	return 1;
}

FormatDialogStrings()
{
	new Dialog_Lines_String[256];

		/* PIZZA FOOD */
	format(DIALOG_FOOD_PIZZA_String, sizeof DIALOG_FOOD_PIZZA_String, ""COL_WHITE"Producto\tPrecio\n");
	for(new i; i != sizeof PIZZA_FOOD; i ++)
	{
		format(Dialog_Lines_String, sizeof Dialog_Lines_String, ""COL_WHITE"%d. %s\t"COL_RED""COL_GREEN"%d$\n", i + 1, PIZZA_FOOD[i][food_NAME], PIZZA_FOOD[i][food_PRICE]);
		strcat(DIALOG_FOOD_PIZZA_String, Dialog_Lines_String);
	}

		/* CLUCKIN FOOD */
	format(DIALOG_FOOD_CLUCKIN_String, sizeof DIALOG_FOOD_CLUCKIN_String, ""COL_WHITE"Producto\t"COL_WHITE"Precio\n");
	for(new i; i != sizeof CLUCKIN_BELL_FOOD; i ++)
	{
		format(Dialog_Lines_String, sizeof Dialog_Lines_String, ""COL_WHITE"%d. %s\t"COL_RED""COL_GREEN"%d$\n", i + 1, CLUCKIN_BELL_FOOD[i][food_NAME], CLUCKIN_BELL_FOOD[i][food_PRICE]);
		strcat(DIALOG_FOOD_CLUCKIN_String, Dialog_Lines_String);
	}

		/* BURGER_SHOT FOOD */
	format(DIALOG_FOOD_BURGER_String, sizeof DIALOG_FOOD_BURGER_String, ""COL_WHITE"Producto\t"COL_WHITE"Precio\n");
	for(new i; i != sizeof BURGER_SHOT_FOOD; i ++)
	{
		format(Dialog_Lines_String, sizeof Dialog_Lines_String, ""COL_WHITE"%d. %s\t"COL_RED""COL_GREEN"%d$\n", i + 1, BURGER_SHOT_FOOD[i][food_NAME], BURGER_SHOT_FOOD[i][food_PRICE]);
		strcat(DIALOG_FOOD_BURGER_String, Dialog_Lines_String);
	}

		/* 24/7 LIST */
	format(DIALOG_247_LIST_String, sizeof DIALOG_247_LIST_String, ""COL_WHITE"Producto\t"COL_WHITE"Precio\n");
	for(new i = 0; i != sizeof Supermarket_Product_List; i ++)
	{
		format(Dialog_Lines_String, sizeof(Dialog_Lines_String), ""COL_WHITE"%d. %s\t"COL_RED""COL_GREEN"%d$\n", i + 1, Supermarket_Product_List[i][product_NAME], Supermarket_Product_List[i][product_PRICE]);
		strcat(DIALOG_247_LIST_String, Dialog_Lines_String);
	}

	//GPS
	new city[45], zone[45];

	//GPS Hospitales
	format(DIALOG_PLAYER_GPS_SITE_0_String, sizeof DIALOG_PLAYER_GPS_SITE_0_String, ""COL_WHITE"Lugar\t"COL_WHITE"Zona\n");
	for(new i = 0; i != sizeof(Hospital_Spawn_Positions); i++ )
	{
		GetPointZone(Hospital_Spawn_Positions[i][0], Hospital_Spawn_Positions[i][1], city, zone);
		format(Dialog_Lines_String, sizeof Dialog_Lines_String, ""COL_WHITE"Hospital %d\t"COL_WHITE"%s, %s\n", i + 1, city, zone);
		strcat(DIALOG_PLAYER_GPS_SITE_0_String, Dialog_Lines_String);
	}

	//GPS CONCES
	format(DIALOG_PLAYER_GPS_SITE_7_String, sizeof DIALOG_PLAYER_GPS_SITE_7_String, ""COL_WHITE"Lugar\t"COL_WHITE"Zona\n");
	for(new i = 0; i != sizeof(SELL_VEHICLES_SHOPS_SPAWN); i++ )
	{
		GetPointZone(SELL_VEHICLES_SHOPS_SPAWN[i][0], SELL_VEHICLES_SHOPS_SPAWN[i][1], city, zone);
		format(Dialog_Lines_String, sizeof Dialog_Lines_String, ""COL_WHITE"Concesionario %d\t"COL_WHITE"%s, %s\n", i + 1, city, zone);
		strcat(DIALOG_PLAYER_GPS_SITE_7_String, Dialog_Lines_String);
	}

	//Colores CREWS
	format(DIALOG_CREATE_CREW_COLOR_String, sizeof DIALOG_CREATE_CREW_COLOR_String, "");
	for(new i = 0; i != sizeof(CrewColors); i++)
	{
		format(Dialog_Lines_String, sizeof(Dialog_Lines_String), "{%06x}%s\n", CrewColors[i] >>> 8, CrewNameColors[i]);
		strcat(DIALOG_CREATE_CREW_COLOR_String, Dialog_Lines_String);
	}
	return 1;
}

<<<<<<< HEAD
CreateTrashCheckpoint(route, modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if (route >= MAX_ROUTES) return printf("---> Límite superado en array 'TRASH_OBJECTS, route' en la función 'CreateTrashCheckpoint'.");
	if (!TRASH_OBJECTS[route][trash_route_VALID]) TRASH_OBJECTS[route][trash_route_VALID] = true;
	if (TRASH_OBJECTS[route][trash_route_OBJECTS] >= MAX_OBJECTS_PER_ROUTE) return printf("---> Límite superado en array 'TRASH_OBJECTS, objects' en la función 'CreateTrashCheckpoint'.");

	if (TRASH_OBJECTS[route][trash_route_OBJECTS] == 0) TRASH_OBJECTS[route][trash_route_DISTANCE] = GetDistanceBetweenPoints3D(x, y, z, obtain_work_coords[WORK_TRASH][obtain_work_X], obtain_work_coords[WORK_TRASH][obtain_work_Y], obtain_work_coords[WORK_TRASH][obtain_work_Z]);
	else
	{
		TRASH_OBJECTS[route][trash_route_DISTANCE] -= GetDistanceBetweenPoints3D(TRASH_OBJECTS[route][trash_object_X][ TRASH_OBJECTS[route][trash_route_OBJECTS] - 1], TRASH_OBJECTS[route][trash_object_Y][ TRASH_OBJECTS[route][trash_route_OBJECTS] - 1 ], TRASH_OBJECTS[route][trash_object_Z][ TRASH_OBJECTS[route][trash_route_OBJECTS] - 1 ], obtain_work_coords[WORK_TRASH][obtain_work_X], obtain_work_coords[WORK_TRASH][obtain_work_Y], obtain_work_coords[WORK_TRASH][obtain_work_Z]);
		TRASH_OBJECTS[route][trash_route_DISTANCE] += GetDistanceBetweenPoints3D(x, y, z, TRASH_OBJECTS[route][trash_object_X][ TRASH_OBJECTS[route][trash_route_OBJECTS] - 1], TRASH_OBJECTS[route][trash_object_Y][ TRASH_OBJECTS[route][trash_route_OBJECTS] - 1 ], TRASH_OBJECTS[route][trash_object_Z][ TRASH_OBJECTS[route][trash_route_OBJECTS] - 1 ]);
	}

	TRASH_OBJECTS[route][trash_object_MODELID][ TRASH_OBJECTS[route][trash_route_OBJECTS] ] = modelid;
	TRASH_OBJECTS[route][trash_object_X][ TRASH_OBJECTS[route][trash_route_OBJECTS] ] = x;
	TRASH_OBJECTS[route][trash_object_Y][ TRASH_OBJECTS[route][trash_route_OBJECTS] ] = y;
	TRASH_OBJECTS[route][trash_object_Z][ TRASH_OBJECTS[route][trash_route_OBJECTS] ] = z;
	TRASH_OBJECTS[route][trash_object_RX][ TRASH_OBJECTS[route][trash_route_OBJECTS] ] = rx;
	TRASH_OBJECTS[route][trash_object_RY][ TRASH_OBJECTS[route][trash_route_OBJECTS] ] = ry;
	TRASH_OBJECTS[route][trash_object_RZ][ TRASH_OBJECTS[route][trash_route_OBJECTS] ] = rz;
	//CreateDynamicObject(modelid, x, y, z, rx, ry, rz, 0, 0);

	TRASH_OBJECTS[route][trash_route_DISTANCE] += GetDistanceBetweenPoints3D(x, y, z, obtain_work_coords[WORK_TRASH][obtain_work_X], obtain_work_coords[WORK_TRASH][obtain_work_Y], obtain_work_coords[WORK_TRASH][obtain_work_Z]);
	TRASH_OBJECTS[route][trash_route_MONEY] = floatround(0.3 * TRASH_OBJECTS[route][trash_route_DISTANCE]);

	TRASH_OBJECTS[route][trash_route_OBJECTS] ++;
	return 1;
}

<<<<<<< HEAD
GetPropertyIndexByID(id)
{
	for(new i = 0; i != MAX_PROPERTIES; i ++)
	{
		if (!PROPERTY_INFO[i][property_VALID]) continue;
		if (PROPERTY_INFO[i][property_ID] == id) return i;
	}
	return -1;
}

SetPlayerToys(playerid)
{
	for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++) RemovePlayerAttachedObject(playerid, i);

	for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++)
	{
		if (i >= MAX_NU_TOYS && !ACCOUNT_INFO[playerid][ac_SU]) break;

		if (PLAYER_TOYS[playerid][i][player_toy_VALID])
		{
			if (PLAYER_TOYS[playerid][i][player_toy_ATTACHED])
			{
				SetPlayerAttachedObject
				(
					playerid,
					i,
					PLAYER_TOYS[playerid][ i ][player_toy_MODELID],
					PLAYER_TOYS[playerid][ i ][player_toy_BONE],
					PLAYER_TOYS[playerid][ i ][player_toy_OFFSET_X],
					PLAYER_TOYS[playerid][ i ][player_toy_OFFSET_Y],
					PLAYER_TOYS[playerid][ i ][player_toy_OFFSET_Z],
					PLAYER_TOYS[playerid][ i ][player_toy_ROT_X],
					PLAYER_TOYS[playerid][ i ][player_toy_ROT_Y],
					PLAYER_TOYS[playerid][ i ][player_toy_ROT_Z],
					PLAYER_TOYS[playerid][ i ][player_toy_SCALE_X],
					PLAYER_TOYS[playerid][ i ][player_toy_SCALE_Y],
					PLAYER_TOYS[playerid][ i ][player_toy_SCALE_Z],
					PLAYER_TOYS[playerid][ i ][player_toy_COLOR_1],
					PLAYER_TOYS[playerid][ i ][player_toy_COLOR_2]
				);
			}
		}
	}

	return 1;
}

UpdatePlayerToy(playerid, index)
{
	RemovePlayerAttachedObject(playerid, index);
	SetPlayerAttachedObject
	(
		playerid,
		index,
		PLAYER_TOYS[playerid][ index ][player_toy_MODELID],
		PLAYER_TOYS[playerid][ index ][player_toy_BONE],
		PLAYER_TOYS[playerid][ index ][player_toy_OFFSET_X],
		PLAYER_TOYS[playerid][ index ][player_toy_OFFSET_Y],
		PLAYER_TOYS[playerid][ index ][player_toy_OFFSET_Z],
		PLAYER_TOYS[playerid][ index ][player_toy_ROT_X],
		PLAYER_TOYS[playerid][ index ][player_toy_ROT_Y],
		PLAYER_TOYS[playerid][ index ][player_toy_ROT_Z],
		PLAYER_TOYS[playerid][ index ][player_toy_SCALE_X],
		PLAYER_TOYS[playerid][ index ][player_toy_SCALE_Y],
		PLAYER_TOYS[playerid][ index ][player_toy_SCALE_Z],
		PLAYER_TOYS[playerid][ index ][player_toy_COLOR_1],
		PLAYER_TOYS[playerid][ index ][player_toy_COLOR_2]
	);
	SavePlayerToysData(playerid);
	return 1;
}

EditPlayerToy(playerid)
{
	if (PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ATTACHED]) RemovePlayerAttachedObject(playerid, PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT]);

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

	EditAttachedObject(playerid, PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT]);
	return 1;
}

RegisterNewPlayerPhone(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DB_Query[200];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PHONE`\
		(\
			`PHONE_NUMBER`, `ID_USER`\
		)\
		VALUES\
		(\
			'%d', '%d'\
		);\
	",
		PLAYER_PHONE[playerid][player_phone_NUMBER], ACCOUNT_INFO[playerid][ac_ID]
	);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

RegisterNewPlayerPhoneBook(playerid, slot)
{
	new DBResult:Result, DB_Query[300];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PHONE_BOOK`\
		(\
			`PHONE_ID`, `NAME`, `PHONE_NUMBER`\
		)\
		VALUES\
		(\
			'%d', '%q', '%d'\
		);\
		SELECT MAX(`CONTACT_ID`) FROM `PHONE_BOOK`;\
	",
		PLAYER_PHONE[playerid][player_phone_NUMBER], PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_NAME], PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_PHONE_NUMBER]
	);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result)) PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);
	return 1;
}

RegisterPhoneMessage(from, to, const message[], offline = 0)
{
	new DB_Query[300];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PHONE_MESSAGES`\
		(\
			`FROM`, `TO`, `MESSAGE`, `OFFLINE`\
		)\
		VALUES\
		(\
			'%d', '%d', '%q', '%d'\
		);\
	", from, to, message, offline);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

forward NoCallResponse(playerid);
public NoCallResponse(playerid)
{
	#if DEBUG_MODE == 1
		printf("NoCallResponse"); // debug juju
	#endif

	if (!PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) return 0;
	if (PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID] == INVALID_PLAYER_ID) return 0;
	if (PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE] != CALL_STATE_WAITING_RESPONSE) return 0;

	EndPhoneCall(playerid);
	return 1;
}

EndPhoneCall(playerid)
{
	if (!PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) return 0;

	if (PLAYER_TEMP[playerid][py_POLICE_CALL_NAME] || PLAYER_TEMP[playerid][py_POLICE_CALL_DESCRIPTION])
	{
		PLAYER_TEMP[playerid][py_PLAYER_IN_CALL] = false;
		PLAYER_TEMP[playerid][py_POLICE_CALL_NAME] = false;
		PLAYER_TEMP[playerid][py_POLICE_CALL_DESCRIPTION] = false;
		return 1;
	}

	if (PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID] == INVALID_PLAYER_ID) return 0;
	if (PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE] == CALL_GAME_STATE_NONE) return 0;

	new to_playerid = PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID];
	switch(PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE])
	{
		case CALL_STATE_WAITING_RESPONSE:
		{
			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][6]);

			PLAYER_TEMP[to_playerid][py_PLAYER_IN_CALL] = false;
			PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_STATE] = CALL_GAME_STATE_NONE;
			PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_PLAYERID] = INVALID_PLAYER_ID;
		}
		case CALL_STATE_INCOMING_CALL:
		{
		    ShowPlayerMessage(playerid, "~r~No respondieron el teléfono.", 2);
			KillTimer(PLAYER_TEMP[to_playerid][py_TIMERS][6]);

			PLAYER_TEMP[to_playerid][py_PLAYER_IN_CALL] = false;
			PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_STATE] = CALL_GAME_STATE_NONE;
			PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_PLAYERID] = INVALID_PLAYER_ID;
		}
		case CALL_STATE_ESTABLISHED:
		{
		    ShowPlayerMessage(to_playerid, "Llamada finalizada.", 2);
			PLAYER_TEMP[to_playerid][py_PLAYER_IN_CALL] = false;
			PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_STATE] = CALL_GAME_STATE_NONE;
			PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_PLAYERID] = INVALID_PLAYER_ID;

			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
			SetPlayerSpecialAction(to_playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		}
	}

	PLAYER_TEMP[playerid][py_PLAYER_IN_CALL] = false;
	PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE] = CALL_GAME_STATE_NONE;
	PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID] = INVALID_PLAYER_ID;
	return 1;
}

convertPhoneNumber(playerid, number)
{
	new f_string[24], bool:exists;
	for(new i = 0; i != MAX_PHONE_CONTACTS; i ++)
	{
		if (!PLAYER_PHONE_BOOK[playerid][i][phone_book_contact_VALID]) continue;
		if (number == PLAYER_PHONE_BOOK[playerid][i][phone_book_contact_PHONE_NUMBER])
		{
			exists = true;
			format(f_string, sizeof f_string, "%s", PLAYER_PHONE_BOOK[playerid][i][phone_book_contact_NAME]);
			break;
		}
	}

	if (!exists) format(f_string, sizeof f_string, "%d", number);
	return f_string;
}

GetEmptyPlayerPhoneBookSlot(playerid)
{
	for(new i = 0; i != MAX_PHONE_CONTACTS; i ++)
	{
		if (!PLAYER_PHONE_BOOK[playerid][i][phone_book_contact_VALID]) return i;
	}
	return -1;
}

/*RegisterNewPlayerPocketObject(playerid, slot)
{
	new DBResult:Result, DB_Query[350];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PLAYER_POCKET`\
		(\
			`ID_USER`, `NAME`, `HUNGRY`, `THIRST`, `DRUNK`\
		)\
		VALUES\
		(\
			'%d', '%q', '%f', '%f', '%d'\
		);\
		SELECT MAX(`ID_OBJECT`) FROM `PLAYER_POCKET`;\
	",
		ACCOUNT_INFO[playerid][ac_ID], PLAYER_POCKET[playerid][slot][player_pocket_object_NAME], PLAYER_POCKET[playerid][slot][player_pocket_object_HUNGRY], PLAYER_POCKET[playerid][slot][player_pocket_object_THIRST], PLAYER_POCKET[playerid][slot][player_pocket_object_DRUNK]
	);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result)) PLAYER_POCKET[playerid][slot][player_pocket_object_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);
	return 1;
}*/

LoadPlayerPocketData(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[90];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_POCKET` WHERE `ID_USER` = '%d' LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], MAX_PLAYER_POCKET_OBJECTS);
	Result = db_query(Database, DB_Query);

	new index;
	for(new i; i < db_num_rows(Result); i++ )
	{
		if (index >= MAX_PLAYER_POCKET_OBJECTS)
		{
			printf("[debug]  Límite superado en array 'PP' al intentar cargar de la base de datos.");
			break;
		}

		PLAYER_POCKET[playerid][index][player_pocket_VALID] = true;

		PLAYER_POCKET[playerid][index][player_pocket_object_ID] = db_get_field_assoc_int(Result, "ID_OBJECT");
		db_get_field_assoc(Result, "NAME", PLAYER_POCKET[playerid][index][player_pocket_object_NAME], 24);
		PLAYER_POCKET[playerid][index][player_pocket_object_HUNGRY] = db_get_field_assoc_float(Result, "HUNGRY");
		PLAYER_POCKET[playerid][index][player_pocket_object_THIRST] = db_get_field_assoc_float(Result, "THIRST");
		PLAYER_POCKET[playerid][index][player_pocket_object_DRUNK] = db_get_field_assoc_int(Result, "DRUNK");

		index ++;
		db_next_row(Result);
	}
	db_free_result(Result);
	return 1;
}

TransferPlayerPocketObject(from_playerid, from_slot, to_playerid, to_slot)
{
	new DB_Query[130];
	format(DB_Query, sizeof(DB_Query), "UPDATE `PLAYER_POCKET` SET `ID_USER` = '%d' WHERE `ID_OBJECT` = '%d';", ACCOUNT_INFO[to_playerid][ac_ID], PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_ID]);
	db_free_result(db_query(Database, DB_Query));

	PLAYER_POCKET[to_playerid][to_slot][player_pocket_VALID] = true;
	PLAYER_POCKET[to_playerid][to_slot][player_pocket_object_ID] = PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_ID];
	format(PLAYER_POCKET[to_playerid][to_slot][player_pocket_object_NAME], 24, "%s", PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_NAME]);
	PLAYER_POCKET[to_playerid][to_slot][player_pocket_object_HUNGRY] = PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_HUNGRY];
	PLAYER_POCKET[to_playerid][to_slot][player_pocket_object_THIRST] = PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_THIRST];
	PLAYER_POCKET[to_playerid][to_slot][player_pocket_object_DRUNK] = PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_DRUNK];

	PLAYER_POCKET[from_playerid][from_slot][player_pocket_VALID] = false;
	PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_ID] = 0;
	format(PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_NAME], 24, "");
	PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_HUNGRY] = 0.0;
	PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_THIRST] = 0.0;
	PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_DRUNK] = 0;
	return 1;
}

DeletePlayerPocketObject(playerid, slot)
{
	new DB_Query[140];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_POCKET` WHERE `ID_OBJECT` = '%d' AND `ID_USER` = '%d';", PLAYER_POCKET[playerid][slot][player_pocket_object_ID], ACCOUNT_INFO[playerid][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	PLAYER_POCKET[playerid][slot][player_pocket_VALID] = false;
	PLAYER_POCKET[playerid][slot][player_pocket_object_ID] = 0;
	format(PLAYER_POCKET[playerid][slot][player_pocket_object_NAME], 24, "");
	PLAYER_POCKET[playerid][slot][player_pocket_object_HUNGRY] = 0.0;
	PLAYER_POCKET[playerid][slot][player_pocket_object_THIRST] = 0.0;
	PLAYER_POCKET[playerid][slot][player_pocket_object_DRUNK] = 0;
	return 1;
}

GetEmptyPlayerPocketSlot(playerid)
{
	for(new i = 0; i != MAX_PLAYER_POCKET_OBJECTS; i ++)
	{
		if (!PLAYER_POCKET[playerid][i][player_pocket_VALID]) return i;
	}
	return -1;
}

LoadPlayerGPSData(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[90];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_GPS` WHERE `ID_USER` = '%d' LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], MAX_PLAYER_GPS_SAVES);
	Result = db_query(Database, DB_Query);

	new index;
	for(new i; i < db_num_rows(Result); i++ )
	{
		if (index >= MAX_PLAYER_GPS_SAVES)
		{
			printf("[debug]  Límite superado en array 'P_GPS' al intentar cargar de la base de datos.");
			break;
		}

		PLAYER_GPS[playerid][index][player_gps_VALID] = true;

		PLAYER_GPS[playerid][index][player_gps_ID] = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "NAME", PLAYER_GPS[playerid][index][player_gps_NAME], 24);
		PLAYER_GPS[playerid][index][player_gps_X] = db_get_field_assoc_float(Result, "Cerrar");
		PLAYER_GPS[playerid][index][player_gps_Y] = db_get_field_assoc_float(Result, "Y");
		PLAYER_GPS[playerid][index][player_gps_Z] = db_get_field_assoc_float(Result, "Z");
		PLAYER_GPS[playerid][index][player_gps_WORLD] = db_get_field_assoc_int(Result, "WORLD");
		PLAYER_GPS[playerid][index][player_gps_INTERIOR] = db_get_field_assoc_int(Result, "INTERIOR");

		index ++;
		db_next_row(Result);
	}
	db_free_result(Result);
	return 1;
}

LoadPlayerToysData(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[90];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_TOYS` WHERE `ID_USER` = '%d' LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], MAX_PLAYER_ATTACHED_OBJECTS);
	Result = db_query(Database, DB_Query);

	new index;
	for(new i; i < db_num_rows(Result); i++ )
	{
		if (index >= MAX_PLAYER_ATTACHED_OBJECTS)
		{
			printf("[debug]  Límite superado en array 'PTOYS' al intentar cargar de la base de datos.");
			break;
		}

		PLAYER_TOYS[playerid][index][player_toy_VALID] = true;

		PLAYER_TOYS[playerid][index][player_toy_ID] = db_get_field_assoc_int(Result, "ID_TOY");
		db_get_field_assoc(Result, "NAME", PLAYER_TOYS[playerid][index][player_toy_NAME], 24);
		PLAYER_TOYS[playerid][index][player_toy_ATTACHED] = db_get_field_assoc_int(Result, "ATTACHED");
		PLAYER_TOYS[playerid][index][player_toy_MODELID] = db_get_field_assoc_int(Result, "MODELID");
		PLAYER_TOYS[playerid][index][player_toy_BONE] = db_get_field_assoc_int(Result, "BONE");
		PLAYER_TOYS[playerid][index][player_toy_OFFSET_X] = db_get_field_assoc_float(Result, "OFFSET_X");
		PLAYER_TOYS[playerid][index][player_toy_OFFSET_Y] = db_get_field_assoc_float(Result, "OFFSET_Y");
		PLAYER_TOYS[playerid][index][player_toy_OFFSET_Z] = db_get_field_assoc_float(Result, "OFFSET_Z");
		PLAYER_TOYS[playerid][index][player_toy_ROT_X] = db_get_field_assoc_float(Result, "ROT_X");
		PLAYER_TOYS[playerid][index][player_toy_ROT_Y] = db_get_field_assoc_float(Result, "ROT_Y");
		PLAYER_TOYS[playerid][index][player_toy_ROT_Z] = db_get_field_assoc_float(Result, "ROT_Z");
		PLAYER_TOYS[playerid][index][player_toy_SCALE_X] = db_get_field_assoc_float(Result, "SCALE_X");
		PLAYER_TOYS[playerid][index][player_toy_SCALE_Y] = db_get_field_assoc_float(Result, "SCALE_Y");
		PLAYER_TOYS[playerid][index][player_toy_SCALE_Z] = db_get_field_assoc_float(Result, "SCALE_Z");
		PLAYER_TOYS[playerid][index][player_toy_COLOR_1] = db_get_field_assoc_int(Result, "COLOR_1");
		PLAYER_TOYS[playerid][index][player_toy_COLOR_2] = db_get_field_assoc_int(Result, "COLOR_2");

		index ++;
		db_next_row(Result);
	}
	db_free_result(Result);
	return 1;
}

SavePlayerToysData(playerid)
{
  	if (!PLAYER_TEMP[playerid][py_USER_EXIT] || !PLAYER_TEMP[playerid][py_USER_LOGGED]) return 0;

  	for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++)
  	{
    	if (!PLAYER_TOYS[playerid][i][player_toy_VALID]) continue;

    	new DB_Query[900];
    	format(DB_Query, sizeof(DB_Query), "\
			UPDATE `PLAYER_TOYS` SET \
	   			`NAME` = '%q',\
	   			`ATTACHED` = '%d',\
	   			`MODELID` = '%d',\
			   	`BONE` = '%d',\
			   	`OFFSET_X` = '%f',\
			   	`OFFSET_Y` = '%f',\
			   	`OFFSET_Z` = '%f',\
			   	`ROT_X` = '%f',\
			   	`ROT_Y` = '%f',\
			   	`ROT_Z` = '%f',\
			   	`SCALE_X` = '%f',\
			   	`SCALE_Y` = '%f',\
			   	`SCALE_Z` = '%f',\
			   	`COLOR_1` = '%d',\
			   	`COLOR_2` = '%d' \
	 		WHERE `ID_TOY` = '%d';\
    	",
	 		PLAYER_TOYS[playerid][i][player_toy_NAME], PLAYER_TOYS[playerid][i][player_toy_ATTACHED],
	 		PLAYER_TOYS[playerid][i][player_toy_MODELID], PLAYER_TOYS[playerid][i][player_toy_BONE],
	 		PLAYER_TOYS[playerid][i][player_toy_OFFSET_X], PLAYER_TOYS[playerid][i][player_toy_OFFSET_Y], PLAYER_TOYS[playerid][i][player_toy_OFFSET_Z],
	 		PLAYER_TOYS[playerid][i][player_toy_ROT_X], PLAYER_TOYS[playerid][i][player_toy_ROT_Y], PLAYER_TOYS[playerid][i][player_toy_ROT_Z],
	 		PLAYER_TOYS[playerid][i][player_toy_SCALE_X], PLAYER_TOYS[playerid][i][player_toy_SCALE_Y], PLAYER_TOYS[playerid][i][player_toy_SCALE_Z],
	 		PLAYER_TOYS[playerid][i][player_toy_COLOR_1], PLAYER_TOYS[playerid][i][player_toy_COLOR_2],
	 		PLAYER_TOYS[playerid][i][player_toy_ID]
    	);
    	db_free_result(db_query(Database, DB_Query));
  	}
  	return 1;
}

GetEmptyPlayerToySlot(playerid)
{
	for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; ++i)
	{
		if (!PLAYER_TOYS[playerid][i][player_toy_VALID]) return i;
	}
	return -1;
}

<<<<<<< HEAD
minrand(min, max)
{
	return random(max - min) + min;
}

SetIntroCamera(playerid)
{
	new RandomSelectCamera = random(16);
    switch (RandomSelectCamera)
    {
		case 0:
		{
			InterpolateCameraPos(playerid, 1274.256958, -311.781494, 21.153951, 1240.965087, -484.300476, 39.420730, 60000);
			InterpolateCameraLookAt(playerid, 1273.389160, -316.641235, 20.360445, 1239.888183, -489.105590, 40.287422, 60000);
		}
		case 1: 
		{
			InterpolateCameraPos(playerid, 1287.876098, -1423.913696, 31.946989, 1258.807373, -1320.270751, 27.389789, 60000);
			InterpolateCameraLookAt(playerid, 1284.815307, -1420.031127, 31.200996, 1253.876220, -1320.266479, 26.562788, 60000);
		}
		case 2: 
		{
			InterpolateCameraPos(playerid, 1769.471069, -249.647293, 109.279930, 1691.584350, -260.034790, 106.816886, 60000);
			InterpolateCameraLookAt(playerid, 1769.510375, -254.111862, 107.029129, 1692.093261, -264.530670, 104.688995, 60000);
		}
		case 3: 
		{
			InterpolateCameraPos(playerid, 1720.385375, -408.378967, 48.505195, 1692.704833, -507.576904, 45.646732, 60000);
			InterpolateCameraLookAt(playerid, 1718.715576, -413.081634, 48.194107, 1693.375732, -512.531250, 45.581539, 60000);
		}
		case 4: 
		{
			InterpolateCameraPos(playerid, -2148.998291, 554.091186, 41.781066, -2080.489501, 576.044128, 42.103866, 60000);
			InterpolateCameraLookAt(playerid, -2144.032714, 554.676452, 41.749816, -2075.490234, 576.056579, 42.181987, 60000);
		}
		case 5: 
		{
			InterpolateCameraPos(playerid, 2366.046875, 2169.605712, 14.282853, 2299.226318, 2147.148437, 24.365032, 60000);
			InterpolateCameraLookAt(playerid, 2361.632080, 2167.424316, 15.149547, 2294.227783, 2147.205322, 24.470493, 60000);
		}
		case 6: 
		{
			InterpolateCameraPos(playerid, -2547.232666, -55.746692, 30.905969, -2530.718505, -4.454901, 29.586551, 60000);
			InterpolateCameraLookAt(playerid, -2543.840820, -52.088130, 30.574182, -2526.174316, -6.474372, 29.064069, 60000);
		}
		case 7:
		{
			InterpolateCameraPos(playerid, 2098.958496, 15.110654, 28.771690, 2024.581176, -109.930915, 31.089904, 60000);
			InterpolateCameraLookAt(playerid, 2100.868896, 10.701032, 27.391414, 2029.278564, -108.953018, 29.683368, 60000);
		}
		case 8:
		{
			InterpolateCameraPos(playerid, -1734.929931, 902.305664, 31.427259, -1778.646118, 942.846984, 33.246734, 60000);
			InterpolateCameraLookAt(playerid, -1738.319702, 905.981201, 31.416751, -1783.565307, 943.661560, 33.618694, 60000);
		}
		case 9:
		{
			InterpolateCameraPos(playerid, 2343.193359, -1389.369506, 34.948970, 2402.278320, -1293.767578, 33.055675, 60000);
			InterpolateCameraLookAt(playerid, 2347.229248, -1386.616943, 33.883308, 2403.856933, -1289.026489, 32.884151, 60000);
		}
		case 10:
		{
			InterpolateCameraPos(playerid, 2146.722656, -1321.355224, 30.315546, 2248.476318, -1280.461425, 36.017330, 60000);
			InterpolateCameraLookAt(playerid, 2151.317871, -1319.432739, 30.748596, 2252.710693, -1277.804931, 35.904056, 60000);
		}
		case 11:
		{
			InterpolateCameraPos(playerid, 655.701904, -743.479614, 44.184524, 615.779602, -687.716979, 31.585304, 60000);
			InterpolateCameraLookAt(playerid, 652.221130, -740.344055, 42.437351, 610.971923, -688.673645, 30.599927, 60000);
		}
		case 12:
		{
			InterpolateCameraPos(playerid, 872.725097, -999.728759, 57.511142, 857.525329, -914.929321, 72.688385, 60000);
			InterpolateCameraLookAt(playerid, 873.292175, -994.777343, 57.913368, 858.913513, -910.260925, 73.819450, 60000);
		}
		case 13:
		{
			InterpolateCameraPos(playerid, 2507.652343, 2129.115478, 14.842836, 2459.415771, 2137.726318, 18.873964, 60000);
			InterpolateCameraLookAt(playerid, 2503.152832, 2131.282958, 15.081345, 2456.733642, 2141.915039, 19.385107, 60000);
		}
		case 14:
		{
			InterpolateCameraPos(playerid, -2233.041015, 552.320617, 38.984733, -2172.366699, 558.488952, 42.372241, 5000);
			InterpolateCameraLookAt(playerid, -2228.212402, 553.598388, 38.755554, -2169.340576, 562.466491, 42.225036, 5000);
		}
		case 15:
		{
			InterpolateCameraPos(playerid, 1828.665893, -1103.566162, 24.149976, 1781.768066, -1075.379638, 26.545591, 60000);
			InterpolateCameraLookAt(playerid, 1824.796386, -1100.408447, 24.385477, 1776.871459, -1074.370727, 26.617115, 60000);
		}
    }

    SetPlayerTime(playerid, SERVER_TIME[0], SERVER_TIME[1]);
	SetPlayerWeather(playerid, SERVER_WEATHER);
    return 1;
}

/*CheckBlockedWeapon(playerid, weapon_ip)
{
	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
	{
		if (!PLAYER_WORKS[playerid][WORK_POLICE] && !PlayerIsInMafia(playerid) && !ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	  	{
			new bool:blocked = false;
			switch(weapon_ip)
			{
				case 31, 29, 23, 34, 24, 27, 30: blocked = true;
			}

			if (blocked)
			{
				ResetPlayerWeaponsEx(playerid);

		    	AddPlayerBadHistory(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_ID], TYPE_KICK, "Armas del PD sin serlo");

		    	new str[144];
		    	format(str, 144, "[ANTI-CHEAT] Kick sobre %s (%d): Armas del PD sin serlo", ACCOUNT_INFO[playerid][ac_NAME], playerid);
		    	SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);
		    	SendDiscordWebhook(str, 1);
		    
		    	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Razón: Tener armas prohibidas");
		    	KickEx(playerid, 500);
		  	}
		}
	}
 	return 1;
}*/

forward UpdateWorldTime();
public UpdateWorldTime()
{
	#if DEBUG_MODE == 1
		printf("UpdateWorldTime"); // debug juju
	#endif

	gettime(SERVER_TIME[0], SERVER_TIME[1]);

	SetWorldTime(SERVER_TIME[0]);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_DEAD)
			{
				new p_int = GetPlayerInterior(i);
				
				if (PLAYER_TEMP[i][py_NOCHE_DE_SEXO]) SetPlayerTime(i, 0, 0);
				else SetPlayerTime(i, SERVER_TIME[0], SERVER_TIME[1]);

				switch(p_int)
				{
					case 25..27: SetPlayerTime(i, 2, 2);
				}
			}
		}
	}
	return 1;
}

/*ConvertTime_SecondsToHours(sec, &hours, &minutes, &seconds)
{
	hours = floatround(sec / 3600);
	minutes = floatround((sec - (hours * 3600)) / 60);
	seconds = sec % 60;
	return 1;
}*/

<<<<<<< HEAD
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
    	if (in_gamemode_menu[playerid]) return ShowMainMenu(playerid);
    	if (in_main_menu[playerid]) return ShowMainMenu(playerid);

    	if (PLAYER_TEMP[playerid][py_MENU])
    	{
    		StopAudioStreamForPlayer(playerid);
    		HideMainMenu(playerid);
    		return 0;
    	}

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

	if (in_main_menu[playerid])
	{
		// Modo
		if (clickedid == Textdraws[textdraw_MAIN_MENU][1])
		{
			HideMainMenu(playerid);
			ShowGamemodesMenu(playerid);
			PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
		}

		// Cuenta
		if (clickedid == Textdraws[textdraw_MAIN_MENU][2])
		{
			PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
			ShowDialog(playerid, DIALOG_CHANGE_ACCOUNT);
		}

		// Config
		if (clickedid == Textdraws[textdraw_MAIN_MENU][3])
		{
			PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
			ShowDialog(playerid, DIALOG_PLAYER_CONFIG);
		}

		// Salir
		if (clickedid == Textdraws[textdraw_MAIN_MENU][4])
		{
			PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
			return Kick(playerid);
		}

		// Gamemode
		if (clickedid == Textdraws[textdraw_MAIN_MENU][5])
		{
			PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
			PlayerJoinGamemode(playerid);
		}
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

	if (PLAYER_TEMP[playerid][py_PLAYER_IN_PHONE] == true)
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

<<<<<<< HEAD
    if(PLAYER_TEMP[playerid][py_PLAYER_IN_ATM])
    {
    	printf("0 %i", playertextid);
		if (PlayerTextdraws[playerid][ptextdraw_BANK_MENU][3])
		{
			print("1");
			HideBankMenu(playerid);
			ShowDialog(playerid, DIALOG_BANK_DEPOSIT);
			return 1;
		}
		
		if (playertextid == PlayerTextdraws[playerid][ptextdraw_BANK_MENU][4])
		{
			print("2");
			HideBankMenu(playerid);
            ShowDialog(playerid, DIALOG_BANK_WITHDRAW);
            return 1;
		}
		
		if (playertextid == PlayerTextdraws[playerid][ptextdraw_BANK_MENU][5])
		{
			print("3");
			HideBankMenu(playerid);
            ShowDialog(playerid, DIALOG_BANK_TRANSFER);
            return 1;
		}
		
		if(playertextid == PlayerTextdraws[playerid][ptextdraw_BANK_MENU][6])
		{
			print("4");
			HideBankMenu(playerid);
            ShowDialog(playerid, DIALOG_BANK_TRANSACTIONS);
            return 1;
		}
		print("5");
	}
=======
>>>>>>> refs/rewritten/Algunos-arreglos
    return 1;
}

=======
>>>>>>> 2298b56 (misc modules)
GivePlayerReputation(playerid, ammount = 1, bool:message = true)
{
	new neccessary_rep = ACCOUNT_INFO[playerid][ac_LEVEL] * REP_MULTIPLIER;
	if (ACCOUNT_INFO[playerid][ac_REP] < neccessary_rep)
	{
		ACCOUNT_INFO[playerid][ac_REP] += ammount;
		
		if (message)
		{
			new str_text[64];
			format(str_text, sizeof(str_text), "EXP~n~~w~+%d", ammount);
			ShowPlayerAlert(playerid, str_text, 0xdf23f9FF, 4);
		}

		if (ACCOUNT_INFO[playerid][ac_REP] >= neccessary_rep) NextLevel(playerid);
		return 1;
	}
	return 0;
}

ResetGraffitiTextdraw()
{
	TextDrawDestroy(Textdraws[textdraw_GRAFFITI_PLUS][1]);
	TextDrawDestroy(Textdraws[textdraw_GRAFFITI_PLUS][3]);
	TextDrawDestroy(Textdraws[textdraw_GRAFFITI_PLUS][4]);

	Textdraws[textdraw_GRAFFITI_PLUS][1] = TextDrawCreate(501.500000, 140.766708, "_");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][1], 0.206498, 1.211886);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][1], 610.000000, 0.409999);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][1], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][1], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][1], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][1], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][1], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][1], 0);

	Textdraws[textdraw_GRAFFITI_PLUS][3] = TextDrawCreate(501.500000, 156.322280, "_");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][3], 0.206497, 1.211886);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][3], 610.000000, 0.409999);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][3], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][3], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][3], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][3], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][3], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][3], 0);

	Textdraws[textdraw_GRAFFITI_PLUS][4] = TextDrawCreate(501.500000, 171.877853, "_");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][4], 0.206497, 1.211886);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][4], 610.000000, 0.409999);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][4], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][4], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][4], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][4], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][4], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][4], 0);
	return 1;
}

SetMarketTextdraw()
{
	TextDrawDestroy(Textdraws[textdraw_GRAFFITI_PLUS][1]);
	TextDrawDestroy(Textdraws[textdraw_GRAFFITI_PLUS][3]);
	TextDrawDestroy(Textdraws[textdraw_GRAFFITI_PLUS][4]);

	Textdraws[textdraw_GRAFFITI_PLUS][1] = TextDrawCreate(501.500000, 140.766708, "_");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][1], 0.206498, 1.211886);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][1], 610.000000, 0.409999);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][1], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][1], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][1], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][1], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][1], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][1], 0);

	Textdraws[textdraw_GRAFFITI_PLUS][3] = TextDrawCreate(501.500000, 167.522293, "_");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][3], 0.206497, 1.211886);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][3], 610.000000, 0.409999);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][3], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][3], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][3], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][3], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][3], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][3], 0);

	Textdraws[textdraw_GRAFFITI_PLUS][4] = TextDrawCreate(501.500000, 194.277877, "_");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][4], 0.206497, 1.211886);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][4], 610.000000, 0.409999);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][4], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][4], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][4], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][4], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][4], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][4], 0);
	return 1;
}

NextLevel(playerid)
{
	new neccessary_rep = ACCOUNT_INFO[playerid][ac_LEVEL] * REP_MULTIPLIER;
	if (ACCOUNT_INFO[playerid][ac_REP] < neccessary_rep) return 0;
	GivePlayerCash(playerid, (ACCOUNT_INFO[playerid][ac_LEVEL] * 150));

	ACCOUNT_INFO[playerid][ac_REP] = 1;
	ACCOUNT_INFO[playerid][ac_LEVEL] ++;
	//UpdateReputationTextDraws(playerid);
	SetPlayerSkillLevels(playerid);

	ShowPlayerNotification(playerid, sprintf("~r~SUBISTE DE NIVEL~w~~n~Felicidades, has subido al nivel %d.", ACCOUNT_INFO[playerid][ac_LEVEL]), 5);
	SetPlayerScore(playerid, ACCOUNT_INFO[playerid][ac_LEVEL]);

	new str_text[64];
	format(str_text, sizeof(str_text), "LVL~n~~w~%d", ACCOUNT_INFO[playerid][ac_LEVEL]);
	ShowPlayerAlert(playerid, str_text, 0xF7AF30FF, 4);

	ACCOUNT_INFO[playerid][ac_TIME_FOR_REP] = TIME_FOR_REP;
	PLAYER_TEMP[playerid][py_TIME_PASSED_LAST_REP] = gettime() * 1000;


	ACCOUNT_INFO[playerid][ac_TIME_PLAYING] += gettime() - PLAYER_TEMP[playerid][py_TIME_PLAYING];
	PLAYER_TEMP[playerid][py_TIME_PLAYING] = gettime();
	new DB_Query[256];
	format(DB_Query, sizeof DB_Query,

		"\
			UPDATE `CUENTA` SET `TIME-PLAYING` = '%d', `LEVEL` = '%d', `REP` = '%d', `TIME_FOR_REP` = '%d', `PAYDAY_REP` = '%d' WHERE `ID` = '%d';\
		",
			ACCOUNT_INFO[playerid][ac_TIME_PLAYING], ACCOUNT_INFO[playerid][ac_LEVEL], ACCOUNT_INFO[playerid][ac_REP], TIME_FOR_REP, ACCOUNT_INFO[playerid][ac_PAYDAY_REP], ACCOUNT_INFO[playerid][ac_ID]
	);
	db_free_result(db_query(Database, DB_Query));

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][2]);
	PLAYER_TEMP[playerid][py_TIMERS][2] = SetTimerEx("AddPlayerReputation", ACCOUNT_INFO[playerid][ac_TIME_FOR_REP], false, "i", playerid);
	return 1;
}

ShowStore(playerid)
{
	new payload[264];
	format(payload, sizeof(payload), "51.161.31.157:54777/B987Tbt97BTb9SAF9B8Ttasbfdf6/get_credit/%d", ACCOUNT_INFO[playerid][ac_ID]);
	HTTP(playerid, HTTP_GET, payload, "", "StoreMenuRecv");
	return 1;
}

forward StoreMenuRecv(index, response_code, const data[]);
public StoreMenuRecv(index, response_code, const data[])
{
	#if DEBUG_MODE == 1
		printf("StoreMenuRecv %d %d %s", index, response_code, data);
	#endif

	if (IsPlayerConnected(index))
	{
	    if (response_code == 200)
	    {
	    	format(PLAYER_TEMP[index][py_CREDIT], 32, "%s", data);
	    	ShowDialog(index, DIALOG_STORE);
	    }
	    else
	    {
			ShowPlayerMessage(index, "~r~Hubo un error al intentar conectarse a la tienda", 7);
	    }
	}
	return 1;
}

SetPlayerCash(playerid, ammount, bool:update = true)
{
	CHARACTER_INFO[playerid][ch_CASH] = ammount;
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, CHARACTER_INFO[playerid][ch_CASH]);

	if (update)
	{
		new DB_Query[160];
		format(DB_Query, sizeof DB_Query, "UPDATE `PERSONAJE` SET `CASH` = '%d' WHERE `ID_USER` = '%d';", CHARACTER_INFO[playerid][ch_CASH], ACCOUNT_INFO[playerid][ac_ID]);
		db_free_result(db_query(Database, DB_Query));
	}
	return 1;
}

GivePlayerCash(playerid, ammount, bool:update = true, bool:game_text = true)
{
	if (game_text)
	{
		new str_text[128];

		format(str_text, sizeof(str_text), "~w~=%d$", ammount);

		if (ammount >= 0)
			format(str_text, sizeof(str_text), "~g~+%d$", ammount);

		if (ammount < 0)
			format(str_text, sizeof(str_text), "~r~%d$", ammount);
		
		GameTextForPlayer(playerid, str_text, 4000, 1);
	}

	CHARACTER_INFO[playerid][ch_CASH] += ammount;
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, CHARACTER_INFO[playerid][ch_CASH]);

	if (update)
	{
		new DB_Query[160];
		format(DB_Query, sizeof DB_Query, "UPDATE `PERSONAJE` SET `CASH` = '%d' WHERE `ID_USER` = '%d';", CHARACTER_INFO[playerid][ch_CASH], ACCOUNT_INFO[playerid][ac_ID]);
		db_free_result(db_query(Database, DB_Query));
	}
	return 1;
}

=======
>>>>>>> 75def5d (store module)
=======
>>>>>>> 18ddf2c (graffiti module)
=======
>>>>>>> 62f9571 (trash module)
LoadEnterExits()
{
	new total_enterexits, label_str[256], info[3];

	for(new i = 0; i != sizeof ENTER_EXIT; i ++)
	{
		ENTER_EXIT[total_enterexits][ee_ID] = total_enterexits + 1;

		if (ENTER_EXIT[total_enterexits][ee_INT_MAPICON] != -1) ENTER_EXIT[total_enterexits][ee_INT_MAPICON_ID] = CreateDynamicMapIcon(ENTER_EXIT[total_enterexits][ee_INT_X], ENTER_EXIT[total_enterexits][ee_INT_Y], ENTER_EXIT[total_enterexits][ee_INT_Z], ENTER_EXIT[total_enterexits][ee_INT_MAPICON], COLOR_WHITE, ENTER_EXIT[total_enterexits][ee_INT_WORLD], ENTER_EXIT[total_enterexits][ee_INT_INTERIOR]);
		if (ENTER_EXIT[total_enterexits][ee_EXT_MAPICON] != -1) ENTER_EXIT[total_enterexits][ee_EXT_MAPICON_ID] = CreateDynamicMapIcon(ENTER_EXIT[total_enterexits][ee_EXT_X], ENTER_EXIT[total_enterexits][ee_EXT_Y], ENTER_EXIT[total_enterexits][ee_EXT_Z], ENTER_EXIT[total_enterexits][ee_EXT_MAPICON], COLOR_WHITE, ENTER_EXIT[total_enterexits][ee_EXT_WORLD], ENTER_EXIT[total_enterexits][ee_EXT_INTERIOR]);

		format(label_str, sizeof(label_str), "{ffffff}%s", ENTER_EXIT[total_enterexits][ee_NAME]);
		CreateDynamic3DTextLabel(label_str, 0xEAE9E900, ENTER_EXIT[total_enterexits][ee_EXT_X], ENTER_EXIT[total_enterexits][ee_EXT_Y], ENTER_EXIT[total_enterexits][ee_EXT_Z] + 0.25, 5.0, .testlos = true, .worldid = ENTER_EXIT[total_enterexits][ee_EXT_WORLD], .interiorid = ENTER_EXIT[total_enterexits][ee_EXT_INTERIOR]);
		AddKeyArea(ENTER_EXIT[total_enterexits][ee_EXT_X], ENTER_EXIT[total_enterexits][ee_EXT_Y], 0.8, KEY_TYPE_ENTER);
		AddKeyArea(ENTER_EXIT[total_enterexits][ee_INT_X], ENTER_EXIT[total_enterexits][ee_INT_Y], 0.8, KEY_TYPE_ENTER);

		ENTER_EXIT[total_enterexits][ee_INT_PICKUP_ID] = CreateDynamicPickup(19902, 1, ENTER_EXIT[total_enterexits][ee_INT_X], ENTER_EXIT[total_enterexits][ee_INT_Y], ENTER_EXIT[total_enterexits][ee_INT_Z] - 0.7, .worldid = ENTER_EXIT[total_enterexits][ee_INT_WORLD], .interiorid = ENTER_EXIT[total_enterexits][ee_INT_INTERIOR]);
		ENTER_EXIT[total_enterexits][ee_EXT_PICKUP_ID] = CreateDynamicPickup(19902, 1, ENTER_EXIT[total_enterexits][ee_EXT_X], ENTER_EXIT[total_enterexits][ee_EXT_Y], ENTER_EXIT[total_enterexits][ee_EXT_Z] - 0.7, ENTER_EXIT[total_enterexits][ee_EXT_WORLD], ENTER_EXIT[total_enterexits][ee_EXT_INTERIOR]);
		
		info[0] = PICKUP_TYPE_ENTER_EXIT;
		info[1] = total_enterexits; // Index
		info[2] = 1; // Pickup Interior
		Streamer_SetArrayData(STREAMER_TYPE_PICKUP, ENTER_EXIT[total_enterexits][ee_INT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

		info[0] = PICKUP_TYPE_ENTER_EXIT;
		info[1] = total_enterexits; // Index
		info[2] = 2; // Pickup Exterior
		Streamer_SetArrayData(STREAMER_TYPE_PICKUP, ENTER_EXIT[total_enterexits][ee_EXT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);
		CreateInteriorActor(ENTER_EXIT[total_enterexits][ee_INTERIOR_TYPE], ENTER_EXIT[total_enterexits][ee_INT_WORLD], ENTER_EXIT[total_enterexits][ee_INT_INTERIOR]);

		total_enterexits ++;
	}

	printf("[debug] Lugares cargados: %d", total_enterexits);
	return 1;
}

LoadProperties()//cargado propiedes
{
	new DBResult:Result;
	Result = db_query(Database, "SELECT `PROPERTY`.*, `PROPERTY_INFO`.* FROM `PROPERTY`, `PROPERTY_INFO` WHERE `PROPERTY_INFO`.ID_PROPERTY = `PROPERTY`.ID;");

	new total_houses, total_houses_free, city[45], zone[45];
	for(new i = 0; i < db_num_rows(Result); i ++)
	{
		if (total_houses >= MAX_PROPERTIES)
		{
			printf("[debug]  Límite superado en array 'PROPERTY_INFO' al intentar cargar de la base de datos.");
			break;
		}

		PROPERTY_INFO[total_houses][property_VALID] = true;
		PROPERTY_INFO[total_houses][property_ID] = db_get_field_assoc_int(Result, "ID");

		PROPERTY_INFO[total_houses][property_EXT_X] = db_get_field_assoc_float(Result, "EXT_X");
		PROPERTY_INFO[total_houses][property_EXT_Y] = db_get_field_assoc_float(Result, "EXT_Y");
		PROPERTY_INFO[total_houses][property_EXT_Z] = db_get_field_assoc_float(Result, "EXT_Z");
		PROPERTY_INFO[total_houses][property_EXT_ANGLE] = db_get_field_assoc_float(Result, "EXT_ANGLE");
		PROPERTY_INFO[total_houses][property_EXT_INTERIOR] = db_get_field_assoc_int(Result, "EXT_INTERIOR");
		PROPERTY_INFO[total_houses][property_EXT_FREEZE] = db_get_field_assoc_int(Result, "EXT_FREEZE");
		PROPERTY_INFO[total_houses][property_ID_INTERIOR] = db_get_field_assoc_int(Result, "ID_INTERIOR");

		PROPERTY_INFO[total_houses][property_PRICE] = db_get_field_assoc_int(Result, "PRICE");
		PROPERTY_INFO[total_houses][property_PRICE_BASE] = PROPERTY_INFO[total_houses][property_PRICE];
		PROPERTY_INFO[total_houses][property_LEVEL] = db_get_field_assoc_int(Result, "LEVEL");
		PROPERTY_INFO[total_houses][property_EXTRA] = db_get_field_assoc_int(Result, "EXTRA");
		PROPERTY_INFO[total_houses][property_VIP_LEVEL] = db_get_field_assoc_int(Result, "VIP_LEVEL");

		CreatePropertyObjects(
			PROPERTY_INFO[total_houses][property_ID],
			PROPERTY_INTERIORS[ PROPERTY_INFO[total_houses][property_ID_INTERIOR] ][property_INT_INTERIOR],
			PROPERTY_INFO[total_houses][property_ID]
		);

		if (PROPERTY_INFO[total_houses][property_EXTRA]) PROPERTY_INFO[total_houses][property_PRICE] = 0;
		if (PROPERTY_INFO[total_houses][property_VIP_LEVEL]) PROPERTY_INFO[total_houses][property_LEVEL] = 1;

		new DBResult:Result_info_owner, DB_Query[600], owner[24], info[3], label_str[256], pickup_modelid;
		format(DB_Query, sizeof DB_Query, "SELECT `CUENTA`.`NAME`, `PROPERTY_OWNER`.`ID_USER`, `PROPERTY_OWNER`.`PROPERTY_NAME` FROM `CUENTA`, `PROPERTY_OWNER` WHERE `PROPERTY_OWNER`.`ID_PROPERTY` = '%d' AND `CUENTA`.`ID` = `PROPERTY_OWNER`.`ID_USER`;", PROPERTY_INFO[total_houses][property_ID]);
		Result_info_owner = db_query(Database, DB_Query);

		if (db_num_rows(Result_info_owner))
		{
			pickup_modelid = 1272;
			PROPERTY_INFO[total_houses][property_SOLD] = true;
			PROPERTY_INFO[total_houses][property_CREW] = false;
			db_get_field_assoc(Result_info_owner, "NAME", owner, 24);
			PROPERTY_INFO[total_houses][property_OWNER_ID] = db_get_field_assoc_int(Result_info_owner, "ID_USER");
			PROPERTY_INFO[total_houses][property_CREW_ID] = 0;
			db_get_field_assoc(Result_info_owner, "PROPERTY_NAME", PROPERTY_INFO[total_houses][property_NAME], 24);
			GetPointZone(PROPERTY_INFO[total_houses][property_EXT_X], PROPERTY_INFO[total_houses][property_EXT_Y], city, zone);

			format
			(
				label_str,
				sizeof label_str,
				""COL_WHITE"\
					Propiedad en %s (%d)\n\
					Propietario:{35A7FF} %s\n\
				", zone, PROPERTY_INFO[total_houses][property_ID], owner
			);
		}
		else
		{
			new DBResult:Result_info_crew, crew_name[24];
			format(DB_Query, sizeof DB_Query, "SELECT `CREW`.`ID`, `CREW`.`NAME` FROM `PROPERTY_TERRITORY`, `CREW` WHERE `PROPERTY_TERRITORY`.`ID_PROPERTY` = '%d' AND `CREW`.`ID` = (SELECT `CREW_TERRITORIES`.`ID_CREW` FROM `CREW_TERRITORIES` WHERE `CREW_TERRITORIES`.`ID_TERRITORY` = `PROPERTY_TERRITORY`.`ID_TERRITORY`);", PROPERTY_INFO[total_houses][property_ID]);
			Result_info_crew = db_query(Database, DB_Query);

			if (db_num_rows(Result_info_crew))
			{
				pickup_modelid = 1272;
				PROPERTY_INFO[total_houses][property_SOLD] = true;
				PROPERTY_INFO[total_houses][property_CREW] = true;
				db_get_field_assoc(Result_info_crew, "NAME", crew_name, 24);
				PROPERTY_INFO[total_houses][property_CREW_ID] = db_get_field_assoc_int(Result_info_crew, "ID");
				PROPERTY_INFO[total_houses][property_OWNER_ID] = 0;
				GetPointZone(PROPERTY_INFO[total_houses][property_EXT_X], PROPERTY_INFO[total_houses][property_EXT_Y], city, zone);
				format(PROPERTY_INFO[total_houses][property_NAME], 24, "%s (%d)", zone, PROPERTY_INFO[total_houses][property_ID]);

				format
				(
					label_str,
					sizeof label_str,
					""COL_WHITE"\
						Propiedad en %s (%d)\n\
						Banda: %s\n\
					", zone, PROPERTY_INFO[total_houses][property_ID], crew_name
				);
			}
			else
			{
				pickup_modelid = 1273;
				PROPERTY_INFO[total_houses][property_SOLD] = false;
				PROPERTY_INFO[total_houses][property_OWNER_ID] = 0;
				GetPointZone(PROPERTY_INFO[total_houses][property_EXT_X], PROPERTY_INFO[total_houses][property_EXT_Y], city, zone);
				format(PROPERTY_INFO[total_houses][property_NAME], 24, "%s (%d)", zone, PROPERTY_INFO[total_houses][property_ID]);

				format(label_str, sizeof label_str, ""COL_WHITE"Propiedad en %s (%d)\n"COL_GREEN"En venta", zone, PROPERTY_INFO[total_houses][property_ID]);
				total_houses_free ++;
			}
			db_free_result(Result_info_crew);
		}
		db_free_result(Result_info_owner);


		PROPERTY_INFO[total_houses][property_EXT_LABEL_ID] = CreateDynamic3DTextLabel(label_str, 0xF7F7F700, PROPERTY_INFO[total_houses][property_EXT_X], PROPERTY_INFO[total_houses][property_EXT_Y], PROPERTY_INFO[total_houses][property_EXT_Z] + 0.25, 5.0, .testlos = true, .worldid = 0, .interiorid = PROPERTY_INFO[total_houses][property_EXT_INTERIOR]);
		PROPERTY_INFO[total_houses][property_EXT_PICKUP_ID] = CreateDynamicPickup(pickup_modelid, 1, PROPERTY_INFO[total_houses][property_EXT_X], PROPERTY_INFO[total_houses][property_EXT_Y], PROPERTY_INFO[total_houses][property_EXT_Z], 0, PROPERTY_INFO[total_houses][property_EXT_INTERIOR]);
		PROPERTY_INFO[total_houses][property_INT_PICKUP_ID] = CreateDynamicPickup(19902, 1, PROPERTY_INTERIORS[ PROPERTY_INFO[total_houses][property_ID_INTERIOR] ][property_INT_X], PROPERTY_INTERIORS[ PROPERTY_INFO[total_houses][property_ID_INTERIOR] ][property_INT_Y], PROPERTY_INTERIORS[ PROPERTY_INFO[total_houses][property_ID_INTERIOR] ][property_INT_Z], PROPERTY_INFO[total_houses][property_ID], PROPERTY_INTERIORS[ PROPERTY_INFO[total_houses][property_ID_INTERIOR] ][property_INT_INTERIOR]);

		AddKeyArea(PROPERTY_INFO[total_houses][property_EXT_X], PROPERTY_INFO[total_houses][property_EXT_Y], 0.8, KEY_TYPE_ENTER);
		AddKeyArea(PROPERTY_INTERIORS[ PROPERTY_INFO[total_houses][property_ID_INTERIOR] ][property_INT_X], PROPERTY_INTERIORS[ PROPERTY_INFO[total_houses][property_ID_INTERIOR] ][property_INT_Y], 0.8, KEY_TYPE_ENTER);

		info[0] = PICKUP_TYPE_PROPERTY;
		info[1] = total_houses; // Index
		info[2] = 1; // Pickup Interior
		Streamer_SetArrayData(STREAMER_TYPE_PICKUP, PROPERTY_INFO[total_houses][property_INT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

		info[0] = PICKUP_TYPE_PROPERTY;
		info[1] = total_houses; // Index
		info[2] = 2; // Pickup Exterior
		Streamer_SetArrayData(STREAMER_TYPE_PICKUP, PROPERTY_INFO[total_houses][property_EXT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

		TOTAL_PROPERTIES_LOADED ++;
		total_houses ++;
		db_next_row(Result);
	}
	db_free_result(Result);

    printf("[debug] Propiedades libres: %d.", total_houses_free);
	printf("[debug] Propiedades totales: %d.", total_houses);
	return 1;
}

LoadCrews()
{
	new DBResult:Result, DB_Query[140];
	Result = db_query(Database, "SELECT * FROM `CREW`;");

	new total_crews;
	for(new i = 0; i < db_num_rows(Result); i ++)
	{
		if (total_crews >= MAX_CREWS)
		{
			printf("[debug]  Límite superado en array 'CREW_INFO' al intentar cargar de la base de datos.");
			break;
		}

		CREW_INFO[total_crews][crew_VALID] = true;
		CREW_INFO[total_crews][crew_ID] = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "NAME", CREW_INFO[total_crews][crew_NAME], 32);
		strreplace(CREW_INFO[total_crews][crew_NAME], "~", "");

		db_get_field_assoc(Result, "DESC", CREW_INFO[total_crews][crew_DESCRIPTION], 32);
		CREW_INFO[total_crews][crew_COLOR] = db_get_field_assoc_int(Result, "COLOR");
		CREW_INFO[total_crews][crew_GRAFFITIS_COUNT] = db_get_field_assoc_int(Result, "GRAFFITIS_COUNT");
		CREW_INFO[total_crews][crew_MARKET_COUNT] = db_get_field_assoc_int(Result, "MARKETS_COUNT");
		CREW_INFO[total_crews][crew_ONLINE_MEMBERS] = 0;

		if (CREW_INFO[total_crews][crew_GRAFFITIS_COUNT] < 0)
		{
			CREW_INFO[total_crews][crew_GRAFFITIS_COUNT] = 0;
		}

		if (CREW_INFO[total_crews][crew_GRAFFITIS_COUNT] > 54)
		{
			CREW_INFO[total_crews][crew_GRAFFITIS_COUNT] = 0;
		}

		if (CREW_INFO[total_crews][crew_MARKET_COUNT] < 0)
		{
			CREW_INFO[total_crews][crew_MARKET_COUNT] = 0;
		}

		if (CREW_INFO[total_crews][crew_MARKET_COUNT] > 3)
		{
			CREW_INFO[total_crews][crew_MARKET_COUNT] = 0;
		}

		RecalculeCrewGraffitis(total_crews);
		RecalculeCrewMarkets(total_crews);

		new DBResult:Result_members;
		format(DB_Query, sizeof DB_Query, "SELECT COUNT() FROM `PLAYER_CREW` WHERE `ID_CREW` = '%d';", CREW_INFO[total_crews][crew_ID]);
		Result_members = db_query(Database, DB_Query);

		if (db_num_rows(Result_members)) CREW_INFO[total_crews][crew_MEMBERS] = db_get_field_int(Result_members, 0);
		db_free_result(Result_members);


		new DBResult:Result_ranks;
		format(DB_Query, sizeof DB_Query, "SELECT * FROM `CREW_RANKS` WHERE `ID_CREW` = '%d' LIMIT %d;", CREW_INFO[total_crews][crew_ID], MAX_CREW_RANKS);
		Result_ranks = db_query(Database, DB_Query);
		for(new x = 0; x < db_num_rows(Result_ranks); x ++)
		{
			new pos = db_get_field_assoc_int(Result_ranks, "RANK_POS");
			if (pos < 0 || pos > MAX_CREW_RANKS) continue;

			CREW_RANK_INFO[total_crews][pos][crew_rank_VALID] = true;
			CREW_RANK_INFO[total_crews][pos][crew_rank_ID] = db_get_field_assoc_int(Result_ranks, "ID");
			db_get_field_assoc(Result_ranks, "RANK_NAME", CREW_RANK_INFO[total_crews][pos][crew_rank_NAME], 32);

			new DBResult:Result_ranks_permissions;
			format(DB_Query, sizeof DB_Query, "SELECT * FROM `RANK_PERMISSIONS` WHERE `ID_RANK` = '%d' LIMIT %d;", CREW_RANK_INFO[total_crews][pos][crew_rank_ID], CREW_RANK_SIZE);
			Result_ranks_permissions = db_query(Database, DB_Query);
			for(new z = 0; z < db_num_rows(Result_ranks_permissions); z ++)
			{
				new permission = db_get_field_assoc_int(Result_ranks_permissions, "PERMISSION");
				if (permission < 0 || permission > CREW_RANK_SIZE) continue;

				CREW_RANK_INFO[total_crews][pos][crew_rank_PERMISSION][permission] = db_get_field_assoc_int(Result_ranks_permissions, "SET");
				db_next_row(Result_ranks_permissions);
			}
			db_free_result(Result_ranks_permissions);
			db_next_row(Result_ranks);
		}
		db_free_result(Result_ranks);

		total_crews ++;
		db_next_row(Result);
	}

	printf("[debug] Bandas cargadas: %d", total_crews);
	db_free_result(Result);
	return 1;
}

LoadGangZones()
{
	new DBResult:Result, DB_Query[320];
	format(DB_Query, sizeof DB_Query, "SELECT * FROM `SA_ZONES` WHERE `GANG_ZONE` = '1' LIMIT %d;", MAX_TERRITORIES);
	Result = db_query(Database, DB_Query);

	new total_territories;
	for(new i = 0; i < db_num_rows(Result); i ++)
	{
		if (total_territories >= MAX_TERRITORIES)
		{
			printf("[debug]  Límite superado en array 'TERRITORIES' al intentar cargar de la base de datos.");
			break;
		}

		TERRITORIES[total_territories][territory_VALID] = true;
		TERRITORIES[total_territories][territory_ID] = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "NAME", TERRITORIES[total_territories][territory_NAME], 32);
		TERRITORIES[total_territories][territory_MIN_X] = db_get_field_assoc_float(Result, "MIN_X");
		TERRITORIES[total_territories][territory_MIN_Y] = db_get_field_assoc_float(Result, "MIN_Y");
		TERRITORIES[total_territories][territory_MIN_Z] = db_get_field_assoc_float(Result, "MIN_Z");
		TERRITORIES[total_territories][territory_MAX_X] = db_get_field_assoc_float(Result, "MAX_X");
		TERRITORIES[total_territories][territory_MAX_Y] = db_get_field_assoc_float(Result, "MAX_Y");
		TERRITORIES[total_territories][territory_MAX_Z] = db_get_field_assoc_float(Result, "MAX_Z");
		TERRITORIES[total_territories][territory_WAR] = false;
		TERRITORIES[total_territories][territory_ATTACKER_CREW_INDEX] = 0;

		new DBResult:Result_territory_crew;
		format(DB_Query, sizeof DB_Query, "SELECT `CREW_TERRITORIES`.`ID_CREW`, `CREW`.`COLOR` FROM `CREW_TERRITORIES`, `CREW` WHERE `ID_TERRITORY` = '%d' AND `CREW`.`ID` = `CREW_TERRITORIES`.`ID_CREW`;", TERRITORIES[total_territories][territory_ID]);
		Result_territory_crew = db_query(Database, DB_Query);
		if (db_num_rows(Result_territory_crew))
		{
			TERRITORIES[total_territories][territory_OCCUPIED] = true;
			TERRITORIES[total_territories][territory_CREW_ID] = db_get_field_assoc_int(Result_territory_crew, "ID_CREW");
			new gang_color = db_get_field_assoc_int(Result_territory_crew, "COLOR");

			new r, g, b, a;
			hy_HexToRGBA(gang_color, r, g, b, a);
			TERRITORIES[total_territories][territory_COLOR] = hy_RGBAToHex(r, g, b, 135);

			for(new x = 0; x != MAX_CREWS; x ++)
			{
				if (!CREW_INFO[x][crew_VALID]) continue;

				if (CREW_INFO[x][crew_ID] == TERRITORIES[total_territories][territory_CREW_ID])
				{
					TERRITORIES[total_territories][territory_CREW_INDEX] = x;
					break;
				}
			}
		}
		else
		{
			TERRITORIES[total_territories][territory_OCCUPIED] = false;
			TERRITORIES[total_territories][territory_CREW_ID] = 0;
			TERRITORIES[total_territories][territory_CREW_INDEX] = 0;
			TERRITORIES[total_territories][territory_COLOR] = 0xCCCCCC55;
		}
		db_free_result(Result_territory_crew);


		TERRITORIES[total_territories][territory_AREA] =  CreateDynamicCube
															(
																TERRITORIES[total_territories][territory_MIN_X],
																TERRITORIES[total_territories][territory_MIN_Y],
																TERRITORIES[total_territories][territory_MIN_Z],
																TERRITORIES[total_territories][territory_MAX_X],
																TERRITORIES[total_territories][territory_MAX_Y],
																TERRITORIES[total_territories][territory_MAX_Z],
																0, 0
															);

		new info[2];
		info[0] = AREA_TYPE_GANGZONE;
		info[1] = total_territories;
		Streamer_SetArrayData(STREAMER_TYPE_AREA, TERRITORIES[total_territories][territory_AREA], E_STREAMER_EXTRA_ID, info);


		TERRITORIES[total_territories][territory_GANG_ZONE] =  GangZoneCreate
																(
																	TERRITORIES[total_territories][territory_MIN_X],
																	TERRITORIES[total_territories][territory_MIN_Y],
																	TERRITORIES[total_territories][territory_MAX_X],
																	TERRITORIES[total_territories][territory_MAX_Y]
																);

		TERRITORIES[total_territories][territory_TEXTDRAW] = TextDrawCreate(320.000000, 406.000000, "Progreso de conquista:_0");
		TextDrawLetterSize(TERRITORIES[total_territories][territory_TEXTDRAW], 0.286000, 1.276444);
		TextDrawAlignment(TERRITORIES[total_territories][territory_TEXTDRAW], 2);
		TextDrawColor(TERRITORIES[total_territories][territory_TEXTDRAW], -76);
		TextDrawSetShadow(TERRITORIES[total_territories][territory_TEXTDRAW], 0);
		TextDrawSetOutline(TERRITORIES[total_territories][territory_TEXTDRAW], 0);
		TextDrawBackgroundColor(TERRITORIES[total_territories][territory_TEXTDRAW], 255);
		TextDrawFont(TERRITORIES[total_territories][territory_TEXTDRAW], 1);
		TextDrawSetProportional(TERRITORIES[total_territories][territory_TEXTDRAW], 1);
		TextDrawSetShadow(TERRITORIES[total_territories][territory_TEXTDRAW], 0);

		total_territories ++;
		db_next_row(Result);
	}

	printf("[debug] Territorios totales: %d", total_territories);
	db_free_result(Result);
	return 1;
}

CheckBoxClub(playerid)
{
	if (IsPlayerInRangeOfPoint(playerid, 1.5, -11.283934, 88.862136, 1101.522705)) return ShowDialog(playerid, DIALOG_BOX_CLUB);
	return 1;
}

SendBoxMessage(const message[], time)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (IsPlayerInRangeOfPoint(i, 30.0, -17.344648, 99.261329, 1100.822021))
			{
				ShowPlayerNotification(i, message, time);
			}
		}
	}
	return 1;
}

forward RespawnDynamicActor(actorid, type);
public RespawnDynamicActor(actorid, type)
{
	ClearDynamicActorAnimations(actorid);

	switch(type)
	{
		case ACTOR_TYPE_DEALER:
		{
			SetDynamicActorInvulnerable(actorid, false);
			SetDynamicActorHealth(actorid, 50.0);
			ApplyDynamicActorAnimation(actorid, "DEALER", "DEALER_IDLE", 4.0, 1, 1, 1, 0, 0);
			return 1;
		}
		case ACTOR_TYPE_SHOP:
		{
			SetDynamicActorInvulnerable(actorid, false);
			SetDynamicActorHealth(actorid, 50.0);
			return 1;
		}
	}

	SetDynamicActorInvulnerable(actorid, true);
	SetDynamicActorHealth(actorid, 100.0);
	return 1;
}

CheckRobActor(playerid)
{
	if (GetPlayerInterior(playerid) > 0 && PLAYER_TEMP[playerid][py_INTERIOR_INDEX] > 0)
	{
		if (ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE] != INTERIOR_CLUB)
		{
			new ActorTarget = GetPlayerCameraTargetActor(playerid);
			new maxprogress = minrand(5, 20);
			if (ActorTarget != INVALID_ACTOR_ID)
			{
				new keys, updown, leftright;
				new randompay = minrand(30, 300);

				GetPlayerKeys(playerid, keys, updown, leftright);

				if (!PLAYER_WORKS[playerid][WORK_POLICE])
				{
					if (IsPlayerInRangeOfPoint(playerid, 50.0, -198.002197, -1762.759643, 675.768737)) return 0;
					if (!a_TMP[ActorTarget][a_IN_ROB] && GetPlayerWeapon(playerid) >= 22 && GetPlayerWeapon(playerid) <= 33 && keys & KEY_HANDBRAKE)
					{
						new Float:health;
						GetDynamicActorHealth(ActorTarget, health);
						if (health > 0.0)
						{
							if ((gettime() - a_TMP[ActorTarget][a_LAST_ROB]) < 60 * 5) return ShowPlayerMessage(playerid, "~r~Este negocio ya fue robado recientemente", 3);
							{
								if ((gettime() - a_TMP[ActorTarget][a_IN_ROB_PROGRESS]) < 2) return 0;
								
								new str_text[128];
								if (PLAYER_TEMP[playerid][py_ROB_PROGRESS] > maxprogress)
								{
									SetActorChatBubble(ActorTarget, "{E6E6E6}¡Ya le he dado todo!", 0xE6E6E600, 5.0, 3000);
									SetActorRespawnTime(ActorTarget, 15000);
									ApplyActorAnimation(ActorTarget, "ped", "handsup", 4.1, 0, 0, 0, 1, 0);
									ShowPlayerNotification(playerid, "La policía viene en camino, es mejor que corras.", 3);
									PLAYER_TEMP[playerid][py_ROB_PROGRESS] = 0;
									a_TMP[ActorTarget][a_LAST_ROB] = gettime() + 5; // Fix delay
									a_TMP[ActorTarget][a_IN_ROB_PROGRESS] = gettime() + 5;
									PLAYER_TEMP[playerid][py_INITIAL_ROB] = false;
									return 1;
								}

								if (PLAYER_TEMP[playerid][py_INITIAL_ROB] == false)
								{
									PLAYER_TEMP[playerid][py_INITIAL_ROB] = true;
									ShowPlayerNotification(playerid, "Apuntale al vendedor hasta que te de todo el dinero de la caja.", 4);
									SetActorChatBubble(ActorTarget, "{E6E6E6}¡No me lastime por favor!\n¡Le daré el dinero!", 0xE6E6E600, 5.0, 3000);
									ApplyActorAnimation(ActorTarget, "ped", "handsup", 4.1, 0, 0, 0, 1, 0);
									SetPlayerPoliceSearchLevel(playerid, 1);

									new
										city[45],
										zone[45],
										message[144]
									;

								    GetPointZone(ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_EXT_X], ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_EXT_Y], city, zone);
								    format(message, sizeof message, "~r~%s~w~ esta robando un negocio (%s).", PLAYER_TEMP[playerid][py_RP_NAME], zone);
								    format(PLAYER_TEMP[playerid][py_POLICE_REASON], 32, "Robo");
								    ShowPlayerMessage(playerid, "~b~Has cometido un crimen: Robo", 5);
								    SendPoliceNotification(message, 6);

									a_TMP[ActorTarget][a_IN_ROB_PROGRESS] = gettime();
									return 0;
								}
									
								GivePlayerCash(playerid, randompay);
								PLAYER_TEMP[playerid][py_ROB_PROGRESS] ++;

								ApplyActorAnimation(ActorTarget, "INT_SHOP", "shop_cashier", 4.1, 1, 0, 0, 1, 0);
								a_TMP[ActorTarget][a_IN_ROB] = true;

								format(str_text, sizeof(str_text), "{E6E6E6}* Le da a %s {85DA74}%d$", PLAYER_TEMP[playerid][py_NAME], randompay);
								SetActorChatBubble(ActorTarget, str_text, 0xE6E6E600, 5.0, 3000);


								a_TMP[ActorTarget][a_IN_ROB] = false;
								a_TMP[ActorTarget][a_IN_ROB_PROGRESS] = gettime();
							}
						}
					}
				}
			}
		}
	}
	return 1;
}

CreateInteriorActor(interior_type, world, interior)
{
	if (interior_type == INTERIOR_NO_INFO) return 0;

	new skin, Float:x, Float:y, Float:z, Float:angle;

	switch(interior_type)
	{
		case INTERIOR_BINCO:
		{
			skin      = 119;
			x    = 208.376373;
			y    = -98.703956;
			z    = 1005.257812;
			angle    = 180.0;
		}
		case INTERIOR_SUBURBAN:
		{
			skin      = 191;
			x    = 203.826187;
			y    = -41.667518;
			z    = 1001.804687;
			angle    = 180.0;
		}
		case INTERIOR_PROLAPS:
		{
			skin      = 190;
			x    = 207.139907;
			y    = -127.805473;
			z    = 1003.507812;
			angle    = 180.0;
		}
		case INTERIOR_DIDIER_SACHS:
		{
			skin      = 169;
			x    = 204.275909;
			y    = -157.829010;
			z    = 1000.523437;
			angle    = 180.0;
		}
		case INTERIOR_VICTIM:
		{
			skin      = 217;
			x    = 204.853225;
			y    = -8.764448;
			z    = 1001.210937;
			angle    = 270.0;
		}
		case INTERIOR_ZIP:
		{
			skin      = 211;
			x    = 162.226135;
			y    = -81.191978;
			z    = 1001.804687;
			angle    = 180.0;
		}
		case INTERIOR_247:
		{
			skin      = 184;
			x    = -27.483411;
			y    = -91.628837;
			z    = 1003.546875;
			angle    = 0.0;
		}
		case INTERIOR_PIZZA:
		{
			skin      = 155;
			x    = 375.114501;
			y    = -117.272621;
			z    = 1001.492187;
			angle    = 180.0;
		}
		case INTERIOR_CLUCKIN_BELL:
		{
			skin      = 167;
			x    = 368.652679;
			y    = -4.492218;
			z    = 1001.851562;
			angle    = 180.0;
		}
		case INTERIOR_BURGER_SHOT:
		{
			skin      = 205;
			x    = 376.114227;
			y    = -65.848991;
			z    = 1001.507812;
			angle    = 180.0;
		}
		case INTERIOR_BANK_LS:
		{
			skin      = 59;
			x    = 1407.526489;
			y    = 1321.833496;
			z    = 1501.091918;
			angle    = 180.0;
		}
		case INTERIOR_BANK_SF:
		{
			skin      = 59;
			x    = 1104.802001;
			y    = 1531.275634;
			z    = 1452.475097;
			angle    = 180.0;
		}
		case INTERIOR_BANK_LV:
		{
			skin      = 59;
			x    = 2692.497558;
			y    = -610.933593;
			z    = -71.658203;
			angle    = 90.0;
		}
		case INTERIOR_CITY_HALL_LS:
		{
			skin      = 186;
			x    = -474.572387;
			y    = 287.982879;
			z    = 2004.584960;
			angle    = 0.0;
		}
		case INTERIOR_UNITY_STATION:
		{
			skin      = 184;
			x    = 1489.038818;
			y    = 1305.631591;
			z    = 1093.296386;
			angle    = 270.0;
		}
		case INTERIOR_TRUCK:
		{
			skin      = 127;
			x    = 1297.120117;
			y    = -66.351226;
			z    = 1002.497375;
			angle    = 0.0;
		}
	}

	new actor = CreateDynamicActor(skin, x, y, z, angle, false, 50.0, world, interior);
	Streamer_SetIntData(STREAMER_TYPE_ACTOR, actor, E_STREAMER_EXTRA_ID, ACTOR_TYPE_SHOP);
	return 1;
}

GetFastFoodLocalIndexByIntType(interior_type)
{
	for(new i = 0; i != sizeof Fast_Food_Positions; i ++)
	{
		if (Fast_Food_Positions[i][fast_food_INTERIOR_TYPE] == interior_type) return i;
	}
	return -1;
}

GetClothingShopIndexByIntType(interior_type)
{
	for(new i = 0; i != sizeof Clothing_Shop_Positions; i ++)
	{
		if (Clothing_Shop_Positions[i][clothing_shop_INTERIOR_TYPE] == interior_type) return i;
	}
	return -1;
}

UpdatePlayerPropertyContructor(playerid)
{
	SetPlayerPosEx
	(
		playerid,
		PROPERTY_INTERIORS[ PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO] ][property_INT_X],
		PROPERTY_INTERIORS[ PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO] ][property_INT_Y],
		PROPERTY_INTERIORS[ PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO] ][property_INT_Z],
		PROPERTY_INTERIORS[ PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO] ][property_INT_ANGLE],
		PROPERTY_INTERIORS[ PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO] ][property_INT_INTERIOR],
		0, false, true
	);

	new td_str[45]; format(td_str, sizeof td_str, "Interior:_%d/%d", PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO], sizeof PROPERTY_INTERIORS - 1);
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_PROPERTY_CONSTRUCTOR][1], td_str);
	SelectTextDrawEx(playerid, 0xe8d08fFF);
	return 1;
}

ExitPlayerPropertyConstructor(playerid)
{
	CancelSelectTextDrawEx(playerid);
	PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_ENABLED] = false;

	SetPlayerPosEx
	(
		playerid,
		PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_X],
		PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_Y],
		PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_Z],
		PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_ANG],
		PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_INT],
		0, false, true
	);

	for(new i = 0; i != 6; i ++) PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROPERTY_CONSTRUCTOR][i]);
	return 1;
}

Create_PlayerPropertyConstructo(playerid)
{
	new slot = GetEmptyPropertySlot();
	if (slot == -1)
	{
	    ShowPlayerMessage(playerid, "~r~No hay mas slots.", 2);
		ExitPlayerPropertyConstructor(playerid);
		return 1;
	}

	PROPERTY_INFO[slot][property_VALID] = true;
	PROPERTY_INFO[slot][property_EXT_X] = PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_X];
	PROPERTY_INFO[slot][property_EXT_Y] = PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_Y];
	PROPERTY_INFO[slot][property_EXT_Z] = PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_Z];
	PROPERTY_INFO[slot][property_EXT_ANGLE] = PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_ANG];
	PROPERTY_INFO[slot][property_EXT_INTERIOR] = PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_INT];
	PROPERTY_INFO[slot][property_EXT_FREEZE] = false;
	PROPERTY_INFO[slot][property_ID_INTERIOR] = PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO];

	PROPERTY_INFO[slot][property_SOLD] = false;
	PROPERTY_INFO[slot][property_OWNER_ID] = 0;
	PROPERTY_INFO[slot][property_PRICE] = PLAYER_TEMP[playerid][py_PROPERTY_CINFO][1];
	PROPERTY_INFO[slot][property_LEVEL] = PLAYER_TEMP[playerid][py_PROPERTY_CINFO][0];
	PROPERTY_INFO[slot][property_EXTRA] = PLAYER_TEMP[playerid][py_PROPERTY_CINFO][3];
	PROPERTY_INFO[slot][property_VIP_LEVEL] = PLAYER_TEMP[playerid][py_PROPERTY_CINFO][2];
	PROPERTY_INFO[slot][property_PRICE_BASE] = floatround(floatdiv(PROPERTY_INFO[slot][property_PRICE], MULTIPLIER_PROPERITES));

	if (PROPERTY_INFO[slot][property_EXTRA]) PROPERTY_INFO[slot][property_PRICE] = 0;
	if (PROPERTY_INFO[slot][property_VIP_LEVEL]) PROPERTY_INFO[slot][property_LEVEL] = 1;

	new DBResult:Result, DB_Query[600];
	format
	(
		DB_Query, sizeof DB_Query,
		"\
			INSERT INTO `PROPERTY`\
			(\
				`EXT_X`, `EXT_Y`, `EXT_Z`, `EXT_ANGLE`, `EXT_INTERIOR`, `EXT_FREEZE`, `ID_INTERIOR`\
			)\
			VALUES\
			(\
				'%f', '%f', '%f', '%f', '%d', '%d', '%d'\
			);\
			SELECT MAX(`ID`) FROM `PROPERTY`;\
		",
		PROPERTY_INFO[slot][property_EXT_X], PROPERTY_INFO[slot][property_EXT_Y], PROPERTY_INFO[slot][property_EXT_Z], PROPERTY_INFO[slot][property_EXT_ANGLE], PROPERTY_INFO[slot][property_EXT_INTERIOR], PROPERTY_INFO[slot][property_EXT_FREEZE],
		PROPERTY_INFO[slot][property_ID_INTERIOR]
	);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result)) PROPERTY_INFO[slot][property_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);

	DB_Query[0] = EOS;
	format
	(
		DB_Query, sizeof DB_Query,
		"\
			INSERT INTO `PROPERTY_INFO`\
			(\
				`ID_PROPERTY`, `PRICE`, `LEVEL`, `EXTRA`, `VIP_LEVEL`\
			)\
			VALUES\
			(\
				'%d', '%d', '%d', '%d', '%d'\
			);\
		",
		PROPERTY_INFO[slot][property_ID], PROPERTY_INFO[slot][property_PRICE_BASE], PROPERTY_INFO[slot][property_LEVEL], PROPERTY_INFO[slot][property_EXTRA], PROPERTY_INFO[slot][property_VIP_LEVEL]
	);
	db_free_result(db_query(Database, DB_Query));

	new label_str[256], city[45], zone[45];
	GetPointZone(PROPERTY_INFO[slot][property_EXT_X], PROPERTY_INFO[slot][property_EXT_Y], city, zone);
	format(PROPERTY_INFO[slot][property_NAME], 24, "%s (%d)", zone, PROPERTY_INFO[slot][property_ID]);

	if (PROPERTY_INFO[slot][property_VIP_LEVEL])
	{
		if (PROPERTY_INFO[slot][property_EXTRA])
		{
			format
			(
				label_str,
				sizeof label_str,
				"\
					{F4DC42}Se requiere VIP (%d)\n\
					\n\
					"COL_WHITE"Propiedad {5DE141}#%d "COL_WHITE"está en venta\n\n\
					Interior: {5DE141}%d\n\
					"COL_WHITE"Coste: {5DE141}%d "SERVER_COIN"\n\
					"COL_WHITE"Nivel necesario: {5DE141}%d\n\
					"COL_WHITE"Usa {5DE141}/ayuda "COL_WHITE"para ver como adquirirla.\
				", PROPERTY_INFO[slot][property_VIP_LEVEL], PROPERTY_INFO[slot][property_ID], PROPERTY_INFO[slot][property_ID_INTERIOR], PROPERTY_INFO[slot][property_EXTRA], PROPERTY_INFO[slot][property_LEVEL]
			);
		}
		else
		{
			format
			(
				label_str,
				sizeof label_str,
				"\
					{F4DC42}Se requiere VIP (%d)\n\
					\n\
					"COL_WHITE"Propiedad {5DE141}#%d "COL_WHITE"está en venta\n\n\
					Interior: {5DE141}%d\n\
					"COL_WHITE"Precio: {5DE141}%s$\n\
					"COL_WHITE"Nivel: {5DE141}%d\n\
					"COL_WHITE"Usa {5DE141}/ayuda "COL_WHITE"para ver como adquirirla.\
				", PROPERTY_INFO[slot][property_VIP_LEVEL], PROPERTY_INFO[slot][property_ID], PROPERTY_INFO[slot][property_ID_INTERIOR], number_format_thousand(PROPERTY_INFO[slot][property_PRICE]), PROPERTY_INFO[slot][property_LEVEL]
			);
		}
	}
	else
	{
		if (PROPERTY_INFO[slot][property_EXTRA])
		{
			format
			(
				label_str,
				sizeof label_str,
				"\
					"COL_WHITE"Propiedad {5DE141}#%d "COL_WHITE"está en venta\n\n\
					Interior: {5DE141}%d\n\
					"COL_WHITE"Coste: {5DE141}%d "SERVER_COIN"\n\
					"COL_WHITE"Nivel necesario: {5DE141}%d\n\
					"COL_WHITE"Usa {5DE141}/ayuda "COL_WHITE"para ver como adquirirla.\
				", PROPERTY_INFO[slot][property_ID], PROPERTY_INFO[slot][property_ID_INTERIOR], PROPERTY_INFO[slot][property_EXTRA], PROPERTY_INFO[slot][property_LEVEL]
			);
		}
		else
		{
			format
			(
				label_str,
				sizeof label_str,
				"\
					"COL_WHITE"Propiedad {5DE141}#%d "COL_WHITE"está en venta\n\n\
					Interior: {5DE141}%d\n\
					"COL_WHITE"Precio: {5DE141}%s$\n\
					"COL_WHITE"Nivel necesario: {5DE141}%d\n\
					"COL_WHITE"Usa {5DE141}/ayuda "COL_WHITE"para ver como adquirirla.\
				", PROPERTY_INFO[slot][property_ID], PROPERTY_INFO[slot][property_ID_INTERIOR], number_format_thousand(PROPERTY_INFO[slot][property_PRICE]), PROPERTY_INFO[slot][property_LEVEL]
			);
		}
	}

	PROPERTY_INFO[slot][property_EXT_LABEL_ID] = CreateDynamic3DTextLabel(label_str, 0xF7F7F700, PROPERTY_INFO[slot][property_EXT_X], PROPERTY_INFO[slot][property_EXT_Y], PROPERTY_INFO[slot][property_EXT_Z] + 0.25, 5.0, .testlos = true, .worldid = 0, .interiorid = PROPERTY_INFO[slot][property_EXT_INTERIOR]);
	PROPERTY_INFO[slot][property_EXT_PICKUP_ID] = CreateDynamicPickup(1273, 1, PROPERTY_INFO[slot][property_EXT_X], PROPERTY_INFO[slot][property_EXT_Y], PROPERTY_INFO[slot][property_EXT_Z], 0, PROPERTY_INFO[slot][property_EXT_INTERIOR]);
	PROPERTY_INFO[slot][property_INT_PICKUP_ID] = CreateDynamicPickup(19902, 1, PROPERTY_INTERIORS[ PROPERTY_INFO[slot][property_ID_INTERIOR] ][property_INT_X], PROPERTY_INTERIORS[ PROPERTY_INFO[slot][property_ID_INTERIOR] ][property_INT_Y], PROPERTY_INTERIORS[ PROPERTY_INFO[slot][property_ID_INTERIOR] ][property_INT_Z], PROPERTY_INFO[slot][property_ID], PROPERTY_INTERIORS[ PROPERTY_INFO[slot][property_ID_INTERIOR] ][property_INT_INTERIOR]);

	new info[3];
	info[0] = PICKUP_TYPE_PROPERTY;
	info[1] = slot; // Index
	info[2] = 1; // Pickup Interior
	Streamer_SetArrayData(STREAMER_TYPE_PICKUP, PROPERTY_INFO[slot][property_INT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

	info[0] = PICKUP_TYPE_PROPERTY;
	info[1] = slot; // Index
	info[2] = 2; // Pickup Exterior
	Streamer_SetArrayData(STREAMER_TYPE_PICKUP, PROPERTY_INFO[slot][property_EXT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

	TOTAL_PROPERTIES_LOADED ++;

	SendClientMessageEx(playerid, COLOR_WHITE, "PROPIEDAD %d AÑADIDA.", PROPERTY_INFO[slot][property_ID]);
	SendClientMessageEx(playerid, COLOR_WHITE, "PROPIEDADES: %d/%d", TOTAL_PROPERTIES_LOADED, MAX_PROPERTIES);
	ExitPlayerPropertyConstructor(playerid);
	return 1;
}

GetEmptyPropertySlot()
{
	for(new i = 0; i != MAX_PROPERTIES; i ++)
	{
		if (!PROPERTY_INFO[i][property_VALID]) return i;
	}
	return -1;
}

Set_HARVEST_Checkpoint(playerid)
{
	if (IsValidDynamicRaceCP(PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT]))
	{
		DestroyDynamicRaceCP(PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT]);
		PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT] = INVALID_STREAMER_ID;
	}

	if (PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] == sizeof(HARVEST_CHECKPOINTS) - 1)
	{
		PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT] =    CreateDynamicRaceCP
														(
															1,
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] ][0],
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] ][1],
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] ][2],
															0.0,
															0.0,
															0.0,
															5.0,
															0,
															0,
															playerid
														);
	}
	else
	{
		PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT] =    CreateDynamicRaceCP
														(
															0,
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] ][0],
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] ][1],
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] ][2],
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] + 1 ][0],
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] + 1 ][1],
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] + 1 ][2],
															5.0,
															0,
															0,
															playerid
														);
	}

	new info[1];
	info[0] = CHECKPOINT_TYPE_HARVEST;
	Streamer_SetArrayData(STREAMER_TYPE_RACE_CP, PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT], E_STREAMER_EXTRA_ID, info);

	return 1;
}

// jobs
StartPlayerJob(playerid, work, vehicleid = INVALID_VEHICLE_ID)
{
	switch(work)
	{
		case WORK_TRUCK:
		{
			if (TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADED])
			{
				if (TRUCK_VEHICLE[vehicleid][truck_vehicle_DELIVERED]) ShowPlayerMessage(playerid, "Vuelve a la ~y~estación", 7);
				else ShowPlayerMessage(playerid, "Ve a entregar la mercancía", 7);

				new Float:val = 70.0;
				if (val + GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] > GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS]) val = GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS];
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] = val;

				SetPlayerTruckCheckpoint(playerid, vehicleid);
			}
			else ShowPlayerMessage(playerid, "Ve a los ~b~puntos de carga", 7);

			DisableRemoteVehicleCollisions(playerid, 1);
		}
		case WORK_HARVESTER:
		{
			PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] = 0;
			ShowPlayerMessage(playerid, "Ve hasta los ~y~puntos de control~w~.", 3);
			Set_HARVEST_Checkpoint(playerid);
			DisableRemoteVehicleCollisions(playerid, 1);
		}
		case WORK_TRASH:
		{
			if (CHARACTER_INFO[playerid][ch_SEX] == SEX_MALE)
			{
				DisableRemoteVehicleCollisions(playerid, 1);
				SetPlayerSkin(playerid, 16);
				PLAYER_TEMP[playerid][py_SKIN] = 16;
				for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++) RemovePlayerAttachedObject(playerid, i);
			}
		}
		case WORK_MECHANIC:
		{
			if (CHARACTER_INFO[playerid][ch_SEX] == SEX_MALE)
			{
				SetPlayerSkin(playerid, 50);
				PLAYER_TEMP[playerid][py_SKIN] = 50;
				for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++) RemovePlayerAttachedObject(playerid, i);
			}
			SetMechanicPlayerMarkers(playerid);
		}
		case WORK_POLICE:
		{
			new label_str[128];
			format(label_str, sizeof label_str, "%s | Nº%d | %c. %s", POLICE_RANKS[ PLAYER_SKILLS[playerid][WORK_POLICE] ], PLAYER_MISC[playerid][MISC_PLACA_PD], PLAYER_TEMP[playerid][py_FIRST_NAME][0], PLAYER_TEMP[playerid][py_SUB_NAME]);

			if (IsValidDynamic3DTextLabel(PLAYER_TEMP[playerid][py_POLICE_LABEL]))
			{
				DestroyDynamic3DTextLabel(PLAYER_TEMP[playerid][py_POLICE_LABEL]);
				PLAYER_TEMP[playerid][py_POLICE_LABEL] = Text3D:INVALID_STREAMER_ID;
			}
			PLAYER_TEMP[playerid][py_POLICE_LABEL] = CreateDynamic3DTextLabel(label_str, 0xF7F7F700, 0.0, 0.0, 0.3, 20.0, playerid, .testlos = true);

			//for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++) RemovePlayerAttachedObject(playerid, i);
		}
		case WORK_MEDIC:
		{
			if (CHARACTER_INFO[playerid][ch_SEX] == SEX_MALE) SetPlayerSkin(playerid, minrand(274, 276));
			else SetPlayerSkin(playerid, 308);

			SetMedicPlayerMarkers(playerid);
			ShowPlayerMessage(playerid, "Ve hasta los puntos marcados en el mapa.", 3);
		}
		case WORK_WOODCUTTER:
		{
			for(new i = 0; i != 10; ++i) RemovePlayerAttachedObject(playerid, i);
			SetPlayerAttachedObject(playerid, 0, 18638, 2, 0.152999, 0.007999, -0.005000, 0.0, 0.0, -16.199993, 1.0, 1.0, 1.0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
			SetPlayerAttachedObject(playerid, 1, 1458, 6, 1.840000, -0.546001, 0.419000, 62.100097, -158.799804, 78.600196, 0.474999, 1.000000, 1.000000);
			// SetPlayerAttachedObject(playerid, 2, 341, 6, 0.026999, -0.015000, -0.096999, 0.000000, -35.600006, 0.000000, 1.000000, 1.000000, 1.000000);

			LogCarts[playerid][cart_VALID] = true;
			LogCarts[playerid][cart_AMOUNT] = 0;
			LogCarts[playerid][cart_OBJECT] = INVALID_OBJECT_ID;
			PLAYER_TEMP[playerid][py_HOLDING_CART] = true;

			ShowPlayerNotification(playerid, "Ahora estas de servicio como leñador, ve al bosque y tala algunos arboles. Usa ~r~ALT ~w~+ ~r~CLICK ~w~para soltar tu carro.", 5);
		}
	}

	PLAYER_TEMP[playerid][py_WORKING_IN] = work;
	return 1;
}

EndPlayerJob(playerid, changeskin = true)
{
	switch(PLAYER_TEMP[playerid][py_WORKING_IN])
	{
		case WORK_TRUCK:
		{
			if (PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] != INVALID_VEHICLE_ID)
			{
				if (TRUCK_VEHICLE[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][truck_vehicle_DRIVER_USER_ID] == ACCOUNT_INFO[playerid][ac_ID])
				{
					if (TRUCK_VEHICLE[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][truck_vehicle_LOADING])
					{
						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][9]);
						SetVehicleToRespawnEx(PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID]);
					}
					if (TRUCK_VEHICLE[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][truck_vehicle_UNLOADING])
					{
						TRUCK_VEHICLE[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][truck_vehicle_UNLOADING] = false;
						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][9]);
					}
				}
			}
			if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]))
			{
				DestroyDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]);
	   			CancelTracing(playerid);
				PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT] = INVALID_STREAMER_ID;
			}
		}
		case WORK_HARVESTER:
		{
			if (IsValidDynamicRaceCP(PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT]))
			{
				DestroyDynamicRaceCP(PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT]);
				PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT] = INVALID_STREAMER_ID;
			}
			if (PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] != INVALID_VEHICLE_ID)
			{
				if (WORK_VEHICLES[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][work_vehicle_WORK] == WORK_HARVESTER) SetVehicleToRespawnEx(PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID]);
			}
		}
		case WORK_FARMER: CancelPlayerPlanting(playerid);
		case WORK_TRASH:
		{
			if (changeskin)
			{
				SetPlayerSkin(playerid, CHARACTER_INFO[playerid][ch_SKIN]);
				PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];
				SetPlayerToys(playerid);
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
		}
		case WORK_POLICE:
		{
			PLAYER_TEMP[playerid][py_POLICE_RADIO] = 0;
			if (IsValidDynamic3DTextLabel(PLAYER_TEMP[playerid][py_POLICE_LABEL]))
			{
				DestroyDynamic3DTextLabel(PLAYER_TEMP[playerid][py_POLICE_LABEL]);
				PLAYER_TEMP[playerid][py_POLICE_LABEL] = Text3D:INVALID_STREAMER_ID;
			}

			if (changeskin)
			{
				SetPlayerSkin(playerid, CHARACTER_INFO[playerid][ch_SKIN]);
				PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];
				//SetPlayerToys(playerid);
			}

			SetPlayerColorEx(playerid, PLAYER_COLOR);
			SetNormalPlayerMarkers(playerid);
		}
		case WORK_MECHANIC:
		{
			if (changeskin)
			{
				SetPlayerSkin(playerid, CHARACTER_INFO[playerid][ch_SKIN]);
				PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];
				SetPlayerToys(playerid);
			}
			SetNormalPlayerMarkers(playerid);
		}
		case WORK_MEDIC:
		{
			SetPlayerSkin(playerid, CHARACTER_INFO[playerid][ch_SKIN]);
			PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];
			SetNormalPlayerMarkers(playerid);
		}
		case WORK_WOODCUTTER:
		{
			RemovePlayerAttachedObject(playerid, 0);
			RemovePlayerAttachedObject(playerid, 1);
			RemovePlayerAttachedObject(playerid, 2);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			ClearAnimations(playerid);
			
			SetPlayerToys(playerid);

			if (IsValidDynamicObject(LogCarts[playerid][cart_OBJECT]))
				DestroyDynamicObject(LogCarts[playerid][cart_OBJECT]);

			if (IsValidDynamic3DTextLabel(LogCarts[playerid][cart_LABEL]))
				DestroyDynamic3DTextLabel(LogCarts[playerid][cart_LABEL]);

			if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT]))
			{
				TogglePlayerDynamicCP(playerid, PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT], false);
				DestroyDynamicCP(PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT]);
			}
			
			LogCarts[playerid][cart_VALID] = false;
		}
	}

	PLAYER_TEMP[playerid][py_WORKING_IN] = WORK_NONE;

	SavePlayerSkills(playerid);
	return 1;
}

<<<<<<< HEAD
UpdateUnnocupiedPropertyLabel(index)
{
	if (!PROPERTY_INFO[index][property_VALID]) return 0;
	if (PROPERTY_INFO[index][property_SOLD]) return 0;

	new label_str[256], city[45], zone[45];
	GetPointZone(PROPERTY_INFO[index][property_EXT_X], PROPERTY_INFO[index][property_EXT_Y], city, zone);
	format(label_str, sizeof label_str, ""COL_WHITE"Propiedad en %s (%d)\n"COL_GREEN"En venta", zone, PROPERTY_INFO[index][property_ID]);
	UpdateDynamic3DTextLabelText(PROPERTY_INFO[index][property_EXT_LABEL_ID], 0xF7F7F700, label_str);
	return 1;
}

<<<<<<< HEAD
<<<<<<< HEAD
#define MIN_SECONDS_BETWEEN_COMMANDS 1 // Deben pasar al menos 1 segundos entre comando y comando.
public OnPlayerCommandReceived(playerid, cmd[], params[], flags)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerCommandReceived %d %s %s",playerid,cmd,params); // debug juju
	#endif

	if (PLAYER_TEMP[playerid][py_KICKED]) return 0;
	if (PLAYER_TEMP[playerid][py_STEAL_SUSPICION]) return KickEx(playerid, 500);

	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < 8)
	{
		if (PLAYER_TEMP[playerid][py_GAME_STATE] != GAME_STATE_NORMAL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_HOSPITAL || PLAYER_TEMP[playerid][py_NEW_USER])
		{
			ShowPlayerMessage(playerid, "~r~Ahora no puedes usar comandos.", 3);
			return 0;
		}
	}

	if (PLAYER_TEMP[playerid][py_SELECT_TEXTDRAW]) return ShowPlayerMessage(playerid, "Pulsa ~y~ESC~w~ para cerrar el menú.", 4);

	new interval = GetTickDiff(GetTickCount(), PLAYER_TEMP[playerid][py_ANTIFLOOD_COMMANDS]);
	if (interval < MIN_SECONDS_BETWEEN_COMMANDS)
	{
		if (ac_Info[CHEAT_COMMAND_SPAMMER][ac_Enabled])
		{
			if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_COMMAND_SPAMMER][p_ac_info_IMMUNITY])
			{
				if (interval < 50)
				{
					if (!ac_Info[CHEAT_COMMAND_SPAMMER][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_COMMAND_SPAMMER, float(interval));
					else
					{
						if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_COMMAND_SPAMMER][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_COMMAND_SPAMMER][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_COMMAND_SPAMMER][p_ac_info_DETECTIONS] = 0;
						else PLAYER_AC_INFO[playerid][CHEAT_COMMAND_SPAMMER][p_ac_info_DETECTIONS] ++;

						PLAYER_AC_INFO[playerid][CHEAT_COMMAND_SPAMMER][p_ac_info_LAST_DETECTION] = gettime();
						if (PLAYER_AC_INFO[playerid][CHEAT_COMMAND_SPAMMER][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_COMMAND_SPAMMER][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_COMMAND_SPAMMER, float(interval));
					}
				}
			}
		}
		SendClientMessage(playerid, COLOR_WHITE, "¡Tranquilo, quemarás el teclado!");
		return 0;
	}

	if (flags)
	{
		if (flags > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
		{
			SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" No tienes permisos suficientes.");
			return 0;
		}

		if (!PLAYER_TEMP[playerid][py_ADMIN_SERVICE])
		{
		    ShowPlayerMessage(playerid, "~r~Debes estar de servicio como admin, usa /duty.", 3);
			return 0;
		}
	}

	PLAYER_TEMP[playerid][py_ANTIFLOOD_COMMANDS] = GetTickCount();

	#if CMD_LOGGIN
		printf("[CMD] %s (%d): /%s %s", ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_ID], cmd, params);
	#endif
	return 1;
}

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags) 
{
	#if DEBUG_MODE == 1
		printf("OnPlayerCommandPerformed %d %s %s",playerid,params,result); // debug juju
	#endif

	printf("%s (%d): /%s %s", PLAYER_TEMP[playerid][py_NAME], playerid, cmd, params);
    if (result == -1) 
    { 
		SendClientMessageEx(playerid, COLOR_WHITE, "El comando "COL_RED"/%s "COL_WHITE"no existe, usa "COL_RED"/ayuda"COL_WHITE".", cmd);
        return 0; 
    }
    return 1; 
}

<<<<<<< HEAD
<<<<<<< HEAD
CheckKillEvadeAttemp(const str_text[])
{
	for(new x = 0; x < sizeof(QUIT_KEYWORDS); x ++)
    {
        if (strfind(str_text, QUIT_KEYWORDS[x], true) != -1)
        {
        	printf("[QUIT-CHECK] %s - %s", QUIT_KEYWORDS[x], str_text);
        	return true;
    	}
    }
	return false;
}

CheckSpamViolation(const str_text[])
{
	for(new x = 0; x < sizeof(BAN_KEYWORDS); x ++)
    {
        if (strfind(str_text, BAN_KEYWORDS[x], true) != -1)
        {
        	printf("[SPAM-CHECK] %s - %s", BAN_KEYWORDS[x], str_text);
        	return true;
    	}
    }
	return false;
}

CheckFilterViolation(const str_text[])
{
	for(new x = 0; x < sizeof(INVALID_WORDS); x ++)
    {
        if (strfind(str_text, INVALID_WORDS[x], true) != -1) return true;
    }
	return false;
}

CheckNameFilterViolation(const str_text[])
{
	for(new x = 0; x < sizeof(INVALID_NAMES); x ++)
    {
        if (strfind(str_text, INVALID_NAMES[x], true) != -1) return true;
    }
	return false;
}

ScanDoubt(playerid, const doubt[])
{
	new payload[264];
	format(payload, sizeof(payload), "{\"author\": \"%s\", \"playerid\": %d, \"question\": \"%s\"}", PLAYER_TEMP[playerid][py_NAME], playerid, doubt);
	HTTP(playerid, HTTP_POST, "51.161.31.157:6666/get_response", payload, "neuroadmin_BotGetResponse");
	return 1;
}

forward neuroadmin_BotGetResponse(index, response_code, const data[]);
public neuroadmin_BotGetResponse(index, response_code, const data[])
{
	#if DEBUG_MODE == 1
		printf("neuroadmin_BotGetResponse %d %d %s", index, response_code, data);
	#endif

	if (IsPlayerConnected(index))
	{
		new str_text[264];
	    if (response_code == 200)
	    {
	    	printf("[NEUROADMIN] Data: %s", data);

	    	format(str_text, sizeof(str_text), 
	    		"[Dudas] "COL_WHITE"NeuroAdmin: (( @%d %s ))",
	    		index,
	    		data
	    	);

	    	printf("[NEUROADMIN] Doubt: %s", str_text);
	    	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
			{
				if (IsPlayerConnected(i))
				{
					if ((PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_DEAD) && ACCOUNT_INFO[i][ac_DOUBT_CHANNEL])
					{
						SendResponsiveMessage(i, COLOR_DARK_GREEN, str_text, 135);
					}
				}
			}

			new DCC_Channel:channelid;
			channelid = DCC_FindChannelById("790742732829491230");
			SendDiscordMessage(channelid, "%s", str_text);
	    }
	    else
	    {
			format(str_text, sizeof(str_text), "{\"author\": \"%s\", \"playerid\": %d, \"message\": \"%s\"}", PLAYER_TEMP[index][py_NAME], index, PLAYER_TEMP[index][py_LAST_DOUBT]);
			HTTP(index, HTTP_POST, "51.161.31.157:6666/check_bad_use", str_text, "neuroadmin_BotCheckBadUse");
	    }
	}
	return 1;
}

forward neuroadmin_BotCheckBadUse(index, response_code, const data[]);
public neuroadmin_BotCheckBadUse(index, response_code, const data[])
{
	#if DEBUG_MODE == 1
		printf("neuroadmin_BotCheckBadUse %d %d %s", index, response_code, data); // debug juju
	#endif

	if (IsPlayerConnected(index))
	{
	    if (response_code == 200)
	    {
	    	if (data[0] == 'Y')
			{
				new seconds = 60 * 60;

				SendClientMessageEx(index, COLOR_ORANGE, "[Alerta]"COL_WHITE" NeuroAdmin te silenció del canal de dudas y anuncios por Mal uso - Tiempo: 60");
				PLAYER_MISC[index][MISC_MUTES] ++;
				PLAYER_MISC[index][MISC_MUTE] = gettime() + seconds;
				SavePlayerMisc(index);

				new str_text[145];
			    format(str_text, 145, "[Dudas] "COL_WHITE"NeuroAdmin silenció a %s (%d) del canal de dudas/anuncios: Mal uso", ACCOUNT_INFO[index][ac_NAME], index);

			    for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
				{
					if (IsPlayerConnected(i))
					{
						if ((PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_DEAD) && ACCOUNT_INFO[i][ac_DOUBT_CHANNEL])
						{
							SendResponsiveMessage(i, COLOR_DARK_GREEN, str_text, 135);
						}
					}
				}

				format(str_text, 145, "[DUDAS] %s (%d): %s", ACCOUNT_INFO[index][ac_NAME], index, PLAYER_TEMP[index][py_LAST_DOUBT]);
			    SendDiscordWebhook(str_text, 1);

				format(str_text, 145, "NeuroAdmin silencio a %s (%d) del canal de dudas/anuncios: Mal uso", ACCOUNT_INFO[index][ac_NAME], index);
			    SendDiscordWebhook(str_text, 1);

			    new DCC_Channel:channelid;
				channelid = DCC_FindChannelById("790742732829491230");
				SendDiscordMessage(channelid, "%s", str_text);
			}
	    }
	}
	return 1;
}

SendMessageToDoubtChannel(playerid, const message[])
{
	new str[364];

	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL]) format(str, sizeof(str), "[Dudas] "COL_WHITE"%s %s (%d): (( %s ))", ADMIN_LEVELS[ ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] ], PLAYER_TEMP[playerid][py_RP_NAME], playerid, message);
	else
	{
		format(str, sizeof(str), "[Dudas] "COL_WHITE"Jugador %s (%d): (( %s ))", PLAYER_TEMP[playerid][py_RP_NAME], playerid, message);
		ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Recordatorio", ""COL_WHITE"Recuerde que si dice cosas sarcásticas, insultos, anuncios o\n\
			cualquier cosa que no sea relacionada al tema del canal\n\
			puede ser muteado y a los 4 muteos no va a poder enviar\n\
			dudas ni anuncios.", "Cerrar", "");
	}

	Log("doubt", str);

	PLAYER_TEMP[playerid][py_DOUBT_CHANNEL_TIME] = gettime();

	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		//strreplace(str, "<", "{A8A8A8}");
		//strreplace(str, ">", "{FFFFFF}");

		strreplace(str, "@", "{4db6ac}@");
		strreplace(str, ":", "{F7F7F7}");
	}

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if ((PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_DEAD) && ACCOUNT_INFO[i][ac_DOUBT_CHANNEL] && !PLAYER_TEMP[playerid][py_NEW_USER])
			{
				SendResponsiveMessage(i, COLOR_DARK_GREEN, str, 135);
			}
		}
	}

	new DCC_Channel:channelid;
	channelid = DCC_FindChannelById("790742732829491230");
	SendDiscordMessage(channelid, "%s", str);

	if (!ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL]) ScanDoubt(playerid, message);
	return 1;
}

<<<<<<< HEAD
GetFreePoliceObjectSlot()
{
	for(new i = 0; i != MAX_POLICE_OBJECTS; i ++)
	{
		if (!POLICE_OBJECTS[i][police_object_VALID]) return i;
	}
	return -1;
}

CMD:antecedente(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);

	new to_player, reason[128];
	if (sscanf(params, "us[128]", to_player, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /antecedentes <playerid> <razon>");
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (to_player == playerid) return 1;

	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No se puede añadir algo a este jugador ahora.", 3);
	if (PLAYER_WORKS[to_player][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No se puede añadir algo a este jugador porque es policía.", 3);

	AddPlayerPoliceHistory(to_player, ACCOUNT_INFO[playerid][ac_NAME], reason);
	SendPoliceNotification(sprintf("%s ha actualizado el historial de ~y~%s~w~.", PLAYER_TEMP[playerid][py_RP_NAME], PLAYER_TEMP[to_player][py_RP_NAME]), 4);
	return 1;
}

CMD:limpiar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);
	if (PLAYER_SKILLS[playerid][WORK_POLICE] < 11) return ShowPlayerNotification(playerid, "No tienes rango suficiente.", 3);

	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /limpiar <playerid>");
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No se puede eliminar el historial policial de este jugador ahora.", 3);

	new DB_Query[128];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `POLICE_HISTORY` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[to_player][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	SendPoliceNotification(sprintf("%s ha borrado el historial de ~y~%s~w~.", PLAYER_TEMP[playerid][py_RP_NAME], PLAYER_TEMP[to_player][py_RP_NAME]), 4);
	return 1;
}

CMD:historial(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);

	ShowDialog(playerid, DIALOG_POLICE_BYC);
	return 1;
}

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

<<<<<<< HEAD
flags:ufo(CMD_MODERATOR)
flags:staff(CMD_HELPER)
flags:setveh(CMD_MODERATOR)
flags:setvh(CMD_MODERATOR)
flags:jailtime(CMD_MODERATOR)
flags:setmutes(CMD_MODERATOR4)
flags:setjails(CMD_MODERATOR4)
flags:setbans(CMD_MODERATOR4)
flags:setadv(CMD_MODERATOR4)
flags:setkicks(CMD_MODERATOR4)
flags:initmarket(CMD_OPERATOR)
flags:initgraffiti(CMD_OPERATOR)
flags:dropitem(CMD_MODERATOR3)
flags:closeserver(CMD_ADMIN)
flags:stopall(CMD_OPERATOR)
flags:gift(CMD_OPERATOR)
flags:giftrep(CMD_OPERATOR)
flags:giftvip(CMD_OPERATOR)
flags:setpd(CMD_OPERATOR)
flags:pnot(CMD_MODERATOR)
flags:plog(CMD_MODERATOR)
flags:addcode(CMD_OPERATOR)
flags:muteard(CMD_HELPER)
flags:desmuteard(CMD_HELPER)
flags:trabajos(CMD_MODERATOR)
flags:getid(CMD_MODERATOR)
flags:getname(CMD_MODERATOR)
flags:getphone(CMD_MODERATOR)
flags:aka(CMD_MODERATOR)
flags:adv(CMD_MODERATOR)
flags:kick(CMD_MODERATOR)
flags:spec(CMD_MODERATOR)
flags:specoff(CMD_MODERATOR)
flags:freeze(CMD_MODERATOR)
flags:unfreeze(CMD_MODERATOR)
flags:freezeall(CMD_ADMIN)
flags:unfreezeall(CMD_ADMIN)
flags:pest(CMD_MODERATOR)
flags:pinv(CMD_MODERATOR)
flags:pexp(CMD_MODERATOR)
flags:pbank(CMD_MODERATOR)
flags:unjail(CMD_MODERATOR)
flags:ip(CMD_MODERATOR)
flags:traerveh(CMD_MODERATOR)
flags:vehinfo(CMD_MODERATOR)
flags:goto(CMD_MODERATOR)
flags:get(CMD_MODERATOR)
flags:unban(CMD_MODERATOR2)
flags:jail(CMD_MODERATOR)
flags:ban(CMD_MODERATOR)
flags:cls(CMD_MODERATOR)
flags:tban(CMD_MODERATOR)
flags:dban(CMD_MODERATOR)
flags:dtban(CMD_MODERATOR)
flags:rac(CMD_MODERATOR2)
flags:rac2(CMD_MODERATOR2)
flags:rv(CMD_MODERATOR2)
flags:pm(CMD_HELPER)
flags:atenderre(CMD_MODERATOR)
flags:darstaff(CMD_OWNER)
<<<<<<< HEAD
<<<<<<< HEAD
//flags:fakeping(CMD_OWNER)
flags:botmaster(CMD_OWNER)
=======
>>>>>>> refs/rewritten/hmm
flags:hy(CMD_OWNER)
=======
>>>>>>> a41146c (Arreglar errores de Pawn.CMD)
flags:ac(CMD_OWNER)
flags:setthirst(CMD_MODERATOR)
flags:sethungry(CMD_MODERATOR)
flags:setgas(CMD_MODERATOR)
flags:repairveh(CMD_MODERATOR)
flags:sethealth(CMD_MODERATOR)
flags:setarmour(CMD_MODERATOR)
flags:setlevel(CMD_OPERATOR)
flags:setwork(CMD_OPERATOR)
flags:setworkexp(CMD_OPERATOR)
flags:setcash(CMD_ADMIN)
flags:givecash(CMD_ADMIN)
flags:setbmlevel(CMD_OPERATOR)
flags:asay(CMD_ADMIN)
flags:lpos(CMD_MODERATOR)
flags:setworld(CMD_MODERATOR)
flags:setinterior(CMD_MODERATOR)
flags:v(CMD_MODERATOR2)
flags:dv(CMD_MODERATOR)
flags:setname(CMD_MODERATOR2)
flags:setcrack(CMD_OPERATOR)
flags:setmedis(CMD_OPERATOR)
flags:exproperty(CMD_MODERATOR4)
flags:gotoproperty(CMD_MODERATOR4)
flags:comandosadmin(CMD_HELPER)
flags:freezedetect(CMD_MODERATOR2)
flags:dlply(CMD_MODERATOR2)
flags:setpass(CMD_MODERATOR4)
flags:setip(CMD_MODERATOR4)
flags:accsaveall(CMD_MODERATOR4)
flags:delete(CMD_OWNER)
flags:rproperty(CMD_OPERATOR)
flags:eproperty(CMD_OPERATOR)
flags:cproperty(CMD_OPERATOR)
flags:eco(CMD_OPERATOR)
flags:darsu(CMD_OPERATOR)
flags:jailoff(CMD_MODERATOR)
flags:unjailoff(CMD_MODERATOR)
flags:setearsu(CMD_ADMIN)
flags:darvip(CMD_OPERATOR)
flags:darskin(CMD_MODERATOR4)
flags:globalskin(CMD_MODERATOR4)
flags:setfstyle(CMD_MODERATOR4)
flags:ejercito(CMD_MODERATOR2)
flags:ls(CMD_MODERATOR)
flags:darmaverick(CMD_OPERATOR)
flags:explode(CMD_OPERATOR)
flags:jetpack(CMD_MODERATOR2)
flags:explosionbullet(CMD_ADMIN)
flags:ultradebug(CMD_MODERATOR)
flags:lsdb(CMD_MODERATOR)
flags:vpcar(CMD_ADMIN)
flags:rev(CMD_MODERATOR)
flags:a(CMD_MODERATOR)
flags:borrarop(CMD_MODERATOR2)
flags:admac(CMD_OWNER)
flags:depositveh(CMD_MODERATOR)

=======
>>>>>>> a47e1e7 (command flags)
=======
>>>>>>> 4946df2 (police modules)
=======
>>>>>>> b005a33 (bugfixes)
=======
=======
>>>>>>> 2298b56 (misc modules)
GetPlayerZones(playerid, city[], zone[])
{
	new Float:f_Pos[3];

	switch(CHARACTER_INFO[playerid][ch_STATE])
	{
		case ROLEPLAY_STATE_INTERIOR:
		{
			f_Pos[0] = ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_EXT_X];
			f_Pos[1] = ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_EXT_Y];
			f_Pos[2] = ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_EXT_Z];
		}
		case ROLEPLAY_STATE_OWN_PROPERTY, ROLEPLAY_STATE_GUEST_PROPERTY:
		{
			f_Pos[0] = PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PROPERTY_INDEX] ][property_EXT_X];
			f_Pos[1] = PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PROPERTY_INDEX] ][property_EXT_Y];
			f_Pos[2] = PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PROPERTY_INDEX] ][property_EXT_Z];
		}
		default: GetPlayerPos(playerid, f_Pos[0], f_Pos[1], f_Pos[2]);
	}

    format(city, 45, "San Andreas");
    format(zone, 45, "Desconocida");

	for(new i = 0; i < sizeof(g_Cities); i++)
	{
	    if (   (f_Pos[0] >= g_Cities[i][z_MinX] && f_Pos[0] < g_Cities[i][z_MaxX]) && (f_Pos[1] >= g_Cities[i][z_MinY] && f_Pos[1] < g_Cities[i][z_MaxY]) )
		{
			format(city, 45, g_Cities[i][z_Name]);
		    break;
		}
	}

	for(new i = 0; i < sizeof(g_Zones); i++)
	{
	    if (   (f_Pos[0] >= g_Zones[i][z_MinX] && f_Pos[0] < g_Zones[i][z_MaxX]) && (f_Pos[1] >= g_Zones[i][z_MinY] && f_Pos[1] < g_Zones[i][z_MaxY]) )
		{
			format(zone, 45, g_Zones[i][z_Name]);
		    break;
		}
	}

	return 1;
}

>>>>>>> e04673e (macros module)
=======
>>>>>>> 06e2d90 (fixes)
=======
>>>>>>> 75def5d (store module)
// Dialogs
#include "core/dialog/show.pwn"
#include "core/dialog/response.pwn"

// Player callbacks
#include "core/player/callbacks.pwn"

// World configuration
#include "core/world/config.pwn"