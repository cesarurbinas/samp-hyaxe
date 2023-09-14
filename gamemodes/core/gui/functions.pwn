ShowMainMenu(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][47]);
	ShowPlayerMessage(playerid, "_", 1);

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

PlayerJoinGamemode(playerid, announce = true)
{
	#pragma unused announce
	//SendClientMessageEx(playerid, -1, "players: %d, is_lgbt: %d, lgbt_started: %d, init: %d", lgtb_players, is_lgbt[playerid], lgbt_started, initial_lgbt);

	for(new i = 0; i != MAX_TIMERS_PER_PLAYER; i++) KillTimer(PLAYER_TEMP[playerid][py_TIMERS][i]);
	if (minigames_page[playerid] < 0) minigames_page[playerid] = 3;

	if (!PLAYER_MISC[playerid][MISC_SKIN])
	{
		new RANDOM_SKIN[] = {250, 2, 7, 14, 28, 29, 72, 78, 79};
		PLAYER_MISC[playerid][MISC_SKIN] = RANDOM_SKIN[random(sizeof(RANDOM_SKIN))];
	}

	StopAudioStreamForPlayer(playerid);
	
	PLAYER_MISC[playerid][MISC_GAMEMODE] = minigames_page[playerid];
	SavePlayerMisc(playerid);

	switch(minigames_page[playerid])
	{
		case 0:
		{
			LoadPlayerPhoneData(playerid);
			if (!PLAYER_PHONE[playerid][player_phone_NUMBER])
			{
				PLAYER_TEMP[playerid][py_TIMERS][18] = SetTimerEx("ContinuePlayerIntro", 500, false, "id", playerid, 0);
			}
			else
			{
				LoadCharacterData(playerid);
				LoadPlayerBankAccountData(playerid);
				
				LoadPlayerToysData(playerid);
				LoadPlayerPocketData(playerid);
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
		}
		default:
		{
			ShowPlayerMessage(playerid, "~r~Modo de juego desactivado.", 4);
			return 1;
		}
		/*case 2:
		{
			SetPlayerSkin(playerid, PLAYER_MISC[playerid][MISC_SKIN]);
			// Welcome
			is_lgbt[playerid] = false;
			lgtb_players ++;

			if (announce)
			{
				new str_text[144];
				format(str_text, sizeof(str_text), "%s (%d) ha ingresado a la partida", PLAYER_TEMP[playerid][py_NAME], playerid);
				SendLGBTMessage(COLOR_WHITE, str_text);
			}
			ShowPlayerNotification(playerid, sprintf("Mapa actual: ~y~%s", LGBT_MAPS[lgbt_map_index][lm_NAME]));

			// Spawn
			ResetPlayerWeapons(playerid);
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
			PLAYER_TEMP[playerid][py_GAME_STATE] = GAME_STATE_NORMAL;

			if (lgbt_started || lgtb_players < 3)
			{
				new Float:x = LGBT_MAPS[lgbt_map_index][lm_X], Float:y = LGBT_MAPS[lgbt_map_index][lm_Y];
				GetXYFromAngle(x, y, LGBT_MAPS[lgbt_map_index][lm_ANGLE], 15.0);

				InterpolateCameraPos(playerid,
					LGBT_MAPS[lgbt_map_index][lm_X],
					LGBT_MAPS[lgbt_map_index][lm_Y],
					LGBT_MAPS[lgbt_map_index][lm_Z] + 1.5,
					LGBT_MAPS[lgbt_map_index][lm_X],
					LGBT_MAPS[lgbt_map_index][lm_Y],
					LGBT_MAPS[lgbt_map_index][lm_Z] + 1.5,
					2000
				);

				InterpolateCameraLookAt(playerid,
					x, y, LGBT_MAPS[lgbt_map_index][lm_Z] + 0.5,
					x, y, LGBT_MAPS[lgbt_map_index][lm_Z] + 0.5,
					2000
				);

				if (lgbt_started) ShowPlayerMessage(playerid, "Espera a que termine la partida...", 300);
				else if (lgtb_players < 3) ShowPlayerMessage(playerid, "Esperando jugadores...", 300);
			}
			else if (!lgbt_started || lgtb_players >= 3)
			{
				KillTimer(lgbt_timers[1]);
				lgbt_started = true;

				for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
				{
					if (IsPlayerConnected(i))
					{
						if (PLAYER_MISC[i][MISC_GAMEMODE] == 2)
						{
							TogglePlayerSpectatingEx(i, false);
							TogglePlayerControllableEx(i, true);

							SetPlayerPosEx(i,
								LGBT_MAPS[lgbt_map_index][lm_X],
								LGBT_MAPS[lgbt_map_index][lm_Y],
								LGBT_MAPS[lgbt_map_index][lm_Z],
								LGBT_MAPS[lgbt_map_index][lm_ANGLE],
								LGBT_MAPS[lgbt_map_index][lm_INTERIOR],
								LGBT_MAPS[lgbt_map_index][lm_WORLD],
								false, true
							);

							ShowPlayerMessage(i, "Partida iniciada", 3);
							ShowPlayerNotification(i, "El primer ~p~Homosexual~w~ sera elegido en 30 segundos.");
						}
					}
				}
				lgbt_timers[1] = SetTimer("FirstGay", 30000, false);
			}
			// DIN DIN DIN U MOM IN FOUR MAMADAFAKKAKAKAAKAK
		}*/
	}

	HideGamemodesMenu(playerid);
	HideMainMenu(playerid);

	SvRemoveKey(playerid, 0x57); // W
	SvRemoveKey(playerid, 0x41); // A
	SvRemoveKey(playerid, 0x53); // S
	SvRemoveKey(playerid, 0x44); // D

	CancelSelectTextDrawEx(playerid);
	return 1;
}

PlayerExitGamemode(playerid, announce = true)
{
	#pragma unused announce
	#pragma unused playerid
	/*switch(minigames_page[playerid])
	{
		case 2:
		{
			if (announce)
			{
				new str_text[144];
				format(str_text, sizeof(str_text), "%s (%d) ha salido de la partida", PLAYER_TEMP[playerid][py_NAME], playerid);
				SendLGBTMessage(COLOR_WHITE, str_text);
			}

			lgtb_players -= 1; 
		}
	}*/
	return 1;
}

/*CMD:lgbtgo(playerid, params[])
{
	lgtb_players = 5;
	return 1;
}

CMD:lgbtmap(playerid, params[])
{
	ChangeLgbtMap();
	return 1;
}*/