#if defined CORE_ANTICHEAT_H_
	#endinput
#endif

#define CORE_ANTICHEAT_H_

const PLAYER_SYNC = 207;

enum
{
	CHEAT_WEAPON,
	CHEAT_AMMO,
	CHEAT_CAR_MOD,
	CHEAT_VEHICLE_SPEED_HACK,
	CHEAT_POS,
	CHEAT_TEXT_SPAMMER,
	CHEAT_COMMAND_SPAMMER,
	CHEAT_DEATH_SPAMMER,
	CHEAT_STATE_SPAMMER,
	CHEAT_VEHICLE_ENTER_SPAMMER,
	CHEAT_JETPACK,
	CHEAT_PLAYER_SPEED,
	CHEAT_PLAYER_HEALTH,
	CHEAT_PLAYER_ARMOUR,
	CHEAT_VEHICLE_HEALTH,
	CHEAT_PLAYER_VEHICLE_WORK, // Entra a un vehiculo que no es de su trabajo
	CHEAT_PLAYER_VEHICLE_DOORS,
	CHEAT_VEHICLE_NOFUEL,
	CHEAT_SPECTATE,
	CHEAT_UNDETECTED_WEAPON,
	CHEAT_DRIVE_BY,
	CHEAT_UNOCCUPIED_VEHICLE_TP,
	CHEAT_HIGH_POS,
	CHEAT_CAR_JACKING,
	CHEAT_RAPID_FIRE,
	CHEAT_HEAD_AIM
};

enum e_ac_Info
{
	ac_Name[24],
	bool:ac_Enabled,
	bool:ac_Kick, // 1 = kickea, 0 = avisa a admins
	ac_Detections, // enviar aviso cuando llege a este num en los seg de abajo
	ac_Interval
};

// Defaults valors on AC.TXT
new ac_Info[][e_ac_Info] =
{
	{"armas",                     true, true,         1, 0},
	{"municion",                  true, true,         1, 0},
	{"mod car",                   true, true,         1, 0},
	{"vehicle speed",             true, true,         1, 0},
	{"pos",                       true, false,        3, 10},
	{"text spammer",              true, true,         10, 5},
	{"command spammer",           true, true,         5, 5},
	{"death spammer",             true, false,        1, 0},
	{"state change spammer",      true, false,        1, 0},
	{"vehicle enter spammer",     true, false,        1, 0},
	{"jetpack",                   true, true,         1, 0},
	{"player speed",              true, true,         1, 0},
	{"player health",             true, true,         1, 0},
	{"player armour",             true, true,         1, 0},
	{"vehicle health",            true, true,         1, 0},
	{"pwork != vwork",            true, true,         1, 0},
	{"enter closed vehicle",      true, false,        1, 0},
	{"vehicle nofuel cheat",      true, false,        50, 10},
	{"player spectate",           true, false,        1, 0},
	{"pweapon != sweapon",        true, false,        1, 0},
	{"drive by",                  true, false,        1, 0},
	{"unoccupied veh tp",         true, true,         1, 0},
	{"high pos",                  true, true,         1, 0},
	{"car jacking",               true, true,         1, 0},
	{"rapid fire",                true, true,         1, 0},
	{"head aim",                  true, true,         1, 0}
};

enum e_PLAYER_AC_INFO
{
	p_ac_info_DETECTIONS,
	p_ac_info_LAST_DETECTION,
	p_ac_info_IMMUNITY
};
new 
	PLAYER_AC_INFO[MAX_PLAYERS][sizeof(ac_Info)][e_PLAYER_AC_INFO],
	lastShotTick[MAX_PLAYERS]
;

new CHEATS_NAMES[][] = {
	"AirBreak (onfoot)",
	"AirBreak (in vehicle)",
	"TP (onfoot)",
	"TP (in vehicle)",
	"TP (into/between vehicles)",
	"TP (vehicle to player)",
	"TP (pickups)",
	"Fly (onfoot)",
	"Fly (in vehicle)",
	"Speed (onfoot)",
	"Speed (in vehicle)",
	"Health (in vehicle)",
	"Health (onfoot)",
	"Armour",
	"Money",
	"Weapon",
	"Ammo (add)",
	"Ammo (infinite)",
	"Special actions",
	"GodMode (onfoot)",
	"GodMode (in vehicle)",
	"Invisible",
	"lagcomp-spoof",
	"Tuning",
	"Parkour mod",
	"Quick turn",
	"Rapid fire",
	"FakeSpawn",
	"FakeKill",
	"Pro Aim",
	"CJ run",
	"CarShot",
	"CarJack",
	"UnFreeze",
	"AFK Ghost",
	"Full Aiming",
	"Fake NPC",
	"Reconnect",
	"High ping",
	"Dialog hack",
	"Sandbox",
	"Invalid version",
	"Rcon hack",
	"Tuning crasher",
	"Invalid seat crasher",
	"Dialog crasher",
	"Attached object crasher",
	"Weapon Crasher",
	"One Slot",
	"Flood",
	"Seat",
	"DoS",
	"NOPs"
}