/*
 *      Hyaxe Roleplay
 * 		Créditos/Autores: Atom, Heix, Wurty, Zeint, Boorz, Vinter, Blade, Deru
 *		Este código tiene bastante tiempo y ha pasado por muchos desarrolladores diferentes al
 *		mismo tiempo, hay código que necesita ser refactorizado pero la mayoría está en perfectas condiciones.
 *
 *		Para tener en cuenta:
 *		- Si el servidor se usará en producción defina "FINAL_BUILD"
 *		- El modo debug reduce el rendimiento considerablemente
 *		- Hay cosas que necesitan de la API para funcionar, asegurece de haberla montado en su dominio
 *		- Los modos festivos se activan manualmente
*/

// Compilación
#pragma option -(+
#pragma option -;+

// Anti-DeAMX creado por Daniel-Cortez
@___ww___@();
@___ww___@()
{
    #emit    stack    0x7FFFFFFF
    #emit    inc.s    cellmax

    static const ___[][] = {"sls", "422"};

    #emit    retn
    #emit    load.s.pri    ___
    #emit    proc
    #emit    proc
    #emit    fill    cellmax
    #emit    proc
    #emit    stack    1
    #emit    stor.alt    ___
    #emit    strb.i    2
    #emit    switch    0
    #emit    retn
L1:
    #emit    jump    L1
    #emit    zero    cellmin
}

/*
 * Modos de debug:
 *  - 0: No saldrá ningún mensaje de debug ni en la consola ni en el juego.
 *  - 1: Saldrán mensajes de debug solamente en la consola.
 *  - 2: Saldrán mensajes de debug en la consola y en el juego.
*/
#define DEBUG_MODE 0

#if DEBUG_MODE != 0
	#pragma option -d3
	#include <crashdetect>
#else
	#pragma option -O1
#endif

#pragma warning disable 239
#pragma warning disable 214

#pragma dynamic 15000

// Librerías
#include <a_samp>

#undef MAX_PLAYERS
#define MAX_PLAYERS 100

// Server information
#define SERVER_VERSION 			"Alpha 1"
#define SERVER_NAME 			"Hyaxe"
#define SERVER_WEBSITE 			"www.hyaxe-roleplay.com"
#define SERVER_DISCORD 			"www.hyaxe-roleplay.com/discord"

// Features
//#define FINAL_BUILD

// Special events
//#define HALLOWEEN_MODE // Modo de halloween
//#define CHRISTMAS_MODE // Modo de navidad
//#define EASTER_MODE // Modo de pascuas

// Anti-Cheat
#define NO_SUSPICION_LOGS

#include <streamer>
#include <ColAndreas>

// Other Library
//#include <a_mysql>
#include <physics>
#include <a_http>
#include <sscanf2>
#include <Pawn.RakNet> 
#include <Pawn.CMD>
#include <Pawn.Regex>
#include <calendar>
//#tryinclude <profiler>

// Math
#include "utils/player/math.pwn"

// Macros
#include "core/misc/macros.pwn"
#include "core/misc/packets.pwn"

// Admin
#include "core/admin/level.pwn"

// Dialogs
#include "core/dialog/dialog_id.pwn"

// Damage
#include "core/damage/header.pwn"

// Debes notifications
#include "core/notification/header.pwn"

// Libs
#define AIMBOT_MAX_PING 600
#define AIMBOT_MAX_PL_PERCENT_ALLOWED 5
#include <aimbot>
#include <hyaxe-anticheat>
#include <hyaxe-preview>
#include <route-tracing>
#include <strlib>
#include <extended-actor>
#include <hyaxe-select>

// Anticheat
#include "core/anticheat/header.pwn"

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

// Entity
#include "core/entity/header.pwn"

// Weapons
#include "core/weapons/info.pwn"

// World
#include "core/world/extra.pwn"
#include "core/world/zones.pwn"

// Textdraws
#include "core/global/textdraws.pwn"

// Actions
#include "core/action/header.pwn"
#include "core/action/callbacks.pwn"
#include "core/action/functions.pwn"

// Player util
#include "utils/player/header.pwn"

// Areas
#include "core/key_areas/areas.pwn"

// Properties 
#include "core/furniture/properties.pwn"

