/*public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
    {
		new
			interval = GetTickDiff(GetTickCount(), lastShotTick[playerid]),
			weaponshotinterval = WEAPON_INFO[weaponid][weapon_info_SHOT_TIME];

		//SendClientMessageEx(playerid, -1, "%s, %d, %d, %d (%d)", WEAPON_INFO[weaponid][weapon_info_NAME], interval, lastShotTick[playerid], GetTickCount(), weaponshotinterval);

		if (interval < weaponshotinterval)
		{
			new current_gettime = gettime();

			if (current_gettime - PLAYER_AC_INFO[playerid][CHEAT_RAPID_FIRE][p_ac_info_LAST_DETECTION] > 2) PLAYER_AC_INFO[playerid][CHEAT_RAPID_FIRE][p_ac_info_DETECTIONS] = 0;
			else PLAYER_AC_INFO[playerid][CHEAT_RAPID_FIRE][p_ac_info_DETECTIONS] ++;

			PLAYER_AC_INFO[playerid][CHEAT_RAPID_FIRE][p_ac_info_LAST_DETECTION] = current_gettime;
			if (PLAYER_AC_INFO[playerid][CHEAT_RAPID_FIRE][p_ac_info_DETECTIONS] >= 5)
			{
				ssss
			}
		}

		lastShotTick[playerid] = GetTickCount();
	}
	
	#if defined Anticheat_OnPlayerWeaponShot
		return Anticheat_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
	#else
		return 1;
	#endif
}

#if defined Anticheat_OnPlayerWeaponShot
	forward Anticheat_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
#endif

#if defined _ALS_OnPlayerWeaponShot
	#undef OnPlayerWeaponShot
#else
	#define _ALS_OnPlayerWeaponShot
#endif

#define OnPlayerWeaponShot Anticheat_OnPlayerWeaponShot*/

OnCheatDetected(playerid, ip_address[], type, code)
{
	#pragma unused ip_address, type

	if (IsPlayerNPC(playerid)) return 1;
	if (PLAYER_TEMP[playerid][py_KICKED]) return 1;

	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
	{	
		switch(code)
		{
			case 0: Anticheat_Kick(playerid, "AirBreak (onfoot)");
			case 1: Anticheat_Kick(playerid, "AirBreak (in vehicle)");
			case 2: Anticheat_Kick(playerid, "TP (onfoot)");
			case 3: Anticheat_Kick(playerid, "TP (in vehicle)");
			case 4: Anticheat_Kick(playerid, "TP (into/between vehicles)");
			case 5: Anticheat_Kick(playerid, "TP (vehicle to player)");
			case 6: Anticheat_Kick(playerid, "TP (pickups)");
			case 7: Anticheat_Kick(playerid, "Fly (onfoot)");
			case 8: Anticheat_Kick(playerid, "Fly (in vehicle)");
			case 9: Anticheat_Kick(playerid, "Speed (onfoot)");
			case 10: Anticheat_Kick(playerid, "Speed (in vehicle)");
			case 11: Anticheat_Kick(playerid, "Health (in vehicle)");
			case 12: Anticheat_Kick(playerid, "Health (onfoot)");
			case 13: Anticheat_Kick(playerid, "Armour");
			case 14: Anticheat_Kick(playerid, "Money");
			case 15: Anticheat_Kick(playerid, "Weapon");
			case 16: Anticheat_Kick(playerid, "Ammo (add)");
			case 17: Anticheat_Kick(playerid, "Ammo (infinite)");
			case 18: Anticheat_Kick(playerid, "Special actions");
			case 19: Anticheat_Kick(playerid, "GodMode (onfoot)");
			case 20: Anticheat_Kick(playerid, "GodMode (in vehicle)");
			case 21: Anticheat_Kick(playerid, "Invisible");
			case 22: Anticheat_Kick(playerid, "lagcomp-spoof");
			case 23: Anticheat_Kick(playerid, "Tuning");
			case 24: Anticheat_Kick(playerid, "Parkour mod");
			case 25: Anticheat_Kick(playerid, "Quick turn");
			case 26: Anticheat_Kick(playerid, "Rapid fire");
			case 27: Anticheat_Kick(playerid, "FakeSpawn");
			case 28: Anticheat_Ban(playerid, "FakeKill");
			case 29: Anticheat_Kick(playerid, "Pro Aim");
			case 30: Anticheat_Kick(playerid, "CJ run");
			case 31: Anticheat_Kick(playerid, "CarShot");
			case 32: Anticheat_Kick(playerid, "CarJack");
			case 33: Anticheat_Kick(playerid, "UnFreeze");
			case 34: Anticheat_Kick(playerid, "AFK Ghost");
			case 35: Anticheat_Kick(playerid, "Full Aiming");
			case 36: Anticheat_Kick(playerid, "Fake NPC");
			case 37: Anticheat_Kick(playerid, "Reconnect");
			case 38: Anticheat_Kick(playerid, "High ping");
			case 39: Anticheat_Kick(playerid, "Dialog hack");
			case 40: Anticheat_Kick(playerid, "Sandbox");
			case 41: Anticheat_Kick(playerid, "Invalid version");
			case 42: Anticheat_Kick(playerid, "Rcon hack");
			case 43: Anticheat_Kick(playerid, "Tuning crasher");
			case 44: Anticheat_Kick(playerid, "Invalid seat crasher");
			case 45: Anticheat_Kick(playerid, "Dialog crasher");
			case 46: Anticheat_Kick(playerid, "Attached crasher");
			case 47: Anticheat_Kick(playerid, "Weapon Crasher");
			case 48: Anticheat_Kick(playerid, "One Slot");
			case 49: Anticheat_Kick(playerid, "Flood");
			case 50: Anticheat_Kick(playerid, "Seat");
			case 51: Anticheat_Kick(playerid, "DoS");
			case 52: Anticheat_Kick(playerid, "NOPs");
			default: Anticheat_Kick(playerid, "Cheats");
		}
	}
	return 1;
}