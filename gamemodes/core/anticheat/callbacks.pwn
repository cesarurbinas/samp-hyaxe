public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
    {
		new
			interval = GetTickCountDifference(lastShotTick[playerid], GetTickCount()),
			weaponshotinterval = WEAPON_INFO[weaponid][weapon_info_SHOT_TIME];

		if (skillLevel[playerid] == 999)
		{
			switch(weaponid)
			{
				case 22: weaponshotinterval = 185;
				case 26: weaponshotinterval = 140;
				case 28: weaponshotinterval = 35;
				case 32: weaponshotinterval = 35;
			}
		}

		if (interval < weaponshotinterval)
		{
			PLAYER_AC_INFO[playerid][CHEAT_RAPID_FIRE][p_ac_info_DETECTIONS]++;

			if (PLAYER_AC_INFO[playerid][CHEAT_RAPID_FIRE][p_ac_info_DETECTIONS] >= 5)
			{
				PLAYER_AC_INFO[playerid][CHEAT_RAPID_FIRE][p_ac_info_DETECTIONS] = 0;

				new str_text[144];
				format(str_text, sizeof(str_text), "[ANTI-CHEAT] Kick sobre %s (%d): RapidFire", PLAYER_TEMP[playerid][py_NAME], playerid);
				SendMessageToAdmins(COLOR_ANTICHEAT, str_text);
				SendDiscordWebhook(str_text, 1);
				SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Razón: RapidFire");
				KickEx(playerid, 500);
			}

			return 0;
		}

		lastShotTick[playerid] = GetTickCount();
	}

	#if defined Anticheat_OnPlayerWeaponShot
		return Anticheat_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
	#else
		return 1;
	#endif
}
#if defined _ALS_OnPlayerWeaponShot
	#undef OnPlayerWeaponShot
#else
	#define _ALS_OnPlayerWeaponShot
#endif
 
#define OnPlayerWeaponShot Anticheat_OnPlayerWeaponShot
#if defined Anticheat_OnPlayerWeaponShot
	forward Anticheat_OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ);
#endif

stock Anticheat_SetPlayerSkillLevel(playerid, skill, level) {
	skillLevel[playerid] = level;

	return SetPlayerSkillLevel(playerid, skill, level);
}
#if defined _ALS_SetPlayerSkillLevel
	#undef SetPlayerSkillLevel
#else
	#define _ALS_SetPlayerSkillLevel
#endif
#define SetPlayerSkillLevel Anticheat_SetPlayerSkillLevel