// Player
#include "core/player/account.pwn"
#include "core/player/temp.pwn"
#include "core/player/misc.pwn"
#include "core/player/character.pwn"
#include "core/player/textdraws.pwn"
#include "core/work/header.pwn"

// Money printers
#include "core/money_printer/header.pwn"
#include "core/money_printer/callbacks.pwn"
#include "core/money_printer/functions.pwn"

// World
#include "core/world/header.pwn"
#include "core/world/callbacks.pwn"

// Properties
#include "core/property/functions.pwn"

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
#include "core/inventory/header.pwn"
#include "core/player/vehicles.pwn"
#include "core/player/objects.pwn"

// Entity
#include "core/entity/functions.pwn"
#include "core/entity/callbacks.pwn"

// Propierties
#include "core/furniture/list.pwn"

// Items
#include "core/item/header.pwn"
#include "core/item/functions.pwn"
#include "core/item/callbacks.pwn"

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
#include "core/inventory/functions.pwn"

// Club's
#include "core/club/header.pwn"
#include "core/club/functions.pwn"
#include "core/club/callbacks.pwn"

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
#include "core/anticheat/callbacks.pwn"
#include "core/anticheat/main.pwn"

// Stall
#include "core/stall/header.pwn"
#include "core/stall/functions.pwn"

// Particles
#include "core/particles/functions.pwn"

// Fireworks
#include "core/fireworks/functions.pwn"

// Channels
#include "core/channel/callbacks.pwn"
#include "core/channel/functions.pwn"
#include "core/channel/commands.pwn"

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

// Dialogs
#include "core/dialog/show.pwn"
#include "core/dialog/response.pwn"

// Player callbacks
#include "core/player/callbacks.pwn"

// World configuration
#include "core/world/config.pwn"

// Menus
#include "core/gui/menu.pwn"

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

// Loader
#include "core/loader/header.pwn"

main()
{
	printf("     __  __                    ");
	printf("    / / / /_  ______ __  _____ ");
	printf("   / /_/ / / / / __ `/ |/_/ _ \\");
	printf("  / __  / /_/ / /_/ />  </  __/");
	printf(" /_/ /_/\\__, /\\__,_/_/|_|\\___/ ");
	printf("       /____/                  ");

	Logger_Info("hostname > "SERVER_HOSTNAME"");
	Logger_Info("language > "SERVER_LANGUAGE"");
	Logger_Info("website > "SERVER_WEBSITE"");
	Logger_Info("discord > "SERVER_DISCORD"");
	Logger_Info("build: Hyaxe "SERVER_VERSION"\n");
}

public OnGameModeInit()
{
	CA_RemoveBarriers();

	#if defined FINAL_BUILD
		RemoveObjectCollisions();
	#endif

	CA_Init();

	// Server
	SetGameModeText(SERVER_VERSION);

	SendRconCommand("hostname Hyaxe [test]");
	SetTimer("UpdateMoneyPrinters", 40000, true);

	#if defined FINAL_BUILD
		SetTimer("GiveAutoGift", 300000, false);
		SendRconCommand("hostname "SERVER_HOSTNAME"");
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
	SendRconCommand("conncookies 0");
	SendRconCommand("cookielogging 0");
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

	#if defined FINAL_BUILD
		SetTimer("UpdateWantedLevelMark", 30000, true);
		SetTimer("InitLastGraffiti", 60000, false);
	#endif

	GraffitiGetTime = gettime();
	MarketGetTime = gettime();

	Log("status", "Servidor iniciado ("SERVER_VERSION").");
	SendDiscordWebhook(":fire: Servidor iniciado ("SERVER_VERSION").", 1);
	ServerInitTime = gettime();

	#if !defined FINAL_BUILD
	for(new i = 0; i < sizeof(ITEM_INFO); i++)
	{
		new Float:position = (2.0 * i);
		CreateDropItem(
			i,
			2062.6035 - position, -2593.3059 + 5.0, 13.5469,
			0.0, 0.0, 0.0,
			0, 0
		);
	}
	#endif
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

	Logger_Debug("OnGameModeExit"); // This is a debug line!

	Logger_Warning("Deteniendo servidor...");
	db_close(Database);
	Log("status", "Servidor detenido.");
	return 1;
}