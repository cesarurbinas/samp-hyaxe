ShowMainMenu(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][47]);

	HideGamemodesMenu(playerid);

	TextDrawHideForPlayer(playerid, Textdraws[textdraw_LOGO]);

	TextDrawShowForPlayer(playerid, Textdraws[textdraw_MAIN_MENU][0]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_MAIN_MENU][1]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_MAIN_MENU][2]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_MAIN_MENU][3]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_MAIN_MENU][4]);
	in_main_menu[playerid] = true;

	SelectTextDrawEx(playerid, 0xFFFFFFAA);

	SvAddKey(playerid, 0x57); // W
	SvAddKey(playerid, 0x41); // A
	SvAddKey(playerid, 0x53); // S
	SvAddKey(playerid, 0x44); // D
	return 1;
}

HideMainMenu(playerid)
{
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_MAIN_MENU][0]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_MAIN_MENU][1]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_MAIN_MENU][2]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_MAIN_MENU][3]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_MAIN_MENU][4]);
	in_main_menu[playerid] = false;
	in_gamemode_menu[playerid] = false;
	return 1;
}

ShowGamemodesMenu(playerid)
{
	minigames_page[playerid] = 0;
	in_main_menu[playerid] = true;
	in_gamemode_menu[playerid] = true;

	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_GAMEMODE_BG], "HYAXE:minigame1");
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_GAMEMODE_BG]);
	
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_MAIN_MENU][5]);
	return 1;
}

UpdateGamemodesMenu(playerid)
{
	if (minigames_page[playerid] < 0) minigames_page[playerid] = 3;
	switch(minigames_page[playerid])
	{
		case 0:
		{
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_GAMEMODE_BG], "HYAXE:minigame1");
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_GAMEMODE_BG]);
		}
		case 1:
		{
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_GAMEMODE_BG], "HYAXE:minigame2");
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_GAMEMODE_BG]);
		}
		case 2:
		{
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_GAMEMODE_BG], "HYAXE:minigame3");
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_GAMEMODE_BG]);
		}
		case 3:
		{
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_GAMEMODE_BG], "HYAXE:minigame4");
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_GAMEMODE_BG]);
		}
		default:
		{
			minigames_page[playerid] = 0;
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_GAMEMODE_BG], "HYAXE:minigame1");
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_GAMEMODE_BG]);
		}
	}

	PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	return 1;
}

HideGamemodesMenu(playerid)
{
	minigames_page[playerid] = 0;
	in_main_menu[playerid] = false;

	TextDrawHideForPlayer(playerid, Textdraws[textdraw_MAIN_MENU][5]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_GAMEMODE_BG]);
	return 1;
}

PlayerJoinGamemode(playerid)
{
	switch(minigames_page[playerid])
	{
		case 0:
		{
			LoadCharacterData(playerid);
			LoadPlayerBankAccountData(playerid);
			
			LoadPlayerToysData(playerid);
			LoadPlayerPocketData(playerid);
			LoadPlayerPhoneData(playerid);
			LoadPlayerGPSData(playerid);
			LoadPlayerObjectsData(playerid);
			LoadPlayerVehicles(playerid);
			LoadPlayerSkills(playerid);
			LoadPlayerWorks(playerid);
			LoadPlayerWeaponsData(playerid);
			LoadPlayerCrewInfo(playerid);
			
			ResetPlayerWeapons(playerid);
			ResetPlayerMoney(playerid);
			
			GivePlayerMoney(playerid, CHARACTER_INFO[playerid][ch_CASH]);
			SetPlayerFightingStyle(playerid, CHARACTER_INFO[playerid][ch_FIGHT_STYLE]);
			SetPlayerHealthEx(playerid, CHARACTER_INFO[playerid][ch_HEALTH]);
			SetPlayerArmourEx(playerid, CHARACTER_INFO[playerid][ch_ARMOUR]);
			//SetPlayerVirtualWorld(playerid, PLAYER_MISC[playerid][MISC_LAST_WORLD]);
			
			SetPlayerVirtualWorld(playerid, 0);
			
			SetSpawnInfo(playerid, DEFAULT_TEAM, CHARACTER_INFO[playerid][ch_SKIN], CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], 0, 0, 0, 0, 0, 0);
			SetPlayerInterior(playerid, CHARACTER_INFO[playerid][ch_INTERIOR]);
			PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];

			TogglePlayerSpectatingEx(playerid, false);
			TogglePlayerControllableEx(playerid, false);
			SetPlayerPoliceSearchLevel(playerid, PLAYER_MISC[playerid][MISC_SEARCH_LEVEL]);

			new str_text[128];
			format(str_text, sizeof str_text, "Bienvenido %s a Hyaxe Roleplay.", PLAYER_TEMP[playerid][py_RP_NAME]);
			ShowPlayerNotification(playerid, str_text);

			#if defined FINAL_BUILD
				PLAYER_TEMP[playerid][py_TIMERS][47] = SetTimerEx("SavePlayerData", 120000, true, "i", playerid);
			#endif

			format(PLAYER_TEMP[playerid][py_POLICE_REASON], 32, "Ninguna");
		}
		case 1:
		{
			TogglePlayerSpectatingEx(playerid, false);
			TogglePlayerControllableEx(playerid, false);

			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerInterior(playerid, 0);
		}
	}

	HideGamemodesMenu(playerid);
	HideMainMenu(playerid);

	SvRemoveKey(playerid, 0x57); // W
	SvRemoveKey(playerid, 0x41); // A
	SvRemoveKey(playerid, 0x53); // S
	SvRemoveKey(playerid, 0x44); // D
	return 1;
}