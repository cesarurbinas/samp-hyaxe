/*
 *      Hyaxe - San Andreas Multiplayer
 * 		Cr�ditos: Atom
*/

#pragma option -(+
#pragma option -;+

/*
 * Modos de debug:
 *  - 0: No saldr� ning�n mensaje de debug ni en la consola ni en el juego.
 *  - 1: Saldr�n mensajes de debug solamente en la consola.
 *  - 2: Saldr�n mensajes de debug en la consola y en el juego.
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
#include <nex-ac>
#include <PreviewModelDialog>
#include <route-tracing>
#include <strlib>
#include <ExtendedActorFunctions>
#include <gmenu>
#include <discord-connector>
#define DC_BOT_NAME         "Server Controller"
#define DC_PREFIX           "!"
#define DC_PREFIX_LENGTH    1
#include <discord-command>

/* v0.x Features */

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

// Player
#include "core/player/account.pwn"
#include "core/player/temp.pwn"
#include "core/player/misc.pwn"
#include "core/player/character.pwn"
#include "core/player/textdraws.pwn"
#include "core/work/data.pwn"

// Damage
#include "core/damage/callbacks.pwn"
#include "core/damage/functions.pwn"
#include "core/damage/timers.pwn"

// Notification
#include "core/notification/callbacks.pwn"
#include "core/notification/functions.pwn"
#include "core/notification/timers.pwn"

// Work
#include "core/work/miner.pwn"
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
#include "core/graffiti/data.pwn"

// World
#include "core/world/tele.pwn"
#include "utils/world/tele.pwn"
#include "core/world/balloon.pwn"
#include "utils/world/balloon.pwn"

// Black market
#include "core/black_market/data.pwn"

// Visual inventory
#include "utils/visual_inventory/show.pwn"
#include "utils/visual_inventory/accommodate.pwn"
#include "utils/visual_inventory/actions.pwn"

// Notifications
#include "utils/notification/show.pwn"

// Player util
#include "utils/player/util.pwn"

// Edit mode
#include "utils/edit_mode/edit.pwn"
#include "utils/furniture/object.pwn"

// Club's
#include "core/club/header.pwn"
#include "core/club/functions.pwn"
#include "core/club/callbacks.pwn"

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

/* v1.0 Features */

// Stall
#include "core/stall/header.pwn"
#include "core/stall/functions.pwn"

// Dealers
#include "core/dealer/header.pwn"
#include "core/dealer/functions.pwn"

// Particles
#include "core/particles/functions.pwn"

// Store
#include "core/store/header.pwn"

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

// Gamemodes
//#include "core/lgbt_infection/functions.pwn"
//#include "core/lgbt_infection/callbacks.pwn"

/* Special Features */

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

// Raknet
new VehicleDestroyed = 136;
const UNOCCUPIED_SYNC = 209,
	AIM_SYNC = 203,
	PLAYER_SYNC = 207,
	VEHICLE_SYNC = 200;

main()
{
	printf("[info: hostname] "SERVER_HOSTNAME"");
	printf("[info: language] "SERVER_LANGUAGE"");
	printf("[info: website] "SERVER_WEBSITE"");
	printf("[info: discord] "SERVER_DISCORD"");
	printf("\n[build] Hyaxe SA-MP "SERVER_VERSION"\n");
}

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

/* Timers
0 = Kick
1 = Gangzone da�o Rojo
2 = A�adir reputacion
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

/* Miner System */
enum miner_rocks_info
{
	r_MODELID,
	Float:r_X,
	Float:r_Y,
	Float:r_Z,
	Float:r_RX,
	Float:r_RY,
	Float:r_RZ,
	r_TYPE,
	r_WORLD,
	r_INTERIOR,
	bool:r_ACTIVATED,
	r_OBJECT_ID
};

new ROCKS_OBJ[][miner_rocks_info] =
{
	{3930, 1177.872436, 992.813354, -96.845115, 24.399999, 2.599997, 0.000000, 0, 36, 25}, // Mina A
	{3930, 1196.177978, 994.048706, -94.680076, 24.399999, 2.599997, 0.000000, 1, 36, 25},
	{3930, 1224.658569, 997.169494, -94.684623, 24.399999, 2.599997, 0.000000, 2, 36, 25},
	{3930, 1236.418090, 998.993347, -97.543411, 24.399999, 2.599997, 0.000000, 3, 36, 25},
	{3930, 1230.120605, 1019.671325, -99.555900, 24.399999, 2.599997, 0.000000, 0, 36, 25},
	{3930, 1207.183593, 1008.262329, -100.254249, 24.399995, 2.600013, -0.000006, 1, 36, 25},
	{3930, 1190.385620, 1009.850646, -98.333389, 24.399995, 2.600013, -0.000006, 2, 36, 25},
	{3930, 1179.665405, 1010.131530, -97.875244, 24.399988, 2.599982, -150.399932, 0, 36, 25},
	{3930, 1163.240478, 1005.786499, -98.784423, 24.399999, 2.599997, -85.299995, 1, 36, 25},
	{3930, 1209.523315, 998.607238, -99.839881, 24.399999, 2.599997, 0.000000, 2, 36, 25},
	{3931, 1223.792236, 1000.901733, -100.214630, 0.000000, 0.000000, 0.000000, 0, 36, 25},
	{3931, 1260.426757, 998.186218, -97.661567, 0.000000, -122.299987, 64.099983, 1, 36, 25},
	{3931, 1212.011962, 1013.100524, -96.754631, 0.000000, 0.000014, 0.000000, 2, 36, 25},
	{3931, 1193.982055, 1012.242187, -95.744636, 0.000000, 0.000000, 0.000000, 3, 36, 25},
	{3931, 1167.231689, 992.691772, -97.244628, 0.000000, 0.000000, 0.000000, 0, 36, 25},
	{3931, 1239.842163, 1020.351379, -100.454666, 0.000000, 0.000000, 0.000000, 1, 36, 25},
	{3930, 1233.481445, 1009.266235, -96.487350, 0.000000, 0.000014, 0.000000, 2, 36, 25},
	{3930, 1251.631835, 1005.076660, -99.247344, 0.000000, 0.000014, 0.000000, 3, 36, 25},
	{3930, 1189.956054, 994.439636, -96.924644, 0.000000, 0.000000, 0.000000, 0, 36, 25},
	{3930, 1198.553466, 1010.266357, -97.348808, 0.000009, 58.900024, 40.100006, 1, 36, 25},
	{3930, 1240.416381, 1008.318664, -95.574661, 0.000000, 0.000014, 0.000000, 2, 36, 25},
	{3930, 1180.246215, 994.873962, -99.361381, 36.599998, 0.000000, -55.200004, 3, 36, 25},
	{3930, 1222.842529, 1010.886718, -98.624633, 0.000007, 0.000012, 35.799980, 0, 36, 25},
	{3930, 1241.798706, 1006.211547, -98.624633, 0.000007, 0.000012, 35.799980, 1, 36, 25},
	{3930, 1253.789062, 999.310974, -98.874641, 0.000000, 0.000000, 8.599998, 2, 36, 25},
	{3930, 1187.321655, 996.277465, -99.797363, 0.000000, 0.000000, 0.000000, 0, 36, 25},
	{3930, 1205.381713, 995.057006, -94.697357, 0.000000, 0.000000, 0.000000, 1, 36, 25},
	{3930, 2006.621704, 1210.249877, -58.051799, 0.000000, 0.000000, 0.000000, 4, 37, 26}, // Mina B
	{3930, 2002.191528, 1211.020141, -56.831802, 0.000000, 0.000000, 0.000000, 5, 37, 26},
	{3930, 2003.431396, 1195.300048, -60.031810, 48.600002, 0.000000, 0.000000, 6, 37, 26},
	{3930, 1995.754516, 1209.251831, -60.907882, 0.000000, 45.999988, 47.099998, 5, 37, 26},
	{3930, 2013.841308, 1195.473999, -62.344772, 48.600002, 0.000000, 0.000000, 7, 37, 26},
	{3930, 2027.621337, 1200.035766, -62.886730, 48.600002, 0.000000, 0.000000, 4, 37, 26},
	{3930, 2029.621337, 1209.721923, -62.348133, 48.600002, 0.000000, 0.000000, 5, 37, 26},
	{3930, 2004.174682, 1197.629150, -63.108753, 0.000000, 45.999988, -56.800014, 6, 37, 26},
	{3930, 1996.451782, 1198.851684, -62.162265, 0.000000, 45.999988, 47.099998, 7, 37, 26},
	{3930, 2041.770141, 1192.692016, -62.289901, 0.000000, 19.599983, 47.099998, 4, 37, 26},
	{3930, 2047.992919, 1190.046508, -58.458881, 92.699989, 19.599983, 47.099998, 5, 37, 26},
	{3931, 2037.137329, 1210.305297, -61.818855, -30.500000, -1.099998, 0.000000, 6, 37, 26},
	{3931, 2055.554687, 1208.279418, -60.214843, -30.500000, -1.099998, 0.000000, 7, 37, 26},
	{3931, 2015.895751, 1206.989379, -62.404953, -30.500000, -1.099998, 0.000000, 4, 37, 26},
	{3931, 2016.377807, 1193.260375, -59.310298, -30.500000, -1.099998, 0.000000, 5, 37, 26},
	{3931, 1990.917358, 1199.671264, -63.990932, -30.500000, -1.099998, 0.000000, 6, 37, 26},
	{3931, 1991.524414, 1209.075195, -62.747913, -30.500000, -1.099998, 0.000000, 7, 37, 26},
	{3931, 2047.370483, 1207.462036, -63.966873, -30.500000, -1.099998, 0.000000, 4, 37, 26},
	{3929, 2022.074096, 1208.842407, -58.054317, 0.000000, 0.000000, 0.000000, 5, 37, 26},
	{3929, 2019.653442, 1209.882446, -55.744316, 0.000000, 0.000000, 0.000000, 6, 37, 26},
	{3929, 2029.603393, 1211.433227, -58.594314, 0.000000, 0.000000, 0.000000, 7, 37, 26},
	{3929, 2045.704223, 1210.327514, -59.544311, 0.000000, 0.000000, 171.200012, 4, 37, 26},
	{3929, 2042.604492, 1190.296386, -58.284328, 0.000000, 0.000000, 171.200012, 5, 37, 26},
	{3931, 2061.907470, 1205.823608, -62.572795, -30.500000, -1.099998, 0.000000, 6, 37, 26},
	{3931, 2062.033935, 1191.420166, -61.724494, -30.500000, -1.099998, 0.000000, 7, 37, 26},
	{3931, 2049.864746, 1193.782592, -63.920982, -30.500000, -1.099998, 0.000000, 4, 37, 26},
	{3931, 2034.317993, 1197.020507, -63.191623, -30.500000, -1.099998, 0.000000, 5, 37, 26},
	{3931, 2020.915527, 1197.401611, -59.825992, -30.500000, -1.099998, 0.000000, 6, 37, 26},
	{3931, 1997.382812, 1196.342041, -58.728122, -30.500000, -1.099998, 0.000000, 7, 37, 26},
	{3930, 2054.089111, 1190.715209, -60.811580, 0.000000, 19.599983, 47.099998, 4, 37, 26},
	{3930, 2057.579833, 1204.269042, -63.813278, 0.000000, 19.599983, 47.099998, 5, 37, 26},
	{3930, 2051.272949, 1207.219116, -62.947536, 0.000000, 19.599983, 47.099998, 6, 37, 26},
	{3930, 2043.150756, 1213.020019, -58.107460, 0.000000, 19.599983, 47.099998, 7, 37, 26},
	{3930, 2040.889526, 1211.909179, -59.710617, 5.999997, 31.999990, -49.800010, 4, 37, 26},
	{3930, 2009.627685, 1195.286132, -61.320980, 0.000000, 45.999988, -56.800014, 5, 37, 26},
	{3930, 2000.716430, 1200.245849, -62.464614, 0.000000, 45.999988, -56.800014, 6, 37, 26},
	{3930, 2003.081665, 1207.042358, -60.393619, 0.000000, 45.999988, -56.800014, 7, 37, 26},
	{3930, 2007.940429, 1205.770874, -62.219581, 0.000000, 45.999988, -56.800014, 4, 37, 26},
	{3930, 2003.615356, 1203.413085, -62.601642, 0.000000, 45.999988, -56.800014, 5, 37, 26},
	{3930, 2558.547119, 1920.175537, -56.770034, 0.000000, -23.799999, 103.499992, 8, 38, 27}, // Mina C
	{3930, 2568.526367, 1929.490844, -56.750083, 81.999977, -23.799999, 103.499992, 9, 38, 27},
	{3930, 2556.510986, 1925.515625, -55.503135, 81.999977, -23.799999, 103.499992, 10, 38, 27},
	{3930, 2575.620117, 1928.317382, -58.313629, 81.999977, -23.799999, 103.499992, 11, 38, 27},
	{3930, 2582.657714, 1923.599975, -57.506542, 81.999977, -23.799999, 103.499992, 8, 38, 27},
	{3930, 2591.072021, 1930.458007, -56.131759, 81.999977, -23.799999, 103.499992, 9, 38, 27},
	{3930, 2598.102539, 1921.015869, -58.439590, 81.999977, -23.799999, 167.199966, 10, 38, 27},
	{3930, 2605.449707, 1931.463500, -58.859226, 81.999977, -23.799999, 167.199966, 11, 38, 27},
	{3930, 2599.343017, 1931.116943, -58.198123, 81.999977, -23.799999, 167.199966, 8, 38, 27},
	{3930, 2605.106933, 1921.937500, -57.921848, 19.499980, -23.799999, 167.199966, 9, 38, 27},
	{3930, 2614.835937, 1919.864135, -57.544937, 19.499980, -23.799999, 167.199966, 10, 38, 27},
	{3930, 2622.473388, 1926.415893, -56.893245, 19.499980, -23.799999, 167.199966, 11, 38, 27},
	{3930, 2623.638183, 1930.964111, -53.048309, 19.499980, -23.799999, 167.199966, 8, 38, 27},
	{3930, 2629.750244, 1924.946044, -57.796928, 19.499980, -23.799999, 167.199966, 9, 38, 27},
	{3930, 2631.227050, 1914.339721, -55.732841, 19.499980, -23.799999, 167.199966, 10, 38, 27},
	{3930, 2577.853515, 1931.992675, -53.565452, 81.999977, -23.799999, 103.499992, 11, 38, 27},
	{3930, 2581.912109, 1927.186157, -57.944911, 81.999977, -23.799999, 103.499992, 8, 38, 27},
	{3930, 2596.468505, 1922.699584, -56.103130, 81.999977, -23.799999, 103.499992, 9, 38, 27},
	{3930, 2595.459716, 1928.450927, -57.102424, 81.999977, -23.799999, 103.499992, 10, 38, 27},
	{3930, 2613.909179, 1927.228271, -58.297199, 81.999977, -23.799999, 103.499992, 11, 38, 27},
	{3930, 2625.735839, 1928.402343, -55.299907, 81.999977, -23.799999, 103.499992, 8, 38, 27},
	{3930, 2599.343017, 1931.116943, -58.198123, 81.999977, -23.799999, 167.199966, 9, 38, 27},
	{3930, 2587.522705, 1932.371459, -53.971248, 81.999977, -23.799999, 167.199966, 10, 38, 27},
	{3930, 2589.001220, 1922.533447, -53.152873, 81.999977, -23.799999, 167.199966, 11, 38, 27},
	{3930, 2572.721191, 1919.130615, -58.246109, 81.999977, -77.299995, 167.199966, 8, 38, 27},
	{3930, 2572.663574, 1930.959838, -54.859481, 81.999977, -77.299995, 167.199966, 9, 38, 27},
	{3930, 2582.617431, 1931.652954, -54.070865, 81.999977, -77.299995, 167.199966, 10, 38, 27},
	{3930, 2625.432373, 1923.397094, -58.817531, 81.999977, -77.299995, 167.199966, 11, 38, 27},
	{3930, 2627.374511, 1915.446044, -58.241146, 81.999977, -77.299995, 167.199966, 8, 38, 27},
	{3930, 1163.240478, 1005.786499, -98.784423, 24.399999, 2.599997, -85.299995, 10, 38, 27},
	{3930, 1209.523315, 998.607238, -99.839881, 24.399999, 2.599997, 0.000000, 11, 38, 27},
	{3931, 1223.792236, 1000.901733, -100.214630, 0.000000, 0.000000, 0.000000, 8, 38, 27},
	{3931, 1260.426757, 998.186218, -97.661567, 0.000000, -122.299987, 64.099983, 9, 38, 27},
	{3931, 1212.011962, 1013.100524, -96.754631, 0.000000, 0.000014, 0.000000, 10, 38, 27},
	{3931, 1193.982055, 1012.242187, -95.744636, 0.000000, 0.000000, 0.000000, 11, 38, 27},
	{3931, 1167.231689, 992.691772, -97.244628, 0.000000, 0.000000, 0.000000, 8, 38, 27},
	{3931, 1239.842163, 1020.351379, -100.454666, 0.000000, 0.000000, 0.000000, 9, 38, 27},
	{3930, 1245.157104, 998.390869, -96.821304, 0.000000, 0.000000, 0.000000, 10, 38, 27},
	{3930, 1261.037231, 1006.549682, -96.821304, -68.299987, 179.999954, 179.999908, 11, 38, 27},
	{3930, 1163.794799, 1011.816040, -96.488059, -111.699996, 0.000000, -55.200004, 8, 36, 25}
};

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

// AGRICULTOR
enum
{
	PLANT_TYPE_MEDICINE,     // VIDA
	PLANT_TYPE_CANNABIS,     // YOKSETIOXD
	PLANT_TYPE_CRACK         //CHALECO
}

enum seed_info_enum
{
	seed_info_TYPE,
	seed_info_PLANT_TYPE,
	seed_info_EXP,
	seed_info_NAME[24],
	seed_info_PRICE
};
new seed_info[][seed_info_enum] =
{
	{TYPE_LEGAL, PLANT_TYPE_MEDICINE, 0, "Aloe vera", 30},
	{TYPE_ILLEGAL, PLANT_TYPE_CANNABIS, 100, "Marihuana", 50},
	{TYPE_ILLEGAL, PLANT_TYPE_CRACK, 200, "Coca", 100}
};

enum plant_info_enum
{
	plant_info_SEEDS,
	plant_info_NAME[24]
};
new plant_info[][plant_info_enum] =
{
	{2, "Medicamento"},
	{4, "Marihuana"},
	{5, "Crack"}
};

#define MAX_PLANTS 4000
enum PLANTS_ENUM
{
	bool:plant_VALID,
	bool:plant_GROWING,
	bool:plant_INVISIBLE,
	Float:plant_GROWING_PROGRESS,
	plant_TYPE,
	plant_PLANTED_BY_ACCOUNT_ID,
	plant_PLANTED_BY_NAME[24],
	plant_OBJECT_ID,
	Text3D:plant_LABEL_ID,
	plant_EXPIRE_TIME,
	plant_TIMER
};
new PLANTS[MAX_PLANTS][PLANTS_ENUM];

enum
{
	OBJECT_TYPE_NONE,
	OBJECT_TYPE_PLANT
};

/* SYSTEM - GPS */
enum
{
	CHECKPOINT_TYPE_NONE,
	CHECKPOINT_TYPE_GPS,
	CHECKPOINT_TYPE_UNLOAD_TRUCK,
	CHECKPOINT_TYPE_FINISH_TRUCK,
	CHECKPOINT_TYPE_HARVEST,
	CHECKPOINT_TYPE_TRASH,
	CHECKPOINT_TYPE_FINISH_TRASH
	//CHECKPOINT_TYPE_CLEANER,
	//CHECKPOINT_TYPE_FINISH_CLEANER
};

#define MAX_PLAYER_GPS_SAVES 10
enum Player_GPS_Enum
{
	player_gps_VALID,
	player_gps_ID,
	player_gps_NAME[24],
	Float:player_gps_X,
	Float:player_gps_Y,
	Float:player_gps_Z,
	player_gps_WORLD,
	player_gps_INTERIOR
};
new PLAYER_GPS[MAX_PLAYERS][MAX_PLAYER_GPS_SAVES][Player_GPS_Enum];

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

// Barredor
/*new Float:CleanerRoutes[][] =
{   
	{1457.757202, -1317.514892, 12.954147},
	{1781.341674, -1286.330810, 13.039505},
	{2023.429809, -1263.945068, 23.387474},
	{2073.475097, -1112.507812, 23.891704},
	{2096.326171, -1388.665771, 23.398132},
	{2002.480834, -1459.313720, 12.966531},
	{1592.126586, -1444.566162, 12.954238},
	{1273.405883, -1408.938354, 12.599562},
	{1191.637939, -1303.108642, 12.958889}
};*/

//Camioneros
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

/* Basurero */

#define MAX_ROUTES  5
#define MAX_OBJECTS_PER_ROUTE 20

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

/* SYSTEM - PLAYERTEMP */
enum
{
	PED_STOPPED,
	PED_WALKING,
	PED_RUNNING,
	PED_SPRINTING,
	PED_BYCICLING
};

enum
{
	MECHANIC_OPTION_REPAIR,
	MECHANIC_OPTION_COLOR_1,
	MECHANIC_OPTION_COLOR_2,
	MECHANIC_OPTION_TUNING,
	MECHANIC_OPTION_PAINTJOB
};

//EnterExits
enum
{
	INTERIOR_NO_INFO,
	INTERIOR_BINCO,
	INTERIOR_SUBURBAN,
	INTERIOR_PROLAPS,
	INTERIOR_DIDIER_SACHS,
	INTERIOR_VICTIM,
	INTERIOR_ZIP,
	INTERIOR_247,
	INTERIOR_PIZZA,
	INTERIOR_CLUCKIN_BELL,
	INTERIOR_BURGER_SHOT,
	INTERIOR_BANK_LS,
	INTERIOR_BANK_SF,
	INTERIOR_BANK_LV,
	INTERIOR_CITY_HALL_LS,
	INTERIOR_UNITY_STATION,
	INTERIOR_TRUCK,
	INTERIOR_POLICE_LS,
	INTERIOR_POLICE_SF,
	INTERIOR_POLICE_LV,
	INTERIOR_ALHAMBRA,
	INTERIOR_POLICE_GARAGE,
	INTERIOR_HOSPITAL,
	INTERIOR_CLUB
};
enum Enter_Exits
{
	ee_ID,
	ee_NAME[32],
	
	ee_INTERIOR_TYPE,
	
	ee_INT_MAPICON,
	ee_INT_FREEZE,
	ee_INT_WORLD,
	ee_INT_INTERIOR,
	Float:ee_INT_X,
	Float:ee_INT_Y,
	Float:ee_INT_Z,
	Float:ee_INT_ANGLE,
	
	ee_EXT_MAPICON,
	ee_EXT_FREEZE,
	ee_EXT_WORLD,
	ee_EXT_INTERIOR,
	Float:ee_EXT_X,
	Float:ee_EXT_Y,
	Float:ee_EXT_Z,
	Float:ee_EXT_ANGLE,
	
	ee_TIME_OPEN,
	ee_TIME_CLOSE,
	
	ee_INT_MAPICON_ID,
	ee_EXT_MAPICON_ID,
	Text3D:ee_INT_LABEL_ID,
	Text3D:ee_EXT_LABEL_ID,
	
	
	ee_INT_PICKUP_ID,	/* No son pickups decorativos */
	ee_EXT_PICKUP_ID	/* Son pickups para identificar el id */
};

new ENTER_EXIT[][Enter_Exits] = // EE = EnterExits
{
	// Tiendas de ropa
	{-1, "Binco", INTERIOR_BINCO, -1, false, 0, 15, 207.744949, -111.073318, 1005.132812, 0.0,	45, false, 0, 0, 2244.484863, -1665.223510, 15.476562, 0.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Binco", INTERIOR_BINCO, -1, false, 1, 15, 207.744949, -111.073318, 1005.132812, 0.0,	45, false, 0, 0, 2102.4263, 2257.5750, 11.0234, 273.9107, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // binco lv
	{-1, "Binco", INTERIOR_BINCO, -1, false, 2, 15, 207.744949, -111.073318, 1005.132812, 0.0,	45, false, 0, 0, 1656.5707, 1733.1418, 10.8281, 91.4768, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // binco lv
	{-1, "Binco", INTERIOR_BINCO, -1, false, 3, 15, 207.744949, -111.073318, 1005.132812, 0.0,	45, false, 0, 0, -2374.1768, 910.1226, 45.4317, 88.0863, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // binco sf
	{-1, "SubUrban", INTERIOR_SUBURBAN, -1, false, 0, 1, 203.906326, -50.494247, 1001.804687, 0.0,	45, false, 0, 0, 2112.835205, -1211.456665, 23.962865, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "SubUrban", INTERIOR_SUBURBAN, -1, false, 1, 1, 203.906326, -50.494247, 1001.804687, 0.0,	45, false, 0, 0, 2779.4438, 2453.6345, 11.0625, 133.9879, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // su lv
	{-1, "SubUrban", INTERIOR_SUBURBAN, -1, false, 2, 1, 203.906326, -50.494247, 1001.804687, 0.0,	45, false, 0, 0, -2490.3079, -28.9528, 25.6172, 87.1329, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // su sf
	{-1, "ProLaps", INTERIOR_PROLAPS, -1, false, 0, 3, 206.995925, -140.021163, 1003.507812, 0.0,	45, false, 0, 0, 499.498168, -1360.616088, 16.368682, 340.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Didier Sachs", INTERIOR_DIDIER_SACHS, -1, false, 0, 14, 204.348281, -168.678985, 1000.523437, 0.0,	45, false, 0, 0, 453.858032, -1478.098632, 30.813968, 111.110641, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Victim", INTERIOR_VICTIM, -1, false, 0, 5, 227.350250, -8.188652, 1002.210937, 90.0,	45, false, 0, 0, 461.541320, -1500.892333, 31.049194, 98.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Victim", INTERIOR_VICTIM, -1, false, 1, 5, 227.350250, -8.188652, 1002.210937, 90.0,	45, false, 0, 0, -1694.8934, 951.5375, 24.8906, 138.3028, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // victim sf
	{-1, "Victim", INTERIOR_VICTIM, -1, false, 2, 5, 227.350250, -8.188652, 1002.210937, 90.0,	45, false, 0, 0, 2802.7219, 2430.3391, 11.0625, 133.3612, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // victim lv
	{-1, "ZIP", INTERIOR_ZIP, -1, false, 0, 18, 161.401184, -96.887367, 1001.804687, 0.0,	45, false, 0, 0, 1456.611816, -1137.818969, 23.961400, 215.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "ZIP", INTERIOR_ZIP, -1, false, 1, 18, 161.401184, -96.887367, 1001.804687, 0.0,	45, false, 0, 0, 2571.9072, 1904.4851, 11.0234, 191.6232, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // zip lv
	{-1, "ZIP", INTERIOR_ZIP, -1, false, 2, 18, 161.401184, -96.887367, 1001.804687, 0.0,	45, false, 0, 0, 2090.3845, 2224.2493, 11.0234, 179.2598, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // zip lv
	{-1, "ZIP", INTERIOR_ZIP, -1, false, 3, 18, 161.401184, -96.887367, 1001.804687, 0.0,	45, false, 0, 0, -1882.4941, 866.1361, 35.1719, 135.4828, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // zip sf
	// 24/7
	{-1, "24/7", INTERIOR_247, -1, false, 0, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 1352.314941, -1758.961425, 13.507812, 0.0,	0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "24/7", INTERIOR_247, -1, false, 1, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 1833.540771, -1842.542724, 13.578125, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "24/7", INTERIOR_247, -1, false, 2, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 1315.453247, -897.967102, 39.578125, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "24/7", INTERIOR_247, -1, false, 3, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 1000.317199, -919.933349, 42.328125, 105.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "24/7", INTERIOR_247, -1, false, 4, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2117.6494, 897.1806, 11.1797, 12.1038, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 5, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2637.5356, 1129.2190, 11.1797, 182.5185, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 6, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2546.6067, 1972.2355, 10.8203, 180.0468, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 7, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2452.4578, 2064.7595, 10.8203, 181.0483, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 8, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2194.5137, 1991.1290, 12.2969, 91.8167, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 9, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2097.4353, 2224.2637, 11.0234, 180.5131, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 10, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 1937.4686, 2307.2776, 10.8203, 92.3837, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 11, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2188.1104, 2469.9355, 11.2422, 272.2827, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 12, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2150.9756, 2734.2964, 11.1763, 3.1420, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 13, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2884.8887, 2453.7634, 11.0690, 224.2287, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 14, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, -1676.0208, 432.0192, 7.1797, 223.0368, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 sf
	{-1, "24/7", INTERIOR_247, -1, false, 15, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, -2419.8621, 969.9724, 45.2969, 271.3646, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 sf
	{-1, "24/7", INTERIOR_247, -1, false, 16, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, -2442.8604, 755.0207, 35.1719, 179.8825, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 sf
	// WSP
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 0, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 2105.234619, -1806.479614, 13.554687, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 1, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 1366.856079, 248.451507, 19.566932, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 2, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 2333.892333, 74.830787, 26.620975, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 3, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 2637.8176, 1849.6595, 11.0234, 91.6690, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // ps lv
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 4, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 2540.3069, 2150.0823, 10.8203, 92.0697, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // ps lv
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 5, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 2469.5881, 2124.7515, 10.8203, 2.2244, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // ps lv
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 6, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 2083.4851, 2224.2705, 11.0234, 181.7665, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // ps lv
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 7, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 2351.9446, 2532.8774, 10.8203, 184.0101, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // ps lv
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 8, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 2756.3547, 2477.1909, 11.0625, 140.5680, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // ps lv
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 9, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, -1808.3300, 945.7053, 24.8906, 219.7702, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // ps sf
	// CB
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 0, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, 2419.926025, -1509.024780, 24.000000, 270.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 1, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, 2397.772949, -1898.847778, 13.546875, 0.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 2, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, 928.553466, -1352.848876, 13.343750, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 3, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, 2637.8179, 1671.8778, 11.0234, 91.0423, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // cb lv
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 4, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, 2393.0376, 2042.6967, 10.8203, 4.9767, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // cb lv
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 5, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, 2102.3667, 2228.7712, 11.0234, 270.4406, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // cb lv
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 6, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, 2838.4988, 2407.5911, 11.0690, 222.9754, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // cb lv
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 7, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, -2672.3337, 258.6855, 4.6328, 0.1230, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // cb sf
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 8, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, -2671.8418, 258.2193, 4.6328, 4.9983, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // cb sf
	// BS
	{-1, "Burger Shot", INTERIOR_BURGER_SHOT, -1, false, 0, 10, 362.869354, -75.153747, 1001.507812, 315.0,	10, false, 0, 0, 810.715270, -1616.163330, 13.546875, 270.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Burger Shot", INTERIOR_BURGER_SHOT, -1, false, 1, 10, 362.869354, -75.153747, 1001.507812, 315.0,	10, false, 0, 0, 1199.272216, -918.372253, 43.121376, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Burger Shot", INTERIOR_BURGER_SHOT, -1, false, 2, 10, 362.869354, -75.153747, 1001.507812, 315.0,	10, false, 0, 0, 2478.7559, 2034.7145, 11.0625, 112.9093, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // bs lv
	{-1, "Burger Shot", INTERIOR_BURGER_SHOT, -1, false, 3, 10, 362.869354, -75.153747, 1001.507812, 315.0,	10, false, 0, 0, 2366.6165, 2071.0725, 10.8203, 88.0179, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // bs lv
	{-1, "Burger Shot", INTERIOR_BURGER_SHOT, -1, false, 4, 10, 362.869354, -75.153747, 1001.507812, 315.0,	10, false, 0, 0, 1872.5840, 2071.9214, 11.0625, 270.1482, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // bs lv
	{-1, "Burger Shot", INTERIOR_BURGER_SHOT, -1, false, 5, 10, 362.869354, -75.153747, 1001.507812, 315.0,	10, false, 0, 0, 2169.7883, 2795.8948, 10.8203, 272.9245, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // bs lv
	{-1, "Burger Shot", INTERIOR_BURGER_SHOT, -1, false, 6, 10, 362.869354, -75.153747, 1001.507812, 315.0,	10, false, 0, 0, -2336.4749, -166.7181, 35.5547, 270.8090, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // bs sf
	{-1, "Burger Shot", INTERIOR_BURGER_SHOT, -1, false, 7, 10, 362.869354, -75.153747, 1001.507812, 315.0,	10, false, 0, 0, -1912.3065, 828.4004, 35.1852, 317.1945, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // bs sf
	// OTHER
	{-1, P_BANK, INTERIOR_CITY_HALL_LS, -1, true, 20, 20, 1807.021240, -1393.364135, 2770.660156, 177.306365, 37, false, 0, 0, 1571.468627, -1336.893188, 16.484375, 0.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Sanitary Andreas", INTERIOR_UNITY_STATION, -1, false, 0, 3, 1494.416015, 1303.681884, 1093.289062, 0.0, -1, false, 0, 0, 1664.634033, -2185.537353, 13.546875, 270.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, P_TRUCKS, INTERIOR_TRUCK, -1, true, 25, 18, 1297.457031, -61.437820, 1002.498046, 180.0, -1, false, 0, 0, 2509.533935, -2637.530761, 13.645265, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, P_SAPD, INTERIOR_POLICE_LS, -1, true, 0, 6, 1881.801635, -1688.519531, 5216.709960, 130.0, 30, false, 0, 0, 1555.400390, -1675.611694, 16.195312, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, P_GARAGE, INTERIOR_POLICE_GARAGE, -1, true, 0, 6, 1881.341674, -1727.080688, 5216.709960, 270.594818, -1, false, 0, 0, 1568.651977, -1690.080688, 6.218750, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	//{-1, "Alhambra Club", INTERIOR_ALHAMBRA, -1, false, 0, 17, 493.487731, -24.662528, 1000.679687, 0.0, 48, false, 0, 0, 1836.876586, -1682.407104, 13.329626, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Tecno", INTERIOR_NO_INFO, -1, true, 1, 17, 1715.986572, -1254.442993, 471.174316, 269.257873, 42, false, 0, 0, 1738.542846, -1269.991577, 13.543532, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 2, 17, 387.479644, 2324.503906, 1889.583374, 88.438690, 38, false, 0, 0, 2233.164306, -1333.295043, 23.981561, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 3, 17, 387.479644, 2324.503906, 1889.583374, 88.438690, 38, false, 0, 0, 2490.7651, 918.6208, 11.0234, 95.5125, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia lv
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 4, 17, 387.479644, 2324.503906, 1889.583374, 88.438690, 38, false, 0, 0, 2519.0901, 2033.3397, 11.1719, 77.3339, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia lv
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 5, 17, 387.479644, 2324.503906, 1889.583374, 88.438690, 38, false, 0, 0, 2225.2419, 2522.4724, 11.0222, 182.3552, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia lv
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 6, 17, 387.479644, 2324.503906, 1889.583374, 88.438690, 38, false, 0, 0, 1455.4608, 750.8949, 11.0234, 94.6260, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia lv
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 7, 17, 387.479644, 2324.503906, 1889.583374, 88.438690, 38, false, 0, 0, -2664.6973, -2.3037, 6.1328, 89.0111, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia sf
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 8, 17, 387.479644, 2324.503906, 1889.583374, 88.438690, 38, false, 0, 0, -1989.4664, 1117.8735, 54.4688, 271.7057, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia sf
	//{-1, P_D_BM, INTERIOR_NO_INFO, -1, true, 11, 17, 2319.062011, -1786.475708, 1600.751953, 90.0, 23, false, 0, 0, 2071.894287, -1551.255737, 13.424154, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, P_W_BM, INTERIOR_NO_INFO, -1, true, 21, 20, 2140.289062, -1172.987060, -10.893062, 350.0, 23, false, 0, 0, 2355.609375, -1039.150268, 54.148437, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, P_W_BM, INTERIOR_NO_INFO, -1, true, 31, 21, 2140.289062, -1172.987060, -10.893062, 350.0, 23, false, 0, 0, 2494.093261, -1464.236328, 24.025127, 360.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Mina", INTERIOR_NO_INFO, -1, true, 36, 25, 1147.865356, 1001.796081, -99.214622, 273.832519, 11, false, 0, 0, 509.152374, -723.324951, 19.869243, 340.774505, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Secci�n B", INTERIOR_NO_INFO, -1, true, 37, 26, 1988.257446, 1204.595825, -63.139907, 268.650756, 56, false, 36, 25, 1270.046142, 1000.668884, -99.214637, 81.757308, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Secci�n C", INTERIOR_NO_INFO, -1, true, 38, 27, 2546.433105, 1924.534423, -58.649192, 265.830688, 56, false, 37, 26, 2067.543212, 1201.233398, -61.074184, 85.059127, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "MFB", INTERIOR_NO_INFO, -1, true, 0, 28, 3854.231933, -1265.252319, 7547.983398, 188.315292, -1, false, 0, 0, 2770.574462, -1628.717163, 12.177460, 358.490142, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Prost�bulo", INTERIOR_CLUB, -1, false, 0, 3, 1212.160522, -26.097007, 1000.953125, 180.0, 21, false, 0, 0, 693.761047, 1967.498168, 5.539062, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Prost�bulo", INTERIOR_CLUB, -1, false, 1, 3, 1212.160522, -26.097007, 1000.953125, 180.0, 21, false, 0, 0, 1145.013916,-1131.447998, 23.828125, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Prost�bulo", INTERIOR_CLUB, -1, false, 2, 3, 1212.160522, -26.097007, 1000.953125, 180.0, 21, false, 0, 0, 2421.501953,-1219.768432, 25.527839, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Maik Santander", INTERIOR_CLUB, -1, false, 6, 5, 1267.663208, -781.323242, 1091.906250, 180.0, -1, false, 0, 0, -245.578720, -2193.103271, 29.839702, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Maik Santander", INTERIOR_CLUB, -1, false, 174, 5, 1267.663208, -781.323242, 1091.906250, 180.0, -1, false, 0, 0, 1456.5785, 2773.6423, 10.8203, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Club de la pelea", INTERIOR_NO_INFO, -1, false, 0, 16, -14.497008, 100.967079, 1101.521118, 180.0, -1, false, 0, 0, 950.341247, -987.135864, 38.743835, 322.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Osborn", INTERIOR_NO_INFO, -1, true, 0, 29, 887.343566, 1918.198364, -88.974365, 93.182411, -1, false, 0, 0, -2517.1223, -664.4894, 139.3531, 358.490142, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Estadio", INTERIOR_NO_INFO, -1, true, 1336, 0, 2684.587890, -1733.565185, 424.386718, 180.0, -1, false, 0, 0, 2781.461181, -1813.566162, 11.843750, 211.490142, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	//{-1, "Moriarty Luxury Bar", INTERIOR_NO_INFO, -1, true, 0, 64, 2627.9360, 490.5309, 2621.2078, 173.315292, -1, false, 0, 0, 2851.3330, -1532.3297, 11.0991, 271.490142, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "TFC", INTERIOR_NO_INFO, -1, true, 0, 55, 436.9655, -996.6303, 931.0529, -90.0, -1, false, 0, 0, 437.3256, -999.9439, 93.1982, 92.18, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "DPT", INTERIOR_CLUB, -1, false, 264, 5, 1267.663208, -781.323242, 1091.906250, 180.0, -1, false, 0, 0, 1132.5565, -2034.1417, 69.1477, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Hospital", INTERIOR_HOSPITAL, -1, true, 2, 3, -204.522659, -1735.630004, 675.768737, 181.129348, 22, false, 0, 0, 1172.832763, -1323.269531, 15.400051, 270.0	, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}
};

enum enum_JAIL_POSITIONS
{
	jail_INT,
	Float:jail_X,
	Float:jail_Y,
	Float:jail_Z,
	Float:jail_ANGLE,
	jail_INTERIOR
};
new JAIL_POSITIONS[][enum_JAIL_POSITIONS] =
{
	{INTERIOR_POLICE_LS, 1899.122192, -1757.699584, 5218.986816, 180.0, 6}, //jaills
	{INTERIOR_POLICE_SF, 1899.122192, -1757.699584, 5218.986816, 180.0, 6}, //jailsf
	{INTERIOR_POLICE_LV, 1899.122192, -1757.699584, 5218.986816, 180.0, 6} //jaillv
};

new Float:MECHANIC_POSITIONS[][] =
{
	{1048.312622, -923.895812, 43.018077},
	{1058.781250, -890.199401, 43.618721},
	{1053.702758, -890.891235, 43.494247},
	{1049.278198, -899.481567, 43.382476},
	{1044.121948, -900.377258, 43.248786},
	{1038.639160, -900.513549, 43.121448},
	{1033.095703, -901.057678, 42.981224}
};


/*enum BUY_PROPERTIES_SITES_INFO
{
	site_INTERIOR_TYPE,
	Float:site_X,
	Float:site_Y,
	Float:site_Z,
	site_WORLD,
	site_INTERIOR
};
new BUY_PROPERTIES_SITES[][BUY_PROPERTIES_SITES_INFO] =
{
	{INTERIOR_BANK_LS, 1236.417968,-1428.489990,1992.564575, 5, 5},
	{INTERIOR_BANK_SF, 1236.417968,-1428.489990,1992.564575, 10, 10},
	{INTERIOR_BANK_LV, 1236.417968,-1428.489990,1992.564575, 15, 15}
};*/

enum
{
	PRODUCT_TYPE_NONE,
	PRODUCT_TYPE_FOOD,
	PRODUCT_TYPE_PHONE,
	PRODUCT_TYPE_GPS,
	PRODUCT_TYPE_PHONE_RESOLVER
};
enum Supermarket_Enum
{
	product_TYPE,
	product_NAME[24],
	product_PRICE,
	Float:product_HUNGRY,
	Float:product_THIRST,
	product_DRUNK
};
new Supermarket_Product_List[][Supermarket_Enum] =
{
	{PRODUCT_TYPE_PHONE, NAME_PHONE, 350, 0.0, 0.0, 0},
	{PRODUCT_TYPE_PHONE_RESOLVER, NAME_PHONE_R, 200, 0.0, 0.0, 0},
	{PRODUCT_TYPE_GPS, "GPS", 300, 0.0, 0.0, 0},
	{PRODUCT_TYPE_FOOD, "Botella de agua", 80, 0.0, 25.0, 0},
	{PRODUCT_TYPE_FOOD, "Sprunk", 40, 0.0, 12.0, 0},
	//{PRODUCT_TYPE_FOOD, "Lata de refresco cola", 30, 0.0, 10.0, 0},
	{PRODUCT_TYPE_FOOD, "Barrita energ�tica", 80, 15.0, 0.0, 0},
	//{PRODUCT_TYPE_FOOD, "Porci�n de pizza", 60, 20.0, 0.0, 0},
	//{PRODUCT_TYPE_FOOD, "Ensalada", 50, 15.0, 2.0, 0},
	{PRODUCT_TYPE_FOOD, "Leche", 70, 25.0, 25.0, 0},
	//{PRODUCT_TYPE_FOOD, "S�ndwich de milanesa", 45, 10.0, 2.0, 0},
	//{PRODUCT_TYPE_FOOD, "Choripan", 45, 10.0, 2.0, 0},
	{PRODUCT_TYPE_FOOD, "Galletas", 20, 8.0, 2.0, 0},
	{PRODUCT_TYPE_FOOD, "Caramelos masticables", 1, 2.0, 0.0, 0},
	{PRODUCT_TYPE_FOOD, "Chicle bubbaloo", 3, 2.0, 0.0, 0},
	{PRODUCT_TYPE_FOOD, "Cerveza", 40, 0.0, 3.0, 1000},
	//{PRODUCT_TYPE_FOOD, "Vodka", 80, 0.0, 3.0, 2500},
	{PRODUCT_TYPE_FOOD, "Vino", 80, 0.0, 3.0, 2500}
	//{PRODUCT_TYPE_FOOD, "Orina de toro", 3000, 0.0, 40.0, 9500},
	//{PRODUCT_TYPE_FOOD, "Whisky", 200, 0.0, 3.0, 3000}
};

enum Clothing_Shop_Info
{
	clothing_shop_INTERIOR_TYPE,
	clothing_shop_NAME[24],
	Float:clothing_shop_X,
	Float:clothing_shop_Y,
	Float:clothing_shop_Z,
	Float:clothing_shop_ANGLE,
	clothing_shop_INTERIOR
};

new Clothing_Shop_Positions[][Clothing_Shop_Info] =
{
	{INTERIOR_BINCO, "Binco", 207.733657, -100.633468, 1005.257812, 180.0, 15}, //Binco
	{INTERIOR_SUBURBAN, "SubUrban", 203.905395, -43.450450, 1001.804687, 180.0, 1}, //SubUrban
	{INTERIOR_PROLAPS, "ProLaps", 207.049148, -129.177581, 1003.507812, 180.0, 3}, //prolaps
	{INTERIOR_DIDIER_SACHS, "Didier Sachs", 204.348281, -159.493728, 1000.523437, 180.0, 14}, //Didier
	{INTERIOR_VICTIM, "Victim", 206.374328, -7.241514, 1001.210937, 270.0, 5}, //Victim
	{INTERIOR_ZIP, "ZIP", 161.443634, -83.589271, 1001.804687, 180.0, 18} //Zip
};

enum Fast_Food_Info
{
	fast_food_INTERIOR_TYPE,
	fast_food_NAME[24],
	Float:fast_food_X,
	Float:fast_food_Y,
	Float:fast_food_Z,
	fast_food_INTERIOR
};
new Fast_Food_Positions[][Fast_Food_Info] =
{
	{INTERIOR_BURGER_SHOT, "Burger Shot", 375.913238, -67.435272, 1001.507812, 10}, // BurgerShot
	{INTERIOR_PIZZA, "Well Stacked Pizza", 375.254730, -118.804710, 1001.499511, 5}, //Pizza
	{INTERIOR_CLUCKIN_BELL, "Cluckin Bell", 368.757904, -6.018908, 1001.851562, 9} //Cluckin Bell
};

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

#define MAX_BANK_TRANSACTIONS_DIALOG 5
enum
{
	BANK_TRANSACTION_WITHDRAW,
	BANK_TRANSACTION_DEPOSIT,
	BANK_TRANSACTION_TRANSFER_SENT,
	BANK_TRANSACTION_TRANSFER_RECE,
	BANK_TRANSACTION_CREATE_ACCOUNT,
	BANK_TRANSACTION_BUY_PROPERTY,
	BANK_TRANSACTION_SOLD_PROPERTY,
	BANK_TRANSACTION_BUY_VEHICLE,
	BANK_TRANSACTION_SOLD_VEHICLE
};
enum Bank_Interior_Info
{
	bank_INTERIOR_TYPE,
	Float:bank_X,
	Float:bank_Y,
	Float:bank_Z,
	bank_WORLD,
	bank_INTERIOR
};
/*new Bank_Interior_Positions[][Bank_Interior_Info] =
{
	{INTERIOR_BANK_LS, 1239.006958,-1426.057983,1992.564575, 5, 5},
	{INTERIOR_BANK_SF, 1239.006958,-1426.057983,1992.564575, 10, 10},
	{INTERIOR_BANK_LV, 1239.006958,-1426.057983,1992.564575, 15, 15}
};*/

enum Food_Info
{
	food_NAME[24],
	food_PRICE,
	Float:food_HUNGRY,
	Float:food_THIRST,
};
new PIZZA_FOOD[][Food_Info] =
{
	{"Pizza de verduras", 25, 10.0, -0.1},
	{"Pizza de jam�n y queso", 60, 16.0, -0.1},
	{"Pizza barbacoa", 40, 15.0, -0.1},
	{"Pizza 4 quesos", 55, 14.0, -0.1},
	{"Ensalada", 20, 10.0, 5.0},
	{"Sprunk", 30, 0.0, 12.0},
	{"Agua", 30, 0.0, 19.0}
};
new BURGER_SHOT_FOOD[][Food_Info] =
{
	{"Hamburguesa normal", 60, 16.0, -0.1},
	{"Hamburguesa con pollo", 80, 10.0, -0.1},
	{"Hamburguesa vegana", 80, 10.0, -0.1},
	{"Hamburguesa especial", 60, 12.0, -3.0},
	{"Ensalada", 20, 10.0, 5.0},
	{"Sprunk", 30, 0.0, 12.0},
	{"Agua", 30, 0.0, 19.0}
};
new CLUCKIN_BELL_FOOD[][Food_Info] =
{
	{"Alitas de pollo", 60, 16.0, -0.1},
	{"Papas fritas", 80, 18.0, -2.0},
	{"Pato asado", 80, 18.0, -2.0},
	{"Pollo al horno", 80, 18.0, -2.0},
	{"Ensalada", 20, 10.0, 5.0},
	{"Sprunk", 30, 0.0, 12.0},
	{"Agua", 30, 0.0, 19.0}
};

new Toys_Bones[][24] =
{
	{"Espalda"},
	{"Cabeza"},
	{"Brazo izquierdo"},
	{"Brazo derecho"},
	{"Mano izquierda"},
	{"Mano derecha"},
	{"Muslo izquierdo"},
	{"Muslo derecho"},
	{"Pie izquierdo"},
	{"Pie derecho"},
	{"Pantorrilla derecha"},
	{"Pantorrilla izquierda"},
	{"Antebrazo izquierdo"},
	{"Antebrazo derecho"},
	{"Hombro izquierdo"},
	{"Hombro derecho"},
	{"Cuello"},
	{"Boca"}
};

enum Toys_Info
{
	shop_toy_model[24],
	shop_toy_modelid,
	shop_toy_price_base,
	shop_toy_price,
}
new Toys_Shop[][Toys_Info] =
{
	// Halloween
	#if defined HALLOWEEN_MODE
		{"Caldera", 19527, 3000, 0},
		{"Bruja", 19528, 3000, 0},
		{"Diablo", 11704, 3000, 0},
		{"Calabaza", 19320, 3000, 0},
	#endif
	#if defined CHRISTMAS_MODE
		{"Gorro JOJO", 19064, 3000, 0},
		{"HappyXmas", 19066, 3000, 0},
		{"Arbol", 19076, 10000, 0},
		{"XmaxBox1", 19054, 3500, 0},
		{"XmaxBox2", 19055, 3500, 0},
		{"XmaxBox3", 19056, 3500, 0},
		{"XmaxBox4", 19058, 3500, 0},
		{"XmaxBox5", 19057, 3500, 0},
	#endif
	// Normal
	{"motorcyclehelmet2", 18976, 2000, 0},
	{"motorcyclehelmet3", 18977, 500, 0},
	{"motorcyclehelmet4", 18978, 500, 0},
	{"motorcyclehelmet5", 18979, 500, 0},
	{"sillyhelmet2", 19114, 100, 0},
	{"sillyhelmet3", 19115, 200, 0},
	{"plainhelmet1", 19116, 75, 0},
	{"plainhelmet2", 19117, 75, 0},
	{"plainhelmet3", 19118, 75, 0},
	{"plainhelmet4", 19119, 75, 0},
	{"plainhelmet5", 19120, 75, 0},
	{"glassestype1", 19006, 2000, 0},
	{"glassestype2", 19007, 2000, 0},
	{"glassestype3", 19008, 2000, 0},
	{"glassestype4", 19009, 2000, 0},
	{"glassestype5", 19010, 2000, 0},
	{"glassestype6", 19011, 2000, 0},
	{"glassestype7", 19012, 2000, 0},
	{"glassestype8", 19013, 2000, 0},
	{"glassestype9", 19014, 2000, 0},
	{"glassestype10", 19015, 2000, 0},
	{"glassestype11", 19016, 2000, 0},
	{"glassestype12", 19017, 2000, 0},
	{"glassestype13", 19018, 2000, 0},
	{"glassestype14", 19019, 2000, 0},
	{"glassestype15", 19020, 2000, 0},
	{"glassestype16", 19021, 2000, 0},
	{"glassestype17", 19022, 2000, 0},
	{"glassestype18", 19023, 2000, 0},
	{"glassestype19", 19024, 2000, 0},
	{"glassestype20", 19025, 2000, 0},
	{"glassestype21", 19026, 2000, 0},
	{"glassestype22", 19027, 2000, 0},
	{"glassestype23", 19028, 2000, 0},
	{"glassestype24", 19029, 2000, 0},
	{"glassestype25", 19030, 2000, 0},
	{"glassestype26", 19031, 2000, 0},
	{"glassestype27", 19032, 2000, 0},
	{"glassestype28", 19033, 2000, 0},
	{"glassestype29", 19034, 2000, 0},
	{"glassestype30", 19035, 2000, 0},
	{"policeglasses1", 19138, 2300, 0},
	{"policeglasses2", 19139, 2300, 0},
	{"policeglasses3", 19140, 2300, 0},
	{"crewna1", 18891, 600, 0},
	{"crewna2", 18892, 600, 0},
	{"crewna3", 18893, 600, 0},
	{"crewna4", 18894, 600, 0},
	{"crewna5", 18895, 600, 0},
	{"crewna6", 18896, 600, 0},
	{"crewna7", 18897, 600, 0},
	{"crewna8", 18898, 600, 0},
	{"crewna9", 18899, 600, 0},
	{"crewna10", 18900, 600, 0},
	{"crewna11", 18901, 600, 0},
	{"crewna12", 18902, 600, 0},
	{"crewna13", 18903, 600, 0},
	{"crewna14", 18904, 600, 0},
	{"crewna15", 18905, 600, 0},
	{"crewna16", 18906, 600, 0},
	{"crewna17", 18907, 600, 0},
	{"crewna18", 18908, 600, 0},
	{"crewna19", 18909, 600, 0},
	{"crewna20", 18910, 600, 0},
	{"mask1", 18911, 500, 0},
	{"mask2", 18912, 500, 0},
	{"mask3", 18913, 500, 0},
	{"mask4", 18914, 500, 0},
	{"mask5", 18915, 500, 0},
	{"mask6", 18916, 500, 0},
	{"mask7", 18917, 500, 0},
	{"mask8", 18918, 500, 0},
	{"mask9", 18919, 500, 0},
	{"mask10", 18920, 500, 0},
	{"watchtype1", 19039, 3000, 0},
	{"watchtype2", 19040, 3000, 0},
	{"watchtype3", 19041, 3000, 0},
	{"watchtype4", 19042, 3000, 0},
	{"watchtype5", 19043, 3000, 0},
	{"watchtype6", 19044, 3000, 0},
	{"watchtype7", 19045, 3000, 0},
	{"watchtype8", 19046, 3000, 0},
	{"watchtype9", 19047, 3000, 0},
	{"watchtype10", 19048, 3000, 0},
	{"watchtype11", 19049, 3000, 0},
	{"watchtype12", 19050, 3000, 0},
	{"watchtype13", 19051, 3000, 0},
	{"watchtype14", 19052, 3000, 0},
	{"watchtype15", 19053, 3000, 0},
	{"beret1", 18921, 1150, 0},
	{"beret2", 18922, 1150, 0},
	{"beret3", 18923, 1150, 0},
	{"beret4", 18924, 1150, 0},
	{"beret5", 18925, 1150, 0},
	{"cj_tommy_hat", 2052, 200, 0},
	{"cj_jerry_hat", 2053, 200, 0},
	{"cj_capy_hat", 2054, 2000, 0},
	{"hardhat1", 18638, 300, 0},
	{"hardhat2", 19093, 450, 0},
	{"hardhat3", 19160, 450, 0},
	{"blackhat1", 18639, 600, 0},
	{"hat1", 18926, 650, 0},
	{"hat2", 18927, 650, 0},
	{"hat3", 18928, 650, 0},
	{"hat4", 18929, 650, 0},
	{"hat5", 18930, 650, 0},
	{"hat6", 18931, 650, 0},
	{"hat7", 18932, 650, 0},
	{"hat8", 18933, 650, 0},
	{"hat9", 18934, 650, 0},
	{"hat10", 18935, 650, 0},
	{"hatboater1", 18944, 800, 0},
	{"hatboater2", 18945, 800, 0},
	{"hatboater3", 18946, 800, 0},
	{"hatbowler1", 18947, 1200, 0},
	{"hatbowler2", 18948, 1200, 0},
	{"hatbowler3", 18949, 1200, 0},
	{"hatbowler4", 18950, 1200, 0},
	{"hatbowler5", 18951, 1200, 0},
	{"hatbowler6", 19488, 1200, 0},
	{"cowboyhat1", 19095, 1150, 0},
	{"cowboyhat2", 18962, 1150, 0},
	{"cowboyhat3", 19096, 1150, 0},
	{"cowboyhat4", 19097, 1150, 0},
	{"cowboyhat5", 19098, 1150, 0},
	{"hatman1", 18967, 650, 0},
	{"hatman2", 18968, 650, 0},
	{"hatman3", 18969, 650, 0},
	{"hatman3", 18969, 650, 0},
	{"hattiger1", 18970, 1500, 0},
	{"hatcool1", 18971, 1500, 0},
	{"hatcool2", 18972, 1500, 0},
	{"hatcool3", 18973, 1500, 0},
	{"hoodyhat1", 19067, 500, 0},
	{"hoodyhat2", 19068, 500, 0},
	{"hoodyhat3", 19069, 500, 0},
	{"policehat1", 19161, 2500, 0},
	{"policehat2", 19162, 2500, 0},
	{"tophat01", 19352, 700, 0},
	{"tophat02", 19487, 700, 0},
	{"pilothat01", 19520, 3000, 0},
	{"policehat01", 19521, 3000, 0},
	{"strawhat1", 19553, 450, 0},
	{"pizzahat1", 19558, 100, 0},
	{"hikerbackpack1", 19559, 600, 0},
	{"hair1", 19517, 1000, 0},
    {"hair2", 19516, 1000, 0},
    {"hair3", 19077, 1000, 0},
    {"hair4", 18975, 1000, 0},
    {"cluckinbellhat", 19137, 2500, 0},
    {"firehat01", 19330, 3000, 0},
    {"firehat02", 19331, 3000, 0},
    {"burgershothat1", 19094, 2000, 0},
    {"captruker1", 18961, 1000, 0},
    {"bassguitar01", 19317, 2100, 0},
    {"bassguitar02", 19318, 2100, 0},
    {"boxinghelmet01", 18952, 1500, 0},
    {"hockeymas1", 19036, 1700, 0},
    {"theparrot1", 19078, 7500, 0},
    {"armour", 19515, 7000, 0},
    {"glimpmask1", 19163, 2500, 0},
    {"headphones02", 19422, 1500, 0},
    {"Disfraz de Arbusto", 805, 40000, 0},
    {"Disfraz de Caja", 1271, 40000, 0},
    {"Disfraz de Correo", 1291, 40000, 0},
    {"Disfraz de Basura", 1328, 40000, 0},
    {"Hamburguesita en hd", 2703, 6000, 0},
    {"parachute", 371, 2200, 0}
};

new 
Binco_Shop_Male_Skins[][] =
{
	/* BINCO - HOMBRE */
	{4, 75      , 0},
	{5, 75      , 0},
	{6, 90      , 0},
	{7, 80      , 0},
	{21, 121    , 0},
	{44, 65     , 0},
	{47, 119    , 0},
	{101, 149   , 0},
	{127, 89    , 0},
	{128, 25    , 0},
	{270, 200   , 0},
	{271, 200   , 0},
	{269, 200   , 0},
	{292, 200   , 0},
	{293, 200   , 0},
	{134, 25    , 0},
	{135, 25    , 0},
	{137, 19    , 0},
	{160, 55    , 0},
	{161, 68    , 0},
	{168, 39    , 0},
	{176, 79    , 0},
	{177, 65    , 0},
	{179, 110   , 0},
	{184, 150   , 0},
	{188, 160   , 0},
	{200, 15    , 0},
	{212, 30    , 0},
	{230, 10    , 0},
	{258, 69    , 0},
	{259, 69    , 0},
	{262, 50    , 0},
	{86, 70		, 0},
	{102, 100 , 0},
	{103, 100 , 0},
	{104, 100 , 0},
	{105, 100 , 0},
	{106, 100 , 0},
	{107, 100 , 0},
	{108, 100 , 0},
	{109, 100 , 0},
	{110, 100 , 0},
	{111, 100 , 0},
	{112, 100 , 0},
	{113, 100 , 0},
	{114, 100 , 0},
	{115, 100 , 0},
	{116, 100 , 0},
	{117, 100 , 0},
	{118, 100 , 0},
	{119, 100 , 0},
	{120, 100 , 0},
	{121, 100 , 0},
	{122, 100 , 0},
	{123, 100 , 0},
	{124, 100 , 0},
	{125, 100 , 0},
	{126, 100 , 0}
},

Binco_Shop_Female_Skins[][] =
{
	/* BINCO - MUJER */
	{13, 120   , 0},
	{41, 59    , 0},
	{56, 190   , 0},
	{65, 110   , 0},
	{69, 100   , 0},
	{75, 50    , 0},
	{89, 69    , 0},
	{151, 89   , 0},
	{152, 3000 , 0},
	{207, 500  , 0},
	{226, 120  , 0},
	{298, 900  , 0}
},

Suburban_Shop_Male_Skins[][] =
{
	/* SUBURBAN - HOMBRE */
	{2, 100   , 0},
	{3, 140   , 0},
	{20, 190  , 0},
	{23, 190  , 0},
	{24, 190  , 0},
	{25, 190  , 0},
	{43, 180  , 0},
	{48, 145  , 0},
	{60, 250  , 0},
	{100, 300 , 0},
	{112, 200 , 0},
	{119, 49  , 0},
	{143, 199 , 0},
	{180, 150 , 0},
	{183, 100 , 0},
	{184, 140 , 0},
	{241, 200 , 0},
	{242, 190 , 0},
	{247, 450 , 0},
	{248, 499 , 0},
	{249, 650 , 0},
	{264, 5   , 0}
},

Suburban_Shop_Female_Skins[][] =
{
	/* SUBURBAN - MUJER */
	{39, 109  , 0},
	{56, 100  , 0},
	{88, 140  , 0},
	{131, 200 , 0},
	{195, 199 , 0}
},

Prolaps_Shop_Male_Skins[][] =
{
	/* PROLAPS - HOMBRE */
	{29, 129  , 0},
	{36, 140  , 0},
	{37, 150  , 0},
	{51, 160  , 0},
	{293, 170  , 0},
	{52, 170  , 0},
	{96, 200  , 0},
	{99, 700  , 0},
	{206, 499 , 0},
	{22, 150 , 0},
	{154, 199 , 0}
},

Prolaps_Shop_Female_Skins[][] =
{
	/* PROLAPS - MUJER */
	{41, 199 , 0},
	{90, 250 , 0},
	{92, 860 , 0},
	{138, 150, 0},
	{139, 150, 0},
	{140, 159, 0},
	{190, 150, 0},
	{192, 180, 0},
	{193, 195, 0}
},

Didier_Shop_Male_Skins[][] =
{
	/* DIDIER - HOMBRE */
	{17, 2500  , 0},
	{46, 2900  , 0},
	{57, 2220  , 0},
	{82, 3400  , 0},
	{83, 3400  , 0},
	{84, 3400  , 0},
	{124, 4500 , 0},
	{147, 6000 , 0},
	{163, 4000 , 0},
	{166, 4000 , 0},
	{171, 4000 , 0},
	{187, 4500 , 0},
	{223, 3100 , 0},
	{240, 1500 , 0},
	{295, 3000 , 0},
	{294, 5000 , 0},
	{290, 5000 , 0}
},

Didier_Shop_Female_Skins[][] =
{
	/* DIDIER - MUJER */
	{11, 1500  , 0},
	{12, 3000  , 0},
	{40, 2500  , 0},
	{91, 8000  , 0},
	{141, 3500 , 0},
	{169, 4000 , 0},
	{172, 2100 , 0},
	{194, 2000 , 0},
	{214, 25000, 0},
	{215, 3200 , 0},
	{216, 10500, 0},
	{219, 9500 , 0}
},

Victim_Shop_Male_Skins[][] =
{
	/* VICTIM - HOMBRE */
	{19, 400   , 0},
	{46, 1200  , 0},
	{59, 900   , 0},
	{72, 599   , 0},
	{73, 699   , 0},
	{98, 339   , 0},
	{121, 200  , 0},
	{170, 500  , 0},
	{185, 400  , 0},
	{186, 900  , 0},
	{188, 350  , 0},
	{221, 700  , 0},
	{223, 1200 , 0},
	{250, 50000, 0},
	{289, 699  , 0},
	{299, 700  , 0},
	{303, 500  , 0},
	{304, 700  , 0}
},

Victim_Shop_Female_Skins[][] =
{
	/* VICTIM - MUJER */
	{12, 2900  , 0},
	{40, 3000  , 0},
	{55, 1010  , 0},
	{56, 400   , 0},
	{192, 3000 , 0},
	{211, 3500 , 0},
	{226, 600  , 0},
	{233, 900  , 0}
},

Zip_Shop_Male_Skins[][] =
{
	/* ZIP - HOMBRE */
	{121, 190  , 0},
	{170, 500  , 0},
	{185, 400  , 0},
	{186, 900  , 0},
	{19, 400   , 0},
	{46, 1200  , 0},
	{59, 905   , 0},
	{72, 400   , 0},
	{73, 650   , 0},
	{98, 320   , 0},
	{250, 49999, 0},
	{289, 622  , 0},
	{299, 730  , 0},
	{303, 550  , 0},
	{188, 350  , 0},
	{221, 700  , 0},
	{223, 1200 , 0},
	{304, 700  , 0}
},

Zip_Shop_Female_Skins[][] =
{
	/* ZIP - MUJER */
	{56, 405    , 0},
	{192, 3010  , 0},
	{211, 3520  , 0},
	{226, 620   , 0},
	{233, 950   , 0},
	{12, 2904   , 0},
	{40, 3002   , 0},
	{55, 1011   , 0}
};

enum radio_enum
{
	r_NAME[64],
	r_TYPE[64],
	r_URL[264]
};
new RADIO_STATIONS[][radio_enum] =
{
	{"Loca FM", "Reggeton", "http://audio-online.net:2300/live"},
	{"Gozadera", "Variadas", "https://sonic.globalstream.pro:10961/1"},
	{"Rock FM", "Rock", "https://flucast-m01-01.flumotion.com/cope/rockfm.mp3"},
	{"UniversalRap", "HipHop", "http://streaming5.elitecomunicacion.es:8244/stream"},
	{"Soma FM", "Techno", "http://somafm.com/tags.pls"},
	{"Dubatek", "Drum'N'Bass", "http://web.zionsound.fr:8010/stream/1/"},
	{"Country NY", "Country", "https://streaming.radiostreamlive.com/radiocountrylive_devices"},
	{"BadRadio", "Phonk", "https://s2.radio.co/s2b2b68744/listen"},
	{"Hyaxe Radio", "Variadas", "http://boombox.hyaxe.com:8000/;?type=http&nocache=1"}
};

new Float:Fuel_Stations[][] =
{
	{1942.679443, -1771.374511, 13.390598},
	{654.678710, -570.627807, 16.335937},
	{1384.011962, 457.825012, 19.995258},
	{-1669.027221, 411.541076, 7.179687},
	{-2409.644042, 976.147644, 45.307708},
	{-1328.633666, 2675.913818, 50.062500},
	{612.890563, 1692.938720, 6.992187},
	{-1607.715820, -2717.499023, 48.539062},
	{2146.831542, 2743.855224, 10.820312},
	{2197.993408, 2475.015625, 10.820312},
	{2115.124267, 926.094909, 10.960937},
	{1595.974731, 2193.016845, 10.820312},
	{-1477.559326, 1858.962524, 32.639846},
	{-94.558959, -1160.146484, 1.735942},
	{2639.2466, 1098.9160, 10.8203},
	{2638.9070, 1109.4956, 10.8203},
	{2209.7957, 2476.2173, 10.8203}
};

new Float:Hp_Spawn_Interior_Pos[][] =
{
	{-201.967666,-1791.546630,675.785949,356.824615},
	{-201.944671,-1788.838867,675.785949,355.571289},
	{-207.176589,-1791.538818,675.785949,358.414764},
	{-207.400466,-1788.838867,675.785949,357.474700},
	{-211.549102,-1791.553588,675.785949,359.064758},
	{-211.472366,-1788.838867,675.785949,354.678070},
	{-211.854370,-1776.783935,675.786926,85.232192},
	{-209.154373,-1776.755981,675.786926,86.822257},
	{-209.161682,-1771.806030,675.786926,86.822265},
	{-211.861679,-1771.882324,675.786926,84.942245},
	{-209.161254,-1766.937133,675.785949,90.919052},
	{-211.853134,-1767.000244,675.785949,88.412361}
};

new Float:Hospital_Spawn_Positions[][] =
{
	{1172.832763, -1323.269531, 15.400051, 270.0}
};

#define MAX_PLAYER_MAP_GPS_POINTS 20

/*enum
{
	ACCOUNT_STATE_NORMAL,
	ACCOUNT_STATE_BANNED,
	ACCOUNT_STATE_TEMPBAN
};*/

#define MAX_PLAYER_POCKET_OBJECTS 10
enum Player_Pocket_Enum
{
	bool:player_pocket_VALID,
	player_pocket_object_ID,
	player_pocket_object_NAME[24],
	Float:player_pocket_object_HUNGRY,
	Float:player_pocket_object_THIRST,
	player_pocket_object_DRUNK
};
new PLAYER_POCKET[MAX_PLAYERS][MAX_PLAYER_POCKET_OBJECTS][Player_Pocket_Enum]; // PP (PlayerPocket)


new
	DIALOG_FOOD_PIZZA_String[400],
	DIALOG_FOOD_CLUCKIN_String[400],
	DIALOG_FOOD_BURGER_String[400],
	DIALOG_247_LIST_String[34 + 55 * sizeof Supermarket_Product_List],
	DIALOG_PLAYER_GPS_SITE_0_String[90 * (sizeof(Hospital_Spawn_Positions) + 1)],
	DIALOG_PLAYER_GPS_SITE_7_String[90 * (sizeof(SELL_VEHICLES_SHOPS_SPAWN) + 1)],
	DIALOG_CREATE_CREW_COLOR_String[164];


//armas mercado negro
enum enum_BLACK_MARKT_WEAPONS
{
	black_market_WEAPON_ID,
	black_market_WEAPON_PRICE_BASE,
	black_market_WEAPON_PRICE
};
new BLACK_MARKT_WEAPONS[][enum_BLACK_MARKT_WEAPONS] =
{
	{41, 300, 0}, // Spray
	//{5, 250, 0}, Bate
	{22, 2500, 0}, // 9MM
	{28, 3500, 0}, // Micro UZI
	{32, 3600, 0}, // Tec 9
	{25, 4000, 0}, // Escopeta
	{26, 4500, 0}, // recortada
	{33, 5200, 0} // Rifle 
};

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

		SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Vehicle Grabber (1)");
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
    format(str, 144, "[ADMIN] NeuroAdmin jaile� a %s (%d) por %s minutos: %s.", ACCOUNT_INFO[playerid][ac_NAME], playerid, TimeConvert(time * 60), reason);
    SendMessageToAdmins(COLOR_ANTICHEAT, str);

    new webhook[144];
    format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
	SendDiscordWebhook(webhook, 1);

	new dialog[250];
	format(dialog, sizeof dialog, ""COL_WHITE"NeuroAdmin te jaile�, raz�n: %s.\nRecuerde que a los 50 jails sera baneado permanentemente.", reason);
	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Entiendo", "");
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
					    SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Fly (1)");
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
					    SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Fly (2)");
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
					    SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Anti-L");
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
					    SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: SleepAnim");
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
						    SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Fly (3)");
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
				format(dialog, sizeof dialog, ""COL_WHITE"Fuiste baneado, raz�n: Jetpack");
				ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
				
				AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, "Jetpack");

				KickEx(playerid, 500);
				PLAYER_MISC[playerid][MISC_BANS] ++;
				SavePlayerMisc(playerid);

				new str[144];
				format(str, 144, "[ADMIN] NeuroAdmin bane� a %s (%d): Jetpack.", ACCOUNT_INFO[playerid][ac_NAME], playerid);
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
		format(ret, sizeof(ret), "hace un d�a");
	else if (seconds < (30 * DAY))
		format(ret, sizeof(ret), "hace %i d�as", (seconds / DAY));
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
			format(ret, sizeof(ret), "hace un a�o");
      	else
			format(ret, sizeof(ret), "%i a�os", years);
	}
	return ret;
}

/*CheckGraffitiTimelapse(start, till)
{
    new ret;
	new seconds = till - start;

	const
		MINUTE = 60,
		HOUR = 60 * MINUTE,
		DAY = 24 * HOUR;

	if (seconds < (30 * DAY))
	{
		new result = (seconds / DAY);
		if (result > 2) ret = 3;
	}

	return ret;
}*/

/*CheckMarketTimelapse(start, till)
{
    new ret;
	new seconds = till - start;

	const
		MINUTE = 60,
		HOUR = 60 * MINUTE,
		DAY = 24 * HOUR;

	if (seconds < (30 * DAY))
	{
		new result = (seconds / DAY);
		if (result > 6) ret = 7;
	}

	return ret;
}*/

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

forward UpdateWantedLevelMark();
public UpdateWantedLevelMark()
{
	#if DEBUG_MODE == 1
		printf("UpdateWantedLevelMark"); // debug juju
	#endif

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
	    if (IsPlayerConnected(i))
	    {
	    	if (PLAYER_MISC[i][MISC_SEARCH_LEVEL] > 0)
	    	{
	    		SendPoliceMark(i, 0xCB2828FF);
	    	}

	    	if (PLAYER_TEMP[i][py_CUFFED] == true)
	    	{
	    		SendPoliceMark(i, 0x2DAA24FF);
	    	}
	    }
	}
	return 1;
}

SetPlayerRangePoliceSearchLevel(playerid, level, Float:range, const reason[])
{
	if (PLAYER_WORKS[playerid][WORK_POLICE]) return 0;

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
						new Float:x, Float:y, Float:z;
						GetPlayerPos(playerid, x, y, z);
						if (GetPlayerDistanceFromPoint(playerid, x, y, z) <= range)
						{
							SetPlayerPoliceSearchLevel(playerid, PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] + level);
							
							format(PLAYER_TEMP[playerid][py_POLICE_REASON], 32, "%s", reason);
							ShowPlayerMessage(playerid, sprintf("~b~Has cometido un crimen: %s", reason), 5);
							break;
						}
					}
				}
			}
		}
	}
	return 1;
}

SetPlayerPoliceSearchLevel(playerid, level, bool:message = true)
{
	if (!level)
	{
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][43]);
		SendPoliceMark(playerid, PLAYER_COLOR);
		PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] = level;
		SetPlayerWantedLevel(playerid, 0);
		SavePlayerMisc(playerid);

		format(PLAYER_TEMP[playerid][py_POLICE_REASON], 32, "Ninguna");
		return 1;
	}

	level = (PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] + level);
	if (level > 6) level = 6;

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][43]);
	PLAYER_TEMP[playerid][py_TIMERS][43] = SetTimerEx("DisablePlayerPoliceSearchLevel", 300000 * level, false, "i", playerid);

	PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] = level;
	SetPlayerWantedLevel(playerid, level);
	SendPoliceMark(playerid, 0xCB2828FF);

    SavePlayerMisc(playerid);
    if (message) ShowPlayerNotification(playerid, "Sera mejor que corras, la polic�a te esta buscando", 3);
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

GetPlayersInIP(const ip[])
{
	new 
		temp_ip[16],
		count = 0
	;

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
		    GetPlayerIp(i, temp_ip, 16);
		    if (!strcmp(temp_ip, ip)) count ++;
		}
	}
	return count;
}

forward UpdateBotPing(playerid);
public UpdateBotPing(playerid)
{
	#if DEBUG_MODE == 1
		printf("UpdateBotPing"); // debug juju
	#endif

	SetPlayerColorEx(playerid, PLAYER_COLOR);
	SetPlayerFakePing(playerid, minrand(170, 345));

	if (GetPlayerScore(playerid) == 0) SetPlayerScore(playerid, minrand(1, 7));
	return 1;
}

forward UpdateBotName(playerid);
public UpdateBotName(playerid)
{
	#if DEBUG_MODE == 1
		printf("UpdateBotName"); // debug juju
	#endif

	new name[MAX_PLAYER_NAME];
	format(name, sizeof(name), "%s_%s", names[random(sizeof(names))], surnames[random(sizeof(surnames))]);
	SetPlayerName(playerid, name);
	PLAYER_TEMP[playerid][py_NAME] = name;
	return 1;
}

Bot(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][37]);

	SetPlayerColorEx(playerid, PLAYER_COLOR);
	SetPlayerScore(playerid, minrand(1, 7));

	TogglePlayerFakePing(playerid, true);
    SetPlayerFakePing(playerid, minrand(170, 345));

	new name[MAX_PLAYER_NAME];
	format(name, sizeof(name), "%s_%s", names[random(sizeof(names))], surnames[random(sizeof(surnames))]);
	SetPlayerName(playerid, name);
	PLAYER_TEMP[playerid][py_NAME] = name;

	PLAYER_TEMP[playerid][py_TIMERS][37] = SetTimerEx("UpdateBotPing", 30000, true, "i", playerid);
	PLAYER_TEMP[playerid][py_TIMERS][38] = SetTimerEx("UpdateBotName", 900000 + minrand(60000, 420000), true, "i", playerid);
	return 1;
}

public OnPlayerConnect(playerid)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerConnect %d",playerid); // debug juju
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
	//printf("[%d] OnPlayerConnect 5", playerid);
	#if defined VOICE_CHAT
		if (!SvGetVersion(playerid))
		{
			SendClientMessage(playerid, 0xec4134FF, "[AVISO]{FFFFFF} Instale/Actualize Hyaxe Client en {ec4134}www.hyaxe.com/client");
		}
		
		if (!SvHasMicro(playerid))
		{
			SendClientMessage(playerid, 0xec4134FF, "[AVISO]{FFFFFF} No tienes un micr�fono conectado");
		}
		
		lstream[playerid] = SvCreateDLStreamAtPlayer(40.0, SV_INFINITY, playerid, 0x81df79ff, "E");
		if (lstream[playerid])
		{
			SendClientMessage(playerid, 0xec4134FF, "[DEBUG]{FFFFFF} Streaming iniciado");
			SvAddKey(playerid, 0x5A);
		}
	#endif

	//printf("[%d] OnPlayerConnect 5", playerid);
	if (!strcmp(PLAYER_TEMP[playerid][py_IP], "127.0.0.1"))
	{
		#if defined FINAL_BUILD
			Bot(playerid);
			return 0;
		#endif
	}
	else if (!strcmp(PLAYER_TEMP[playerid][py_IP], "51.161.31.157")) // backup rdp
	{
		Bot(playerid);
		return 0;
	}
	else
	{
		CheckProxy(playerid);

		if (GetPlayersInIP(PLAYER_TEMP[playerid][py_IP]) > 5)
		{
			GetPlayerIp(playerid, PLAYER_TEMP[playerid][py_IP], 16);

			/*new str_text[144];
			format(str_text, sizeof(str_text), "[ANTI-CHEAT] Kick sobre %s (%d): exceder el m�ximo de conexiones", PLAYER_TEMP[playerid][py_NAME], playerid);
		    SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 2);
		    SendDiscordWebhook(str_text, 1);*/
		    
		    SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado por exceder el m�ximo de conexiones");
		    KickEx(playerid, 500);
			return 0;
		}

		if (IsFakeClient(playerid))
		{
			/*new str_text[144];
			format(str_text, sizeof(str_text), "[ANTI-CHEAT] Kick sobre %s (%d): Cliente inv�lido", PLAYER_TEMP[playerid][py_NAME], playerid);
		    SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 2);
		    SendDiscordWebhook(str_text, 1);*/
		    
		    SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado por ingresar con un cliente inv�lido");
		    KickEx(playerid, 500);
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
	if (db_num_rows(ban_Result))
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
					"COL_WHITE"Esta IP, cuenta o serial est� suspendida permanentemente.\n\
					\n\
					Tu nombre: %s\n\
					\n\
					Nombre: %s\n\
					Expulsado por: %s\n\
					Fecha expulsi�n: %s\n\
					Raz�n: %s\n\
					\n\
				",

				PLAYER_TEMP[playerid][py_NAME],
				name, GetDatabaseUserName(by), date, text
			);

			ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
			KickEx(playerid, 500);
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
						"COL_WHITE"Esta IP o cuenta est� suspendida temporalmente.\n\
						\n\
						Tu nombre: %s\n\
						Tu IP: %s\n\
						\n\
						Nombre: %s\n\
						Expulsado por: %s\n\
						Fecha expulsi�n: %s\n\
						Raz�n: %s\n\
						\n\
						Fecha actual: %s\n\
						Fecha readmisi�n: %s\n\
						\n\
					",

					PLAYER_TEMP[playerid][py_NAME], PLAYER_TEMP[playerid][py_IP],
					name, GetDatabaseUserName(by), date, text, now, expire_date
				);

				ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
				KickEx(playerid, 500);
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

		PlayAudioStreamForPlayer(playerid, INTRO_MUSIC[random(sizeof(INTRO_MUSIC))]); // M�sica
		PLAYER_TEMP[playerid][py_USER_EXIT] = true;
		ClearPlayerChatBox(playerid);
	}
	else
	{
		PlayAudioStreamForPlayer(playerid, INTRO_MUSIC[random(sizeof(INTRO_MUSIC))]); // M�sica
		ClearPlayerChatBox(playerid);
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

	PlayerExitGamemode(playerid);

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
		  			case 0: format(disconnect_message, sizeof disconnect_message, "[ID: %d] (( %s se ha desconectado, raz�n: crash ))", playerid, PLAYER_TEMP[playerid][py_RP_NAME]);
		  			case 1: format(disconnect_message, sizeof disconnect_message, "[ID: %d] (( %s se ha desconectado, raz�n: salida voluntaria ))", playerid, PLAYER_TEMP[playerid][py_RP_NAME]);
		  			case 2: format(disconnect_message, sizeof disconnect_message, "[ID: %d] (( %s se ha desconectado, raz�n: expulsado por el servidor ))", playerid, PLAYER_TEMP[playerid][py_RP_NAME]);
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

GetEnterExitIndexById(id)
{
	for(new i = 0; i != sizeof ENTER_EXIT; i ++)
	{
		if (ENTER_EXIT[i][ee_ID] == 0) continue;
		if (ENTER_EXIT[i][ee_ID] == id) return i;
	}
	return -1;
}

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

ExitSite(playerid)
{
    if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return 0;

    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1881.801635, -1688.519531, 5216.709960))
    {
    	SetPlayerPosEx(playerid, 1555.400390, -1675.611694, 16.195312, 180.0, 0, 0, false);
        return 1;
    }

    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1881.341674, -1727.080688, 5216.709960))
    {
    	SetPlayerPosEx(playerid, 1568.651977, -1690.080688, 6.218750, 180.0, 0, 0, false);
        return 1;
    }

    if (PLAYER_TEMP[playerid][py_LAST_PICKUP_ID] == 0) return 1;

    new info[3];
    Streamer_GetArrayData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_EXTRA_ID, info);
    if (info[0] == PICKUP_TYPE_NONE) return 0;

    new Float:x, Float:y, Float:z; 
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_X, x);
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Y, y);
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Z, z);

    if (!IsPlayerInRangeOfPoint(playerid, 1.0, x, y, z)) return 0;

    PLAYER_TEMP[playerid][py_IN_MARKET] = false;
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][41]);

    switch(info[0])
    {
        case PICKUP_TYPE_ENTER_EXIT:
        {
            if (info[2] == 1) // Est� en el Pickup Interior y quiere ir al exterior
            {
                CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
                CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
                PLAYER_TEMP[playerid][py_INTERIOR_INDEX] = -1;
                SetPlayerPosEx(playerid, ENTER_EXIT[info[1]][ee_EXT_X], ENTER_EXIT[info[1]][ee_EXT_Y], ENTER_EXIT[info[1]][ee_EXT_Z], ENTER_EXIT[info[1]][ee_EXT_ANGLE], ENTER_EXIT[info[1]][ee_EXT_INTERIOR], ENTER_EXIT[info[1]][ee_EXT_WORLD], false /*ENTER_EXIT[info[1]][ee_EXT_FREEZE]*/);
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
                if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);
                FreezePlayer(playerid);

                if (ENTER_EXIT[ info[1] ][ee_EXT_INTERIOR] == 0) SetPlayerTime(playerid, SERVER_TIME[0], SERVER_TIME[1]);
                if (ENTER_EXIT[info[1]][ee_INTERIOR_TYPE] == INTERIOR_ALHAMBRA) if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);
            }
            else ShowPlayerMessage(playerid, "~r~No est�s en sitio correcto.", 2);
        }
        case PICKUP_TYPE_PROPERTY:
        {
            if (info[2] == 1) // Est� en el Pickup Interior y quiere ir al exterior
            {
            	PLAYER_TEMP[playerid][py_ACTUAL_PROPERTY] = 0;
                CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
                CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
                PLAYER_TEMP[playerid][py_PROPERTY_INDEX] = -1;
                PLAYER_TEMP[playerid][py_CLUB_INDEX] = -1;
                SetPlayerPosEx(playerid, PROPERTY_INFO[info[1]][property_EXT_X], PROPERTY_INFO[info[1]][property_EXT_Y], PROPERTY_INFO[info[1]][property_EXT_Z], PROPERTY_INFO[info[1]][property_EXT_ANGLE], PROPERTY_INFO[info[1]][property_EXT_INTERIOR], 0, false /*PROPERTY_INFO[info[1]][property_EXT_FREEZE]*/, false);
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
                if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);
                FreezePlayer(playerid);
            }
            else ShowPlayerMessage(playerid, "~r~No est�s en sitio correcto.", 2);
        }
        case PICKUP_TYPE_CLUB:
        {
            if (info[2] == 1) // Est� en el Pickup Interior y quiere ir al exterior
            {
            	PLAYER_TEMP[playerid][py_CLUB_INDEX] = -1;
                CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
                CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;

                SetPlayerPosEx(
                	playerid,
                	CLUBS_INFO[ info[1] ][club_X],
                	CLUBS_INFO[ info[1] ][club_Y],
                	CLUBS_INFO[ info[1] ][club_Z],
                	CLUBS_INFO[ info[1] ][club_ANGLE],
                	0,
                	0,
                	false,
                	false
                );

                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
                if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);
                FreezePlayer(playerid);
            }
            else ShowPlayerMessage(playerid, "~r~No est�s en sitio correcto.", 2);
        }
        default: ShowPlayerMessage(playerid, "~r~No est�s en sitio correcto.", 2);
    }
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

EnterSite(playerid)
{
    if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return 0;
    if (PLAYER_TEMP[playerid][py_LAST_PICKUP_ID] == 0) return 1;
        
    new info[3];
    Streamer_GetArrayData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_EXTRA_ID, info);
    if (info[0] == PICKUP_TYPE_NONE) return 0;
    
    new Float:x, Float:y, Float:z; 
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_X, x);
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Y, y);
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Z, z);
    
    if (!IsPlayerInRangeOfPoint(playerid, 1.0, x, y, z)) return 0;
    
    switch(info[0])
    {
        case PICKUP_TYPE_ENTER_EXIT:
        {
            PLAYER_TEMP[playerid][py_HOSPITAL] = GetNearestHospitalForPlayer(playerid);
            if (PLAYER_TEMP[playerid][py_HOSPITAL] == -1) PLAYER_TEMP[playerid][py_HOSPITAL] = 1;
    
            if (info[2] == 2) // Est� en el Pickup Exterior y quiere ir al interior
            {
                if (ENTER_EXIT[info[1]][ee_TIME_OPEN] == 0 && ENTER_EXIT[info[1]][ee_TIME_CLOSE] == 0) // 24 horas
                {
                	if (PLAYER_TEMP[playerid][py_ROCK]) return ShowPlayerMessage(playerid, "~r~Primero debes entregar la roca.", 3);

                    if (ENTER_EXIT[ info[1] ][ee_INT_INTERIOR] == 25)
                 	{
                 		SetPlayerTime(playerid, 2, 2);
                 	}

                 	if (ENTER_EXIT[ info[1] ][ee_INT_INTERIOR] == 26)
                 	{
                 		if (PLAYER_SKILLS[playerid][WORK_MINER] < 150) return ShowPlayerMessage(playerid, "~r~Necesitas 150 de experiencia de minero para~n~picar en esta zona.", 5);
                 		SetPlayerTime(playerid, 2, 2);
                 	}

                 	if (ENTER_EXIT[ info[1] ][ee_INT_INTERIOR] == 27)
                 	{
                 		if (PLAYER_SKILLS[playerid][WORK_MINER] < 500) return ShowPlayerMessage(playerid, "~r~Necesitas 500 de experiencia de minero para~n~picar en esta zona.", 5);
                 		SetPlayerTime(playerid, 2, 2);
                 	}

                    CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_INTERIOR;
                    CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = ENTER_EXIT[info[1]][ee_ID];
                    PLAYER_TEMP[playerid][py_INTERIOR_INDEX] = info[1];
                    SetPlayerPosEx(playerid, ENTER_EXIT[info[1]][ee_INT_X], ENTER_EXIT[info[1]][ee_INT_Y], ENTER_EXIT[info[1]][ee_INT_Z], ENTER_EXIT[info[1]][ee_INT_ANGLE], ENTER_EXIT[info[1]][ee_INT_INTERIOR], ENTER_EXIT[info[1]][ee_INT_WORLD], false /*ENTER_EXIT[info[1]][ee_INT_FREEZE]*/, true);
                    FreezePlayer(playerid);

                    if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);

                    if (ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE] == INTERIOR_CLUB)
					{
						StopAudioStreamForPlayer(playerid);
						PlayAudioStreamForPlayer(playerid, "http://somafm.com/tags.pls");			
					}
                }
                else
                {
                    if (is_open(SERVER_TIME[0], ENTER_EXIT[info[1]][ee_TIME_OPEN], ENTER_EXIT[info[1]][ee_TIME_CLOSE]))
                    {
                        CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_INTERIOR;
                        CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = ENTER_EXIT[info[1]][ee_ID];
                        PLAYER_TEMP[playerid][py_INTERIOR_INDEX] = info[1];
                        SetPlayerPosEx(playerid, ENTER_EXIT[info[1]][ee_INT_X], ENTER_EXIT[info[1]][ee_INT_Y], ENTER_EXIT[info[1]][ee_INT_Z], ENTER_EXIT[info[1]][ee_INT_ANGLE], ENTER_EXIT[info[1]][ee_INT_INTERIOR], ENTER_EXIT[info[1]][ee_INT_WORLD], false /*ENTER_EXIT[info[1]][ee_INT_FREEZE]*/, true);
                        FreezePlayer(playerid);
                    }
                    else SendClientMessageEx(playerid, COLOR_WHITE, "{C4FF66}%s "COL_WHITE"est� cerrado, su horario es: {C4FF66}%02d:00 - %02d:00.", ENTER_EXIT[info[1]][ee_NAME], ENTER_EXIT[info[1]][ee_TIME_OPEN], ENTER_EXIT[info[1]][ee_TIME_CLOSE]);
                }
            }
            else ExitSite(playerid);
        }
        case PICKUP_TYPE_PROPERTY:
        {
            PLAYER_TEMP[playerid][py_HOSPITAL] = GetNearestHospitalForPlayer(playerid);
            if (PLAYER_TEMP[playerid][py_HOSPITAL] == -1) PLAYER_TEMP[playerid][py_HOSPITAL] = 1;
            
            if (PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] > 0) return ShowPlayerMessage(playerid, "~r~No puedes entrar a una propiedad~n~teniendo cargos.", 3);

            if (info[2] == 2) // Est� en el Pickup Exterior y quiere ir al interior
            {
                if (!PROPERTY_INFO[info[1]][property_SOLD])
                {
                	new str_text[264];
                	if (PROPERTY_INFO[info[1]][property_EXTRA])
                	{
                		format(str_text, sizeof(str_text), ""COL_WHITE"Precio: %d "SERVER_COIN"\nNivel: %d\n\nVIP: %d\n\nUse /comprar para comprar la propiedad", PROPERTY_INFO[info[1]][property_EXTRA], PROPERTY_INFO[info[1]][property_LEVEL], PROPERTY_INFO[info[1]][property_VIP_LEVEL]);
                	}
                	else
                	{
                		format(str_text, sizeof(str_text), ""COL_WHITE"Precio: %s$\nNivel: %d\nVIP: %d\n\nUse /comprar para comprar la propiedad", number_format_thousand(PROPERTY_INFO[info[1]][property_PRICE]), PROPERTY_INFO[info[1]][property_LEVEL], PROPERTY_INFO[info[1]][property_VIP_LEVEL]);	
                	}

                	PLAYER_TEMP[playerid][py_ACTUAL_PROPERTY] = PROPERTY_INFO[info[1]][property_ID];
					ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Propiedad", str_text, "Cerrar", "");

					new Float:apos[3];
                    GetPlayerPos(playerid, apos[0], apos[1], apos[2]);
                    SetTimerEx("RestorePlayerPos", 30000, false, "ifff", playerid, apos[0], apos[1], apos[2]);

                	CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_OWN_PROPERTY;
                    CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = PROPERTY_INFO[info[1]][property_ID];
                    PLAYER_TEMP[playerid][py_PROPERTY_INDEX] = info[1];
                    PLAYER_TEMP[playerid][py_CLUB_INDEX] = -1;
                    SetPlayerPosEx(playerid, PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_X], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_Y], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_Z], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_ANGLE], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_INTERIOR], PROPERTY_INFO[info[1]][property_ID], false /*PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_FREEZE]*/, true);
                    FreezePlayer(playerid);

                    ShowPlayerMessage(playerid, "Tienes ~r~30 segundos~w~ para ver la propiedad.", 10);
                    return 1;
                }

                if (PROPERTY_INFO[info[1]][property_CREW])
                {
                    if (!PLAYER_CREW[playerid][player_crew_VALID]) return SendClientMessageEx(playerid, COLOR_WHITE, "{999999}Solo miembros de la banda pueden entrar.");
                    if (PLAYER_CREW[playerid][player_crew_ID] != PROPERTY_INFO[info[1]][property_CREW_ID]) return SendClientMessageEx(playerid, COLOR_WHITE, "{999999}Solo miembros de la banda pueden entrar.");
                    
                    CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_GUEST_PROPERTY;
                    CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = PROPERTY_INFO[info[1]][property_ID];
                    PLAYER_TEMP[playerid][py_PROPERTY_INDEX] = info[1];
                    PLAYER_TEMP[playerid][py_CLUB_INDEX] = -1;
                    SetPlayerPosEx(playerid, PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_X], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_Y], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_Z], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_ANGLE], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_INTERIOR], PROPERTY_INFO[info[1]][property_ID], false /*PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_FREEZE]*/, true);
                    FreezePlayer(playerid);
                }
                else
                {
                    if (PROPERTY_INFO[info[1]][property_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID])
                    {
                        CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_OWN_PROPERTY;
                        CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = PROPERTY_INFO[info[1]][property_ID];
                        PLAYER_TEMP[playerid][py_PROPERTY_INDEX] = info[1];
                        PLAYER_TEMP[playerid][py_CLUB_INDEX] = -1;
                        SetPlayerPosEx(playerid, PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_X], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_Y], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_Z], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_ANGLE], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_INTERIOR], PROPERTY_INFO[info[1]][property_ID], false /*PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_FREEZE]*/, true);
                        FreezePlayer(playerid);
                    }
                    else
                    {
                        if (gettime() < PLAYER_TEMP[playerid][py_ANTIFLOOD_KNOCK_PROPERTY] + 10) return SendClientMessage(playerid, 0x999999AA, "Espera para volver a tocar, si no te quieren abrir, vete.");
                        
                        new owner_playerid = GetOwnerIntProperty(PROPERTY_INFO[info[1]][property_ID]);
                        if (owner_playerid == -1) return ShowPlayerMessage(playerid, "Has tocado en la puerta, pero parece que no hay nadie.", 4);
                        PLAYER_TEMP[playerid][py_ANTIFLOOD_KNOCK_PROPERTY] = gettime();
                        PLAYER_TEMP[owner_playerid][py_KNOCK_PLAYER_ID] = playerid;
                        ShowPlayerNotification(owner_playerid, "Est�n tocando en la puerta, presione la tecla Y estando en la puerta para dejarlo entrar o simplemente ign�relo.", 4);
                        ShowPlayerMessage(playerid, "Has tocado en la puerta, espera a que te abran.", 7);
                    }
                }
            }
            else ExitSite(playerid);
        }
        case PICKUP_TYPE_CLUB:
        {
            PLAYER_TEMP[playerid][py_HOSPITAL] = GetNearestHospitalForPlayer(playerid);
            if (PLAYER_TEMP[playerid][py_HOSPITAL] == -1) PLAYER_TEMP[playerid][py_HOSPITAL] = 1;
    
            if (info[2] == 2) // Est� en el Pickup Exterior y quiere ir al interior
            {
            	if (CLUBS_INFO[ info[1] ][club_STATE] == 0 && CLUBS_INFO[ info[1] ][club_USER_ID] != ACCOUNT_INFO[playerid][ac_ID]) ShowPlayerMessage(playerid, "~r~Este negocio se encuentra cerrado.", 4);
                else
                {
                	if (PLAYER_TEMP[playerid][py_ROCK]) return ShowPlayerMessage(playerid, "~r~Primero debes entregar la roca.", 3);

                	if (CLUBS_INFO[ info[1] ][club_USER_ID] != ACCOUNT_INFO[playerid][ac_ID])
                	{
	                	if (CLUBS_INFO[ info[1] ][club_ENTER_PRICE] > 0)
	                	{
	                		if (CHARACTER_INFO[playerid][ch_CASH] <= CLUBS_INFO[ info[1] ][club_ENTER_PRICE])
	                		{
	                			new str_text[64];
	                			format(str_text, 64, "~r~La entrada al negocio vale %d$", CLUBS_INFO[ info[1] ][club_ENTER_PRICE]);
	                			ShowPlayerMessage(playerid, str_text, 4);
	                			return 0;
	                		}

	                		CLUBS_INFO[ info[1] ][club_BALANCE] += CLUBS_INFO[ info[1] ][club_ENTER_PRICE];

							new DB_Query[128];
							format(DB_Query, sizeof(DB_Query), "\
								UPDATE `CLUB_INFO` SET\
									`BALANCE` = '%d' \
								WHERE `ID` = '%d';\
							", CLUBS_INFO[ info[1] ][club_BALANCE], info[1]);
							db_free_result(db_query(Database, DB_Query));

							GivePlayerCash(playerid, -CLUBS_INFO[ info[1] ][club_ENTER_PRICE], false);
	                	}
	                }

                	new interior = CLUBS_INFO[ info[1] ][club_INTERIOR];
                    CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_OWN_CLUB;
                    CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = CLUBS_INFO[ info[1] ][club_ID];
                    PLAYER_TEMP[playerid][py_INTERIOR_INDEX] = info[1];
                    PLAYER_TEMP[playerid][py_CLUB_INDEX] = info[1];

                    SetPlayerPosEx(playerid,
                    	CLUBS_INTERIORS[interior][interior_X],
                    	CLUBS_INTERIORS[interior][interior_Y],
                    	CLUBS_INTERIORS[interior][interior_Z],
                    	CLUBS_INTERIORS[interior][interior_ANGLE],
                    	CLUBS_INTERIORS[interior][interior_ID],
                    	CLUBS_INFO[ info[1] ][club_ID],
                    	false,
                    	true
                    );
                    FreezePlayer(playerid);

                    if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);

                    if (CLUBS_INFO[ info[1] ][club_RADIO] < 100)
					{
						PlayAudioStreamForPlayer(playerid, RADIO_STATIONS[ CLUBS_INFO[ info[1] ][club_RADIO] ][r_URL]);
					}

					ShowPlayerNotification(playerid, CLUBS_INFO[ info[1] ][club_WELCOME], 4);
                }
            }
            else ExitSite(playerid);
        }
        default: ExitSite(playerid);
    }
    return 1;
}

CheckFarmerShop(playerid)
{
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, -382.580657, -1426.404296, 26.219505)) return 0;
	if (PlayerIsInMafia(playerid))
	{
		ShowDialog(playerid, DIALOG_SEED_LIST);
	}
	else return ShowPlayerMessage(playerid, "~r~No eres mafioso.", 3);
	return 1;
}

CheckTrashJobSite(playerid)
{
	if (!PLAYER_WORKS[playerid][WORK_TRASH]) return 0;
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_NONE && PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_TRASH) return 0;

	if (GetPlayerVirtualWorld(playerid) != 0) return 0;
	if (GetPlayerInterior(playerid) != 0) return 0;
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 0;
	if (!IsPlayerInRangeOfPoint(playerid, 1.0, 1626.089355, -2174.786132, 13.554687)) return 0;

	if (!PLAYER_TEMP[playerid][py_WORKING_IN]) StartPlayerJob(playerid, WORK_TRASH);
	else EndPlayerJob(playerid);
	return 1;
}

CheckMedicJobSite(playerid)
{
	if (!PLAYER_WORKS[playerid][WORK_MEDIC]) return 0;
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_NONE && PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_MEDIC) return 0;

	if (IsPlayerInRangeOfPoint(playerid, 1.0, -212.521926, -1739.015014, 675.768737))
	{
		if (!PLAYER_TEMP[playerid][py_WORKING_IN]) StartPlayerJob(playerid, WORK_MEDIC);
		else EndPlayerJob(playerid);
	}
	return 1;
}

CheckIsFireWeapon(weapon)
{
	switch(weapon)
	{
		case 0..18: return 0;
		case 22..38: return 1;
		case 39..46: return 0;
	}
	return 1;
}

ResyncWeapon(playerid, weapon)
{
	switch(weapon)
	{
		case 22: // 9MM
		{
			GivePlayerWeaponEx(playerid, weapon, 15, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munici�n ~r~+15"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 24: // Desert
		{
			GivePlayerWeaponEx(playerid, weapon, 7, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munici�n ~r~+7"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 32: // TEC9
		{
			GivePlayerWeaponEx(playerid, weapon, 20, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munici�n ~r~+20"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 28: // UZI
		{
			GivePlayerWeaponEx(playerid, weapon, 25, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munici�n ~r~+25"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 33: // Rifle
		{
			GivePlayerWeaponEx(playerid, weapon, 8, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munici�n ~r~+8"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "RIFLE", "RIFLE_load", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 26: // Recortada
		{
			GivePlayerWeaponEx(playerid, weapon, 2, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munici�n ~r~+2"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 25: // Escopeta
		{
			GivePlayerWeaponEx(playerid, weapon, 5, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munici�n ~r~+5"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 29: // MP5
		{
			GivePlayerWeaponEx(playerid, weapon, 35, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munici�n ~r~+35"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 30: // AK-47
		{
			GivePlayerWeaponEx(playerid, weapon, 50, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munici�n ~r~+50"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 31: // M4
		{
			GivePlayerWeaponEx(playerid, weapon, 50, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munici�n ~r~+50"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
	}
	return 1;
}

CheckAndReload(playerid)
{
	if (PLAYER_TEMP[playerid][py_GAME_STATE] == GAME_STATE_NORMAL && GetPlayerAnimationIndex(playerid) != 1537 && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		if (PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] != 9999)
		{
			new slot = PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT];

			if (PLAYER_VISUAL_INV[playerid][slot_WEAPON][slot])
			{
				new actual_weapon = PLAYER_WEAPONS[playerid][ PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot] ][player_weapon_ID];
				if (CheckIsFireWeapon(actual_weapon))
				{
					switch(actual_weapon)
					{
						case 22..24: // Pistolas
						{
							if (PLAYER_MISC[playerid][MISC_CARTRIDGE_1] > 0)
							{
								ResyncWeapon(playerid, actual_weapon);
								PLAYER_MISC[playerid][MISC_CARTRIDGE_1] --;
								return 1;
							}
						}
						case 25..27: // Escopetas
						{
							if (PLAYER_MISC[playerid][MISC_CARTRIDGE_2] > 0)
							{
								ResyncWeapon(playerid, actual_weapon);
								PLAYER_MISC[playerid][MISC_CARTRIDGE_2] --;
								return 1;
							}
						}
						case 33, 34: // Rifles
						{
							if (PLAYER_MISC[playerid][MISC_CARTRIDGE_3] > 0)
							{
								ResyncWeapon(playerid, actual_weapon);
								PLAYER_MISC[playerid][MISC_CARTRIDGE_3] --;
								return 1;
							}
						}
						case 28..32: // Subfusiles
						{
							if (PLAYER_MISC[playerid][MISC_CARTRIDGE_4] > 0)
							{
								ResyncWeapon(playerid, actual_weapon);
								PLAYER_MISC[playerid][MISC_CARTRIDGE_4] --;
								return 1;
							}
						}
					}
				}
			}
		}
	}
	return 1;
}

ShowTuningMenu(playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if (vehicleid == INVALID_VEHICLE_ID) return 1;

	HidePlayerMenu(playerid);

	ShowPlayerMenu(playerid, MECHANICTUNING, "Tuning");
	AddPlayerMenuItem(playerid, TextToSpanish("Reparaci�n"), "Precio: 350$");
	AddPlayerMenuItem(playerid, "Colores");
	AddPlayerMenuItem(playerid, "Paintjob");
	AddPlayerMenuItem(playerid, "Objetos");
	AddPlayerMenuItem(playerid, "Eliminar componentes");

	new DBResult:Result, DB_Query[255];
	format(DB_Query, sizeof DB_Query, "SELECT `COMPONENTS_INFO`.`PART`, `COMPONENTS_INFO`.`PIECES` FROM `COMPONENTS_INFO`, `VEHICLE_COMPONENTS` WHERE `VEHICLE_COMPONENTS`.`MODELID` = '%d' AND `VEHICLE_COMPONENTS`.`COMPONENT_ID` = `COMPONENTS_INFO`.`ID` GROUP BY `COMPONENTS_INFO`.`PART`;", GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result) == 0)
	{
		printf("[ERROR] No hay componentes asignados en la base de datos");
	}
	else
	{
		new line_str[80];

		for(new i; i < db_num_rows(Result); i++ )
		{
			if (i >= TOTAL_TUNING_PARTS)
			{
				printf("[debug]  L�mite superado en array 'PLAYER_TUNING_MENU, dialog Parts' al intentar cargar de la base de datos.");
				break;
			}

			db_get_field_assoc(Result, "PART", PLAYER_TUNING_MENU[playerid][i][tuning_menu_NAME], 24);
			format(line_str, sizeof line_str, "%s", PLAYER_TUNING_MENU[playerid][i][tuning_menu_NAME]);
			
			AddPlayerMenuItem(playerid, TextToSpanish(line_str), "Precio: 50$");

			db_next_row(Result);
		}
	}
	db_free_result(Result);
	return 1;
}

Menu:MECHANICPAINTJOB(playerid, response, listitem)
{
	if (response == MENU_RESPONSE_SELECT)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if (vehicleid == INVALID_VEHICLE_ID) return 1;
		
		if (listitem == 0)
		{
			if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_PAINTJOB] == 3)
			{
				ShowPlayerMessage(playerid, "~r~El veh�culo no tiene ning�n paintjob.", 3);
				return 1;
			}

			GLOBAL_VEHICLES[vehicleid][gb_vehicle_PAINTJOB] = 3;
			ChangeVehiclePaintjob(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_PAINTJOB]);

			ShowPlayerMessage(playerid, "Paintjob ~r~eliminado", 3);
			return 1;
		}

		if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID])
		{
			if (CHARACTER_INFO[playerid][ch_CASH] <= 350) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente", 2);

			GLOBAL_VEHICLES[vehicleid][gb_vehicle_PAINTJOB] = listitem - 1;
			ChangeVehiclePaintjob(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_PAINTJOB]);
			ShowPlayerMessage(playerid, "Paintjob ~g~aplicado", 3);
			GivePlayerCash(playerid, -100, false);
			ShowTuningMenu(playerid);
		}
	}
	return 1;
}

Menu:MECHANICTUNING(playerid, response, listitem)
{
    if (response == MENU_RESPONSE_SELECT)
    {
    	new vehicleid = GetPlayerVehicleID(playerid);
		if (vehicleid == INVALID_VEHICLE_ID) return 1;

    	if (listitem == 0)
        {
        	if (CHARACTER_INFO[playerid][ch_CASH] <= 350) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente", 2);

			RepairVehicleEx(vehicleid, playerid);
			GivePlayerCash(playerid, -350, false);
			ShowPlayerMessage(playerid, "Veh�culo ~g~reparado", 2);
			ShowTuningMenu(playerid);
        }

        else if (listitem == 1)
        {
        	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Solo puedes tunear tus veh�culos personales.", 3);
        	
        	ShowDialog(playerid, DIALOG_TUNING_SELECT_COL_SLOT);
        }

        else if (listitem == 2)
        {
        	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Solo puedes tunear tus veh�culos personales.", 3);

			new paintjobs = VehiclePaintjob(GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID]);
			if (paintjobs == 0)
			{
				ShowPlayerMessage(playerid, "~r~Este veh�culo no soporta paintjobs.", 3);
				ShowTuningMenu(playerid);
				return 1;
			}

			ShowPlayerMenu(playerid, MECHANICPAINTJOB, "Paintjobs");
			AddPlayerMenuItem(playerid, "Eliminar paintjob");

			for(new i = 0; i != paintjobs; i ++)
			{
				new line_str[25];
				format(line_str, sizeof line_str, "Paintjob %d", i + 1);
				AddPlayerMenuItem(playerid, line_str, "Precio: 100$");
			}
       	}
       	
       	else if (listitem == 3)
        {
        	ShowPlayerMessage(playerid, "~r~Esto no esta disponible", 4);
        	//ShowObjTuning(playerid);
        }

       	else if (listitem == 4)
        {
        	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Solo puedes tunear tus veh�culos personales.", 3);
        	ShowDialog(playerid, DIALOG_TUNING_REMOVE);
        }

        else
		{
			new new_listitem = listitem - 5;
			if (isnull(PLAYER_TUNING_MENU[playerid][new_listitem][tuning_menu_NAME])) return 1;
			if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_VALID]) return 1;

			new Float:Vehicle_Pos[3];
			GetVehiclePos(vehicleid, Vehicle_Pos[0], Vehicle_Pos[1], Vehicle_Pos[2]);
			if (!IsPlayerInRangeOfPoint(playerid, 5.0, Vehicle_Pos[0], Vehicle_Pos[1], Vehicle_Pos[2])) return ShowPlayerMessage(playerid, "~r~El veh�culo est� muy lejos.", 3);

			format(PLAYER_TEMP[playerid][py_TUNING_SELECTED_PART], 24, "%s", PLAYER_TUNING_MENU[playerid][new_listitem][tuning_menu_NAME]);
			ShowDialog(playerid, DIALOG_TUNING_MENU_COMPONENT);
		}
	}
	else
	{
		PLAYER_TEMP[playerid][py_IN_TUNING_GARAGE] = false;
	}
    return 1; 
}

ShowObjTuning(playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if (vehicleid == INVALID_VEHICLE_ID) return 1;
			
    if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Solo puedes tunear tus veh�culos personales.", 3);
	if (!VEHICLE_INFO[GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400][vehicle_info_VALID]) return ShowPlayerMessage(playerid, "~r~Este veh�culo no se puede tunear.", 3);

	HidePlayerMenu(playerid);

	PLAYER_TEMP[playerid][py_IN_TUNING_GARAGE] = true;
	PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] = vehicleid;

	ShowPlayerMenu(playerid, OBJTUNINGMENU, "Objetos");
	AddPlayerMenuItem(playerid, "Mis objetos");
	AddPlayerMenuItem(playerid, "Comprar objetos");
	AddPlayerMenuItem(playerid, "Bandera", "Precio: 2.000$");
	return 1;
}

Menu:OBJTUNINGMENU(playerid, response, listitem)
{
	if (response == MENU_RESPONSE_SELECT)
	{
		switch(listitem)
		{
			case 0: ShowDialog(playerid, DIALOG_VOBJECT_OBJECTS);
			case 1: //Comprar
			{
				new slot = GetVehicleFreeObjectSlot(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID]);
				if (!ACCOUNT_INFO[playerid][ac_SU] && slot >= MAX_NU_VOBJECTS)
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP~w~ para tener m�s objetos.", 4);
					ShowObjTuning(playerid);
					return 1;
				}

				if (slot == -1)
				{
					ShowPlayerMessage(playerid, "~r~No hay m�s espacio para objetos en este veh�culo.", 3);
					ShowObjTuning(playerid);
					return 1;
				}

				ShowDialog(playerid, DIALOG_BUY_VOBJECT);
			}

			case 2:
			{
				new slot = GetVehicleFreeObjectSlot(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID]);
				if (!ACCOUNT_INFO[playerid][ac_SU] && slot >= MAX_NU_VOBJECTS)
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP~w~ para tener m�s objetos.", 4);
					ShowObjTuning(playerid);
					return 1;
				}

				if (slot == -1)
				{
					ShowPlayerMessage(playerid, "~r~No hay m�s espacio para objetos en este veh�culo.", 3);
					ShowObjTuning(playerid);
					return 1;
				}

				if (500 > CHARACTER_INFO[playerid][ch_CASH])
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
					ShowObjTuning(playerid);
					return 1;
				}

				GivePlayerCash(playerid, -500);

				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_VALID] = true;
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_TYPE] = VOBJECT_TYPE_TEXT;
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_ID] = 0;
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_MODELID] = 19327;
				format(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_NAME], 32, "Texto");
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_ATTACHED] = true;

				format(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_text_TEXT], 32, "Texto");
				format(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_text_FONT], 24, "Arial");
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_text_FONT_SIZE] = 24;
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_text_BOLD] = false;
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_text_FONT_COLOR] = 0xFF000000;

				RegisterNewVehicleObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], slot);
				UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], slot);

				ShowPlayerMessage(playerid, "El objeto de texto fue a�adido.", 2);
				PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] = slot;
				ShowDialog(playerid, DIALOG_VOBJECT_OBJECT);
			}

			case 3:
			{
				new slot = GetVehicleFreeObjectSlot(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID]);
				if (!ACCOUNT_INFO[playerid][ac_SU] && slot >= MAX_NU_VOBJECTS)
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP~w~ para tener m�s objetos.", 4);
					ShowObjTuning(playerid);
					return 1;
				}
				if (slot == -1)
				{
					ShowPlayerMessage(playerid, "~r~No hay m�s espacio para objetos en este veh�culo.", 3);
					ShowObjTuning(playerid);
					return 1;
				}

				if (2000 > CHARACTER_INFO[playerid][ch_CASH])
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
					ShowObjTuning(playerid);
					return 1;
				}

				PLAYER_TEMP[playerid][py_COUNTRY_TYPE] = 1;
				ShowDialog(playerid, DIALOG_VOBJECT_COUNTRY);
			}
		}
	}
	return 1;
}

CheckHeliPort(playerid)
{
	if (IsPlayerInRangeOfPoint(playerid, 5.0, 1876.87915, -2286.58911, 1.16550 + 10))
	{
		ShowDialog(playerid, DIALOG_HELI_OPTIONS);
		return 1;
	}

	if (IsPlayerInRangeOfPoint(playerid, 5.0, 1037.1727, -911.3947, 49.1911))
	{
		ShowDialog(playerid, DIALOG_HELI_OPTIONS);
		return 1;
	}

	if (IsPlayerInRangeOfPoint(playerid, 5.0, 1055.9615, -910.1790, 49.1911))
	{
		ShowDialog(playerid, DIALOG_HELI_OPTIONS);
		return 1;
	}

	if (IsPlayerInRangeOfPoint(playerid, 20.0, 729.8204, -1512.3397, -0.5818))
	{
		ShowDialog(playerid, DIALOG_HELI_OPTIONS);
		return 1;
	}
	return 1;
}

CheckMechanicMenu(playerid)
{
	for(new i = 0; i != sizeof(MECHANIC_POSITIONS); i++ )
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.2, MECHANIC_POSITIONS[i][0], MECHANIC_POSITIONS[i][1], MECHANIC_POSITIONS[i][2]))
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if (vehicleid == INVALID_VEHICLE_ID) return 1;

			if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE]) return ShowPlayerMessage(playerid, "~r~El motor debe estar apagado.", 3);

			ShowTuningMenu(playerid);
			break;
		}
	}
	return 1;
}

Menu:TRUCKRECOS(playerid, response, listitem)
{
    if (response == MENU_RESPONSE_SELECT)
    {
    	new vehicleid = GetPlayerVehicleID(playerid);
		TRUCK_VEHICLE[vehicleid][truck_vehicle_POINT] = listitem;
				
		PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] = 5;
		UpdatePlayerLoadingTruckSize(playerid);
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][7]);
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][9]);
		PLAYER_TEMP[playerid][py_TIMERS][9] = SetTimerEx("TruckLoadUp", 1000, false, "ii", playerid, vehicleid);
	}
    return 1; 
}

CheckTruckPointAndLoad(playerid)
{
	if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 0;
	if (!PLAYER_WORKS[playerid][WORK_TRUCK]) return 0;
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_TRUCK) return 0;

	new vehicleid = GetPlayerVehicleID(playerid);
	if (!WORK_VEHICLES[vehicleid][work_vehicle_VALID]) return 0;
	if (WORK_VEHICLES[vehicleid][work_vehicle_WORK] != WORK_TRUCK) return 0;

	for(new i = 0; i != sizeof LoadTrucksPoints; i ++)
	{
		if (IsPlayerInRangeOfPoint(playerid, 3.0, LoadTrucksPoints[i][0], LoadTrucksPoints[i][1], LoadTrucksPoints[i][2]))
		{
			if (TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADED]) return ShowPlayerMessage(playerid, "~r~El cami�n ya est� cargado.", 3);
			if (TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADING]) return ShowPlayerMessage(playerid, "~r~El cami�n ya se est� cargando.", 3);

			TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADING] = true;
			TRUCK_VEHICLE[vehicleid][truck_vehicle_DRIVER_USER_ID] = ACCOUNT_INFO[playerid][ac_ID];

			SetVehicleVelocity(vehicleid, 0.0, 0.0, 0.0);

			GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 0;
			UpdateVehicleParams(vehicleid);

			ShowPlayerMessage(playerid, "Usa ~r~ESPACIO~w~ para seleccionar y ~r~ENTER~w~ para salir~n~y ~r~ARRIBA~w~ o ~r~ABAJO~w~ para mover.", 10);

			ShowPlayerMenu(playerid, TRUCKRECOS, "Cargamentos");
			for(new x = 0; x != sizeof Truck_Contents; x ++)
			{
				new line_str[105], paga_str[105];
				format(line_str, sizeof line_str, "%s", TextToSpanish(Truck_Contents[x][truck_content_NAME]));
				format(paga_str, sizeof paga_str, "Paga: %s$ - Distancia: %.2f Km", number_format_thousand(Truck_Contents[x][truck_content_MONEY]), (GetPlayerDistanceFromPoint(playerid, Truck_Contents[x][truck_content_X], Truck_Contents[x][truck_content_Y], Truck_Contents[x][truck_content_Z]) * 0.01));
				AddPlayerMenuItem(playerid, line_str, paga_str);
			}
			return 1;
		}
	}
	return 1;
}

GrabPlant(playerid)
{
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 0;

	for(new i = 0; i != MAX_PLANTS; i ++)
	{
		if (!PLANTS[i][plant_VALID] || PLANTS[i][plant_GROWING]) continue;

		new Float:x, Float:y, Float:z;
		GetDynamicObjectPos(PLANTS[i][plant_OBJECT_ID], x, y, z);
		if (IsPlayerInRangeOfPoint(playerid, 1.5, x, y, z))
		{
			if (PLANTS[i][plant_PLANTED_BY_ACCOUNT_ID] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~Esta planta no es tuya", 3);

			KillTimer(PLANTS[i][plant_TIMER]);
			switch(seed_info[ PLANTS[i][plant_TYPE] ][seed_info_PLANT_TYPE])
			{
				case PLANT_TYPE_MEDICINE:
				{
					PLAYER_MISC[playerid][MISC_MEDICINE] += 10;
					ShowPlayerNotification(playerid, "~g~+10~w~ medicamentos", 4);
					SavePlayerMisc(playerid);
				}
				case PLANT_TYPE_CANNABIS:
				{
					PLAYER_MISC[playerid][MISC_CANNABIS] += 10;
					ShowPlayerNotification(playerid, "~g~+10~w~ marihuana", 4);
					SavePlayerMisc(playerid);
				}
				case PLANT_TYPE_CRACK:
				{
					PLAYER_MISC[playerid][MISC_CRACK] += 10;
					ShowPlayerNotification(playerid, "~g~+10~w~ crack", 4);
				    SavePlayerMisc(playerid);
				}
			}

			DestroyDynamicObject(PLANTS[i][plant_OBJECT_ID]);
			DestroyDynamic3DTextLabel(PLANTS[i][plant_LABEL_ID]);
			ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, 0, 1, 1, 0, 0, 1);

			new tmp_PLANTS[PLANTS_ENUM]; PLANTS[i] = tmp_PLANTS;
			return 1;
		}
	}

	return 1;
}

ExitCrack(playerid)
{
	if (CHARACTER_INFO[playerid][ch_STATE] != ROLEPLAY_STATE_CRACK) return 0;
	if (PLAYER_TEMP[playerid][py_CUFFED]) return 0;
	if (PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] > 0) return 0;

	new str_text[144];
	format(str_text, sizeof(str_text), "[KILL] %s (%d) ha aceptado muerte.", PLAYER_TEMP[playerid][py_NAME], playerid);
	SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 1);

	SetPlayerHealthEx(playerid, 0.0);
	SetPlayerChatBubble(playerid, "\n\n\n\n* Ha muerto.\n\n\n", 0xffcb90FF, 20.0, 5000);
	TogglePlayerControllableEx(playerid, true);
	return 1;
}

CheckPlayerHouseDoor(playerid)
{
	if (CHARACTER_INFO[playerid][ch_STATE] != ROLEPLAY_STATE_OWN_PROPERTY) return 0;
	if (PLAYER_TEMP[playerid][py_LAST_PICKUP_ID] == 0) return 0;

	new info[3];
	Streamer_GetArrayData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_EXTRA_ID, info);
	if (info[0] != PICKUP_TYPE_PROPERTY) return 0;

	new Float:x, Float:y, Float:z;
	Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_X, x);
	Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Y, y);
	Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Z, z);

	if (!IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) return 0;

	if (info[2] == 1) // Est� en el Pickup Interior
	{
		if (PROPERTY_INFO[info[1]][property_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID])
		{
			if (PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID] == INVALID_PLAYER_ID) return ShowPlayerMessage(playerid, "~r~Nadie toc� la puerta", 3);
			if (!IsPlayerConnected(PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID])) return ShowPlayerMessage(playerid, "~r~Nadie toc� la puerta o ya se fue.", 3);
			if (!IsPlayerInRangeOfPoint(PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID], 3.0, PROPERTY_INFO[info[1]][property_EXT_X], PROPERTY_INFO[info[1]][property_EXT_Y], PROPERTY_INFO[info[1]][property_EXT_Z])) return ShowPlayerMessage(playerid, "~r~Nadie toc� la puerta o ya se fue.", 3);
			if (PLAYER_TEMP[playerid][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~Este jugador no puede entrar ahora.", 3);

			PLAYER_TEMP[PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID]][py_HOSPITAL] = GetNearestHospitalForPlayer(PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID]);
			if (PLAYER_TEMP[PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID]][py_HOSPITAL] == -1) PLAYER_TEMP[PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID]][py_HOSPITAL] = 1;

			CHARACTER_INFO[PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID]][ch_STATE] = ROLEPLAY_STATE_GUEST_PROPERTY;
			CHARACTER_INFO[PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID]][ch_INTERIOR_EXTRA] = PROPERTY_INFO[info[1]][property_ID];
			PLAYER_TEMP[PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID]][py_PROPERTY_INDEX] = info[1];
			SetPlayerPosEx(PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_X], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_Y], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_Z], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_ANGLE], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_INTERIOR], PROPERTY_INFO[info[1]][property_ID], false /*PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_FREEZE]*/, true);
			FreezePlayer(PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID]);
		}
		else return 0;
	}
	else return 0;
	return 1;
}

forward RestartBalloon(balloon_id);
public RestartBalloon(balloon_id)
{
	#if DEBUG_MODE == 1
		printf("RestartBalloon"); // debug juju
	#endif

	BackBalloonToStart(balloon_id, 10.0);
	return 1;
}

forward UpBalloon(balloon_id);
public UpBalloon(balloon_id)
{
	#if DEBUG_MODE == 1
		printf("UpBalloon"); // debug juju
	#endif

	SetBalloonAction(balloon_id, float(minrand(200, 300)), -float(minrand(1700, 1950)), 90.0, 10.0);
	return 1;
}

CheckBallonAction(playerid)
{
	// Buy
	if (IsPlayerInRangeOfPoint(playerid, 1.0, -370.339721, -1634.205932, 25.057666))
	{
		if (PLAYER_MISC[playerid][MISC_BALLOON]) return ShowPlayerMessage(playerid, "~r~Ya tienes un boleto", 2);
		if (CHARACTER_INFO[playerid][ch_CASH] <= 200) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente", 2);
     	
     	PLAYER_MISC[playerid][MISC_BALLOON] = true;
     	ShowPlayerNotification(playerid, "Sube a un globo y presiona la tecla Y para comenzar el viaje.", 4);
     	GivePlayerCash(playerid, -200);
		return 1;
	}

	// Start
	if (PLAYER_MISC[playerid][MISC_BALLOON])
	{
		for(new i = 0; i != sizeof HOTAIR_BALLOONS; i ++)
		{
			if (IsPlayerInRangeOfPoint(playerid, 1.5, HOTAIR_BALLOONS[i][balloon_X], HOTAIR_BALLOONS[i][balloon_Y], HOTAIR_BALLOONS[i][balloon_Z]))
			{
				if (HOTAIR_BALLOONS[i][balloon_ACTIVE] == false)
				{
					PLAYER_MISC[playerid][MISC_BALLOON] = false;
					SetBalloonAction(i, HOTAIR_BALLOONS[i][balloon_X], HOTAIR_BALLOONS[i][balloon_Y], 60.0, 10.0);
					SetTimerEx("UpBalloon", 4000, false, "i", i);
					SetTimerEx("RestartBalloon", 60000, false, "i", i);
					ShowPlayerNotification(playerid, "�Trata de no saltar o moverte demasiado porque te puedes caer!", 3);
					return 1;
				}
			}
		}
	}
	return 1;
}

SetVehicleLightsAction(playerid)
{
	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_LIGHTS])
		{
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_LIGHTS] = 0;
			UpdateVehicleParams(vehicleid);

			ShowPlayerMessage(playerid, "Luces ~r~apagadas", 2);

			if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID]) SetPlayerChatBubble(playerid, "\n\n\n\n* Ha apagado las luces de su veh�culo.\n\n\n", 0xffcb90FF, 20.0, 5000);
			else SetPlayerChatBubble(playerid, "\n\n\n\n* Ha apagado las luces de su veh�culo.\n\n\n", 0xffcb90FF, 20.0, 5000);
		}
		else
		{
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_LIGHTS] = 1;
			UpdateVehicleParams(vehicleid);

			ShowPlayerMessage(playerid, "Luces ~g~encendidas", 2);

			if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID]) SetPlayerChatBubble(playerid, "\n\n\n\n* Ha encendido las luces de su veh�culo.\n\n\n", 0xffcb90FF, 20.0, 5000);
			else SetPlayerChatBubble(playerid, "\n\n\n\n* Ha encendido las luces de su veh�culo.\n\n\n", 0xffcb90FF, 20.0, 5000);
		}
	}
	return 1;
}

BuyProperty(playerid, id)
{
	if (BANK_ACCOUNT[playerid][bank_account_ID] == 0) return ShowPlayerMessage(playerid, "~r~No puedes comprar una propiedad sin cuenta bancaria.", 3);

	new DBResult:Result, DB_Query[120], player_properties;
	format(DB_Query, sizeof(DB_Query), "SELECT COUNT(`ID_USER`) AS `PROPERTIES` FROM `PROPERTY_OWNER` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);
	if (db_num_rows(Result)) player_properties = db_get_field_assoc_int(Result, "PROPERTIES");
	db_free_result(Result);

	if (ACCOUNT_INFO[playerid][ac_SU])
	{
		if (player_properties >= MAX_SU_PROPERTIES) return ShowPlayerMessage(playerid, "~r~No puedes comprar m�s propiedades.", 3);
	}
	else if (player_properties >= MAX_NU_PROPERTIES) return ShowPlayerMessage(playerid, "~r~No puedes comprar m�s propiedades.", 3);

	new index = GetPropertyIndexByID(id);
	if (index == -1) return ShowPlayerMessage(playerid, "~r~Error al intentar comprar la propiedad, intenta luego.", 3);

	if (PROPERTY_INFO[index][property_SOLD]) return 1;
	if (PROPERTY_INFO[index][property_LEVEL] > ACCOUNT_INFO[playerid][ac_LEVEL]) return ShowPlayerMessage(playerid, "~r~No tienes el nivel suficiente.", 3);
	if (PROPERTY_INFO[index][property_VIP_LEVEL] > ACCOUNT_INFO[playerid][ac_SU]) return ShowPlayerMessage(playerid, "~r~No tienes VIP.", 3);
	if (PROPERTY_INFO[index][property_EXTRA] > ACCOUNT_INFO[playerid][ac_SD]) return ShowPlayerMessage(playerid, "~r~No tienes las hycoins suficientes.", 3);
	if (BANK_ACCOUNT[playerid][bank_account_BALANCE] >= PROPERTY_INFO[index][property_PRICE])
	{
		PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX] = index;
		ShowDialog(playerid, DIALOG_CONFIRM_BUY_PROPERTY);
	}
	else ShowPlayerMessage(playerid, "~r~No tienes el dinero suficiente.", 3);
	return 1;
}

CheckAndBuyProperty(playerid)
{
	if (PLAYER_TEMP[playerid][py_ACTUAL_PROPERTY] > 0) BuyProperty(playerid, PLAYER_TEMP[playerid][py_ACTUAL_PROPERTY]);
}

Menu:PROPERTY_MENU(playerid, response, listitem)
{
    if (response == MENU_RESPONSE_SELECT)
    {
    	switch(listitem)
    	{
    		case 0: ShowDialog(playerid, DIALOG_PROPERTY_NAME);
			case 1:
			{
				new total;
				for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
				{
					if (IsPlayerConnected(i))
					{
						if ( CHARACTER_INFO[i][ch_STATE] == ROLEPLAY_STATE_GUEST_PROPERTY && CHARACTER_INFO[i][ch_INTERIOR_EXTRA] == PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID])
						{
							CHARACTER_INFO[i][ch_STATE] = ROLEPLAY_STATE_NORMAL;
							CHARACTER_INFO[i][ch_INTERIOR_EXTRA] = 0;
							PLAYER_TEMP[i][py_PROPERTY_INDEX] = -1;
							SetPlayerPosEx(i, PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_X], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_Y], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_Z], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_ANGLE], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_INTERIOR], 0, PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_FREEZE], false);
							StopAudioStreamForPlayer(i);
							ShowPlayerMessage(i, "~r~Te echaron de la propiedad.", 4);
							total ++;
						}
					}
				}

				if (total == 0) ShowPlayerMessage(playerid, "~r~No hay nadie en tu propiedad", 2);
				else
				{
					new str_text[128];
					format(str_text, sizeof(str_text), "Has echado %d personas de tu propiedad.", total);
					ShowPlayerNotification(playerid, str_text, 4);
				}
			}
			case 2:
			{
				ShowFurnitureMenu(playerid);
			}
			case 3:
			{
				ShowInventory(playerid, 1);
			}
			case 4:
			{
				ShowInventory(playerid, 2);
			}
    	}
    }
    return 1; 
}


ShowPropertyMenu(playerid)
{
	new caption[40];
	format(caption, sizeof caption, "%s", PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_NAME]);

	ShowPlayerMenu(playerid, PROPERTY_MENU, TextToSpanish(caption));

	AddPlayerMenuItem(playerid, "Cambiar nombre");
	AddPlayerMenuItem(playerid, "Echar a todos");
	AddPlayerMenuItem(playerid, "Personalizar");
	AddPlayerMenuItem(playerid, "Sacar items");
	AddPlayerMenuItem(playerid, "Meter items");

	PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	return 1;
}

Menu:PROPERTY_FURNITURE(playerid, response, listitem)
{
    if (response == MENU_RESPONSE_SELECT)
    {
    	switch(listitem)
    	{
    		case 0: ShowDialog(playerid, DIALOG_FURNITURE_LIST);
    		case 1..7:
    		{
    			for(new i = 0; i != MAX_LISTITEMS; i ++) PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][i] = -1;
    			PLAYER_TEMP[playerid][py_DIALOG_RESPONDED] = false;

    			new
    				type = (listitem - 1),
    				sub_string[64],
    				dialog_string[64 * 32],
    				total_objects
    			;

				for (new i; i < sizeof(FURNITURE_OBJECTS); i++)
				{
					if (FURNITURE_OBJECTS[i][furniture_object_TYPE] == type)
					{
						PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][total_objects] = i;

	           			format(sub_string, sizeof(sub_string), "%i\t%s~n~~g~~h~$%d\n", FURNITURE_OBJECTS[i][furniture_object_MODELID], TextToSpanish(FURNITURE_OBJECTS[i][furniture_object_NAME]), FURNITURE_OBJECTS[i][furniture_object_PRICE]);
	           			strcat(dialog_string, sub_string);

	           			total_objects ++;
	           		}
				}

				ShowPlayerDialog(playerid, DIALOG_FURNITURE_SHOP, DIALOG_STYLE_PREVIEW_MODEL, "Comprar muebles", dialog_string, "Comprar", "Cerrar");
    		}
    	}
    }
    return 1; 
}

ShowFurnitureMenu(playerid)
{
	ShowPlayerMenu(playerid, PROPERTY_FURNITURE, "Personalizar");

	AddPlayerMenuItem(playerid, "Mis muebles");
	AddPlayerMenuItem(playerid, "Camas");
	AddPlayerMenuItem(playerid, "Cuadros");
	AddPlayerMenuItem(playerid, TextToSpanish("Decoraci�n"));
	AddPlayerMenuItem(playerid, TextToSpanish("Electrodom�sticos"));
	AddPlayerMenuItem(playerid, TextToSpanish("Iluminaci�n"));
	AddPlayerMenuItem(playerid, "Mesas");
	AddPlayerMenuItem(playerid, "Sillas");

	PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	return 1;
}

ShowPropertyOptions(playerid)
{
    if (PLAYER_TEMP[playerid][py_LAST_PICKUP_ID] == 0) return 0;

    new info[3];
    Streamer_GetArrayData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_EXTRA_ID, info);
    if (info[0] != PICKUP_TYPE_PROPERTY) return 0;

    new Float:x, Float:y, Float:z;
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_X, x);
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Y, y);
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Z, z);

    if (!IsPlayerInRangeOfPoint(playerid, 80.0, x, y, z)) return 0;

    if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_OWN_PROPERTY)
    {
        if (info[2] == 1) // Est� en el Pickup Interior
        {
            if (PROPERTY_INFO[info[1]][property_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID])
            {
            	if (!PLAYER_TEMP[playerid][py_EDITING_MODE])
            	{
                	PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] = info[1];
                	ShowPropertyMenu(playerid);
                }
            }
            else return 0;
        }
        else return 0;
    }
    else if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_GUEST_PROPERTY)
    {
        if (info[2] == 1) // Est� en el Pickup Interior
        {
            if (PROPERTY_INFO[info[1]][property_CREW])
            {
                if (PROPERTY_INFO[info[1]][property_CREW_ID] != PLAYER_CREW[playerid][player_crew_ID]) return ShowPlayerMessage(playerid, "~r~Esta no es una propiedad de tu crew.", 3);
                if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_DELETE_PROPERTIES]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);
                if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_FIGHTING]) return ShowPlayerMessage(playerid, "~r~No puedes liberar esta propiedad mientras tu crew est� en combate.", 3);

                PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] = info[1];
                ShowDialog(playerid, DIALOG_CREW_LEAVE_PROPERTY);
            }
            else return 0;
        }
        else return 0;
    }
    else return 0;
    return 1;
}

CheckBlackMarket(playerid)
{
    if (IsPlayerInRangeOfPoint(playerid, 1.5, 2164.021484, -1164.398925, -16.871662) || IsPlayerInRangeOfPoint(playerid, 1.5, -190.378494, -2254.421386, 25.593534))
    {
	    if (PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "No puedes comprar aqu� siendo polic�a.", 3);
	    if (ACCOUNT_INFO[playerid][ac_LEVEL] < 2) return ShowPlayerMessage(playerid, "~r~Tienes que ser nivel 2.", 3);
	    ShowDialog(playerid, DIALOG_BLACK_MARKET_SELECT);
	}
    return 1;
}

CheckRodShop(playerid)
{
	if (!IsPlayerInRangeOfPoint(playerid, 1.5, 2125.901123, -65.776679, 1.585963)) return 1;
	ShowDialog(playerid, DIALOG_BUY_ROD);
	return 1;
}

CheckFixKitShop(playerid)
{
	if (IsPlayerInRangeOfPoint(playerid, 1.0, 1060.838256, -917.609741, 43.124679))
	{
		ShowDialog(playerid, DIALOG_BUY_FIXKIT);
	}
	return 1;
}

CheckMinerShop(playerid)
{
	if (!IsPlayerInRangeOfPoint(playerid, 1.5, 509.910125, -708.205383, 19.242210)) return 1;
	ShowDialog(playerid, DIALOG_MINER_STORE);
	return 1;
}

CheckFishSell(playerid)
{
	if (IsPlayerInRangeOfPoint(playerid, 1.5, 2157.049560, -92.550987, 2.798943))
	{
		if (PLAYER_MISC[playerid][MISC_FISH])
		{
			ShowDialog(playerid, DIALOG_SELL_FISH);
		}
		else ShowPlayerMessage(playerid, "~r~No tienes peces que vender.", 3);
	}
	return 1;
}

CheckDrugBlackMarket(playerid)
{
    if (!IsPlayerInRangeOfPoint(playerid, 1.5, 2310.057128, -1789.786865, 1600.751953)) return 1;
    ShowDialog(playerid, DIALOG_DRUG_MARKET);
    return 1;
}

ShowRangeUser(playerid)
{
	new 
		target_player = GetPlayerCameraTargetPlayer(playerid),
		Float:x, Float:y, Float:z;
	
	PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] = target_player;
	GetPlayerPos(target_player, x, y, z);

	if (IsPlayerInRangeOfPoint(playerid, 1.2, x, y, z))
	{
		ShowDialog(playerid, DIALOG_RANGE_USER);
	}
	return 1;
}

forward RespawnMinerRock(rock_id);
public RespawnMinerRock(rock_id)
{
	#if DEBUG_MODE == 1
		printf("RespawnMinerRock"); // debug juju
	#endif

	new color_type = GetRockColorType(ROCKS_OBJ[rock_id][r_TYPE]);
	ROCKS_OBJ[rock_id][r_OBJECT_ID] = CreateDynamicObject(ROCKS_OBJ[rock_id][r_MODELID], ROCKS_OBJ[rock_id][r_X], ROCKS_OBJ[rock_id][r_Y], ROCKS_OBJ[rock_id][r_Z], ROCKS_OBJ[rock_id][r_RX], ROCKS_OBJ[rock_id][r_RY], ROCKS_OBJ[rock_id][r_RZ], ROCKS_OBJ[rock_id][r_WORLD], ROCKS_OBJ[rock_id][r_INTERIOR]);
	SetDynamicObjectMaterial(ROCKS_OBJ[rock_id][r_OBJECT_ID], 0, -1, "none", "none", color_type);
	ROCKS_OBJ[rock_id][r_ACTIVATED] = true;
	return 1;
}

forward PutPlayerRock(playerid, rock_type);
public PutPlayerRock(playerid, rock_type)
{
	#if DEBUG_MODE == 1
		printf("PutPlayerRock"); // debug juju
	#endif

	ResetItemBody(playerid);

	PLAYER_TEMP[playerid][py_ROCK] = true;
	PLAYER_TEMP[playerid][py_ACTUAL_ROCK] = rock_type;

	SetPlayerAttachedObject(playerid, 9, 3930, 1, 0.1760, 0.4369, 0.0000, 0.0000, 0.0000, 30.5999, 0.5240, 0.5149, 0.6189, GetRockColorType(ROCKS_OBJ[rock_type][r_TYPE]), GetRockColorType(ROCKS_OBJ[rock_type][r_TYPE]));
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	return 1;
}

forward UpdateMining(playerid, rock_id);
public UpdateMining(playerid, rock_id)
{
	#if DEBUG_MODE == 1
		printf("UpdateMining"); // debug juju
	#endif

	if (GetPlayerInterior(playerid) == 0)
	{
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][35]);
		return 0;
	}

	new str_text[64];
	PLAYER_TEMP[playerid][py_MINING_PROGRESS] += minrand(1, 5);

	format(str_text, sizeof(str_text), "Picando %s...~n~~r~%d %", GetRockNameType(ROCKS_OBJ[rock_id][r_TYPE]), PLAYER_TEMP[playerid][py_MINING_PROGRESS]);
	ShowPlayerMessage(playerid, str_text, 2);
	ApplyAnimation(playerid, "SWORD", "SWORD_4", 4.1, true, false, false, false, 0, true);

	if (PLAYER_TEMP[playerid][py_MINING_PROGRESS] > 98)
	{
		ShowPlayerMessage(playerid, "Ve a una ~r~procesadora~w~ para entregar el material.", 4);

		ClearAnimations(playerid);
		TogglePlayerControllableEx(playerid, true);

		PLAYER_TEMP[playerid][py_MINING_PROGRESS] = 0;
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][35]);

		SetTimerEx("PutPlayerRock", 800, false, "id", playerid, ROCKS_OBJ[rock_id][r_TYPE]);
		ApplyAnimation(playerid, "CARRY", "LIFTUP", 4.1, false, false, false, false, 0, false);

		DestroyDynamicObject(ROCKS_OBJ[rock_id][r_OBJECT_ID]);
	}
	return 1;
}

StartMining(playerid, rock_id)
{
	new p_interior = GetPlayerInterior(playerid);
	if (p_interior < 25 || p_interior > 27) return 0;

	new str_text[64];
	ApplyAnimation(playerid, "SWORD", "SWORD_4", 4.1, true, false, false, false, 0, true);
	
	format(str_text, sizeof(str_text), "Picando %s...~n~~r~0 %", GetRockNameType(ROCKS_OBJ[rock_id][r_TYPE]));
	ShowPlayerMessage(playerid, str_text, 2);

	TogglePlayerControllableEx(playerid, false);
	
	ROCKS_OBJ[rock_id][r_ACTIVATED] = false;
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][35]);
	PLAYER_TEMP[playerid][py_TIMERS][35] = SetTimerEx("UpdateMining", GetRockMiningTime(ROCKS_OBJ[rock_id][r_TYPE]), true, "ii", playerid, rock_id);
	ApplyAnimation(playerid, "SWORD", "SWORD_4", 4.1, true, false, false, false, 0, true);
	SetTimerEx("RespawnMinerRock", 60000, false, "i", rock_id);
	return 1;
}

CheckCraneSiteRequest(playerid)
{
    if (IsPlayerInRangeOfPoint(playerid, 1.0, 1795.293823, -1407.773681, 2770.660156)) 
    {
        ShowDialog(playerid, DIALOG_CRANE_SELECT_VEHICLE);
    }
    return 1;
}

ShellingThings(playerid)
{
    if (IsPlayerInRangeOfPoint(playerid, 1.0, 1796.071655, -1414.565307, 2770.660156)) 
    {
        if (BANK_ACCOUNT[playerid][bank_account_ID] == 0) return ShowPlayerMessage(playerid, "~r~Necesitas tener una cuenta bancaria para poder realizar estas operaciones.", 3);
        {
            ShowDialog(playerid, DIALOG_NOTARY);
        }
    }
    return 1;
}

CheckFoodShop(playerid)
{
	if (PLAYER_TEMP[playerid][py_INTERIOR_INDEX] == -1) return 0;
	if (ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE] == INTERIOR_NO_INFO) return 0;


	new index = GetFastFoodLocalIndexByIntType(ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE]);
	if (index == -1) return 0;

	if (!IsPlayerInRangeOfPoint(playerid, 1.0, Fast_Food_Positions[index][fast_food_X], Fast_Food_Positions[index][fast_food_Y], Fast_Food_Positions[index][fast_food_Z])) return 0;

	switch(Fast_Food_Positions[index][fast_food_INTERIOR_TYPE])
	{
		case INTERIOR_BURGER_SHOT: ShowDialog(playerid, DIALOG_FOOD_BURGER);
		case INTERIOR_PIZZA: ShowDialog(playerid, DIALOG_FOOD_PIZZA);
		case INTERIOR_CLUCKIN_BELL: ShowDialog(playerid, DIALOG_FOOD_CLUCKIN);
	}
	return 1;
}

CheckClothShop(playerid)
{
	if (PLAYER_TEMP[playerid][py_INTERIOR_INDEX] == -1) return 0;
	if (ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE] == INTERIOR_NO_INFO) return 0;

	new shop = GetClothingShopIndexByIntType(ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE]);
	if (shop == -1) return 0;

	if (!IsPlayerInRangeOfPoint(playerid, 2.0, Clothing_Shop_Positions[shop][clothing_shop_X], Clothing_Shop_Positions[shop][clothing_shop_Y], Clothing_Shop_Positions[shop][clothing_shop_Z])) return 0;

	ShowDialog(playerid, DIALOG_CLOTH_STORE);
	return 1;
}

CheckAndExecuteHospitalShop(playerid)
{
	if (GetPlayerInterior(playerid) > 0)
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.0, -198.002197, -1762.759643, 675.768737))
		{
			ShowDialog(playerid, DIALOG_HOSPITAL_SHOP);
		}
	}
	return 1;
}

CheckShopAndExecute(playerid)
{
	if (GetPlayerInterior(playerid) > 0)
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.0, -27.964675, -89.948631, 1003.546875))
		{
			ShowDialog(playerid, DIALOG_247_LIST);
		}
	}
	return 0;
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

CheckRegister(playerid)
{
	if (IsPlayerInRangeOfPoint(playerid, 2.0, 1879.2662, -1701.0118, 5216.7100))
	{
		ShowDialog(playerid, DIALOG_REGISTER_CIVIL);
	}
	return 1;
}

#if defined HALLOWEEN_MODE
	CheckPumpkinWitch(playerid)
	{
		if (IsPlayerInRangeOfPoint(playerid, 2.0, 817.2799, -1103.3270, 25.7921))
		{
			if (PLAYER_MISC[playerid][MISC_PUMPKIN] <= 0) return ShowPlayerMessage(playerid, "~r~No tienes calabazas.", 3);
			ShowDialog(playerid, DIALOG_SELL_PUMPKIN);
		}
		return 1;
	}
#endif

#if defined CHRISTMAS_MODE
	CheckRocketStore(playerid)
	{
		if (IsPlayerInRangeOfPoint(playerid, 2.0, 1537.7760, -1658.0721, 13.5469))
		{
			ShowDialog(playerid, DIALOG_BUY_ROCKET);
		}
		return 1;
	}
#endif

CheckClubMenu(playerid)
{
	if (PLAYER_TEMP[playerid][py_CLUB_INDEX] != -1)
	{
		new 
			club = PLAYER_TEMP[playerid][py_CLUB_INDEX],
			interior = CLUBS_INFO[club][club_INTERIOR]
		;

		if (IsPlayerInRangeOfPoint(playerid, 1.0, CLUBS_INTERIORS[interior][interior_BUY_X], CLUBS_INTERIORS[interior][interior_BUY_Y], CLUBS_INTERIORS[interior][interior_BUY_Z]))
		{
			ShowDialog(playerid, DIALOG_CLUB);
		}
	}
	return 1;
}

Menu:CLUB_MENU(playerid, response, listitem)
{
    if (response == MENU_RESPONSE_SELECT)
    {
    	new club = PLAYER_TEMP[playerid][py_CLUB_INDEX];

    	switch(listitem)
    	{
    		case 0: ShowDialog(playerid, DIALOG_CLUB_NAME);
    		case 1: ShowDialog(playerid, DIALOG_CLUB_WELCOME);
    		case 2: ShowDialog(playerid, DIALOG_CLUB_PRODUCTS);
    		case 3:
    		{
    			CLUBS_INFO[club][club_STATE] = !CLUBS_INFO[club][club_STATE];

    			new DB_Query[128];
    			format(DB_Query, sizeof(DB_Query), "\
					UPDATE `CLUB_INFO` SET\
						`STATE` = '%d' \
					WHERE `ID` = '%d';\
				", CLUBS_INFO[club][club_STATE], club);
				db_free_result(db_query(Database, DB_Query));

				new str_text[264];
				format(str_text, 264, ""COL_WHITE"%s (%s)\nEntrada: %s\nPropietario:{35A7FF} %s", CLUBS_INFO[club][club_NAME], (CLUBS_INFO[club][club_STATE] ? ""COL_GREEN"Abierto"COL_WHITE"" : ""COL_RED"Cerrado"COL_WHITE""), GetClubEnterPrice(club), PLAYER_TEMP[playerid][py_NAME]);
				UpdateDynamic3DTextLabelText(CLUBS_INFO[club][club_EXT_LABEL_ID], 0xF7F7F700, str_text);

				CheckClubOptions(playerid);
    		}
			case 4:
			{
				new total;
				for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
				{
					if (IsPlayerConnected(i))
					{
						if ( CHARACTER_INFO[i][ch_STATE] == ROLEPLAY_STATE_GUEST_PROPERTY && CHARACTER_INFO[i][ch_INTERIOR_EXTRA] == PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID])
						{
							CHARACTER_INFO[i][ch_STATE] = ROLEPLAY_STATE_NORMAL;
							CHARACTER_INFO[i][ch_INTERIOR_EXTRA] = 0;
							PLAYER_TEMP[i][py_PROPERTY_INDEX] = -1;
							PLAYER_TEMP[i][py_CLUB_INDEX] = -1;
							SetPlayerPosEx(i, PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_X], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_Y], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_Z], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_ANGLE], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_INTERIOR], 0, PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_FREEZE], false);
							StopAudioStreamForPlayer(i);
							ShowPlayerMessage(i, "~r~Te echaron de la propiedad.", 4);
							total ++;
						}
					}
				}

				if (total == 0) ShowPlayerMessage(playerid, "~r~No hay nadie en tu propiedad", 2);
				else
				{
					new str_text[128];
					format(str_text, sizeof(str_text), "Has echado ~y~%d~w~ personas de tu propiedad.", total);
					ShowPlayerMessage(playerid, str_text, 5);
				}

				CheckClubOptions(playerid);
			}
			case 5:
			{
				if (CLUBS_INFO[club][club_BALANCE] <= 0)
				{
					CheckClubOptions(playerid);
					ShowPlayerMessage(playerid, "~r~No hay fondos para retirar.", 3);
					return 0;
				}

				GivePlayerCash(playerid, CLUBS_INFO[club][club_BALANCE], false);

				new DB_Query[128];
				CLUBS_INFO[club][club_BALANCE] = 0;
				format(DB_Query, sizeof(DB_Query), "\
					UPDATE `CLUB_INFO` SET\
						`BALANCE` = '%d' \
					WHERE `ID` = '%d';\
				", CLUBS_INFO[club][club_BALANCE], club);
				db_free_result(db_query(Database, DB_Query));

				CheckClubOptions(playerid);
			}
			case 6: ShowDialog(playerid, DIALOG_CLUB_RADIO);
			case 7: ShowDialog(playerid, DIALOG_CLUB_PRICE);
			case 8: ShowDialog(playerid, DIALOG_CLUB_SELL);
    	}
    }
    return 1; 
}

CheckClubOptions(playerid)
{
	if (PLAYER_TEMP[playerid][py_CLUB_INDEX] != -1)
	{
		new club = PLAYER_TEMP[playerid][py_CLUB_INDEX];

		if (GetPlayerInterior(playerid) != 0)
		{
			if (CLUBS_INFO[club][club_USER_ID] == ACCOUNT_INFO[playerid][ac_ID])
			{
				new caption[40];
				format(caption, sizeof caption, "%s", CLUBS_INFO[club][club_NAME]);

				ShowPlayerMenu(playerid, CLUB_MENU, TextToSpanish(caption));

				AddPlayerMenuItem(playerid, "Cambiar nombre");
				AddPlayerMenuItem(playerid, "Cambiar bienvenida");
				AddPlayerMenuItem(playerid, "Modificar productos");
				AddPlayerMenuItem(playerid, sprintf("Puerta (%s)", (CLUBS_INFO[club][club_STATE] ? "Abierta" : "Cerrada")));
				AddPlayerMenuItem(playerid, "Echar a todos");
				AddPlayerMenuItem(playerid, "Retirar fondos", sprintf("Fondos: %d$", CLUBS_INFO[club][club_BALANCE]));
				AddPlayerMenuItem(playerid, "Cambiar radio");
				AddPlayerMenuItem(playerid, "Precio de entrada");
				AddPlayerMenuItem(playerid, "Vender");

				PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
			}
		}
	}
	return 1;
}

CheckPoliceEquipeSite(playerid)
{
	if (PLAYER_WORKS[playerid][WORK_POLICE])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.0, 1867.665283, -1712.853515, 5216.709960))
		{
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
		}
	}
	return 1;
}

CheckMafiaEquipeSite(playerid)
{
	if (PLAYER_WORKS[playerid][WORK_MAFIA])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.3, 1475.4032, 2773.5891, 10.8203))
		{
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
		}
	}

	if (PLAYER_WORKS[playerid][WORK_MAFIA])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.3, -1387.1334, 492.8735, 2.1851))
		{
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
		}
	}

	if (PLAYER_WORKS[playerid][WORK_ENEMY_MAFIA])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.3, 3855.066162, -1290.975585, 7547.983398))
		{
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
		}
	}

	if (PLAYER_WORKS[playerid][WORK_OSBORN])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.3, 882.789611, 1896.002319, -93.898712))
		{
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
		}
	}

	if (PLAYER_WORKS[playerid][WORK_OSBORN])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.3, 1298.5734, -799.0347, 84.1406))
		{
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
		}
	}

	if (PLAYER_WORKS[playerid][WORK_CONNOR])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.3, 419.4871, -1001.7376, 92.8918))
		{
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
		}
	}

	if (PLAYER_WORKS[playerid][WORK_DIVISO])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.3, 1141.0912, -2064.0176, 69.0259))
		{
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
		}
	}
	return 1;
}

CheckPlayerDoors(playerid)
{
	new vehicleid = INVALID_VEHICLE_ID;
	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		vehicleid = GetPlayerVehicleID(playerid);
	}
	else if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		vehicleid = GetPlayerCameraTargetVehicle(playerid);
	}

	if (vehicleid == INVALID_VEHICLE_ID) return 0;
	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return 0;
	if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID] || IsPlayerInKeys(PLAYER_VEHICLES[vehicleid][player_vehicle_ID], ACCOUNT_INFO[playerid][ac_ID]))
	{
		new Float:x, Float:y, Float:z;
		GetVehiclePos(vehicleid, x, y, z);
		if (GetPlayerDistanceFromPoint(playerid, x, y, z) < 10.0)
		{
			if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_DOORS] == 0)
			{
			    CloseVehicle(playerid, vehicleid);
			    return 0;
		    }
		    else
		    {
			    OpenVehicle(playerid, vehicleid);
			}
		}
	}
	return 1;
}

OpenVehicle(playerid, vehicleid)
{
	if (!ACCOUNT_INFO[playerid][ac_SU] && !PLAYER_VEHICLES[vehicleid][player_vehicle_ACCESSIBLE])
	{
		ShowPlayerMessage(playerid, "Este veh�culo est� bloqueado, desbloqu�alo siendo ~p~VIP", 3);
		return 1;
	}

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_DOORS] = 0;
	UpdateVehicleParams(vehicleid);
	SetPlayerChatBubble(playerid, "\n\n\n\n* Ha abierto las puertas de su veh�culo.\n\n\n", 0xffcb90FF, 20.0, 5000);

	new str_text[64];
	format(str_text, sizeof(str_text), "~n~~n~%s ~g~destrabado", VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME]);
	ShowPlayerMessage(playerid, str_text, 1);

	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
	return 1;
}

CloseVehicle(playerid, vehicleid)
{
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_LAST_CLOSED_TIME] = gettime();
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_DOORS] = 1;
	UpdateVehicleParams(vehicleid);
	SetPlayerChatBubble(playerid, "\n\n\n\n* Ha cerrado las puertas de su veh�culo.\n\n\n", 0xffcb90FF, 20.0, 5000);

	new str_text[64];
	format(str_text, sizeof(str_text), "~n~~n~%s ~r~trabado", VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME]);
	ShowPlayerMessage(playerid, str_text, 1);

	PlayerPlaySound(playerid, 1145, 0.0, 0.0, 0.0);
	return 1;
}

SetEngineAction(playerid)
{
    if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] == 481 || GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] == 509 || GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] == 510)
		{
			if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE])
        	{
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 1;
				UpdateVehicleParams(vehicleid);
			}
			return 1;
		}

        if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE] == VEHICLE_TYPE_WORK)
        {
            if (TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADING]) return ShowPlayerMessage(playerid, "~r~Debes esperar a que se termine de cargar el cami�n.", 3);
            if (TRUCK_VEHICLE[vehicleid][truck_vehicle_UNLOADING]) return ShowPlayerMessage(playerid, "~r~Debes esperar a que se termine de descargar el cami�n.", 3);
        }
        
        if (PLAYER_TEMP[playerid][py_IN_TUNING_GARAGE]) return ShowPlayerMessage(playerid, "~r~Primero debes terminar de hacer lo que est�s haciendo.", 2);
        
        KillTimer(PLAYER_TEMP[playerid][py_TIMERS][7]);
        if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE])
        {
            PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_NOFUEL][p_ac_info_IMMUNITY] = gettime() + 15;
            GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 0;
            UpdateVehicleParams(vehicleid);
            
            if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID]) ShowPlayerMessage(playerid, "Veh�culo ~r~detenido", 2);
            else ShowPlayerMessage(playerid, "Veh�culo ~r~detenido", 2);

            SetPlayerChatBubble(playerid, "\n\n\n\n* Ha apagado su veh�culo.\n\n\n", 0xffcb90FF, 20.0, 5000);
        }
        else
        {
        	ShowPlayerMessage(playerid, "Encendiendo...", 2);
            PLAYER_TEMP[playerid][py_TIMERS][7] = SetTimerEx("StartVehicleEngine", 1000, false, "ii", playerid, vehicleid);
        }
    }

    if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK)
	{
		new Float:x, Float:y, Float:z;
	    GetPlayerPos(playerid, x, y, z);
	    SetPlayerPos(playerid, x, y, z);
	    ApplyAnimation(playerid, "SWEET", "SWEET_INJUREDLOOP", 4.1, true, false, false, 1, 0, 1);
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
							format(str_text, sizeof(str_text), "Fuiste encarcelado por %s. Raz�n: %s.", name, CHARACTER_INFO[playerid][ch_JAIL_REASON]);
							SendClientMessage(playerid, 0xF7F7F7CC, str_text);
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
						ShowPlayerNotification(playerid, "Fuiste ingresado en el centro m�dico m�s cercano.", 3);
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
							ShowPlayerNotification(playerid, "Estas en el centro m�dico m�s cercano, cuando te recuperes te llevaran a la c�rcel.", 3);
							SetPlayerPoliceSearchLevel(playerid, 0);
						}
						else
						{
						    ShowPlayerNotification(playerid, "Fuiste ingresado en el centro m�dico m�s cercano.", 3);
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
					if (GRAFFITIS_OBJ[i][g_ACTIVATED] == true)
					{
						SetPlayerMapIcon(playerid, 0, GRAFFITIS_OBJ[i][g_X], GRAFFITIS_OBJ[i][g_Y], GRAFFITIS_OBJ[i][g_Z], 63, 0, MAPICON_GLOBAL);
					}
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

public OnPlayerDeath(playerid, killerid, reason)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerDeath %d %d %d", playerid, killerid, reason); // debug juju
	#endif

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
				PLAYER_MISC[playerid][MISC_CONFIG_LOWPC] = false;
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
			SetNormalPlayerMarkers(playerid);
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
						ShowPlayerMessage(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], "~r~El trabajo se ha cancelado porque tu compa�ero ha dejado de trabajar.", 3);
						CancelTrashWork(playerid, TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);
					}

					if (PLAYER_TEMP[playerid][py_TRASH_PASSENGER])
					{
						ShowPlayerMessage(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], "~r~El trabajo se ha cancelado porque tu compa�ero ha dejado de trabajar.", 3);
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

				format(str_killer, sizeof str_killer, "Heriste a ~y~%s", ACCOUNT_INFO[playerid][ac_NAME]);
				ShowPlayerMessage(killerid, str_killer, 3);

				GetWeaponName(reason, gunname, sizeof(gunname));
				GetPlayerPos(killerid, x, y, z);

				format(str_killer, sizeof str_killer, "Heriste a %s con %s desde %.1f metros.", ACCOUNT_INFO[playerid][ac_NAME], gunname, GetPlayerDistanceFromPoint(playerid, x, y, z));
				SavePlayerNotification(killerid, str_killer);

				format(str_victim, sizeof(str_victim), "%s te hiri� con %s desde %.1f metros.", ACCOUNT_INFO[killerid][ac_NAME], gunname, GetPlayerDistanceFromPoint(playerid, x, y, z));
				ShowPlayerNotification(playerid, str_victim, 4);
				SavePlayerNotification(playerid, str_victim);

				format(str_victim, sizeof(str_victim), "[KILL] %s (%d) hiri� a %s (%d) con %s desde %.1f metros.", ACCOUNT_INFO[killerid][ac_NAME], killerid, PLAYER_TEMP[playerid][py_NAME], playerid, gunname, GetPlayerDistanceFromPoint(playerid, x, y, z));
				SendMessageToAdmins(COLOR_ANTICHEAT, str_victim, 1);

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

				format(str_killer, sizeof str_killer, "Asesinaste a ~r~%s", ACCOUNT_INFO[playerid][ac_NAME]);
				ShowPlayerMessage(killerid, str_killer, 3);

				GetWeaponName(reason, gunname, sizeof(gunname));
				GetPlayerPos(killerid, x, y, z);

				format(str_killer, sizeof str_killer, "Asesinaste a %s con %s desde %.1f metros.", ACCOUNT_INFO[playerid][ac_NAME], gunname, GetPlayerDistanceFromPoint(playerid, x, y, z));
				SavePlayerNotification(killerid, str_killer);

				format(str_victim, sizeof(str_victim), "%s te mat� con %s desde %.1f metros.", ACCOUNT_INFO[killerid][ac_NAME], gunname, GetPlayerDistanceFromPoint(playerid, x, y, z));
				SavePlayerNotification(playerid, str_victim);

				format(str_victim, sizeof(str_victim), "[KILL] %s (%d) mat� a %s (%d) con %s desde %.1f metros.", ACCOUNT_INFO[killerid][ac_NAME], killerid, PLAYER_TEMP[playerid][py_NAME], playerid, gunname, GetPlayerDistanceFromPoint(playerid, x, y, z));
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

	if (PLAYER_TEMP[playerid][py_GAME_STATE] == GAME_STATE_CONNECTED) // Reci�n conectado
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

			if (strcmp(PLAYER_TEMP[playerid][py_IP], ACCOUNT_INFO[playerid][ac_IP], false)) // La IP actual no es la misma IP de la �ltima conexi�n
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

				ShowPlayerMessage(playerid, "~r~Tu direcci�n IP ha cambiado desde tu �ltima conexi�n.", 5);
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

			if (PLAYER_TEMP[playerid][py_USER_VALID_NAME] == false)
			{
				ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED""SERVER_NAME"", ""COL_WHITE"Tu nombre no es adecuado usa: "COL_RED"N"COL_WHITE"ombre_"COL_RED"A"COL_WHITE"pellido.\n\
					Recuerda que los nombres como Miguel_Gamer o que contentan insultos\n\
					no est�n permitidos, procura ponerte un nombre que parezca real.", "Cerrar", "");
				KickEx(playerid, 500);
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

CreateGraffitis()
{
	for(new i = 0; i < sizeof GRAFFITIS_OBJ; i ++)
	{
		GRAFFITIS_OBJ[i][g_ID] = CreateDynamicObject(GRAFFITIS_OBJ[i][g_MODELID], GRAFFITIS_OBJ[i][g_X], GRAFFITIS_OBJ[i][g_Y], GRAFFITIS_OBJ[i][g_Z], GRAFFITIS_OBJ[i][g_RX], GRAFFITIS_OBJ[i][g_RY], GRAFFITIS_OBJ[i][g_RZ], 0, 0);
		SetDynamicObjectMaterialText(GRAFFITIS_OBJ[i][g_ID], 0, GRAFFITIS_OBJ[i][g_ZONE_NAME], OBJECT_MATERIAL_SIZE_512x64, GRAFFITIS_OBJ[i][g_FONT], 60, 0, 0xFFdc3939, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	
		new DBResult:Result, DB_Query[140];
		format(DB_Query, sizeof DB_Query, "SELECT * FROM `GRAFFITIS` WHERE `GRAFF_ID` = '%d'", i);
		Result = db_query(Database, DB_Query);

		if (db_num_rows(Result) == 0) printf("[ERROR] No hay registro para el graffiti %d", i);
		else
		{
			for(new x; x < db_num_rows(Result); x++ )
			{
				new 
					crew_id,
					graff;

				crew_id = getCrewIndexWithId(db_get_field_assoc_int(Result, "ID_CREW"));
				graff = db_get_field_assoc_int(Result, "GRAFF_ID");

				if (crew_id > 0)
				{
					if (CREW_INFO[crew_id][crew_VALID])
					{
						new CrewColorGraffiti_ARGB = hy_RGBAToARGB(CREW_INFO[crew_id][crew_COLOR]);
						SetDynamicObjectMaterialText(GRAFFITIS_OBJ[graff][g_ID], 0, CREW_INFO[crew_id][crew_NAME], OBJECT_MATERIAL_SIZE_512x64, GRAFFITIS_OBJ[graff][g_FONT], 60, 0, CrewColorGraffiti_ARGB, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
					}
				}
				db_next_row(Result);
			}
			db_free_result(Result);
		}
	}
	return 1;
}

GetRockColorType(rock_type)
{
	new rock_color = 0xFFFFFFFF;

	switch(rock_type)
	{
		case 0: rock_color = 0xFF000000; // Carbon
		case 1: rock_color = 0xFFffff00; // Azufre
		case 2: rock_color = 0xFFcfcfcf; // Hierro
		case 3: rock_color = 0xFFffae00; // Jaspe
		case 4: rock_color = 0xFFff0000; // Ruby
		case 5: rock_color = 0xFF59ff00; // Esmeralda
		case 6: rock_color = 0xFFf5d80b; // Oro
		case 7: rock_color = 0xFFe30bf5; // Cuarzo
		case 8: rock_color = 0xFF0bf5ea; // Diamante
		case 9: rock_color = 0xFF0bf5ea; // Bismuto
		case 10: rock_color = 0xFF0042ff; // Lapisl�zuli
		case 11: rock_color = 0xFFeceff8; // Platino
	}
	return rock_color;
}

PayPlayerMiner(playerid)
{
	new pay = 50;

	switch(PLAYER_TEMP[playerid][py_ACTUAL_ROCK])
	{
		case 0: pay = 80;
		case 1: pay = 76;
		case 2: pay = 95;
		case 3: pay = 100;
		case 4: pay = 120;
		case 5: pay = 450;
		case 6: pay = 250;
		case 7: pay = 300;
		case 8: pay = 550;
		case 9: pay = 180;
		case 10: pay = 320;
		case 11: pay = 400;	
	}

	if (ACCOUNT_INFO[playerid][ac_SU]) pay += minrand(200, 500);

	GivePlayerCash(playerid, pay);
	
	PLAYER_SKILLS[playerid][WORK_MINER] ++;
	SavePlayerSkills(playerid);

	if (random(2) == 1) GivePlayerReputation(playerid);
	return 1;
}

DropPlayerRock(playerid, place_id)
{
	for(new i = 0; i != sizeof ROCK_PROCESSOR; i ++)
	{
		if (IsPlayerInRangeOfPoint(playerid, 3.0, ROCK_PROCESSOR[i][rp_X], ROCK_PROCESSOR[i][rp_Y], ROCK_PROCESSOR[i][rp_Z]))
		{
			new obj_id = CreateDynamicObject(
												3930,
												(DROP_ROCK_POS[ place_id ][mp_X] + 0.1760),
												(DROP_ROCK_POS[ place_id ][mp_Y] + 0.4369),
												(DROP_ROCK_POS[ place_id ][mp_Z] - 0.3),
												0.0000,
												0.0000,
												30.5999,
												GetPlayerVirtualWorld(playerid),
												GetPlayerInterior(playerid)
											);

			SetDynamicObjectMaterial(obj_id, 0, -1, "none", "none", GetRockColorType(PLAYER_TEMP[playerid][py_ACTUAL_ROCK]));

			MoveDynamicObject(
								obj_id,
								ROCK_PROCESSOR[i][rp_X],
								ROCK_PROCESSOR[i][rp_Y],
								ROCK_PROCESSOR[i][rp_Z] - 1.0,
								1.8,
								0.0000,
								0.0000,
								30.5999 + 190.0
							);

			SetTimerEx("DeleteDroppedRock", 3000, false, "i", obj_id);
			break;
		}
	}
	return 1;
}

forward DeleteDroppedRock(obj_id);
public DeleteDroppedRock(obj_id)
{
	#if DEBUG_MODE == 1
		printf("DeleteDroppedRock"); // debug juju
	#endif

	DestroyDynamicObject(obj_id);
	return 1;
}

GetRockMiningTime(rock_type)
{
	switch(rock_type)
	{
		case 0: return 990;
		case 1: return 900;
		case 2: return 1050;
		case 3: return 1000;
		case 4: return 800;
		case 5: return 1500;
		case 6: return 850;
		case 7: return 1000;
		case 8: return 1500;
		case 9: return 1300;
		case 10: return 500;
		case 11: return 800;
	}
	return 1000;
}

GetRockNameType(rock_type)
{
	new rock_name[32];

	switch(rock_type)
	{
		case 0: rock_name = "Carb�n";
		case 1: rock_name = "Azufre";
		case 2: rock_name = "Hierro";
		case 3: rock_name = "Jaspe";
		case 4: rock_name = "Ruby";
		case 5: rock_name = "Esmeralda";
		case 6: rock_name = "Oro";
		case 7: rock_name = "Cuarzo";
		case 8: rock_name = "Diamante";
		case 9: rock_name = "Bismuto";
		case 10: rock_name = "Lapisl�zuli";
		case 11: rock_name = "Platino";
	}
	return rock_name;
}

CreateMinerRocks()
{
	for(new i = 0; i < sizeof ROCKS_OBJ; i ++)
	{
		ROCKS_OBJ[i][r_OBJECT_ID] = CreateDynamicObject(ROCKS_OBJ[i][r_MODELID], ROCKS_OBJ[i][r_X], ROCKS_OBJ[i][r_Y], ROCKS_OBJ[i][r_Z], ROCKS_OBJ[i][r_RX], ROCKS_OBJ[i][r_RY], ROCKS_OBJ[i][r_RZ], ROCKS_OBJ[i][r_WORLD], ROCKS_OBJ[i][r_INTERIOR]);
		new color_type = GetRockColorType(ROCKS_OBJ[i][r_TYPE]);

		// Test
		//new str_text[32];
		//format(str_text, sizeof(str_text), "{ffffff}%s", GetRockNameType(ROCKS_OBJ[i][r_TYPE]));

		//CreateDynamic3DTextLabel(str_text, 0xF7F7F700, ROCKS_OBJ[i][r_X], ROCKS_OBJ[i][r_Y], ROCKS_OBJ[i][r_Z] + 1.0, 10.0, .testlos = true, .worldid = ROCKS_OBJ[i][r_WORLD], .interiorid = ROCKS_OBJ[i][r_INTERIOR]);

		SetDynamicObjectMaterial(ROCKS_OBJ[i][r_OBJECT_ID], 0, -1, "none", "none", color_type);
		ROCKS_OBJ[i][r_ACTIVATED] = true;
	}
	return 1;
}

forward InitLastGraffiti();
public InitLastGraffiti()
{
	#if DEBUG_MODE == 1
		printf("InitLastGraffiti"); // debug juju
	#endif

	new DBResult:Result, graff_id;
	Result = db_query(Database, "SELECT * FROM `SERVER_PROPERTIES`;");
	if (db_num_rows(Result)) graff_id = db_get_field_assoc_int(Result, "LAST_GRAFFITI");
 
	if (graff_id != 0) InitGraffiti(graff_id);
	else InitGraffiti( minrand(0, sizeof(GRAFFITIS_OBJ)) );

	db_free_result(Result);
	return 1;
}

forward FirstGraffitiAnnounce();
public FirstGraffitiAnnounce()
{
	#if DEBUG_MODE == 1
		printf("FirstGraffitiAnnounce"); // debug juju
	#endif

	new hour, minute, second;
	gettime(hour, minute, second);
	if (hour >= 2 && hour <= 6) 
	{
		print("Skipping graffiti event activation until 6 AM.");
		SetTimer("FirstGraffitiAnnounce", 1500000, false);
		return 0;
	}

	SendGraffitiNotification("En 15 minutos se iniciara una disputa.");
	SendDiscordWebhook("En 15 minutos se iniciara una disputa.", 2);
	SetTimer("TwoGraffitiAnnounce", 900000, false);
	return 1;
}

forward TwoGraffitiAnnounce();
public TwoGraffitiAnnounce()
{
	#if DEBUG_MODE == 1
		printf("TwoGraffitiAnnounce"); // debug juju
	#endif

	SendGraffitiNotification("En 5 minutos se iniciara una disputa.");
	SendDiscordWebhook("En 5 minutos se iniciara una disputa.", 2);
	SetTimer("InitRandomGangEvent", 300000, false);
	SetTimer("FinalGraffitiAnnounce", 240000, false);
	return 1;
}

forward FinalGraffitiAnnounce();
public FinalGraffitiAnnounce()
{
	#if DEBUG_MODE == 1
		printf("FinalGraffitiAnnounce"); // debug juju
	#endif

	SendGraffitiNotification("En 60 segundos se iniciara una disputa.");
	SendDiscordWebhook("En 60 segundos se iniciara una disputa.", 2);
	return 1;
}

forward CancelGraffiti();
public CancelGraffiti()
{
	#if DEBUG_MODE == 1
		printf("CancelGraffiti"); // debug juju
	#endif

	KillTimer(GraffitiCancelTimer);

	for(new i = 0; i < sizeof GRAFFITIS_OBJ; i ++)
	{
		if (GRAFFITIS_OBJ[i][g_ACTIVATED] == true)
		{
			new str_text[144];

			GRAFFITIS_OBJ[i][g_ACTIVATED] = false;
			SetTimer("FirstGraffitiAnnounce", 1500000, false);

			format(str_text, sizeof(str_text), "Nadie ha ganado el graffiti en %s.", GRAFFITIS_OBJ[i][g_ZONE_NAME]);
			SendGraffitiNotification(str_text);
			SendDiscordWebhook(str_text, 2);

			format(str_text, sizeof(str_text), "[GRAFFITI] Nadie ha ganado el graffiti en %s.", GRAFFITIS_OBJ[i][g_ZONE_NAME]);
			SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 1);
		}
	}

	for(new x = 0, j = GetPlayerPoolSize(); x <= j; x++)
	{
		if (IsPlayerConnected(x))
		{
			if (PLAYER_CREW[x][player_crew_VALID])
			{
				TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][0]);
				TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][1]);
				TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][2]);
				TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][3]);
				TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][4]);
				TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][5]);
				TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][6]);
				TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][7]);
				TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][8]);
				TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][9]);
				TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][10]);
				RemovePlayerMapIcon(x, 0);
				CREW_INFO[ PLAYER_CREW[x][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS] = 0;
				CREW_INFO[ PLAYER_CREW[x][player_crew_INDEX] ][crew_IN_GRAFFITI] = false;
			}
		}
	}
	return 1;
}

InitBlackMarket(market_id)
{
	SetMarketTextdraw();

	for(new i = 0; i < sizeof BLACK_MARKET_OBJ; i ++)
	{
		if (BLACK_MARKET_OBJ[i][bm_ACTIVATED] == true)
		{
			BLACK_MARKET_OBJ[i][bm_ACTIVATED] = false;
		}
	}

	new str_text[128];

	MarketGetTime = gettime();
	BLACK_MARKET_OBJ[market_id][bm_ACTIVATED] = true;

	format(str_text, sizeof(str_text), "   ~w~Mercado de %s", BLACK_MARKET_OBJ[market_id][bm_ZONE_NAME]);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][1], -1);
	TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][1], TextToSpanish("�La disputa comenz�! Nadie ha llegado todav�a."));
	TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][0], TextToSpanish(str_text));
	TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][2], "hud:radar_locosyndicate");

	format(str_text, sizeof(str_text), "[MERCADO] Mercado en %s.", BLACK_MARKET_OBJ[market_id][bm_ZONE_NAME]);
    SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 1);

    format(str_text, 144, "Mercado en %s.", BLACK_MARKET_OBJ[market_id][bm_ZONE_NAME]);
    SendDiscordWebhook(str_text, 3);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_CREW[i][player_crew_VALID] || PLAYER_WORKS[i][WORK_POLICE])
			{
				CREW_INFO[ PLAYER_CREW[i][player_crew_INDEX] ][crew_IN_GRAFFITI] = false;

                TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][0]);
                TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][1]);
                TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][2]);
				SetPlayerMapIcon(i, 0, BLACK_MARKET_OBJ[market_id][bm_EXTERIOR_X], BLACK_MARKET_OBJ[market_id][bm_EXTERIOR_Y], BLACK_MARKET_OBJ[market_id][bm_EXTERIOR_Z], 23, 0, MAPICON_GLOBAL);
			}
		}
	}
	return 1;
}
 
InitGraffiti(graff_id)
{
	ResetGraffitiTextdraw();

	new DB_Query[164];
	format(DB_Query, sizeof DB_Query, "UPDATE `SERVER_PROPERTIES` SET `LAST_GRAFFITI` = '%d';", graff_id);
	db_free_result(db_query(Database, DB_Query));

	for(new i = 0; i < sizeof GRAFFITIS_OBJ; i ++)
	{
		if (GRAFFITIS_OBJ[i][g_ACTIVATED] == true)
		{
			GRAFFITIS_OBJ[i][g_ACTIVATED] = false;
		}
	}

	GraffitiGetTime = gettime();

	new str_text[128];

	GRAFFITIS_OBJ[graff_id][g_ACTIVATED] = true;
	GraffitiCancelTimer = SetTimer("CancelGraffiti", 1200000, false);

	format(str_text, sizeof(str_text), "   ~w~Graffiti en %s", GRAFFITIS_OBJ[graff_id][g_ZONE_NAME]);

	new str[144];
	format(str, 144, "[GRAFFITI] Graffiti en %s.", GRAFFITIS_OBJ[graff_id][g_ZONE_NAME]);
    SendMessageToAdmins(COLOR_ANTICHEAT, str, 1);

    format(str, 144, "Graffiti en %s.", GRAFFITIS_OBJ[graff_id][g_ZONE_NAME]);
    SendDiscordWebhook(str, 2);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_CREW[i][player_crew_VALID] || PLAYER_WORKS[i][WORK_POLICE])
			{
				CREW_INFO[ PLAYER_CREW[i][player_crew_INDEX] ][crew_IN_GRAFFITI] = false;

				TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][1], -1);
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][1], TextToSpanish("�La disputa comenz�! Nadie ha pintado todav�a."));
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][0], TextToSpanish(str_text));
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][2], "hud:radar_spray");
                TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][0]);
                TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][1]);
                TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][2]);
				SetPlayerMapIcon(i, 0, GRAFFITIS_OBJ[graff_id][g_X], GRAFFITIS_OBJ[graff_id][g_Y], GRAFFITIS_OBJ[graff_id][g_Z], 63, 0, MAPICON_GLOBAL);
			}
		}
	}
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
	
	// Le�ador
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

	// Electr�nica
	CreateDynamic3DTextLabel(""COL_RED"Tienda Electr�nica\n"COL_WHITE"4 productos disponibles", 0xF7F7F7FF, 1722.2310, -1253.8021, 471.1665, 10.0, .testlos = true, .interiorid = 17);
	
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
	CreateDynamic3DTextLabel(""COL_WHITE"Vender una propiedad o veh�culo", 0xF7F7F700, 1796.071655, -1414.565307, 2770.660156, 10.0, .testlos = true, .worldid = 20, .interiorid = 20);
	//Grua
	CreateDynamic3DTextLabel(""COL_WHITE"Servicio de gr�a", 0xF7F7F700,  1795.293823,-1407.773681,2770.660156, 10.0, .testlos = true, .worldid = 20, .interiorid = 20);
	
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

	CreateDynamic3DTextLabel(""COL_RED"Balloon Express\n"COL_WHITE"Viaje en globo aerost�tico (200$)", 0xF7F7F7FF, -370.339721, -1634.205932, 25.057666, 5.0, .testlos = true, .worldid = 0, .interiorid = 0);

	CreateDynamic3DTextLabel(""COL_WHITE"Armamento para polic�as", 0xF7F7F700, 1867.665283, -1712.853515, 5216.709960, 5.0, .testlos = true, .worldid = 0, .interiorid = 6);

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

	//Mec�nico
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
		format(str_text, sizeof(str_text), ""COL_RED"Levantador n� %d\n"COL_WHITE"Ac�rcate para usar", i + 1);
		CreateDynamic3DTextLabel(str_text, 0xF7F7F700, MECHANIC_POSITIONS[i][0], MECHANIC_POSITIONS[i][1], MECHANIC_POSITIONS[i][2] + 1.8, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
		AddKeyArea(MECHANIC_POSITIONS[i][0], MECHANIC_POSITIONS[i][1], 1.5, KEY_TYPE_H);
	}

	CreateDynamic3DTextLabel(""COL_RED"Taller mec�nico\n"COL_WHITE"1 producto disponible", 0xF7F7F7FF, 1060.838256, -917.609741, 43.124679, 10.0, .testlos = true, .worldid = 0, .interiorid = 0);

	//pescador
	CreateDynamic3DTextLabel(""COL_RED"Boya\n"COL_WHITE"n� 1", 0xF7F7F7FF, 1955.022094, -189.402023, -2.332746 + 1.3, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Boya\n"COL_WHITE"n� 2", 0xF7F7F7FF, 2209.482421, -231.312026, -2.332746 + 1.3, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Boya\n"COL_WHITE"n� 3", 0xF7F7F7FF, 2209.482421, -231.312026, -2.332746 + 1.3, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Boya\n"COL_WHITE"n� 4", 0xF7F7F7FF, 1858.291503, -69.229499, -2.332746 + 1.3, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Comprar ca�a de pescar\n"COL_WHITE"1 producto disponible", 0xF7F7F7FF, 2125.901123, -65.776679, 1.585963, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Vender pescados\n"COL_WHITE"Venga aqu� para vender sus peces", 0xF7F7F7FF, 2157.049560, -92.550987, 2.798943, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);

	// Minero
	CreateDynamic3DTextLabel(""COL_RED"Puesto para mineros\n"COL_WHITE"1 producto disponible", 0xF7F7F7FF, 509.910125, -708.205383, 19.242210, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	
	for(new i = 0; i != sizeof ROCK_PROCESSOR; i ++)
	{
		CreateDynamic3DTextLabel(""COL_RED"Procesadora\n"COL_WHITE"Suelta los materiales aqu�", 0xF7F7F7FF, ROCK_PROCESSOR[i][rp_X], ROCK_PROCESSOR[i][rp_Y], ROCK_PROCESSOR[i][rp_Z] + 3, 25.0, .testlos = true, .worldid = -1, .interiorid = -1);
	}
	
	//heliport
	CreateDynamic3DTextLabel(""COL_RED"Helipuerto n� 1\n"COL_WHITE"Ac�rcate para usar", 0xF7F7F700, 1876.87915, -2286.58911, 1.16550 + 15, 30.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Helipuerto n� 2\n"COL_WHITE"Ac�rcate para usar", 0xF7F7F700, 1055.9615, -910.1790, 49.1911 + 1, 30.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Helipuerto n� 3\n"COL_WHITE"Ac�rcate para usar", 0xF7F7F700, 1037.1727, -911.3947, 49.1911 + 1, 30.0, .testlos = true, .worldid = 0, .interiorid = 0);
	
	CreateDynamic3DTextLabel(""COL_RED"Muelle n� 1\n"COL_WHITE"Ac�rcate para usar", 0xF7F7F700, 729.8204, -1512.3397, -0.5818 + 1, 40.0, .testlos = true, .worldid = 0, .interiorid = 0);
	
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

forward UpdateThePutis();
public UpdateThePutis()
{
	/*#if DEBUG_MODE == 1
		printf("UpdateThePutis"); // debug juju
	#endif*/

	ApplyDynamicActorAnimation(Club_Bar_Actor[0], "BAR", "BARman_idle", 4.1, 1, 0, 0, 0, 0);
    ApplyDynamicActorAnimation(Club_Bar_Actor[1], "BAR", "BARman_idle", 4.1, 1, 0, 0, 0, 0);
    ApplyDynamicActorAnimation(Club_Bar_Actor[2], "BAR", "BARman_idle", 4.1, 1, 0, 0, 0, 0);

	new
		strip_anim = random(sizeof(RandomStripAnimations)),
		stripper = random(sizeof(Club_Strippers_Actor));

	ApplyDynamicActorAnimation(Club_Strippers_Actor[stripper], "STRIP", RandomStripAnimations[strip_anim], 4.1, 1, 0, 0, 0, 0);


	for(new i = 0; i != sizeof(Club_Actors); i ++)
	{
		ApplyDynamicActorAnimation(Club_Actors[i], "STRIP", RandomPayStripAnimations[random(sizeof(RandomPayStripAnimations))], 4.1, 1, 0, 0, 0, 0);
	}
	return 1;
}

CreateTrashCheckpoint(route, modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if (route >= MAX_ROUTES) return printf("---> L�mite superado en array 'TRASH_OBJECTS, route' en la funci�n 'CreateTrashCheckpoint'.");
	if (!TRASH_OBJECTS[route][trash_route_VALID]) TRASH_OBJECTS[route][trash_route_VALID] = true;
	if (TRASH_OBJECTS[route][trash_route_OBJECTS] >= MAX_OBJECTS_PER_ROUTE) return printf("---> L�mite superado en array 'TRASH_OBJECTS, objects' en la funci�n 'CreateTrashCheckpoint'.");

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

Float:GetDistanceBetweenPoints3D(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2)
{
    return VectorSize(x1 - x2, y1 - y2, z1 - z2);
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

CheckAndExecuteGasoline(playerid)
{
	if (GetPlayerInterior(playerid) == 0)
	{
		new fuel_station = -1;
		for(new i = 0; i < sizeof Fuel_Stations; i++)
		{
			if (IsPlayerInRangeOfPoint(playerid, 5.0, Fuel_Stations[i][0], Fuel_Stations[i][1], Fuel_Stations[i][2]))
			{
				fuel_station = i;
				break;
			}
		}
		if (fuel_station != -1)
		{
			ShowDialog(playerid, DIALOG_GASOLINE);
		}
	}
	return 1;
}

#define MIN_SECONDS_BETWEEN_TALKS 150 // Deben pasar al menos 1 segundos para volver a hablar.
public OnPlayerText(playerid, text[])
{
	#if DEBUG_MODE == 1
		printf("OnPlayerText %d %s",playerid,text); // debug juju
	#endif

	if (PLAYER_TEMP[playerid][py_KICKED]) return 0;
	if (PLAYER_TEMP[playerid][py_STEAL_SUSPICION]) return KickEx(playerid, 500);

	// general
	if (PLAYER_TEMP[playerid][py_GAME_STATE] != GAME_STATE_NORMAL || PLAYER_TEMP[playerid][py_SELECT_TEXTDRAW] || PLAYER_TEMP[playerid][py_NEW_USER]) { ShowPlayerMessage(playerid, "~r~Ahora no puedes hablar.", 2); return 0; }
	if (text[0] == '#' && ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] != 0 && PLAYER_TEMP[playerid][py_ADMIN_SERVICE])
	{
		new string[144];
	    format(string, sizeof(string), "[C-A]"COL_WHITE" %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, text[1]);
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
			SendClientMessage(playerid, COLOR_RED, "Aviso:"COL_WHITE" Est�s enviando mensajes demasiado r�pido.");
			return 0;
		}
	}
	PLAYER_TEMP[playerid][py_ANTIFLOOD_TALK] = GetTickCount();

	if (PLAYER_MISC[playerid][MISC_JAILS] >= 50)
	{
		AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, "Superar 50 jails");

		ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", ""COL_WHITE"Fuiste baneado autom�ticamente, raz�n: Superar los 50 jails", "Cerrar", "");
		KickEx(playerid, 500);
		PLAYER_MISC[playerid][MISC_BANS] ++;
		SavePlayerMisc(playerid);

		new str[144];
		format(str, 144, "[ADMIN] NeuroAdmin bane� a %s (%d): 50 jails", ACCOUNT_INFO[playerid][ac_NAME], playerid);
		SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

		new webhook[144];
		format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
		SendDiscordWebhook(webhook, 1);	
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
				format(message, sizeof message, "{4286f4}[Central polic�a] "COL_WHITE"Reporte "COL_WHITE"[%s (%d), gps: %s, %s]: "COL_WHITE"%s", PLAYER_TEMP[playerid][py_POLICE_CALL_NAME_STR], playerid, city, zone, text);
				SendPoliceRadioMessage(-1, COLOR_WHITE, message);

				SendClientMessage(playerid, COLOR_YELLOW, "Operadora:"COL_WHITE" Su petici�n fue enviada, en breve una patrulla acudir�.");
				ShowPlayerMessage(playerid, "Llamada finalizada.", 2);
				return 0;
			}

			new str_text[190];
			new CrewColorChat = getPlayerCrewColor(playerid);
			if (text[0] == '!')
			{
				if (PLAYER_WORKS[playerid][WORK_POLICE] && PLAYER_TEMP[playerid][py_WORKING_IN] == WORK_POLICE)
				{
					if (text[1] == '!') format(str_text, sizeof str_text, "[Depto. De Polic�a] "COL_WHITE"(( %s: %s ))", PLAYER_TEMP[playerid][py_RP_NAME], text[2]);
					else format(str_text, sizeof str_text, "[Depto. De Polic�a] "COL_WHITE"%s %s: %s", PLAYER_TEMP[playerid][py_RP_NAME], POLICE_RANKS[ PLAYER_SKILLS[playerid][WORK_POLICE] ], text[1]);

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
					if (text[1] == '!') format(str_text, sizeof str_text, "[DPT] "COL_WHITE"(( %s: %s ))", PLAYER_TEMP[playerid][py_RP_NAME], text[2]);
					else format(str_text, sizeof str_text, "[DPT] "COL_WHITE"%s %s: %s", PLAYER_TEMP[playerid][py_RP_NAME], DIVISO_RANKS[ PLAYER_SKILLS[playerid][WORK_DIVISO] ], text[1]);

					SendDivisoMafiaMessage(0xa9ee70FF, str_text);
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
				format(str_text, 144, "%s "COL_RED"(tel�fono){E6E6E6}: %s", PLAYER_TEMP[playerid][py_RP_NAME], text);
				SendClientMessageEx(PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID], COLOR_WHITE, ""COL_RED"Tel�fono (%s):"COL_WHITE" %s", convertPhoneNumber(PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID], PLAYER_PHONE[playerid][player_phone_NUMBER]), text);
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

#define MIN_TIME_BETWEEN_DOUBT 30
CMD:duda(playerid, params[])
{
	if (!ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL]) return SendClientMessage(playerid, COLOR_WHITE, "Para enviar una duda primero debes activar el canal de dudas con "COL_RED"/dudas");
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /duda "COL_WHITE"[DUDA]");
	
	if (PLAYER_MISC[playerid][MISC_MUTES] >= 5) return SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Tienes muchos muteos, ya no eres aceptado en el canal de dudas.");
	if (strlen(params) > 132) return SendClientMessage(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Su duda es muy larga");

	if (PLAYER_MISC[playerid][MISC_MUTE] > gettime())
	{
		new seconds = PLAYER_MISC[playerid][MISC_MUTE] - gettime();
		SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Est�s silenciado en el canal de dudas y anuncios por %s minutos", TimeConvert(seconds));
		return 1;
	}

	if (!ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		if (gettime() < PLAYER_TEMP[playerid][py_DOUBT_CHANNEL_TIME] + MIN_TIME_BETWEEN_DOUBT)
		{
			new time = (MIN_TIME_BETWEEN_DOUBT-(gettime()-PLAYER_TEMP[playerid][py_DOUBT_CHANNEL_TIME]));
			SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Tienes que esperar %s segundos para volver a enviar una duda.", TimeConvert(time));
			return 1;
		}
	}

	if (!ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	{
		if (CheckSpamViolation(params))
		{
			new dialog[250];
			format(dialog, sizeof dialog, ""COL_WHITE"Fuiste baneado, raz�n: Spam (Dudas)");
			ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
			
			AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, "Spam (Dudas)");

			KickEx(playerid, 500);
			PLAYER_MISC[playerid][MISC_BANS] ++;
			SavePlayerMisc(playerid);

			new str[144], webhook[144];
			format(str, 144, "[ADMIN] NeuroAdmin bane� a %s (%d): Spam (Dudas).", ACCOUNT_INFO[playerid][ac_NAME], playerid);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);

			format(str, 144, "[DUDAS] %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, params);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);
			return 0;
		}

		if (CheckFilterViolation(params))
		{
			new str[144], webhook[144];
			format(str, 144, "[DUDAS] %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, params);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);

			SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Tu duda tiene palabras inapropiadas.");
			return 1;
		}

		if (StringContainsIP(params))
		{
			new dialog[250];
			format(dialog, sizeof dialog, ""COL_WHITE"Fuiste baneado, raz�n: Spam (IP en el dudas)");
			ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
			
			AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, "Spam (IP en el dudas)");

			KickEx(playerid, 500);
			PLAYER_MISC[playerid][MISC_BANS] ++;
			SavePlayerMisc(playerid);

			new str[144];
			format(str, 144, "[ADMIN] NeuroAdmin bane� a %s (%d): Spam (IP en el dudas).", ACCOUNT_INFO[playerid][ac_NAME], playerid);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			new webhook[144];
			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);
			
			format(str, 144, "[DUDAS] %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, params);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);
			return 1;
		}
	}

	PLAYER_MISC[playerid][MISC_DOUBT_SENT]++;
	SendMessageToDoubtChannel(playerid, params);
	SavePlayerMisc(playerid);
	format(PLAYER_TEMP[playerid][py_LAST_DOUBT], 144, "%s", params);
	return 1;
}
alias:duda("n")

CMD:dudas(playerid, params[])
{
	if (ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL])
	{
		ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL] = false;
		ShowPlayerMessage(playerid, "Canal de dudas ~r~desactivado", 1);
	}
	else
	{
		ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL] = true;
		ShowPlayerMessage(playerid, "Canal de dudas ~g~activado", 1);
	}
	return 1;
}

#define MIN_TIME_BETWEEN_ANN 300
CMD:anuncio(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL]) return SendClientMessage(playerid, COLOR_WHITE, "Para enviar un anuncio primero debes activar el canal de dudas con "COL_RED"/dudas");
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /anuncio "COL_WHITE"[TEXTO]");

	if (PLAYER_MISC[playerid][MISC_MUTES] >= 5) return SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Tienes muchos muteos, ya no eres aceptado en el canal de dudas.");
	if (strlen(params) > 64) return SendClientMessage(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Su anuncio es muy largo");

	if (PLAYER_MISC[playerid][MISC_MUTE] > gettime())
	{
		new seconds = PLAYER_MISC[playerid][MISC_MUTE] - gettime();
		SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Est�s silenciado en el canal de dudas y anuncios por %s minutos", TimeConvert(seconds));
		return 1;
	}

	if (gettime() < PLAYER_TEMP[playerid][py_ANN_CHANNEL_TIME] + MIN_TIME_BETWEEN_ANN)
	{
		new time = (MIN_TIME_BETWEEN_ANN-(gettime()-PLAYER_TEMP[playerid][py_ANN_CHANNEL_TIME]));
		SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Tienes que esperar %s segundos para volver a enviar un anuncio.", TimeConvert(time));
		return 1;
	}

	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] <= 1)
	{
		if (CheckSpamViolation(params))
		{
			new dialog[250];
			format(dialog, sizeof dialog, ""COL_WHITE"Fuiste baneado, raz�n: Spam (Anuncios)");
			ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
			
			AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, "Spam (Anuncios)");

			KickEx(playerid, 500);
			PLAYER_MISC[playerid][MISC_BANS] ++;
			SavePlayerMisc(playerid);

			new str[144];
			format(str, 144, "[ADMIN] NeuroAdmin bane� a %s (%d): Spam (Anuncios).", ACCOUNT_INFO[playerid][ac_NAME], playerid);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			new webhook[144];
			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);

			format(str, 144, "[ANUNCIOS] %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, params);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);
			return 0;
		}

		if (CheckFilterViolation(params))
		{
			new str[144], webhook[144];
			format(str, 144, "[ANUNCIOS] %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, params);
			SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

			format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
			SendDiscordWebhook(webhook, 1);

			SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Tu anuncio tiene palabras inapropiadas.");
			return 1;
		}
	}

	if (StringContainsIP(params))
	{
		new dialog[250];
		format(dialog, sizeof dialog, ""COL_WHITE"Fuiste baneado, raz�n: Spam (IP en el anuncio)");
		ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
		
		AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, "Spam (IP en el anuncio)");

		KickEx(playerid, 500);
		PLAYER_MISC[playerid][MISC_BANS] ++;
		SavePlayerMisc(playerid);

		new str[144];
		format(str, 144, "[ADMIN] NeuroAdmin bane� a %s (%d): Spam (IP en el anuncio).", ACCOUNT_INFO[playerid][ac_NAME], playerid);
		SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

		new webhook[144];
		format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
		SendDiscordWebhook(webhook, 1);

		format(str, 144, "[ANUNCIOS] %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, params);
		SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

		format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
		SendDiscordWebhook(webhook, 1);
		return 1;
	}

	new str_text[264];
	format(str_text, sizeof(str_text), "Anuncio: "COL_WHITE"%s [Tel�fono: %d]", params, PLAYER_PHONE[playerid][player_phone_NUMBER]);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if ((PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_DEAD) && ACCOUNT_INFO[i][ac_DOUBT_CHANNEL] && !PLAYER_TEMP[playerid][py_NEW_USER])
			{
				SendResponsiveMessage(i, COLOR_LIGHT_ORANGE, str_text, 135);
			}
		}
	}

	format(str_text, sizeof(str_text), "[ANUNCIO] %s (%d) [Tel�fono: %d]", PLAYER_TEMP[playerid][py_NAME], playerid, PLAYER_PHONE[playerid][player_phone_NUMBER]);
	SendMessageToAdmins(COLOR_ANTICHEAT, str_text);

	PLAYER_TEMP[playerid][py_ANN_CHANNEL_TIME] = gettime();
	return 1;
}

CMD:g(playerid, params[])
{
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /g"COL_WHITE"ritar [TEXTO]");

	new str_text[190];
	format(str_text, 190, "%s grita: �%s!", PLAYER_TEMP[playerid][py_RP_NAME], params);

	//Do code
	strreplace(str_text, "[", "{dbc766}[");
	strreplace(str_text, "]", "]{E6E6E6}");

	//Negrita code
	strreplace(str_text, "<", "{A8A8A8}");
	strreplace(str_text, ">", "{E6E6E6}");

	ProxDetector(playerid, 25.0, str_text, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5, 85);
	return 1;
}
alias:g("gritar")

CMD:s(playerid, params[])
{
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /s"COL_WHITE"usurrar [TEXTO]");

	new str_text[190];
	format(str_text, sizeof(str_text), "%s susurra: %s", PLAYER_TEMP[playerid][py_RP_NAME], params);

	//Do code
	strreplace(str_text, "[", "{dbc766}[");
	strreplace(str_text, "]", "]{E6E6E6}");

	//Negrita code
	strreplace(str_text, "<", "{A8A8A8}");
	strreplace(str_text, ">", "{E6E6E6}");

	ProxDetector(playerid, 5.0, str_text, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5, 85);
	return 1;
}
alias:s("susurrar")

CMD:desbug(playerid, params[])
{
	if (PLAYER_TEMP[playerid][py_CUFFED]) return ShowPlayerMessage(playerid, "~r~No puedes hacer eso estando esposado.", 3);
	new
		Float:x, Float:y, Float:z,
		interior = GetPlayerInterior(playerid)
	;

	GetPlayerPos(playerid, x, y, z);
	// if (interior != 0) SetPlayerPos(playerid, x, y, z + 0.5);

	if (CHARACTER_INFO[playerid][ch_STATE] != ROLEPLAY_STATE_NORMAL) return 1;

	if (IsPlayerInRangeOfPoint(playerid, 50.0, -198.002197, -1762.759643, 675.768737))
		SetPlayerPosEx(playerid, 1172.832763, -1323.269531, 15.400051, 270.0, 0, 0);

	switch(interior)
	{
		case 25..27:
		{
			SetPlayerPosEx(playerid, 509.152374, -723.324951, 19.869243, 340.0, 0, 0);
			SetPlayerTime(playerid, SERVER_TIME[0], SERVER_TIME[1]);
		}
	}
	return 1;
}

CMD:pos(playerid, params[])
{
	new Float:x, Float:y, Float:z, Float:angle;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, angle);
	SendClientMessageEx(playerid, COLOR_WHITE, "X: %f Y: %f Z: %f ANGLE: %f "COL_RED"|"COL_WHITE" Virtual World: %d "COL_RED"|"COL_WHITE" Interior: %d", x, y, z, angle, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
	return 1;
}

CMD:b(playerid, params[])
{
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /b "COL_WHITE"[TEXTO]");

    new str_text[190];
    format(str_text, sizeof(str_text), "[ID: %d] %s: (( %s ))", playerid, PLAYER_TEMP[playerid][py_RP_NAME], params);
	ProxDetector(playerid, 15.0, str_text, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5, 85);
	return 1;
}

CMD:do(playerid, params[])
{
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /do "COL_WHITE"[TEXTO]");

    new str_text[190];
    format(str_text, sizeof(str_text), "* %s (( %s ))", params, PLAYER_TEMP[playerid][py_RP_NAME]);
	ProxDetector(playerid, 15.0, str_text, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 85);
	return 1;
}

CMD:intentar(playerid, params[])
{
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /intentar "COL_WHITE"[TEXTO]");

    new 
    	str_text[190],
    	status[15]
    ;

    switch( minrand(0, 2) )
    {
    	case 0: format(status, sizeof(status), "falla");
    	default: format(status, sizeof(status), "lo logra");
    }
    
    format(str_text, sizeof(str_text), "* %s intenta %s y %s.", PLAYER_TEMP[playerid][py_RP_NAME], params, status);
	ProxDetector(playerid, 15.0, str_text, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 85);
	return 1;
}

CMD:me(playerid, params[])
{
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /me "COL_WHITE"[TEXTO]");

	SendPlayerAction(playerid, params);
	return 1;
}
alias:me("y")

CMD:habilidades(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ShowPlayerSkills(playerid, playerid);
	return 1;
}
alias:habilidades("hab", "exp", "skills")

CMD:cuenta(playerid, params[])
{
	ShowPlayerStats(playerid, playerid);
	return 1;
}
alias:cuenta("est")

CMD:web(playerid, params[])
{
	SendClientMessage(playerid, COLOR_WHITE, "Web: "COL_RED""SERVER_WEBSITE"");
	return 1;
}

CMD:discord(playerid, params[])
{
	SendClientMessage(playerid, COLOR_WHITE, "Discord: "COL_RED""SERVER_DISCORD"");
	return 1;
}

CMD:testnot(playerid, params[])
{
	ShowPlayerNotification(playerid, "Te hemos devuelto el dinero porque el luchador que apostaste se ha ido del ring.", 3);
	return 1;
}

CMD:runtime(playerid, params[])
{
	SendClientMessageEx(playerid, COLOR_WHITE, "El servidor se ha iniciado: %s", ReturnTimelapse(ServerInitTime, gettime()));
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
	return 1;
}

CMD:accsave(playerid, params[])
{
	if (gettime() < PLAYER_TEMP[playerid][py_SAVE_ACCOUNT_TIME] + 30)
	{
		new time = (30-(gettime()-PLAYER_TEMP[playerid][py_SAVE_ACCOUNT_TIME]));
		SendClientMessageEx(playerid, COLOR_WHITE, "Tienes que esperar %s minutos para volver a guardar tus datos.", TimeConvert(time));
		return 1;
	}

	SaveUserData(playerid);
	SavePlayerToysData(playerid);
	SavePlayerVehicles(playerid, false);
	SavePlayerSkills(playerid);
	SavePlayerWorks(playerid);
	SavePlayerMisc(playerid);
	SavePlayerWeaponsData(playerid);

	PLAYER_TEMP[playerid][py_SAVE_ACCOUNT_TIME] = gettime();

	ShowPlayerNotification(playerid, "Datos guardados.", 3);
	return 1;
}

CMD:ayuda(playerid, params[])
{
	ShowInventory(playerid);
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

CMD:testvlood(playerid, params[])
{
	PlayerBloodParticle(playerid);
	return 1;
}

CMD:nochesexo(playerid, params[])
{
	PLAYER_TEMP[playerid][py_NOCHE_DE_SEXO] = !PLAYER_TEMP[playerid][py_NOCHE_DE_SEXO];

	if (PLAYER_TEMP[playerid][py_NOCHE_DE_SEXO]) SetPlayerTime(playerid, 0, 0);
	else SetPlayerTime(playerid, SERVER_TIME[0], SERVER_TIME[1]);

	return 1;
}

CMD:menu(playerid, params[])
{
	PlayerExitGamemode(playerid);
	StopAudioStreamForPlayer(playerid);

	ShowMainMenu(playerid);

	PLAYER_TEMP[playerid][py_MENU] = true;

	PlayAudioStreamForPlayer(playerid, MAIN_MUSIC[random(sizeof(MAIN_MUSIC))]);
	ClearPlayerChatBox(playerid);
	return 1;
}

/* COMMAND FINDING */
cmd:tr(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): tr (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:tp(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): tp (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:teleport(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): teleport (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:salo(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): salo (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:fantasma(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): fantasma (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:domar(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): domar (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:sapito(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): sapito (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:pinwino(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): pinwino (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:verdesin(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): verdesin (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:piso(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): piso (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:storm(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): storm (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:gg(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): gg [gagarin] (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:baciga(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): baciga (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:spread(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): spread (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:cfind(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): cfind (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:master(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): master (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:tmp(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): tmp (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:fr(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): fr (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:hmo(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): hmo (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:skr(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): skr (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:xex(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): xex (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:up(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): up (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:slide(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): slide (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:cbug(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): cbug (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:aimbot(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): aimbot (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

cmd:aim(playerid, params[])
{
	new string[128];
	format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): aim (cheat-cmd)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
	SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
	SendDiscordWebhook(string, 1);

	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats");
	KickEx(playerid, 500);
	return 1;
}

CMD:creditos(playerid, params[])
{
	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Colaboradores", ""COL_WHITE"Hyaxe es posible gracias a:\n\
		Muphy, Atom, Kitis, Arkerooz\n\
		Mitt, Alper.", "Cerrar", "");
	return 1;
}

/*CMD:armas(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	new
		dialog[500],
		line_str[128]
	;

	for(new i; i != 13; i ++)
	{
		if (!PLAYER_WEAPONS[playerid][i][player_weapon_VALID]) continue;

		format(line_str, sizeof line_str, ""COL_WHITE"%s | Slot "COL_RED"%d\n", WEAPON_INFO[ PLAYER_WEAPONS[playerid][i][player_weapon_ID] ][weapon_info_NAME], i);
		strcat(dialog, line_str);
	}
	
	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Armas", dialog, "Cerrar", "");
	return 1;
}*/

CMD:gps(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (!PLAYER_OBJECT[playerid][po_GPS])
	{
		ShowPlayerMessage(playerid, "~r~No tienes ning�n GPS, ve a un 24/7.", 3, 1085);
		return 1;
	}

	SetPlayerChatBubble(playerid, "\n\n\n\n* Mira su GPS", 0xffcb90FF, 20.0, 2000);
	ShowDialog(playerid, DIALOG_PLAYER_GPS);
	return 1;
}

CMD:stop(playerid, params[])
{
	if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);
	return 1;
}

CMD:mp3(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_OBJECT[playerid][po_MP3]) return ShowPlayerMessage(playerid, "~r~No tienes un reproductor MP3. Ve a una tienda electr�nica.", 4);
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3, 1085);
	if (PLAYER_TEMP[playerid][py_PLAYER_WAITING_MP3_HTTP]) return ShowPlayerMessage(playerid, "~r~Espera que termine la b�squeda actual.", 3, 1085);
	if (gettime() < PLAYER_TEMP[playerid][py_LAST_SEARCH] + 60) return ShowPlayerMessage(playerid, "~r~Solo puedes usar este comando cada un minuto.", 3, 1085);

	ShowPlayerMessage(playerid, "~r~YouTube nos ha baneado, esta opcion se encuentra desactivada.", 4);
	//ShowDialog(playerid, DIALOG_PLAYER_MP3);
	return 1;
}
alias:mp3("youtube")

CMD:pass(playerid, params[])
{
	ShowDialog(playerid, DIALOG_CHANGE_PASSWORD);
	return 1;
}

CMD:borrarcp(playerid, params[])
{
	if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_GPS_CHECKPOINT]))
	{
		DestroyDynamicCP(PLAYER_TEMP[playerid][py_GPS_CHECKPOINT]);
    	CancelTracing(playerid);
		PLAYER_TEMP[playerid][py_GPS_CHECKPOINT] = INVALID_STREAMER_ID;

		ShowPlayerMessage(playerid, "Has cancelado la ruta antigua de tu GPS.", 3);
	}
	else ShowPlayerMessage(playerid, "~r~No tienes ning�n punto marcado en tu GPS.", 3);
	return 1;
}

CMD:guia(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (!PLAYER_OBJECT[playerid][po_PHONE_RESOLVER])
	{
		ShowPlayerMessage(playerid, "~r~No tienes una gu�a telef�nica, ve a un 24/7.", 3, 1085);
		return 1;
	}

	if (sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /guia "COL_WHITE"[ID o nombre]");
	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador Desconectado.", 2);

	if (ACCOUNT_INFO[params[0]][ac_ID] == 0) return ShowPlayerMessage(playerid, "~r~Este jugador ha decidido no mostrar su n�mero en la gu�a.", 3);

	if (!PLAYER_PHONE[params[0]][player_phone_VALID]) return ShowPlayerMessage(playerid, "~r~Este jugador no tiene tel�fono.", 2);
	if (!PLAYER_PHONE[params[0]][player_phone_VISIBLE_NUMBER]) return ShowPlayerMessage(playerid, "~r~Este jugador ha decidido no mostrar su n�mero en la gu�a.", 3);

	SendClientMessageEx(playerid, COLOR_WHITE, "Tel�fono de %s: "COL_RED"%d", PLAYER_TEMP[params[0]][py_RP_NAME], PLAYER_PHONE[params[0]][player_phone_NUMBER]);
	return 1;
}

CMD:responder(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (!PLAYER_PHONE[playerid][player_phone_VALID])
	{
		ShowPlayerMessage(playerid, "~r~No tienes ning�n tel�fono, ve a 24/7.", 3, 1085);
		return 1;
	}
	if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_OFF) return ShowPlayerMessage(playerid, "~r~Tu tel�fono est� apagado, para encenderlo usa /movil.", 3);

	if (!PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) return ShowPlayerMessage(playerid, "~r~No hay llamadas entrantes.", 2);
	if (PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID] == INVALID_PLAYER_ID) return ShowPlayerMessage(playerid, "~r~No hay llamadas entrantes.", 2);
	if (PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE] != CALL_STATE_INCOMING_CALL) return ShowPlayerMessage(playerid, "~r~No hay llamadas entrantes.", 2);

	new to_playerid = PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID];

	PLAYER_TEMP[playerid][py_PLAYER_IN_CALL] = true;
	PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE] = CALL_STATE_ESTABLISHED;
	PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID] = to_playerid;
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);

	KillTimer(PLAYER_TEMP[to_playerid][py_TIMERS][6]);
	PLAYER_TEMP[to_playerid][py_PLAYER_IN_CALL] = true;
	PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_STATE] = CALL_STATE_ESTABLISHED;
	PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_PLAYERID] = playerid;
	SetPlayerSpecialAction(to_playerid, SPECIAL_ACTION_USECELLPHONE);

	ShowPlayerMessage(playerid, "Llamada establecida, usa ~g~/colgar ~w~para terminarla.", 3);
	ShowPlayerMessage(to_playerid, "Llamada establecida, usa ~g~/colgar ~w~para terminarla.", 3);
	return 1;
}

CMD:colgar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_PHONE[playerid][player_phone_VALID])
	{
		ShowPlayerMessage(playerid, "~r~No tienes ning�n tel�fono, ve a un 24/7.", 3, 1085);
		return 1;
	}
	if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_OFF) return ShowPlayerMessage(playerid, "~r~Tu tel�fono est� apagado, para encenderlo usa /movil.", 3);

	if (!PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) return ShowPlayerMessage(playerid, "~r~No hay llamadas entrantes.", 2);

	if (PLAYER_TEMP[playerid][py_POLICE_CALL_NAME] || PLAYER_TEMP[playerid][py_POLICE_CALL_DESCRIPTION])
	{
		PLAYER_TEMP[playerid][py_PLAYER_IN_CALL] = false;
		PLAYER_TEMP[playerid][py_POLICE_CALL_NAME] = false;
		PLAYER_TEMP[playerid][py_POLICE_CALL_DESCRIPTION] = false;
		ShowPlayerMessage(playerid, "Llamada finalizada.", 2);
		return 1;
	}

	if (PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID] == INVALID_PLAYER_ID) return ShowPlayerMessage(playerid, "No hay llamadas entrantes.", 3);

	switch(PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE])
	{
		case CALL_STATE_WAITING_RESPONSE:
		{
			EndPhoneCall(playerid);
			ShowPlayerMessage(playerid, "Colgaste.", 2);
		}
		case CALL_STATE_INCOMING_CALL:
		{
			EndPhoneCall(playerid);
			ShowPlayerMessage(playerid, "No has respondido la llamada.", 2);
		}
		case CALL_STATE_ESTABLISHED:
		{
			EndPhoneCall(playerid);
			ShowPlayerMessage(playerid, "Llamada finalizada.", 2);
		}
		default: ShowPlayerMessage(playerid, "~r~No est�s en ninguna llamada.", 2);
	}
	return 1;
}

CMD:configuracion(playerid, params[])
{
	ShowDialog(playerid, DIALOG_PLAYER_CONFIG);
	return 1;
}
alias:configuracion("config", "ajustes", "panel")

GetPropertyIndexByID(id)
{
	for(new i = 0; i != MAX_PROPERTIES; i ++)
	{
		if (!PROPERTY_INFO[i][property_VALID]) continue;
		if (PROPERTY_INFO[i][property_ID] == id) return i;
	}
	return -1;
}

HideBankMenu(playerid)
{
    CancelSelectTextDrawEx(playerid);
    TextDrawHideForPlayer(playerid, Textdraws[textdraw_BANK_MENU][0]);
    TextDrawHideForPlayer(playerid, Textdraws[textdraw_BANK_MENU][1]);
    TextDrawHideForPlayer(playerid, Textdraws[textdraw_BANK_MENU][2]);
    TextDrawHideForPlayer(playerid, Textdraws[textdraw_BANK_MENU][3]);
    TextDrawHideForPlayer(playerid, Textdraws[textdraw_BANK_MENU][4]);
    TextDrawHideForPlayer(playerid, Textdraws[textdraw_BANK_MENU][5]);
    TextDrawHideForPlayer(playerid, Textdraws[textdraw_BANK_MENU][6]);
    PLAYER_TEMP[playerid][py_PLAYER_IN_ATM] = false;
    return 1;
}

ShowBankMenu(playerid)
{
    SelectTextDrawEx(playerid, 0x618448FF);
    TextDrawShowForPlayer(playerid, Textdraws[textdraw_BANK_MENU][0]);
    TextDrawShowForPlayer(playerid, Textdraws[textdraw_BANK_MENU][1]);
    TextDrawShowForPlayer(playerid, Textdraws[textdraw_BANK_MENU][2]);
    TextDrawShowForPlayer(playerid, Textdraws[textdraw_BANK_MENU][3]);
    TextDrawShowForPlayer(playerid, Textdraws[textdraw_BANK_MENU][4]);
    TextDrawShowForPlayer(playerid, Textdraws[textdraw_BANK_MENU][5]);
    TextDrawShowForPlayer(playerid, Textdraws[textdraw_BANK_MENU][6]);
    PLAYER_TEMP[playerid][py_PLAYER_IN_ATM] = true;
    return 1;
}

CheckAtmPlayerAndExecute(playerid)
{
    if (PLAYER_TEMP[playerid][py_LAST_PICKUP_ID] == 0) return 0;
        
    new info[3];
    Streamer_GetArrayData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_EXTRA_ID, info);
    if (info[0] != PICKUP_TYPE_ATM) return 0;
    
    new Float:x, Float:y, Float:z; 
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_X, x);
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Y, y);
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Z, z);
    
    if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return 0;

    if (BANK_ACCOUNT[playerid][bank_account_ID] == 0)
    {
        ShowDialog(playerid, DIALOG_CREATE_BANK_ACCOUNT);
        return 1;
    }
    ShowBankMenu(playerid);
    return 1;
}

/* MACROS */
/*CMD:macro(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);

	new option_0[32], option_1[32], option_2[32], option_3[32];
	if (sscanf(params, "s[32]s[32]s[32]s[32]", option_0, option_1, option_2, option_3)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /vender hycoins <id> <cantidad> <precio>");

	if (!strcmp(option, "hycoins", true))
	{
		if (PLAYER_TEMP[to_playerid][py_TRICK_SELLER_EXTRA] <= 0 || PLAYER_TEMP[to_playerid][py_TRICK_SELLER_EXTRA] > 10000000) return ShowPlayerMessage(playerid, "~r~Cantidad incorrecta", 3);
		if (PLAYER_TEMP[to_playerid][py_TRICK_SELLER_EXTRA] > ACCOUNT_INFO[playerid][ac_SD]) return ShowPlayerMessage(playerid, "~r~No tienes esa cantidad", 3);

		new str_text[128];
		format(str_text, sizeof(str_text), "Le has ofrecido una venta a %s, espera para ver si la acepta.", PLAYER_TEMP[to_playerid][py_RP_NAME]);
		ShowPlayerNotification(playerid, str_text, 4);
		ShowDialog(to_playerid, DIALOG_TRICKS_SU);
		return 1;
	}
	else SendClientMessage(playerid, COLOR_WHITE, "Syntax: /vender hycoins <id> <cantidad> <precio>");
	return 1;
}*/
/* MACROS */

CMD:vender(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (ACCOUNT_INFO[playerid][ac_LEVEL] < 2) return ShowPlayerMessage(playerid, "~r~Debes ser nivel 2", 2);

	new option[24], to_playerid, extra, price;
	if (sscanf(params, "s[24]udd", option, to_playerid, extra, price)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /vender hycoins <id> <cantidad> <precio>");

	if (price <= 0 || price > 10000000) return ShowPlayerMessage(playerid, "~r~El precio no es v�lido.", 3);
	if (!IsPlayerConnected(to_playerid)) return ShowPlayerMessage(playerid, "~r~El jugador no est� conectado", 3);
	if (playerid == to_playerid) return ShowPlayerMessage(playerid, "~r~No puedes venderte a ti mismo.", 3);
	new Float:x, Float:y, Float:z; GetPlayerPos(to_playerid, x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~Este jugador no est� cerca tuya.", 3);
	if (PLAYER_TEMP[to_playerid][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No le puedes vender nada a este jugador por ahora.", 3);
	if (ACCOUNT_INFO[to_playerid][ac_LEVEL] < 2) return ShowPlayerMessage(playerid, "~r~El jugador no es nivel 2.", 3);

	if (price > CHARACTER_INFO[to_playerid][ch_CASH])
	{
		ShowPlayerMessage(playerid, "~r~El jugador no tiene el dinero que pides.", 3);
		return 1;
	}

	PLAYER_TEMP[to_playerid][py_TRICK_SELLER_PID] = playerid;
	PLAYER_TEMP[to_playerid][py_TRICK_SELLER_AID] = ACCOUNT_INFO[playerid][ac_ID];
	PLAYER_TEMP[to_playerid][py_TRICK_PRICE] = price;
	PLAYER_TEMP[to_playerid][py_TRICK_SELLER_EXTRA] = extra;
	PLAYER_TEMP[to_playerid][py_TRICK_TIME] = gettime();

	if (!strcmp(option, "hycoins", true))
	{
		if (PLAYER_TEMP[to_playerid][py_TRICK_SELLER_EXTRA] <= 0 || PLAYER_TEMP[to_playerid][py_TRICK_SELLER_EXTRA] > 10000000) return ShowPlayerMessage(playerid, "~r~Cantidad incorrecta", 3);
		if (PLAYER_TEMP[to_playerid][py_TRICK_SELLER_EXTRA] > ACCOUNT_INFO[playerid][ac_SD]) return ShowPlayerMessage(playerid, "~r~No tienes esa cantidad", 3);

		new str_text[128];
		format(str_text, sizeof(str_text), "Le has ofrecido una venta a %s, espera para ver si la acepta.", PLAYER_TEMP[to_playerid][py_RP_NAME]);
		ShowPlayerNotification(playerid, str_text, 4);
		ShowDialog(to_playerid, DIALOG_TRICKS_SU);
		return 1;
	}
	else SendClientMessage(playerid, COLOR_WHITE, "Syntax: /vender hycoins <id> <cantidad> <precio>");
	return 1;
}

CMD:tirar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (ACCOUNT_INFO[playerid][ac_LEVEL] < 2) return ShowPlayerMessage(playerid, "~r~Debes ser nivel 2", 2);

	new ammount;
	if (sscanf(params, "d", ammount)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /tirar <cantidad>");
	if (ammount <= 0 || ammount > 1000) return ShowPlayerMessage(playerid, "~r~La cantidad no es v�lida.", 3);

	if (PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] != 9999)
	{
		new 
			Float:x, Float:y, Float:z,
			slot = PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT];

		if (ammount > PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][slot]) return ShowPlayerMessage(playerid, "~r~No tienes esa cantidad", 4);
		if (PLAYER_VISUAL_INV[playerid][slot_TYPE][slot] == 50) return 0;

		GetPlayerPos(playerid, x, y, z);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 1000, true);
		
		if (!PLAYER_VISUAL_INV[playerid][slot_WEAPON][slot])
		{
			CreateDropItem(GetItemObjectByType(PLAYER_VISUAL_INV[playerid][slot_TYPE][slot]), x, y, z - 1, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), GetItemNameByType(PLAYER_VISUAL_INV[playerid][slot_TYPE][slot]), PLAYER_TEMP[playerid][py_NAME], PLAYER_VISUAL_INV[playerid][slot_TYPE][slot], ammount);
			
			SubtractItem(playerid, PLAYER_VISUAL_INV[playerid][slot_TYPE][slot], slot, ammount);
			ResetItemBody(playerid);
			PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]--;
		}
		else ShowPlayerMessage(playerid, "~r~No puedes hacerlo con ese objeto", 4);
	}
	else ShowPlayerMessage(playerid, "~r~No tienes un item en la mano", 4);
	return 1;
}

CMD:guardar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);

	new ammount;
	if (sscanf(params, "d", ammount)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /tirar <cantidad>");
	if (ammount <= 0 || ammount > 1000) return ShowPlayerMessage(playerid, "~r~La cantidad no es v�lida.", 3);

	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 0;

	new vehicleid = GetPlayerCameraTargetVehicle(playerid);
	if (vehicleid == INVALID_VEHICLE_ID) return ShowPlayerMessage(playerid, "~r~Tienes que estar cerca de un veh�culo", 4);
	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Tienes que estar cerca de un veh�culo", 4);
	if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID] || IsPlayerInKeys(PLAYER_VEHICLES[vehicleid][player_vehicle_ID], ACCOUNT_INFO[playerid][ac_ID]))
	{
		PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] = vehicleid;
		
		if (PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] != 9999)
		{
			new slot = PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT];

			if (ammount > PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][slot]) return ShowPlayerMessage(playerid, "~r~No tienes esa cantidad", 4);
			if (PLAYER_VISUAL_INV[playerid][slot_TYPE][slot] == 50) return 0;

			
			if (!PLAYER_VISUAL_INV[playerid][slot_WEAPON][slot])
			{
				new count = GetVehicleItemsCount(PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] ][player_vehicle_ID]);
				if (count >= 11) return ShowPlayerMessage(playerid, "~r~El maletero se encuentra lleno.", 4);

				if (PLAYER_VISUAL_INV[playerid][slot_TYPE][slot] == 50) return 0;

				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~w~Item guardado", 2000, 5);
				ResetItemBody(playerid);

				SubtractItem(playerid, PLAYER_VISUAL_INV[playerid][slot_TYPE][slot], slot, ammount);

				new already_exists = ItemAlreadyInVehicle(PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] ][player_vehicle_ID], PLAYER_VISUAL_INV[playerid][slot_TYPE][slot]);

				if (already_exists)
				{
					new DB_Query[164];
					format(DB_Query, sizeof DB_Query,
						"UPDATE `VEHICLE_STORAGE` SET `EXTRA` = EXTRA + '%d' WHERE `ID` = '%d';",
						ammount,
						already_exists
					);
					db_free_result(db_query(Database, DB_Query));
				}
				else
				{
					AddItemToVehicle(
						PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] ][player_vehicle_ID],
						PLAYER_VISUAL_INV[playerid][slot_TYPE][slot],
						ammount
					);		
				}

				SetPlayerChatBubble(playerid, "\n\n\n\n* Mete algo al maletero.\n\n\n", 0xffcb90FF, 20.0, 5000);
			}
			else ShowPlayerMessage(playerid, "~r~No puedes hacerlo con ese objeto", 4);
		}
		else ShowPlayerMessage(playerid, "~r~No tienes un item en la mano", 4);
		}
	return 1;
}

CMD:echar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /echar "COL_WHITE"[ID o nombre]");
	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~El jugador no esta conectado.", 3);
	if (playerid == params[0]) return ShowPlayerMessage(playerid, "~r~No puedes expulsar a ti mismo.", 3);

	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		new vehicleid = GetPlayerVehicleID(playerid);

		if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Este no es t� veh�culo.", 3);
		if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~Este no es t� veh�culo.", 3);
		if (GetPlayerVehicleID(params[0]) != vehicleid) return ShowPlayerMessage(playerid, "~r~Este jugador no est� en tu veh�culo", 3);

		RemovePlayerFromVehicle(params[0]);

		SetPlayerChatBubble(playerid, "\n\n\n\n* Hecha a alguien de su veh�culo.\n\n\n", 0xffcb90FF, 20.0, 5000);
		return 1;
	}

	ShowPlayerMessage(playerid, "~r~No est�s en tu propiedad o en tu veh�culo.", 3);
	return 1;
}

SavePlayerNotification(playerid, const message[])
{
	new DB_Query[160];
	format
	(
		DB_Query, sizeof DB_Query,
		"\
			INSERT INTO `PLAYER_NOTIFICATIONS`\
			(\
				`ID_USER`, `MESSAGE`, `DATE`\
			)\
			VALUES\
			(\
				'%d', '%q', '%i'\
			);\
		",
		ACCOUNT_INFO[playerid][ac_ID],
		message,
		gettime()
	);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

SendPlayerAction(playerid, action[])
{
	new str_text[190];
	format(str_text, sizeof str_text, "* %s %s *", PLAYER_TEMP[playerid][py_RP_NAME], action);
	ProxDetector(playerid, 15.0, str_text, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 85);
	return 1;
}

forward StoreBuyRecv(index, response_code, const data[]);
public StoreBuyRecv(index, response_code, const data[])
{
	#if DEBUG_MODE == 1
		printf("StoreBuyRecv %d %d %s", index, response_code, data);
	#endif

	if (IsPlayerConnected(index))
	{
	    if (response_code == 200)
	    {
	    	if (data[0] == 'Y')
			{
				switch( STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_TYPE] )
				{
					// HyCoins
					case 0:
					{
						new DB_Query[140];
						ACCOUNT_INFO[index][ac_SD] += STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA];

						format(DB_Query, sizeof DB_Query, "UPDATE `CUENTA` SET `SD` = '%d' WHERE `ID` = '%d';", ACCOUNT_INFO[index][ac_SD], ACCOUNT_INFO[index][ac_ID]);
						db_free_result(db_query(Database, DB_Query));
					}

					// Dinero
					case 1:
					{
						GivePlayerCash(index, STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA], false);
					}

					// VIP Classic
					case 2:
					{
						SetPlayerVip(index, 1, 0, STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA]);
					}

					// VIP Turbo
					case 3:
					{
						SetPlayerVip(index, 2, 0, STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA]);
					}

					// Nivel
					case 4:
					{
						KillTimer(PLAYER_TEMP[index][py_TIMERS][2]);

						ACCOUNT_INFO[index][ac_REP] = 1;
						ACCOUNT_INFO[index][ac_LEVEL] += STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA];
						SetPlayerSkillLevels(index);

						SetPlayerScore(index, ACCOUNT_INFO[index][ac_LEVEL]);

						ACCOUNT_INFO[index][ac_TIME_FOR_REP] = TIME_FOR_REP;
						PLAYER_TEMP[index][py_TIME_PASSED_LAST_REP] = gettime() * 1000;

						ACCOUNT_INFO[index][ac_TIME_PLAYING] += gettime() - PLAYER_TEMP[index][py_TIME_PLAYING];
						PLAYER_TEMP[index][py_TIME_PLAYING] = gettime();
						new DB_Query[256];
						format(DB_Query, sizeof DB_Query,

							"\
								UPDATE `CUENTA` SET `TIME-PLAYING` = '%d', `LEVEL` = '%d', `REP` = '%d', `TIME_FOR_REP` = '%d', `PAYDAY_REP` = '%d' WHERE `ID` = '%d';\
							",
								ACCOUNT_INFO[index][ac_TIME_PLAYING], ACCOUNT_INFO[index][ac_LEVEL], ACCOUNT_INFO[index][ac_REP], TIME_FOR_REP, ACCOUNT_INFO[index][ac_PAYDAY_REP], ACCOUNT_INFO[index][ac_ID]
						);
						db_free_result(db_query(Database, DB_Query));

						KillTimer(PLAYER_TEMP[index][py_TIMERS][2]);
						PLAYER_TEMP[index][py_TIMERS][2] = SetTimerEx("AddPlayerReputation", ACCOUNT_INFO[index][ac_TIME_FOR_REP], false, "i", index);
					}

					// Vehiculo
					case 5:
					{
						new
							Float:x, Float:y, Float:z, Float:angle,
							modelid = STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA],
							vehicle_type = GetVehicleType(STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA])
						;

						switch(vehicle_type)
						{
							// Helic�pteros
							case 0:
							{
								new crane_point = random(sizeof(HELI_POINTS));
								x = HELI_POINTS[crane_point][0];
								y = HELI_POINTS[crane_point][1];
								z = HELI_POINTS[crane_point][2];
								angle = HELI_POINTS[crane_point][3];
							}

							// Aviones
							case 1:
							{
								new crane_point = random(sizeof(PLANE_POINTS));
								x = PLANE_POINTS[crane_point][0];
								y = PLANE_POINTS[crane_point][1];
								z = PLANE_POINTS[crane_point][2];
								angle = PLANE_POINTS[crane_point][3];
							}

							// Barcos
							case 2:
							{
								new crane_point = random(sizeof(BOAT_POINTS));
								x = BOAT_POINTS[crane_point][0];
								y = BOAT_POINTS[crane_point][1];
								z = BOAT_POINTS[crane_point][2];
								angle = BOAT_POINTS[crane_point][3];
							}

							// Autos, motos, etc
							default:
							{
								new crane_point = random(sizeof(CRANE_POINTS));
								x = CRANE_POINTS[crane_point][0];
								y = CRANE_POINTS[crane_point][1];
								z = CRANE_POINTS[crane_point][2];
								angle = CRANE_POINTS[crane_point][3];
							}
						}

						new vid = AddPersonalVehicle(
							index,
							modelid,
							x, y, z,
							angle,
							minrand(1, 10),
							minrand(1, 10),
							VEHICLE_INFO[ STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA] - 400 ][vehicle_info_MAX_GAS]
						);
						if (!vid) ShowPlayerNotification(index, "Tu veh�culo se ha comprado correctamente pero no pudo spawnear debido a que ya hay muchos veh�culos creados.", 4);
					}

					// Skin
					case 6:
					{
						CHARACTER_INFO[index][ch_SKIN] = STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA];
    					SetPlayerSkin(index, CHARACTER_INFO[index][ch_SKIN]);
    					PLAYER_TEMP[index][py_SKIN] = CHARACTER_INFO[index][ch_SKIN];
					}
				}

				new str_text[232];
				format(str_text, sizeof(str_text), "Has comprado el producto \"%s\" por %d$. Felicidades.",
					STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_NAME],
					STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_PRICE]
				);
				ShowPlayerNotification(index, str_text, 4);
			}
			else ShowPlayerNotification(index, "No tienes los cr�ditos suficientes para realizar esta compra en la tienda.", 4);
	    }
	    else
	    {
			ShowPlayerMessage(index, "~r~Hubo un error al intentar conectarse a la tienda", 7);
	    }
	}
	return 1;
}

GetDatabasePages(const query_[], limit)
{
    new DBResult:pages;
	pages = db_query(Database, query_);

	new Float:tpages = floatdiv(floatround(db_get_field_int(pages, 0)), limit);
	db_free_result(pages);
	return floatround(tpages, floatround_ceil);
}

GetEmptyPlayer_GPS_Slot(playerid)
{
	for(new i = 0; i != MAX_PLAYER_GPS_SAVES; i ++)
	{
		if (!PLAYER_GPS[playerid][i][player_gps_VALID]) return i;
	}
	return -1;
}

SetPlayer_GPS_Checkpoint(playerid, Float:x, Float:y, Float:z, world, interior)//spgps
{
	if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_GPS_CHECKPOINT]))
	{
		DestroyDynamicCP(PLAYER_TEMP[playerid][py_GPS_CHECKPOINT]);
    	CancelTracing(playerid);
		PLAYER_TEMP[playerid][py_GPS_CHECKPOINT] = INVALID_STREAMER_ID;
	}
	PLAYER_TEMP[playerid][py_GPS_CHECKPOINT] = CreateDynamicCP(x, y, z, 5.0, world, interior, playerid, 9999999999.0);
  	StartTracing(playerid, x, y, z);

	new info[1];
	info[0] = CHECKPOINT_TYPE_GPS;
	Streamer_SetArrayData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_GPS_CHECKPOINT], E_STREAMER_EXTRA_ID, info);

	SetPlayerChatBubble(playerid, "\n\n\n\n* Configura su GPS.\n\n\n", 0xffcb90FF, 20.0, 5000);
	return 1;
}

public OnPlayerEnterDynamicArea(playerid, areaid)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerEnterDynamicArea %d %d",playerid, areaid); // debug juju
	#endif

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
					format(str_text, sizeof(str_text), "Este territorio est� siendo atacado por la banda %s, es mejor alejarse.", CREW_INFO[ TERRITORIES[index][territory_ATTACKER_CREW_INDEX] ][crew_NAME]);
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
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_KEY], "_");
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_KEY]);
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
			if (TRUCK_VEHICLE[vehicleid][truck_vehicle_DRIVER_USER_ID] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~Solo aceptaremos la carga del conductor de este cami�n.", 3);

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
			if (TRUCK_VEHICLE[vehicleid][truck_vehicle_DRIVER_USER_ID] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~Solo le pagaremos al conductor que entreg� la mercanc�a.", 3);

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
			ShowPlayerMessage(driver, "Espera mientras tu ~y~compa�ero~w~ recoge la basura.", 4);

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

RegisterNewPlayer_GPS_Site(playerid, slot)
{
	new DBResult:Result, DB_Query[340];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PLAYER_GPS`\
		(\
			`ID_USER`, `NAME`, `X`, `Y`, `Z`, `WORLD`, `INTERIOR`\
		)\
		VALUES\
		(\
			'%d', '%q', '%f', '%f', '%f', '%d', '%d'\
		);\
		SELECT MAX(`ID`) FROM `PLAYER_GPS`;\
	",
		ACCOUNT_INFO[playerid][ac_ID], PLAYER_GPS[playerid][slot][player_gps_NAME], PLAYER_GPS[playerid][slot][player_gps_X], PLAYER_GPS[playerid][slot][player_gps_Y], PLAYER_GPS[playerid][slot][player_gps_Z], PLAYER_GPS[playerid][slot][player_gps_WORLD], PLAYER_GPS[playerid][slot][player_gps_INTERIOR]
	);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result)) PLAYER_GPS[playerid][slot][player_gps_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);
	return 1;
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
			ShowPlayerMessage(playerid, "~r~El tama�o del accesorio es demasiado grande.", 3);

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
			ShowPlayerMessage(playerid, "~r~La posici�n del objeto est� demasiado lejos de ti.", 3);

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
		ShowPlayerMessage(playerid, "Has cancelado la edici�n", 2);
	}
	return 1;
}

RegisterBankAccountTransaction(account_id, transaction_type, ammount, extra = -1)
{
	new DB_Query[215];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `BANK_TRANSACTIONS` \
		(\
			`ID_ACCOUNT`, `TRANSACTION_TYPE`, `AMMOUNT`, `EXTRA`\
		) \
		VALUES \
		(\
			%d, %d, %d, %d\
		);\
	", account_id, transaction_type, ammount, extra);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

RegisterNewPlayer(playerid)
{
	if (PLAYER_TEMP[playerid][py_USER_EXIT]) return 0;

	new DBResult:Result, DB_Query[900];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `CUENTA` \
		(\
			`IP`, `NAME`, `EMAIL`, `GPCI`, `SALT`, `PASS`, `CONNECTED`, `PLAYERID`, `TIME_FOR_REP`\
		) \
		VALUES \
		(\
			'%q', '%q', '%q', '%q', '%q', '%q', 1, %d, %d\
		);\
		SELECT `ID`, `LAST_CONNECTION` FROM `CUENTA` WHERE `NAME` = '%q';\
	", ACCOUNT_INFO[playerid][ac_IP], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_EMAIL], ACCOUNT_INFO[playerid][ac_SERIAL], ACCOUNT_INFO[playerid][ac_SALT], ACCOUNT_INFO[playerid][ac_PASS], playerid, TIME_FOR_REP, ACCOUNT_INFO[playerid][ac_NAME]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		ACCOUNT_INFO[playerid][ac_ID] = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "LAST_CONNECTION", ACCOUNT_INFO[playerid][ac_LAST_CONNECTION], 24);
		ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL] = true;
	}
	db_free_result(Result);

	DB_Query[0] = EOS;
	new DBResult:Result_reg;
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `REGISTRO`\
		(\
			`ID_USER`, `IP`, `NAME`, `EMAIL`, `SALT`, `PASS`\
		)\
		VALUES\
		(\
			'%d', '%q', '%q', '%q', '%q', '%q'\
		);\
		SELECT `DATE` FROM `REGISTRO` WHERE `ID_USER` = '%d';\
	", ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_IP], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_EMAIL], ACCOUNT_INFO[playerid][ac_SALT], ACCOUNT_INFO[playerid][ac_PASS], ACCOUNT_INFO[playerid][ac_ID]);
	Result_reg = db_query(Database, DB_Query);

	if (db_num_rows(Result_reg)) db_get_field_assoc(Result, "DATE", ACCOUNT_INFO[playerid][reg_DATE], 24);
	db_free_result(Result_reg);


	DB_Query[0] = EOS;
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PERSONAJE`\
		(\
			`ID_USER`, `SKIN`, `CASH`, `POS_X`, `POS_Y`, `POS_Z`, `ANGLE`, `SEX`\
		)\
		VALUES\
		(\
			'%d', '%d', '%d', '%f', '%f', '%f', '%f', '%d'\
		);\
	", ACCOUNT_INFO[playerid][ac_ID], CHARACTER_INFO[playerid][ch_SKIN], CHARACTER_INFO[playerid][ch_CASH], CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], CHARACTER_INFO[playerid][ch_SEX]);
	db_free_result(db_query(Database, DB_Query));

	DB_Query[0] = EOS;
	format(DB_Query, sizeof DB_Query, "INSERT INTO `PLAYER_OBJECT` (`ID_USER`) VALUES ('%d');", ACCOUNT_INFO[playerid][ac_ID]);
	db_free_result(db_query(Database, DB_Query));


	new DBResult:Result_pnumber, phone_number;
	Result_pnumber = db_query(Database, "SELECT ABS(RANDOM() % 10000000) AS `NUM` WHERE `NUM` NOT IN (SELECT `PHONE_NUMBER` FROM `PHONE`) LIMIT 1;");
	if (db_num_rows(Result_pnumber)) phone_number = db_get_field_int(Result_pnumber, 0);
	db_free_result(Result_pnumber);

	if (phone_number)
	{
		PLAYER_PHONE[playerid][player_phone_VALID] = true;
		PLAYER_PHONE[playerid][player_phone_NUMBER] = phone_number;
		PLAYER_PHONE[playerid][player_phone_STATE] = PHONE_STATE_ON;
		PLAYER_PHONE[playerid][player_phone_VISIBLE_NUMBER] = true;
		RegisterNewPlayerPhone(playerid);
	}

	new slot;

	PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_VALID] = true;
	format(PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_NAME], 24, "Policia");
	PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_PHONE_NUMBER] = 911;
	RegisterNewPlayerPhoneBook(playerid, slot);
	slot ++;

	PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_VALID] = true;
	format(PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_NAME], 24, "Banco");
	PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_PHONE_NUMBER] = 6740;
	RegisterNewPlayerPhoneBook(playerid, slot);
	slot ++;

	PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_VALID] = true;
	format(PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_NAME], 24, "Aseguradora");
	PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_PHONE_NUMBER] = 38350;
	RegisterNewPlayerPhoneBook(playerid, slot);
	slot ++;

	PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_VALID] = true;
	format(PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_NAME], 24, "Mecanico");
	PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_PHONE_NUMBER] = 570;
	RegisterNewPlayerPhoneBook(playerid, slot);
	slot ++;

	PLAYER_TEMP[playerid][py_USER_EXIT] = true;
	return 1;
}

SaveUserData(playerid)
{
	if (!PLAYER_TEMP[playerid][py_USER_EXIT] || !PLAYER_TEMP[playerid][py_USER_LOGGED]) return 0;

	new DB_Query[1950];
	format(DB_Query, sizeof(DB_Query), "\
		UPDATE `CUENTA` SET \
		`IP` = '%q',\
		`NAME` = '%q',\
		`EMAIL` = '%q',\
		`GPCI` = '%q',\
		`SALT` = '%q',\
		`PASS` = '%q',\
		`LAST_CONNECTION` = CURRENT_TIMESTAMP,\
		`TIME-PLAYING` = '%d',\
		`LEVEL` = '%d',\
		`REP` = '%d',\
		`STATE` = '%d',\
		`DOUBT_CHANNEL` = '%d',\
		`TIME_FOR_REP` = '%d',\
		`ADMIN_LEVEL` = '%d',\
		`PAYDAY_REP` = '%d' \
		WHERE `ID` = '%d';\
		\
		UPDATE `PERSONAJE` SET \
		`SKIN` = '%d',\
		`CASH` = '%d',\
		`POS_X` = '%f',\
		`POS_Y` = '%f',\
		`POS_Z` = '%f',\
		`ANGLE` = '%f',\
		`STATE` = '%d',\
		`INTERIOR` = '%d',\
		`LOCAL_INTERIOR` = '%d',\
		`FIGHT_STYLE` = '%d',\
		`HEALTH` = '%f',\
		`ARMOUR` = '%f',\
		`SEX` = '%d',\
		`HUNGRY` = '%f',\
		`THIRST` = '%f',\
		`BLACK_MARKET_LEVEL` = '%d',\
		`POLICE_JAIL_TIME` = '%d', \
		`POLICE_JAIL_ID` = '%d', \
		`JAIL_REASON` = '%q', \
		`JAILED_BY` = %d \
		WHERE `ID_USER` = '%d';\
		\
		UPDATE `BANK_ACCOUNTS` SET\
		`BALANCE` = '%d' \
		WHERE `ID_ACCOUNT` = '%d';\
		\
		UPDATE `PHONE` SET\
		`PHONE_NUMBER` = '%d',\
		`PHONE_STATE` = '%d',\
		`VISIBLE_NUMBER` = '%d' \
		WHERE `ID_USER` = '%d';\
		\
		UPDATE `PLAYER_OBJECT` SET\
		`GPS` = '%d',\
		`MP3` = '%d',\
		`PHONE_RESOLVER` = '%d', \
		`BOOMBOX` = %d \
		WHERE `ID_USER` = '%d';\
		",
		ACCOUNT_INFO[playerid][ac_IP], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_EMAIL], ACCOUNT_INFO[playerid][ac_SERIAL], ACCOUNT_INFO[playerid][ac_SALT], ACCOUNT_INFO[playerid][ac_PASS], ACCOUNT_INFO[playerid][ac_TIME_PLAYING], ACCOUNT_INFO[playerid][ac_LEVEL], ACCOUNT_INFO[playerid][ac_REP], ACCOUNT_INFO[playerid][ac_STATE], ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL], ACCOUNT_INFO[playerid][ac_TIME_FOR_REP], ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL], ACCOUNT_INFO[playerid][ac_PAYDAY_REP], ACCOUNT_INFO[playerid][ac_ID],
		CHARACTER_INFO[playerid][ch_SKIN], CHARACTER_INFO[playerid][ch_CASH], CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], CHARACTER_INFO[playerid][ch_STATE], CHARACTER_INFO[playerid][ch_INTERIOR], CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA], CHARACTER_INFO[playerid][ch_FIGHT_STYLE], CHARACTER_INFO[playerid][ch_HEALTH], CHARACTER_INFO[playerid][ch_ARMOUR],  CHARACTER_INFO[playerid][ch_SEX], CHARACTER_INFO[playerid][ch_HUNGRY], CHARACTER_INFO[playerid][ch_THIRST], CHARACTER_INFO[playerid][ch_BLACK_MARKET_LEVEL], CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME], CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID], CHARACTER_INFO[playerid][ch_JAIL_REASON], CHARACTER_INFO[playerid][ch_JAILED_BY], ACCOUNT_INFO[playerid][ac_ID],
		BANK_ACCOUNT[playerid][bank_account_BALANCE], BANK_ACCOUNT[playerid][bank_account_ID],
		PLAYER_PHONE[playerid][player_phone_NUMBER], PLAYER_PHONE[playerid][player_phone_STATE], PLAYER_PHONE[playerid][player_phone_VISIBLE_NUMBER], ACCOUNT_INFO[playerid][ac_ID],
		PLAYER_OBJECT[playerid][po_GPS], PLAYER_OBJECT[playerid][po_MP3], PLAYER_OBJECT[playerid][po_PHONE_RESOLVER], PLAYER_OBJECT[playerid][po_BOOMBOX], ACCOUNT_INFO[playerid][ac_ID]
	);
	db_free_result(db_query(Database, DB_Query));

	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0)
	{
		if (BANK_ACCOUNT[playerid][bank_account_ID] != 0)
		{
			new DBResult:Result;
			format(DB_Query, sizeof(DB_Query),
				"DELETE FROM `BANK_TRANSACTIONS` WHERE `ID_ACCOUNT` = '%d' AND `ID_TRANSACTION` NOT IN (SELECT `ID_TRANSACTION` FROM `BANK_TRANSACTIONS` WHERE `ID_ACCOUNT` = '%d' ORDER BY `DATE` DESC LIMIT %d);",
				BANK_ACCOUNT[playerid][bank_account_ID], BANK_ACCOUNT[playerid][bank_account_ID], MAX_BANK_TRANSACTIONS_DIALOG
			);

			Result = db_query(Database, DB_Query);
			db_free_result(Result);
		}

		if (PLAYER_PHONE[playerid][player_phone_VALID])
		{
			new DBResult:Result;
			format(DB_Query, sizeof(DB_Query),
				"DELETE FROM `PHONE_MESSAGES` WHERE `FROM` = '%d' AND `ID_MESSAGE` NOT IN (SELECT `ID_MESSAGE` FROM `PHONE_MESSAGES` WHERE `FROM` = '%d' ORDER BY `DATE` DESC LIMIT 10);\
				DELETE FROM `PHONE_MESSAGES` WHERE `TO` = '%d' AND `ID_MESSAGE` NOT IN (SELECT `ID_MESSAGE` FROM `PHONE_MESSAGES` WHERE `TO` = '%d' ORDER BY `DATE` DESC LIMIT 10);",
				PLAYER_PHONE[playerid][player_phone_NUMBER], PLAYER_PHONE[playerid][player_phone_NUMBER],
				PLAYER_PHONE[playerid][player_phone_NUMBER], PLAYER_PHONE[playerid][player_phone_NUMBER]
			);
			printf("%s", DB_Query);

			Result = db_query(Database, DB_Query); // crash aca
			db_free_result(Result);
		}
	}
	return 1;
}

SendClientMessageEx(playerid, color, const form[], {Float, _}: ...)
{
    #pragma unused form

    static
	   tmp[144]
    ;
    new
	   t1 = playerid,
	   t2 = color
    ;
    const
	   n4 = -4,
	   n16 = -16,
	   size = sizeof tmp
    ;
    #emit stack 28
    #emit push.c size
    #emit push.c tmp
    #emit stack n4
    #emit sysreq.c format
    #emit stack n16

    return (t1 == -1 ? (SendClientMessageToAll(t2, tmp)) : (SendClientMessage(t1, t2, tmp)) );
}

TimeConvert(seconds)
{
	new tmp[16];
	new minutes = floatround(seconds/60);
	seconds -= minutes*60;
	format(tmp, sizeof(tmp), "%d:%02d", minutes, seconds);
	return tmp;
}

/*TimeConvertEx(sec, &days, &hours, &minutes, &seconds)
{
	days = floatround(sec / 86400);
	hours = floatround((sec - (days * 86400)) / 3600);
	minutes = floatround((sec - (days * 86400) - (hours * 3600)) / 60);
	seconds = sec % 60;
	return 1;
}*/

ProxDetector(playerid, Float:radi, string[], col1, col2, col3, col4, col5, div = 0)
{
	new line1_str[165], line2_str[165], bool:line2_used;

	if (div)
	{
		format(line1_str, div + 1, "%s", string);
		if (strlen(string) > div)
		{
			format(line2_str, sizeof line2_str, "� %s", string[div]);
			line2_used = true;
		}
	}
	else format(line1_str, sizeof line1_str, "%s", string);

	new Float:oldposx, Float:oldposy, Float:oldposz, current_vw = GetPlayerVirtualWorld(playerid), current_int = GetPlayerInterior(playerid);
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (!IsPlayerConnected(i)) continue;
		if (!PLAYER_TEMP[i][py_USER_LOGGED]) continue;
		if (GetPlayerVirtualWorld(i) != current_vw) continue;
		if (GetPlayerInterior(i) != current_int) continue;

		if (IsPlayerInRangeOfPoint(i, radi/16, oldposx, oldposy, oldposz))
		{
			SendClientMessage(i, col1, line1_str);
			if (div && line2_used) SendClientMessage(i, col1, line2_str);
		}
		else if (IsPlayerInRangeOfPoint(i, radi/8, oldposx, oldposy, oldposz))
		{
			SendClientMessage(i, col2, line1_str);
			if (div && line2_used) SendClientMessage(i, col2, line2_str);
		}
		else if (IsPlayerInRangeOfPoint(i, radi/4, oldposx, oldposy, oldposz))
		{
			SendClientMessage(i, col3, line1_str);
			if (div && line2_used) SendClientMessage(i, col3, line2_str);
		}
		else if (IsPlayerInRangeOfPoint(i, radi/2, oldposx, oldposy, oldposz))
		{
			SendClientMessage(i, col4, line1_str);
			if (div && line2_used) SendClientMessage(i, col4, line2_str);
		}
		else if (IsPlayerInRangeOfPoint(i, radi, oldposx, oldposy, oldposz))
		{
			SendClientMessage(i, col5, line1_str);
			if (div && line2_used) SendClientMessage(i, col5, line2_str);
		}
	}
	return 1;
}

SendResponsiveMessage(playerid, color, const string[], div = 0)
{
	new line1_str[144], line2_str[144], bool:line2_used;

	if (div)
	{
		format(line1_str, div + 1, "%s", string);
		if (strlen(string) > div)
		{
			format(line2_str, sizeof line2_str, "� %s", string[div]);
			line2_used = true;
		}
	}
	else format(line1_str, sizeof line1_str, "%s", string);

	SendClientMessage(playerid, color, line1_str);
	if (div && line2_used) SendClientMessage(playerid, -1, line2_str);
	return 1;
}

NearbyMessage(Float:pos_x, Float:pos_y, Float:pos_z, current_int, current_vw, Float:radi, col, const string[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (!IsPlayerConnected(i)) continue;
		if (!PLAYER_TEMP[i][py_USER_LOGGED]) continue;
		if (GetPlayerVirtualWorld(i) != current_vw) continue;
		if (GetPlayerInterior(i) != current_int) continue;

		if (IsPlayerInRangeOfPoint(i, radi, pos_x, pos_y, pos_z)) SendClientMessage(i, col, string);
	}
	return 1;
}

IsValidRPName(const string[])
{
    new Regex:reg_exp = Regex_New("[A-Z][a-z]+_[A-Z][a-z]{1,3}[A-Z]?[a-z]*"); 
    new result = Regex_Check(string, reg_exp); 
    Regex_Delete(reg_exp); 
    return result; 
}

StringContainsIP(const string[])
{
	if (strfind(string, "51.161.31.157", true) != -1) return false;

    new Regex:reg_exp = Regex_New("([0-9]{1,3}[\\.]){3}[0-9]{1,3}"), RegexMatch:results, pos;
    new result = Regex_Search(string, reg_exp, results, pos);
    Regex_Delete(reg_exp); 
    return result; 
}

KickEx(playerid, time = 0)
{
	if (GetPlayerState(playerid) == PLAYER_STATE_SPECTATING) return 0;
	PLAYER_TEMP[playerid][py_KICKED] = true;
	
	if (!time) Kick(playerid);
	else
	{
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][0]);
		PLAYER_TEMP[playerid][py_TIMERS][0] = SetTimerEx("KickPlayer", time, false, "i", playerid);
	}
	return 1;
}

forward KickPlayer(playerid);
public KickPlayer(playerid)
{
	#if DEBUG_MODE == 1
		printf("KickPlayer"); // debug juju
	#endif

	return Kick(playerid);
}

SetRolePlayNames(playerid)
{
	if (isnull(PLAYER_TEMP[playerid][py_NAME])) return 0;

	new name[24], bool:underscore;
	format(name, 24, "%s", PLAYER_TEMP[playerid][py_NAME]);
	format(PLAYER_TEMP[playerid][py_RP_NAME], 24, "%s", name);
	for(new i = 0; i < 24; i++)
	{
		if (name[i] == '_')
		{
			PLAYER_TEMP[playerid][py_RP_NAME][i] = ' ';
			if (!underscore)
			{
				strmid(PLAYER_TEMP[playerid][py_FIRST_NAME], name, 0, i);
				strmid(PLAYER_TEMP[playerid][py_SUB_NAME], name, i + 1, 24);
				underscore = true;
			}
		}
	}
	return 1;
}

LoadCharacterData(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[164];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PERSONAJE` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		CHARACTER_INFO[playerid][ch_SKIN] = db_get_field_assoc_int(Result, "SKIN");
		CHARACTER_INFO[playerid][ch_CASH] = db_get_field_assoc_int(Result, "CASH");
		CHARACTER_INFO[playerid][ch_FIGHT_STYLE] = db_get_field_assoc_int(Result, "FIGHT_STYLE");
		CHARACTER_INFO[playerid][ch_HEALTH] = db_get_field_assoc_float(Result, "HEALTH");
		CHARACTER_INFO[playerid][ch_ARMOUR] = db_get_field_assoc_float(Result, "ARMOUR");
		CHARACTER_INFO[playerid][ch_SEX] = db_get_field_assoc_int(Result, "SEX");
		CHARACTER_INFO[playerid][ch_HUNGRY] = db_get_field_assoc_float(Result, "HUNGRY");
		CHARACTER_INFO[playerid][ch_THIRST] = db_get_field_assoc_float(Result, "THIRST");
		CHARACTER_INFO[playerid][ch_BLACK_MARKET_LEVEL] = db_get_field_assoc_int(Result, "BLACK_MARKET_LEVEL");
		CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] = db_get_field_assoc_int(Result, "POLICE_JAIL_TIME");
		CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID] = db_get_field_assoc_int(Result, "POLICE_JAIL_ID");
		db_get_field_assoc(Result, "JAIL_REASON", CHARACTER_INFO[playerid][ch_JAIL_REASON]);
		CHARACTER_INFO[playerid][ch_JAILED_BY] = db_get_field_assoc_int(Result, "JAILED_BY");
	}
	db_free_result(Result);

	// Security question
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `SECURITY_QUESTIONS` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		PLAYER_TEMP[playerid][py_ANSWER_INDEX] = db_get_field_assoc_int(Result, "QUESTION");
		db_get_field_assoc(Result, "RESPONSE", PLAYER_TEMP[playerid][py_ANSWER_RESPONSE], 32);
	}
	else PLAYER_TEMP[playerid][py_ANSWER_INDEX] = 1337;

	db_free_result(Result);
	return 1;
}

LoadPlayerBankAccountData(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[85];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `BANK_ACCOUNTS` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		BANK_ACCOUNT[playerid][bank_account_ID] = db_get_field_assoc_int(Result, "ID_ACCOUNT");
		BANK_ACCOUNT[playerid][bank_account_BALANCE] = db_get_field_assoc_int(Result, "BALANCE");
	}
	db_free_result(Result);
	return 1;
}

LoadPlayerObjectsData(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[85];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_OBJECT` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		PLAYER_OBJECT[playerid][po_GPS] = db_get_field_assoc_int(Result, "GPS");
		PLAYER_OBJECT[playerid][po_MP3] = db_get_field_assoc_int(Result, "MP3");
		PLAYER_OBJECT[playerid][po_PHONE_RESOLVER] = db_get_field_assoc_int(Result, "PHONE_RESOLVER");
		PLAYER_OBJECT[playerid][po_BOOMBOX] = db_get_field_assoc_int(Result, "BOOMBOX");
	}
	db_free_result(Result);
	return 1;
}

LoadPlayerPhoneData(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[100];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PHONE` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		PLAYER_PHONE[playerid][player_phone_VALID] = true;
		PLAYER_PHONE[playerid][player_phone_NUMBER] = db_get_field_assoc_int(Result, "PHONE_NUMBER");
		PLAYER_PHONE[playerid][player_phone_STATE] = db_get_field_assoc_int(Result, "PHONE_STATE");
		PLAYER_PHONE[playerid][player_phone_VISIBLE_NUMBER] = db_get_field_assoc_int(Result, "VISIBLE_NUMBER");
	}
	db_free_result(Result);


	DB_Query[0] = EOS;
	new DBResult:Result_phonebook;
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PHONE_BOOK` WHERE `PHONE_ID` = '%d' LIMIT %d;", PLAYER_PHONE[playerid][player_phone_NUMBER], MAX_PHONE_CONTACTS);
	Result_phonebook = db_query(Database, DB_Query);

	new index;
	for(new i; i < db_num_rows(Result_phonebook); i++ )
	{
		if (index >= MAX_PHONE_CONTACTS)
		{
			printf("[debug]  L�mite superado en array 'PB' al intentar cargar de la base de datos.");
			break;
		}

		PLAYER_PHONE_BOOK[playerid][index][phone_book_contact_VALID] = true;

		PLAYER_PHONE_BOOK[playerid][index][phone_book_contact_ID] = db_get_field_assoc_int(Result_phonebook, "CONTACT_ID");
		db_get_field_assoc(Result_phonebook, "NAME", PLAYER_PHONE_BOOK[playerid][index][phone_book_contact_NAME], 24);
		PLAYER_PHONE_BOOK[playerid][index][phone_book_contact_PHONE_NUMBER] = db_get_field_assoc_int(Result_phonebook, "PHONE_NUMBER");

		index ++;
		db_next_row(Result_phonebook);
	}
	db_free_result(Result_phonebook);
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
		    ShowPlayerMessage(playerid, "~r~No respondieron el tel�fono.", 2);
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
			printf("[debug]  L�mite superado en array 'PP' al intentar cargar de la base de datos.");
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
			printf("[debug]  L�mite superado en array 'P_GPS' al intentar cargar de la base de datos.");
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
			printf("[debug]  L�mite superado en array 'PTOYS' al intentar cargar de la base de datos.");
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
		    
		    	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Tener armas prohibidas");
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
				ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP~w~ para tener m�s objetos.", 4);
				return 1;
			}

			if (slot == -1)
			{
			    ShowPlayerMessage(playerid, "~r~No hay m�s espacio para objetos en este veh�culo.", 3);
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
			if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No est�s depie.", 3);
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
				if (PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~Los polic�as no pueden tener banda.", 3);

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
					ShowPlayerMessage(playerid, "~r~No puedes abandonar la banda porque eres el~n~�nico miembro con el rango principal.", 3);
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
				"COL_WHITE"Las disputas son cada 50 minutos, la �ltima fue hace %s.", TimeConvert(time));

			ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Disputas", dialog, "Cerrar", "");
			PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
			return 1;
		}

		else if (playertextid == PlayerTextdraws[playerid][ptextdraw_INV][41])
		{
			/* Header */
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47], "Bienvenido a Hyaxe");
			
			/* Body */
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48], TextToSpanish("~w~La idea de Hyaxe surgi� en 2018, pero no fue hasta mediados de 2019 que comenz� a desarrollarse, con tiempos m�s activos y otros no tanto, pas� por varios cambios, primero fue un juego de roles y luego de supervivencia, nos quedamos con la primera opci�n porque la encontramos m�s rentable en SA:MP. Con el tiempo ampliamos nuestras fronteras a nuevos juegos como GTA:V, Rust, entre otros, las personas que trabajan en Hyaxe son pocas, pero esperamos que en el futuro aumente el n�mero de miembros del equipo."));
			
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
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48], TextToSpanish("~w~Los trabajos es un sistema en el que los jugadores pueden obtener recompensas, como dinero, hycoins, entre otros. Llevando a cabo diversas tareas, como picar, recoger basura, transportar cargas, etc. Esto depender� del trabajo que elija, puede ser basurero, cosechador, pescador, minero o un trabajo especial como la polic�a, pero para esto debe postularse en ~r~foro.hyaxe.com~w~, solo cuando las aplicaciones est�n abiertas. Cuando consigas un trabajo, renunciar�s autom�ticamente a todos los otros, a menos que sean especiales (como polic�a), cuanto m�s trabajes, m�s experiencia tendr�s, con m�s experiencia podr�s desbloquear pagos m�s altos. Tambi�n puedes comprar una membres�a VIP en ~r~www.hyaxe.com/store~w~ con la cual vas a desbloquear pagas extras."));
			
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
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48], TextToSpanish("~w~Las bandas son una forma para que los jugadores formen grupos sociales con sistemas del servidor, lo que tambi�n brinda nuevas posibilidades de rol y nuevas formas de obtener ganancias. Para las bandas hemos desarrollado un sistema de particular, Las Disputas, hay dos tipos, la disputa de graffiti, donde las pandillas luchan por quien pinta primero el graffiti, y las disputas de Mercados Negros, que es casi lo mismo, solo que es un poco m�s complicado para ganarlos. Para crear una banda, haga clic en ~r~Banda~w~, debe tener el nivel 2 y tener 10,000. Puede poner una descripci�n, administrar, crear roles y configurar sus permisos, todo a trav�s de una interfaz f�cil de entender."));
			
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
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48], TextToSpanish("~w~Puede comprar un veh�culo en cualquier concesionario, puede ubicar uno haciendo click en ~r~Mapa~w~ o usar uno gratuito como los que aparecen en el lobby.~n~~n~Teclas:~n~Abrir puertas ~r~>~w~ Espacio + Y~n~Encender/apagar luces ~r~>~w~ Espacio + N~n~Administrar ~r~>~w~ 2"));
			
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
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48], TextToSpanish("~w~Una propiedad te servir� para esconderse de la polic�a, hacer fiestas y muchos m�s. Por ahora, este sistema no esta muy avanzado en comparaci�n con todo lo dem�s en el servidor, pero en el futuro se va a poder decorar el interior, colocar almacenes, dar la llave a amigos y mucho m�s."));
			
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
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48], TextToSpanish("~w~Hyaxe Client es un cliente personalizado que incluye nuevas caracter�sticas al servidor, como por ejemplo, un chat de voz. Es muy f�cil instalarlo, solo visite ~r~www.hyaxe.com/client~w~, si se le dificulta busque en YouTube: ~r~Chat de voz Hyaxe tutorial~w~. Muchos usuarios hicieron tutoriales, aprov�chelo."));
			
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
			if (SvGetVersion(playerid))
			{
				PlayerPayday(playerid);
			}
			else ShowPlayerNotification(playerid, "Instale el cliente de Hyaxe en www.hyaxe.com/client");
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

CMD:comprar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	CheckAndBuyProperty(playerid);
	return 1;
}

CMD:tienda(playerid, params[])
{
	ShowStore(playerid);
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
			printf("[debug]  L�mite superado en array 'PROPERTY_INFO' al intentar cargar de la base de datos.");
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

GetOwnerIntProperty(id_house)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (CHARACTER_INFO[i][ch_STATE] == ROLEPLAY_STATE_OWN_PROPERTY)
			{
				if (CHARACTER_INFO[i][ch_INTERIOR_EXTRA] == id_house)
				{
					return i;
				}
			}
		}
	}
	return -1;
}

RecalculeCrewGraffitis(crew_id)
{
	new DBResult:Result, DB_Query[140];

	format(DB_Query, sizeof DB_Query, "SELECT * FROM `GRAFFITIS` WHERE `ID_CREW` = '%d'", CREW_INFO[crew_id][crew_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result) == 0) CREW_INFO[crew_id][crew_GRAFFITIS_COUNT] = 0;
	else
	{
		CREW_INFO[crew_id][crew_GRAFFITIS_COUNT] = db_num_rows(Result);
	}
	return 1;
}

RecalculeCrewMarkets(crew_id)
{
	new DBResult:Result, DB_Query[140];

	format(DB_Query, sizeof DB_Query, "SELECT * FROM `BLACK_MARKETS` WHERE `ID_CREW` = '%d'", CREW_INFO[crew_id][crew_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result) == 0) CREW_INFO[crew_id][crew_MARKET_COUNT] = 0;
	else
	{
		CREW_INFO[crew_id][crew_MARKET_COUNT] = db_num_rows(Result);
	}
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
			printf("[debug]  L�mite superado en array 'CREW_INFO' al intentar cargar de la base de datos.");
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
			printf("[debug]  L�mite superado en array 'TERRITORIES' al intentar cargar de la base de datos.");
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

LoadBlackMarkets()
{
	for(new i = 0; i < sizeof BLACK_MARKET_OBJ; i ++)
	{
		new DB_Query[140],
			DBResult:Result,
			str_text[128];

		format(DB_Query, sizeof DB_Query, "SELECT * FROM `BLACK_MARKETS` WHERE `MARKET_ID` = '%d'", i);
		Result = db_query(Database, DB_Query);
				
		new crew_id = getCrewIndexWithId(db_get_field_assoc_int(Result, "ID_CREW"));
		if (CREW_INFO[crew_id][crew_VALID])
		{
			format(str_text, sizeof(str_text), "\n"COL_WHITE"Dominado por: {%06x}%s",  CREW_INFO[crew_id][crew_COLOR] >>> 8, CREW_INFO[crew_id][crew_NAME]);
		}
		else
		{
			format(str_text, sizeof(str_text), "\n"COL_WHITE"Dominado por: Nadie");
		}

		BLACK_MARKET_OBJ[i][bm_LABEL] = CreateDynamic3DTextLabel(str_text, 0xF7F7F700, BLACK_MARKET_OBJ[i][bm_EXTERIOR_X], BLACK_MARKET_OBJ[i][bm_EXTERIOR_Y], BLACK_MARKET_OBJ[i][bm_EXTERIOR_Z] + 0.25, 5.0, .testlos = true, .worldid = 0, .interiorid = 0);
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
    if (info[0] == PICKUP_TYPE_MONEY)
    {
    	GivePlayerCash(playerid, minrand(10, 350), false);
    	DestroyDynamicPickup(pickupid);
    	return 0;
    }

    PLAYER_TEMP[playerid][py_LAST_PICKUP_ID] = pickupid;
    return 1;
}

SendGraffitiNotification(const ann[])
{
	KillTimer(GraffitiGlobalTime);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
    {
        if (IsPlayerConnected(i))
        {
        	if (PLAYER_CREW[i][player_crew_VALID] || PLAYER_WORKS[i][WORK_POLICE])
			{
                ShowPlayerNotification(i, ann, 6);
                RecalculeCrewGraffitis(PLAYER_CREW[i][player_crew_INDEX]);
            }
        }
    }
    return 1;
}

CheckMarketProgress(playerid)
{
	if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_PROGRESS] > 98)
	{
		new str_text[128];

		ClearAnimations(playerid);
		ShowPlayerMessage(playerid, "Conquistando...~n~~r~100 %", 2);

		for(new x = 0, j = GetPlayerPoolSize(); x <= j; x++)
		{
			if (IsPlayerConnected(x))
			{
				if (PLAYER_CREW[x][player_crew_VALID])
				{
					CREW_INFO[ PLAYER_CREW[x][player_crew_INDEX] ][crew_MARKET_PROGRESS] = 0;
					CREW_INFO[ PLAYER_CREW[x][player_crew_INDEX] ][crew_IN_GRAFFITI] = false;
				}

				TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][0]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][1]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][2]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][3]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][4]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][5]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][6]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][7]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][8]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][9]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][10]);

				KillTimer(PLAYER_TEMP[x][py_TIMERS][41]);
				PLAYER_TEMP[x][py_IN_MARKET] = false;
				RemovePlayerMapIcon(x, 0);
			}
		}

		for(new i = 0; i < sizeof BLACK_MARKET_OBJ; i ++)
		{
			if (BLACK_MARKET_OBJ[i][bm_ACTIVATED] == true)
			{
				BLACK_MARKET_OBJ[i][bm_ACTIVATED] = false;
				//TextDrawColor(Textdraws[textdraw_GRAFFITI][0], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);
				//SetTimer("FirstGraffitiAnnounce", 1500000, false);
				format(str_text, sizeof(str_text), "%s ahora domina el mercado de %s.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], BLACK_MARKET_OBJ[i][bm_ZONE_NAME]);
				SendGraffitiNotification(str_text);
				SendDiscordWebhook(str_text, 3);

				new str[144]; format(str, 144, "[MERCADO] %s ha ganado el mercado en %s.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], BLACK_MARKET_OBJ[i][bm_ZONE_NAME]);
    			SendMessageToAdmins(COLOR_ANTICHEAT, str, 1);

    			format(str_text, sizeof(str_text), "\n"COL_WHITE"Dominado por: {%06x}%s",  CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] >>> 8, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
    			UpdateDynamic3DTextLabelText(BLACK_MARKET_OBJ[i][bm_LABEL], 0xF7F7F700, str_text);

				new DB_Query[140];

				/* UPDATE OLD CREW DATE */
				new DBResult:Result;
				format(DB_Query, sizeof DB_Query, "SELECT * FROM `BLACK_MARKETS` WHERE `MARKET_ID` = '%d'", i);
				Result = db_query(Database, DB_Query);
				
				new crew_id = db_get_field_assoc_int(Result, "ID_CREW");

				new tmp_old = (CREW_INFO[getCrewIndexWithId(crew_id)][crew_MARKET_COUNT] - 1);
				CREW_INFO[getCrewIndexWithId(crew_id)][crew_MARKET_COUNT] = tmp_old;
				if (tmp_old < 0) tmp_old = 0;

				if (CREW_INFO[getCrewIndexWithId(crew_id)][crew_VALID])
				{
					format(DB_Query, sizeof DB_Query, "UPDATE `CREW` SET `MARKETS_COUNT` = '%d' WHERE `ID` = '%d';", tmp_old, getCrewIndexWithId(crew_id));
					db_free_result(db_query(Database, DB_Query));
				}

				/* UPDATE NEW CREW DATE */
				new tmp_new = (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_COUNT] + 1);
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_COUNT] = tmp_new;

				format(DB_Query, sizeof DB_Query, "UPDATE `CREW` SET `MARKETS_COUNT` = '%d' WHERE `ID` = '%d';", tmp_new, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID]);
				db_free_result(db_query(Database, DB_Query));

				/* UPDATE GRAFFITI DATE */
				format(DB_Query, sizeof DB_Query, "UPDATE `BLACK_MARKETS` SET `MARKET_ID` = '%d', `ID_CREW` = '%i', `LAST_START` = '%i' WHERE `MARKET_ID` = '%d';", i, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID], gettime(), i);
				db_free_result(db_query(Database, DB_Query));

				/* RESET OTHER CREW's */
				BLACK_MARKET_OBJ[i][bm_CREW_ONE] = 0;
				BLACK_MARKET_OBJ[i][bm_CREW_TWO] = 0;
				BLACK_MARKET_OBJ[i][bm_CREW_THREE] = 0;
			}
		}
	}
	return 1;
}

CheckGraffitiProgress(playerid)
{
	for(new x = 0, j = GetPlayerPoolSize(); x <= j; x++)
	{
		if (IsPlayerConnected(x))
		{
			if (PLAYER_TEMP[playerid][py_DEBUG])
			{
				SendClientMessageEx(playerid, -1, "[%d] %s (%i) - %s (%d): %d", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS], PLAYER_TEMP[playerid][py_NAME], playerid, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], PLAYER_CREW[playerid][player_crew_INDEX], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID]);
			}
		}
	}

	if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS] > 98)
	{
		new CrewColorGraffiti_ARGB = hy_RGBAToARGB(getPlayerCrewColor(playerid));
		new str_text[128];

		for(new x = 0, j = GetPlayerPoolSize(); x <= j; x++)
		{
			if (IsPlayerConnected(x))
			{
				if (PLAYER_CREW[x][player_crew_VALID])
				{
					CREW_INFO[ PLAYER_CREW[x][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS] = 0;
					CREW_INFO[ PLAYER_CREW[x][player_crew_INDEX] ][crew_IN_GRAFFITI] = false;
				}

				TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][0]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][1]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][2]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][3]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][4]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][5]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][6]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][7]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][8]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][9]);
                TextDrawHideForPlayer(x, Textdraws[textdraw_GRAFFITI_PLUS][10]);

				KillTimer(PLAYER_TEMP[x][py_TIMERS][41]);
				PLAYER_TEMP[x][py_IN_MARKET] = false;
				RemovePlayerMapIcon(x, 0);
			}
		}

		for(new i = 0; i < sizeof GRAFFITIS_OBJ; i ++)
		{
			if (GRAFFITIS_OBJ[i][g_ACTIVATED] == true)
			{
				GRAFFITIS_OBJ[i][g_ACTIVATED] = false;
				KillTimer(GraffitiCancelTimer);
				SetTimer("FirstGraffitiAnnounce", 1500000, false);

				format(str_text, sizeof(str_text), "%s ha ganado el graffiti en %s.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], GRAFFITIS_OBJ[i][g_ZONE_NAME]);
				SendGraffitiNotification(str_text);
				SendDiscordWebhook(str_text, 2);

				new str[144]; format(str, 144, "[GRAFFITI] %s ha ganado el graffiti en %s.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], GRAFFITIS_OBJ[i][g_ZONE_NAME]);
    			SendMessageToAdmins(COLOR_ANTICHEAT, str, 1);

				SetDynamicObjectMaterialText(GRAFFITIS_OBJ[i][g_ID], 0, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], OBJECT_MATERIAL_SIZE_512x64, GRAFFITIS_OBJ[i][g_FONT], 60, 0, CrewColorGraffiti_ARGB, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

				new DB_Query[140];

				/* UPDATE OLD CREW DATE */
				new DBResult:Result;
				format(DB_Query, sizeof DB_Query, "SELECT * FROM `GRAFFITIS` WHERE `GRAFF_ID` = '%d'", i);
				Result = db_query(Database, DB_Query);
				
				new crew_id = db_get_field_assoc_int(Result, "ID_CREW"),
					cindex = getCrewIndexWithId(crew_id);

				new tmp_old = (CREW_INFO[cindex][crew_GRAFFITIS_COUNT] - 1);
				if (tmp_old < 0) tmp_old = 0;


				CREW_INFO[cindex][crew_GRAFFITIS_COUNT] = tmp_old;

				if (CREW_INFO[cindex][crew_VALID])
				{
					format(DB_Query, sizeof DB_Query, "UPDATE `CREW` SET `GRAFFITIS_COUNT` = '%d' WHERE `ID` = '%d';", tmp_old, getCrewIndexWithId(crew_id));
					db_free_result(db_query(Database, DB_Query));
				}

				/* UPDATE NEW CREW DATE */
				new tmp_new = (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITIS_COUNT] + 1);
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITIS_COUNT] = tmp_new;

				format(DB_Query, sizeof DB_Query, "UPDATE `CREW` SET `GRAFFITIS_COUNT` = '%d' WHERE `ID` = '%d';", tmp_new, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID]);
				db_free_result(db_query(Database, DB_Query));

				/* UPDATE GRAFFITI DATE */
				format(DB_Query, sizeof DB_Query, "UPDATE `GRAFFITIS` SET `GRAFF_ID` = '%d', `ID_CREW` = '%i' WHERE `GRAFF_ID` = '%d';", i, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID], i);
				db_free_result(db_query(Database, DB_Query));

				/* RESET OTHER CREW's */
				GRAFFITIS_OBJ[i][g_CREW_ONE] = 0;
				GRAFFITIS_OBJ[i][g_CREW_TWO] = 0;
				GRAFFITIS_OBJ[i][g_CREW_THREE] = 0;

				if (GRAFFITIS_OBJ[i][g_OBJ_CREW_ONE] != INVALID_STREAMER_ID) DestroyDynamicObject(GRAFFITIS_OBJ[i][g_OBJ_CREW_ONE]);
				if (GRAFFITIS_OBJ[i][g_OBJ_CREW_TWO] != INVALID_STREAMER_ID) DestroyDynamicObject(GRAFFITIS_OBJ[i][g_OBJ_CREW_TWO]);
				if (GRAFFITIS_OBJ[i][g_OBJ_CREW_THREE] != INVALID_STREAMER_ID) DestroyDynamicObject(GRAFFITIS_OBJ[i][g_OBJ_CREW_THREE]);
			}
		}
	}
	return 1;
}

forward UpdateGraffitiProgress(playerid);
public UpdateGraffitiProgress(playerid)
{
	#if DEBUG_MODE == 1
		printf("UpdateGraffitiProgress"); // debug juju
	#endif

	if (IsPlayerPaused(playerid)) return KillTimer(PLAYER_TEMP[playerid][py_TIMERS][41]);
	if (GetPlayerWeapon(playerid) != 41) return KillTimer(PLAYER_TEMP[playerid][py_TIMERS][41]);

	//Strings
	new crew_one[64],
		crew_two[64],
		crew_three[64],
		symbol[2] = "%";

	for(new x = 0; x < sizeof GRAFFITIS_OBJ; x ++)
	{
		if (GRAFFITIS_OBJ[x][g_ACTIVATED] == true)
		{
			new Float:distance = GetPlayerDistanceFromPoint(playerid, GRAFFITIS_OBJ[x][g_X], GRAFFITIS_OBJ[x][g_Y], GRAFFITIS_OBJ[x][g_Z]);
			if (distance > 2.5)
				return KillTimer(PLAYER_TEMP[playerid][py_TIMERS][41]);

			//Give crew text slot
			if (GRAFFITIS_OBJ[x][g_CREW_ONE] == 0)
			{
				if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_GRAFFITI] == false)
				{
					GRAFFITIS_OBJ[x][g_CREW_ONE] = CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID];
					CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_GRAFFITI] = true;

					new CrewColorGraffiti_ARGB = hy_RGBAToARGB(getPlayerCrewColor(playerid));
					GRAFFITIS_OBJ[x][g_OBJ_CREW_ONE] = CreateDynamicObject(GRAFFITIS_OBJ[x][g_MODELID], GRAFFITIS_OBJ[x][g_X], GRAFFITIS_OBJ[x][g_Y], GRAFFITIS_OBJ[x][g_Z], GRAFFITIS_OBJ[x][g_RX], GRAFFITIS_OBJ[x][g_RY], GRAFFITIS_OBJ[x][g_RZ], 0, 0);
					SetDynamicObjectMaterialText(GRAFFITIS_OBJ[x][g_OBJ_CREW_ONE], 0, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], OBJECT_MATERIAL_SIZE_512x64, GRAFFITIS_OBJ[x][g_FONT], 60, 0, CrewColorGraffiti_ARGB, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

					format(crew_one, sizeof(crew_one), "%s %d %s", TextToSpanish(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]), CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS], symbol);
					TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][1], crew_one);
				}
			}

			if (GRAFFITIS_OBJ[x][g_CREW_TWO] == 0)
			{
				if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_GRAFFITI] == false)
				{
					GRAFFITIS_OBJ[x][g_CREW_TWO] = CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID];
					CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_GRAFFITI] = true;

					new CrewColorGraffiti_ARGB = hy_RGBAToARGB(getPlayerCrewColor(playerid));
					GRAFFITIS_OBJ[x][g_OBJ_CREW_TWO] = CreateDynamicObject(GRAFFITIS_OBJ[x][g_MODELID], GRAFFITIS_OBJ[x][g_X], GRAFFITIS_OBJ[x][g_Y], GRAFFITIS_OBJ[x][g_Z], GRAFFITIS_OBJ[x][g_RX], GRAFFITIS_OBJ[x][g_RY], GRAFFITIS_OBJ[x][g_RZ], 0, 0);
					SetDynamicObjectMaterialText(GRAFFITIS_OBJ[x][g_OBJ_CREW_TWO], 0, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], OBJECT_MATERIAL_SIZE_512x64, GRAFFITIS_OBJ[x][g_FONT], 60, 0, CrewColorGraffiti_ARGB, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

					format(crew_two, sizeof(crew_two), "%s %d %s", TextToSpanish(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]), CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS], symbol);
					TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][3], crew_two);
				}
			}

			if (GRAFFITIS_OBJ[x][g_CREW_THREE] == 0)
			{
				if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_GRAFFITI] == false)
				{
					GRAFFITIS_OBJ[x][g_CREW_THREE] = CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID];
					CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_GRAFFITI] = true;

					new CrewColorGraffiti_ARGB = hy_RGBAToARGB(getPlayerCrewColor(playerid));
					GRAFFITIS_OBJ[x][g_OBJ_CREW_THREE] = CreateDynamicObject(GRAFFITIS_OBJ[x][g_MODELID], GRAFFITIS_OBJ[x][g_X], GRAFFITIS_OBJ[x][g_Y], GRAFFITIS_OBJ[x][g_Z], GRAFFITIS_OBJ[x][g_RX], GRAFFITIS_OBJ[x][g_RY], GRAFFITIS_OBJ[x][g_RZ], 0, 0);
					SetDynamicObjectMaterialText(GRAFFITIS_OBJ[x][g_OBJ_CREW_THREE], 0, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], OBJECT_MATERIAL_SIZE_512x64, GRAFFITIS_OBJ[x][g_FONT], 60, 0, CrewColorGraffiti_ARGB, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

					format(crew_three, sizeof(crew_three), "%s %d %s", TextToSpanish(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]), CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS], symbol);
					TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][4], crew_three);
				}
			}

			//Check initial crew text slot
			if (GRAFFITIS_OBJ[x][g_CREW_ONE] == CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID])
			{
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS] ++;

				TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][1], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);
				format(crew_one, sizeof(crew_one), "%s %d %s", TextToSpanish(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]), CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS], symbol);
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][1], crew_one);
			}

			if (GRAFFITIS_OBJ[x][g_CREW_TWO] == CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID])
			{
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS] ++;

				TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][3], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);
				
				format(crew_two, sizeof(crew_two), "%s %d %s", TextToSpanish(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]), CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS], symbol);
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][3], crew_two);
			}

			if (GRAFFITIS_OBJ[x][g_CREW_THREE] == CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID])
			{
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS] ++;

				TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][4], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);
				
				format(crew_three, sizeof(crew_three), "%s %d %s", TextToSpanish(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]), CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITI_PROGRESS], symbol);
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][4], crew_three);
			}

			for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
			{
				if (IsPlayerConnected(i))
				{
					if (PLAYER_CREW[i][player_crew_VALID] || PLAYER_WORKS[i][WORK_POLICE])
					{
						TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][0]);

						if (GRAFFITIS_OBJ[x][g_CREW_ONE] > 0)
						{
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][1]);
						}

						if (GRAFFITIS_OBJ[x][g_CREW_TWO] > 0)
						{
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][3]);
						}

						if (GRAFFITIS_OBJ[x][g_CREW_THREE] > 0)
						{
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][4]);
						}

						TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][2]);
					}
				}
			}
		}
	}
    
	CheckGraffitiProgress(playerid);
    return 1;
}

UpdateSizeBarMarket(crew_index, init)
{
	new Float:size = 502.0 + (floatround(CREW_INFO[crew_index][crew_MARKET_PROGRESS]) + 5.0),
		td_bg = init,
		td_bar = (init + 1);

	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][td_bar], 606.000000, 0.000000);

	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][td_bg], AdjustDarkness(CREW_INFO[crew_index][crew_COLOR], 1.75));
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][td_bar], CREW_INFO[crew_index][crew_COLOR]);

	if (size < 606.0)
	{
		TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][td_bar], size, 0.000000);
	}
	else
	{
		TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][td_bar], 606.000000, 0.000000);
	}
	return 1;
}

forward UpdateMarketProgress(playerid);
public UpdateMarketProgress(playerid)
{
	#if DEBUG_MODE == 1
		printf("UpdateMarketProgress"); // debug juju
	#endif

	if (IsPlayerPaused(playerid)) return 0;
	if (GetPlayerInterior(playerid) != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return 0;

	//Strings
	new crew_one[64],
		crew_two[64],
		crew_three[64],
		player_str[128];

	for(new x = 0; x < sizeof BLACK_MARKET_OBJ; x ++)
	{
		if (BLACK_MARKET_OBJ[x][bm_ACTIVATED] == true)
		{
			//Give crew text slot
			if (BLACK_MARKET_OBJ[x][bm_CREW_ONE] == 0)
			{
				if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_MARKET] == false)
				{
					BLACK_MARKET_OBJ[x][bm_CREW_ONE] = CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID];
					CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_MARKET] = true;

					format(crew_one, sizeof(crew_one), "%s~n~ _", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
					TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][1], crew_one);
					UpdateSizeBarMarket(PLAYER_CREW[playerid][player_crew_INDEX], 5);
				}
			}

			if (BLACK_MARKET_OBJ[x][bm_CREW_TWO] == 0)
			{
				if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_MARKET] == false)
				{
					BLACK_MARKET_OBJ[x][bm_CREW_TWO] = CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID];
					CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_MARKET] = true;

					format(crew_two, sizeof(crew_two), "%s~n~ _", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
					TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][3], crew_two);
					UpdateSizeBarMarket(PLAYER_CREW[playerid][player_crew_INDEX], 7);
				}
			}

			if (BLACK_MARKET_OBJ[x][bm_CREW_THREE] == 0)
			{
				if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_MARKET] == false)
				{
					BLACK_MARKET_OBJ[x][bm_CREW_THREE] = CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID];
					CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_IN_MARKET] = true;

					format(crew_three, sizeof(crew_three), "%s~n~ _", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
					TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][4], crew_three);
					UpdateSizeBarMarket(PLAYER_CREW[playerid][player_crew_INDEX], 9);
				}
			}

			//Check initial crew text slot
			if (BLACK_MARKET_OBJ[x][bm_CREW_ONE] == CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID])
			{
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_PROGRESS] ++;

				TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][1], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);
				
				format(crew_one, sizeof(crew_one), "%s~n~ _", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][1], crew_one);
				UpdateSizeBarMarket(PLAYER_CREW[playerid][player_crew_INDEX], 5);
			}

			if (BLACK_MARKET_OBJ[x][bm_CREW_TWO] == CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID])
			{
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_PROGRESS] ++;

				TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][3], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);
				
				format(crew_two, sizeof(crew_two), "%s~n~ _", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][3], crew_two);
				UpdateSizeBarMarket(PLAYER_CREW[playerid][player_crew_INDEX], 7);
			}

			if (BLACK_MARKET_OBJ[x][bm_CREW_THREE] == CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID])
			{
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_PROGRESS] ++;

				TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][4], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);
				
				format(crew_three, sizeof(crew_three), "%s~n~ _", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
				TextDrawSetString(Textdraws[textdraw_GRAFFITI_PLUS][4], crew_three);
				UpdateSizeBarMarket(PLAYER_CREW[playerid][player_crew_INDEX], 9);
			}

			for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
			{
				if (IsPlayerConnected(i))
				{
					if (PLAYER_CREW[i][player_crew_VALID] || PLAYER_WORKS[i][WORK_POLICE])
					{
						TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][0]);

						if (BLACK_MARKET_OBJ[x][bm_CREW_ONE] > 0)
						{
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][1]);
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][5]);
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][6]);
						}

						if (BLACK_MARKET_OBJ[x][bm_CREW_TWO] > 0)
						{
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][3]);
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][7]);
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][8]);
						}

						if (BLACK_MARKET_OBJ[x][bm_CREW_THREE] > 0)
						{
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][4]);
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][9]);
							TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][10]);
						}

						TextDrawShowForPlayer(i, Textdraws[textdraw_GRAFFITI_PLUS][2]);
					}
				}
			}
		}
	}

	ApplyAnimation(playerid, "COP_AMBIENT", "COPBROWSE_NOD", 4.1, true, false, false, false, 0, false);
	format(player_str, sizeof(player_str), "Conquistando...~n~~r~%d %", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_PROGRESS]);
	ShowPlayerMessage(playerid, player_str, 3);
	CheckMarketProgress(playerid);
    return 1;
}

CMD:notificaciones(playerid, params[])
{
	ShowDialog(playerid, DIALOG_USER_NOTIFICATIONS);
	return 1;
}
alias:notificaciones("not")

CMD:canjear(playerid, params[])
{
	ShowDialog(playerid, DIALOG_GIFT);
	return 1;
}
alias:canjear("code", "giftcode")

CheckMarketAttack(playerid)
{
	if (PLAYER_CREW[playerid][player_crew_VALID])
	{
		if (!PLAYER_WORKS[playerid][WORK_POLICE])
		{
			for(new i = 0; i < sizeof BLACK_MARKET_OBJ; i ++)
			{
				if (IsPlayerInRangeOfPoint(playerid, 1.5, BLACK_MARKET_OBJ[i][bm_EXTERIOR_X], BLACK_MARKET_OBJ[i][bm_EXTERIOR_Y], BLACK_MARKET_OBJ[i][bm_EXTERIOR_Z]))
				{
					if (GetPlayerInterior(playerid) == 0)
					{
						if (BLACK_MARKET_OBJ[i][bm_ACTIVATED] == true)
						{
							if (PLAYER_TEMP[playerid][py_IN_MARKET] == true) return 0;

							for(new z = 0, j = GetPlayerPoolSize(); z <= j; z++)
							{
								if (IsPlayerConnected(z))
								{
									if (PLAYER_TEMP[z][py_IN_MARKET])
									{
										ApplyAnimation(z, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 0, true);
										ClearAnimations(z);

										PLAYER_TEMP[z][py_IN_MARKET] = false;
										KillTimer(PLAYER_TEMP[z][py_TIMERS][41]);
									}
								}
							}

							PLAYER_TEMP[playerid][py_IN_MARKET] = true;
							ShowPlayerMessage(playerid, "Conquistando...~n~~r~0 %", 3);
							ApplyAnimation(playerid, "COP_AMBIENT", "COPBROWSE_NOD", 4.1, true, false, false, false, 0, false);
							PLAYER_TEMP[playerid][py_TIMERS][41] = SetTimerEx("UpdateMarketProgress", 1500, 1, "i", playerid);
							return 1;
						}
					}
				}
			}
		}
	}
	return 1;
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

forward GetAmbulanceItem(playerid, vehicleid);
public GetAmbulanceItem(playerid, vehicleid)
{
	#if DEBUG_MODE == 1
		printf("GetAmbulanceItem"); // debug juju
	#endif

	ClearAnimations(playerid);
	PLAYER_MISC[playerid][MISC_BOTIKIN] += 1;
	GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~w~Botiqu�n"), 2000, 5);

	if (vehicleid != INVALID_VEHICLE_ID)
	{
		new doors[4];
		GetVehicleParamsCarDoors(vehicleid, doors[0], doors[1], doors[2], doors[3]);
		SetVehicleParamsCarDoors(vehicleid, doors[0], doors[1], 0, 0);
	}
	return 1;
}

CheckAmbulance(playerid)
{
	if (PLAYER_WORKS[playerid][WORK_MEDIC] && PLAYER_TEMP[playerid][py_WORKING_IN] == WORK_MEDIC && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		new vehicleid = INVALID_VEHICLE_ID;
		vehicleid = GetPlayerCameraTargetVehicle(playerid);

		if (vehicleid == INVALID_VEHICLE_ID) return 0;
		if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] == 416)
		{
			if ((gettime() - PLAYER_TEMP[playerid][py_LIMIT_AMBULANCE]) < 60) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 60 segundos para volver a hacer esto.", 3);

			SetTimerEx("GetAmbulanceItem", 2100, false, "ii", playerid, vehicleid);

			new doors[4];
			GetVehicleParamsCarDoors(vehicleid, doors[0], doors[1], doors[2], doors[3]);
			SetVehicleParamsCarDoors(vehicleid, doors[0], doors[1], 1, 1);

			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 2000, true);

			PLAYER_TEMP[playerid][py_LIMIT_AMBULANCE] = gettime();
		}
	}
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
    	if (PLAYER_TEMP[playerid][py_IN_TUNING_GARAGE] == true) PLAYER_TEMP[playerid][py_IN_TUNING_GARAGE] = false;

        EnterSite(playerid);

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
		                if (CHARACTER_INFO[playerid][ch_CASH] <= 50) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3);

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
        CheckDealerSite(playerid);

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

		if (PLAYER_TEMP[playerid][py_IN_TELE] == true)
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
							if (ROCKS_OBJ[i][r_ACTIVATED] == true)
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
						PLAYER_TEMP[playerid][py_ROCK] = false;
						PLAYER_TEMP[playerid][py_MINING] = false;
						SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
						ApplyAnimation(playerid, "CARRY", "PUTDWN", 4.1, false, false, false, false, 0, false);
						RemovePlayerAttachedObject(playerid, 9);
						PayPlayerMiner(playerid);
						DropPlayerRock(playerid, i);
					}	
				}
			}
		}

		if (PLAYER_TEMP[playerid][py_SELFIE] == true)
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
				if (DROP_ITEMS[i][itm_VALID] == true)
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
								if (GRAFFITIS_OBJ[i][g_ACTIVATED] == true)
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

forward ClosePoliceDoor(i);
public ClosePoliceDoor(i)
{
	#if DEBUG_MODE == 1
		printf("ClosePoliceDoor"); // debug juju
	#endif

	POLICE_DOORS[i][police_door_CLOSED] = true;
	MoveDynamicObject(POLICE_DOORS[i][police_door_OBJECT_ID], POLICE_DOORS[i][police_door_X], POLICE_DOORS[i][police_door_Y], POLICE_DOORS[i][police_door_Z], 2.0, 0.0, 0.0, POLICE_DOORS[i][police_door_RZ]);
	return 1;
}

forward CloseJailDoor(i);
public CloseJailDoor(i)
{
	#if DEBUG_MODE == 1
		printf("CloseJailDoor"); // debug juju
	#endif

	JAIL_DOORS[i][jail_door_CLOSED] = true;
	MoveDynamicObject(JAIL_DOORS[i][jail_door_OBJECT_ID], JAIL_DOORS[i][jail_door_X], JAIL_DOORS[i][jail_door_Y], JAIL_DOORS[i][jail_door_Z], 1.0, 0.0, 0.0, JAIL_DOORS[i][jail_door_RZ]);
	return 1;
}

forward CloseMafiaDoor(i);
public CloseMafiaDoor(i)
{
	#if DEBUG_MODE == 1
		printf("CloseMafiaDoor"); // debug juju
	#endif

	MAFIA_DOORS[i][mafia_door_CLOSED] = true;
	MoveDynamicObject(MAFIA_DOORS[i][mafia_door_OBJECT_ID], MAFIA_DOORS[i][mafia_door_X], MAFIA_DOORS[i][mafia_door_Y], MAFIA_DOORS[i][mafia_door_Z], 2.0, 0.0, 0.0, MAFIA_DOORS[i][mafia_door_RZ]);
	return 1;
}

forward ClosePoliceGarageDoor(index);
public ClosePoliceGarageDoor(index)
{
	#if DEBUG_MODE == 1
		printf("ClosePoliceGarageDoor"); // debug juju
	#endif

	POLICE_GARAGE_DOORS[index][police_gdoor_CLOSING] = true;
	MoveDynamicObject(POLICE_GARAGE_DOORS[index][police_gdoor_OBJECT_ID], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_X], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_Y], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_Z], POLICE_GARAGE_DOORS[index][police_gdoor_MOVE_SPEED], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_RX], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_RY], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_RZ]);
	return 1;
}

forward CloseBarrier(i);
public CloseBarrier(i)
{
	#if DEBUG_MODE == 1
		printf("CloseBarrier"); // debug juju
	#endif

	San_Andreas_Barriers[i][barrier_CLOSING] = true;
	MoveDynamicObject(San_Andreas_Barriers[i][barrier_OBJECT_ID], San_Andreas_Barriers[i][barrier_X], San_Andreas_Barriers[i][barrier_Y], San_Andreas_Barriers[i][barrier_Z] + 0.72967, 0.0065, 0.0, -90.0, San_Andreas_Barriers[i][barrier_ROTATION]);
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
				case ACTOR_TYPE_DEALER:
				{
					new Float:angle, Float:x, Float:y, Float:z;
					GetDynamicActorFacingAngle(actorid, angle);
					GetDynamicActorPos(actorid, x, y, z);

					// In-Front special drop
					if (random(2) == 1)
					{
						GetXYFromAngle(x, y, angle, 1.1);
						CreateDropItem(GetItemObjectByType(22), x, y, z, 0.0, 0.0, 0.0, 0, 0, GetItemNameByType(22), PLAYER_TEMP[playerid][py_NAME], 22, minrand(10, 50));
					}

					// Money drop
					MoneyDrop(minrand(8, 15), x, y, z - 0.9, 0, 0);
					if (random(10) == 3) GivePlayerReputation(playerid);
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
									SetActorChatBubble(ActorTarget, "{E6E6E6}�Ya le he dado todo!", 0xE6E6E600, 5.0, 3000);
									SetActorRespawnTime(ActorTarget, 15000);
									ApplyActorAnimation(ActorTarget, "ped", "handsup", 4.1, 0, 0, 0, 1, 0);
									ShowPlayerNotification(playerid, "La polic�a viene en camino, es mejor que corras.", 3);
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
									SetActorChatBubble(ActorTarget, "{E6E6E6}�No me lastime por favor!\n�Le dar� el dinero!", 0xE6E6E600, 5.0, 3000);
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
			if (floatabs(dis) > 50.0 && CHARACTER_INFO[playerid][ch_POS][2] > -97.0)
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
		if (PLAYER_TEMP[playerid][py_IN_INJURED_ANIMATION] == false)
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
	return 1;
}

SetPlayerPosEx(playerid, Float:x, Float:y, Float:z, Float:angle, interior, world, freeze = 0, addoffset = 0)
{
	PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_UNOCCUPIED_VEHICLE_TP][p_ac_info_IMMUNITY] = gettime() + 5;

	if (addoffset)
	{
		x += (1.5 * floatsin(-angle, degrees));
		y += (1.5 * floatcos(-angle, degrees));
	}

	if (PLAYER_MISC[playerid][MISC_GAMEMODE] == 0)
	{
		CHARACTER_INFO[playerid][ch_POS][0] = x;
		CHARACTER_INFO[playerid][ch_POS][1] = y;
		CHARACTER_INFO[playerid][ch_POS][2] = z;
		CHARACTER_INFO[playerid][ch_ANGLE] = angle;
		CHARACTER_INFO[playerid][ch_INTERIOR] = interior;
		PLAYER_MISC[playerid][MISC_LAST_WORLD] = world;
	}

	SetPlayerPos(playerid, x, y, z);
	SetPlayerFacingAngle(playerid, angle);
	SetPlayerInterior(playerid, interior);
	SetPlayerVirtualWorld(playerid, world);
	SetCameraBehindPlayer(playerid);

	if (freeze)
	{
		Streamer_UpdateEx(playerid, x, y, z, world, interior, -1, -1, 1);
		TogglePlayerControllableEx(playerid, false);
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][3]);
		PLAYER_TEMP[playerid][py_TIMERS][3] = SetTimerEx("TogglePlayerControl", 2000, false, "ib", playerid, true);
		ShowPlayerMessage(playerid, "~r~CARGANDO...~w~~n~Espere por favor", 2);
	}

	if (PLAYER_MISC[playerid][MISC_CONFIG_FP])
	{
		SetFirstPerson(playerid, true);
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

GetNearestHospitalForPlayer(playerid)
{
	new Float:distance = 99999.0,
	   Float:tmp_distance,
	   closest = -1;

    for(new i = 0; i < sizeof Hospital_Spawn_Positions; i++)
    {
	   tmp_distance = GetPlayerDistanceFromPoint(playerid, Hospital_Spawn_Positions[i][0], Hospital_Spawn_Positions[i][1], Hospital_Spawn_Positions[i][2]);
	   if (tmp_distance < distance)
	   {
		  distance = tmp_distance;
		  closest = i;
	   }
    }
	return closest;
}

GetHospitalSpawnPosition(hospital, &Float:x, &Float:y, &Float:z, &Float:angle, &interior, &local_interior, &rp_state)
{
	x = Hospital_Spawn_Positions[hospital][0];
	y = Hospital_Spawn_Positions[hospital][1];
	z = Hospital_Spawn_Positions[hospital][2];
	angle = Hospital_Spawn_Positions[hospital][3];
	interior = 0;
	local_interior = 0;
	rp_state = ROLEPLAY_STATE_NORMAL;
	return 1;
}

UpdateHospitalSizeTextdrawLife(playerid)
{
	new str_text[64];
	format(str_text, sizeof(str_text), "Recuperandote ~r~%d %", PLAYER_TEMP[playerid][py_HOSPITAL_LIFE]);
	ShowPlayerMessage(playerid, str_text, 2);
	return 1;
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
			format(pay_str, sizeof(pay_str), "El coste de los servicios m�dicos ofrecidos es de %s$", number_format_thousand(price));
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

TogglePlayerSpectatingEx(playerid, bool:spectate)
{
	PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_SPECTATE][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_TEMP[playerid][py_PLAYER_SPECTATE] = spectate;
	return TogglePlayerSpectating(playerid, spectate);
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

RegisterNewPlayerToy(playerid, slot)
{
	new DBResult:Result, DB_Query[800];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PLAYER_TOYS`\
		(\
			`ID_USER`, `NAME`, `ATTACHED`, `MODELID`, `BONE`, `OFFSET_X`, `OFFSET_Y`, `OFFSET_Z`, `ROT_X`, `ROT_Y`, `ROT_Z`, `SCALE_X`, `SCALE_Y`, `SCALE_Z`, `COLOR_1`, `COLOR_2`\
		)\
		VALUES\
		(\
			'%d', '%q', '%d', '%d', '%d', '%f', '%f', '%f', '%f', '%f', '%f', '%f', '%f', '%f', '%d', '%d'\
		);\
		SELECT MAX(`ID_TOY`) FROM `PLAYER_TOYS`;\
	",
		ACCOUNT_INFO[playerid][ac_ID],
		PLAYER_TOYS[playerid][slot][player_toy_NAME], PLAYER_TOYS[playerid][slot][player_toy_ATTACHED], PLAYER_TOYS[playerid][slot][player_toy_MODELID], PLAYER_TOYS[playerid][slot][player_toy_BONE],
		PLAYER_TOYS[playerid][slot][player_toy_OFFSET_X], PLAYER_TOYS[playerid][slot][player_toy_OFFSET_Y], PLAYER_TOYS[playerid][slot][player_toy_OFFSET_Z],
		PLAYER_TOYS[playerid][slot][player_toy_ROT_X], PLAYER_TOYS[playerid][slot][player_toy_ROT_Y], PLAYER_TOYS[playerid][slot][player_toy_ROT_Z],
		PLAYER_TOYS[playerid][slot][player_toy_SCALE_X], PLAYER_TOYS[playerid][slot][player_toy_SCALE_Y], PLAYER_TOYS[playerid][slot][player_toy_SCALE_Z],
		PLAYER_TOYS[playerid][slot][player_toy_COLOR_1], PLAYER_TOYS[playerid][slot][player_toy_COLOR_2]
	);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result)) PLAYER_TOYS[playerid][slot][player_toy_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);
	return 1;
}

number_format_thousand(e_number)
{
	new f_string[24], bool:negative;
	format(f_string, sizeof f_string, "%d", e_number);
	if (e_number < 0)
	{
		negative = true;
		strdel(f_string, 0, 1);
	}

	new numbers = strlen(f_string);
	while(numbers > 3)
	{
		numbers -= 3;
		strins(f_string, ".", numbers);
	}

	if (negative) strins(f_string, "Cerrar", 0);
	return f_string;
}

/*number_format_dash(e_number)
{
	new f_string[24], bool:negative;
	format(f_string, sizeof f_string, "%d", e_number);
	if (e_number < 0)
	{
		negative = true;
		strdel(f_string, 0, 1);
	}

	new numbers = strlen(f_string);
	while(numbers > 3)
	{
		numbers -= 3;
		strins(f_string, "Cerrar", numbers);
	}

	if (negative) strins(f_string, "- ", 0);
	return f_string;
}*/

SelectTextDrawEx(playerid, color)
{
	PLAYER_TEMP[playerid][py_SELECT_TEXTDRAW] = true;
	return SelectTextDraw(playerid, color);
}

CancelSelectTextDrawEx(playerid)
{
	PLAYER_TEMP[playerid][py_SELECT_TEXTDRAW] = false;
	return CancelSelectTextDraw(playerid);
}

UpdatePlayerHud(playerid)
{
	if (!PLAYER_TEMP[playerid][py_HUD_TEXTDRAWS]) return 0;

	//barrahambre 1...vacia 12, llena 54
	//barrased 2...vacia 74, llena 120

	new Float:size;

	size = 12.0 + (CHARACTER_INFO[playerid][ch_HUNGRY] * 0.4);
	PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][1], size, 0.000000);

	size = 74.5 + (CHARACTER_INFO[playerid][ch_THIRST] * 0.4);
	PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][3], size, 0.000000);

	if (PLAYER_MISC[playerid][MISC_CONFIG_HUD])
	{
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][1]);
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][3]);
	}
	return 1;
}

#define INTERVAL_HUNGRY_THIRST_DOWN     2 // 2 segundos de timer
#define THIRST_HOURS_STOPPED  9 // 9 horas parado si agua esta a 100 va a 0
#define HUNGRY_HOURS_STOPPED  12 // 12 horas parado si alimentacion esta a 100 va a 0

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
			ShowPlayerNotification(playerid, "Empiezas a tener sed, busca algo para tomar o acabar�s muriendo.", 5);
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
			ShowPlayerNotification(playerid, "Empiezas a tener hambre, busca algo para comer o acabar�s muriendo.", 5);
			SetPlayerDrunkLevel(playerid, 4000);
			PLAYER_TEMP[playerid][py_HUNGRY_MESSAGE] = true;
		}
	}

	UpdatePlayerHud(playerid);
	return 1;
}

SetPlayerHud(playerid)
{
	PLAYER_TEMP[playerid][py_HUD_TEXTDRAWS] = true;
	UpdatePlayerHud(playerid);
	//UpdateReputationTextDraws(playerid);

	if (PLAYER_MISC[playerid][MISC_CONFIG_HUD])
	{
		TextDrawShowForPlayer(playerid, Textdraws[textdraw_HUD][0]);
		TextDrawShowForPlayer(playerid, Textdraws[textdraw_HUD][1]);

		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][0]);
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][1]);
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][2]);
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][3]);
	}

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][5]);
	PLAYER_TEMP[playerid][py_TIMERS][5] = SetTimerEx("HungryThirstDown", INTERVAL_HUNGRY_THIRST_DOWN * 1000, true, "i", playerid);
	return 1;
}

HidePlayerHud(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][5]);
	PLAYER_TEMP[playerid][py_HUD_TEXTDRAWS] = false;

	TextDrawHideForPlayer(playerid, Textdraws[textdraw_HUD][0]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_HUD][1]);

	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][0]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][1]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][2]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][3]);
	return 1;
}

is_open(hour, open, close)
{
	if (open > close)
	{
		if ( ( (hour >= open) && (hour < 24) ) || ( (hour >= 0) && (hour < close) ) )
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	else if (open < close)
	{
		if ((hour >= open) && (hour < close))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	return false;
}

Add_Hungry_Thirst(playerid, Float:hungry, Float:thirst)
{
	CHARACTER_INFO[playerid][ch_HUNGRY] += hungry;
	if (CHARACTER_INFO[playerid][ch_HUNGRY] > 30.0) PLAYER_TEMP[playerid][py_HUNGRY_MESSAGE] = false;
	if (CHARACTER_INFO[playerid][ch_HUNGRY] > 100.0) CHARACTER_INFO[playerid][ch_HUNGRY] = 100.0;

	CHARACTER_INFO[playerid][ch_THIRST] += thirst;
	if (CHARACTER_INFO[playerid][ch_THIRST] > 30.0) PLAYER_TEMP[playerid][py_THIRST_MESSAGE] = false;
	if (CHARACTER_INFO[playerid][ch_THIRST] > 100.0) CHARACTER_INFO[playerid][ch_THIRST] = 100.0;

	UpdatePlayerHud(playerid);
	return 1;
}

GetPlayerIdByBankAccountId(account_id)
{
	for(new i = 0; i != sizeof(BANK_ACCOUNT); i ++)
	{
		if (BANK_ACCOUNT[i][bank_account_ID] == 0) continue;
		if (BANK_ACCOUNT[i][bank_account_ID] == account_id) return i;
	}
	return -1;
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


				if (player_vehicles >= MAX_SU_VEHICLES) return ShowPlayerMessage(playerid, "~r~No puedes comprar m�s veh�culos, el limite es de 6.", 3);
				if (!ACCOUNT_INFO[playerid][ac_SU])
				{
					if (player_vehicles >= MAX_NU_VEHICLES)
					{
						ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP~w~ para tener m�s veh�culos.", 4);
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
							    ShowPlayerMessage(playerid, "~r~No eres el conductor de este cami�n.", 3);
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
							    ShowPlayerMessage(playerid, "~r~No eres el conductor de este cami�n.", 3);
								RemovePlayerFromVehicle(playerid);
								return 1;
							}

							SetPlayerTrashCheckpoint(playerid, vehicleid);
						}
						else
						{
							if (PLAYER_TEMP[playerid][py_TRASH_DRIVER] || PLAYER_TEMP[playerid][py_TRASH_PASSENGER])
							{
						        ShowPlayerMessage(playerid, "~r~Ya est�s trabajando con otro compa�ero.", 3);
								RemovePlayerFromVehicle(playerid);
								return 1;
							}

							PLAYER_TEMP[playerid][py_TRASH_DRIVER] = true;
							PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] = vehicleid;
							TRASH_VEHICLES[vehicleid][trash_vehicle_DRIVER_ID] = playerid;

							if (TRASH_VEHICLES[vehicleid][trash_vehicle_PASSENGER_ID] == INVALID_PLAYER_ID) ShowPlayerMessage(playerid, "~r~Necesitas un compa�ero para empezar a trabajar.", 3);
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

				ShowPlayerMessage(playerid, "Tu mec�nico se ha cancelado porque te has subido a un veh�culo.", 3);
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
						format(str_text, sizeof(str_text), "Necesitas ser %s para manejar este veh�culo.", work_info[ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ][work_info_NAME]);
						ShowPlayerMessage(playerid, str_text, 3);
						RemovePlayerFromVehicle(playerid);
						return 1;
					}

					if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_TRASH)
					{
				        ShowPlayerMessage(playerid, "~r~No est�s de servicio como basurero, ve a vestirte en el puesto de la entrada del vertedero.", 3);
						RemovePlayerFromVehicle(playerid);
						return 1;
					}

					if (TRASH_VEHICLES[vehicleid][trash_vehicle_JOB_STARTED])
					{
						if (TRASH_VEHICLES[vehicleid][trash_vehicle_PASSENGER_ID] != playerid)
						{
						    ShowPlayerMessage(playerid, "~r~No eres el acompa�ante de este cami�n.", 3);
							RemovePlayerFromVehicle(playerid);
							return 1;
						}

						SetPlayerTrashCheckpoint(playerid, vehicleid);
					}
					else
					{
						if (PLAYER_TEMP[playerid][py_TRASH_DRIVER] || PLAYER_TEMP[playerid][py_TRASH_PASSENGER])
						{
						    ShowPlayerMessage(playerid, "~r~Ya est�s trabajando con otro compa�ero.", 3);
							RemovePlayerFromVehicle(playerid);
							return 1;
						}

						PLAYER_TEMP[playerid][py_TRASH_PASSENGER] = true;
						PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] = vehicleid;
						TRASH_VEHICLES[vehicleid][trash_vehicle_PASSENGER_ID] = playerid;

						if (TRASH_VEHICLES[vehicleid][trash_vehicle_DRIVER_ID] == INVALID_PLAYER_ID) ShowPlayerMessage(playerid, "~r~Necesitas un compa�ero para empezar a trabajar.", 3);
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

				ShowPlayerMessage(playerid, "Tu mec�nico se ha cancelado porque te has subido a un veh�culo.", 3);
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
						if (TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_CP] >= TRASH_OBJECTS[ TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_ROUTE] ][trash_route_OBJECTS]) ShowPlayerMessage(playerid, "Sube al cami�n para volver al vertedero y recibir la paga.", 3);
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

							if (distance > 10.0) ShowPlayerMessage(playerid, "Vuelve a subir al cami�n.", 3);
							else
							{
								if (IsPlayerInDynamicCP(playerid, PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT]))
								{
									if (!PLAYER_WORKS[playerid][WORK_TRASH]) return DestroyPlayerTrashCheckpoint(playerid);
									if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_TRASH) return DestroyPlayerTrashCheckpoint(playerid);
									if (!PLAYER_TEMP[playerid][py_TRASH_PASSENGER]) return 1;

									new driver = TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID];
									ShowPlayerMessage(driver, "Espera mientras tu ~y~compa�ero~w~ recoge la basura.", 3);

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
								ShowPlayerNotification(playerid, "Recoge la basura y sube al cami�n para continuar.", 4);
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

			ShowPlayerMessage(playerid, "~r~No puedes robar veh�culos ocupados.", 3);
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
				format(str_text, sizeof(str_text), "Necesitas ser %s para manejar este veh�culo.", work_info[ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ][work_info_NAME]);
				ShowPlayerMessage(playerid, str_text, 3);

				RemovePlayerFromVehicle(playerid);
				SetPlayerPos(playerid, sx, sy, sz);
				return 1;
			}

			if (GLOBAL_VEHICLES[vehicleid][gp_vehicle_vip] && !ACCOUNT_INFO[playerid][ac_SU])
			{
			    ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP ~w~para usar �ste veh�culo.", 3);
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
					format(str_text, sizeof(str_text), "Necesitas estar de servicio de %s para poder conducir �ste veh�culo.", work_info[ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ][work_info_NAME]);
					ShowPlayerNotification(playerid, str_text, 3);

					RemovePlayerFromVehicle(playerid);
					SetPlayerPos(playerid, sx, sy, sz);
					return 1;
				}
			}

			if (WORK_VEHICLES[vehicleid][work_vehicle_EXP] > PLAYER_SKILLS[playerid][ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ])
			{
				new str_text[128];
				format(str_text, sizeof(str_text), "Necesitas m�s experiencia en este trabajo para llevar �ste veh�culo. (%d/%d)", PLAYER_SKILLS[playerid][ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ], WORK_VEHICLES[vehicleid][work_vehicle_EXP]);
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
				format(str_text, sizeof(str_text), "Necesitas ser %s para manejar este veh�culo.", work_info[ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ][work_info_NAME]);
				ShowPlayerMessage(playerid, str_text, 3);

				RemovePlayerFromVehicle(playerid);
				SetPlayerPos(playerid, sx, sy, sz);
				return 1;
			}

			if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_VEHICLES[vehicleid][work_vehicle_WORK])
			{
				SendClientMessageEx(playerid, COLOR_WHITE, "Necesitas estar de servicio como %s para poder conducir este veh�culo.", work_info[ WORK_VEHICLES[vehicleid][work_vehicle_WORK] ][work_info_NAME]);
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
				ShowPlayerMessage(playerid, "Dir�gete a una ~y~boya~w~ para pescar.", 4);
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

				ShowPlayerMessage(playerid, "Dir�gete al ~r~punto~w~ marcado.", 4);
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

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE] != VEHICLE_TYPE_WORK)
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

AddTestVehicle(bool:static_veh, modelid, Float:X, Float:Y, Float:Z, Float:Angle, Color1, Color2)
{
	new vehicle_id = INVALID_VEHICLE_ID;
	if (static_veh) vehicle_id = AddStaticVehicleEx(modelid, X, Y, Z, Angle, Color1, Color2, COLOR_WHITE, false);
	else vehicle_id = CreateVehicle(modelid, X, Y, Z, Angle, Color1, Color2, COLOR_WHITE, false);

	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_VALID] = true;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_TYPE] = VEHICLE_TYPE_TEST;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] = modelid;
	format(GLOBAL_VEHICLES[vehicle_id][gb_vehicle_NUMBER_PLATE], 32, "B1G 1337");
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X] = X;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y] = Y;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z] = Z;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_ANGLE] = Angle;

	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][0] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X];
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][1] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y];
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][2] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z];

	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_HEALTH] = 1000.0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_PANELS] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_DOORS] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_LIGHTS] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_TIRES] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_1] = Color1;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_2] = Color2;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PAINTJOB] = 3; // No paintjob
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MAX_GAS] = VEHICLE_INFO[modelid - 400][vehicle_info_MAX_GAS];
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_GAS] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MAX_GAS];
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_INTERIOR] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_WORLD] = 0;

	SetVehicleToRespawnEx(vehicle_id);
	return vehicle_id;
}

AddPersonalVehicle(playerid, modelid, Float:X, Float:Y, Float:Z, Float:Angle, Color1, Color2, Float:max_gas)
{
	new vehicle_id = INVALID_VEHICLE_ID;
	vehicle_id = CreateVehicle(modelid, X, Y, Z, Angle, Color1, Color2, -1);

	if (vehicle_id == INVALID_VEHICLE_ID) return false;

	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_VALID] = true;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_TYPE] = VEHICLE_TYPE_PERSONAL;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] = modelid;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X] = X;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y] = Y;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z] = Z;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_ANGLE] = Angle;

	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][0] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X];
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][1] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y];
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][2] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z];

	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_HEALTH] = 1000.0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_PANELS] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_DOORS] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_LIGHTS] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_TIRES] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_1] = Color1;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_2] = Color2;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PAINTJOB] = 3; // No paintjob
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MAX_GAS] = max_gas;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_GAS] = max_gas;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_INTERIOR] = 0;
	GLOBAL_VEHICLES[vehicle_id][gb_vehicle_WORLD] = 0;

	PLAYER_VEHICLES[vehicle_id][player_vehicle_VALID] = true;
	PLAYER_VEHICLES[vehicle_id][player_vehicle_OWNER_ID] = ACCOUNT_INFO[playerid][ac_ID];
	RegisterNewPlayerVehicle(playerid, vehicle_id);

	SetVehicleToRespawnEx(vehicle_id);
	return vehicle_id;
}

RegisterNewPlayerVehicle(playerid, vehicleid)
{
	new DBResult:Result, DB_Query[400];
	format
	(
		DB_Query, sizeof DB_Query,
		"\
			INSERT INTO `PLAYER_VEHICLES`\
			(\
				`ID_USER`, `MODELID`, `SPAWN_X`, `SPAWN_Y`, `SPAWN_Z`, `SPAWN_ANGLE`, `COLOR_1`, `COLOR_2`, `GAS`, `MAX_GAS`\
			)\
			VALUES\
			(\
				'%d', '%d', '%f', '%f', '%f', '%f', '%d', '%d', '%f', '%f'\
			);\
			SELECT MAX(`ID`) FROM `PLAYER_VEHICLES`;\
		",
		ACCOUNT_INFO[playerid][ac_ID],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_X],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Y],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Z],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_ANGLE],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_1],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_2],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS],
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS]
	);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		PLAYER_VEHICLES[vehicleid][player_vehicle_ID] = db_get_field_int(Result, 0);
		format(GLOBAL_VEHICLES[vehicleid][gb_vehicle_NUMBER_PLATE], 32, "%04d %c%c%c", PLAYER_VEHICLES[vehicleid][player_vehicle_ID], getRandomLetter(), getRandomLetter(), getRandomLetter());

		DB_Query[0] = EOS;
		format
		(
			DB_Query, sizeof DB_Query,
			"\
				INSERT INTO `PLAYER_VEHICLE_COMPONENTS` (`ID_VEHICLE`) VALUES ('%d');\
				UPDATE `PLAYER_VEHICLES` SET `PLATE` = '%q' WHERE `ID` = '%d';\
			",
				PLAYER_VEHICLES[vehicleid][player_vehicle_ID],
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_NUMBER_PLATE], PLAYER_VEHICLES[vehicleid][player_vehicle_ID]
		);
		db_free_result(db_query(Database, DB_Query));
	}
	db_free_result(Result);

	return 1;
}

LoadPlayerVehicles(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[360];
	format(DB_Query, sizeof(DB_Query), "SELECT `PLAYER_VEHICLES`.*, `PLAYER_VEHICLE_COMPONENTS`.* FROM `PLAYER_VEHICLES`, `PLAYER_VEHICLE_COMPONENTS` WHERE `PLAYER_VEHICLES`.`ID_USER` = '%d' AND `PLAYER_VEHICLE_COMPONENTS`.`ID_VEHICLE` = `PLAYER_VEHICLES`.`ID` ORDER BY `PLAYER_VEHICLES`.`ID` DESC LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], MAX_SU_VEHICLES);
	Result = db_query(Database, DB_Query);

	new total_vehicles;
	for(new i; i < db_num_rows(Result); i++ )
	{
		if (total_vehicles >= MAX_SU_VEHICLES)
		{
			printf("[debug]  MAX_SU_VEHICLES superado al cargar de base de datos.");
			break;
		}

		new modelid, Float:pos[4], color[2];
		modelid = db_get_field_assoc_int(Result, "MODELID");
		pos[0] = db_get_field_assoc_float(Result, "SPAWN_X");
		pos[1] = db_get_field_assoc_float(Result, "SPAWN_Y");
		pos[2] = db_get_field_assoc_float(Result, "SPAWN_Z");
		pos[3] = db_get_field_assoc_float(Result, "SPAWN_ANGLE");
		color[0] = db_get_field_assoc_int(Result, "COLOR_1");
		color[1] = db_get_field_assoc_int(Result, "COLOR_2");

		new vehicle_id = INVALID_VEHICLE_ID;
		vehicle_id = CreateVehicle
		(
			modelid,
			pos[0],
			pos[1],
			pos[2],
			pos[3],
			color[0],
			color[1],
			-1
		);

		if (vehicle_id == INVALID_VEHICLE_ID)
		{
			db_free_result(Result);
			return false;
		}

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_VALID] = true;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_TYPE] = VEHICLE_TYPE_PERSONAL;

		PLAYER_VEHICLES[vehicle_id][player_vehicle_VALID] = true;
		PLAYER_VEHICLES[vehicle_id][player_vehicle_OWNER_ID] = ACCOUNT_INFO[playerid][ac_ID];
		PLAYER_VEHICLES[vehicle_id][player_vehicle_ID] = db_get_field_assoc_int(Result, "ID");
		PLAYER_VEHICLES[vehicle_id][player_vehicle_ACCESSIBLE] = true;

		db_get_field_assoc(Result, "PLATE", GLOBAL_VEHICLES[vehicle_id][gb_vehicle_NUMBER_PLATE], 32);
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] = modelid;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X] = pos[0];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y] = pos[1];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z] = pos[2];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_ANGLE] = pos[3];

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][0] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][1] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][2] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z];

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_HEALTH] = db_get_field_assoc_float(Result, "HEALTH");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_PANELS] = db_get_field_assoc_int(Result, "DAMAGE_PANELS");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_DOORS] = db_get_field_assoc_int(Result, "DAMAGE_DOORS");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_LIGHTS] = db_get_field_assoc_int(Result, "DAMAGE_LIGHTS");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_TIRES] = db_get_field_assoc_int(Result, "DAMAGE_TIRES");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_1] = color[0];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_2] = color[1];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PAINTJOB] = db_get_field_assoc_int(Result, "PAINTJOB");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MAX_GAS] = db_get_field_assoc_float(Result, "MAX_GAS");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_GAS] = db_get_field_assoc_float(Result, "GAS");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PARAMS_DOORS] = db_get_field_assoc_int(Result, "CLOSED");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_STATE] = db_get_field_assoc_int(Result, "STATE");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_INTERIOR] = db_get_field_assoc_int(Result, "INTERIOR");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_WORLD] = db_get_field_assoc_int(Result, "WORLD");

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][0] = db_get_field_assoc_int(Result, "SLOT_0");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][1] = db_get_field_assoc_int(Result, "SLOT_1");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][2] = db_get_field_assoc_int(Result, "SLOT_2");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][3] = db_get_field_assoc_int(Result, "SLOT_3");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][4] = db_get_field_assoc_int(Result, "SLOT_4");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][5] = db_get_field_assoc_int(Result, "SLOT_5");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][6] = db_get_field_assoc_int(Result, "SLOT_6");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][7] = db_get_field_assoc_int(Result, "SLOT_7");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][8] = db_get_field_assoc_int(Result, "SLOT_8");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][9] = db_get_field_assoc_int(Result, "SLOT_9");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][10] = db_get_field_assoc_int(Result, "SLOT_10");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][11] = db_get_field_assoc_int(Result, "SLOT_11");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][12] = db_get_field_assoc_int(Result, "SLOT_12");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COMPONENTS][13] = db_get_field_assoc_int(Result, "SLOT_13");

		if (!ACCOUNT_INFO[playerid][ac_SU])
		{
			if (total_vehicles >= MAX_NU_VEHICLES)
			{
				GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PARAMS_DOORS] = 1;
				PLAYER_VEHICLES[vehicle_id][player_vehicle_ACCESSIBLE] = false;
			}
		}

		new DBResult:Result_vobjects, vobjects;
		format(DB_Query, sizeof(DB_Query), "SELECT * FROM `VEHICLE_OBJECTS` WHERE `ID_VEHICLE` = '%d' LIMIT %d;", PLAYER_VEHICLES[vehicle_id][player_vehicle_ID], MAX_SU_VOBJECTS);
		Result_vobjects = db_query(Database, DB_Query);

		for(new z; z < db_num_rows(Result_vobjects); z++ )
		{
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_VALID] = true;
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_ID] = db_get_field_assoc_int(Result_vobjects, "ID");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_TYPE] = db_get_field_assoc_int(Result_vobjects, "TYPE");
			db_get_field_assoc(Result_vobjects, "NAME", VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_NAME], 32);
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_MODELID] = db_get_field_assoc_int(Result_vobjects, "MODELID");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_OFFSET][0] = db_get_field_assoc_float(Result_vobjects, "OFF_X");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_OFFSET][1] = db_get_field_assoc_float(Result_vobjects, "OFF_Y");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_OFFSET][2] = db_get_field_assoc_float(Result_vobjects, "OFF_Z");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_ROT][0] = db_get_field_assoc_float(Result_vobjects, "ROT_X");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_ROT][1] = db_get_field_assoc_float(Result_vobjects, "ROT_Y");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_ROT][2] = db_get_field_assoc_float(Result_vobjects, "ROT_Z");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_ATTACHED] = db_get_field_assoc_int(Result_vobjects, "ATTACHED");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_COLORS][0] = db_get_field_assoc_int(Result_vobjects, "COLOR_0");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_COLORS][1] = db_get_field_assoc_int(Result_vobjects, "COLOR_1");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_COLORS][2] = db_get_field_assoc_int(Result_vobjects, "COLOR_2");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_COLORS][3] = db_get_field_assoc_int(Result_vobjects, "COLOR_3");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_COLORS][4] = db_get_field_assoc_int(Result_vobjects, "COLOR_4");
			db_get_field_assoc(Result_vobjects, "TEXT", VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_text_TEXT], 32);
			db_get_field_assoc(Result_vobjects, "FONT", VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_text_FONT], 24);
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_text_FONT_SIZE] = db_get_field_assoc_int(Result_vobjects, "FONT_SIZE");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_text_BOLD] = db_get_field_assoc_int(Result_vobjects, "FONT_BOLD");
			VEHICLE_OBJECTS[vehicle_id][vobjects][vobject_text_FONT_COLOR] = db_get_field_assoc_int(Result_vobjects, "FONT_COLOR");
			UpdateVehicleAttachedObject(vehicle_id, vobjects);
			UpdateVehicleMaterialObject(vehicle_id, vobjects);

			vobjects ++;
			db_next_row(Result_vobjects);
		}
		db_free_result(Result_vobjects);

		SetVehicleToRespawnEx(vehicle_id);

		new max_slots = VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_BOOT_SLOTS];
		if (max_slots > 0)
		{
			new DBResult:boot_Result, boot_DB_Query[90], boot_slot;
			format(boot_DB_Query, sizeof(boot_DB_Query), "SELECT * FROM `VEHICLE_BOOT` WHERE `ID_VEHICLE` = '%d' LIMIT %d;", PLAYER_VEHICLES[vehicle_id][player_vehicle_ID], max_slots);
			boot_Result = db_query(Database, boot_DB_Query);
			for(new x; x < db_num_rows(boot_Result); x++ )
			{
				VEHICLE_BOOT[vehicle_id][boot_slot][vehicle_boot_VALID] = true;
				VEHICLE_BOOT[vehicle_id][boot_slot][vehicle_boot_OBJECT_ID] = db_get_field_assoc_int(boot_Result, "ID_OBJECT");
				VEHICLE_BOOT[vehicle_id][boot_slot][vehicle_boot_TYPE] = db_get_field_assoc_int(boot_Result, "TYPE");
				VEHICLE_BOOT[vehicle_id][boot_slot][vehicle_boot_INT] = db_get_field_assoc_int(boot_Result, "INT");
				VEHICLE_BOOT[vehicle_id][boot_slot][vehicle_boot_INT_EXTRA] = db_get_field_assoc_int(boot_Result, "INT_EXTRA");

				if (VEHICLE_BOOT[vehicle_id][boot_slot][vehicle_boot_INT_EXTRA] > 1000)
					VEHICLE_BOOT[vehicle_id][boot_slot][vehicle_boot_INT_EXTRA] = 100;

				boot_slot ++;
				db_next_row(boot_Result);
			}
			db_free_result(boot_Result);
		}

		total_vehicles ++;
		db_next_row(Result);
	}
	db_free_result(Result);
	return 1;
}

SavePlayerVehicles(playerid, destroy = false)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	for(new i = 0; i != MAX_VEHICLES; i ++)
	{
		if (!PLAYER_VEHICLES[i][player_vehicle_VALID]) continue;
		if (PLAYER_VEHICLES[i][player_vehicle_OWNER_ID] != ACCOUNT_INFO[playerid][ac_ID]) continue;

		GetVehiclePos(i, GLOBAL_VEHICLES[i][gb_vehicle_SPAWN_X], GLOBAL_VEHICLES[i][gb_vehicle_SPAWN_Y], GLOBAL_VEHICLES[i][gb_vehicle_SPAWN_Z]);
		GetVehicleZAngle(i, GLOBAL_VEHICLES[i][gb_vehicle_SPAWN_ANGLE]);
		GetVehicleHealth(i, GLOBAL_VEHICLES[i][gb_vehicle_HEALTH]);
		if (GLOBAL_VEHICLES[i][gb_vehicle_HEALTH] > 1000.0) GLOBAL_VEHICLES[i][gb_vehicle_HEALTH] = 1000.0;
		if (GLOBAL_VEHICLES[i][gb_vehicle_HEALTH] < MIN_VEHICLE_HEALTH) GLOBAL_VEHICLES[i][gb_vehicle_HEALTH] = MIN_VEHICLE_HEALTH;
		GetVehicleDamageStatus(i, GLOBAL_VEHICLES[i][gb_vehicle_DAMAGE_PANELS], GLOBAL_VEHICLES[i][gb_vehicle_DAMAGE_DOORS], GLOBAL_VEHICLES[i][gb_vehicle_DAMAGE_LIGHTS], GLOBAL_VEHICLES[i][gb_vehicle_DAMAGE_TIRES]);
    	GLOBAL_VEHICLES[i][gb_vehicle_WORLD] = 0; /*GetVehicleVirtualWorld(i);*/

		new DB_Query[1700];
		format(DB_Query, sizeof DB_Query,
			"\
			UPDATE `PLAYER_VEHICLES` SET \
			`PLATE` = '%q',\
			`MODELID` = '%d',\
			`SPAWN_X` = '%f',\
			`SPAWN_Y` = '%f',\
			`SPAWN_Z` = '%f',\
			`SPAWN_ANGLE` = '%f',\
			`HEALTH` = '%f',\
			`DAMAGE_PANELS` = '%d',\
			`DAMAGE_DOORS` = '%d',\
			`DAMAGE_LIGHTS` = '%d',\
			`DAMAGE_TIRES` = '%d',\
			`COLOR_1` = '%d',\
			`COLOR_2` = '%d',\
			`PAINTJOB` = '%d',\
			`GAS` = '%f',\
			`MAX_GAS` = '%f',\
			`CLOSED` = '%d',\
			`INTERIOR` = '%d',\
			`WORLD` = '%d',\
			`STATE` = '%d' \
			WHERE `ID` = '%d';\
			",
			GLOBAL_VEHICLES[i][gb_vehicle_NUMBER_PLATE],
			GLOBAL_VEHICLES[i][gb_vehicle_MODELID],
			GLOBAL_VEHICLES[i][gb_vehicle_SPAWN_X],
			GLOBAL_VEHICLES[i][gb_vehicle_SPAWN_Y],
			GLOBAL_VEHICLES[i][gb_vehicle_SPAWN_Z],
			GLOBAL_VEHICLES[i][gb_vehicle_SPAWN_ANGLE],
			GLOBAL_VEHICLES[i][gb_vehicle_HEALTH],
			GLOBAL_VEHICLES[i][gb_vehicle_DAMAGE_PANELS],
			GLOBAL_VEHICLES[i][gb_vehicle_DAMAGE_DOORS],
			GLOBAL_VEHICLES[i][gb_vehicle_DAMAGE_LIGHTS],
			GLOBAL_VEHICLES[i][gb_vehicle_DAMAGE_TIRES],
			GLOBAL_VEHICLES[i][gb_vehicle_COLOR_1],
			GLOBAL_VEHICLES[i][gb_vehicle_COLOR_2],
			GLOBAL_VEHICLES[i][gb_vehicle_PAINTJOB],
			GLOBAL_VEHICLES[i][gb_vehicle_GAS],
			GLOBAL_VEHICLES[i][gb_vehicle_MAX_GAS],
			GLOBAL_VEHICLES[i][gb_vehicle_PARAMS_DOORS],
			GLOBAL_VEHICLES[i][gb_vehicle_INTERIOR],
			GLOBAL_VEHICLES[i][gb_vehicle_WORLD],
			GLOBAL_VEHICLES[i][gb_vehicle_STATE],

			PLAYER_VEHICLES[i][player_vehicle_ID]
		);

		printf("%s", DB_Query);
		db_free_result(db_query(Database, DB_Query));

		for(new x = 0; x != MAX_VEHICLE_COMPONENTS; x ++)
		{
			DB_Query[0] = EOS;

			format(DB_Query, sizeof DB_Query,
				"\
				UPDATE `PLAYER_VEHICLE_COMPONENTS` SET \
				`SLOT_0` = '%d',\
				`SLOT_1` = '%d',\
				`SLOT_2` = '%d',\
				`SLOT_3` = '%d',\
				`SLOT_4` = '%d',\
				`SLOT_5` = '%d',\
				`SLOT_6` = '%d',\
				`SLOT_7` = '%d',\
				`SLOT_8` = '%d',\
				`SLOT_9` = '%d',\
				`SLOT_10` = '%d',\
				`SLOT_11` = '%d',\
				`SLOT_12` = '%d',\
				`SLOT_13` = '%d' \
				WHERE `ID_VEHICLE` = '%d';\
				",
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][0],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][1],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][2],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][3],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][4],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][5],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][6],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][7],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][8],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][9],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][10],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][11],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][12],
				GLOBAL_VEHICLES[i][gb_vehicle_COMPONENTS][13],

				PLAYER_VEHICLES[i][player_vehicle_ID]
			);

			printf("%s", DB_Query);
			db_free_result(db_query(Database, DB_Query));
		}

		if (destroy) DestroyVehicleEx(i);
	}
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	#if DEBUG_MODE == 1
		printf("OnVehicleSpawn %d",vehicleid); // debug juju
	#endif

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_TP_IMMUNITY] = gettime() + 5;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWNED] = true;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_ATTACHED_TO] = INVALID_VEHICLE_ID;

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] < MIN_VEHICLE_HEALTH) GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = MIN_VEHICLE_HEALTH;

	if (IsValidDynamic3DTextLabel(GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL]))
	{
		DestroyDynamic3DTextLabel(GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL]);
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL] = Text3D:INVALID_STREAMER_ID;
	}

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE] == VEHICLE_TYPE_WORK)
	{
		if (WORK_VEHICLES[vehicleid][work_vehicle_WORK] == WORK_TRASH)
		{
			if (TRASH_VEHICLES[vehicleid][trash_vehicle_JOB_STARTED])
			{
				CancelTrashWork(TRASH_VEHICLES[vehicleid][trash_vehicle_DRIVER_ID], TRASH_VEHICLES[vehicleid][trash_vehicle_PASSENGER_ID], vehicleid);
			}
		}

		GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] = frandom(GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS] / 3, 2);
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = 1000.0;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_PANELS] = 0;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_DOORS] = 0;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_LIGHTS] = 0;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_TIRES] = 0;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] = INVALID_PLAYER_ID;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_LAST_DRIVER] = INVALID_PLAYER_ID;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_OCCUPIED] = false;

		switch(WORK_VEHICLES[vehicleid][work_vehicle_WORK])
		{
			case WORK_TRUCK: ResetTruckInfo(vehicleid);
			case WORK_TRASH: ResetTrashInfo(vehicleid);
		}
	}

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE] == VEHICLE_TYPE_RENT)
	{
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] = frandom(GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS] / 3, 2);
		RepairVehicleEx(vehicleid);
	}

	SetVehicleNumberPlate(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_NUMBER_PLATE]);
	SetVehicleHealthEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH]);
	UpdateVehicleDamageStatus(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_PANELS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_DOORS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_LIGHTS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_TIRES]);
    ChangeVehicleColor(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_1], GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_2]);
	ChangeVehiclePaintjob(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_PAINTJOB]);
	SetVehiclePosEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_X], GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Y], GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Z]);
	SetVehicleZAngle(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_ANGLE]);
	LinkVehicleToInteriorEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_INTERIOR]);
	SetVehicleVirtualWorldEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_WORLD]);
	AddVehicleComponents(vehicleid);

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_LIGHTS] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ALARM] = 0;
	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_DOORS] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_BONNET] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_BOOT] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_OBJECTIVE] = 0;
	UpdateVehicleParams(vehicleid);
	return 1;
}

UpdateVehicleParams(vehicleid)
{
	return SetVehicleParamsEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE], GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_LIGHTS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ALARM], GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_DOORS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_BONNET], GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_BOOT], GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_OBJECTIVE]);
}

SetVehicleHealthEx(vehicleid, Float:health, forplayerid = INVALID_PLAYER_ID)
{
	if (forplayerid != INVALID_PLAYER_ID) PLAYER_AC_INFO[forplayerid][CHEAT_VEHICLE_HEALTH][p_ac_info_IMMUNITY] = gettime() + 1;

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = health;
	if (health > 375.0) GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;
	SetVehicleHealth(vehicleid, health);
	return 1;
}

RepairVehicleEx(vehicleid, forplayerid = INVALID_PLAYER_ID)
{
	if (forplayerid != INVALID_PLAYER_ID) PLAYER_AC_INFO[forplayerid][CHEAT_VEHICLE_HEALTH][p_ac_info_IMMUNITY] = gettime() + 1;

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_LAST_REPAIR_TIME] = gettime();
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = 1000.0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_PANELS] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_DOORS] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_LIGHTS] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_TIRES] = 0;
	SetVehicleHealthEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH]);
	RepairVehicle(vehicleid);
	return 1;
}

SetVehiclePosEx(vehicleid, Float:x, Float:y, Float:z)
{
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_TP_IMMUNITY] = gettime() + 5;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][0] = x;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][1] = y;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_POS][2] = z;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_ATTACHED_TO] = INVALID_VEHICLE_ID;
	return SetVehiclePos(vehicleid, x, y, z);
}

LinkVehicleToInteriorEx(vehicleid, interior)
{
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_TP_IMMUNITY] = gettime() + 5;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_INTERIOR] = interior;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_ATTACHED_TO] = INVALID_VEHICLE_ID;
	return LinkVehicleToInterior(vehicleid, interior);
}

SetVehicleToRespawnEx(vehicleid)
{
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWNED] = false;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_ATTACHED_TO] = INVALID_VEHICLE_ID;
	return SetVehicleToRespawn(vehicleid);
}

public OnVehicleDeath(vehicleid, killerid)
{
	#if DEBUG_MODE == 1
		printf("OnVehicleDeath",vehicleid,killerid); // debug juju
	#endif

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWNED] = false;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] = INVALID_PLAYER_ID;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_LAST_DRIVER] = INVALID_PLAYER_ID;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_OCCUPIED] = false;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_ATTACHED_TO] = INVALID_VEHICLE_ID;

	if (IsValidDynamic3DTextLabel(GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL]))
	{
		DestroyDynamic3DTextLabel(GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL]);
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL] = Text3D:INVALID_STREAMER_ID;
	}

	switch(GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE])
	{
		case VEHICLE_TYPE_TEST: DestroyVehicleEx(vehicleid);
		case VEHICLE_TYPE_PERSONAL:
		{
			if (VEHICLE_INFO[GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400][vehicle_info_VALID])
			{
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] = VEHICLE_STATE_DAMAGED;
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = MIN_VEHICLE_HEALTH;
			}
			else
			{
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = 1000.0;
			}

			new playerid = GetPlayerIdFromAccountId(PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID]);
			if (playerid != INVALID_PLAYER_ID)
			{
				if (PLAYER_PHONE[playerid][player_phone_VALID])
				{
					new message[64]; format(message, sizeof message, "Veh�culo de sustituci�n entregado en �lt. estacionamiento.");
					RegisterPhoneMessage(38350, PLAYER_PHONE[playerid][player_phone_NUMBER], message);
					if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_ON)
					{
						if ((PLAYER_TEMP[playerid][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[playerid][py_GAME_STATE] == GAME_STATE_DEAD))
						{
							SendClientMessageEx(playerid, COLOR_WHITE, ""COL_GREEN"[Mensaje] "COL_WHITE"%s: %s", convertPhoneNumber(playerid, 38350), message);
							//PlayAudioStreamForPlayer(playerid, "https://www.dl.dropboxusercontent.com/s/do1ntkjac2kb7qn/ntf.mp3");
						}
					}
				}
			}
		}
		default:
		{
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] = frandom(GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS] / 3, 2);
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = 1000.0;
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_PANELS] = 0;
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_DOORS] = 0;
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_LIGHTS] = 0;
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_TIRES] = 0;
		}
	}
    return 1;
}

public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat, Float:new_x, Float:new_y, Float:new_z, Float:vel_x, Float:vel_y, Float:vel_z)
{
	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_VALID])
	{
		if (ac_Info[CHEAT_UNOCCUPIED_VEHICLE_TP][ac_Enabled])
		{
			if (PLAYER_TEMP[playerid][py_KICKED]) return 0;

			new Float:veh_x, Float:veh_y, Float:veh_z, Float:veh_dis;
			GetVehiclePos(vehicleid, veh_x, veh_y, veh_z);
			veh_dis = GetVehicleDistanceFromPoint(vehicleid, new_x, new_y, new_z);

			if (gettime() > GLOBAL_VEHICLES[vehicleid][gb_vehicle_TP_IMMUNITY] && GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWNED])
			{
				if (veh_dis > 20.0 && veh_z > -70.0)
				{
					if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_UNOCCUPIED_VEHICLE_TP][p_ac_info_IMMUNITY])
					{
						if (!ac_Info[CHEAT_UNOCCUPIED_VEHICLE_TP][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_UNOCCUPIED_VEHICLE_TP, veh_dis);
						else
						{
							if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_UNOCCUPIED_VEHICLE_TP][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_UNOCCUPIED_VEHICLE_TP][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_UNOCCUPIED_VEHICLE_TP][p_ac_info_DETECTIONS] = 0;
							else PLAYER_AC_INFO[playerid][CHEAT_UNOCCUPIED_VEHICLE_TP][p_ac_info_DETECTIONS] ++;

							PLAYER_AC_INFO[playerid][CHEAT_UNOCCUPIED_VEHICLE_TP][p_ac_info_LAST_DETECTION] = gettime();
							if (PLAYER_AC_INFO[playerid][CHEAT_UNOCCUPIED_VEHICLE_TP][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_UNOCCUPIED_VEHICLE_TP][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_UNOCCUPIED_VEHICLE_TP, veh_dis);
						}
					}

					SetVehicleVelocity(vehicleid, 0.0, 0.0, 0.0);
					return 0;
				}
			}
		}

		new Float:spawn_distance = GetVehicleDistanceFromPoint(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_X], GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Y], GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Z]);
		switch(GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE])
		{
			case VEHICLE_TYPE_SELL:
			{
				if (spawn_distance > 10.0) SetVehicleToRespawnEx(vehicleid);
			}
			case VEHICLE_TYPE_WORK:
			{
				if (TRASH_VEHICLES[vehicleid][trash_vehicle_JOB_STARTED]) return 1;
				if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] == 453) return 1;
				if (spawn_distance < 25.0)
				{
					if (spawn_distance > 25.0) SetVehicleToRespawnEx(vehicleid);
				}
			}
		}
	}
    return 1;
}

GetPlayerIdFromAccountId(accountid)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (ACCOUNT_INFO[i][ac_ID] == accountid)
			{
				return i;
			}
		}
	}
	return INVALID_PLAYER_ID;
}

#define NECESSARY_TIME_BETWEEN_WORKS 30
CheckWorkSite(playerid)
{
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 0;

	new str_text[128];

	new player_jobs = CountPlayerJobs(playerid);
	if (ACCOUNT_INFO[playerid][ac_SU])
	{
		if (player_jobs >= MAX_SU_WORKS)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, ""COL_WHITE"Actualmente tienes %d trabajos, usa /renunciar para dejar un trabajo.", player_jobs);
			return 1;
		}
	}
	else
	{
		if (player_jobs >= MAX_NU_WORKS)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, ""COL_WHITE"Actualmente tienes %d trabajos, usa /renunciar para dejar un trabajo.", player_jobs);
			ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP~w~ para tener m�s trabajos.", 4);
			return 1;
		}
	}

	for(new i = 0; i != sizeof obtain_work_coords; i ++)
	{
		if (work_info[i][work_info_TYPE] == WORK_TYPE_FAMILY) continue;

		if (GetPlayerInterior(playerid) == obtain_work_coords[i][obtain_work_INTERIOR])
		{
			if (IsPlayerInRangeOfPoint(playerid, 1.0, obtain_work_coords[i][obtain_work_X], obtain_work_coords[i][obtain_work_Y], obtain_work_coords[i][obtain_work_Z]))
			{
				if (work_info[i][work_info_LEVEL] > ACCOUNT_INFO[playerid][ac_LEVEL])
				{
					format(str_text, sizeof(str_text), "~s~Tienes que ser nivel %d para este trabajo.", work_info[i][work_info_LEVEL]);
					ShowPlayerMessage(playerid, str_text, 4);
					return 1;
				}

				if (PLAYER_WORKS[playerid][i])
				{
					format(str_text, sizeof(str_text), "~s~Ya eres %s", work_info[i][work_info_NAME]);
					return ShowPlayerMessage(playerid, str_text, 3);
				}

				DeletePlayerJobs(playerid);

				new DB_Query[256];
				format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_WORKS` SET `SET` = '1' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", ACCOUNT_INFO[playerid][ac_ID], i);
				db_free_result(db_query(Database, DB_Query));

				PLAYER_WORKS[playerid][i] = true;
				PLAYER_TEMP[playerid][py_LAST_GOT_WORK_TIME] = gettime();
				format(str_text, sizeof(str_text), "Felicidades, ahora eres %s.", work_info[i][work_info_NAME]);
				ShowPlayerNotification(playerid, str_text, 3);
			    SavePlayerWorks(playerid);

			    switch(i)
				{
					case WORK_TRUCK:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de camionero", ""COL_WHITE"\
							Ante todo, bienvenido a la empresa.\n\n\
							Tu trabajo ser� transportar productos entre diferentes\n\
							puntos de la ciudad y los pueblos que la rodean.\n\n\
							Trabajamos con todo tipo de productos. Desde peque�os comercios de\n\
							comida o tiendas de ropa o hasta productos industriales.", "Cerrar", "");
						return 1;
					}
					case WORK_MECHANIC:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de mec�nico", ""COL_WHITE"Bienvenido\n\
							Aqu� nos encargamos de arreglar los veh�culos de la gente y modificarlos, para eso necesitas\n\
							tener piezas, puedes comprarlas en el almac�n de atr�s.\n\n\
							Para ponerte en servicio presiona H en este mismo lugar.", "Cerrar", "");
						return 1;
					}
					case WORK_HARVESTER:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de cosechador", ""COL_WHITE"\
							Bienvenido al mundo agr�cola.\n\n\
							Aqu� nos encargamos de recolectar todos los cultivos de la\n\
							temporada, usando nuestras cosechadoras, s�bete a alguna\n\
							para comenzar a trabajar.", "Cerrar", "");
						return 1;
					}
					case WORK_TRASH:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de basurero", ""COL_WHITE"\
							En este trabajo deber�s andar en un cami�n de basura\n\
							para limpiar la ciudad. Puedes ser tanto el conductor\n\
							del cami�n, o como un recolector de basura.", "Cerrar", "");
						return 1;
					}
					case WORK_FARMER:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de granjero", ""COL_WHITE"Bienvenido al campo, compadre.\nNosotros no encargamos de cultivar, solamente plantas y ya\n\
							Puedes hacerlo en cualquier lugar, donde quieras pero que no se te vaya el tiempo o\n\
							tu planta se va a expirar.", "Cerrar", "");
						return 1;
					}
					case WORK_MINER:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de minero", ""COL_WHITE"\
							Ante todo, bienvenido a la empresa.\n\n\
							Tu principal funci�n ser� la b�squeda y extracci�n de minerales.\n\n\
							Encontramos todo tipo de minerales. Desde diamantes, hasta un simple carb�n.\n\
							Comenzar�s buscando unos dos minerales, el carb�n y el hierro.\n\
							Una vez te hayas familiarizado con el labor, te asignar�n una mina\n\
							m�s rica en minerales. Eso quieres decir, un mejor pago.", "Cerrar", "");
						return 1;
					}
					case WORK_FISHER:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de pescador", ""COL_WHITE"\
							Ante todo, bienvenido a las aguas camarada.\n\n\
							Aqu� nos encargamos de administrar los pescados\n\
							mas frescos de todo San Andreas. S�bete a un barco\n\
							y dir�gete a una boya, pero recuerda que necesitas\n\
							una ca�a de pescar.", "Cerrar", "");
						return 1;
					}
					case WORK_MEDIC:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de m�dico", ""COL_WHITE"\
							Bienvenido al equipo de param�dicos.\n\n\
							Sube a una ambulancia y ve a salvar gente herida\n\
							usando los botiquines que hay atr�s de la ambula-\n\
							ncia, para sacarlos presiona la tecla Y. Ponte de\n\
							servicio en la sala de atr�s.", "Cerrar", "");
						return 1;
					}
					case WORK_BOX:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de boxeador", ""COL_WHITE"\
							Bienvenido al ring.\n\n\
							Entra al ring y pelea hasta que alguien\n\
							apueste por ti, si matas a alguien con\n\
							apuestas te llevas su dinero.", "Cerrar", "");
						return 1;
					}
					case WORK_SOCCER:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de futbolista", ""COL_WHITE"\
							Bienvenido a la cancha.\n\n\
							Teclas:\n\
							* Agarrar pelota: Click Izq.\n\
							* Patear en globo: ALT\n\
							* Patear derecho: Click Der.", "Cerrar", "");
						return 1;
					}
					case WORK_WOODCUTTER:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de le�ador", ""COL_WHITE"\
							Bienvenido al aserradero.\n\n\
							Ponte en servicio y agarra tu carrito\n\
							para ir a buscar arboles (ALT + CLICK)\n\
							Cuando llenes tu carrito con troncos\n\
							vuelves para procesarlos.", "Cerrar", "");
						return 1;
					}
				}
			}
		}
	}
	return 1;
}

CMD:dimitir(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	new str_text[128];
	new player_jobs = CountPlayerJobs(playerid);

	if (!player_jobs) return ShowPlayerMessage(playerid, "~r~No tienes un trabajo.", 2);

	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No est�s depie.", 3);

	new work;
	if (sscanf(params, "d", work))
	{
		new works[32 * sizeof(work_info)], line_str[32], count;
		for(new i = 1; i != sizeof(work_info); i ++)
		{
			if (PLAYER_WORKS[playerid][i])
			{
				if (count > 0) strcat(works, ", ");

				format(line_str, sizeof line_str, "%s (%d)", work_info[i][work_info_NAME], i);
				strcat(works, line_str);

				count ++;
			}
		}

		SendClientMessageEx(playerid, COLOR_WHITE, "Trabajos: %s", works);
		SendClientMessage(playerid, COLOR_WHITE, "Syntax: /renunciar <Num. del trabajo>");
		return 1;
	}

	if (work < 1 || work >= sizeof work_info) return SendClientMessage(playerid, COLOR_WHITE, "El trabajo no es v�lido.");

	if (!PLAYER_WORKS[playerid][work])
	{
		format(str_text, sizeof(str_text), "No eres %s.", work_info[work][work_info_NAME]);
		return ShowPlayerNotification(playerid, str_text, 3);
	}

	if (PLAYER_TEMP[playerid][py_WORKING_IN] == work) return ShowPlayerMessage(playerid, "~r~Est�s de servicio en ese trabajo, deja de trabajar para renunciar.", 3);

	new DB_Query[256];
	format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_WORKS` SET `SET` = '0' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", ACCOUNT_INFO[playerid][ac_ID], work);
	db_free_result(db_query(Database, DB_Query));

	if (work == WORK_POLICE)
	{
		format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_SKILLS` SET `TOTAL` = '0' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", ACCOUNT_INFO[playerid][ac_ID], work);
		db_free_result(db_query(Database, DB_Query));

		PLAYER_SKILLS[playerid][work] = 0;
	}

	format(str_text, sizeof(str_text), "Has abandonado tu trabajo de %s.", work_info[work][work_info_NAME]);
	ShowPlayerNotification(playerid, str_text, 3);
	PLAYER_WORKS[playerid][work] = false;
	return 1;
}
alias:dimitir("renunciar")

SetPlayerVehiclePark(playerid)
{
	new vehicleid = INVALID_VEHICLE_ID;
	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER || GetPlayerState(playerid) == PLAYER_STATE_PASSENGER) vehicleid = GetPlayerVehicleID(playerid);

	if (vehicleid == INVALID_VEHICLE_ID) return ShowPlayerMessage(playerid, "~r~No est�s en tu veh�culo para aparcarlo.", 2);
	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Este no es t� veh�culo.", 2);
	if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~Este no es t� veh�culo.", 2);

	new Float:x, Float:y, Float:z, Float:angle;
	GetVehiclePos(vehicleid, x, y, z);
	GetVehicleZAngle(vehicleid, angle);

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_X] = x;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Y] = y;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Z] = z;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_ANGLE] = angle;

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_LAST_CLOSED_TIME] = gettime();
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_LIGHTS] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_DOORS] = 1;
	UpdateVehicleParams(vehicleid);
	ShowPlayerNotification(playerid, "Has estacionado tu veh�culo, cuando sea destruido o spawneado volver� a aparecer aqu�.", 5);
	return 1;
}

forward StartVehicleEngine(playerid, vehicleid);
public StartVehicleEngine(playerid, vehicleid)
{
	#if DEBUG_MODE == 1
		printf("StartVehicleEngine"); // debug juju
	#endif

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] == VEHICLE_STATE_DAMAGED) return ShowPlayerMessage(playerid, "~r~Motor da�ado.", 1);
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
		
		if (PLAYER_TEMP[playerid][py_TUTORIAL_STEP] == 5) PlayAudioStreamForPlayer(playerid, "http://tmp6.hyaxe.com:20100/tutorial_5.mp3");
		PLAYER_TEMP[playerid][py_TUTORIAL_STEP] = 6;

		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
		PLAYER_TEMP[playerid][py_TIMERS][18] = SetTimerEx("ContinuePlayerIntro", 10000, false, "id", playerid, 3);
	}

	ShowPlayerMessage(playerid, "~g~Encendiendo...", 2);
	SetPlayerChatBubble(playerid, "\n\n\n\n* Ha encendido su veh�culo.\n\n\n", 0xffcb90FF, 20.0, 5000);
	return 1;
}

CMD:motor(playerid, params[])
{
	SetEngineAction(playerid);
	return 1;
}

AddVehicleComponents(vehicleid)
{
	for(new i = 0; i != MAX_VEHICLE_COMPONENTS; i ++)
	{
		RemoveVehicleComponent(vehicleid, i);

		if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_COMPONENTS][i]) continue;
		AddVehicleComponent(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_COMPONENTS][i]);
	}
	return 1;
}

public OnEnterExitModShop(playerid, enterexit, interiorid)
{
	#if DEBUG_MODE == 1
		printf("OnEnterExitModShop",playerid); // debug juju
    #endif

    if (enterexit) // Entra
    {
		ShowPlayerMessage(playerid, "~r~Solo puedes tunear veh�culos en el mec�nico, b�scalo con el /GPS.", 2);
		//SendClientMessage(playerid, COLOR_WHITE, "{ffff35}[ATENCION] "COL_WHITE"Si reaflizas alguna modificaci�n al veh�culo en este garaje ser�s expulsado.");
    }
	else
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if (vehicleid != INVALID_VEHICLE_ID)
		{
			ChangeVehicleColor(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_1], GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_2]);
			ChangeVehiclePaintjob(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_PAINTJOB]);
			AddVehicleComponents(vehicleid);
		}
	}
    return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	#if DEBUG_MODE == 1
		printf("OnVehicleMod %d %d %d",playerid,vehicleid,componentid); // debug juju
	#endif

	if (ac_Info[CHEAT_CAR_MOD][ac_Enabled])
	{
		if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_IMMUNITY])
		{
			if (!ac_Info[CHEAT_CAR_MOD][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_CAR_MOD);
			else
			{
				if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_CAR_MOD][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_DETECTIONS] = 0;
				else PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_DETECTIONS] ++;

				PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_LAST_DETECTION] = gettime();
				if (PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_CAR_MOD][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_CAR_MOD);
			}
		}
	}
    return 0;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	#if DEBUG_MODE == 1
		printf("OnVehiclePaintjob %d %d %d",playerid,vehicleid,paintjobid); // debug juju
	#endif

	if (ac_Info[CHEAT_CAR_MOD][ac_Enabled])
	{
		if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_IMMUNITY])
		{
			if (!(-1 < paintjobid < 3) && paintjobid != 255)
			{
				if (!ac_Info[CHEAT_CAR_MOD][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_CAR_MOD);
				else
				{
					if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_CAR_MOD][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_DETECTIONS] = 0;
					else PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_DETECTIONS] ++;

					PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_LAST_DETECTION] = gettime();
					if (PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_CAR_MOD][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_CAR_MOD);
				}
			}
		}
	}
	return 1;
}

DestroyVehicleEx(vehicleid)
{
	if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_VALID]) return false;

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] != INVALID_PLAYER_ID)
	{
		PLAYER_AC_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] ][CHEAT_VEHICLE_HEALTH][p_ac_info_IMMUNITY] = gettime() + 1;
		PLAYER_AC_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] ][CHEAT_STATE_SPAMMER][p_ac_info_IMMUNITY] = gettime() + 1;
	}

	if (DestroyVehicle(vehicleid))
	{
		if (IsValidDynamic3DTextLabel(GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL]))
		{
			DestroyDynamic3DTextLabel(GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL]);
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL] = Text3D:INVALID_STREAMER_ID;
		}

		new temp_GLOBAL_VEHICLES[Global_Vehicles_Info]; GLOBAL_VEHICLES[vehicleid] = temp_GLOBAL_VEHICLES;
		new temp_PLAYER_VEHICLES[Player_Vehicles_Info]; PLAYER_VEHICLES[vehicleid] = temp_PLAYER_VEHICLES;
		new temp_SELL_VEHICLES[SELL_VEHICLES_Enum]; SELL_VEHICLES[vehicleid] = temp_SELL_VEHICLES;

		new temp_VEHICLE_BOOT[enum_VEHICLE_BOOT];
		for(new i = 0; i != MAX_BOOT_SLOTS; i ++) VEHICLE_BOOT[vehicleid][i] = temp_VEHICLE_BOOT;

		new temp_VEHICLE_OBJECTS[e_VEHICLE_OBJECTS];
		for(new i = 0; i != MAX_SU_VOBJECTS; i ++)
		{
			if (VEHICLE_OBJECTS[vehicleid][i][vobject_OBJECT_ID] != INVALID_STREAMER_ID) DestroyDynamicObject(VEHICLE_OBJECTS[vehicleid][i][vobject_OBJECT_ID]);
			VEHICLE_OBJECTS[vehicleid][i] = temp_VEHICLE_OBJECTS;
		}

		return true;
	}
	return false;
}

getRandomLetter()
{
    return 65 + random(25);
}

ShowPlayerSpeedoMeter(playerid)
{
	if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 0;
	new vehicleid = GetPlayerVehicleID(playerid), modelid = GetVehicleModel(vehicleid);
	if (!VEHICLE_INFO[modelid - 400][vehicle_info_VALID]) return 0;
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][8]);

	new td_str[64];
	format(td_str, sizeof td_str, "%.1f", GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS]);
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][11], td_str);

	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][0]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][2]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][3]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][4]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][5]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][6]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][7]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][8]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][9]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][10]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][11]);

	PLAYER_TEMP[playerid][py_SPEEDOMETER] = true;
	PLAYER_TEMP[playerid][py_FUEL_DOWN_TIME] = gettime();
	PLAYER_TEMP[playerid][py_TIMERS][8] = SetTimerEx("UpdatePlayerSpeedo", 50, true, "iif", playerid, vehicleid, VEHICLE_INFO[modelid - 400][vehicle_info_MAX_VEL]);
	return 1;
}

HidePlayerSpeedoMeter(playerid)
{
	PLAYER_TEMP[playerid][py_SPEEDOMETER] = false;
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][8]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][0]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][1]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][2]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][3]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][4]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][5]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][6]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][7]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][8]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][9]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][10]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_SPEEDO_METER][11]);
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
			ShowPlayerMessage(playerid, "~r~Motor da�ado.", 2);
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

			    ShowPlayerMessage(playerid, "~r~El veh�culo se ha quedado sin gasolina", 2);
			}
		}
		PLAYER_TEMP[playerid][py_FUEL_DOWN_TIME] = gettime();
	}

	if (PLAYER_TEMP[playerid][py_PLAYER_IN_PHONE] == true) return HidePlayerSpeedoMeter(playerid);

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

Float:GetVehicleSpeed(vehicleid)
{
    new Float:vx, Float:vy, Float:vz;
    GetVehicleVelocity(vehicleid, vx, vy, vz);
	new Float:vel = floatmul(floatsqroot(floatadd(floatadd(floatpower(vx, 2), floatpower(vy, 2)),  floatpower(vz, 2))), 181.5);
	return vel;
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
					"COL_WHITE"Propiedad {5DE141}#%d "COL_WHITE"est� en venta\n\n\
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
					"COL_WHITE"Propiedad {5DE141}#%d "COL_WHITE"est� en venta\n\n\
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
					"COL_WHITE"Propiedad {5DE141}#%d "COL_WHITE"est� en venta\n\n\
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
					"COL_WHITE"Propiedad {5DE141}#%d "COL_WHITE"est� en venta\n\n\
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

	SendClientMessageEx(playerid, COLOR_WHITE, "PROPIEDAD %d A�ADIDA.", PROPERTY_INFO[slot][property_ID]);
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

/*SpaceFix(text[])
{
	new str[100 + 1];
	format(str, sizeof str, "%s", text);

    for(new i = 0; i < strlen(str); i++)
	{
		if (str[i] == ' ') str[i] = '%20';
	}
	return str;
}*/

GivePlayerDrunkLevel(playerid, ammount)
{
	return SetPlayerDrunkLevel(playerid, GetPlayerDrunkLevel(playerid) + ammount);
}

/*RotateDynamicObject(objectid, Float:rotX, Float:rotY, Float:rotZ, Float:Speed)
{

		Rotation Speeds:
		0.01 - Very very slow speed
		1.00 - Normal speed
		5.00 - Fast speed

	new Float:X, Float:Y, Float:Z;
	new Float:SpeedConverted = floatdiv(floatmul(Speed, 0.01), 2);

	if (IsDynamicObjectMoving(objectid)) StopDynamicObject(objectid);
	GetDynamicObjectPos(objectid, X, Y, Z);
	SetDynamicObjectPos(objectid, X, Y, Z + 0.01);
	MoveDynamicObject(objectid, X, Y, Z, SpeedConverted, rotX, rotY, rotZ);
	return 1;
}*/

Float:frandom(Float:max, Float:min, dp)
{
	new
		Float:mul = floatpower(10.0, dp),
		imin = floatround(min * mul),
		imax = floatround(max * mul);
	return float(random(imax - imin) + imin) / mul;
}

SetMechanicPlayerMarkers(playerid)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
			{
				if (PLAYER_TEMP[i][py_WANT_MECHANIC])
				{
					SetPlayerMarkerForPlayer(playerid, i, 0xf4c242FF);
				}
			}
		}
	}
	return 1;
}

SetMedicPlayerMarkers(playerid)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_WANT_MEDIC])
			{
				SetPlayerMarkerForPlayer(playerid, i, COLOR_GREEN);
			}
		}
	}
	return 1;
}

SendAlertToMedics(playerid)
{
	if ((gettime() - PLAYER_TEMP[playerid][py_LIMIT_AMBULANCE]) < 60) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 60 segundos para volver a hacer esto.", 3);

	new
		Float:x, Float:y, Float:z,
		str_text[128],
		total_medics = 0
	;

	GetPlayerPos(playerid, x, y, z);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (i == playerid) continue;
			if (!PLAYER_WORKS[i][WORK_MEDIC]) continue;
			if (PLAYER_TEMP[i][py_WORKING_IN] != WORK_MEDIC) continue;

			SetPlayerMarkerForPlayer(i, playerid, COLOR_GREEN);
			format(str_text, sizeof(str_text), "~g~%s~w~ esta solicitando ayuda (%.2f Km).", PLAYER_TEMP[playerid][py_NAME], (GetPlayerDistanceFromPoint(i, x, y, z) * 0.01));
			ShowPlayerNotification(i, str_text, 4);

			total_medics ++;
		}
	}

	format(str_text, sizeof(str_text), "Has solicitado una ambulancia~n~M�dicos activos: ~y~%d", total_medics);
	ShowPlayerMessage(playerid, str_text, 5);
	PLAYER_TEMP[playerid][py_WANT_MEDIC] = true;
	PLAYER_TEMP[playerid][py_LIMIT_AMBULANCE] = gettime();
	return 1;
}

SendAlertToMechanic(playerid)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
			{
				if (i == playerid) continue;
				if (!PLAYER_WORKS[i][WORK_MECHANIC]) continue;
				if (PLAYER_TEMP[i][py_WORKING_IN] != WORK_MECHANIC) continue;

				SetPlayerMarkerForPlayer(i, playerid, 0xf4c242FF);
				ShowPlayerMessage(i, "~y~Hay un nuevo cliente solicitando un mec�nico.", 2);
				SendClientMessageEx(i, COLOR_WHITE, "Hay un nuevo cliente solicitando un mec�nico, distancia: "COL_RED"%.2f Km.", (GetPlayerDistanceFromPoint(i, x, y, z) * 0.01));
			}
		}
	}
	return 1;
}

DisablePlayerMechanicMark(playerid)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
			{
				if (i == playerid) continue;
				if (!PLAYER_WORKS[i][WORK_MECHANIC]) continue;
				if (PLAYER_TEMP[i][py_WORKING_IN] != WORK_MECHANIC) continue;

				SetPlayerMarkerForPlayer(i, playerid, PLAYER_COLOR);
			}
		}
	}
	return 1;
}

DisablePlayerMedicMark(playerid)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (i == playerid) continue;
			if (!PLAYER_WORKS[i][WORK_MEDIC]) continue;
			if (PLAYER_TEMP[i][py_WORKING_IN] != WORK_MEDIC) continue;

			SetPlayerMarkerForPlayer(i, playerid, PLAYER_COLOR);
		}
	}

	PLAYER_TEMP[playerid][py_WANT_MEDIC] = false;
	return 1;
}

SetNormalPlayerMarkers(playerid)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			SetPlayerMarkerForPlayer(playerid, i, PLAYER_TEMP[i][py_PLAYER_COLOR]);
		}
	}
	return 1;
}

SavePlayerWorks(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DB_Query[150];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_WORKS` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	for(new i = 1; i != sizeof(PLAYER_WORKS[]); i ++)
	{
		DB_Query[0] = EOS;
		format(DB_Query, sizeof DB_Query, "INSERT INTO `PLAYER_WORKS` (`ID_USER`, `ID_WORK`, `SET`) VALUES ('%d', '%d', '%d');", ACCOUNT_INFO[playerid][ac_ID], i, PLAYER_WORKS[playerid][i]);
		db_free_result(db_query(Database, DB_Query));
	}
	return 1;
}

LoadPlayerCrewInfo(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[90], bool:found;
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_CREW` WHERE `ID_USER` = '%d' LIMIT 1;", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		PLAYER_CREW[playerid][player_crew_VALID] = true;
		PLAYER_CREW[playerid][player_crew_ID] = db_get_field_assoc_int(Result, "ID_CREW");
		PLAYER_CREW[playerid][player_crew_RANK] = db_get_field_assoc_int(Result, "RANK");

		for(new i = 0; i != MAX_CREWS; i ++)
		{
			if (!CREW_INFO[i][crew_VALID]) continue;

			if (CREW_INFO[i][crew_ID] == PLAYER_CREW[playerid][player_crew_ID])
			{
				PLAYER_CREW[playerid][player_crew_INDEX] = i;
				CREW_INFO[i][crew_ONLINE_MEMBERS] ++;
				found = true;
				break;
			}
		}

		if (!found)
		{
			PLAYER_CREW[playerid][player_crew_VALID] = false;
			PLAYER_CREW[playerid][player_crew_ID] = 0;
			PLAYER_CREW[playerid][player_crew_RANK] = 0;
			PLAYER_CREW[playerid][player_crew_INDEX] = 0;
			ShowPlayerMessage(playerid, "~r~La banda a la que pertenec�as ya no existe.", 3);

			format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_CREW` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
			db_free_result(db_query(Database, DB_Query));
		}
	}
	else PLAYER_CREW[playerid][player_crew_VALID] = false;
	db_free_result(Result);
	return 1;
}

LoadPlayerWorks(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[90], player_works, bool:affected;
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_WORKS` WHERE `ID_USER` = '%d' LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], sizeof(PLAYER_WORKS[]));
	Result = db_query(Database, DB_Query);

	for(new i; i < db_num_rows(Result); i++ )
	{
		new work = db_get_field_assoc_int(Result, "ID_WORK");
		PLAYER_WORKS[playerid][work] = db_get_field_assoc_int(Result, "SET");
		if (PLAYER_WORKS[playerid][work])
		{
			if (!ACCOUNT_INFO[playerid][ac_SU])
			{
				if (player_works >= MAX_NU_WORKS)
				{
					affected = true;
					PLAYER_WORKS[playerid][work] = false;
					break;
				}
			}
			player_works ++;
		}

		db_next_row(Result);
	}
	db_free_result(Result);

	if (affected) SavePlayerWorks(playerid);
	return 1;
}

SavePlayerSkills(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DB_Query[150];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_SKILLS` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	for(new i = 1; i != sizeof(PLAYER_SKILLS[]); i ++)
	{
		DB_Query[0] = EOS;
		format(DB_Query, sizeof DB_Query, "INSERT INTO `PLAYER_SKILLS` (`ID_USER`, `ID_WORK`, `TOTAL`) VALUES ('%d', '%d', '%d');", ACCOUNT_INFO[playerid][ac_ID], i, PLAYER_SKILLS[playerid][i]);
		db_free_result(db_query(Database, DB_Query));
	}
	return 1;
}

LoadPlayerSkills(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[90];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_SKILLS` WHERE `ID_USER` = '%d' LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], sizeof(PLAYER_SKILLS[]));
	Result = db_query(Database, DB_Query);

	for(new i; i < db_num_rows(Result); i++ )
	{
		new work = db_get_field_assoc_int(Result, "ID_WORK");
		PLAYER_SKILLS[playerid][work] = db_get_field_assoc_int(Result, "TOTAL");
		db_next_row(Result);
	}
	db_free_result(Result);
	return 1;
}

SavePlayerMisc(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DB_Query[150];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_MISC` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	safe_db_query("BEGIN TRANSACTION");
	for(new i = 0; i != sizeof(PLAYER_MISC[]); i ++)
	{
		DB_Query[0] = EOS;
		format(DB_Query, sizeof DB_Query, "INSERT INTO `PLAYER_MISC` (`ID_USER`, `ID`, `EXTRA`) VALUES ('%d', '%d', '%d');", ACCOUNT_INFO[playerid][ac_ID], i, PLAYER_MISC[playerid][E_MISC_DATA:i]);
		db_free_result(db_query(Database, DB_Query));
	}
	safe_db_query("END TRANSACTION");
	return 1;
}

LoadPlayerMisc(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[90];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_MISC` WHERE `ID_USER` = '%d' LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], sizeof(PLAYER_MISC[]));
	Result = db_query(Database, DB_Query);

	for(new i; i < db_num_rows(Result); i++ )
	{
		new index = db_get_field_assoc_int(Result, "ID");
		PLAYER_MISC[playerid][E_MISC_DATA:index] = db_get_field_assoc_int(Result, "EXTRA");
		db_next_row(Result);
	}
	db_free_result(Result);
	return 1;
}

ResetTruckInfo(vehicleid)
{
	new tmp_TRUCK_VEHICLE[TRUCK_VEHICLE_Info]; TRUCK_VEHICLE[vehicleid] = tmp_TRUCK_VEHICLE;
	return 1;
}

ResetTrashInfo(vehicleid)
{
	new tmp_TRASH_VEHICLES[TRASH_VEHICLES_INFO]; TRASH_VEHICLES[vehicleid] = tmp_TRASH_VEHICLES;

	TRASH_VEHICLES[vehicleid][trash_vehicle_DRIVER_ID] = INVALID_PLAYER_ID;
	TRASH_VEHICLES[vehicleid][trash_vehicle_PASSENGER_ID] = INVALID_PLAYER_ID;
	return 1;
}

forward TruckLoadUp(playerid, vehicleid);
public TruckLoadUp(playerid, vehicleid)
{
	#if DEBUG_MODE == 1
		printf("TruckLoadUp"); // debug juju
	#endif

	if (PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] < 100)
	{
		PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] += 10;
		if (PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] > 100) PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] = 100;
		
		UpdatePlayerLoadingTruckSize(playerid);
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][9]);
		PLAYER_TEMP[playerid][py_TIMERS][9] = SetTimerEx("TruckLoadUp", 1000, false, "ii", playerid, vehicleid);
		return 1;
	}

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 1;
	UpdateVehicleParams(vehicleid);

	TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADED] = true;
	TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADING] = false;
	TRUCK_VEHICLE[vehicleid][truck_vehicle_DELIVERED] = false;

	ShowPlayerMessage(playerid, "Ve a entregar la mercanc�a", 7);
	SetPlayerTruckCheckpoint(playerid, vehicleid);
	return 1;
}

forward TruckUnLoadUp(playerid, vehicleid);
public TruckUnLoadUp(playerid, vehicleid)
{
	#if DEBUG_MODE == 1
		printf("TruckUnLoadUp"); // debug juju
	#endif

	if (PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] < 100)
	{
		PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] += 10;
		if (PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] > 100) PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] = 100;
		
		UpdatePlayerLoadingTruckSize(playerid);
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][9]);
		PLAYER_TEMP[playerid][py_TIMERS][9] = SetTimerEx("TruckUnLoadUp", 1000, false, "ii", playerid, vehicleid);
		return 1;
	}

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 1;
	UpdateVehicleParams(vehicleid);

	TRUCK_VEHICLE[vehicleid][truck_vehicle_UNLOADING] = false;
	TRUCK_VEHICLE[vehicleid][truck_vehicle_DELIVERED] = true;

	ShowPlayerMessage(playerid, "Vuelve a la ~y~estaci�n", 7);
	SetPlayerTruckCheckpoint(playerid, vehicleid);
	return 1;
}

SetPlayerTruckCheckpoint(playerid, vehicleid)
{
	if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]))
	{
		DestroyDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]);
		PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT] = INVALID_STREAMER_ID;
    	CancelTracing(playerid);
	}

	if (TRUCK_VEHICLE[vehicleid][truck_vehicle_DELIVERED])
	{
		PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT] = CreateDynamicCP(2509.596923, -2628.955078, 13.645235, 5.0, 0, 0, playerid, 9999999999.0);
		StartTracing(playerid, 2509.596923, -2628.955078, 13.645235);

		new info[1];
		info[0] = CHECKPOINT_TYPE_FINISH_TRUCK;
		Streamer_SetArrayData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT], E_STREAMER_EXTRA_ID, info);
	}
	else
	{

		PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT] = CreateDynamicCP(Truck_Contents[ TRUCK_VEHICLE[vehicleid][truck_vehicle_POINT] ][truck_content_X], Truck_Contents[ TRUCK_VEHICLE[vehicleid][truck_vehicle_POINT] ][truck_content_Y], Truck_Contents[ TRUCK_VEHICLE[vehicleid][truck_vehicle_POINT] ][truck_content_Z], 5.0, 0, 0, playerid, 9999999999.0);
		StartTracing(playerid, Truck_Contents[ TRUCK_VEHICLE[vehicleid][truck_vehicle_POINT] ][truck_content_X], Truck_Contents[ TRUCK_VEHICLE[vehicleid][truck_vehicle_POINT] ][truck_content_Y], Truck_Contents[ TRUCK_VEHICLE[vehicleid][truck_vehicle_POINT] ][truck_content_Z]);

		new info[1];
		info[0] = CHECKPOINT_TYPE_UNLOAD_TRUCK;
		Streamer_SetArrayData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT], E_STREAMER_EXTRA_ID, info);
	}
	return 1;
}

UpdatePlayerLoadingTruckSize(playerid)
{
	new str_text[64];
	format(str_text, sizeof(str_text), "Preparando cami�n ~g~%d%", PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] + minrand(1, 8));
	ShowPlayerMessage(playerid, str_text, 2);

	if (PLAYER_TEMP[playerid][py_TRUCK_LOADING_VALUE] > 99)
	{
		ShowPlayerMessage(playerid, "Preparando cami�n ~g~100%", 2);
	}
	return 1;
}

CMD:policia(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres polic�a", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_NONE && PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE)
	{
	    ShowPlayerMessage(playerid, "~r~Ya estas en servicio en otro trabajo.", 3);
		return 1;
	}

	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No est�s depie.", 3);
	{
		if (!PLAYER_TEMP[playerid][py_WORKING_IN]) ShowDialog(playerid, DIALOG_SELECT_POLICE_SKIN);
		else EndPlayerJob(playerid);
	}

	return 1;
}

OpenMafiaDoor(playerid)
{
	new bool:open;
	for(new i = 0; i != sizeof MAFIA_DOORS; i ++)
	{
		switch(MAFIA_DOORS[i][mafia_door_TYPE])
		{
			case DOOR_TYPE_MAFIA:
			{
				if (PLAYER_WORKS[playerid][ MAFIA_DOORS[i][mafia_door_MAFIA] ]) open = true;
			}
			case DOOR_TYPE_USER:
			{
				if (ACCOUNT_INFO[playerid][ac_ID] == MAFIA_DOORS[i][mafia_door_MAFIA]) open = true;
			}
		}

		if (open)
		{
			if (GetPlayerInterior(playerid) != MAFIA_DOORS[i][mafia_door_INTERIOR] || GetPlayerVirtualWorld(playerid) != MAFIA_DOORS[i][mafia_door_WORLD]) continue;
			if (IsDynamicObjectMoving(MAFIA_DOORS[i][mafia_door_OBJECT_ID]) || !MAFIA_DOORS[i][mafia_door_CLOSED]) continue;

			new Float:range = 15.0;
			switch (MAFIA_DOORS[i][mafia_door_MODELID])
			{
				case 19861: range = 3.0;
				case 974: range = 5.0;
				case 1495: range = 2.0;
			}

			if (IsPlayerInRangeOfPoint(playerid, range, MAFIA_DOORS[i][mafia_door_X], MAFIA_DOORS[i][mafia_door_Y], MAFIA_DOORS[i][mafia_door_Z]))
			{
				KillTimer(MAFIA_DOORS[i][mafia_door_TIMER]);
				MAFIA_DOORS[i][mafia_door_TIMER] = SetTimerEx("CloseMafiaDoor", 10000, false, "i", i);

				new Float:distance = 15.0;
				if (MAFIA_DOORS[i][mafia_door_MODELID] == 8378)
					distance = 50.0;

				MoveDynamicObject(MAFIA_DOORS[i][mafia_door_OBJECT_ID], MAFIA_DOORS[i][mafia_door_X], MAFIA_DOORS[i][mafia_door_Y], MAFIA_DOORS[i][mafia_door_Z] - distance, 2.0, 0.0, 0.0, MAFIA_DOORS[i][mafia_door_RZ]);
				MAFIA_DOORS[i][mafia_door_CLOSED] = false;
			}
		}
	}
	return 1;
}

CMD:mecanico(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_MECHANIC]) return ShowPlayerMessage(playerid, "~r~No eres mec�nico.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_NONE && PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_MECHANIC)
	{
		//ShowPlayerMessage(playerid, "~r~Ya estas en servicio en otro trabajo.", 3);
		return 1;
	}

	if (GetPlayerVirtualWorld(playerid) != 0) return ShowPlayerMessage(playerid, "~r~No est�s en el sitio correcto.", 3);
	if (GetPlayerInterior(playerid) != 0) return ShowPlayerMessage(playerid, "~r~No est�s en el sitio correcto.", 3);
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No est�s depie.", 3);
	if (!IsPlayerInRangeOfPoint(playerid, 1.0,-69.941520, -1181.400634, 1.750000)) return ShowPlayerMessage(playerid, "~r~No est�s en el sitio correcto.", 3);

	if (!PLAYER_TEMP[playerid][py_WORKING_IN]) StartPlayerJob(playerid, WORK_MECHANIC);
	else EndPlayerJob(playerid);
	return 1;
}

/*CMD:menu(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	ShowRangeUser(playerid);
	SendClientMessage(playerid, COLOR_RED, "AVISO:"COL_WHITE" Esto es viejo, presione la tecla N para abrir el nuevo inventario.");
	return 1;
}*/

StartPlanting(playerid, type)
{
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No est�s depie.", 3);
	if (PLAYER_TEMP[playerid][py_PLANTING]) return ShowPlayerMessage(playerid, "~r~Ya estas plantado algo.", 3);

	new str_text[128];

	if (gettime() < PLAYER_TEMP[playerid][py_LAST_PLANT_TIME] + 5)
	{
		new time = (60-(gettime()-PLAYER_TEMP[playerid][py_LAST_PLANT_TIME]));
		format(str_text, sizeof(str_text), "Tienes que esperar %s minutos para volver a plantar.", TimeConvert(time));
		ShowPlayerMessage(playerid, str_text, 4);
		return 1;
	}

	if (GetPlayerPlantedPlants(playerid) > 25) return ShowPlayerMessage(playerid, "~r~Tienes muchas plantas, rec�gelas para seguir", 4);

	for(new i = 0; i != MAX_PLANTS; i ++)
	{
		if (!PLANTS[i][plant_VALID]) continue;

		new Float:x, Float:y, Float:z;
		GetDynamicObjectPos(PLANTS[i][plant_OBJECT_ID], x, y, z);
		if (IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z))
		{
			ShowPlayerMessage(playerid, "Aqu� ya hay una planta, al�jate un poco para plantar.", 4);
			return 1;
		}
	}

	switch(seed_info[type][seed_info_PLANT_TYPE])
	{
		case PLANT_TYPE_MEDICINE:
		{
			if (plant_info[type][plant_info_SEEDS] > PLAYER_MISC[playerid][MISC_SEED_MEDICINE])
			{
				ShowPlayerMessage(playerid, "~r~No tienes las semillas necesarias para plantar esta planta.", 3);
				return 1;
			}
			PLAYER_MISC[playerid][MISC_SEED_MEDICINE] -= plant_info[type][plant_info_SEEDS];
		}
		case PLANT_TYPE_CANNABIS:
		{
			if (plant_info[type][plant_info_SEEDS] > PLAYER_MISC[playerid][MISC_SEED_CANNABIS])
			{
				ShowPlayerMessage(playerid, "~r~No tienes las semillas necesarias para plantar esta planta.", 3);
				return 1;
			}
			PLAYER_MISC[playerid][MISC_SEED_CANNABIS] -= plant_info[type][plant_info_SEEDS];
		}
		case PLANT_TYPE_CRACK:
		{
			if (plant_info[type][plant_info_SEEDS] > PLAYER_MISC[playerid][MISC_SEED_CRACK])
			{
				ShowPlayerMessage(playerid, "~r~No tienes las semillas necesarias para plantar esta planta.", 3);
				return 1;
			}
			PLAYER_MISC[playerid][MISC_SEED_CRACK] -= plant_info[type][plant_info_SEEDS];
		}
	}

	format(str_text, sizeof(str_text), "Estas plantando %s, has gastado %d semillas.", plant_info[type][plant_info_NAME], plant_info[type][plant_info_SEEDS]);
	ShowPlayerNotification(playerid, str_text, 5);

	PLAYER_TEMP[playerid][py_LAST_PLANT_TIME] = gettime();
	PLAYER_TEMP[playerid][py_PLANTING_PLANT_SELECTED] = type;
	PLAYER_TEMP[playerid][py_PLANTING] = true;
	PLAYER_TEMP[playerid][py_PLANTING_PROGRESS] = minrand(0, 5);
	UpdatePlantSizeTextdrawPlant(playerid);

	TogglePlayerControllableEx(playerid, false);
	SetCameraBehindPlayer(playerid);
	ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.1, true, false, false, false, 0);

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][12]);
	PLAYER_TEMP[playerid][py_TIMERS][12] = SetTimerEx("PlantingUp", 1000, false, "id", playerid, plant_info[type][plant_info_SEEDS]);
	return 1;
}

CMD:plantar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (GetPlayerVirtualWorld(playerid) != 0) return ShowPlayerMessage(playerid, "~r~No est�s en el sitio correcto.", 3);
	if (GetPlayerInterior(playerid) != 0) return ShowPlayerMessage(playerid, "~r~No est�s en el sitio correcto.", 3);
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No est�s depie.", 3);
	if (PLAYER_TEMP[playerid][py_PLANTING]) return ShowPlayerMessage(playerid, "~r~Ya estas plantado algo.", 3);

	new str_text[128];

	if (gettime() < PLAYER_TEMP[playerid][py_LAST_PLANT_TIME] + 5)
	{
		new time = (60-(gettime()-PLAYER_TEMP[playerid][py_LAST_PLANT_TIME]));
		format(str_text, sizeof(str_text), "Tienes que esperar %s minutos para volver a plantar.", TimeConvert(time));
		ShowPlayerMessage(playerid, str_text, 4);
		return 1;
	}

	if (GetPlayerPlantedPlants(playerid) > 25) return ShowPlayerMessage(playerid, "~r~Tienes muchas plantas, rec�gelas para seguir", 4);

	for(new i = 0; i != MAX_PLANTS; i ++)
	{
		if (!PLANTS[i][plant_VALID]) continue;

		new Float:x, Float:y, Float:z;
		GetDynamicObjectPos(PLANTS[i][plant_OBJECT_ID], x, y, z);
		if (IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z))
		{
			ShowPlayerMessage(playerid, "Aqu� ya hay una planta, al�jate un poco para plantar.", 4);
			return 1;
		}
	}

	ShowDialog(playerid, DIALOG_PLANT_PLANTS);
	return 1;
}

ActiveGeolocation(playerid)
{
	if (PLAYER_MISC[playerid][MISC_GEO])
	{
		if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar el geolocalizador.", 3);
		if ((gettime() - PLAYER_TEMP[playerid][py_LAST_GEO_USE]) < 60 * 5) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 5 minutos para volver a hacer eso.", 4);
		
		if (PLAYER_CREW[playerid][player_crew_VALID])
		{
			new 
				city[45],
				zone[45],
				message[144]
			;

			GetPlayerZones(playerid, city, zone);
			format(message, sizeof message, "~r~%s~w~: refuerzos en %s.", PLAYER_TEMP[playerid][py_RP_NAME], zone);

		 	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
			{
				if (IsPlayerConnected(i))
				{
					if (PLAYER_CREW[i][player_crew_VALID])
					{
						if (PLAYER_CREW[i][player_crew_ID] == PLAYER_CREW[playerid][player_crew_ID])
						{
							SetPlayerMarkerForPlayer(i, playerid, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);
							ShowPlayerNotification(i, message, 4);
						}
					}
				}
			}

		 	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][38]);
			PLAYER_TEMP[playerid][py_TIMERS][38] = SetTimerEx("DisableGangRefMark", 120000, false, "i", playerid);
			PLAYER_TEMP[playerid][py_LAST_GEO_USE] = gettime();
			return 1;
		}

		if (PlayerIsInMafia(playerid))
		{
			new 
				city[45],
				zone[45],
				message[144],
				mafia = GetPlayerMafia(playerid)
			;

			GetPlayerZones(playerid, city, zone);
			format(message, sizeof message, "~r~%s~w~: refuerzos en %s.", PLAYER_TEMP[playerid][py_RP_NAME], zone);

		 	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
			{
				if (IsPlayerConnected(i))
				{
					if (PLAYER_WORKS[i][mafia])
					{
						SetPlayerMarkerForPlayer(i, playerid, GetMafiaColor(mafia));
						ShowPlayerNotification(i, message, 4);
					}
				}
			}

		 	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][38]);
			PLAYER_TEMP[playerid][py_TIMERS][38] = SetTimerEx("DisableMafiaRefMark", 120000, false, "i", playerid);
			PLAYER_TEMP[playerid][py_LAST_GEO_USE] = gettime();
			return 1;
		}
	}
	else ShowPlayerMessage(playerid, "~r~No tienes un geolocalizador.", 4);
	return 1;
}

/*CMD:piezas(playerid, params[])
{
	if (!PLAYER_WORKS[playerid][WORK_MECHANIC]) return ShowPlayerMessage(playerid, "~r~No eres mec�nico.", 3);
	if (GetPlayerVirtualWorld(playerid) != 0) return ShowPlayerMessage(playerid, "~r~No est�s en el sitio correcto.", 3);
	if (GetPlayerInterior(playerid) != 0) return ShowPlayerMessage(playerid, "~r~No est�s en el sitio correcto.", 3);
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No est�s depie.", 3);
	if (!IsPlayerInRangeOfPoint(playerid, 1.0, -82.038078, -1208.153564, 2.704517)) return ShowPlayerMessage(playerid, "~r~No est�s en el sitio correcto.", 3);

	if (sscanf(params, "d", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /piezas "COL_WHITE"[cantidad]");
	if (params[0] <= 0 || params[0] >= 10000) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /piezas "COL_WHITE"[cantidad > 0]");

	new price = params[0] * 50;
	if (price > CHARACTER_INFO[playerid][ch_CASH])
	{
		SendClientMessageEx(playerid, COLOR_WHITE, "Necesitas %s$ para poder comprar %d piezas.", number_format_thousand(price), params[0]);
		return 1;
	}

	GivePlayerCash(playerid, -price);
	PLAYER_MISC[playerid][MISC_MECHANIC_PIECES] += params[0];
	SavePlayerMisc(playerid);
	SendClientMessageEx(playerid, COLOR_WHITE, ""COL_WHITE"Has comprado %s piezas por %s$, ahora tienes %s piezas.", number_format_thousand(params[0]), number_format_thousand(price), number_format_thousand(PLAYER_MISC[playerid][MISC_MECHANIC_PIECES]));
	return 1;
}*/

VehiclePaintjob(modelid)
{
	switch(modelid)
	{
		case 483: return 1;
		case 534..536: return 3;
		case 558..562: return 3;
		case 565, 567: return 3;
		case 575: return 2;
		case 576: return 3;
	}
	return false;
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

SetPlayerTrashCheckpoint(playerid, vehicleid)
{
	DestroyPlayerTrashCheckpoint(playerid);

	new cp = TRASH_VEHICLES[ vehicleid ][trash_vehicle_CP];
	new route = TRASH_VEHICLES[ vehicleid ][trash_vehicle_ROUTE];

	if (cp >= TRASH_OBJECTS[route][trash_route_OBJECTS])
	{
		PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT] = CreateDynamicCP(1621.435791, -2158.833740, 13.554687, 5.0, 0, 0, playerid, 9999999999.0);
	    StartTracing(playerid, 1621.435791, -2158.833740, 13.554687);
		new info[1];
		info[0] = CHECKPOINT_TYPE_FINISH_TRASH;
		Streamer_SetArrayData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT], E_STREAMER_EXTRA_ID, info);
	}
	else
	{
		PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT] = CreateDynamicCP(TRASH_OBJECTS[ route ][trash_object_X][ cp ], TRASH_OBJECTS[ route ][trash_object_Y][ cp ], TRASH_OBJECTS[ route ][trash_object_Z][ cp ], 1.5, 0, 0, playerid, 9999999999.0);
		StartTracing(playerid, TRASH_OBJECTS[ route ][trash_object_X][ cp ], TRASH_OBJECTS[ route ][trash_object_Y][ cp ], TRASH_OBJECTS[ route ][trash_object_Z][ cp ]);

		new info[1];
		info[0] = CHECKPOINT_TYPE_TRASH;
		Streamer_SetArrayData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT], E_STREAMER_EXTRA_ID, info);
	}
	return 1;
}

DestroyPlayerTrashCheckpoint(playerid)
{
	if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT]))
	{
		DestroyDynamicCP(PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT]);
		CancelTracing(playerid);
		PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT] = INVALID_STREAMER_ID;
	}
	return 1;
}

CancelTrashWork(driver, mate, vehicleid)
{
	DestroyPlayerTrashCheckpoint(driver);
	DestroyPlayerTrashCheckpoint(mate);

	DestroyPlayerTrashRouteObjects(driver);
	DestroyPlayerTrashRouteObjects(mate);

	PLAYER_TEMP[driver][py_TRASH_DRIVER] = false;
	PLAYER_TEMP[driver][py_TRASH_PASSENGER] = false;
	PLAYER_TEMP[driver][py_TRASH_VEHICLE_ID] = INVALID_VEHICLE_ID;

	PLAYER_TEMP[mate][py_TRASH_DRIVER] = false;
	PLAYER_TEMP[mate][py_TRASH_PASSENGER] = false;
	PLAYER_TEMP[mate][py_TRASH_VEHICLE_ID] = INVALID_VEHICLE_ID;

	KillTimer(PLAYER_TEMP[mate][py_TIMERS][10]);
	ClearAnimations(mate);
	TogglePlayerControllableEx(mate, true);

	ResetTrashInfo(vehicleid);
	SetVehicleToRespawnEx(vehicleid);
	return 1;
}

UpdatePlayerTrashRecycleSize(playerid)
{
	new str_text[64];
	format(str_text, sizeof(str_text), "Recogiendo basura ~g~%d%", PLAYER_TEMP[playerid][py_RECYCLE_BIN_VALUE] + minrand(1, 8));
	ShowPlayerMessage(playerid, str_text, 2);

	if (PLAYER_TEMP[playerid][py_RECYCLE_BIN_VALUE] > 99)
	{
		ShowPlayerMessage(playerid, "Recogiendo basura ~g~100%", 2);
	}
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

forward RecycleUp(playerid);
public RecycleUp(playerid)
{
	#if DEBUG_MODE == 1
		printf("RecycleUp"); // debug juju
	#endif

	if (PLAYER_TEMP[playerid][py_RECYCLE_BIN_VALUE] < 100)
	{
		PLAYER_TEMP[playerid][py_RECYCLE_BIN_VALUE] += 15;
		if (PLAYER_TEMP[playerid][py_RECYCLE_BIN_VALUE] > 100) PLAYER_TEMP[playerid][py_RECYCLE_BIN_VALUE] = 100;

		ApplyAnimation(playerid, "ROB_BANK", "CAT_Safe_Rob", 4.1, true, false, false, false, 0);
		UpdatePlayerTrashRecycleSize(playerid);
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][10]);
		PLAYER_TEMP[playerid][py_TIMERS][10] = SetTimerEx("RecycleUp", 1000, false, "i", playerid);
		return 1;
	}

	TogglePlayerControllableEx(playerid, true);
	ClearAnimations(playerid);

	new driver = TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID];
	new cp = TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_CP];
	new route = TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_ROUTE];

	DestroyDynamicObject(TRASH_PLAYER_OBJECTS[playerid][cp]);
	TRASH_PLAYER_OBJECTS[playerid][cp] = INVALID_STREAMER_ID;

	DestroyDynamicObject(TRASH_PLAYER_OBJECTS[driver][cp]);
	TRASH_PLAYER_OBJECTS[driver][cp] = INVALID_STREAMER_ID;

	CreatePlayerFlashObject(
								playerid,
								TRASH_OBJECTS[ route ][trash_object_X][ cp ],
								TRASH_OBJECTS[ route ][trash_object_Y][ cp ],
								TRASH_OBJECTS[ route ][trash_object_Z][ cp ] - 1.5
							);

	CreatePlayerFlashObject(
								driver,
								TRASH_OBJECTS[ route ][trash_object_X][ cp ],
								TRASH_OBJECTS[ route ][trash_object_Y][ cp ],
								TRASH_OBJECTS[ route ][trash_object_Z][ cp ] - 1.5
							);

	PlayerPlaySoundEx(playerid, 1190, 0.0, 0.0, 0.0);

	TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_CP] ++;
	if (TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_CP] >= TRASH_OBJECTS[ TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_ROUTE] ][trash_route_OBJECTS])
	{
	    ShowPlayerMessage(playerid, "Sube al cami�n para volver al ~y~vertedero ~w~y recibir la paga.", 3);
	    ShowPlayerMessage(driver, "Sube al cami�n para volver al ~y~vertedero ~w~y recibir la paga.", 3);
	}
	else ShowPlayerMessage(playerid, "Sube al cami�n para seguir con la ruta.", 3);

	SetPlayerTrashCheckpoint(driver, PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);
	SetPlayerTrashCheckpoint(playerid, PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);

	Streamer_Update(driver);
	Streamer_Update(playerid);
	return 1;
}

ShowPlayerInventory(playerid, pid)
{
	if (!IsPlayerConnected(pid)) return 0;
	if (ACCOUNT_INFO[pid][ac_ID] == 0) return 0;

	new caption[48];
	format(caption, sizeof caption, ""COL_RED"%s", PLAYER_TEMP[pid][py_RP_NAME]);

	new dialog[364], line_str[128];

	format(line_str, sizeof line_str, ""COL_WHITE"Dinero: "COL_GREEN"%s$"COL_WHITE"\n", number_format_thousand(CHARACTER_INFO[pid][ch_CASH]));
	strcat(dialog, line_str);

	if (PLAYER_PHONE[pid][player_phone_VALID])
	{
		format(line_str, sizeof line_str, "Tel�fono: %d"COL_WHITE"\n", PLAYER_PHONE[pid][player_phone_NUMBER]);
		strcat(dialog, line_str);
	}

	new player_weapons = CountPlayerWeapons(pid);
	if (player_weapons > 0)
	{
		for(new i; i != 13; i ++)
		{
			if (!PLAYER_WEAPONS[pid][i][player_weapon_VALID]) continue;

			format(line_str, sizeof line_str, ""COL_WHITE"%s | Slot "COL_RED"%d"COL_WHITE"\n", WEAPON_INFO[ PLAYER_WEAPONS[pid][i][player_weapon_ID] ][weapon_info_NAME], i);
			strcat(dialog, line_str);
		}
	}

	if (PLAYER_MISC[pid][MISC_SEED_CANNABIS] > 0)
	{
		format(line_str, sizeof line_str, "Semillas Marihuana: "COL_YELLOW"%d"COL_WHITE"\n", PLAYER_MISC[pid][MISC_SEED_CANNABIS]);
		strcat(dialog, line_str);
	}

	if (PLAYER_MISC[pid][MISC_SEED_CRACK] > 0)
	{
		format(line_str, sizeof line_str, "Semillas Coca: "COL_YELLOW"%d"COL_WHITE"\n", PLAYER_MISC[pid][MISC_SEED_CRACK]);
		strcat(dialog, line_str);
	}

	if (PLAYER_MISC[pid][MISC_CANNABIS] > 0)
	{
		format(line_str, sizeof line_str, "Marihuana: "COL_YELLOW"%d"COL_WHITE"\n", PLAYER_MISC[pid][MISC_CANNABIS]);
		strcat(dialog, line_str);
	}

	if (PLAYER_MISC[pid][MISC_CRACK] > 0)
	{
		format(line_str, sizeof line_str, "Crack: "COL_YELLOW"%d"COL_WHITE"\n", PLAYER_MISC[pid][MISC_CRACK]);
		strcat(dialog, line_str);
	}

	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, caption, dialog, "Cerrar", "");
	return 1;
}

/*CountPlayerToys(playerid)
{
	new toys;

	for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++)
	{
		if (PLAYER_TOYS[playerid][i][player_toy_VALID])
		{
			toys ++;
		}
	}
	return toys;
}

CountPlayerPocketObjects(playerid)
{
	new objects;

	for(new i = 0; i != MAX_PLAYER_POCKET_OBJECTS; i ++)
	{
		if (PLAYER_POCKET[playerid][i][player_pocket_VALID])
		{
			objects ++;
		}
	}
	return objects;
}*/

CountPlayerWeapons(playerid)
{
	new weapons;

	for(new i = 0; i != 13; i ++)
	{
		if (PLAYER_WEAPONS[playerid][i][player_weapon_VALID])
		{
			weapons ++;
		}
	}
	return weapons;
}

ShowPlayerSkills(playerid, pid)
{
	if (!IsPlayerConnected(pid)) return 0;
	if (ACCOUNT_INFO[pid][ac_ID] == 0) return 0;

	new caption[48], line_str[80], dialog[sizeof line_str * (sizeof(work_info) + 5)];
	format(caption, sizeof caption, ""COL_RED"%s", PLAYER_TEMP[pid][py_RP_NAME]);

	for(new i = 1; i != sizeof work_info; i ++)
	{
		if (i == WORK_POLICE)
		{
			if (PLAYER_WORKS[playerid][WORK_POLICE])
			{
				format(line_str, sizeof line_str, ""COL_WHITE"%c%s: "COL_GREEN"%s\n", toupper(work_info[i][work_info_NAME][0]), work_info[i][work_info_NAME][1], POLICE_RANKS[PLAYER_SKILLS[pid][i]]);
				strcat(dialog, line_str);
			}
		}
		else
		{
			format(line_str, sizeof line_str, ""COL_WHITE"%c%s: "COL_GREEN"%s\n", toupper(work_info[i][work_info_NAME][0]), work_info[i][work_info_NAME][1], number_format_thousand(PLAYER_SKILLS[pid][i]));
			strcat(dialog, line_str);
		}
	}

	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, caption, dialog, "Cerrar", "");
	return 1;
}

ConvertTime_SecondsToHoursFloat(sec, &Float:hours)
{
	hours = floatdiv(float(sec), 3600);
	return 1;
}

CreatePlayerTrashRouteObjects(playerid, route)
{
	for(new i = 0; i != MAX_OBJECTS_PER_ROUTE; i ++)
	{
		TRASH_PLAYER_OBJECTS[playerid][i] = INVALID_STREAMER_ID;

		if (TRASH_OBJECTS[route][trash_object_MODELID][i] != 0)
		{
			TRASH_PLAYER_OBJECTS[playerid][i] = CreateDynamicObject(TRASH_OBJECTS[route][trash_object_MODELID][i], TRASH_OBJECTS[route][trash_object_X][i], TRASH_OBJECTS[route][trash_object_Y][i], TRASH_OBJECTS[route][trash_object_Z][i], TRASH_OBJECTS[route][trash_object_RX][i], TRASH_OBJECTS[route][trash_object_RY][i], TRASH_OBJECTS[route][trash_object_RZ][i], 0, 0, playerid);
		}
	}
	return 1;
}

DestroyPlayerTrashRouteObjects(playerid)
{
	for(new i = 0; i != MAX_OBJECTS_PER_ROUTE; i ++)
	{
		if (TRASH_PLAYER_OBJECTS[playerid][i] != INVALID_STREAMER_ID) DestroyDynamicObject(TRASH_PLAYER_OBJECTS[playerid][i]);
		TRASH_PLAYER_OBJECTS[playerid][i] = INVALID_STREAMER_ID;
	}
	return 1;
}

UpdatePlantSizeTextdrawPlant(playerid)
{
	new str_text[64];
	format(str_text, sizeof(str_text), "Plantando ~g~%d %", PLAYER_TEMP[playerid][py_PLANTING_PROGRESS]);
	ShowPlayerMessage(playerid, str_text, 2);
	return 1;
}

CancelPlayerPlanting(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][12]);
	PLAYER_TEMP[playerid][py_PLANTING] = false;
	PLAYER_TEMP[playerid][py_PLANTING_PROGRESS] = 0;

	TogglePlayerControllableEx(playerid, true);
	ClearAnimations(playerid);
	return 1;
}

forward PlantingUp(playerid, seeds);
public PlantingUp(playerid, seeds)
{
	#if DEBUG_MODE == 1
		printf("PlantingUp"); // debug juju
	#endif

	if (PLAYER_TEMP[playerid][py_PLANTING_PROGRESS] < 100)
	{
		PLAYER_TEMP[playerid][py_PLANTING_PROGRESS] += minrand(5, 20);
		if (PLAYER_TEMP[playerid][py_PLANTING_PROGRESS] > 100) PLAYER_TEMP[playerid][py_PLANTING_PROGRESS] = 100;

		ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.1, true, false, false, false, 0);
		UpdatePlantSizeTextdrawPlant(playerid);
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][12]);
		PLAYER_TEMP[playerid][py_TIMERS][12] = SetTimerEx("PlantingUp", 1000, false, "id", playerid, seeds);
		return 1;
	}

	PLAYER_TEMP[playerid][py_WORKING_IN] = WORK_NONE;
	PLAYER_TEMP[playerid][py_PLANTING] = false;
	PLAYER_TEMP[playerid][py_PLANTING_PROGRESS] = 0;

	TogglePlayerControllableEx(playerid, true);
	ClearAnimations(playerid);

	//objeto planta: 2244

	new index = GetAvaiblePlantIndex();
	if (index == -1)
	{

		switch(seed_info[ PLAYER_TEMP[playerid][py_PLANTING_PLANT_SELECTED] ][seed_info_PLANT_TYPE])
		{
			case PLANT_TYPE_MEDICINE: PLAYER_MISC[playerid][MISC_SEED_MEDICINE] += plant_info[ PLAYER_TEMP[playerid][py_PLANTING_PLANT_SELECTED] ][plant_info_SEEDS];
			case PLANT_TYPE_CANNABIS: PLAYER_MISC[playerid][MISC_SEED_CANNABIS] += plant_info[ PLAYER_TEMP[playerid][py_PLANTING_PLANT_SELECTED] ][plant_info_SEEDS];
			case PLANT_TYPE_CRACK: PLAYER_MISC[playerid][MISC_SEED_CRACK] += plant_info[ PLAYER_TEMP[playerid][py_PLANTING_PLANT_SELECTED] ][plant_info_SEEDS];
		}

		ShowPlayerMessage(playerid, "~r~No queda espacio para m�s plantas, prueba m�s tarde.", 3);
		return 1;
	}

	GetPlayerPos(playerid, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2]);
	GetPlayerFacingAngle(playerid, CHARACTER_INFO[playerid][ch_ANGLE]);
	CHARACTER_INFO[playerid][ch_POS][0] += (1.0 * floatsin(-CHARACTER_INFO[playerid][ch_ANGLE], degrees));
	CHARACTER_INFO[playerid][ch_POS][1] += (1.0 * floatcos(-CHARACTER_INFO[playerid][ch_ANGLE], degrees));
	CHARACTER_INFO[playerid][ch_POS][2] -= 0.75;

	PLANTS[index][plant_VALID] = true;
	PLANTS[index][plant_GROWING] = true;
	PLANTS[index][plant_INVISIBLE] = true;
	PLANTS[index][plant_GROWING_PROGRESS] = frandom(10.0, 8.0, 2);
	PLANTS[index][plant_TYPE] = PLAYER_TEMP[playerid][py_PLANTING_PLANT_SELECTED];
	PLANTS[index][plant_PLANTED_BY_ACCOUNT_ID] = ACCOUNT_INFO[playerid][ac_ID];
	format(PLANTS[index][plant_PLANTED_BY_NAME], 24, "%s", PLAYER_TEMP[playerid][py_RP_NAME]);
	PLANTS[index][plant_OBJECT_ID] = CreateDynamicObject(2244, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], 0.0, 0.0, CHARACTER_INFO[playerid][ch_ANGLE], GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
	SetDynamicObjectMaterial(PLANTS[index][plant_OBJECT_ID], 2, 2244, "plants_tabletop", "CJ_PLANT", 0x00F7F7F7);

	if (GetPlayerInterior(playerid) == 0)
	{
		CA_FindZ_For2DCoord(CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2]);
		MoveDynamicObject(PLANTS[index][plant_OBJECT_ID], CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], 12.0, 0.0, 0.0, CHARACTER_INFO[playerid][ch_ANGLE]);
	}

	new info[2];
	info[0] = OBJECT_TYPE_PLANT;
	info[1] = index;
	Streamer_SetArrayData(STREAMER_TYPE_OBJECT, PLANTS[index][plant_OBJECT_ID], E_STREAMER_EXTRA_ID, info);

	new label_str[256];
	format(label_str, sizeof label_str, ""COL_YELLOW"%s"COL_WHITE" de %s\n"COL_WHITE"Creciendo: %.1f%%", plant_info[ PLANTS[index][plant_TYPE] ][plant_info_NAME], PLANTS[index][plant_PLANTED_BY_NAME], PLANTS[index][plant_GROWING_PROGRESS]);
	PLANTS[index][plant_LABEL_ID] = CreateDynamic3DTextLabel(label_str, 0xF7F7F700, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2] + 0.25, 10.0, .testlos = false, .interiorid = GetPlayerInterior(playerid), .worldid = GetPlayerVirtualWorld(playerid));

	KillTimer(PLANTS[index][plant_TIMER]);
	PLANTS[index][plant_TIMER] = SetTimerEx("GrowPlantUp", 15000, false, "d", index);

	SavePlayerSkills(playerid);
	ShowPlayerMessage(playerid, "Ahora espera a que la planta crezca, si pasan m�s de 5 minutos despu�s~n~de que la planta haya crecido se destruir�.", 4);
	Streamer_Update(playerid);
	return 1;
}

GetAvaiblePlantIndex()
{
	for(new i = 0; i != sizeof PLANTS; i ++)
	{
		if (!PLANTS[i][plant_VALID]) return i;
	}
	return -1;
}

forward GrowPlantUp(plant);
public GrowPlantUp(plant)
{
	#if DEBUG_MODE == 1
		printf("GrowPlantUp"); // debug juju
	#endif

	if (!PLANTS[plant][plant_VALID] || !PLANTS[plant][plant_GROWING]) return 0;

	if (PLANTS[plant][plant_GROWING_PROGRESS] < 100.0)
	{
		PLANTS[plant][plant_GROWING_PROGRESS] += floatdiv(25, plant_info[ PLANTS[plant][plant_TYPE] ][plant_info_SEEDS]);
		if (PLANTS[plant][plant_GROWING_PROGRESS] > 100.0) PLANTS[plant][plant_GROWING_PROGRESS] = 100.0;

		if (PLANTS[plant][plant_INVISIBLE] && PLANTS[plant][plant_GROWING_PROGRESS] > 50.0)
		{
			PLANTS[plant][plant_INVISIBLE] = false;
			SetDynamicObjectMaterial(PLANTS[plant][plant_OBJECT_ID], 2, 2244, "plants_tabletop", "CJ_PLANT", COLOR_WHITE);
		}

		new label_str[256];
		format(label_str, sizeof label_str, ""COL_YELLOW"%s"COL_WHITE" de %s\n"COL_WHITE"Creciendo: %.1f%%", plant_info[ PLANTS[plant][plant_TYPE] ][plant_info_NAME], PLANTS[plant][plant_PLANTED_BY_NAME], PLANTS[plant][plant_GROWING_PROGRESS]);
		UpdateDynamic3DTextLabelText(PLANTS[plant][plant_LABEL_ID], 0xF7F7F700, label_str);

		KillTimer(PLANTS[plant][plant_TIMER]);
		PLANTS[plant][plant_TIMER] = SetTimerEx("GrowPlantUp", 15000, false, "d", plant);
		return 1;
	}

	SetDynamicObjectMaterial(PLANTS[plant][plant_OBJECT_ID], 2, 2244, "plants_tabletop", "CJ_PLANT", 0xFFff0000);

	PLANTS[plant][plant_GROWING] = false;
	PLANTS[plant][plant_EXPIRE_TIME] = 1000;

	new label_str[256];
	format(label_str, sizeof label_str, ""COL_YELLOW"%s"COL_WHITE" de %s\n"COL_WHITE"Expira en %s minutos", plant_info[ PLANTS[plant][plant_TYPE] ][plant_info_NAME], PLANTS[plant][plant_PLANTED_BY_NAME], TimeConvert(PLANTS[plant][plant_EXPIRE_TIME]));
	UpdateDynamic3DTextLabelText(PLANTS[plant][plant_LABEL_ID], 0xF7F7F700, label_str);

	KillTimer(PLANTS[plant][plant_TIMER]);
	PLANTS[plant][plant_TIMER] = SetTimerEx("ExpirePlantTime", 1000, false, "d", plant);
	return 1;
}

forward ExpirePlantTime(plant);
public ExpirePlantTime(plant)
{
	#if DEBUG_MODE == 1
		printf("ExpirePlantTime"); // debug juju
	#endif

	if (!PLANTS[plant][plant_VALID]) return 0;

	if (PLANTS[plant][plant_EXPIRE_TIME] > 0)
	{
		PLANTS[plant][plant_EXPIRE_TIME] --;

		new label_str[256];
		format(label_str, sizeof label_str, ""COL_YELLOW"%s"COL_WHITE" de %s\n"COL_WHITE"Expira en %s minutos", plant_info[ PLANTS[plant][plant_TYPE] ][plant_info_NAME], PLANTS[plant][plant_PLANTED_BY_NAME], TimeConvert(PLANTS[plant][plant_EXPIRE_TIME]));
		UpdateDynamic3DTextLabelText(PLANTS[plant][plant_LABEL_ID], 0xF7F7F700, label_str);

		KillTimer(PLANTS[plant][plant_TIMER]);
		PLANTS[plant][plant_TIMER] = SetTimerEx("ExpirePlantTime", 1000, false, "d", plant);
		return 1;
	}

	new Float:x, Float:y, Float:z;
	GetDynamicObjectPos(PLANTS[plant][plant_OBJECT_ID], x, y, z);
	CreateFlashObject(x, y, z - 1.3);

	DestroyDynamicObject(PLANTS[plant][plant_OBJECT_ID]);
	DestroyDynamic3DTextLabel(PLANTS[plant][plant_LABEL_ID]);

	new tmp_PLANTS[PLANTS_ENUM]; PLANTS[plant] = tmp_PLANTS;
	return 1;
}

ShowPlayerGpsMap(playerid)
{
	PLAYER_TEMP[playerid][py_GPS_MAP] = true;
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_GPS_MAP][0]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_GPS_MAP][1]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_GPS_MAP][2]);

	UpdatePlayer_GPS_Map(playerid);

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][13]);
	PLAYER_TEMP[playerid][py_TIMERS][13] = SetTimerEx("UpdatePlayer_GPS_Map", 1000, true, "i", playerid);
	return 1;
}

HidePlayerGpsMap(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][13]);
	PLAYER_TEMP[playerid][py_GPS_MAP] = false;
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_GPS_MAP][0]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_GPS_MAP][1]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_GPS_MAP][2]);

	for(new i = 0; i != MAX_PLAYER_MAP_GPS_POINTS; i ++)
	{
		if (PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][i] != PlayerText:INVALID_TEXT_DRAW)
		{
			PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][i]);
			PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][i] = PlayerText:INVALID_TEXT_DRAW;
		}
	}
	return 1;
}

forward UpdatePlayer_GPS_Map(playerid);
public UpdatePlayer_GPS_Map(playerid)
{
	#if DEBUG_MODE == 1
		printf("UpdatePlayer_GPS_Map"); // debug juju
	#endif

	/*
		0 - playerpos
		1 - cp gps
		2 - cp works
		3 > cp works

	*/
	if (!PLAYER_TEMP[playerid][py_GPS_MAP]) return KillTimer(PLAYER_TEMP[playerid][py_TIMERS][13]);

	new Float:x, Float:y, Float:z;

	switch(CHARACTER_INFO[playerid][ch_STATE])
	{
		case ROLEPLAY_STATE_INTERIOR:
		{
			x = ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_EXT_X];
			y = ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_EXT_Y];
		}
		case ROLEPLAY_STATE_OWN_PROPERTY, ROLEPLAY_STATE_GUEST_PROPERTY:
		{
			x = PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PROPERTY_INDEX] ][property_EXT_X];
			y = PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PROPERTY_INDEX] ][property_EXT_Y];
		}
		default: GetPlayerPos(playerid, x, y, z);
	}
	SetPlayerPoint_GPS_Map(0, playerid, "hud:radar_waypoint", COLOR_WHITE, 5.0, 5.0, x, y);

	if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_GPS_CHECKPOINT]))
	{
		new Float:gps_cp_pos[2];
		Streamer_GetFloatData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_GPS_CHECKPOINT], E_STREAMER_X, gps_cp_pos[0]);
		Streamer_GetFloatData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_GPS_CHECKPOINT], E_STREAMER_Y, gps_cp_pos[1]);
		SetPlayerPoint_GPS_Map(1, playerid, "LD_SPAC:white", 0xaa0000ff, 3.0, 3.0, gps_cp_pos[0], gps_cp_pos[1]);
	}
	else
	{
		if (PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][1] != PlayerText:INVALID_TEXT_DRAW)
		{
			PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][1]);
			PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][1] = PlayerText:INVALID_TEXT_DRAW;
		}
	}

	switch(PLAYER_TEMP[playerid][py_WORKING_IN])
	{
		case WORK_NONE:
		{
			if (PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2] != PlayerText:INVALID_TEXT_DRAW)
			{
				PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2]);
				PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2] = PlayerText:INVALID_TEXT_DRAW;
			}
		}
		case WORK_TRUCK:
		{
			if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]))
			{
				new Float:gps_cp_pos[2];
				Streamer_GetFloatData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT], E_STREAMER_X, gps_cp_pos[0]);
				Streamer_GetFloatData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT], E_STREAMER_Y, gps_cp_pos[1]);
				SetPlayerPoint_GPS_Map(2, playerid, "LD_SPAC:white", 0xaa0000ff, 3.0, 3.0, gps_cp_pos[0], gps_cp_pos[1]);
			}
			else
			{
				if (PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2] != PlayerText:INVALID_TEXT_DRAW)
				{
					PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2]);
					PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2] = PlayerText:INVALID_TEXT_DRAW;
				}
			}
		}
		case WORK_HARVESTER:
		{
			if (IsValidDynamicRaceCP(PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT]))
			{
				new Float:gps_cp_pos[2];
				Streamer_GetFloatData(STREAMER_TYPE_RACE_CP, PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT], E_STREAMER_X, gps_cp_pos[0]);
				Streamer_GetFloatData(STREAMER_TYPE_RACE_CP, PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT], E_STREAMER_Y, gps_cp_pos[1]);
				SetPlayerPoint_GPS_Map(2, playerid, "LD_SPAC:white", 0xaa0000ff, 3.0, 3.0, gps_cp_pos[0], gps_cp_pos[1]);
			}
			else
			{
				if (PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2] != PlayerText:INVALID_TEXT_DRAW)
				{
					PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2]);
					PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2] = PlayerText:INVALID_TEXT_DRAW;
				}
			}
		}
		case WORK_TRASH:
		{
			if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT]))
			{
				new Float:gps_cp_pos[2];
				Streamer_GetFloatData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT], E_STREAMER_X, gps_cp_pos[0]);
				Streamer_GetFloatData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT], E_STREAMER_Y, gps_cp_pos[1]);
				SetPlayerPoint_GPS_Map(2, playerid, "LD_SPAC:white", 0xaa0000ff, 3.0, 3.0, gps_cp_pos[0], gps_cp_pos[1]);
			}
			else
			{
				if (PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2] != PlayerText:INVALID_TEXT_DRAW)
				{
					PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2]);
					PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][2] = PlayerText:INVALID_TEXT_DRAW;
				}
			}
		}
	}

	new cp_counts = 3;
	for(new d = cp_counts; d != MAX_PLAYER_MAP_GPS_POINTS; d ++)
	{
		if (PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][d] != PlayerText:INVALID_TEXT_DRAW)
		{
			PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][d]);
			PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][d] = PlayerText:INVALID_TEXT_DRAW;
		}
	}

	if (cp_counts >= MAX_PLAYER_MAP_GPS_POINTS) return 1;
	switch(PLAYER_TEMP[playerid][py_WORKING_IN])
	{
		case WORK_MECHANIC:
		{
			for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
			{
				if (IsPlayerConnected(i))
				{
					if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
					{
						if (PLAYER_TEMP[i][py_WANT_MECHANIC])
						{
							if (cp_counts >= MAX_PLAYER_MAP_GPS_POINTS) break;

							new Float:player_pos[3];
							switch(CHARACTER_INFO[i][ch_STATE])
							{
								case ROLEPLAY_STATE_INTERIOR:
								{
									player_pos[0] = ENTER_EXIT[ PLAYER_TEMP[i][py_INTERIOR_INDEX] ][ee_EXT_X];
									player_pos[1] = ENTER_EXIT[ PLAYER_TEMP[i][py_INTERIOR_INDEX] ][ee_EXT_Y];
								}
								case ROLEPLAY_STATE_OWN_PROPERTY, ROLEPLAY_STATE_GUEST_PROPERTY:
								{
									player_pos[0] = PROPERTY_INFO[ PLAYER_TEMP[i][py_PROPERTY_INDEX] ][property_EXT_X];
									player_pos[1] = PROPERTY_INFO[ PLAYER_TEMP[i][py_PROPERTY_INDEX] ][property_EXT_Y];
								}
								default: GetPlayerPos(i, player_pos[0], player_pos[1], player_pos[2]);
							}
							SetPlayerPoint_GPS_Map(cp_counts, playerid, "LD_SPAC:white", 0xf4c242FF, 3.0, 3.0, player_pos[0], player_pos[1]);
							cp_counts ++;
						}
					}
				}
			}
		}
	}
	return 1;
}

SetPlayerPoint_GPS_Map(index, playerid, const icon[], color, Float:icon_size_X, Float:icon_size_Y, Float:x, Float:y)
{
	new Float:td_X, Float:td_Y;

	if (x > 3000.0) x = 3000.0;
	else if (x < -3000.0) x = -3000.0;

	if (y > 3000.0) y = 3000.0;
	else if (y < -3000.0) y = -3000.0;

	new
		Float:converted_MAP_SIZE_X = floatdiv(map_td_SIZE_X, 2),
		Float:converted_MAP_SIZE_Y = floatdiv(map_td_SIZE_Y, 2),
		Float:converted_ICON_SIZE_X = floatdiv(icon_size_X, 2),
		Float:converted_ICON_SIZE_Y = floatdiv(icon_size_Y, 2);

	td_X = map_td_X + floatmul(floatdiv(converted_MAP_SIZE_X, 3000), x) + converted_MAP_SIZE_X - converted_ICON_SIZE_X;
	td_Y = map_td_Y + floatmul(floatdiv(-converted_MAP_SIZE_Y, 3000), y) + converted_MAP_SIZE_Y- converted_ICON_SIZE_Y;

	if (PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index] != PlayerText:INVALID_TEXT_DRAW)
	{
		PlayerTextDrawDestroy(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index]);
		PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index] = PlayerText:INVALID_TEXT_DRAW;
	}

	PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index] = CreatePlayerTextDraw(playerid, td_X, td_Y, icon);
	PlayerTextDrawLetterSize(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], 0.160333, 1.280592);
	PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], icon_size_X, icon_size_Y);
	PlayerTextDrawAlignment(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], 1);
	PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], color);
	PlayerTextDrawSetShadow(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], 0);
	PlayerTextDrawSetOutline(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], 0);
	PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], 255);
	PlayerTextDrawFont(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], 4);
	PlayerTextDrawSetProportional(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], 0);
	PlayerTextDrawSetShadow(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index], 0);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PLAYER_GPS_MAP][index]);
	return 1;
}

/*GetIconTextdraw(iconid)
{
	new td_icon[24];

	switch(iconid)
	{
		case 2: td_icon = "hud:radar_centre";
		case 3: td_icon = "hud:arrow";
		case 4: td_icon = "hud:radar_north";
		case 5: td_icon = "hud:radar_airyard";
		case 6: td_icon = "hud:radar_ammugun";
		case 7: td_icon = "hud:radar_barbers";
		case 8: td_icon = "hud:radar_bigsmoke";
		case 9: td_icon = "hud:radar_boatyard";
		case 10: td_icon = "hud:radar_burgershot";
		case 11: td_icon = "hud:radar_bulldozer";
		case 12: td_icon = "hud:radar_catalinapink";
		case 13: td_icon = "hud:radar_cesarviapando";
		case 14: td_icon = "hud:radar_chicken";
		case 15: td_icon = "hud:radar_cj";
		case 16: td_icon = "hud:radar_crash1";
		case 17: td_icon = "hud:radar_diner";
		case 18: td_icon = "hud:radar_emmetgun";
		case 19: td_icon = "hud:radar_enemyattack";
		case 20: td_icon = "hud:radar_fire";
		case 21: td_icon = "hud:radar_girlfriend";
		case 22: td_icon = "hud:radar_hostpital";
		case 23: td_icon = "hud:radar_locosyndicate";
		case 24: td_icon = "hud:radar_maddog";
		case 25: td_icon = "hud:radar_mafiacasino";
		case 26: td_icon = "hud:radar_mcstrap";
		case 27: td_icon = "hud:radar_modgarage";
		case 28: td_icon = "hud:radar_ogloc";
		case 29: td_icon = "hud:radar_pizza";
		case 30: td_icon = "hud:radar_police";
		case 31: td_icon = "hud:radar_propertyg";
		case 32: td_icon = "hud:radar_propertyr";
		case 33: td_icon = "hud:radar_race";
		case 34: td_icon = "hud:radar_ryder";
		case 35: td_icon = "hud:radar_savegame";
		case 36: td_icon = "hud:radar_school";
		case 37: td_icon = "hud:radar_qmark";
		case 38: td_icon = "hud:radar_sweet";
		case 39: td_icon = "hud:radar_tattoo";
		case 40: td_icon = "hud:radar_thetruth";
		case 41: td_icon = "hud:radar_waypoint";
		case 42: td_icon = "hud:radar_toreno";
		case 43: td_icon = "hud:radar_triads";
		case 44: td_icon = "hud:radar_triadscasino";
		case 45: td_icon = "hud:radar_tshirt";
		case 46: td_icon = "hud:radar_woozie";
		case 47: td_icon = "hud:radar_zero";
		case 48: td_icon = "hud:radar_datedisco";
		case 49: td_icon = "hud:radar_datedrink";
		case 50: td_icon = "hud:radar_datefood";
		case 51: td_icon = "hud:radar_truck";
		case 52: td_icon = "hud:radar_cash";
		case 53: td_icon = "hud:radar_flag";
		case 54: td_icon = "hud:radar_gym";
		case 55: td_icon = "hud:radar_impound";
		case 56: td_icon = "hud:radar_light";
		case 57: td_icon = "hud:radar_runway";
		case 58: td_icon = "hud:radar_gangb";
		case 59: td_icon = "hud:radar_gangp";
		case 60: td_icon = "hud:radar_gangy";
		case 61: td_icon = "hud:radar_gangn";
		case 62: td_icon = "hud:radar_gangg";
		case 63: td_icon = "hud:radar_spray";
	}

	return td_icon;
}*/

RegisterNewPlayerWeapon(playerid, weapon_slot)
{
	new DBResult:Result, DB_Query[380];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PLAYER_WEAPONS` (`ID_USER`, `WEAPON_ID`, `AMMO`) VALUES ('%d', '%d', '%d');\
		SELECT MAX(`ID_WEAPON`) FROM `PLAYER_WEAPONS`;\
	",
		ACCOUNT_INFO[playerid][ac_ID], PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_ID], PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_AMMO]
	);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result)) PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_DB_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);
	return 1;
}

GivePlayerWeaponEx(playerid, weapon_id, ammo, color = 0x00F7F7F7, bool:equip = false)
{
	if (PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_ID] == weapon_id) PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_AMMO] += ammo;
	else PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_AMMO] = ammo;

	PLAYER_AC_INFO[playerid][CHEAT_AMMO][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_WEAPON][p_ac_info_IMMUNITY] = gettime() + 3;

	PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_VALID] = true;
	PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_ID] = weapon_id;
	PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_COLOR] = color;

	if (equip)
	{
		ResetPlayerWeapons(playerid);
		GivePlayerWeapon(playerid, weapon_id, ammo);
		SetPlayerArmedWeapon(playerid, weapon_id);
	}

	SavePlayerWeaponsData(playerid);
	return 1;
}

ResetPlayerWeaponsEx(playerid)
{
	new tmp_PLAYER_WEAPONS[enum_PLAYER_WEAPONS];
	for(new i = 0; i != 13; i ++) PLAYER_WEAPONS[playerid][i] = tmp_PLAYER_WEAPONS;

	ResetPlayerWeapons(playerid);
	ResetItemBody(playerid);
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
				new dialog[250];
				format(dialog, sizeof dialog, ""COL_WHITE"Fuiste baneado, raz�n: Usar tazer sin ser policia");
				ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Cerrar", "");
				
				AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, "Usar tazer sin ser policia");

				KickEx(playerid, 500);
				PLAYER_MISC[playerid][MISC_BANS] ++;
				SavePlayerMisc(playerid);

				new str[144];
				format(str, 144, "[ADMIN] NeuroAdmin bane� a %s (%d): Usar tazer sin ser policia.", ACCOUNT_INFO[playerid][ac_NAME], playerid);
				SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);

				new webhook[144];
				format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
				SendDiscordWebhook(webhook, 1);
			}
		}
	}

	new string[200];
	if (weaponid != 38 && weaponid > 18 && weaponid < 34 && hittype == 1)
	{
		if (weaponid != 29 && weaponid != 30 && weaponid != 31)
		{
			new Float:cood[6], Float:DistantaAim, armaaim[128];
			GetPlayerPos(hitid, cood[0], cood[1], cood[2]);
			DistantaAim = GetPlayerDistanceFromPoint(playerid, cood[0], cood[1], cood[2]);
			GetWeaponName(weaponid, armaaim, sizeof(armaaim));

			if (GetPlayerTargetPlayer(playerid) == INVALID_PLAYER_ID && DistantaAim > 1 && DistantaAim < 31 && PLAYER_TEMP[playerid][py_AIM_DATA] == 1)
			{
				PLAYER_TEMP[playerid][py_SILENT_AIM_COUNT] ++;
				if (PLAYER_TEMP[playerid][py_SILENT_AIM_COUNT] >= 10)
				{
					PLAYER_TEMP[playerid][py_SILENT_AIM_COUNT] = 0;
					PLAYER_TEMP[playerid][py_AIMBOT_COUNT] ++;
					format(string, sizeof(string), "[ANTI-CHEAT] %s (%d): posible uso de Silent Aim con: %s (Distancia: %i mts)", ACCOUNT_INFO[playerid][ac_NAME], playerid, armaaim, floatround(DistantaAim));
					SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
					SendDiscordWebhook(string, 1);
				}
				return 1;
			}

			GetPlayerLastShotVectors(playerid, cood[0],cood[1],cood[2], cood[3],cood[4],cood[5]);

			if (!IsPlayerInRangeOfPoint(hitid, 3.0, cood[3],cood[4],cood[5]))
			{
				PLAYER_TEMP[playerid][py_PRO_AIM_COUNT] ++;
				if (PLAYER_TEMP[playerid][py_PRO_AIM_COUNT] >= 5)
				{
					PLAYER_TEMP[playerid][py_PRO_AIM_COUNT] = 0;
					PLAYER_TEMP[playerid][py_AIMBOT_COUNT] ++;
					format(string, sizeof(string), "[ANTI-CHEAT] %s (%d): posible uso de ProAim con: %s (Distancia: %i mts)", ACCOUNT_INFO[playerid][ac_NAME], playerid, armaaim, floatround(DistantaAim));
					SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
					SendDiscordWebhook(string, 1);
				}
			}

			/*if (PLAYER_TEMP[playerid][py_AIMBOT_COUNT] >= 3)
			{
				PLAYER_TEMP[playerid][py_AIMBOT_COUNT] = 0;

				new str_text[144];
		    	format(str_text, sizeof(str_text), "[ANTI-CHEAT] Kick sobre %s (%d): Aimbot (proaim count: %d, silentaim count: %d)", ACCOUNT_INFO[playerid][ac_NAME], playerid, PLAYER_TEMP[playerid][py_PRO_AIM_COUNT], PLAYER_TEMP[playerid][py_SILENT_AIM_COUNT]);
		    	SendMessageToAdminsAC(COLOR_ANTICHEAT, str_text);
				SendDiscordWebhook(str_text, 1);
				SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Sospecha de Aimbot");
				KickEx(playerid, 500);
			}*/
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

		if (ACCOUNT_INFO[playerid][ac_LEVEL] == 1)
		{
			SendClientMessage(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado por disparar siendo nivel 1.");
			TogglePlayerControllableEx(playerid, false);
			KickEx(playerid, 500);
		}

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
		KickEx(playerid, 500);
	}*/

	if (PLAYER_TEMP[playerid][py_EXPLOSION_BULLET] == true)
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

OnCheatDetected(playerid, ip_address[], type, code)
{
	#pragma unused ip_address, type

	if (PLAYER_TEMP[playerid][py_KICKED]) return 1;

	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
	{
		if (code == 47)
		{
			AddPlayerBan(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_IP], 11, TYPE_BAN, "Crasher de retrasado");
			Kick(playerid);
			return 1;
		}

		new ac_message[144];
		format(ac_message, sizeof(ac_message), "[ANTI-CHEAT] Kick sobre %s (%d): Cheats (#%03d).", PLAYER_TEMP[playerid][py_NAME], playerid, code);
		SendMessageToAdminsAC(COLOR_ANTICHEAT, ac_message);
		SendDiscordWebhook(ac_message, 1);

		SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats (#%03d)", code);
		TogglePlayerControllableEx(playerid, false);
		KickEx(playerid, 500);
	}
	return 1;
}

OnPlayerCheatDetected(playerid, cheat, Float:extra = 0.0)
{
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
			AddPlayerBadHistory(ACCOUNT_INFO[playerid][ac_ID], COLOR_WHITE, TYPE_KICK, bad_history);

			if (extra != 0.0) format(ac_message, sizeof ac_message, "[ANTI-CHEAT] Kick sobre %s (%d): %s (cd: %02d, ps: %02d, ping: %d, dec: %d:%d, extra: %.1f)", ACCOUNT_INFO[playerid][ac_NAME], playerid, ac_Info[cheat][ac_Name], cheat, player_state, GetPlayerPing(playerid), PLAYER_AC_INFO[playerid][cheat][p_ac_info_DETECTIONS], ac_Info[cheat][ac_Interval], extra);
			else format(ac_message, sizeof ac_message, "[ANTI-CHEAT] Kick sobre %s (%d): %s (cd: %02d, ps: %02d, ping: %d, dec: %d:%d)", ACCOUNT_INFO[playerid][ac_NAME], playerid, ac_Info[cheat][ac_Name], cheat, player_state, GetPlayerPing(playerid), PLAYER_AC_INFO[playerid][cheat][p_ac_info_DETECTIONS], ac_Info[cheat][ac_Interval]);

			SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Raz�n: Cheats (%s)", ac_Info[cheat][ac_Name]);
			TogglePlayerControllableEx(playerid, false);
			KickEx(playerid, 500);

			if (cheat == CHEAT_PLAYER_HEALTH) CHARACTER_INFO[playerid][ch_HEALTH] = 20.0;
			if (cheat == CHEAT_PLAYER_ARMOUR) CHARACTER_INFO[playerid][ch_ARMOUR] = 0.0;
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

		if ( PLAYER_AC_INFO[playerid][CHEAT_JETPACK][p_ac_info_DETECTIONS] > 3)
		{
			format(ac_message, sizeof ac_message, "[ANTI-CHEAT] Kick sobre %s (%d): Max AC Adv (cd: %02d, ps: %02d, ping: %d, dec: %d:%d)", ACCOUNT_INFO[playerid][ac_NAME], playerid, player_state, GetPlayerPing(playerid), PLAYER_AC_INFO[playerid][cheat][p_ac_info_DETECTIONS], ac_Info[cheat][ac_Interval]);
			SendMessageToAdminsAC(COLOR_ANTICHEAT, ac_message);
			
			SendClientMessage(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado por sobrepasar cantidad m�xima de advertencias del anti-cheat.");
			KickEx(playerid, 500);
		}
	}

	return 1;
}

SavePlayerWeaponsData(playerid)
{
  	if (!PLAYER_TEMP[playerid][py_USER_EXIT] || !PLAYER_TEMP[playerid][py_USER_LOGGED]) return 0;
  	
  	for(new i = 0; i != 13; i ++)
  	{
    	if (!PLAYER_WEAPONS[playerid][i][player_weapon_DB_ID]) continue;

    	new DB_Query[128];
    	format(DB_Query, sizeof(DB_Query), "UPDATE `PLAYER_WEAPONS` SET `WEAPON_ID` = '%d', `AMMO` = '%d' WHERE `ID_WEAPON` = '%d';", PLAYER_WEAPONS[playerid][i][player_weapon_ID], PLAYER_WEAPONS[playerid][i][player_weapon_AMMO], PLAYER_WEAPONS[playerid][i][player_weapon_DB_ID]);
    	db_free_result(db_query(Database, DB_Query));
  	}
  	return 1;
}

LoadPlayerWeaponsData(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[90];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_WEAPONS` WHERE `ID_USER` = '%d' LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], 13);
	Result = db_query(Database, DB_Query);

	new total;
	for(new i; i < db_num_rows(Result); i++ )
	{
		if (total >= 13)
		{
			printf("[debug]  L�mite superado en array 'PLAYER_WEAPONS' al intentar cargar de la base de datos.");
			break;
		}

		new weapon_id = db_get_field_assoc_int(Result, "WEAPON_ID");

		PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_VALID] = true;
		PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_DB_ID] = db_get_field_assoc_int(Result, "ID_WEAPON");
		PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_ID] = weapon_id;
		PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_AMMO] = db_get_field_assoc_int(Result, "AMMO");
		
		if (PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_AMMO] >= 10000)
			PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_AMMO] = 100;

		total ++;
		db_next_row(Result);
	}
	db_free_result(Result);
	return 1;
}

RemovePlayerSlotWeapon(playerid, slot, bool:db_delete = false)
{
	PLAYER_AC_INFO[playerid][CHEAT_AMMO][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_WEAPON][p_ac_info_IMMUNITY] = gettime() + 3;

	if (db_delete)
	{
		new DB_Query[140];
		format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_WEAPONS` WHERE `ID_USER` = '%d' AND `ID_WEAPON` = '%d';", ACCOUNT_INFO[playerid][ac_ID], PLAYER_WEAPONS[playerid][slot][player_weapon_DB_ID]);
		db_free_result(db_query(Database, DB_Query));
	}

	new current_weapon = GetPlayerWeapon(playerid);
	if (current_weapon == PLAYER_WEAPONS[playerid][slot][player_weapon_ID]) current_weapon = 0;

	PLAYER_WEAPONS[playerid][slot][player_weapon_VALID] = false;
	PLAYER_WEAPONS[playerid][slot][player_weapon_DB_ID] = 0;
	PLAYER_WEAPONS[playerid][slot][player_weapon_ID] = 0;
	PLAYER_WEAPONS[playerid][slot][player_weapon_AMMO] = 0;

	SetPlayerArmedWeapon(playerid, current_weapon);
	SavePlayerWeaponsData(playerid);
	return 1;
}

SetPlayerHealthEx(playerid, Float:health)
{
	PLAYER_AC_INFO[playerid][CHEAT_PLAYER_HEALTH][p_ac_info_IMMUNITY] = gettime() + 3;

	CHARACTER_INFO[playerid][ch_HEALTH] = health;
	Player_SetHealth(playerid, floatround(CHARACTER_INFO[playerid][ch_HEALTH]));
	return 1;
}

SetPlayerArmourEx(playerid, Float:armour)
{
	PLAYER_AC_INFO[playerid][CHEAT_PLAYER_ARMOUR][p_ac_info_IMMUNITY] = gettime() + 3;

	CHARACTER_INFO[playerid][ch_ARMOUR] = armour;
	Player_SetArmour(playerid, floatround(CHARACTER_INFO[playerid][ch_ARMOUR]));
	return 1;
}

GivePlayerHealthEx(playerid, Float:health)
{
	PLAYER_AC_INFO[playerid][CHEAT_PLAYER_HEALTH][p_ac_info_IMMUNITY] = gettime() + 3;

	CHARACTER_INFO[playerid][ch_HEALTH] += health;
	if (CHARACTER_INFO[playerid][ch_HEALTH] > 100.0) CHARACTER_INFO[playerid][ch_HEALTH] = 100.0;
	Player_SetHealth(playerid, floatround(CHARACTER_INFO[playerid][ch_HEALTH]));
	return 1;
}

TransferPlayerWeapon(from_playerid, slot, to_playerid)
{
	new DB_Query[130];
	format(DB_Query, sizeof(DB_Query), "UPDATE `PLAYER_WEAPONS` SET `ID_USER` = '%d' WHERE `ID_WEAPON` = '%d';", ACCOUNT_INFO[to_playerid][ac_ID], PLAYER_WEAPONS[from_playerid][slot][player_weapon_DB_ID]);
	db_free_result(db_query(Database, DB_Query));

	PLAYER_WEAPONS[to_playerid][slot][player_weapon_VALID] = true;
	PLAYER_WEAPONS[to_playerid][slot][player_weapon_DB_ID] = PLAYER_WEAPONS[from_playerid][slot][player_weapon_DB_ID];
	PLAYER_WEAPONS[to_playerid][slot][player_weapon_ID] = PLAYER_WEAPONS[from_playerid][slot][player_weapon_ID];
	PLAYER_WEAPONS[to_playerid][slot][player_weapon_AMMO] = PLAYER_WEAPONS[from_playerid][slot][player_weapon_AMMO];
	//SetWeaponsForPlayer(to_playerid);

	RemovePlayerSlotWeapon(from_playerid, slot);
	return 1;
}

PlayerPayday(playerid)
{
	if (IsPlayerPaused(playerid)) return 0;
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	
	//GivePlayerReputation(playerid);

	new 
		str_payday[364],
		str_temp[64],
		total_secures_vehicles,
		total_secures_property,
		money = 300 * ACCOUNT_INFO[playerid][ac_LEVEL];

	if (money > 4500) money = 4500;
	money += minrand(100, 200);


	for(new i = 0; i < MAX_CLUBS; i++)
	{
		if (CLUBS_INFO[i][club_USER_ID] == ACCOUNT_INFO[playerid][ac_ID])
		{
			CLUBS_INFO[i][club_BALANCE] += minrand(2000, 5000);

			new DB_Query[164];
			format(DB_Query, sizeof(DB_Query), "\
				UPDATE `CLUB_INFO` SET\
					`BALANCE` = '%d' \
				WHERE `ID` = '%d';\
			", CLUBS_INFO[i][club_BALANCE], CLUBS_INFO[i][club_ID]);
			db_free_result(db_query(Database, DB_Query));
		}
	}

	format(str_payday, sizeof(str_payday), "~g~Paga de juego~w~~n~General: ~y~%s$~w~", number_format_thousand(money));

	if (ACCOUNT_INFO[playerid][ac_SU] < 2)
	{
		for(new i = 0; i != MAX_VEHICLES; i ++)
		{
			if (!PLAYER_VEHICLES[i][player_vehicle_VALID]) continue;
			if (PLAYER_VEHICLES[i][player_vehicle_OWNER_ID] != ACCOUNT_INFO[playerid][ac_ID]) continue;

			new veh_money = VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_PRICE] / 100;
			money -= veh_money;

			total_secures_vehicles += veh_money;
		}

		for(new i = 0; i != MAX_PROPERTIES; i ++)
		{
			if (!PROPERTY_INFO[i][property_VALID]) continue;
			if (PROPERTY_INFO[i][property_OWNER_ID] != ACCOUNT_INFO[playerid][ac_ID]) continue;

			if (!PROPERTY_INFO[i][property_VIP_LEVEL])
			{
				new property_money = PROPERTY_INFO[i][property_PRICE_BASE] / 200;
				money -= property_money;

				total_secures_property += property_money;
			}
		}
		format(str_temp, sizeof(str_temp), "~n~Veh�culos: ~r~-%s$~w~~n~Propiedades: ~r~-%s$~w~", number_format_thousand(total_secures_vehicles), number_format_thousand(total_secures_property));
		strcat(str_payday, str_temp);
	}

	if (PLAYER_WORKS[playerid][WORK_POLICE])
	{
		new work_payment = (5000 * PLAYER_SKILLS[playerid][WORK_POLICE]);
		money += work_payment;

		format(str_temp, sizeof(str_temp), "~n~SAPD: ~g~%s$~w~", number_format_thousand(work_payment));
		strcat(str_payday, str_temp);
	}

	if (PlayerIsInMafia(playerid))
	{
		new mafia = GetPlayerMafia(playerid);

		new work_payment = (4000 * PLAYER_SKILLS[playerid][mafia]);

		money += work_payment;

		for (new i; i < sizeof(DEALER_INFO); i++)
		{
			if (DEALER_INFO[i][dl_MAFIA] == mafia)
				money += minrand(500, 1000);
		}

		format(str_temp, sizeof(str_temp), "~n~Mafia: ~g~%s$~w~", number_format_thousand(work_payment));
		strcat(str_payday, str_temp);
	}

	if (PLAYER_CREW[playerid][player_crew_VALID] && CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITIS_COUNT] > 0)
	{
		new graffiti_payment = 200 * CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITIS_COUNT];

		money += graffiti_payment;

		format(str_temp, sizeof(str_temp), "~n~Graffitis (%d): ~g~%s$~w~", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITIS_COUNT], number_format_thousand(graffiti_payment));
		strcat(str_payday, str_temp);	
	}

	if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_COUNT] > 0)
	{
		new market_payment = 1000 * CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_COUNT];

		money += market_payment;

		format(str_temp, sizeof(str_temp), "~n~Mercados (%d): ~g~%s$~w~", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_COUNT], number_format_thousand(market_payment));
		strcat(str_payday, str_temp);	
	}

	if (money + CHARACTER_INFO[playerid][ch_CASH] <= 0)
	{
		money = 0;
		CHARACTER_INFO[playerid][ch_CASH] = 0;
	}

	if (ACCOUNT_INFO[playerid][ac_SU] >= 2)
	{
		money += minrand(8000, 15000);
	}

	if (money > 0) format(str_temp, sizeof(str_temp), "~n~RESUMEN: ~g~%s$~w~", number_format_thousand(money));
	else format(str_temp, sizeof(str_temp), "~n~RESUMEN: ~g~%s$~w~", number_format_thousand(money));

	strcat(str_payday, str_temp);

	ShowPlayerNotification(playerid, str_payday, 6, false);
	GivePlayerCash(playerid, money);
	return 1;
}

CMD:no(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No est�s depie.", 3);
	if (IsPlayerJumping(playerid)) return 1;
	
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	ClearAnimations(playerid);

	return 1;
}

CMD:cagar(playerid, params[])
{
	if ((gettime() - PLAYER_TEMP[playerid][py_LIMIT_SHIT]) < 30) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 30 segundos para volver a hacer esto.", 3);

	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No est�s depie.", 3);

	ApplyAnimation(playerid, "ped", "SEAT_down", 4.000000, 0, 1, 1, 1, 0);
	SetTimerEx("StopShitting", 3000, false, "i", playerid);

	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);

	new shit_particle = CreateDynamicObject(18678, x, y, z - 2.8, 0.0, 0.0, 0.0);
	SetTimerEx("DestroyParticleObject", 1000, false, "i", shit_particle);

	SetPlayerChatBubble(playerid, "\n\n\n\n* Se baja los pantalones para cagar.\n\n\n", 0xffcb90FF, 20.0, 5000);
	PLAYER_TEMP[playerid][py_LIMIT_SHIT] = gettime();
	return 1;
}
alias:cagar("defecar")

CMD:parar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED || IsPlayerInAnyVehicle(playerid) || PLAYER_TEMP[playerid][py_CUFFED]) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 0, true);
	ClearAnimations(playerid);

	PLAYER_TEMP[playerid][py_IN_MARKET] = false;
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][41]);

	if (PLAYER_TEMP[playerid][py_SELFIE] == true)
	{
		PLAYER_TEMP[playerid][py_SELFIE] = false;
		TogglePlayerControllableEx(playerid, true);
		SetCameraBehindPlayer(playerid);
		ApplyAnimation(playerid, "PED", "ATM", 4.1, 0, 1, 1, 0, 1, 1);
	}
	return 1;
}

CMD:rendirse(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_HANDSUP); //rendirse
	return 1;
}

CMD:blowjob(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "BLOWJOBZ", "BJ_COUCH_LOOP_W", 4.0, 1, 1, 1, 0, 0);//blowjob
	return 1;
}

CMD:sexo(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /sexo "COL_WHITE"<playerid>");
	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador Desconectado.", 2);

	new Float:x, Float:y, Float:z;
	GetPlayerPos(params[0], x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no est� cerca tuya.", 2);

	new str_text[144];
	format(str_text, sizeof(str_text), "* %s le hace sexo oral a %s.", PLAYER_TEMP[playerid][py_RP_NAME], PLAYER_TEMP[params[0]][py_RP_NAME]);
	ProxDetector(playerid, 15.0, str_text, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 85);

	ApplyAnimation(playerid, "BLOWJOBZ", "BJ_COUCH_LOOP_W", 4.0, 1, 1, 1, 0, 0);
	return 1;
}

CMD:rodar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid,"PED","BIKE_fallR",4.0,0,1,1,1,0);
	return 1;
}

CMD:borracho(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid,"PED", "WALK_DRUNK",4.0,1,1,1,1,500);//borracho
	return 1;
}

CMD:bomba(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0,0);//bomba
	return 1;
}

CMD:apuntar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation( playerid,"ped", "ARRESTgun", 4.0, 0, 1, 1, 1,500);
	return 1;
}

CMD:reir(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid, "RAPPING", "Laugh_01", 4.0, 0, 0, 0, 0, 0);//reir
	return 1;
}

CMD:amenazar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid, "SHOP", "ROB_Loop_Threat", 4.0, 0, 0, 0, 1, 500);//amenazar
	return 1;
}

CMD:paja(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "PAULNMAC", "wank_loop", 4.0, 1, 0, 0, 1, 0);
	return 1;
}

CMD:herido(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "SWEET", "LaFin_Sweet", 4.0, 0, 1, 1, 1, 0);
	return 1;
}

CMD:cruzarbrazos(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, 1, 1, 1, 0, 4000);
	return 1;
}

CMD:recostarse(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid,"SUNBATHE", "Lay_Bac_in", 4.0, 0, 0, 0, 1, 0);//recostarse
	return 1;
}

CMD:cubrirse(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid, "ped", "cower", 4.0, 1, 0, 0, 0, 0);//crubrirse
	return 1;
}

CMD:vomitar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid, "FOOD", "EAT_Vomit_P", 3.0, 0, 0, 0, 0, 0);//vomitar
	return 1;
}

CMD:comer(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.00, 0, 0, 0, 0, 0);
	return 1;
}

CMD:despedir(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "KISSING", "BD_GF_Wave", 3.0, 0, 0, 0, 0, 0);//despedir
	return 1;
}

CMD:nalgada(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "SWEET", "sweet_ass_slap", 4.0, 0, 0, 0, 0, 0);//nalgada
	return 1;
}

CMD:agonizar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "WUZI", "CS_Dead_Guy", 4.0, 0, 0, 0, 1, 0);//agonizar
	return 1;
}

CMD:besar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "KISSING", "Playa_Kiss_02", 4.0, 0, 0, 0, 0, 0);//besar
	return 1;
}

CMD:crack(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 0, 0, 0, 1, 0);//crack
	return 1;
}

CMD:mear(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    SetPlayerSpecialAction(playerid, 68);//mear
	return 1;
}

CMD:sentarse(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid, "SUNBATHE", "ParkSit_M_in", 4.000000, 0, 1, 1, 1, 0);//sentarse
	return 1;
}

CMD:asiento(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid, "ped", "SEAT_down", 4.000000, 0, 1, 1, 1, 0);
	return 1;
}

CMD:fucku(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation( playerid,"ped", "fucku", 4.0, 0, 1, 1, 1, 1 );//fucku
	return 1;
}

CMD:taichi(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "PARK", "Tai_Chi_Loop",  4.1,7,5,1,1,1);//taichi
	return 1;
}

CMD:beber(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "BAR", "dnk_stndM_loop", 4.0, 0, 1, 1, 0, 4000);//beber
	return 1;
}

CMD:boxear(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid, "GYMNASIUM", "gym_shadowbox",  4.1,7,5,1,1,1);//boxear
	return 1;
}

CMD:saludar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	if (sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /saludar "COL_WHITE"<playerid>");
	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador Desconectado.", 2);

	new Float:x, Float:y, Float:z;
	GetPlayerPos(params[0], x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 30.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no est� cerca tuya.", 2);

	new str_text[144];
	format(str_text, sizeof(str_text), "* %s saluda a %s.", PLAYER_TEMP[playerid][py_RP_NAME], PLAYER_TEMP[params[0]][py_RP_NAME]);
	ProxDetector(playerid, 15.0, str_text, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 85);

	ApplyAnimation(playerid,"GANGS", "hndshkfa_swt", 4.1, 0, 0, 0, 0, 0); //saludar
	return 1;
}

CMD:llorar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid,"GRAVEYARD","mrnF_loop",4.1,0,0,0,0,0);//llorar
	return 1;
}

CMD:rapear(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid,"RAPPING","RAP_B_Loop",4.0,1,0,0,0,8000);//rapear
	return 1;
}

CMD:astrip(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid,"STRIP","strip_A",4.1,7,5,1,1,1);//strip
	return 1;
}

CMD:bailar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    if (sscanf(params, "d", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /bailar [1-4]");

	switch(params[0])
	{
	    case 1: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
		case 2: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
		case 3: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
		case 4: SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE4);
		default: SendClientMessage(playerid, COLOR_WHITE, "Syntax: /bailar [1-4]");
	}
	return 1;
}

CMD:alentar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	ApplyAnimation(playerid,"ON_LOOKERS","shout_02",4.1,7,5,1,1,1);//alentar
	return 1;
}

CMD:hablar(playerid, params[])
{
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
    ApplyAnimation(playerid,"PED","IDLE_chat",4.1,7,5,1,1,1);//hablar
	return 1;
}

/*GetPlayerVehicleAvaibleBootSlot(vehicleid)
{
	new max_slots = VEHICLE_INFO[GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400][vehicle_info_BOOT_SLOTS];
	if (max_slots > MAX_BOOT_SLOTS) max_slots = MAX_BOOT_SLOTS;

	for(new i = 0; i != max_slots; i ++)
	{
		if (!VEHICLE_BOOT[vehicleid][i][vehicle_boot_VALID]) return i;
	}
	return -1;
}

SavePlayerWeaponInVehicleBoot(playerid, weapon_slot, vehicleid, boot_slot)
{
	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_ID]) return 0;

	VEHICLE_BOOT[vehicleid][boot_slot][vehicle_boot_VALID] = true;
	VEHICLE_BOOT[vehicleid][boot_slot][vehicle_boot_TYPE] = BOOT_TYPE_WEAPON;
	VEHICLE_BOOT[vehicleid][boot_slot][vehicle_boot_INT] = PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_ID];
	VEHICLE_BOOT[vehicleid][boot_slot][vehicle_boot_INT_EXTRA] = PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_AMMO];

	new DBResult:Result, DB_Query[256];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `VEHICLE_BOOT`\
		(\
			`ID_VEHICLE`, `TYPE`, `INT`, `INT_EXTRA`\
		)\
		VALUES\
		(\
			'%d', '%d', '%d', '%d'\
		);\
		SELECT MAX(`ID_OBJECT`) FROM `VEHICLE_BOOT`;\
	",
		PLAYER_VEHICLES[vehicleid][player_vehicle_ID], VEHICLE_BOOT[vehicleid][boot_slot][vehicle_boot_TYPE], VEHICLE_BOOT[vehicleid][boot_slot][vehicle_boot_INT], VEHICLE_BOOT[vehicleid][boot_slot][vehicle_boot_INT_EXTRA]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result)) VEHICLE_BOOT[vehicleid][boot_slot][vehicle_boot_OBJECT_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);

	RemovePlayerSlotWeapon(playerid, weapon_slot, true);
	return 1;
}

CMD:guardar(playerid, params[])
{
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No est�s depie.", 3);

	new option[24], extra;
	if (sscanf(params, "s[24]d", option, extra)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /guardar arma "COL_WHITE"[slot]");

	if (!strcmp(option, "arma", true))
	{
		if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
		{
			if (extra < 0 || extra > 12) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /guardar arma "COL_WHITE"[slot]");
			if (!PLAYER_WEAPONS[playerid][extra][player_weapon_VALID])
			{
				PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
				ShowPlayerMessage(playerid, "~r~No tienes una arma en ese slot.", 3);
				return 1;
			}

			new vehicleid = GetPlayerCameraTargetVehicle(playerid);
			if (vehicleid == INVALID_VEHICLE_ID) return ShowPlayerMessage(playerid, "~r~No est�s cerca de tu veh�culo", 3);

			if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Este no es t� veh�culo.", 3);
			if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~", 3);

			new boot_slot = GetPlayerVehicleAvaibleBootSlot(vehicleid);
			if (boot_slot == -1) return ShowPlayerMessage(playerid, "~r~No tienes suficiente espacio en tu maletero.", 3);

			new str_text[128];
			format(str_text, sizeof(str_text), "%s guardado en el maletero de tu %s.", WEAPON_INFO[ PLAYER_WEAPONS[playerid][extra][player_weapon_ID] ][weapon_info_NAME], VEHICLE_INFO[GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400][vehicle_info_NAME]);
			ShowPlayerNotification(playerid, str_text, 3);
			ResetItemBody(playerid);

			SavePlayerWeaponInVehicleBoot(playerid, extra, vehicleid, boot_slot);
		}
		else ShowPlayerMessage(playerid, "~r~Ahora no puedes usar este comando.", 3);
	}
	else SendClientMessage(playerid, COLOR_WHITE, "Syntax: /guardar arma "COL_WHITE"[slot]");
	return 1;
}*/

CheckAndOpenBoot(playerid, type)
{
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 0;

	new vehicleid = GetPlayerCameraTargetVehicle(playerid);
	if (vehicleid == INVALID_VEHICLE_ID) return 0;
	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return 0;
	if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID] || IsPlayerInKeys(PLAYER_VEHICLES[vehicleid][player_vehicle_ID], ACCOUNT_INFO[playerid][ac_ID]))
	{
		PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] = vehicleid;
		ResetItemBody(playerid);

		switch(type)
		{
			case 0: ShowInventory(playerid, 3); // Sacar
			case 1: ShowInventory(playerid, 4); // Meter
		}
	}
	return 1;
}

CMD:clickslot(playerid, params[])
{
	new slot;
	if (sscanf(params, "d", slot)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /clickslot "COL_WHITE"<slot>");
	if (slot < 0) return 0;
	if (slot > 11) return 0;

	PLAYER_TEMP[playerid][py_INVENTORY_TYPE] = 0;
	ClickInventorySlot(playerid, slot, true);
	return 1;
}

CMD:esposar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres polic�a.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No est�s de servicio como polic�a.", 3);
	if (sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /esposar [ID o nombre]");
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No est�s depie.", 3);

	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador no conectado.", 3);
	new Float:x, Float:y, Float:z; GetPlayerPos(params[0], x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 30.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no est� cerca tuya.", 2);
	if (PLAYER_TEMP[params[0]][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes esposar a este jugador ahora.", 3);
	if (GetPlayerState(params[0]) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~Para esposar a esta persona tiene que estar depie.", 3);
	if (params[0] == playerid) return ShowPlayerMessage(playerid, "~r~No puedes esposarte a ti mismo");
	if (PLAYER_WORKS[params[0]][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~Este jugador es miembro de la polic�a.", 3);

	if (PLAYER_TEMP[params[0]][py_CUFFED])
	{
		TogglePlayerControllableEx(params[0], true);
		PLAYER_TEMP[params[0]][py_CUFFED] = false;
		PLAYER_TEMP[params[0]][py_CUFFING] = false;
		SetPlayerSpecialAction(params[0], SPECIAL_ACTION_NONE);

		SetPlayerChatBubble(playerid, "\n\n\n\n* Le quita las esposas a alguien.\n\n\n", 0xffcb90FF, 20.0, 5000);
		SendPoliceMark(params[0], PLAYER_COLOR);
		return 1;
	}

	if (!PLAYER_TEMP[params[0]][py_CUFFING])
	{
	    ShowPlayerMessage(params[0], "Est�s siendo esposado", 3);
	    ShowPlayerMessage(playerid, "Est�s esposando a esta persona", 3);

	    CHARACTER_INFO[params[0]][ch_STATE] = ROLEPLAY_STATE_NORMAL;
		if (ACCOUNT_INFO[params[0]][ac_SU]) SetPlayerHealthEx(params[0], 50.0);
		else SetPlayerHealthEx(params[0], 25.0);

		DisablePlayerMedicMark(params[0]);

		ApplyAnimation(params[0], "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 0, true);
		ClearAnimations(params[0]);

		PLAYER_TEMP[params[0]][py_CUFFED] = false;
		PLAYER_TEMP[params[0]][py_CUFFING] = true;
		KillTimer(PLAYER_TEMP[params[0]][py_TIMERS][14]);
		TogglePlayerControllableEx(params[0], false);
		SetPlayerSpecialAction(params[0], SPECIAL_ACTION_HANDSUP);
		PLAYER_TEMP[params[0]][py_TIMERS][14] = SetTimerEx("CuffPlayer", 1000, false, "i", params[0]);
		SendPoliceMark(params[0], 0x2DAA24FF);
	}
	return 1;
}

CMD:placa(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres polic�a.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No est�s de servicio como polic�a.", 3);
	if (sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /placa [ID o nombre]");

	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador no conectado.", 3);
	new Float:x, Float:y, Float:z; GetPlayerPos(params[0], x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no est� cerca tuya.", 2);
	if (PLAYER_TEMP[params[0]][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes ense�arle tu placa a este jugador ahora.", 3);

	SetPlayerChatBubble(playerid, "\n\n\n\n* Le ense�a su placa a alguien.\n\n\n", 0xffcb90FF, 20.0, 5000);
	SendClientMessageEx(params[0], COLOR_WHITE, "%s %c. %s "COL_YELLOW"[Placa: %d]", POLICE_RANKS[ PLAYER_SKILLS[playerid][WORK_POLICE] ], PLAYER_TEMP[playerid][py_FIRST_NAME][0], PLAYER_TEMP[playerid][py_SUB_NAME], PLAYER_MISC[playerid][MISC_PLACA_PD]);
	ShowPlayerMessage(playerid, "Has mostrado tu placa", 3);
	return 1;
}

CMD:revisar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres polic�a.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No est�s de servicio como polic�a.", 3);
	if (sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /revisar [ID o nombre]");
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No est�s depie.", 3);

	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador no conectado.", 3);
	new Float:x, Float:y, Float:z; GetPlayerPos(params[0], x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no est� cerca tuya.", 2);
	if (PLAYER_TEMP[params[0]][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes revisar a este jugador ahora.", 3);
	if (GetPlayerState(params[0]) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~Para revisar a esta persona tiene que estar depie.", 3);
	if (!PLAYER_TEMP[params[0]][py_CUFFED]) return ShowPlayerMessage(playerid, "~r~Para revisar a esta persona tiene que estar esposada.", 3);

	ShowPlayerInventory(playerid, params[0]);

	SetPlayerChatBubble(playerid, "\n\n\n\n* Revisa a alguien\n\n\n", 0xffcb90FF, 20.0, 5000);
	return 1;
}
alias:revisar("cachear")

CMD:requisar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres polic�a.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No est�s de servicio como polic�a.", 3);
	if (sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /requisar [ID o nombre]");
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No est�s depie.", 3);

	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador no conectado.", 3);
	new Float:x, Float:y, Float:z; GetPlayerPos(params[0], x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no est� cerca tuya.", 2);
	if (PLAYER_TEMP[params[0]][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes revisar a este jugador ahora.", 3);
	if (GetPlayerState(params[0]) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~Para revisar a esta persona tiene que estar depie.", 3);
	if (!PLAYER_TEMP[params[0]][py_CUFFED]) return ShowPlayerMessage(playerid, "~r~Para revisar a esta persona tiene que estar esposada.", 3);

	DeleteIlegalInv(params[0], true);

	SetPlayerChatBubble(playerid, "\n\n\n\n* Requisa las pertenecias ilegales de alguien.\n\n\n", 0xffcb90FF, 20.0, 5000);
	ShowPlayerMessage(playerid, "Has requisado a este jugador", 3);
	return 1;
}

CMD:ref(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (PLAYER_WORKS[playerid][WORK_POLICE])
	{
		if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No est�s de servicio como polic�a.", 3);

		new city[45], zone[45];
		GetPlayerZones(playerid, city, zone);

		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][43]);

		new message[144];
		format(message, sizeof message, "~b~%s~w~: refuerzos en %s.", PLAYER_TEMP[playerid][py_RP_NAME], zone);
		SendPoliceNotification(message, 4);

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
							SetPlayerMarkerForPlayer(i, playerid, 0x0087ffFF);
						}
					}
	   			}
			}
	 	}

	 	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][38]);
		PLAYER_TEMP[playerid][py_TIMERS][38] = SetTimerEx("DisableRefMark", 120000, false, "i", playerid);
	}
	else ActiveGeolocation(playerid);
	return 1;
}
alias:ref("refuerzos")

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
    format(message, sizeof message, "~r~%s~w~ se perdi� (%s).", PLAYER_TEMP[playerid][py_RP_NAME], zone);
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
    format(message, sizeof message, "~r~%s~w~ se perdi� (%s).", PLAYER_TEMP[playerid][py_RP_NAME], zone);
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
			ShowPlayerMessage(playerid, "~r~No eres polic�a.", 3);
			return 1;
		}
		if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE)
		{
			CancelEdit(playerid);
			ShowPlayerMessage(playerid, "~r~No est�s de servicio como polic�a.", 3);
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
				ShowPlayerMessage(playerid, "~r~No eres polic�a.", 3);
				return 1;
			}
			if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE)
			{
				CancelEdit(playerid);
				ShowPlayerMessage(playerid, "~r~No est�s de servicio como polic�a.", 3);
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

CMD:mafia(playerid, params[])
{
	if (PLAYER_WORKS[playerid][WORK_MAFIA])
	{
		PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
		PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
		ShowDialog(playerid, DIALOG_MAFIA_LIST);
		return 1;
	}
	
	if (PLAYER_WORKS[playerid][WORK_ENEMY_MAFIA])
	{
		PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
		PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
		ShowDialog(playerid, DIALOG_ENEMY_MAFIA_LIST);
		return 1;
	}

	if (PLAYER_WORKS[playerid][WORK_OSBORN])
	{
		PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
		PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
		ShowDialog(playerid, DIALOG_OSBORN_MAFIA_LIST);
		return 1;
	}

	if (PLAYER_WORKS[playerid][WORK_CONNOR])
	{
		PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
		PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
		ShowDialog(playerid, DIALOG_CONNOR_MAFIA_LIST);
		return 1;
	}

	if (PLAYER_WORKS[playerid][WORK_DIVISO])
	{
		PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
		PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
		ShowDialog(playerid, DIALOG_DIVISO_MAFIA_LIST);
		return 1;
	}
	
	ShowPlayerMessage(playerid, "~r~No eres mafioso.", 3);
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

JailPlayer(playerid, seconds = 300)
{
	PLAYER_TEMP[playerid][py_CLUB_INDEX] = -1;
	ResetItemBody(playerid);

    CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_JAIL;
    CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] = seconds;

    PLAYER_TEMP[playerid][py_ENTER_JAIL_TIME] = gettime();
    SetPlayerPosEx(playerid, JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID] ][jail_X], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_Y], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_Z], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_ANGLE], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_INTERIOR], 0, true);

    KillTimer(PLAYER_TEMP[playerid][py_TIMERS][15]);
    PLAYER_TEMP[playerid][py_TIMERS][15] = SetTimerEx("UnjailPlayer", CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] * 1000, false, "i", playerid);

    new time = CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] - (gettime() - PLAYER_TEMP[playerid][py_ENTER_JAIL_TIME]);
    
    new str_text[128];
	format(str_text, sizeof(str_text), "~r~Encarcelado~w~~n~%s minutos.", TimeConvert(time));
	ShowPlayerMessage(playerid, str_text, 1);

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][38]);
	PLAYER_TEMP[playerid][py_TIMERS][38] = SetTimerEx("SavePrisionTime", 60000, true, "i", playerid);

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][39]);
	PLAYER_TEMP[playerid][py_TIMERS][39] = SetTimerEx("UpdatePrisionTime", 1000, true, "i", playerid);

    ResetPlayerWeaponsEx(playerid);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
    TogglePlayerControllableEx(playerid, false);
    SetPlayerPoliceSearchLevel(playerid, 0);
    SendPoliceMark(playerid, PLAYER_COLOR);
    SetPlayerColorEx(playerid, PLAYER_COLOR);
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

ShowPlayerStats(playerid, pid)
{
	if (!IsPlayerConnected(pid)) return 0;
	if (ACCOUNT_INFO[pid][ac_ID] == 0) return 0;

	ACCOUNT_INFO[pid][ac_TIME_PLAYING] += gettime() - PLAYER_TEMP[pid][py_TIME_PLAYING];
	PLAYER_TEMP[pid][py_TIME_PLAYING] = gettime();

	new Float:hours;
	ConvertTime_SecondsToHoursFloat(ACCOUNT_INFO[pid][ac_TIME_PLAYING], hours);

	new next_rep[24], neccessary_rep = ACCOUNT_INFO[pid][ac_LEVEL] * REP_MULTIPLIER;
	if (ACCOUNT_INFO[pid][ac_REP] < neccessary_rep)
	{
		new time = (ACCOUNT_INFO[pid][ac_TIME_FOR_REP] - (gettime() * 1000 - PLAYER_TEMP[pid][py_TIME_PASSED_LAST_REP])) / 1000;
		if (time < 3) time = 3;

		format(next_rep, sizeof next_rep, "%sm", TimeConvert(time));
	}
	else format(next_rep, sizeof next_rep, "/comprarnivel");

	new caption[48], dialog[600 + (27 * sizeof(work_info))];
	format(caption, sizeof caption, ""COL_RED"%s", PLAYER_TEMP[pid][py_RP_NAME]);

	new
		drive[3],
		dni[64]
	;

	if (PLAYER_MISC[playerid][MISC_DRIVE] != 0) drive = "Si";
	else drive = "No";

	if (PLAYER_MISC[playerid][MISC_DNI]) format(dni, sizeof(dni), "%d", PLAYER_MISC[playerid][MISC_DNI]);
	else dni = "No";

	format(dialog, sizeof dialog,

		"\
		"COL_WHITE"  ID de cuenta: "COL_RED"%d\n\
		"COL_WHITE"  Fecha de registro: "COL_RED"%s\n\
		"COL_WHITE"  Tiempo jugando: "COL_GREEN"%.1f horas\n\
		"COL_WHITE"  Nivel: "COL_YELLOW"%d\n\
		"COL_WHITE"  Reputaci�n: "COL_ORANGE"%d/%d\n\
		"COL_WHITE"  Siguiente reputaci�n: "COL_ORANGE"%s\n\
		"COL_WHITE"  Banda: "COL_RED"%s\n\
		"COL_WHITE"  Trabajo: "COL_GREEN"%s\n\
		"COL_WHITE"  "SERVER_COIN": "COL_GREEN"%d\n\
	    "COL_WHITE"  Muteos: "COL_RED"%d\n\
	    "COL_WHITE"  Kicks: "COL_RED"%d\n\
	    "COL_WHITE"  Baneos: "COL_RED"%d\n\
	    "COL_WHITE"  Advertencias: "COL_RED"%d\n\
	    "COL_WHITE"  Jails: "COL_RED"%d\n\
	    "COL_WHITE"  Dudas enviadas: "COL_GREEN"%d\n\
		"COL_WHITE"  VIP: "COL_YELLOW"%s\n\
		"COL_WHITE"  DNI: %s\n\
		"COL_WHITE"  Licencia de conducir: %s\n\
		"COL_WHITE"  Estado social: %s",

			ACCOUNT_INFO[pid][ac_ID],
			ACCOUNT_INFO[pid][reg_DATE],
			hours,
			ACCOUNT_INFO[pid][ac_LEVEL],
			ACCOUNT_INFO[pid][ac_REP], neccessary_rep,
			next_rep,
			getPlayerCrew(pid),
			getPlayerWorks(pid),
			ACCOUNT_INFO[pid][ac_SD],
			PLAYER_MISC[pid][MISC_MUTES],
			PLAYER_MISC[pid][MISC_KICKS],
			PLAYER_MISC[pid][MISC_BANS],
			PLAYER_MISC[pid][MISC_SANS],
			PLAYER_MISC[pid][MISC_JAILS],
			PLAYER_MISC[pid][MISC_DOUBT_SENT],
			getPlayerVip(pid),
			dni,
			drive,
			GetAccountStatusName(playerid)
	);

	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, caption, dialog, "Cerrar", "");
	return 1;
}

getCrewIndexWithId(id)
{
	for(new i = 0; i < sizeof(CREW_INFO); i ++)
	{
		if (CREW_INFO[i][crew_ID] == id) return i;
	}
	return 0;
}

getPlayerCrew(playerid)
{
	new crew[32];
	if (!PLAYER_CREW[playerid][player_crew_VALID]) crew = "ninguna";
	else format(crew, sizeof crew, "%s", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
	return crew;
}

getPlayerCrewColor(playerid)
{
    return !PLAYER_CREW[playerid][player_crew_VALID] ? -1 : CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR];
}

getPlayerVip(playerid)
{
	new vip[16];
	if (!ACCOUNT_INFO[playerid][ac_SU]) vip = "No";
	else if (ACCOUNT_INFO[playerid][ac_SU] == 1) vip = "Classic";
	else if (ACCOUNT_INFO[playerid][ac_SU] >= 2) vip = "Turbo";
	return vip;
}

AddPlayerBadHistory(account_id, by_account_id, type, const text[])
{
	new DB_Query[266];
	format(DB_Query, sizeof DB_Query, "INSERT INTO `BAD_HISTORY` (`ID_USER`, `TYPE`, `BY`, `TEXT`) VALUES('%d', '%d', '%d', '%q');", account_id, type, by_account_id, text);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

AddPlayerBan(account_id, account_name[], account_ip[], by_account_id, type, const text[], days = 0, mod[] = "day", const account_gpci[] = "NULL")
{
	new DB_Query[450];

	if (!days)
	{
		format(DB_Query, sizeof DB_Query,

			"\
			INSERT INTO `BAD_HISTORY` (`ID_USER`, `TYPE`, `BY`, `TEXT`) VALUES('%d', '%d', '%d', '%q');\
			INSERT INTO `BANS` (`NAME`, `IP`, `GPCI`, `ID_HISTORY`, `EXPIRE_DATE`) SELECT '%q', '%q', '%q', MAX(`ID`), '0' FROM `BAD_HISTORY`;\
			",

				account_id, type, by_account_id, text,
				account_name, account_ip, account_gpci

		);
	}
	else
	{
		format(DB_Query, sizeof DB_Query,

			"\
			INSERT INTO `BAD_HISTORY` (`ID_USER`, `TYPE`, `BY`, `TEXT`) VALUES('%d', '%d', '%d', '%q');\
			INSERT INTO `BANS` (`NAME`, `IP`, `GPCI`, `ID_HISTORY`, `EXPIRE_DATE`) SELECT '%q', '%q', '%q', MAX(`ID`), DATETIME('NOW', '+%d %s') FROM `BAD_HISTORY`;\
			",

				account_id, type, by_account_id, text,
				account_name, account_ip, account_gpci, days, mod

		);
	}

	safe_db_query(DB_Query);
	return 1;
}

// Comandos admins
CMD:reportar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_REPORT_MUTE]) return SendClientMessageEx(playerid, COLOR_ORANGE, "[Alerta]"COL_WHITE" Te encuentras bloqueado de esta opci�n.");
	if ((gettime() - PLAYER_TEMP[playerid][py_ANTIFLOOD_REPORT]) < 60) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 60 segundos para volver a reportar.", 3);
	PLAYER_TEMP[playerid][py_ANTIFLOOD_REPORT] = gettime();

	new reason[128];
	if (sscanf(params, "us[128]", params[0], reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /reportar "COL_WHITE"[ID o nombre] [Raz�n]");
    if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);

	ShowPlayerMessage(playerid, "~g~Tu reporte fue enviado a los administradores en l�nea.", 3);

	new str[144];
	format(str, 144, "[REPORTE]"COL_WHITE" %s (%d) > %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, PLAYER_TEMP[params[0]][py_NAME], params[0], reason);
	SendMessageToAdmins(COLOR_ORANGE, str);
	Log("reports", str);

	new DCC_Channel:channelid;
	channelid = DCC_FindChannelById("790742732829491230");
	SendDiscordMessage(channelid, "[REPORTE] %s (%d) > %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, PLAYER_TEMP[params[0]][py_NAME], params[0], reason);

	PLAYER_TEMP[ params[0] ][py_TOTAL_REPORTS] ++;
	return 1;
}
alias:reportar("re", "report")

CMD:r(playerid, params[])
{
	new message[128];
	if (sscanf(params, "s[128]", message)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /r "COL_WHITE"[MENSAJE]");

	if (PLAYER_TEMP[playerid][py_ADMIN_PM_PID] == INVALID_PLAYER_ID || !PLAYER_TEMP[playerid][py_ADMIN_PM_AID]) 
		return ShowPlayerMessage(playerid, "~r~Nada que responder.", 3);
	
	if (ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_ADMIN_PM_PID] ][ac_ID] != PLAYER_TEMP[playerid][py_ADMIN_PM_AID])
	{
		PLAYER_TEMP[playerid][py_ADMIN_PM_PID] = INVALID_PLAYER_ID;
		PLAYER_TEMP[playerid][py_ADMIN_PM_AID] = 0;
		PLAYER_TEMP[playerid][py_ADMIN_PM_TIME] = 0;
		ShowPlayerMessage(playerid, "~r~El administrador que te envi� el mensaje est� desconectado.", 3);
		return 1;
	}
	if (gettime() > PLAYER_TEMP[playerid][py_ADMIN_PM_TIME] + 60)
	{
		PLAYER_TEMP[playerid][py_ADMIN_PM_PID] = INVALID_PLAYER_ID;
		PLAYER_TEMP[playerid][py_ADMIN_PM_AID] = 0;
		PLAYER_TEMP[playerid][py_ADMIN_PM_TIME] = 0;
		ShowPlayerMessage(playerid, "~r~Tardaste mucho en responder.", 3);
		return 1;
	}

	SendClientMessageEx(PLAYER_TEMP[playerid][py_ADMIN_PM_PID], COLOR_WHITE, "{5CCE3D}>"COL_WHITE" Respuesta de %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, message);
	ShowPlayerMessage(playerid, "Tu mensaje ha sido enviado al administrador.", 2);
	PLAYER_TEMP[playerid][py_ADMIN_PM_PID] = INVALID_PLAYER_ID;
	PLAYER_TEMP[playerid][py_ADMIN_PM_AID] = 0;
	PLAYER_TEMP[playerid][py_ADMIN_PM_TIME] = 0;
	return 1;
}

CMD:id(playerid, params[])
{
	new to_player;
	if (sscanf(params, "u", to_player))
	{
		to_player = playerid;
		SendClientMessage(playerid, COLOR_WHITE, "Recuerde que tambi�n puede usar: /id "COL_WHITE"[ID o nombre]");
	}
	if (!IsPlayerConnected(to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Jugador desconectado.");

	new
		player_version[32],
		acid,
		ping
	;

	GetPlayerVersion(to_player, player_version, sizeof player_version);

	if (ACCOUNT_INFO[to_player][ac_ID] == 0) acid = minrand(10000, 25000);
	else acid = ACCOUNT_INFO[to_player][ac_ID];

	if (GetPlayerPing(to_player) < 80) ping = minrand(100, 300);
	else ping = GetPlayerPing(to_player);

	SendClientMessageEx(playerid, COLOR_RED, "� "COL_WHITE"Nombre: %s (%d) [Nivel %d] "COL_RED"|"COL_WHITE" ID de cuenta: %d",
		PLAYER_TEMP[to_player][py_NAME],
		to_player,
		GetPlayerScore(to_player),
		acid
	);
	
	SendClientMessageEx(playerid, COLOR_RED, "� "COL_WHITE"Versi�n: %s "COL_RED"|"COL_WHITE" PacketLoss: %.2f "COL_RED"|"COL_WHITE" Ping: %d",
		player_version,
		NetStats_PacketLossPercent(to_player),
		ping
	);
	return 1;
}

CMD:localizar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	ShowDialog(playerid, DIALOG_PLAYER_GPS_VEHICLES);
	return 1;
}

CMD:hora(playerid, params[])
{
	new time[6];
	gettime(time[0], time[1], time[2]);
	getdate(time[3], time[4], time[5]);

	SendClientMessageEx(playerid, COLOR_RED, "� "COL_WHITE"Hora: %02d:%02d:%02d "COL_RED"|"COL_WHITE" Fecha: %02d/%02d/%d",
		time[0], time[1], time[2],
		time[3], time[4], time[5]
	);
	return 1;
}
alias:hora("fecha")

CMD:clearchat(playerid, params[])
{
	ClearPlayerChatBox(playerid);
	return 1;
}

DeletePlayerJobs(playerid)
{
	for(new i = 0; i != sizeof work_info; i ++)
	{
		if (work_info[i][work_info_TYPE] == WORK_TYPE_NORMAL)
		{
			new DB_Query[256];
			format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_WORKS` SET `SET` = '0' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", ACCOUNT_INFO[playerid][ac_ID], i);
			db_free_result(db_query(Database, DB_Query));

			PLAYER_WORKS[playerid][i] = 0;
			SavePlayerWorks(playerid);
		}
	}
	return 1;
}

SendMessageToAdmins(color, const message[], level = 0)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
	    if (IsPlayerConnected(i))
	    {
		   if (ACCOUNT_INFO[i][ac_ADMIN_LEVEL] > level && PLAYER_TEMP[i][py_ADMIN_SERVICE])
		   {
			  SendClientMessage(i, color, message);
		   }
	    }
	}
	return 1;
}

SendCmdLogToAdmins(playerid, const cmdtext[], const params[])
{
	new
		message[144],
		str_text[144];

	if (isnull(params)) format(message, sizeof message, "%s (%d) uso el comando /%s", ACCOUNT_INFO[playerid][ac_NAME], playerid, cmdtext);
	else format(message, sizeof message, "%s (%d) uso el comando /%s %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, cmdtext, params);

	format(str_text, sizeof(str_text), ":page_with_curl: %s", message);
	SendDiscordWebhook(str_text, 1);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
	    if (IsPlayerConnected(i))
	    {
		   if (ACCOUNT_INFO[i][ac_ADMIN_LEVEL] >= ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] && PLAYER_TEMP[i][py_ADMIN_SERVICE])
		   {
			  if (PLAYER_TEMP[i][py_SEE_ACMD_LOG]) SendClientMessage(i, 0x9A9A9AFF, message);
		   }
	    }
	}
	return 1;
}

SendMessageToAdminsAC(color, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
	    if (IsPlayerConnected(i))
	    {
		   if (ACCOUNT_INFO[i][ac_ADMIN_LEVEL] > 1 && PLAYER_TEMP[i][py_ADMIN_SERVICE])
		   {
			  if (PLAYER_TEMP[i][py_SEE_AC_LOG]) SendClientMessage(i, color, message);
		   }
	    }
	}
	printf(message);
	return 1;
}

RespawnAllUnoccupiedVehicles()
{
	for(new i = 0; i != MAX_VEHICLES; i ++)
	{
		if (!GLOBAL_VEHICLES[i][gb_vehicle_VALID]) continue;
		if (GLOBAL_VEHICLES[i][gb_vehicle_OCCUPIED]) continue;
		if (GLOBAL_VEHICLES[i][gb_vehicle_TYPE] == VEHICLE_TYPE_TEST)
		{
			DestroyVehicleEx(i);
			continue;
		}

		SetVehicleToRespawnEx(i);
	}
	return 1;
}

RespawnGlobalUnoccupiedVehicles()
{
	for(new i = 0; i != MAX_VEHICLES; i ++)
	{
		if (!GLOBAL_VEHICLES[i][gb_vehicle_VALID]) continue;
		if (GLOBAL_VEHICLES[i][gb_vehicle_TYPE] == VEHICLE_TYPE_PERSONAL) continue;
		if (GLOBAL_VEHICLES[i][gb_vehicle_OCCUPIED]) continue;

		SetVehicleToRespawnEx(i);
	}
	return 1;
}

getRandomSalt(salt[], length = sizeof salt)
{
    for(new i = 0; i != length; i ++)
	{
		salt[i] = random(2) ? (random(26) + (random(2) ? 'a' : 'A')) : (random(10) + '0');
	}
	return true;
}

GetTickDiff(newtick, oldtick)
{
	if (oldtick < 0 && newtick >= 0) {
		return newtick - oldtick;
	} else if (oldtick >= 0 && newtick < 0 || oldtick > newtick) {
		return (cellmax - oldtick + 1) - (cellmin - newtick);
	}
	return newtick - oldtick;
}

GetPlayerSpeed(vehicleid)
{
	new Float:xPos[3];
	GetPlayerVelocity(vehicleid, xPos[0], xPos[1], xPos[2]);
	return floatround(floatsqroot(xPos[0] * xPos[0] + xPos[1] * xPos[1] + xPos[2] * xPos[2]) * 170.00);
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

GetPlayerPlantedPlants(playerid)
{
	new plants;

	for(new i = 0; i != MAX_PLANTS; i ++)
	{
		if (!PLANTS[i][plant_VALID]) continue;
		if (PLANTS[i][plant_PLANTED_BY_ACCOUNT_ID] == ACCOUNT_INFO[playerid][ac_ID]) plants ++;
	}
	return plants;
}


StartPlayerJob(playerid, work, vehicleid = INVALID_VEHICLE_ID)
{
	switch(work)
	{
		case WORK_TRUCK:
		{
			if (TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADED])
			{
				if (TRUCK_VEHICLE[vehicleid][truck_vehicle_DELIVERED]) ShowPlayerMessage(playerid, "Vuelve a la ~y~estaci�n", 7);
				else ShowPlayerMessage(playerid, "Ve a entregar la mercanc�a", 7);

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
			format(label_str, sizeof label_str, "%s | N�%d | %c. %s", POLICE_RANKS[ PLAYER_SKILLS[playerid][WORK_POLICE] ], PLAYER_MISC[playerid][MISC_PLACA_PD], PLAYER_TEMP[playerid][py_FIRST_NAME][0], PLAYER_TEMP[playerid][py_SUB_NAME]);

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

			ShowPlayerNotification(playerid, "Ahora estas de servicio como le�ador, ve al bosque y tala algunos arboles. Usa ~r~ALT ~w~+ ~r~CLICK ~w~para soltar tu carro.", 5);
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
						ShowPlayerMessage(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], "~r~El trabajo se ha cancelado porque tu compa�ero ha dejado de trabajar.", 3);
						CancelTrashWork(playerid, TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);
					}
					if (PLAYER_TEMP[playerid][py_TRASH_PASSENGER])
					{
						ShowPlayerMessage(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], "~r~El trabajo se ha cancelado porque tu compa�ero ha dejado de trabajar.", 3);
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

LoadServerInfo()
{
	new File:ECO = fopen("CONFIG_FILES/ECO.txt", io_read), eco_str[256];
	if (ECO)
	{
		fread(ECO, eco_str);
		sscanf(eco_str, "p<,>fffffd", MULTIPLIER_PROPERITES, MULTIPLIER_VEHICLES, MULTIPLIER_TOYS, MULTIPLIER_SKINS, MULTIPLIER_WEAPONS, SU_SD_PRICE);
		fclose(ECO);
	}


	new File:AC = fopen("CONFIG_FILES/AC.txt", io_read), ac_str[128], ac_num;
	if (AC)
	{
		while(fread(AC, ac_str))
		{
			if (ac_num >= sizeof(ac_Info)) break;
			sscanf(ac_str, "p<,>bbdd", ac_Info[ac_num][ac_Enabled], ac_Info[ac_num][ac_Kick], ac_Info[ac_num][ac_Detections], ac_Info[ac_num][ac_Interval]);
			ac_num ++;
		}
		fclose(AC);
	}
	return 1;
}

WriteAnticheatRules()
{
	new File:AC = fopen("CONFIG_FILES/AC.txt", io_write), ac_str[128];
	if (AC)
	{
		for(new i = 0; i != sizeof(ac_Info); i ++)
		{
			format(ac_str, sizeof ac_str, "%d,%d,%d,%d\r\n", ac_Info[i][ac_Enabled], ac_Info[i][ac_Kick], ac_Info[i][ac_Detections], ac_Info[i][ac_Interval]);
			fwrite(AC, ac_str);
		}
		fclose(AC);
	}
	return 1;
}

WriteEconomyMultipliers()
{
	new File:ECO = fopen("CONFIG_FILES/ECO.txt", io_write), eco_str[256];
	if (ECO)
	{
		format(eco_str, sizeof eco_str, "%f,%f,%f,%f,%f,%d", MULTIPLIER_PROPERITES, MULTIPLIER_VEHICLES, MULTIPLIER_TOYS, MULTIPLIER_SKINS, MULTIPLIER_WEAPONS, SU_SD_PRICE);
		fwrite(ECO, eco_str);
		fclose(ECO);
	}
	return 1;
}

UpdateEconomy(type = -1)
{
	new label_str[256];

	if (type == -1)
	{
		for(new i = 0; i != MAX_PROPERTIES; i ++)
		{
			if (!PROPERTY_INFO[i][property_VALID]) continue;
			PROPERTY_INFO[i][property_PRICE] = floatround(PROPERTY_INFO[i][property_PRICE_BASE] * MULTIPLIER_PROPERITES, floatround_ceil);

			if (!PROPERTY_INFO[i][property_SOLD])
			{
				UpdateUnnocupiedPropertyLabel(i);
			}
		}

		for(new i = 0; i != MAX_VEHICLES; i ++)
		{
			if (!SELL_VEHICLES[i][sell_vehicle_VALID]) continue;
			SELL_VEHICLES[i][sell_vehicle_PRICE] = floatround(VEHICLE_INFO[ GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400 ][vehicle_info_PRICE] * MULTIPLIER_VEHICLES, floatround_ceil);

			if (SELL_VEHICLES[i][sell_vehicle_VIP_LEVEL]) SELL_VEHICLES[i][sell_vehicle_LEVEL] = 1;
			if (SELL_VEHICLES[i][sell_vehicle_EXTRA]) SELL_VEHICLES[i][sell_vehicle_PRICE] = 0;

			if (SELL_VEHICLES[i][sell_vehicle_VIP_LEVEL])
			{
				if (SELL_VEHICLES[i][sell_vehicle_EXTRA])
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
							", SELL_VEHICLES[i][sell_vehicle_VIP_LEVEL], VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_NAME], SELL_VEHICLES[i][sell_vehicle_EXTRA], SELL_VEHICLES[i][sell_vehicle_LEVEL]
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
							", SELL_VEHICLES[i][sell_vehicle_VIP_LEVEL], VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_NAME], number_format_thousand(SELL_VEHICLES[i][sell_vehicle_PRICE]), SELL_VEHICLES[i][sell_vehicle_LEVEL]
					);
				}
			}
			else
			{
				if (SELL_VEHICLES[i][sell_vehicle_EXTRA])
				{
					format
					(
						label_str,
							sizeof label_str,
							"\
								"COL_RED"%s\n\n\
								"COL_WHITE"Coste: "COL_RED"%d "SERVER_COIN"\n\
								"COL_WHITE"Nivel: "COL_RED"%d\
							", VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_NAME], SELL_VEHICLES[i][sell_vehicle_EXTRA], SELL_VEHICLES[i][sell_vehicle_LEVEL]
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
							", VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_NAME], number_format_thousand(SELL_VEHICLES[i][sell_vehicle_PRICE]), SELL_VEHICLES[i][sell_vehicle_LEVEL]
					);
				}
			}
			UpdateDynamic3DTextLabelText(SELL_VEHICLES[i][sell_vehicle_LABEL_ID], COLOR_WHITE, label_str);
		}

		for(new i = 0; i != sizeof(Toys_Shop); i ++) Toys_Shop[i][shop_toy_price] = floatround(Toys_Shop[i][shop_toy_price_base] * MULTIPLIER_TOYS, floatround_ceil);
		for(new i = 0; i != sizeof(Binco_Shop_Male_Skins); i ++) Binco_Shop_Male_Skins[i][2] = floatround(Binco_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Binco_Shop_Female_Skins); i ++) Binco_Shop_Female_Skins[i][2] = floatround(Binco_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Suburban_Shop_Male_Skins); i ++) Suburban_Shop_Male_Skins[i][2] = floatround(Suburban_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Suburban_Shop_Female_Skins); i ++) Suburban_Shop_Female_Skins[i][2] = floatround(Suburban_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Prolaps_Shop_Male_Skins); i ++) Prolaps_Shop_Male_Skins[i][2] = floatround(Prolaps_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Prolaps_Shop_Female_Skins); i ++) Prolaps_Shop_Female_Skins[i][2] = floatround(Prolaps_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Didier_Shop_Male_Skins); i ++) Didier_Shop_Male_Skins[i][2] = floatround(Didier_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Didier_Shop_Female_Skins); i ++) Didier_Shop_Female_Skins[i][2] = floatround(Didier_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Victim_Shop_Male_Skins); i ++) Victim_Shop_Male_Skins[i][2] = floatround(Victim_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Victim_Shop_Female_Skins); i ++) Victim_Shop_Female_Skins[i][2] = floatround(Victim_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Zip_Shop_Male_Skins); i ++) Zip_Shop_Male_Skins[i][2] = floatround(Zip_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Zip_Shop_Female_Skins); i ++) Zip_Shop_Female_Skins[i][2] = floatround(Zip_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);

		for(new i = 0; i != sizeof(BLACK_MARKT_WEAPONS); i ++) BLACK_MARKT_WEAPONS[i][black_market_WEAPON_PRICE] = floatround(BLACK_MARKT_WEAPONS[i][black_market_WEAPON_PRICE_BASE] * MULTIPLIER_WEAPONS, floatround_ceil);
	}
	else
	{
		switch(type)
		{
			case 0:
			{
				for(new i = 0; i != MAX_PROPERTIES; i ++)
				{
					if (!PROPERTY_INFO[i][property_VALID]) continue;
					PROPERTY_INFO[i][property_PRICE] = floatround(PROPERTY_INFO[i][property_PRICE_BASE] * MULTIPLIER_PROPERITES, floatround_ceil);

					if (!PROPERTY_INFO[i][property_SOLD])
					{
						UpdateUnnocupiedPropertyLabel(i);
					}
				}
			}
			case 1:
			{
				for(new i = 0; i != MAX_VEHICLES; i ++)
				{
					if (!SELL_VEHICLES[i][sell_vehicle_VALID]) continue;
					SELL_VEHICLES[i][sell_vehicle_PRICE] = floatround(VEHICLE_INFO[ GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400 ][vehicle_info_PRICE] * MULTIPLIER_VEHICLES, floatround_ceil);

					if (SELL_VEHICLES[i][sell_vehicle_VIP_LEVEL]) SELL_VEHICLES[i][sell_vehicle_LEVEL] = 1;
					if (SELL_VEHICLES[i][sell_vehicle_EXTRA]) SELL_VEHICLES[i][sell_vehicle_PRICE] = 0;

					if (SELL_VEHICLES[i][sell_vehicle_VIP_LEVEL])
					{
						if (SELL_VEHICLES[i][sell_vehicle_EXTRA])
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
									", SELL_VEHICLES[i][sell_vehicle_VIP_LEVEL], VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_NAME], SELL_VEHICLES[i][sell_vehicle_EXTRA], SELL_VEHICLES[i][sell_vehicle_LEVEL]
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
									", SELL_VEHICLES[i][sell_vehicle_VIP_LEVEL], VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_NAME], number_format_thousand(SELL_VEHICLES[i][sell_vehicle_PRICE]), SELL_VEHICLES[i][sell_vehicle_LEVEL]
							);
						}
					}
					else
					{
						if (SELL_VEHICLES[i][sell_vehicle_EXTRA])
						{
							format
							(
								label_str,
									sizeof label_str,
									"\
										"COL_RED"%s\n\n\
										"COL_WHITE"Coste: "COL_RED"%d "SERVER_COIN"\n\
										"COL_WHITE"Nivel: "COL_RED"%d\
									", VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_NAME], SELL_VEHICLES[i][sell_vehicle_EXTRA], SELL_VEHICLES[i][sell_vehicle_LEVEL]
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
									", VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_NAME], number_format_thousand(SELL_VEHICLES[i][sell_vehicle_PRICE]), SELL_VEHICLES[i][sell_vehicle_LEVEL]
							);
						}
					}
					UpdateDynamic3DTextLabelText(SELL_VEHICLES[i][sell_vehicle_LABEL_ID], COLOR_WHITE, label_str);
				}
			}
			case 2:
			{
				for(new i = 0; i != sizeof(Toys_Shop); i ++) Toys_Shop[i][shop_toy_price] = floatround(Toys_Shop[i][shop_toy_price_base] * MULTIPLIER_TOYS, floatround_ceil);
			}
			case 3:
			{
				for(new i = 0; i != sizeof(Binco_Shop_Male_Skins); i ++) Binco_Shop_Male_Skins[i][2] = floatround(Binco_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Binco_Shop_Female_Skins); i ++) Binco_Shop_Female_Skins[i][2] = floatround(Binco_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Suburban_Shop_Male_Skins); i ++) Suburban_Shop_Male_Skins[i][2] = floatround(Suburban_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Suburban_Shop_Female_Skins); i ++) Suburban_Shop_Female_Skins[i][2] = floatround(Suburban_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Prolaps_Shop_Male_Skins); i ++) Prolaps_Shop_Male_Skins[i][2] = floatround(Prolaps_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Prolaps_Shop_Female_Skins); i ++) Prolaps_Shop_Female_Skins[i][2] = floatround(Prolaps_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Didier_Shop_Male_Skins); i ++) Didier_Shop_Male_Skins[i][2] = floatround(Didier_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Didier_Shop_Female_Skins); i ++) Didier_Shop_Female_Skins[i][2] = floatround(Didier_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Victim_Shop_Male_Skins); i ++) Victim_Shop_Male_Skins[i][2] = floatround(Victim_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Victim_Shop_Female_Skins); i ++) Victim_Shop_Female_Skins[i][2] = floatround(Victim_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Zip_Shop_Male_Skins); i ++) Zip_Shop_Male_Skins[i][2] = floatround(Zip_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Zip_Shop_Female_Skins); i ++) Zip_Shop_Female_Skins[i][2] = floatround(Zip_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
			}
			case 4:
			{
				for(new i = 0; i != sizeof(BLACK_MARKT_WEAPONS); i ++) BLACK_MARKT_WEAPONS[i][black_market_WEAPON_PRICE] = floatround(BLACK_MARKT_WEAPONS[i][black_market_WEAPON_PRICE_BASE] * MULTIPLIER_WEAPONS, floatround_ceil);
			}
		}
	}
	return 1;
}

CMD:vip(playerid, params[])
{
	if (ACCOUNT_INFO[playerid][ac_SU]) ShowDialog(playerid, DIALOG_SU);
	else ShowDialog(playerid, DIALOG_SU_BUY);
	return 1;
}

CMD:minero(playerid)
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (PLAYER_WORKS[playerid][WORK_MINER])
	{
		if (PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] != 9999)
		{
			new slot = PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT];
			if (PLAYER_VISUAL_INV[playerid][slot_TYPE][slot] == 52)
			{
				for(new i = 0; i < sizeof ROCKS_OBJ; i ++)
				{
					if (ROCKS_OBJ[i][r_ACTIVATED] == true)
					{
						if (IsPlayerInRangeOfPoint(playerid, 1.5, ROCKS_OBJ[i][r_X], ROCKS_OBJ[i][r_Y], ROCKS_OBJ[i][r_Z]))
						{
							StartMining(playerid, i);
							return 1;
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
				if (IsPlayerInRangeOfPoint(playerid, 1.0, DROP_ROCK_POS[i][mp_X], DROP_ROCK_POS[i][mp_Y], DROP_ROCK_POS[i][mp_Z]))
				{
					PLAYER_TEMP[playerid][py_ROCK] = false;
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					ApplyAnimation(playerid, "CARRY", "PUTDWN", 4.1, false, false, false, false, 0, false);
					RemovePlayerAttachedObject(playerid, 9);
					PayPlayerMiner(playerid);
					DropPlayerRock(playerid, i);
				}	
			}
		}
	}
	return 1;
}

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

	if (PLAYER_TEMP[playerid][py_SELECT_TEXTDRAW]) return ShowPlayerMessage(playerid, "Pulsa ~y~ESC~w~ para cerrar el men�.", 4);

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
		SendClientMessage(playerid, COLOR_WHITE, "�Tranquilo, quemar�s el teclado!");
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

				SendClientMessageEx(index, COLOR_ORANGE, "[Alerta]"COL_WHITE" NeuroAdmin te silenci� del canal de dudas y anuncios por Mal uso - Tiempo: 60");
				PLAYER_MISC[index][MISC_MUTES] ++;
				PLAYER_MISC[index][MISC_MUTE] = gettime() + seconds;
				SavePlayerMisc(index);

				new str_text[145];
			    format(str_text, 145, "[Dudas] "COL_WHITE"NeuroAdmin silenci� a %s (%d) del canal de dudas/anuncios: Mal uso", ACCOUNT_INFO[index][ac_NAME], index);

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
		ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Recordatorio", ""COL_WHITE"Recuerde que si dice cosas sarc�sticas, insultos, anuncios o\n\
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
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres polic�a.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No est�s de servicio como polic�a.", 3);

	new to_player, reason[128];
	if (sscanf(params, "us[128]", to_player, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /antecedentes <playerid> <razon>");
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (to_player == playerid) return 1;

	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No se puede a�adir algo a este jugador ahora.", 3);
	if (PLAYER_WORKS[to_player][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No se puede a�adir algo a este jugador porque es polic�a.", 3);

	AddPlayerPoliceHistory(to_player, ACCOUNT_INFO[playerid][ac_NAME], reason);
	SendPoliceNotification(sprintf("%s ha actualizado el historial de ~y~%s~w~.", PLAYER_TEMP[playerid][py_RP_NAME], PLAYER_TEMP[to_player][py_RP_NAME]), 4);
	return 1;
}

CMD:limpiar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres polic�a.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No est�s de servicio como polic�a.", 3);
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
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres polic�a.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No est�s de servicio como polic�a.", 3);

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
// Dialogs
#include "core/dialog/show.pwn"
#include "core/dialog/response.pwn"