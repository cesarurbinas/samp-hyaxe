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
				new str_text[144];
				format(str_text, sizeof(str_text), "[ANTI-CHEAT] Kick sobre %s (%d): RapidFire", PLAYER_TEMP[playerid][py_NAME], playerid);
				SendMessageToAdmins(COLOR_ANTICHEAT, str_text);
				SendDiscordWebhook(str_text, 1);
				SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Razón: RapidFire");
				KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
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