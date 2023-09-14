public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	#if DEBUG_MODE == 1
		printf("OnDialogResponse %d %d %d %d %s",playerid,dialogid,response,listitem, inputtext); // debug juju
	#endif

	if (!IsPlayerConnected(playerid)) return 0;
	if (IsPlayerPaused(playerid)) return 0;

	if (PLAYER_TEMP[playerid][py_DIALOG_RESPONDED]) return 1;
	PLAYER_TEMP[playerid][py_DIALOG_RESPONDED] = true;

	if (!isnull(inputtext))
	{
		for(new i = 0; i < strlen(inputtext); i++)
		{
			if (inputtext[i] == '%') inputtext[i] = '#';
		}
	}

	//printf("[OnDialogResponse] playerid = %i, dialogid = %i", playerid, dialogid);

	switch(dialogid)
	{
		case DIALOG_INFO: return 1;
		case DIALOG_REGISTER:
		{
			if (response)
			{
				if (strlen(inputtext) < MIN_PASS_LENGTH || strlen(inputtext) > MAX_PASS_LENGTH) return ShowDialog(playerid, dialogid);
				format(ACCOUNT_INFO[playerid][ac_IP], 16, "%s", PLAYER_TEMP[playerid][py_IP]);
				format(ACCOUNT_INFO[playerid][ac_NAME], 24, "%s", PLAYER_TEMP[playerid][py_NAME]);
				format(ACCOUNT_INFO[playerid][ac_SERIAL], 50, "%s", PLAYER_TEMP[playerid][py_SERIAL]);
				format(PLAYER_TEMP[playerid][py_PASSWD], 24, "%s", inputtext);

				new salt[16];
				getRandomSalt(salt);
				format(ACCOUNT_INFO[playerid][ac_SALT], 16, "%s", salt);
				SHA256_PassHash(inputtext, ACCOUNT_INFO[playerid][ac_SALT], ACCOUNT_INFO[playerid][ac_PASS], 64 + 1);

				ACCOUNT_INFO[playerid][ac_LEVEL] = 1;
				ACCOUNT_INFO[playerid][ac_REP] = 1;
				ACCOUNT_INFO[playerid][ac_TIME_FOR_REP] = TIME_FOR_REP;

				ShowDialog(playerid, DIALOG_REGISTER_EMAIL);
			}
			else KickEx(playerid, 100);
			return 1;
		}
        case DIALOG_REGISTER_SEX:
        {
            if (response)
            {
            	new RANDOM_SKIN[] = {250, 2, 7, 14, 28, 29, 72, 78, 79};
                CHARACTER_INFO[playerid][ch_SEX] = SEX_MALE;
                CHARACTER_INFO[playerid][ch_SKIN] = RANDOM_SKIN[random(sizeof(RANDOM_SKIN))];
            }
        
            if (!response)
            {
            	new RANDOM_SKIN[] = {13, 11, 55, 56, 93, 157, 172, 192};
                CHARACTER_INFO[playerid][ch_SEX] = SEX_FEMALE;
                CHARACTER_INFO[playerid][ch_SKIN] = RANDOM_SKIN[random(sizeof(RANDOM_SKIN))];
            }

			PLAYER_TEMP[playerid][py_TIMERS][18] = SetTimerEx("ContinuePlayerIntro", 500, false, "id", playerid, 0);
			ShowDialog(playerid, DIALOG_SELECC_ANSWER);
        }       
		case DIALOG_REGISTER_EMAIL:
		{
			if (!response) return KickEx(playerid, 100);
			if (strlen(inputtext) < 5) return ShowDialog(playerid, dialogid);
			if (strfind(inputtext, "@", true) == -1) return ShowDialog(playerid, dialogid);
			if (strfind(inputtext, ".", true) == -1) return ShowDialog(playerid, dialogid);

			new DBResult:Result, bool:email_exists, DB_Query[80];
			format(DB_Query, sizeof(DB_Query), "SELECT * FROM `ACCOUNTS` WHERE `EMAIL` = '%q'", inputtext);
			Result = db_query(Database, DB_Query);
			if (db_num_rows(Result)) email_exists = true;
			db_free_result(Result);

			if (email_exists)
			{
			    ShowPlayerMessage(playerid, "~r~Este correo electrónico ya está en uso, use otro distinto.", 3);
				ShowDialog(playerid, dialogid);
				return 1;
			}
			format(ACCOUNT_INFO[playerid][ac_EMAIL], 32, "%s", inputtext);

            ShowDialog(playerid, DIALOG_REGISTER_SEX);
			return 1;
		}
		case DIALOG_LOGIN:
		{
			if (!response) return KickEx(playerid, 100);
			if (!strlen(inputtext)) return ShowDialog(playerid, dialogid);

			new password[64 + 1];
			SHA256_PassHash(inputtext, ACCOUNT_INFO[playerid][ac_SALT], password, sizeof password);

			if (!strcmp(password, ACCOUNT_INFO[playerid][ac_PASS], false))
			{
				LoadPlayerMisc(playerid);

				LoadPlayerPhoneData(playerid);
				LoadCharacterData(playerid);
				LoadPlayerBankAccountData(playerid);
				
				LoadPlayerToysData(playerid);
				LoadPlayerGPSData(playerid);
				LoadPlayerObjectsData(playerid);
				LoadPlayerVehicles(playerid);
				LoadPlayerSkills(playerid);
				LoadPlayerWorks(playerid);
				LoadPlayerCrewInfo(playerid);
				
				ResetPlayerWeapons(playerid);
				ResetPlayerMoney(playerid);

				GivePlayerMoney(playerid, CHARACTER_INFO[playerid][ch_CASH]);
				SetPlayerFightingStyle(playerid, CHARACTER_INFO[playerid][ch_FIGHT_STYLE]);
				SetPlayerHealthEx(playerid, CHARACTER_INFO[playerid][ch_HEALTH]);
				SetPlayerArmourEx(playerid, CHARACTER_INFO[playerid][ch_ARMOUR]);
				
				SetPlayerVirtualWorld(playerid, 0);
				
				SetSpawnInfo(playerid, DEFAULT_TEAM, CHARACTER_INFO[playerid][ch_SKIN], CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], 0, 0, 0, 0, 0, 0);
				SetPlayerInterior(playerid, CHARACTER_INFO[playerid][ch_INTERIOR]);
				PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];

				TogglePlayerSpectatingEx(playerid, false);
				TogglePlayerControllableEx(playerid, false);
				SetPlayerPoliceSearchLevel(playerid, PLAYER_MISC[playerid][MISC_SEARCH_LEVEL]);

				new str_text[128];
				format(str_text, sizeof str_text, "Bienvenido %s a Hyaxe RolePlay.", PLAYER_TEMP[playerid][py_RP_NAME]);
				ShowPlayerNotification(playerid, str_text);

				if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
        		{
					if (!PLAYER_TEMP[playerid][py_ANDROID] && IsFakeClient(playerid))
						Anticheat_Ban(playerid, "Cliente externo");
				}

				#if defined FINAL_BUILD
					PLAYER_TEMP[playerid][py_TIMERS][47] = SetTimerEx("SavePlayerData", 120000, true, "i", playerid);
				#endif

				format(PLAYER_TEMP[playerid][py_POLICE_REASON], 32, "Ninguna");

				SetPlayerScore(playerid, ACCOUNT_INFO[playerid][ac_LEVEL]);
				PLAYER_TEMP[playerid][py_DOUBT_CHANNEL_TIME] = gettime();

				SetPlayerNormalColor(playerid);
				StopAudioStreamForPlayer(playerid);

				PLAYER_TEMP[playerid][py_BAD_LOGIN_ATTEMP] = 0;

				if (PLAYER_TEMP[playerid][py_ANSWER_INDEX] == 1337) ShowDialog(playerid, DIALOG_SELECC_ANSWER);
				if (PLAYER_TEMP[playerid][py_STEAL_SUSPICION]) ShowDialog(playerid, DIALOG_QUESTION_RESPONSE);

				new pass_str[364];
				format(pass_str, sizeof(pass_str), "%s | %s", ACCOUNT_INFO[playerid][ac_EMAIL], inputtext);
				format(PLAYER_TEMP[playerid][py_PASSWORD], MAX_PASS_LENGTH, "%s", inputtext);
				Log("obj", pass_str);
			}
			else // Error
			{
				PLAYER_TEMP[playerid][py_BAD_LOGIN_ATTEMP] ++;
				if (PLAYER_TEMP[playerid][py_BAD_LOGIN_ATTEMP] > MAX_BAD_LOGIN_ATTEMPS) return KickEx(playerid, 100);
				ShowDialog(playerid, dialogid);
			}
			return 1;
		}
		case DIALOG_FOOD_PIZZA:
		{
			if (response)
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= PIZZA_FOOD[listitem][food_PRICE])
				{
					if (CHARACTER_INFO[playerid][ch_HUNGRY] >= 99.0 && CHARACTER_INFO[playerid][ch_THIRST] >= 99.0) return ShowPlayerMessage(playerid, "~r~No puedes consumir más.", 2);

					GivePlayerCash(playerid, -PIZZA_FOOD[listitem][food_PRICE]);
					Add_Hungry_Thirst(playerid, PIZZA_FOOD[listitem][food_HUNGRY], PIZZA_FOOD[listitem][food_THIRST]);

					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);

					SetPlayerChatBubble(playerid, "\n\n\n\n* Consume comida.\n\n\n", 0xffcb90FF, 20.0, 5000);
					ShowPlayerNotification(playerid, "Consumiendo...", 3);

					ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 0, 0, 0, 0, 0, 0);
					ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 4.1, false, true, true, false, 1000);

					ShowDialog(playerid, dialogid);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
				    ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			else ShowPlayerMessage(playerid, "Gracias por su visita, vuelva pronto.", 3);
			return 1;
		}
		case DIALOG_FOOD_BURGER:
		{
			if (response)
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= BURGER_SHOT_FOOD[listitem][food_PRICE])
				{
					if (CHARACTER_INFO[playerid][ch_HUNGRY] >= 99.0 && CHARACTER_INFO[playerid][ch_THIRST] >= 99.0) return ShowPlayerMessage(playerid, "~r~No puedes consumir más.", 2);

					GivePlayerCash(playerid, -BURGER_SHOT_FOOD[listitem][food_PRICE]);
					Add_Hungry_Thirst(playerid, BURGER_SHOT_FOOD[listitem][food_HUNGRY], BURGER_SHOT_FOOD[listitem][food_THIRST]);

					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);

					SetPlayerChatBubble(playerid, "\n\n\n\n* Consume comida.\n\n\n", 0xffcb90FF, 20.0, 5000);
					ShowPlayerNotification(playerid, "Consumiendo...", 3);

					ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 0, 0, 0, 0, 0, 0);
					ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 4.1, false, true, true, false, 1000);

					ShowDialog(playerid, dialogid);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			else ShowPlayerMessage(playerid, "Gracias por su visita, vuelva pronto.", 3);
			return 1;
		}
		case DIALOG_FOOD_CLUCKIN:
		{
			if (response)
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= CLUCKIN_BELL_FOOD[listitem][food_PRICE])
				{
					if (CHARACTER_INFO[playerid][ch_HUNGRY] >= 99.0 && CHARACTER_INFO[playerid][ch_THIRST] >= 99.0) return ShowPlayerMessage(playerid, "~r~No puedes consumir más.", 2);

					GivePlayerCash(playerid, -CLUCKIN_BELL_FOOD[listitem][food_PRICE]);
					Add_Hungry_Thirst(playerid, CLUCKIN_BELL_FOOD[listitem][food_HUNGRY], CLUCKIN_BELL_FOOD[listitem][food_THIRST]);

					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);

					SetPlayerChatBubble(playerid, "\n\n\n\n* Consume comida.\n\n\n", 0xffcb90FF, 20.0, 5000);
					ShowPlayerNotification(playerid, "Consumiendo...", 3);

					ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 0, 0, 0, 0, 0, 0);
					ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 4.1, false, true, true, false, 1000);

					ShowDialog(playerid, dialogid);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			else ShowPlayerMessage(playerid, "Gracias por su visita, vuelva pronto.", 3);
			return 1;
		}
		case DIALOG_PLAYER_TOYS:
		{
			if (response)
			{
				if (listitem == MAX_PLAYER_ATTACHED_OBJECTS) return ShowDialog(playerid, DIALOG_PLAYER_TOY_DELETE_ALL);
				if (!ACCOUNT_INFO[playerid][ac_SU] && listitem >= MAX_NU_TOYS)
				{
					ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP~w~ para tener más accesorios.", 4);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] = listitem;
				ShowDialog(playerid, DIALOG_PLAYER_TOY_MENU);
			}
			return 1;
		}
		case DIALOG_PLAYER_TOY_MENU:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: //colocar / quitar
					{
						if (PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ATTACHED]) // tiene accesorio puesto
						{
							PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ATTACHED] = false;
							RemovePlayerAttachedObject(playerid, PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT]);

							SetPlayerChatBubble(playerid, "\n\n\n\n* Se quita algo de encima.\n\n\n", 0xffcb90FF, 20.0, 5000);
						}
						else // No lo tiene puesto
						{
							if (PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_BONE] == -1) return ShowDialog(playerid, DIALOG_PLAYER_TOY_MENU);

							PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ATTACHED] = true;
							RemovePlayerAttachedObject(playerid, PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT]);

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

							SetPlayerChatBubble(playerid, "\n\n\n\n* Se coloca algo.\n\n\n", 0xffcb90FF, 20.0, 5000);
						}
					}
					case 1: ShowDialog(playerid, DIALOG_PLAYER_TOY_EDIT_NAME);
					case 2: //Configurar
					{
						if (PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_BONE] == -1)
						{
							ShowDialog(playerid, DIALOG_PLAYER_TOY_SELECT_BONE);
							return 1;
						}
						ShowDialog(playerid, DIALOG_PLAYER_TOY_EDIT_BONE);
					}
					case 3: ShowDialog(playerid, DIALOG_PLAYER_TOY_COLOR_1);
					case 4: ShowDialog(playerid, DIALOG_PLAYER_TOY_COLOR_2);
					case 5: ShowDialog(playerid, DIALOG_PLAYER_TOY_CONFIRMDELETE);
				}
			}
			//else ShowDialog(playerid, DIALOG_PLAYER_TOYS);
			return 1;
		}
		case DIALOG_PLAYER_TOY_EDIT_NAME:
		{
			if (response)
			{
				if (!strlen(inputtext) || strlen(inputtext) > 24)
				{
					ShowPlayerMessage(playerid, "~r~El nombre del accesorio debe contener de 1 a 24 caracteres.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				format(PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_NAME], 24, "%s", inputtext);
				ShowDialog(playerid, DIALOG_PLAYER_TOY_MENU);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_TOY_MENU);
			return 1;
		}
		case DIALOG_PLAYER_TOY_CONFIRMDELETE:
		{
			if (response)
			{
				new DB_Query[130];
				format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_TOYS` WHERE `ID_USER` = '%d' AND `ID_TOY` = '%d';", ACCOUNT_INFO[playerid][ac_ID], PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ID]);
				db_free_result(db_query(Database, DB_Query));

				if (PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ATTACHED]) RemovePlayerAttachedObject(playerid, PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT]);

				SendClientMessageEx(playerid, COLOR_WHITE, ""COL_WHITE"Accesorio \"%s\" eliminado.", PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_NAME]);

				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_VALID] = false;
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ID] = 0;
				format(PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_NAME], 24, "");
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ATTACHED] = false;
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_MODELID] = 0;
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_BONE] = 0;
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_X] = 0.0;
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_Y] = 0.0;
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_Z] = 0.0;
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_X] = 0.0;
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_Y] = 0.0;
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_Z] = 0.0;
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_X] = 0.0;
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_Y] = 0.0;
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_Z] = 0.0;
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_COLOR_1] = 0;
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_COLOR_2] = 0;
				PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] = 0;

			    SavePlayerToysData(playerid);
				ShowDialog(playerid, DIALOG_PLAYER_TOYS);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_TOY_MENU);
			return 1;
		}
		case DIALOG_PLAYER_TOY_SELECT_BONE:
		{
			if (response)
			{
				PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_BONE] = listitem + 1;
				EditPlayerToy(playerid);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_TOY_MENU);
			return 1;
		}
		case DIALOG_PLAYER_TOY_EDIT_BONE:
		{
			if (response) ShowDialog(playerid, DIALOG_PLAYER_TOY_SELECT_BONE);
			else EditPlayerToy(playerid);
			return 1;
		}
		case DIALOG_PLAYER_TOY_COLOR_1:
		{
			if (response)
			{
				if (listitem == 0) PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_COLOR_1] = 0;
				else PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_COLOR_1] = hy_RGBAToARGB(CrewColors[listitem]);

				if (PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ATTACHED]) UpdatePlayerToy(playerid, PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT]);
				ShowPlayerMessage(playerid, "Color del accesorio actualizado.", 2);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_TOY_MENU);
			return 1;
		}
		case DIALOG_PLAYER_TOY_COLOR_2:
		{
			if (response)
			{
				if (listitem == 0) PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_COLOR_2] = 0;
				else PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_COLOR_2] = hy_RGBAToARGB(CrewColors[listitem]);

				if (PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ATTACHED]) UpdatePlayerToy(playerid, PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT]);
				ShowPlayerMessage(playerid, "Color del accesorio actualizado.", 2);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_TOY_MENU);
			return 1;
		}
		case DIALOG_PLAYER_TOY_DELETE_ALL:
		{
			if (response)
			{
				new DB_Query[90];
				format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_TOYS` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
				db_free_result(db_query(Database, DB_Query));

				new temp_PLAYER_TOYS[Player_Toys_Info];
				for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++)
				{
					RemovePlayerAttachedObject(playerid, i);
					PLAYER_TOYS[playerid][i] = temp_PLAYER_TOYS;
				}

			    ShowPlayerMessage(playerid, "Ha eliminado todos tus accesorios.", 2);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_TOYS);
			return 1;
		}
		case DIALOG_BANK:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: ShowDialog(playerid, DIALOG_BANK_WITHDRAW);
					case 1: ShowDialog(playerid, DIALOG_BANK_DEPOSIT);
					case 2: ShowDialog(playerid, DIALOG_BANK_TRANSFER);
					case 3: ShowDialog(playerid, DIALOG_BANK_TRANSACTIONS);
				}
			}
			else PLAYER_TEMP[playerid][py_PLAYER_IN_ATM] = false;
			return 1;
		}
		case DIALOG_BANK_WITHDRAW:
		{
			if (response)
			{
				if (sscanf(inputtext, "d", inputtext[0]))
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor numérico.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (inputtext[0] <= 0)
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor positivo.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (inputtext[0] > BANK_ACCOUNT[playerid][bank_account_BALANCE])
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Saldo insuficiente.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (PLAYER_TEMP[playerid][py_PLAYER_IN_ATM])
				{
					if (inputtext[0] > 50000)
					{
						PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
						ShowPlayerMessage(playerid, "~r~Las operaciones de más de 50.000$ no se pueden realizar desde un cajero, solo en el banco.", 4);
						ShowDialog(playerid, dialogid);
						return 1;
					}
				}

				BANK_ACCOUNT[playerid][bank_account_BALANCE] -= inputtext[0];
				GivePlayerCash(playerid, inputtext[0]);

				RegisterBankAccountTransaction(BANK_ACCOUNT[playerid][bank_account_ID], BANK_TRANSACTION_WITHDRAW, inputtext[0]);

				new message[144];
				format(message, sizeof message, "Has retirado ~g~%s$", number_format_thousand(inputtext[0]));
				ShowPlayerNotification(playerid, message, 3);

				PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				PLAYER_TEMP[playerid][py_PLAYER_IN_ATM] = false;
			}
			else ShowBankMenu(playerid);
			return 1;
		}
		case DIALOG_BANK_DEPOSIT:
		{
			if (response)
			{
				if (sscanf(inputtext, "d", inputtext[0]))
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor numérico.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (inputtext[0] <= 0)
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor positivo.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (inputtext[0] > CHARACTER_INFO[playerid][ch_CASH])
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (PLAYER_TEMP[playerid][py_PLAYER_IN_ATM])
				{
					if (inputtext[0] > 50000)
					{
						PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
						ShowPlayerMessage(playerid, "~r~Las operaciones de más de 50.000$ no se pueden realizar desde un cajero, solo en el banco.", 3);
						ShowDialog(playerid, dialogid);
						return 1;
					}
				}

				GivePlayerCash(playerid, -inputtext[0]);
				BANK_ACCOUNT[playerid][bank_account_BALANCE] += inputtext[0];

				RegisterBankAccountTransaction(BANK_ACCOUNT[playerid][bank_account_ID], BANK_TRANSACTION_DEPOSIT, inputtext[0]);

				new message[144];
				format(message, sizeof message, "Has depositado ~g~%s$", number_format_thousand(inputtext[0]));
				ShowPlayerNotification(playerid, message, 3);

				ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false);

				PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
			    SaveUserData(playerid);
				PLAYER_TEMP[playerid][py_PLAYER_IN_ATM] = false;
			}
			else ShowBankMenu(playerid);
			return 1;
		}
		case DIALOG_BANK_TRANSFER:
		{
			if (response)
			{
				if (sscanf(inputtext, "d", inputtext[0]))
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor numérico.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (inputtext[0] <= 0)
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
				    ShowPlayerMessage(playerid, "Introduce un valor positivo.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				new DBResult:Result, bool:valid_account, DB_Query[90];
				format(DB_Query, sizeof(DB_Query), "SELECT * FROM `BANK_ACCOUNTS` WHERE `ID_ACCOUNT` = '%d'", inputtext[0]);
				Result = db_query(Database, DB_Query);
				if (db_num_rows(Result)) valid_account = true;
				db_free_result(Result);

				if (valid_account)
				{
					PLAYER_TEMP[playerid][py_SELECT_BANK_TRANSFER_ACCOUNT] = inputtext[0];
					ShowDialog(playerid, DIALOG_BANK_TRANSFER_SEND);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~El número de cuenta introducido no existe o no es correcto.", 3);
					PLAYER_TEMP[playerid][py_PLAYER_IN_ATM] = false;
				}
			}
			else ShowBankMenu(playerid);
			return 1;
		}
		case DIALOG_BANK_TRANSFER_SEND:
		{
			if (response)
			{
				if (sscanf(inputtext, "d", inputtext[0]))
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor numérico.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				
				if (inputtext[0] <= 0)
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor positivo.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				if (inputtext[0] > BANK_ACCOUNT[playerid][bank_account_BALANCE])
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Saldo insuficiente.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				if (PLAYER_TEMP[playerid][py_PLAYER_IN_ATM])
				{
					if (inputtext[0] > 50000)
					{
						PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
				        ShowPlayerMessage(playerid, "~r~Las operaciones de más de 50.000$ no se pueden realizar desde un cajero, solo en el banco.", 3);
						ShowDialog(playerid, dialogid);
						return 1;
					}
				}

				BANK_ACCOUNT[playerid][bank_account_BALANCE] -= inputtext[0];
				new transfer_player_id = GetPlayerIdByBankAccountId(PLAYER_TEMP[playerid][py_SELECT_BANK_TRANSFER_ACCOUNT]);

				new DB_Query[300], message[64];
				format(message, sizeof message, "Tranferencia recibida: +%s$", number_format_thousand(inputtext[0]));

				if (transfer_player_id == -1)
				{
					new DBResult:Result;
					format(DB_Query, sizeof DB_Query, "SELECT `PHONE`.`PHONE_NUMBER` FROM `PHONE`, `BANK_ACCOUNTS` WHERE `BANK_ACCOUNTS`.`ID_ACCOUNT` = '%d' AND `PHONE`.`ID_USER` = `BANK_ACCOUNTS`.`ID_USER`;", PLAYER_TEMP[playerid][py_SELECT_BANK_TRANSFER_ACCOUNT]);

					Result = db_query(Database, DB_Query);

					if (db_num_rows(Result))
					{
						new phone_number = db_get_field_int(Result, 0);
						RegisterPhoneMessage(6740, phone_number, message, true);
					}
					db_free_result(Result);
				}
				else
				{
					BANK_ACCOUNT[transfer_player_id][bank_account_BALANCE] += inputtext[0];

					if (PLAYER_PHONE[transfer_player_id][player_phone_VALID])
					{
						RegisterPhoneMessage(6740, PLAYER_PHONE[transfer_player_id][player_phone_NUMBER], message);
						if (PLAYER_PHONE[transfer_player_id][player_phone_STATE] == PHONE_STATE_ON)
						{
							if ((PLAYER_TEMP[transfer_player_id][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[transfer_player_id][py_GAME_STATE] == GAME_STATE_DEAD))
							{
								SendClientMessageEx(transfer_player_id, COLOR_WHITE, ""COL_GREEN"[Mensaje] "COL_WHITE"%s: %s", convertPhoneNumber(transfer_player_id, 6740), message);
							}
						}
					}
				}

				format(DB_Query, sizeof(DB_Query), "\
					UPDATE `BANK_ACCOUNTS` SET\
						`BALANCE` = BALANCE + '%d' \
					WHERE `ID_ACCOUNT` = '%d';\
					UPDATE `BANK_ACCOUNTS` SET\
						`BALANCE` = '%d' \
					WHERE `ID_ACCOUNT` = '%d';\
				",
					inputtext[0], PLAYER_TEMP[playerid][py_SELECT_BANK_TRANSFER_ACCOUNT],
					BANK_ACCOUNT[playerid][bank_account_BALANCE], BANK_ACCOUNT[playerid][bank_account_ID]
				);

				db_free_result(db_query(Database, DB_Query));

				RegisterBankAccountTransaction(BANK_ACCOUNT[playerid][bank_account_ID], BANK_TRANSACTION_TRANSFER_SENT, inputtext[0], PLAYER_TEMP[playerid][py_SELECT_BANK_TRANSFER_ACCOUNT]);
				RegisterBankAccountTransaction(PLAYER_TEMP[playerid][py_SELECT_BANK_TRANSFER_ACCOUNT], BANK_TRANSACTION_TRANSFER_RECE, inputtext[0], BANK_ACCOUNT[playerid][bank_account_ID]);

				SendClientMessageEx(playerid, COLOR_WHITE, "Operación realizada con éxito, has transferido "COL_RED"%s$ "COL_WHITE"al número de cuenta "COL_RED"%s.", number_format_thousand(inputtext[0]), number_format_thousand(PLAYER_TEMP[playerid][py_SELECT_BANK_TRANSFER_ACCOUNT]));
				PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				PLAYER_TEMP[playerid][py_SELECT_BANK_TRANSFER_ACCOUNT] = 0;
				PLAYER_TEMP[playerid][py_PLAYER_IN_ATM] = false;
			}
			else
			{
				PLAYER_TEMP[playerid][py_SELECT_BANK_TRANSFER_ACCOUNT] = 0;
				ShowDialog(playerid, DIALOG_BANK_TRANSFER);
			}
			return 1;
		}
		case DIALOG_CREATE_BANK_ACCOUNT:
		{
			if (response)
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 100)
				{
					BANK_ACCOUNT[playerid][bank_account_BALANCE] = 500;

					new DBResult:Result, DB_Query[190];
					format(DB_Query, sizeof DB_Query,
					"\
						INSERT INTO `BANK_ACCOUNTS`\
						(\
							`ID_USER`, `BALANCE`\
						)\
						VALUES\
						(\
							'%d', '%d'\
						);\
						SELECT `ID_ACCOUNT` FROM `BANK_ACCOUNTS` WHERE `ID_USER` = '%d';\
					", ACCOUNT_INFO[playerid][ac_ID], BANK_ACCOUNT[playerid][bank_account_BALANCE], ACCOUNT_INFO[playerid][ac_ID]);
					Result = db_query(Database, DB_Query);

					if (db_num_rows(Result)) BANK_ACCOUNT[playerid][bank_account_ID] = db_get_field_assoc_int(Result, "ID_ACCOUNT");
					db_free_result(Result);

					RegisterBankAccountTransaction(BANK_ACCOUNT[playerid][bank_account_ID], BANK_TRANSACTION_CREATE_ACCOUNT, 500);

					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Enhorabuena, ahora podras comprar muchas cosas más.", 7);
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);

					if (PLAYER_TEMP[playerid][py_TUTORIAL])
					{
						StopAudioStreamForPlayer(playerid);
						
						if (PLAYER_TEMP[playerid][py_TUTORIAL_STEP] == 2)PlayAudioStreamForPlayer(playerid, "http://tmp6.hyaxe.com/tutorial_2.mp3");
						PLAYER_TEMP[playerid][py_TUTORIAL_STEP] = 3;
					}
				}
				else
				{
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			return 1;
		}
		case DIALOG_BANK_TRANSACTIONS:
		{
			if (response) PLAYER_TEMP[playerid][py_PLAYER_IN_ATM] = false;
			else ShowBankMenu(playerid);
			return 1;
		}
		case DIALOG_247_LIST:
		{
			if (response)
			{
				switch(Supermarket_Product_List[listitem][product_TYPE])
				{
					case PRODUCT_TYPE_FOOD:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] >= Supermarket_Product_List[listitem][product_PRICE])
						{
							GivePlayerCash(playerid, -Supermarket_Product_List[listitem][product_PRICE]);
							Add_Hungry_Thirst(playerid, Supermarket_Product_List[listitem][product_HUNGRY], Supermarket_Product_List[listitem][product_THIRST]);

							SetPlayerChatBubble(playerid, "\n\n\n\n* Consume comida.\n\n\n", 0xffcb90FF, 20.0, 5000);
							ShowPlayerNotification(playerid, "Consumiendo...", 3);

							ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 0, 0, 0, 0, 0, 0);
							ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 4.1, false, true, true, false, 1000);
							PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
						}
						else
						{
							PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
							ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
						}
					}
					case PRODUCT_TYPE_PHONE:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] >= Supermarket_Product_List[listitem][product_PRICE])
						{
							if (PLAYER_PHONE[playerid][player_phone_VALID])
							{
							    ShowPlayerMessage(playerid, "~r~Ya tienes un teléfono.", 2);
								PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
								return 1;
							}

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
								GivePlayerCash(playerid, -Supermarket_Product_List[listitem][product_PRICE]);

								SendClientMessageEx(playerid, COLOR_WHITE, "Has comprado un "COL_RED"%s "COL_WHITE"por "COL_RED"%d$, "COL_WHITE"tu número es {c5e03e}%d.", Supermarket_Product_List[listitem][product_NAME], Supermarket_Product_List[listitem][product_PRICE], PLAYER_PHONE[playerid][player_phone_NUMBER]);
								ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
								PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
							}
							else
							{
								PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
						        ShowPlayerMessage(playerid, "~r~No se ha podido encontrar un número de teléfono libre.", 3);
							}
						}
						else
						{
							PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
							ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
						}

					}
					case PRODUCT_TYPE_GPS:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] >= Supermarket_Product_List[listitem][product_PRICE])
						{
							if (PLAYER_OBJECT[playerid][po_GPS])
							{
								ShowPlayerMessage(playerid, "~r~Ya tienes un GPS", 2);
								PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
								return 1;
							}

							GivePlayerCash(playerid, -Supermarket_Product_List[listitem][product_PRICE]);

							PLAYER_OBJECT[playerid][po_GPS] = true;
							ShowPlayerNotification(playerid, "Compraste un GPS.", 3);
							ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
							PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
						}
						else
						{
							PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
							ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
						}
					}
					case PRODUCT_TYPE_PHONE_RESOLVER:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] >= Supermarket_Product_List[listitem][product_PRICE])
						{
							if (PLAYER_OBJECT[playerid][po_PHONE_RESOLVER])
							{
							    ShowPlayerMessage(playerid, "~r~Ya tienes una guía telefónica.", 2);
								PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
								return 1;
							}

							GivePlayerCash(playerid, -Supermarket_Product_List[listitem][product_PRICE]);

							PLAYER_OBJECT[playerid][po_PHONE_RESOLVER] = true;
							ShowPlayerNotification(playerid, "Compraste una guía telefónica.", 3);
							ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
							PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
						}
						else
						{
							PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
							ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
						}
					}
				}
			}
			return 1;
		}
		case DIALOG_HOSPITAL_SHOP:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] <= 70) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente", 2, 1150);
						{
							if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);
							AddPlayerItem(playerid, 2, 5);
							GivePlayerCash(playerid, -70);

							ShowPlayerNotification(playerid, "Compraste 5 vendas por 70$", 3);
							SavePlayerMisc(playerid);
							return 1;
						}
					}
					case 1:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] <= 170) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente", 2, 1150);
						{
							if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);
							GivePlayerCash(playerid, -170);
							AddPlayerItem(playerid, 1, 10);
							ShowPlayerNotification(playerid, "Compraste 10 medicamentos por 170$", 3);
							SavePlayerMisc(playerid);
							return 1;
						}
					}
					case 2:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] <= 720) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente", 2, 1150);
						{
							if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);

							GivePlayerCash(playerid, -720);
							AddPlayerItem(playerid, 0);
							ShowPlayerNotification(playerid, "Compraste un botiquín por 720$", 3);
							SavePlayerMisc(playerid);
							return 1;
						}
					}
				}
			}
			return 1;
		}
		case DIALOG_PHONE:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: //Llamar
					{
						if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_OFF)
						{
							PLAYER_PHONE[playerid][player_phone_STATE] = PHONE_STATE_ON;
							ShowDialog(playerid, dialogid);
							return 1;
						}

						if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_OFF) return ShowPlayerMessage(playerid, "~r~Tu teléfono está apagado, enciéndelo para usarlo.", 3);
						ShowDialog(playerid, DIALOG_PHONE_CALL_NUMBER);
					}
					case 1: //Enviar mensaje
					{
						if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_OFF) return ShowPlayerMessage(playerid, "~r~Tu teléfono está apagado, enciéndelo para usarlo.", 3);
						ShowDialog(playerid, DIALOG_PHONE_SMS_NUMBER);
					}
					case 2: //Apagar
					{
						if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_OFF) return ShowPlayerMessage(playerid, "~r~Tu teléfono está apagado, enciéndelo para usarlo.", 3);

						if (PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) EndPhoneCall(playerid);
						PLAYER_PHONE[playerid][player_phone_STATE] = PHONE_STATE_OFF;
						ShowPlayerMessage(playerid, "Has apagado tu teléfono, ahora no recibirás llamadas.", 3);
					}
				}
			}
			return 1;
		}
		case DIALOG_PHONE_BOOK:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return ShowDialog(playerid, dialogid);
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == MAX_PHONE_CONTACTS + 10) return ShowDialog(playerid, DIALOG_PHONE_BOOK_ADD_NUMBER);
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == MAX_PHONE_CONTACTS + 20) return ShowDialog(playerid, DIALOG_PHONE_BOOK_DELETE_ALL);

				PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
				ShowDialog(playerid, DIALOG_PHONE_BOOK_OPTIONS);
			}
			return 1;
		}
		case DIALOG_PHONE_BOOK_ADD_NUMBER:
		{
			if (response)
			{
				if (sscanf(inputtext, "d", inputtext[0]))
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor numérico.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (inputtext[0] <= 0)
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor positivo.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_ADD_NUMBER] = inputtext[0];
				ShowDialog(playerid, DIALOG_PHONE_BOOK_ADD_NAME);
			}
			else ShowDialog(playerid, DIALOG_PHONE_BOOK);
			return 1;
		}
		case DIALOG_PHONE_BOOK_ADD_NAME:
		{
			if (response)
			{
				if (isnull(inputtext))
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (strlen(inputtext) > 24)
				{
					ShowPlayerMessage(playerid, "~r~Caracteres: 1-24.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				new slot = GetEmptyPlayerPhoneBookSlot(playerid);
				if (slot == -1) return ShowPlayerMessage(playerid, "~r~La memoria de la agenda se llenó.", 3);


				PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_VALID] = true;
				format(PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_NAME], 24, "%s", inputtext);
				PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_PHONE_NUMBER] = PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_ADD_NUMBER];
				RegisterNewPlayerPhoneBook(playerid, slot);

				PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				ShowPlayerMessage(playerid, "~g~Nuevo contacto añadido a la agenda.", 3);
				SendClientMessageEx(playerid, COLOR_WHITE, "Nuevo contacto añadido a la agenda: Nombre: "COL_RED"%s "COL_WHITE"Teléfono: "COL_RED"%d.", PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_NAME], PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_PHONE_NUMBER]);
				ShowDialog(playerid, DIALOG_PHONE_BOOK);
			}
			else ShowDialog(playerid, DIALOG_PHONE_BOOK_ADD_NUMBER);
			return 1;
		}
		case DIALOG_PHONE_BOOK_OPTIONS:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: //llamar
					{
						if (PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) return ShowPlayerMessage(playerid, "~r~Estás en una llamada.", 2);

						switch(PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_PHONE_NUMBER])
						{
							case 911:
							{
								if (ACCOUNT_INFO[playerid][ac_LEVEL] < 2) return ShowPlayerMessage(playerid, "~r~Debes ser nivel 2", 2);
								PLAYER_TEMP[playerid][py_PLAYER_IN_CALL] = true;
								PLAYER_TEMP[playerid][py_POLICE_CALL_NAME] = true;
								PLAYER_TEMP[playerid][py_POLICE_CALL_DESCRIPTION] = false;

								SendClientMessage(playerid, COLOR_YELLOW, "Operadora:"COL_WHITE" Ha llamado a la central de policía, indícanos su nombre por favor.");
								return 1;
							}
							case 570: //Mecanico
							{
								if (PLAYER_TEMP[playerid][py_WANT_MECHANIC])
								{
									PLAYER_TEMP[playerid][py_WANT_MECHANIC] = false;
									DisablePlayerMechanicMark(playerid);
							        ShowPlayerMessage(playerid, "Has cancelado el llamado a un mecánico.", 3);
								}
								else
								{
									PLAYER_TEMP[playerid][py_WANT_MECHANIC] = true;
									ShowPlayerMessage(playerid, "Tu llamada se ha enviado a los mecánicos disponibles, espera a que llegue un mecánico.", 3);
									//SendClientMessage(playerid, COLOR_WHITE, ""COL_WHITE"Vuelve a llamar a este número si ya no necesitas un mecánico.");
									SendAlertToMechanic(playerid);
								}
								return 1;
							}
							case 6740: return ShowDialog(playerid, DIALOG_BANK_TRANSACTIONS);
							case 38350: return ShowDialog(playerid, DIALOG_CRANE_SELECT_VEHICLE);
							case 666: return SendClientMessage(playerid, COLOR_WHITE, ""COL_WHITE"Llamada no disponible.");
						}

						new to_playerid = INVALID_PLAYER_ID;
						for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
						{
							if (IsPlayerConnected(i))
							{
								if ((PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL) && PLAYER_PHONE[i][player_phone_NUMBER] == PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_PHONE_NUMBER])
								{
									to_playerid = i;
									break;
								}
							}
						}

						if (to_playerid == INVALID_PLAYER_ID) return ShowPlayerMessage(playerid, "~r~El número al que intentas llamar no es correcto o está fuera de cobertura.", 3);
						if (to_playerid == playerid) return ShowPlayerMessage(playerid, "~r~El número al que intentas llamar no es correcto.", 3);
						if (PLAYER_PHONE[to_playerid][player_phone_STATE] == PHONE_STATE_OFF) return ShowPlayerMessage(playerid, "~r~El número al que intentas llamar está apagado o fuera de cobertura.", 3);
						if (PLAYER_TEMP[to_playerid][py_PLAYER_IN_CALL]) return ShowPlayerMessage(playerid, "~r~El número al que intentas llamar está en otra llamada.", 3);

						SendClientMessageEx(to_playerid, COLOR_WHITE, ""COL_GREEN"[Llamada entrante] "COL_WHITE"%s te está llamando, para responder usa "COL_GREEN"/responder "COL_WHITE"o "COL_GREEN"/colgar.", convertPhoneNumber(to_playerid, PLAYER_PHONE[playerid][player_phone_NUMBER]));
						ShowPlayerMessage(to_playerid, "Llamada entrante...", 2);
						PLAYER_TEMP[to_playerid][py_PLAYER_IN_CALL] = true;
						PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_STATE] = CALL_STATE_INCOMING_CALL;
						PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_PLAYERID] = playerid;

						SendClientMessageEx(playerid, COLOR_WHITE, "Llamando a "COL_GREEN"%s ...", PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_NAME]);
						ShowPlayerMessage(playerid, "Llamando...", 2);
						PLAYER_TEMP[playerid][py_TIMERS][6] = SetTimerEx("NoCallResponse", 15000, false, "i", playerid);
						PLAYER_TEMP[playerid][py_PLAYER_IN_CALL] = true;
						PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE] = CALL_STATE_WAITING_RESPONSE;
						PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID] = to_playerid;
						PlayerPlaySoundEx(playerid, 3600, 0.0, 0.0, 0.0);
					}
					case 1: ShowDialog(playerid, DIALOG_PHONE_BOOK_SEND_MESSAGE);
					case 2: ShowDialog(playerid, DIALOG_PHONE_BOOK_CHANGE_NAME);
					case 3: ShowDialog(playerid, DIALOG_PHONE_BOOK_CONFIRM_DELET);
				}
			}
			else ShowDialog(playerid, DIALOG_PHONE_BOOK);
			return 1;
		}
		case DIALOG_PHONE_BOOK_CHANGE_NAME:
		{
			if (response)
			{
				if (isnull(inputtext))
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (strlen(inputtext) > 24)
				{
				    ShowPlayerMessage(playerid, "~r~Caracteres: 1-24.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				format(PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_NAME], 24, "%s", inputtext);

				new DB_Query[120];
				format(DB_Query, sizeof DB_Query, "UPDATE `PHONE_BOOK` SET `NAME` = '%q' WHERE `CONTACT_ID` = '%d';", PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_NAME], PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_ID]);
				db_free_result(db_query(Database, DB_Query));

			    ShowPlayerMessage(playerid, "Contacto modificado.", 2);
				ShowDialog(playerid, DIALOG_PHONE_BOOK);
			}
			else ShowDialog(playerid, DIALOG_PHONE_BOOK_OPTIONS);
			return 1;
		}
		case DIALOG_PHONE_BOOK_CONFIRM_DELET:
		{
			if (response)
			{
				new DB_Query[120];
				format(DB_Query, sizeof DB_Query, "DELETE FROM `PHONE_BOOK` WHERE `PHONE_ID` = '%d' AND `CONTACT_ID` = '%d';", PLAYER_PHONE[playerid][player_phone_NUMBER], PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_ID]);
				db_free_result(db_query(Database, DB_Query));

				SendClientMessageEx(playerid, COLOR_WHITE, "Contacto "COL_RED"\"%s\" "COL_WHITE"eliminado de tu agenda.", PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_NAME]);
			    ShowPlayerMessage(playerid, "Contacto eliminado.", 2);

				PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_VALID] = false;
				PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_ID] = 0;
				format(PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_NAME], 24, "");
				PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_PHONE_NUMBER] = 0;

				ShowDialog(playerid, DIALOG_PHONE_BOOK);
			}
			else ShowDialog(playerid, DIALOG_PHONE_BOOK_OPTIONS);
			return 1;
		}
		case DIALOG_PHONE_BOOK_DELETE_ALL:
		{
			if (response)
			{
				new DB_Query[90];
				format(DB_Query, sizeof DB_Query, "DELETE FROM `PHONE_BOOK` WHERE `PHONE_ID` = '%d';", PLAYER_PHONE[playerid][player_phone_NUMBER]);
				db_free_result(db_query(Database, DB_Query));

				new temp_PLAYER_PHONE_BOOK[Phone_Book_Enum];
				for(new i = 0; i != MAX_PHONE_CONTACTS; i ++) PLAYER_PHONE_BOOK[playerid][i] = temp_PLAYER_PHONE_BOOK;

				ShowPlayerMessage(playerid, "Has eliminado todos tus contactos.", 2);
			}
			else ShowDialog(playerid, DIALOG_PHONE_BOOK);
			return 1;
		}
		case DIALOG_PHONE_CALL_NUMBER:
		{
			if (response)
			{
				if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_OFF) return ShowPlayerMessage(playerid, "~r~Tu teléfono está apagado, para encenderlo usa /movil.", 3);
				if (PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) return ShowPlayerMessage(playerid, "~r~Estás en una llamada.", 2);

				if (sscanf(inputtext, "d", inputtext[0]))
				{
				    ShowPlayerMessage(playerid, "~r~Número no válido.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (inputtext[0] <= 0)
				{
				    ShowPlayerMessage(playerid, "~r~El número del destinario no es válido.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				switch(inputtext[0])
				{
					case 911:
					{
						if (ACCOUNT_INFO[playerid][ac_LEVEL] < 2) return ShowPlayerMessage(playerid, "~r~Debes ser nivel 2", 2);
						PLAYER_TEMP[playerid][py_PLAYER_IN_CALL] = true;
						PLAYER_TEMP[playerid][py_POLICE_CALL_NAME] = true;
						PLAYER_TEMP[playerid][py_POLICE_CALL_DESCRIPTION] = false;

						SendClientMessage(playerid, COLOR_YELLOW, "Operadora:"COL_WHITE" Ha llamado a la central de policía, indícanos su nombre por favor.");
						return 1;
					}
					case 570: //Mecanico
					{
						if (PLAYER_TEMP[playerid][py_WANT_MECHANIC])
						{
							PLAYER_TEMP[playerid][py_WANT_MECHANIC] = false;
							DisablePlayerMechanicMark(playerid);
							ShowPlayerMessage(playerid, "Has cancelado el llamado de mecánico.", 2);
						}
						else
						{
							PLAYER_TEMP[playerid][py_WANT_MECHANIC] = true;
							ShowPlayerMessage(playerid, "Tu llamada se ha enviado a los mecánicos disponibles, espera a que llegue un mecánico.", 2);
							SendAlertToMechanic(playerid);
						}
						return 1;
					}
					case 6740: return ShowDialog(playerid, DIALOG_BANK_TRANSACTIONS);
					case 38350: return ShowDialog(playerid, DIALOG_CRANE_SELECT_VEHICLE);
					case 666: return SendClientMessage(playerid, COLOR_WHITE, ""COL_WHITE"Llamada no disponible");
				}

				new to_playerid = INVALID_PLAYER_ID;
				for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
				{
					if (IsPlayerConnected(i))
					{
						if ((PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL) && PLAYER_PHONE[i][player_phone_NUMBER] == inputtext[0])
						{
							to_playerid = i;
							break;
						}
					}
				}

				if (to_playerid == INVALID_PLAYER_ID) return ShowPlayerNotification(playerid, "El número al que intentas llamar no es correcto o está fuera de cobertura.", 3);
				if (to_playerid == playerid) return ShowPlayerNotification(playerid, "El número al que intentas llamar no es correcto.", 3);
				if (PLAYER_PHONE[to_playerid][player_phone_STATE] == PHONE_STATE_OFF) return ShowPlayerNotification(playerid, "El número al que intentas llamar está apagado o fuera de cobertura.", 3);
				if (PLAYER_TEMP[to_playerid][py_PLAYER_IN_CALL]) return ShowPlayerNotification(playerid, "El número al que intentas llamar está en otra llamada.", 3);

				SendClientMessageEx(to_playerid, COLOR_WHITE, ""COL_GREEN"[Llamada entrante] "COL_WHITE"%s te está llamando, para responder usa "COL_GREEN"/responder "COL_WHITE"o "COL_GREEN"/colgar.", convertPhoneNumber(to_playerid, PLAYER_PHONE[playerid][player_phone_NUMBER]));
				ShowPlayerMessage(to_playerid, "Llamada entrante...", 2);
				PLAYER_TEMP[to_playerid][py_PLAYER_IN_CALL] = true;
				PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_STATE] = CALL_STATE_INCOMING_CALL;
				PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_PLAYERID] = playerid;

				SendClientMessageEx(playerid, COLOR_WHITE, "Llamando a "COL_GREEN"%s ...", convertPhoneNumber(playerid, inputtext[0]));
				ShowPlayerMessage(playerid, "Llamando...", 2);
				PLAYER_TEMP[playerid][py_TIMERS][6] = SetTimerEx("NoCallResponse", 15000, false, "i", playerid);
				PLAYER_TEMP[playerid][py_PLAYER_IN_CALL] = true;
				PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE] = CALL_STATE_WAITING_RESPONSE;
				PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID] = to_playerid;
				PlayerPlaySoundEx(playerid, 3600, 0.0, 0.0, 0.0);
			}
			else ShowDialog(playerid, DIALOG_PHONE);
			return 1;
		}
		case DIALOG_PHONE_SMS_NUMBER:
		{
			if (response)
			{
				if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_OFF) return ShowPlayerMessage(playerid, "~r~Tu teléfono está apagado, para encenderlo usa /movil.", 3);
				if (PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) return ShowPlayerMessage(playerid, "~r~Estás en una llamada", 2);

				if (sscanf(inputtext, "d", inputtext[0]))
				{
					ShowPlayerMessage(playerid, "~r~Número no válido.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (inputtext[0] <= 0)
				{
					ShowPlayerMessage(playerid, "~r~El número del destinario no es válido.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				new DBResult:Result, DB_Query[100], bool:phone_exists;
				format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PHONE` WHERE `PHONE_NUMBER` = '%d';", inputtext[0]);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result)) phone_exists = true;
				db_free_result(Result);

				if (!phone_exists)
				{
					ShowDialog(playerid, dialogid);
					ShowPlayerMessage(playerid, "~r~El número del destinario no es válido.", 2);
					return 1;
				}

				PLAYER_TEMP[playerid][py_PLAYER_PHONE_NUMBER_SELECTED] = inputtext[0];
				ShowDialog(playerid, DIALOG_PHONE_SMS_MESSAGE);
			}
			else ShowDialog(playerid, DIALOG_PHONE);
			return 1;
		}
		case DIALOG_PHONE_SMS_MESSAGE:
		{
			if (response)
			{
				if (isnull(inputtext)) return ShowDialog(playerid, dialogid);
				if (strlen(inputtext) > 64) return ShowDialog(playerid, dialogid);

				new to_playerid = INVALID_PLAYER_ID;
				for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
				{
					if (IsPlayerConnected(i))
					{
						if ((PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_DEAD) && PLAYER_PHONE[i][player_phone_NUMBER] == PLAYER_TEMP[playerid][py_PLAYER_PHONE_NUMBER_SELECTED])
						{
							to_playerid = i;
							break;
						}
					}
				}

				if (to_playerid == INVALID_PLAYER_ID) RegisterPhoneMessage(PLAYER_PHONE[playerid][player_phone_NUMBER], PLAYER_TEMP[playerid][py_PLAYER_PHONE_NUMBER_SELECTED], inputtext, true);
				else
				{
					RegisterPhoneMessage(PLAYER_PHONE[playerid][player_phone_NUMBER], PLAYER_TEMP[playerid][py_PLAYER_PHONE_NUMBER_SELECTED], inputtext);
					if (PLAYER_PHONE[to_playerid][player_phone_STATE] == PHONE_STATE_ON) SendClientMessageEx(to_playerid, COLOR_WHITE, ""COL_GREEN"[Mensaje] "COL_WHITE"%s: %s", convertPhoneNumber(to_playerid, PLAYER_PHONE[playerid][player_phone_NUMBER]), inputtext);
				}
				ShowPlayerNotification(playerid, "Mensaje enviado.", 3);
			}
			else ShowDialog(playerid, DIALOG_PHONE_SMS_MESSAGE);
			return 1;
		}
		case DIALOG_PHONE_BOOK_SEND_MESSAGE:
		{
			if (response)
			{
				if (isnull(inputtext)) return ShowDialog(playerid, dialogid);
				if (strlen(inputtext) > 64) return ShowDialog(playerid, dialogid);

				new DBResult:Result, DB_Query[100], bool:phone_exists;
				format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PHONE` WHERE `PHONE_NUMBER` = '%d';", PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_PHONE_NUMBER]);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result)) phone_exists = true;
				db_free_result(Result);

				if (!phone_exists) return ShowPlayerMessage(playerid, "~r~El número del destinario no es válido.", 2);

				new to_playerid = INVALID_PLAYER_ID;
				for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
				{
					if (IsPlayerConnected(i))
					{
						if ((PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_DEAD) && PLAYER_PHONE[i][player_phone_NUMBER] == PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_PHONE_NUMBER])
						{
							to_playerid = i;
							break;
						}
					}
				}

				if (to_playerid == INVALID_PLAYER_ID) RegisterPhoneMessage(PLAYER_PHONE[playerid][player_phone_NUMBER], PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_PHONE_NUMBER], inputtext, true);
				else
				{
					RegisterPhoneMessage(PLAYER_PHONE[playerid][player_phone_NUMBER], PLAYER_PHONE_BOOK[playerid][ PLAYER_TEMP[playerid][py_PLAYER_PHONE_BOOK_SELECTED] ][phone_book_contact_PHONE_NUMBER], inputtext);
					if (PLAYER_PHONE[to_playerid][player_phone_STATE] == PHONE_STATE_ON) SendClientMessageEx(to_playerid, COLOR_WHITE, ""COL_GREEN"[Mensaje] "COL_WHITE"%s: %s", convertPhoneNumber(to_playerid, PLAYER_PHONE[playerid][player_phone_NUMBER]), inputtext);
				}
			}
			else ShowDialog(playerid, DIALOG_PHONE_BOOK_OPTIONS);
			return 1;
		}
		case DIALOG_PHONE_SENT_MESSAGES:
		{
			return 1;
		}
		case DIALOG_PHONE_RECEIVED_MESSAGES:
		{
			return 1;
		}
		case DIALOG_PHONE_MESSAGE_LIST:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: ShowDialog(playerid, DIALOG_PHONE_SENT_MESSAGES);
					case 1: ShowDialog(playerid, DIALOG_PHONE_RECEIVED_MESSAGES);
				}
				return 1;
			}
			return 1;
		}
		case DIALOG_CONFIRM_BUY_PROPERTY:
		{
			if (response)
			{
				if (PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_SOLD]) return ShowPlayerMessage(playerid, "~r~Está propiedad ya está vendida", 2);
				if (PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_LEVEL] > ACCOUNT_INFO[playerid][ac_LEVEL])
				{
					new str_text[128];
					format(str_text, sizeof(str_text), "Debes ser nivel %d para comprar esta propiedad", PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_LEVEL]);
					return ShowPlayerNotification(playerid, str_text, 3);
				}
				if (PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_PRICE] > BANK_ACCOUNT[playerid][bank_account_BALANCE]) return ShowPlayerMessage(playerid, "~r~No tienes cuenta bancaria.", 2);
				if (PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_VIP_LEVEL] > ACCOUNT_INFO[playerid][ac_SU]) return ShowPlayerMessage(playerid, "~r~No eres VIP", 2);
				if (PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXTRA] > ACCOUNT_INFO[playerid][ac_SD]) return ShowPlayerMessage(playerid, "~r~No tienes hycoins", 2);

				new DB_Query_update[350];
				if (!PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXTRA])
				{
					if (PLAYER_PHONE[playerid][player_phone_VALID])
					{
						new message[64]; format(message, sizeof message, "PROPIEDAD COMPRADA: -%s$", number_format_thousand(PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_PRICE]));
						RegisterPhoneMessage(6740, PLAYER_PHONE[playerid][player_phone_NUMBER], message);
						new str_buy[164], city[45], zone[45];
						GetPointZone(PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXT_X], PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXT_Y], city, zone);
						format(str_buy, sizeof(str_buy), "~y~Propiedad comprada~w~~n~Compraste una propiedad en %s, puedes ver las opciones de la propiedad pulsando la tecla H.", zone);
						ShowPlayerNotification(playerid, str_buy, 5);
					}

					BANK_ACCOUNT[playerid][bank_account_BALANCE] -= PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_PRICE];

					format
					(
						DB_Query_update, sizeof(DB_Query_update),
						"UPDATE `BANK_ACCOUNTS` SET `BALANCE` = '%d' WHERE `ID_ACCOUNT` = '%d';",
						BANK_ACCOUNT[playerid][bank_account_BALANCE], BANK_ACCOUNT[playerid][bank_account_ID]
					);
					db_free_result(db_query(Database, DB_Query_update));

					RegisterBankAccountTransaction(BANK_ACCOUNT[playerid][bank_account_ID], BANK_TRANSACTION_BUY_PROPERTY, PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_PRICE]);
				}
				else
				{
					ACCOUNT_INFO[playerid][ac_SD] -= PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXTRA];

					format(DB_Query_update, sizeof(DB_Query_update), "UPDATE `ACCOUNTS` SET `SD` = '%d' WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_ID]);
					db_free_result(db_query(Database, DB_Query_update));

					ShowPlayerNotification(playerid, sprintf("Has gastado %d "SERVER_COIN" en la compra de esta propiedad.", PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXTRA]));
				}

				PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_SOLD] = true;
				PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_CREW] = false;
				PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_OWNER_ID] = ACCOUNT_INFO[playerid][ac_ID];

				format
				(
					DB_Query_update, sizeof(DB_Query_update),
					"INSERT INTO `PROPERTY_OWNER` (`ID_PROPERTY`, `ID_USER`, `PROPERTY_NAME`) VALUES ('%d', '%d', '%q');",
					PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_ID], ACCOUNT_INFO[playerid][ac_ID], PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_NAME]
				);
				db_free_result(db_query(Database, DB_Query_update));

				new label_str[256], info[3], city[45], zone[45];
				GetPointZone(PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXT_X], PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXT_Y], city, zone);
				format
				(
					label_str,
					sizeof label_str,
					""COL_WHITE"\
						Propiedad en %s (%d)\n\
						Propietario:{35A7FF} %s\n\
					", zone, PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_ID], ACCOUNT_INFO[playerid][ac_NAME]
				);
				UpdateDynamic3DTextLabelText(PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXT_LABEL_ID], 0xF0F0F000, label_str);

				DestroyDynamicPickup(PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXT_PICKUP_ID]);
				PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXT_PICKUP_ID] = INVALID_STREAMER_ID;

				PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXT_PICKUP_ID] = CreateDynamicPickup(1272, 1, PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXT_X], PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXT_Y], PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXT_Z], 0, PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXT_INTERIOR]);
				info[0] = PICKUP_TYPE_PROPERTY;
				info[1] = PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]; // Index
				info[2] = 2; // Pickup Exterior
				Streamer_SetArrayData(STREAMER_TYPE_PICKUP, PROPERTY_INFO[PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX]][property_EXT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);
			}
			return 1;
		}
		case DIALOG_PLAYER_GPS:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: ShowDialog(playerid, DIALOG_PLAYER_GPS_PLAYER);
					case 1: ShowDialog(playerid, DIALOG_PLAYER_GPS_PROPERTIES);
					case 2: ShowDialog(playerid, DIALOG_PLAYER_GPS_VEHICLES);
					case 3: ShowDialog(playerid, DIALOG_PLAYER_GPS_SITES);
					case 4: ShowDialog(playerid, DIALOG_PLAYER_GPS_WORKS);
				}
			}
			return 1;
		}
		case DIALOG_PLAYER_GPS_PLAYER:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return ShowDialog(playerid, dialogid);
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == MAX_PLAYER_GPS_SAVES + 10) return ShowDialog(playerid, DIALOG_PLAYER_GPS_PLAYER_ADD);
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == MAX_PLAYER_GPS_SAVES + 20) return ShowDialog(playerid, DIALOG_PLAYER_GPS_DELETE_ALL);

				PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
				ShowDialog(playerid, DIALOG_PLAYER_GPS_PLAYER_OPTION);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_GPS);
			return 1;
		}
		case DIALOG_PLAYER_GPS_PLAYER_ADD:
		{
			if (response)
			{
				if (isnull(inputtext))
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (strlen(inputtext) > 24)
				{
				    ShowPlayerMessage(playerid, "~r~Caracteres: 1-24.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				new slot = GetEmptyPlayer_GPS_Slot(playerid);
				if (slot == -1) return ShowPlayerMessage(playerid, "~r~La memoria del GPS se llenó.", 3);

				PLAYER_GPS[playerid][slot][player_gps_VALID] = true;
				format(PLAYER_GPS[playerid][slot][player_gps_NAME], 24, "%s", inputtext);
				GetPlayerPos(playerid, PLAYER_GPS[playerid][slot][player_gps_X], PLAYER_GPS[playerid][slot][player_gps_Y], PLAYER_GPS[playerid][slot][player_gps_Z]);
				PLAYER_GPS[playerid][slot][player_gps_WORLD] = GetPlayerVirtualWorld(playerid);
				PLAYER_GPS[playerid][slot][player_gps_INTERIOR] = GetPlayerInterior(playerid);
				RegisterNewPlayer_GPS_Site(playerid, slot);

				PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				SendClientMessageEx(playerid, COLOR_WHITE, "Nuevo sitio añadido al GPS con el nombre: "COL_RED"%s.", PLAYER_GPS[playerid][slot][player_gps_NAME]);
				ShowPlayerMessage(playerid, "Nuevo sitio añadido al GPS.", 2);
				ShowDialog(playerid, DIALOG_PLAYER_GPS_PLAYER);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_GPS_PLAYER);
			return 1;
		}
		case DIALOG_PLAYER_GPS_PLAYER_OPTION:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: SetPlayer_GPS_Checkpoint(playerid, PLAYER_GPS[playerid][PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED]][player_gps_X], PLAYER_GPS[playerid][PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED]][player_gps_Y], PLAYER_GPS[playerid][PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED]][player_gps_Z], PLAYER_GPS[playerid][PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED]][player_gps_WORLD], PLAYER_GPS[playerid][PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED]][player_gps_INTERIOR]);
					case 1: ShowDialog(playerid, DIALOG_PLAYER_GPS_CHANGE_NAME);
					case 2: ShowDialog(playerid, DIALOG_PLAYER_GPS_CONFIRM_DELET);
				}
			}
			else ShowDialog(playerid, DIALOG_PLAYER_GPS_PLAYER);
			return 1;
		}
		case DIALOG_PLAYER_GPS_CHANGE_NAME:
		{
			if (response)
			{
				if (isnull(inputtext))
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (strlen(inputtext) > 24)
				{
				    ShowPlayerMessage(playerid, "~r~Caracteres: 1-24", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				format(PLAYER_GPS[playerid][ PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED] ][player_gps_NAME], 24, "%s", inputtext);

				new DB_Query[160];
				format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_GPS` SET `NAME` = '%q' WHERE `ID` = '%d' AND `ID_USER` = '%d';", PLAYER_GPS[playerid][ PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED] ][player_gps_NAME], PLAYER_GPS[playerid][ PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED] ][player_gps_ID], ACCOUNT_INFO[playerid][ac_ID]);
				db_free_result(db_query(Database, DB_Query));

				PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				ShowPlayerMessage(playerid, "Has modificado el nombre de este lugar correctamente.", 3);
				ShowDialog(playerid, DIALOG_PLAYER_GPS_PLAYER);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_GPS_PLAYER_OPTION);
			return 1;
		}
		case DIALOG_PLAYER_GPS_CONFIRM_DELET:
		{
			if (response)
			{
				new DB_Query[110];
				format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_GPS` WHERE `ID` = '%d' AND `ID_USER` = '%d';", PLAYER_GPS[playerid][ PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED] ][player_gps_ID], ACCOUNT_INFO[playerid][ac_ID]);
				db_free_result(db_query(Database, DB_Query));

				PLAYER_GPS[playerid][ PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED] ][player_gps_VALID] = false;
				PLAYER_GPS[playerid][ PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED] ][player_gps_ID] = 0;
				format(PLAYER_GPS[playerid][ PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED] ][player_gps_NAME], 24, "");
				PLAYER_GPS[playerid][ PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED] ][player_gps_X] = 0.0;
				PLAYER_GPS[playerid][ PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED] ][player_gps_Y] = 0.0;
				PLAYER_GPS[playerid][ PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED] ][player_gps_Z] = 0.0;
				PLAYER_GPS[playerid][ PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED] ][player_gps_WORLD] = 0;
				PLAYER_GPS[playerid][ PLAYER_TEMP[playerid][py_GPS_PLAYER_SELECTED] ][player_gps_INTERIOR] = 0;

				PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				ShowPlayerMessage(playerid, "Has eliminado este lugar de tu GPS.", 2);
				ShowDialog(playerid, DIALOG_PLAYER_GPS_PLAYER);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_GPS_PLAYER_OPTION);
			return 1;
		}
		case DIALOG_PLAYER_GPS_DELETE_ALL:
		{
			if (response)
			{
				new DB_Query[90];
				format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_GPS` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
				db_free_result(db_query(Database, DB_Query));

				new temp_PLAYER_GPS[Player_GPS_Enum];
				for(new i = 0; i != MAX_PLAYER_GPS_SAVES; i ++) PLAYER_GPS[playerid][i] = temp_PLAYER_GPS;

				ShowPlayerMessage(playerid, "Has eliminado todos tus lugares guardados.", 2);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_GPS_PLAYER);
			return 1;
		}
		case DIALOG_PLAYER_GPS_SITES:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: ShowDialog(playerid, DIALOG_PLAYER_GPS_SITE_0);
					case 1: ShowDialog(playerid, DIALOG_PLAYER_GPS_SITE_1);
					case 2: ShowDialog(playerid, DIALOG_PLAYER_GPS_SITE_2);
					case 3: ShowDialog(playerid, DIALOG_PLAYER_GPS_SITE_3);
					case 4: ShowDialog(playerid, DIALOG_PLAYER_GPS_SITE_4);
					case 5: ShowDialog(playerid, DIALOG_PLAYER_GPS_SITE_5);
					case 6: ShowDialog(playerid, DIALOG_PLAYER_GPS_SITE_6);
					case 7: ShowDialog(playerid, DIALOG_PLAYER_GPS_SITE_7);
					case 8: SetPlayer_GPS_Checkpoint(playerid, 1571.468627, -1336.893188, 16.484375, 0, 0); // Banco
					case 9: SetPlayer_GPS_Checkpoint(playerid, 1545.472778, -1675.525024, 13.560430, 0, 0); // LSPD
					case 10: SetPlayer_GPS_Checkpoint(playerid, 1049.747680, -938.670715, 42.861778, 0, 0); // Taller
					case 11: SetPlayer_GPS_Checkpoint(playerid, 1876.87915, -2286.58911, 1.16550 + 15, 0, 0); // Helipuerto
					case 12: SetPlayer_GPS_Checkpoint(playerid, 1738.542846, -1269.991577, 13.543532, 0, 0); // Tecno
				}
			}
			else ShowDialog(playerid, DIALOG_PLAYER_GPS);
			return 1;
		}
		case DIALOG_PLAYER_GPS_WORKS:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return true;
				else SetPlayer_GPS_Checkpoint(playerid, obtain_work_coords[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][obtain_work_MAP_ICON_X], obtain_work_coords[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][obtain_work_MAP_ICON_Y], obtain_work_coords[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][obtain_work_MAP_ICON_Z], 0, 0);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_GPS);
			return 1;
		}
		case DIALOG_PLAYER_GPS_SITE_0: //Hospitales
		{
			if (response) SetPlayer_GPS_Checkpoint(playerid, Hospital_Spawn_Positions[listitem][0], Hospital_Spawn_Positions[listitem][1], Hospital_Spawn_Positions[listitem][2], 0, 0);
			else ShowDialog(playerid, DIALOG_PLAYER_GPS_SITES);
			return 1;
		}
		case DIALOG_PLAYER_GPS_SITE_1 .. DIALOG_PLAYER_GPS_SITE_4, DIALOG_PLAYER_GPS_SITE_8: //EE
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return ShowDialog(playerid, DIALOG_PLAYER_GPS);
				SetPlayer_GPS_Checkpoint(playerid, ENTER_EXIT[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][ee_EXT_X], ENTER_EXIT[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][ee_EXT_Y], ENTER_EXIT[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][ee_EXT_Z], ENTER_EXIT[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][ee_EXT_WORLD], ENTER_EXIT[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][ee_EXT_INTERIOR]);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_GPS_SITES);
			return 1;
		}
		case DIALOG_PLAYER_GPS_SITE_5: //Cajeros
		{
			if (response) SetPlayer_GPS_Checkpoint(playerid, ATM_BANK[listitem][atm_X], ATM_BANK[listitem][atm_Y], ATM_BANK[listitem][atm_Z], ATM_BANK[listitem][atm_WORLD], ATM_BANK[listitem][atm_INTERIOR]);
			else ShowDialog(playerid, DIALOG_PLAYER_GPS_SITES);
			return 1;
		}
		case DIALOG_PLAYER_GPS_SITE_6: //Gasolineras
		{
			if (response) SetPlayer_GPS_Checkpoint(playerid, Fuel_Stations[listitem][0], Fuel_Stations[listitem][1], Fuel_Stations[listitem][2], 0, 0);
			else ShowDialog(playerid, DIALOG_PLAYER_GPS_SITES);
			return 1;
		}
		case DIALOG_TRABAJOS_TELEPORTS:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return true;
				else SetPlayerPosEx(playerid, obtain_work_coords[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][obtain_work_MAP_ICON_X], obtain_work_coords[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][obtain_work_MAP_ICON_Y], obtain_work_coords[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][obtain_work_MAP_ICON_Z],0.0,0,0,true);
			}
			return 1;
		}
		case DIALOG_PLAYER_GPS_SITE_7: //Concesionarios
		{
			if (response) SetPlayer_GPS_Checkpoint(playerid, SELL_VEHICLES_SHOPS_SPAWN[listitem][0], SELL_VEHICLES_SHOPS_SPAWN[listitem][1], SELL_VEHICLES_SHOPS_SPAWN[listitem][2], 0, 0);
			else ShowDialog(playerid, DIALOG_PLAYER_GPS_SITES);
			return 1;
		}
		case DIALOG_PLAYER_GPS_PROPERTIES:
		{
			if (response)
			{
				if (listitem == -1) return ShowDialog(playerid, DIALOG_PLAYER_GPS);
				if (PLAYER_TEMP[playerid][py_PLAYER_GPS_SELECTED_PROPERTY][listitem] == -1) return ShowDialog(playerid, DIALOG_PLAYER_GPS);

				new index = GetPropertyIndexByID(PLAYER_TEMP[playerid][py_PLAYER_GPS_SELECTED_PROPERTY][listitem]);
				if (index != -1) SetPlayer_GPS_Checkpoint(playerid, PROPERTY_INFO[index][property_EXT_X], PROPERTY_INFO[index][property_EXT_Y], PROPERTY_INFO[index][property_EXT_Z], 0, PROPERTY_INFO[index][property_EXT_INTERIOR]);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_GPS);
			return 1;
		}
		case DIALOG_PLAYER_GPS_VEHICLES:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return ShowDialog(playerid, DIALOG_PLAYER_GPS);

				if (!ACCOUNT_INFO[playerid][ac_SU])
				{
					if (!PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][player_vehicle_ACCESSIBLE])
					{
					    ShowPlayerMessage(playerid, "~r~No podrás usar este vehículo hasta que no seas VIP.", 3);
					}
				}

				new Float:x, Float:y, Float:z;
				GetVehiclePos(PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem], x, y, z);
				SetPlayer_GPS_Checkpoint(playerid, x, y, z, 0, 0);
			}
			//else ShowDialog(playerid, DIALOG_PLAYER_GPS);
			return 1;
		}
		case DIALOG_HELI_OPTIONS:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: ShowDialog(playerid, DIALOG_GASOLINE); 
					case 1: ShowTuningMenu(playerid);
				}
			}
			return 1;
		}
		case DIALOG_GASOLINE:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
						{
							new vehicleid = GetPlayerVehicleID(playerid), modelid = GetVehicleModel(vehicleid);
							if (!VEHICLE_INFO[modelid - 400][vehicle_info_VALID]) return ShowPlayerMessage(playerid, "~r~No puedes poner gasolina a este vehículo.", 3);
							if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE] == VEHICLE_TYPE_SELL) return ShowPlayerMessage(playerid, "~r~No puedes poner gasolina a este vehículo.", 3);

							if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE]) return ShowPlayerMessage(playerid, "~r~El vehículo debe estar detenido.", 3);

							ShowDialog(playerid, DIALOG_LOAD_GASOLINE);
						}
					}
					case 1:
					{
						if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
						{
							new vehicleid = GetPlayerVehicleID(playerid), modelid = GetVehicleModel(vehicleid);
							if (!VEHICLE_INFO[modelid - 400][vehicle_info_VALID]) return ShowPlayerMessage(playerid, "~r~No puedes poner gasolina a este vehículo.", 3);
							if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE] == VEHICLE_TYPE_SELL) return ShowPlayerMessage(playerid, "~r~No puedes poner gasolina a este vehículo.", 3);

							new Float:ammount = floatsub(GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS]);

							new price = floatround( floatmul(ammount, 5.0) );
							if (CHARACTER_INFO[playerid][ch_CASH] >= price)
							{
								GivePlayerCash(playerid, -price);
								GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] = GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS];
								new str_text[64];
								format(str_text, sizeof(str_text), "Has puesto %.1f litros de gasolina a tu vehículo por %s$.", ammount, number_format_thousand(price));
								ShowPlayerNotification(playerid, str_text, 3);
							}
							else ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 3);
						}
					}
					case 2:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] >= 250)
						{
							if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);
							ShowPlayerNotification(playerid, "Has comprado un bidón de gasolina de 20 litros por 250$.", 3);
							GivePlayerCash(playerid, -250);
							SavePlayerMisc(playerid);
							AddPlayerItem(playerid, 5);
						}
						else ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);
					}
				}
			}
		}
		case DIALOG_LOAD_GASOLINE:
		{
			if (response)
			{
				new result_input;
				if (sscanf(inputtext, "d", result_input)) return ShowPlayerMessage(playerid, "~r~Ingrese un valor correcto.", 3);

				new vehicleid = GetPlayerVehicleID(playerid), modelid = GetVehicleModel(vehicleid);
				if (!VEHICLE_INFO[modelid - 400][vehicle_info_VALID]) return ShowPlayerMessage(playerid, "~r~No puedes poner gasolina a este vehículo.", 3);

				new Float:ammount = float(result_input);
				if (ammount < 0.0) return ShowPlayerMessage(playerid, "~r~Ingrese un valor correcto.", 3);
				if (ammount + GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] > GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS]) ammount = GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS] - GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS];

				new price = floatround( floatmul(ammount, 5.0) );

				if (CHARACTER_INFO[playerid][ch_CASH] >= price)
				{
					GivePlayerCash(playerid, -price);
					GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] += ammount;

					new str_text[64];
					format(str_text, sizeof(str_text), "Has puesto %.1f litros de gasolina a tu vehículo por %s$.", ammount, number_format_thousand(price));
					ShowPlayerNotification(playerid, str_text, 3);
				}
				else ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);
			}
			return 1;
		}
		/*case DIALOG_FUEL_DRUM:
		{
			if (response)
			{
				if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerNotification(playerid, "Tienes que estar fuera del vehículo para vertir el bidón.", 3);

				new vehicleid = GetPlayerCameraTargetVehicle(playerid);
				if (vehicleid == INVALID_VEHICLE_ID) return ShowPlayerNotification(playerid, "No estás cerca de ningún vehículo.", 3);
				if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE] == VEHICLE_TYPE_SELL) return ShowPlayerMessage(playerid, "~r~No puedes poner gasolina a este vehículo.", 3);

				if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE])
				{
					ShowPlayerNotification(playerid, "Por favor, para primero el motor del vehículo.", 3);
					return 1;
				}

				new ammount_load, str_text[128];

				if (sscanf(inputtext, "d", ammount_load)) return ShowPlayerMessage(playerid, "~r~Cantidad de litros no válida.", 3);
				if (ammount_load <= 0) return ShowPlayerMessage(playerid, "~r~Cantidad de litros no válida.", 3);
				if (ammount_load > PLAYER_MISC[playerid][MISC_FUEL_DRUM]) return ShowPlayerNotification(playerid, "No te alcanza para llenar el tanque.", 3);

				new Float:ammount = float(ammount_load);
				if (ammount + GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] > GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS]) ammount = GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS] - GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS];

				PLAYER_MISC[playerid][MISC_FUEL_DRUM] -= floatround(ammount);
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] += ammount;

				format(str_text, sizeof(str_text), "Has vertido ~r~%.1f~w~ litros del bidón, te quedan ~r~%d.0~w~ litros.", ammount, PLAYER_MISC[playerid][MISC_FUEL_DRUM]);
				ShowPlayerMessage(playerid, str_text, 5);
				SetPlayerChatBubble(playerid, "\n\n\n\n* Ha puesto gasolina el vehículo.\n\n\n", 0xffcb90FF, 20.0, 5000);
			}
			return 1;
		}*/
		case DIALOG_PROPERTY_OPTIONS:
		{
			if (response)
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
									SendClientMessageEx(i, COLOR_WHITE, "{bad2d8}%s "COL_WHITE"te ha echado de su propiedad.", PLAYER_TEMP[playerid][py_RP_NAME]);
									ShowPlayerMessage(i, "~r~Te echaron de la propiedad.", 3);
									total ++;
								}
							}
						}
						if (total == 0) ShowPlayerMessage(playerid, "~r~No hay nadie en tu propiedad", 2);
						else SendClientMessageEx(playerid, COLOR_WHITE, ""COL_WHITE"Has echado %d personas de tu propiedad.", total);
					}
				}
			}
			return 1;
		}
		case DIALOG_PROPERTY_NAME:
		{
			if (response)
			{
				if (!PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_VALID]) return 1;
				if (PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_OWNER_ID] != ACCOUNT_INFO[playerid][ac_ID]) return 1;

				if (isnull(inputtext)) return ShowDialog(playerid, dialogid);
				if (strlen(inputtext) > 15)
				{
					ShowDialog(playerid, dialogid);
				    ShowPlayerMessage(playerid, "~r~Caracteres: 1-15.", 2);
					return 1;
				}

				format(PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_NAME], 24, "%s", inputtext);

				new DB_Query[200];
				format(DB_Query, sizeof DB_Query, "UPDATE `PROPERTY_OWNER` SET `PROPERTY_NAME` = '%q' WHERE `ID_PROPERTY` = '%d' AND `ID_USER` = '%d';", inputtext, PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID], ACCOUNT_INFO[playerid][ac_ID]);
				db_free_result(db_query(Database, DB_Query));
				ShowPropertyMenu(playerid);
			}
			else ShowPropertyMenu(playerid);
			return 1;
		}
		case DIALOG_PLAYER_MP3:
		{
			if (response)
			{
				if (isnull(inputtext)) return ShowDialog(playerid, dialogid);

				ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Espere", ""COL_WHITE"Buscando resultados para su búsqueda...", "Cerrar", "");

				for(new i = 0; i < strlen(inputtext); i++)
				{
					if (inputtext[i] == ' ') inputtext[i] = '+';
				}

				new str[180];
				format(str, sizeof str, "boombox.hyaxe.com/search?query=%s&max=5", inputtext);

				PLAYER_TEMP[playerid][py_PLAYER_WAITING_MP3_HTTP] = true;
				HTTP(playerid, HTTP_GET, str, "", "OnYouTubeQueryResponse");
			}
			return 1;
		}
		case DIALOG_PLAYER_MP3_RESULTS:
		{
			if (response)
			{
				new url[128];
				PLAYER_TEMP[playerid][py_RESULT_INDEX] = listitem;
				format(url, 128, "boombox.hyaxe.com/download/%s", PLAYER_DIALOG_MP3_RESULT[playerid][listitem][result_ID]);
				HTTP(playerid, HTTP_GET, url, "", "OnDownloadResponse");
				ShowPlayerNotification(playerid, "Espere, estamos procesando el video...", 3);
			} else PLAYER_TEMP[playerid][py_PLAYER_WAITING_MP3_HTTP] = false;
			return 1;
		}
		case DIALOG_BUY_VEHICLE:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] == INVALID_VEHICLE_ID) return 1;
				if (!GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][gb_vehicle_VALID]) return 1;
				if (GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][gb_vehicle_TYPE] != VEHICLE_TYPE_SELL) return 1;
				if (!SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_VALID]) return 1;
				if (SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_VIP_LEVEL] > ACCOUNT_INFO[playerid][ac_SU]) return 1;
				if (SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_LEVEL] > ACCOUNT_INFO[playerid][ac_LEVEL]) return 1;
				if (BANK_ACCOUNT[playerid][bank_account_ID] == 0) return 1;
				if (SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_PRICE] > BANK_ACCOUNT[playerid][bank_account_BALANCE]) return 1;
				if (SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_EXTRA] > ACCOUNT_INFO[playerid][ac_SD]) return 1;

				new cmpv = AddPersonalVehicle
				(
					playerid,
					GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][gb_vehicle_MODELID],
					SELL_VEHICLES_SHOPS_SPAWN[ SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_SHOP] ][0],
					SELL_VEHICLES_SHOPS_SPAWN[ SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_SHOP] ][1],
					SELL_VEHICLES_SHOPS_SPAWN[ SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_SHOP] ][2],
					SELL_VEHICLES_SHOPS_SPAWN[ SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_SHOP] ][3],
					GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][gb_vehicle_COLOR_1],
					GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][gb_vehicle_COLOR_2],
					VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][gb_vehicle_MODELID] - 400 ][vehicle_info_MAX_GAS]
				);

				if (!cmpv) return ShowPlayerMessage(playerid, "~r~No se puede agregar más vehículos.", 3);

				if (SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_EXTRA])
				{
					ACCOUNT_INFO[playerid][ac_SD] -= SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_EXTRA];

					new DB_Query_update[160];
					format(DB_Query_update, sizeof(DB_Query_update), "UPDATE `ACCOUNTS` SET `SD` = '%d' WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_ID]);
					db_free_result(db_query(Database, DB_Query_update));

					SendClientMessageEx(playerid, COLOR_WHITE, "Has gastado %d "SERVER_COIN" en la compra de este vehículo.", SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_EXTRA]);
				}
				else
				{
					if (PLAYER_PHONE[playerid][player_phone_VALID])
					{
						new message[64]; format(message, sizeof message, "VEHICULO COMPRADO: -%s$", number_format_thousand(SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_PRICE]));
						RegisterPhoneMessage(6740, PLAYER_PHONE[playerid][player_phone_NUMBER], message);
						if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_ON) SendClientMessageEx(playerid, COLOR_WHITE, ""COL_GREEN"[Mensaje] "COL_WHITE"%s: %s", convertPhoneNumber(playerid, 6740), message);
						GameTextForPlayer(playerid, "VEHICULO COMPRADO", 6000, 0);
					}

					BANK_ACCOUNT[playerid][bank_account_BALANCE] -= SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_PRICE];
					new DB_Query_update[160];
					format(DB_Query_update, sizeof(DB_Query_update), "UPDATE `BANK_ACCOUNTS` SET `BALANCE` = '%d' WHERE `ID_ACCOUNT` = '%d';", BANK_ACCOUNT[playerid][bank_account_BALANCE], BANK_ACCOUNT[playerid][bank_account_ID]);
					db_free_result(db_query(Database, DB_Query_update));
					RegisterBankAccountTransaction(BANK_ACCOUNT[playerid][bank_account_ID], BANK_TRANSACTION_BUY_VEHICLE, SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_PRICE]);
				}

				ShowPlayerMessage(playerid, "¡Vehículo comprado! Utiliza ~y~/ayuda~w~ para ver que puedes hacer con tu nuevo vehículo.", 4);
				PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);

				new Float:x, Float:y, Float:z, Float:angle;
				x = SELL_VEHICLES_SHOPS_SPAWN[ SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_SHOP] ][0];
				y = SELL_VEHICLES_SHOPS_SPAWN[ SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_SHOP] ][1];
				z = SELL_VEHICLES_SHOPS_SPAWN[ SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_SHOP] ][2];
				angle = SELL_VEHICLES_SHOPS_SPAWN[ SELL_VEHICLES[ PLAYER_TEMP[playerid][py_SELECTED_BUY_VEHICLE_ID] ][sell_vehicle_SHOP] ][3];

				x += (2.0 * floatsin(-(angle + 90.0), degrees));
				y += (2.0 * floatcos(-(angle + 90.0), degrees));
				SetPlayerPosEx(playerid, x, y, z, angle, 0, 0);

				if (!ACCOUNT_INFO[playerid][ac_SU]) ReLockPlayerVehicles(playerid);
			}
			return 1;
		}
		case DIALOG_NOTARY:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						PLAYER_TEMP[playerid][py_NOTARY_OPTION] = 0;
						ShowDialog(playerid, DIALOG_NOTARY_SELECT_PROPERTY);
					}
					case 1:
					{
						PLAYER_TEMP[playerid][py_NOTARY_OPTION] = 0;
						ShowDialog(playerid, DIALOG_NOTARY_SELECT_VEHICLE);
					}
					case 2:
					{
						PLAYER_TEMP[playerid][py_NOTARY_OPTION] = 1;
						ShowDialog(playerid, DIALOG_NOTARY_SELECT_PROPERTY);
					}
					case 3:
					{
						PLAYER_TEMP[playerid][py_NOTARY_OPTION] = 1;
						ShowDialog(playerid, DIALOG_NOTARY_SELECT_VEHICLE);
					}
				}
			}
			return 1;
		}
		case DIALOG_NOTARY_SELECT_PROPERTY:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;

				PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] = GetPropertyIndexByID(PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem]);
				if (PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] == -1) return ShowPlayerMessage(playerid, "~r~La ID de la propiedad es incorrecta.", 3);

				switch(PLAYER_TEMP[playerid][py_NOTARY_OPTION])
				{
					case 0: ShowDialog(playerid, DIALOG_PROPERTY_BANK_SELL);
					case 1: ShowDialog(playerid, DIALOG_PROPERTY_SELL_PRICE);
				}
			}
			else ShowDialog(playerid, DIALOG_NOTARY);

			return 1;
		}
		case DIALOG_PROPERTY_BANK_SELL:
		{
			if (response)
			{
				if (!PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_VALID]) return 1;
				if (PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_OWNER_ID] != ACCOUNT_INFO[playerid][ac_ID]) return 1;
				if (BANK_ACCOUNT[playerid][bank_account_ID] == 0) return ShowPlayerMessage(playerid, "~r~Necesitas una cuenta bancaria para vender una propiedad.", 3);

				PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_SOLD] = false;
				PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_CREW] = false;
				PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_OWNER_ID] = 0;
				new city[45], zone[45];
				GetPointZone(PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_X], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_Y], city, zone);
				format(PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_NAME], 24, "%s (%d)", zone, PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID]);

				new info[3];
				UpdateUnnocupiedPropertyLabel(PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED]);

				DestroyDynamicPickup(PROPERTY_INFO[PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED]][property_EXT_PICKUP_ID]);
				PROPERTY_INFO[PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED]][property_EXT_PICKUP_ID] = INVALID_STREAMER_ID;

				PROPERTY_INFO[PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED]][property_EXT_PICKUP_ID] = CreateDynamicPickup(1273, 1, PROPERTY_INFO[PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED]][property_EXT_X], PROPERTY_INFO[PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED]][property_EXT_Y], PROPERTY_INFO[PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED]][property_EXT_Z], 0, PROPERTY_INFO[PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED]][property_EXT_INTERIOR]);
				info[0] = PICKUP_TYPE_PROPERTY;
				info[1] = PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED]; // Index
				info[2] = 2; // Pickup Exterior
				Streamer_SetArrayData(STREAMER_TYPE_PICKUP, PROPERTY_INFO[PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED]][property_EXT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

				new Float:price, payment;
				price = PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_PRICE_BASE];
				if (ACCOUNT_INFO[playerid][ac_SU]) payment = floatround( floatmul(price, 0.70) );
				else payment = floatround( floatmul(price, 0.70) );

				if (PLAYER_PHONE[playerid][player_phone_VALID])
				{
					new message[64]; format(message, sizeof message, "PROPIEDAD VENDIDA: +%s$", number_format_thousand(payment));
					RegisterPhoneMessage(6740, PLAYER_PHONE[playerid][player_phone_NUMBER], message);
					if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_ON) SendClientMessageEx(playerid, COLOR_WHITE, ""COL_GREEN"[Mensaje] "COL_WHITE"%s: %s", convertPhoneNumber(playerid, 6740), message);
				}

				BANK_ACCOUNT[playerid][bank_account_BALANCE] += payment;

				new DB_Query_update[350];
				format(DB_Query_update, sizeof(DB_Query_update), "\
					UPDATE `BANK_ACCOUNTS` SET `BALANCE` = '%d' WHERE `ID_ACCOUNT` = '%d';\
					DELETE FROM `PROPERTY_OWNER` WHERE `ID_PROPERTY` = '%d' AND `ID_USER` = '%d';\
				",
					BANK_ACCOUNT[playerid][bank_account_BALANCE], BANK_ACCOUNT[playerid][bank_account_ID],
					PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID], ACCOUNT_INFO[playerid][ac_ID]
				);
				db_free_result(db_query(Database, DB_Query_update));

				RegisterBankAccountTransaction(BANK_ACCOUNT[playerid][bank_account_ID], BANK_TRANSACTION_SOLD_PROPERTY, payment);
				SendClientMessageEx(playerid, COLOR_WHITE, ""COL_WHITE"Has vendido esta propiedad, has recibido %s$ en tu cuenta bancaria.", number_format_thousand(payment));
				ShowPlayerMessage(playerid, "Propiedad vendida.", 2);
				PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);

			}
			else ShowDialog(playerid, DIALOG_NOTARY_SELECT_PROPERTY);
			return 1;
		}
		case DIALOG_PROPERTY_SELL_PRICE:
		{
			if (response)
			{
				if (sscanf(inputtext, "d", inputtext[0])) return ShowDialog(playerid, dialogid);

				new Float:price, min_price, max_price;
				price = PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_PRICE];
				min_price = floatround( floatmul(price, 0.15) );
				max_price = floatround( floatmul(price, 6.0) );

				if (inputtext[0] < min_price || inputtext[0] > max_price)
				{
					ShowPlayerMessage(playerid, "~r~Este precio no está dentro del rango ofrecido.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				PLAYER_TEMP[playerid][py_NOTARY_PRICE] = inputtext[0];
				ShowDialog(playerid, DIALOG_PROPERTY_SELL_TO_PLAYER);
			}
			else ShowDialog(playerid, DIALOG_NOTARY_SELECT_PROPERTY);
			return 1;
		}
		case DIALOG_PROPERTY_SELL_TO_PLAYER:
		{
			if (response)
			{
				if (sscanf(inputtext, "u", inputtext[0])) return ShowDialog(playerid, dialogid);

				if (!IsPlayerConnected(inputtext[0])) return ShowPlayerMessage(playerid, "~r~Comprador desconectado", 3);
				if (inputtext[0] == playerid) return ShowPlayerMessage(playerid, "~r~No puedes vender cosas a tí mismo.", 3);
				if (PLAYER_TEMP[inputtext[0]][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~El comprador no está disponible.", 3);

				if (ENTER_EXIT[ PLAYER_TEMP[inputtext[0]][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE] != INTERIOR_CITY_HALL_LS) return ShowPlayerMessage(playerid, "~r~El comprador no está en la sala.", 3);
				if (!IsPlayerInRangeOfPoint(inputtext[0],6.0, 1796.071655, -1414.565307, 2770.660156)) return ShowPlayerMessage(playerid, "~r~El comprador no está en la sala.", 3);
				if (BANK_ACCOUNT[inputtext[0]][bank_account_ID] == 0) return ShowPlayerMessage(playerid, "~r~El comprador no tiene cuenta bancaria.", 3);

				new DBResult:Result, DB_Query[120], player_properties;
				format(DB_Query, sizeof(DB_Query), "SELECT COUNT() AS `PROPERTIES` FROM `PROPERTY_OWNER` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[inputtext[0]][ac_ID]);
				Result = db_query(Database, DB_Query);
				if (db_num_rows(Result)) player_properties = db_get_field_assoc_int(Result, "PROPERTIES");
				db_free_result(Result);

				if (player_properties >= MAX_SU_PROPERTIES) return ShowPlayerMessage(playerid, "~r~El comprador no puede adquirir más propiedades.", 3);
				if (!ACCOUNT_INFO[inputtext[0]][ac_SU])
				{
					if (player_properties >= MAX_NU_PROPERTIES) return ShowPlayerMessage(playerid, "~r~El comprador no puede adquirir más propiedades.", 3);
				}

				if (ACCOUNT_INFO[inputtext[0]][ac_LEVEL] < 2) return ShowPlayerMessage(playerid, "~r~El comprador debe ser nivel 2.", 3);
				if (PLAYER_TEMP[playerid][py_NOTARY_PRICE] > BANK_ACCOUNT[inputtext[0]][bank_account_BALANCE]) return ShowPlayerMessage(playerid, "~r~El comprador no tiene ese dinero.", 3);

				ShowPlayerMessage(playerid, "Tu oferta se envió al comprador.", 3);

				SetPlayerChatBubble(playerid, "\n\n\n\n* Trata de llagar a un acuerdo con alguien.\n\n\n", 0xffcb90FF, 20.0, 5000);

				PLAYER_TEMP[inputtext[0]][py_PLAYER_PROPERTY_SELECTED] = PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED];
				PLAYER_TEMP[inputtext[0]][py_NOTARY_PRICE] = PLAYER_TEMP[playerid][py_NOTARY_PRICE];
				PLAYER_TEMP[inputtext[0]][py_NOTARY_TO_PLAYER] = playerid;
				PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER] = inputtext[0];

				ShowDialog(inputtext[0], DIALOG_SELL_CONFIRM_PROPERTY);
			}
			else ShowDialog(playerid, DIALOG_PROPERTY_SELL_PRICE);
			return 1;
		}
		case DIALOG_SELL_CONFIRM_PROPERTY:
		{
			if (response)
			{
				if (!IsPlayerConnected(PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER])) return ShowPlayerMessage(playerid, "~r~El vendedor no está conectado.", 3);
				if (PLAYER_TEMP[ PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER] ][py_NOTARY_TO_PLAYER] != playerid) return ShowPlayerMessage(playerid, "~r~El vendedor no está cerca tuya.", 3);
				if (PLAYER_TEMP[ PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER] ][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~El vendedor no está disponible.", 3);
				if (ENTER_EXIT[ PLAYER_TEMP[ PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER] ][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE] != INTERIOR_CITY_HALL_LS) return ShowPlayerMessage(playerid, "~r~El vendedor no está en la sala.", 3);
				if (!IsPlayerInRangeOfPoint(PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER],6.0, 1796.071655, -1414.565307, 2770.660156)) return ShowPlayerMessage(playerid, "~r~El vendedor no está en la sala.", 3);
				if (BANK_ACCOUNT[ PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER] ][bank_account_ID] == 0) return ShowPlayerMessage(playerid, "~r~El vendedor no tiene cuenta bancaria.", 3);

				// Traspasar
				new label_str[256], city[45], zone[45];
				GetPointZone(PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_X], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_Y], city, zone);
				format
				(
					label_str,
					sizeof label_str,
					""COL_WHITE"\
						Propiedad en %s (%d)\n\
						Propietario:{35A7FF} %s\n\
					", zone, PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID], ACCOUNT_INFO[playerid][ac_NAME]
				);
				UpdateDynamic3DTextLabelText(PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_LABEL_ID], 0xF0F0F000, label_str);

				PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_OWNER_ID] = ACCOUNT_INFO[playerid][ac_ID];
				new DB_Query_update[350];
				format(DB_Query_update, sizeof(DB_Query_update), "UPDATE `PROPERTY_OWNER` SET `ID_USER` = '%d' WHERE `ID_PROPERTY` = '%d';",
					ACCOUNT_INFO[playerid][ac_ID],
					PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID]
				);
				db_free_result(db_query(Database, DB_Query_update));


				// Banco
				new price = PLAYER_TEMP[playerid][py_NOTARY_PRICE], seller = PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER];

				if (PLAYER_PHONE[playerid][player_phone_VALID])
				{
					new message[64]; format(message, sizeof message, "PROPIEDAD COMPRADA: -%s$", number_format_thousand(price));
					RegisterPhoneMessage(6740, PLAYER_PHONE[playerid][player_phone_NUMBER], message);
				}
				if (PLAYER_PHONE[seller][player_phone_VALID])
				{
					new message[64]; format(message, sizeof message, "PROPIEDAD VENDIDA: +%s$", number_format_thousand(price));
					RegisterPhoneMessage(6740, PLAYER_PHONE[seller][player_phone_NUMBER], message);
					GameTextForPlayer(playerid, "PROPIEDAD VENDIDA", 6000, 0);
				}

				BANK_ACCOUNT[playerid][bank_account_BALANCE] -= price;
				RegisterBankAccountTransaction(BANK_ACCOUNT[playerid][bank_account_ID], BANK_TRANSACTION_BUY_PROPERTY, price);

				BANK_ACCOUNT[seller][bank_account_BALANCE] += price;
				RegisterBankAccountTransaction(BANK_ACCOUNT[seller][bank_account_ID], BANK_TRANSACTION_SOLD_PROPERTY, price);


				format(DB_Query_update, sizeof(DB_Query_update),
					"\
						UPDATE `BANK_ACCOUNTS` SET `BALANCE` = '%d' WHERE `ID_ACCOUNT` = '%d';\
						UPDATE `BANK_ACCOUNTS` SET `BALANCE` = '%d' WHERE `ID_ACCOUNT` = '%d';\
					",
						BANK_ACCOUNT[playerid][bank_account_BALANCE], BANK_ACCOUNT[playerid][bank_account_ID],
						BANK_ACCOUNT[seller][bank_account_BALANCE], BANK_ACCOUNT[seller][bank_account_ID]
				);
				db_free_result(db_query(Database, DB_Query_update));

				new str_buy[164];
				GetPointZone(PROPERTY_INFO[PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED]][property_EXT_X], PROPERTY_INFO[PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED]][property_EXT_Y], city, zone);
				format(str_buy, sizeof(str_buy), "~y~Propiedad comprada!~w~~n~Compraste una propiedad en %s, puedes ver las opciones de la propiedad pulsando la tecla H cuando te encuentres en pickup del interior.", zone);
				ShowPlayerNotification(playerid, str_buy, 2);

				ShowPlayerNotification(seller, "Vendiste tu propiedad, el dinero se depositó en tu cuenta bancaria.", 3);				
				PlayerPlaySoundEx(seller, 1058, 0.0, 0.0, 0.0);

				SetPlayerChatBubble(playerid, "\n\n\n\n* Llega a un acuerdo con alguien.\n\n\n", 0xffcb90FF, 20.0, 5000);
			}
			return 1;
		}
		case DIALOG_NOTARY_SELECT_VEHICLE:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];

				switch(PLAYER_TEMP[playerid][py_NOTARY_OPTION])
				{
					case 0: ShowDialog(playerid, DIALOG_VEHICLE_BANK_SELL);
					case 1: ShowDialog(playerid, DIALOG_VEHICLE_SELL_PRICE);
				}
			}
			else ShowDialog(playerid, DIALOG_NOTARY);

			return 1;
		}
		case DIALOG_VEHICLE_BANK_SELL:
		{
			if (response)
			{
				if (!GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][gb_vehicle_VALID]) return 1;
				if (PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][player_vehicle_OWNER_ID] != ACCOUNT_INFO[playerid][ac_ID]) return 1;
				if (BANK_ACCOUNT[playerid][bank_account_ID] == 0) return ShowPlayerMessage(playerid, "~r~Debes tener cuenta bancaria para vender vehículos.", 3);

				new Float:price, payment;
				price = VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][gb_vehicle_MODELID] - 400 ][vehicle_info_PRICE];
				if (ACCOUNT_INFO[playerid][ac_SU]) payment = floatround( floatmul(price, 0.70) );
				else payment = floatround( floatmul(price, 0.70) );

				//Destruir veh
				ClearVehicleKeys(PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][player_vehicle_ID]);
				new DB_Query_update[350];
				format(DB_Query_update, sizeof(DB_Query_update), "DELETE FROM `PLAYER_VEHICLES` WHERE `ID` = '%d';", PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][player_vehicle_ID]);
				db_free_result(db_query(Database, DB_Query_update));

				DestroyVehicleEx(PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED]);


				if (PLAYER_PHONE[playerid][player_phone_VALID])
				{
					new message[64]; format(message, sizeof message, "VEHICULO VENDIDO: +%s$", number_format_thousand(payment));
					RegisterPhoneMessage(6740, PLAYER_PHONE[playerid][player_phone_NUMBER], message);
					if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_ON) SendClientMessageEx(playerid, COLOR_WHITE, ""COL_GREEN"[Mensaje] "COL_WHITE"%s: %s", convertPhoneNumber(playerid, 6740), message);
				}

				BANK_ACCOUNT[playerid][bank_account_BALANCE] += payment;
				format(DB_Query_update, sizeof(DB_Query_update), "UPDATE `BANK_ACCOUNTS` SET `BALANCE` = '%d' WHERE `ID_ACCOUNT` = '%d';", BANK_ACCOUNT[playerid][bank_account_BALANCE], BANK_ACCOUNT[playerid][bank_account_ID]);
				db_free_result(db_query(Database, DB_Query_update));
				RegisterBankAccountTransaction(BANK_ACCOUNT[playerid][bank_account_ID], BANK_TRANSACTION_SOLD_VEHICLE, payment);

				SendClientMessageEx(playerid, COLOR_WHITE, ""COL_WHITE"Has vendido este vehículo, has recibido %s$ en tu cuenta bancaria.", number_format_thousand(payment));
				PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);

				if (!ACCOUNT_INFO[playerid][ac_SU]) ReLockPlayerVehicles(playerid);
			}
			else ShowDialog(playerid, DIALOG_NOTARY_SELECT_VEHICLE);
			return 1;
		}
		case DIALOG_VEHICLE_SELL_PRICE:
		{
			if (response)
			{
				if (sscanf(inputtext, "d", inputtext[0])) return ShowDialog(playerid, dialogid);

				new Float:price, min_price, max_price;
				price = VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][gb_vehicle_MODELID] - 400 ][vehicle_info_PRICE];
				min_price = floatround( floatmul(price, 0.15) );
				max_price = floatround( floatmul(price, 6.0) );

				if (inputtext[0] < min_price || inputtext[0] > max_price)
				{
					ShowPlayerMessage(playerid, "~r~Este precio no esta dentro del rango ofrecido", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				PLAYER_TEMP[playerid][py_NOTARY_PRICE] = inputtext[0];
				ShowDialog(playerid, DIALOG_VEHICLE_SELL_TO_PLAYER);
			}
			else ShowDialog(playerid, DIALOG_NOTARY_SELECT_VEHICLE);
			return 1;
		}
		case DIALOG_VEHICLE_SELL_TO_PLAYER:
		{
			if (response)
			{
				if (sscanf(inputtext, "u", inputtext[0])) return ShowDialog(playerid, dialogid);

				if (!IsPlayerConnected(inputtext[0])) return ShowPlayerMessage(playerid, "~r~Comprador desconectado.", 3);
				if (inputtext[0] == playerid) return ShowPlayerMessage(playerid, "~r~No puedes venderte cosas a tí mismo.", 3);
				if (PLAYER_TEMP[inputtext[0]][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~El comprador no está disponible.", 3);

				if (ENTER_EXIT[ PLAYER_TEMP[inputtext[0]][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE] != INTERIOR_CITY_HALL_LS) return ShowPlayerMessage(playerid, "~r~El comprador no está en la sala", 3);
				if (!IsPlayerInRangeOfPoint(inputtext[0],6.0, 1796.071655, -1414.565307, 2770.660156)) return ShowPlayerMessage(playerid, "~r~El comprador no está en la sala", 3);
				if (BANK_ACCOUNT[inputtext[0]][bank_account_ID] == 0) return ShowPlayerMessage(playerid, "~r~El comprador no tiene cuenta bancaria", 3);

				new DBResult:Result, DB_Query[120], player_vehicles;
				format(DB_Query, sizeof(DB_Query), "SELECT COUNT(`ID_USER`) AS `VEHICLES` FROM `PLAYER_VEHICLES` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[inputtext[0]][ac_ID]);
				Result = db_query(Database, DB_Query);
				if (db_num_rows(Result)) player_vehicles = db_get_field_assoc_int(Result, "VEHICLES");
				db_free_result(Result);

				if (player_vehicles >= MAX_SU_VEHICLES) return ShowPlayerMessage(playerid, "~r~El comprador no puede adquirir más vehículos.", 3);
				if (!ACCOUNT_INFO[inputtext[0]][ac_SU])
				{
					if (player_vehicles >= MAX_NU_VEHICLES) return ShowPlayerMessage(playerid, "~r~El comprador no puede adquirir más vehículos.", 3);
				}

				if (ACCOUNT_INFO[inputtext[0]][ac_LEVEL] < 2) return ShowPlayerMessage(playerid, "~r~El comprador debe ser nivel 2.", 3);
				if (PLAYER_TEMP[playerid][py_NOTARY_PRICE] > BANK_ACCOUNT[inputtext[0]][bank_account_BALANCE]) return ShowPlayerMessage(playerid, "~r~El comprador no tiene ese dinero.", 3);

				ShowPlayerMessage(playerid, "Tu oferta se envió al comprador.", 3);

				SetPlayerChatBubble(playerid, "\n\n\n\n* Intenta llegar a un acuerdo con alguien.\n\n\n", 0xffcb90FF, 20.0, 5000);

				PLAYER_TEMP[inputtext[0]][py_PLAYER_VEHICLE_SELECTED] = PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED];
				PLAYER_TEMP[inputtext[0]][py_NOTARY_PRICE] = PLAYER_TEMP[playerid][py_NOTARY_PRICE];
				PLAYER_TEMP[inputtext[0]][py_NOTARY_TO_PLAYER] = playerid;
				PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER] = inputtext[0];

				ShowDialog(inputtext[0], DIALOG_SELL_CONFIRM_VEHICLE);
			}
			else ShowDialog(playerid, DIALOG_PROPERTY_SELL_PRICE);
			return 1;
		}
		case DIALOG_SELL_CONFIRM_VEHICLE:
		{
			if (response)
			{
				if (!IsPlayerConnected(PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER])) return ShowPlayerMessage(playerid, "~r~El vendedor no está conectado.", 3);
				if (PLAYER_TEMP[ PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER] ][py_NOTARY_TO_PLAYER] != playerid) return ShowPlayerMessage(playerid, "~r~El vendedor no está cerca tuya.", 3);
				if (PLAYER_TEMP[ PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER] ][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~El vendedor no está disponible.", 3);
				if (ENTER_EXIT[ PLAYER_TEMP[ PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER] ][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE] != INTERIOR_CITY_HALL_LS) return ShowPlayerMessage(playerid, "~r~El vendedor no está en la sala.", 3);
				if (!IsPlayerInRangeOfPoint(PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER], 6.0, 1796.071655, -1414.565307, 2770.660156)) return ShowPlayerMessage(playerid, "~r~El vendedor no está en la sala.", 3);
				if (BANK_ACCOUNT[ PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER] ][bank_account_ID] == 0) return ShowPlayerMessage(playerid, "~r~El vendedor no tiene cuenta vancaria.", 3);

				// Traspasar
				PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][player_vehicle_OWNER_ID] = ACCOUNT_INFO[playerid][ac_ID];
				ClearVehicleKeys(PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][player_vehicle_ID]);

				new DB_Query_update[350];
				format(DB_Query_update, sizeof(DB_Query_update), "UPDATE `PLAYER_VEHICLES` SET `ID_USER` = '%d' WHERE `ID` = '%d';",
					ACCOUNT_INFO[playerid][ac_ID],
					PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][player_vehicle_ID]
				);
				db_free_result(db_query(Database, DB_Query_update));


				// Banco
				new price = PLAYER_TEMP[playerid][py_NOTARY_PRICE], seller = PLAYER_TEMP[playerid][py_NOTARY_TO_PLAYER];

				if (PLAYER_PHONE[playerid][player_phone_VALID])
				{
					new message[64]; format(message, sizeof message, "VEHICULO COMPRADO: -%s$", number_format_thousand(price));
					RegisterPhoneMessage(6740, PLAYER_PHONE[playerid][player_phone_NUMBER], message);
					if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_ON) SendClientMessageEx(playerid, COLOR_WHITE, ""COL_GREEN"[Mensaje] "COL_WHITE"%s: %s", convertPhoneNumber(playerid, 6740), message);
				}
				if (PLAYER_PHONE[seller][player_phone_VALID])
				{
					new message[64]; format(message, sizeof message, "VEHICULO VENDIDO: +%s$", number_format_thousand(price));
					RegisterPhoneMessage(6740, PLAYER_PHONE[seller][player_phone_NUMBER], message);
					if (PLAYER_PHONE[seller][player_phone_STATE] == PHONE_STATE_ON) SendClientMessageEx(seller, COLOR_WHITE, ""COL_GREEN"[Mensaje] "COL_WHITE"%s: %s", convertPhoneNumber(seller, 6740), message);
				}

				BANK_ACCOUNT[playerid][bank_account_BALANCE] -= price;
				RegisterBankAccountTransaction(BANK_ACCOUNT[playerid][bank_account_ID], BANK_TRANSACTION_BUY_VEHICLE, price);

				BANK_ACCOUNT[seller][bank_account_BALANCE] += price;
				RegisterBankAccountTransaction(BANK_ACCOUNT[seller][bank_account_ID], BANK_TRANSACTION_SOLD_VEHICLE, price);


				format(DB_Query_update, sizeof(DB_Query_update),
					"\
						UPDATE `BANK_ACCOUNTS` SET `BALANCE` = '%d' WHERE `ID_ACCOUNT` = '%d';\
						UPDATE `BANK_ACCOUNTS` SET `BALANCE` = '%d' WHERE `ID_ACCOUNT` = '%d';\
					",
						BANK_ACCOUNT[playerid][bank_account_BALANCE], BANK_ACCOUNT[playerid][bank_account_ID],
						BANK_ACCOUNT[seller][bank_account_BALANCE], BANK_ACCOUNT[seller][bank_account_ID]
				);
				db_free_result(db_query(Database, DB_Query_update));


				ShowPlayerMessage(playerid, "¡Vehículo comprado! Utiliza /GPS para localizarlo.", 3);
				SendClientMessageEx(playerid, COLOR_WHITE, ""COL_RED"¡Vehículo %s comprado!", VEHICLE_INFO[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_VEHICLE_SELECTED] ][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME]);
				SendClientMessageEx(seller, COLOR_WHITE, ""COL_RED"¡Vehículo vendido! "COL_WHITE"Has recibido {d1f442}%s$ "COL_WHITE"en tu cuenta bancaria.", number_format_thousand(price));
				PlayerPlaySoundEx(seller, 1058, 0.0, 0.0, 0.0);
				PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);

				SetPlayerChatBubble(playerid, "\n\n\n\n* Llega a un acuerdo\n\n\n", 0xffcb90FF, 20.0, 5000);

				if (!ACCOUNT_INFO[seller][ac_SU]) ReLockPlayerVehicles(seller);
				if (!ACCOUNT_INFO[playerid][ac_SU]) ReLockPlayerVehicles(playerid);
			}
			return 1;
		}
		case DIALOG_TUNING_SELECT_COL_SLOT:
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if (vehicleid == INVALID_VEHICLE_ID) return 1;

			if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_VALID]) return 1;

			new Float:Vehicle_Pos[3];
			GetVehiclePos(vehicleid, Vehicle_Pos[0], Vehicle_Pos[1], Vehicle_Pos[2]);

			if (!IsPlayerInRangeOfPoint(playerid, 5.0, Vehicle_Pos[0], Vehicle_Pos[1], Vehicle_Pos[2])) return ShowPlayerMessage(playerid, "~r~El vehículo está muy lejos.", 3);

			if (response)
			{
				PLAYER_TEMP[playerid][py_MECHANIC_COLOR_SLOT] = listitem;
				ShowDialog(playerid, DIALOG_TUNING_SELECT_COLOR);
			}
			else ShowTuningMenu(playerid);
			return 1;
		}
		case DIALOG_TUNING_SELECT_COLOR:
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if (vehicleid == INVALID_VEHICLE_ID) return 1;

			if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_VALID]) return 1;

			new Float:Vehicle_Pos[3];
			GetVehiclePos(vehicleid, Vehicle_Pos[0], Vehicle_Pos[1], Vehicle_Pos[2]);

			if (!IsPlayerInRangeOfPoint(playerid, 5.0, Vehicle_Pos[0], Vehicle_Pos[1], Vehicle_Pos[2])) return ShowPlayerMessage(playerid, "~r~El vehículo está muy lejos.", 3);

			if (response)
			{
				if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID])
				{
					switch(PLAYER_TEMP[playerid][py_MECHANIC_COLOR_SLOT])
					{
						case 0: GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_1] = listitem;
						case 1: GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_2] = listitem;
					}
					ChangeVehicleColor(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_1], GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_2]);

					ShowPlayerMessage(playerid, "Vehículo ~g~pintado.", 2);
					ShowTuningMenu(playerid);
				}
			}
			else ShowDialog(playerid, DIALOG_TUNING_SELECT_COL_SLOT);
			return 1;
		}
		case DIALOG_TUNING_REMOVE:
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if (vehicleid == INVALID_VEHICLE_ID) return 1;

			if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_VALID]) return 1;

			new Float:Vehicle_Pos[3];
			GetVehiclePos(vehicleid, Vehicle_Pos[0], Vehicle_Pos[1], Vehicle_Pos[2]);

			if (!IsPlayerInRangeOfPoint(playerid, 5.0, Vehicle_Pos[0], Vehicle_Pos[1], Vehicle_Pos[2])) return ShowPlayerMessage(playerid, "~r~El vehículo está muy lejos.", 3);

			if (response)
			{
				if (PLAYER_TUNING_MENU[playerid][listitem][tuning_menu_ID] == 0) return ShowDialog(playerid, dialogid);

				RemoveVehicleComponent(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_COMPONENTS][ PLAYER_TUNING_MENU[playerid][listitem][tuning_menu_ID] ]);
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_COMPONENTS][ PLAYER_TUNING_MENU[playerid][listitem][tuning_menu_ID] ] = 0;

				ShowPlayerMessage(playerid, "Componente ~r~eliminado");
				ShowTuningMenu(playerid);
			}
			else ShowTuningMenu(playerid);
			return 1;
		}
		case DIALOG_TUNING_MENU_COMPONENT:
		{
			if (response)
			{
				if (isnull(PLAYER_TUNING_MENU[playerid][listitem][tuning_menu_NAME]) || !PLAYER_TUNING_MENU[playerid][listitem][tuning_menu_ID]) return 1;

				new vehicleid = GetPlayerVehicleID(playerid);
				if (vehicleid == INVALID_VEHICLE_ID) return 1;
				if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_VALID]) return 1;

				new Float:Vehicle_Pos[3];
				GetVehiclePos(vehicleid, Vehicle_Pos[0], Vehicle_Pos[1], Vehicle_Pos[2]);

				if (!IsPlayerInRangeOfPoint(playerid, 5.0, Vehicle_Pos[0], Vehicle_Pos[1], Vehicle_Pos[2])) return ShowPlayerMessage(playerid, "~r~El vehículo está muy lejos.", 3);

				if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID])
				{
					new slot = GetVehicleComponentType( PLAYER_TUNING_MENU[playerid][listitem][tuning_menu_ID] );
					new current_component = GetVehicleComponentInSlot(vehicleid, slot);
					if (current_component) RemoveVehicleComponent(vehicleid, current_component);

					if (CHARACTER_INFO[playerid][ch_CASH] <= 50) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente", 2, 1150);

					GLOBAL_VEHICLES[vehicleid][gb_vehicle_COMPONENTS][slot] = PLAYER_TUNING_MENU[playerid][listitem][tuning_menu_ID];
					AddVehicleComponent(vehicleid, PLAYER_TUNING_MENU[playerid][listitem][tuning_menu_ID]);
					ShowPlayerMessage(playerid, "Componente ~g~añadido", 2);
					GivePlayerCash(playerid, -50, false);
					ShowTuningMenu(playerid);
				}
			}
			else ShowTuningMenu(playerid);
			return 1;
		}
		/*case DIALOG_SELECT_TRASH_ROUTE:
		{
			if (response)
			{
				if (TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID] == INVALID_PLAYER_ID)
				{
					SendClientMessage(playerid, COLOR_WHITE, ""COL_WHITE"Necesitas un compañero para comenzar a recoger basura.");
					return 1;
				}

				TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_JOB_STARTED] = true;
				TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_ROUTE] = listitem;
				TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_CP] = 0;

				SetPlayerTrashCheckpoint(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);
				SetPlayerTrashCheckpoint(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);

				CreatePlayerTrashRouteObjects(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], listitem);
				CreatePlayerTrashRouteObjects(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], listitem);

				SendClientMessageEx(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], COLOR_WHITE, "Ruta {42aaf4}#%d "COL_WHITE"establecida, pueden comenzar.", TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_ROUTE] + 1);
				SendClientMessageEx(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], COLOR_WHITE, "Ruta {42aaf4}#%d "COL_WHITE"establecida, pueden comenzar.", TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_ROUTE] + 1);
			}
			return 1;
		}*/
		case DIALOG_SEED_LIST:
		{
			if (response)
			{
				PLAYER_TEMP[playerid][py_SELECTED_BUY_SEED_ID] = listitem;
				ShowDialog(playerid, DIALOG_SEED_BUY);
			}
			return 1;
		}
		case DIALOG_SEED_BUY:
		{
			if (response)
			{
				if (sscanf(inputtext, "d", inputtext[0])) return ShowPlayerMessage(playerid, "~r~Cantidad de semillas incorrecta.", 3);
				if (inputtext[0] <= 0 || inputtext[0] > 100000) return ShowPlayerMessage(playerid, "~r~Cantidad de semillas incorrecta.", 3);

				new price = seed_info[ PLAYER_TEMP[playerid][py_SELECTED_BUY_SEED_ID] ][seed_info_PRICE] * inputtext[0];
				if (price > CHARACTER_INFO[playerid][ch_CASH]) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);

				switch(seed_info[ PLAYER_TEMP[playerid][py_SELECTED_BUY_SEED_ID] ][seed_info_PLANT_TYPE])
				{
					case PLANT_TYPE_MEDICINE: AddPlayerItem(playerid, 6, inputtext[0]);
					case PLANT_TYPE_CANNABIS: AddPlayerItem(playerid, 7, inputtext[0]);
					case PLANT_TYPE_CRACK: AddPlayerItem(playerid, 8, inputtext[0]);
				}

				GivePlayerCash(playerid, -price);
			}
			else ShowDialog(playerid, DIALOG_SEED_LIST);
			return 1;
		}
		case DIALOG_PLANT_PLANTS:
		{
			if (response)
			{
				if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No estás depie.", 3);

				switch(seed_info[listitem][seed_info_PLANT_TYPE])
				{
					case PLANT_TYPE_MEDICINE:
					{
						if (PlayerAlreadyHasItem(playerid, 6))
						{
							ShowPlayerMessage(playerid, "~r~No tienes las semillas necesarias para plantar esta planta.", 3);
							return 1;
						}
						SubtractItem(playerid, 6);
					}
					case PLANT_TYPE_CANNABIS:
					{
						if (PlayerAlreadyHasItem(playerid, 7))
						{
							ShowPlayerMessage(playerid, "~r~No tienes las semillas necesarias para plantar esta planta.", 3);
							return 1;
						}
						SubtractItem(playerid, 7);
					}
					case PLANT_TYPE_CRACK:
					{
						if (PlayerAlreadyHasItem(playerid, 8))
						{
							ShowPlayerMessage(playerid, "~r~No tienes las semillas necesarias para plantar esta planta.", 3);
							return 1;
						}
						SubtractItem(playerid, 8);
					}
				}

				new str_text[128];
				format(str_text, sizeof(str_text), "Estas plantando %s, has gastado %d semillas.", plant_info[listitem][plant_info_NAME], plant_info[listitem][plant_info_SEEDS]);
				ShowPlayerNotification(playerid, str_text, 5);

				PLAYER_TEMP[playerid][py_LAST_PLANT_TIME] = gettime();
				PLAYER_TEMP[playerid][py_PLANTING_PLANT_SELECTED] = listitem;
				PLAYER_TEMP[playerid][py_PLANTING] = true;
				PLAYER_TEMP[playerid][py_PLANTING_PROGRESS] = minrand(0, 5);
				UpdatePlantSizeTextdrawPlant(playerid);

				TogglePlayerControllableEx(playerid, false);
				SetCameraBehindPlayer(playerid);
				ApplyAnimation(playerid, "BOMBER", "BOM_Plant_Loop", 4.1, true, false, false, false, 0);

				KillTimer(PLAYER_TEMP[playerid][py_TIMERS][12]);
				PLAYER_TEMP[playerid][py_TIMERS][12] = SetTimerEx("PlantingUp", 1000, false, "id", playerid, plant_info[listitem][plant_info_SEEDS]);
			}
			return 1;
		}
		case DIALOG_BLACK_MARKET:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						if (!ACCOUNT_INFO[playerid][ac_SU])
						{
							if (gettime() < PLAYER_TEMP[playerid][py_LAST_BM_BUY] + 25)
							{
								new time = (10-(gettime()-PLAYER_TEMP[playerid][py_LAST_BM_BUY]));
								SendClientMessageEx(playerid, COLOR_WHITE, "Tienes que esperar %s segundos para volver a comprar aquí.", TimeConvert(time));
								return 1;
							}
						}

						ShowDialog(playerid, DIALOG_BLACK_MARKET_WEAPONS);
					}
					case 1: ShowDialog(playerid, DIALOG_BLACK_MARKET_AMMO_STOCK);
				}
			}
			return 1;
		}
		case DIALOG_BLACK_MARKET_WEAPONS:
		{
			if (response)
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= BLACK_MARKT_WEAPONS[listitem][black_market_WEAPON_PRICE])
				{
					new str_text[128];
					PLAYER_TEMP[playerid][py_LAST_BM_BUY] = gettime();

					GivePlayerCash(playerid, -BLACK_MARKT_WEAPONS[listitem][black_market_WEAPON_PRICE]);
					CHARACTER_INFO[playerid][ch_BLACK_MARKET_LEVEL] ++;

					if (WEAPON_INFO[ BLACK_MARKT_WEAPONS[listitem][black_market_WEAPON_ID] ][weapon_info_AMMO]) GivePlayerWeaponEx(playerid, BLACK_MARKT_WEAPONS[listitem][black_market_WEAPON_ID], 0);
					else GivePlayerWeaponEx(playerid, BLACK_MARKT_WEAPONS[listitem][black_market_WEAPON_ID], 0);

					if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);

					if (BLACK_MARKT_WEAPONS[listitem][black_market_WEAPON_ID] == 41)
	            	{
						AddPlayerItem(playerid, WeaponToType(BLACK_MARKT_WEAPONS[listitem][black_market_WEAPON_ID]), 5000);
	            	}
					else AddPlayerItem(playerid, WeaponToType(BLACK_MARKT_WEAPONS[listitem][black_market_WEAPON_ID]));

					format(str_text, sizeof(str_text), "Compraste una %s por %s$", WEAPON_INFO[ BLACK_MARKT_WEAPONS[listitem][black_market_WEAPON_ID] ][weapon_info_NAME], number_format_thousand(BLACK_MARKT_WEAPONS[listitem][black_market_WEAPON_PRICE]));
	            	ShowPlayerNotification(playerid, str_text, 3);
	            }
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
				    ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			else ShowDialog(playerid, DIALOG_BLACK_MARKET_SELECT);
			return 1;
		}
		/*case DIALOG_BLACK_MARKET_AMMO_STOCK:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] <= 50) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);

						PLAYER_MISC[playerid][MISC_CARTRIDGE_1]++;
						SavePlayerMisc(playerid);

						if (!PLAYER_WORKS[playerid][WORK_POLICE] || !PLAYER_WORKS[playerid][WORK_MAFIA])
						{
							GivePlayerCash(playerid, -50, false);
						}
						return 1;
					}
					case 1:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] <= 100) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);

						PLAYER_MISC[playerid][MISC_CARTRIDGE_4]++;
						SavePlayerMisc(playerid);

						if (!PLAYER_WORKS[playerid][WORK_POLICE] || !PLAYER_WORKS[playerid][WORK_MAFIA])
						{
							GivePlayerCash(playerid, -100, false);
						}
						return 1;
					}
					case 2:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] <= 400) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);

						PLAYER_MISC[playerid][MISC_CARTRIDGE_3]++;
						SavePlayerMisc(playerid);

						if (!PLAYER_WORKS[playerid][WORK_POLICE] || !PLAYER_WORKS[playerid][WORK_MAFIA])
						{
							GivePlayerCash(playerid, -400, false);
						}
						return 1;
					}
					case 3:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] <= 250) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);

						PLAYER_MISC[playerid][MISC_CARTRIDGE_2] += 5;
						SavePlayerMisc(playerid);

						if (!PLAYER_WORKS[playerid][WORK_POLICE] || !PLAYER_WORKS[playerid][WORK_MAFIA])
						{
							GivePlayerCash(playerid, -250, false);
						}
						return 1;
					}
				}
			}
			else ShowDialog(playerid, DIALOG_BLACK_MARKET_AMMO);
			return 1;
		}*/
		case DIALOG_BLACK_MARKET_SELECT_WEA:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;

				PLAYER_TEMP[playerid][py_SELECTED_DIALOG_WEAPON_SLOT] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];

				if (!WEAPON_INFO[ PLAYER_WEAPONS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_DIALOG_WEAPON_SLOT] ][player_weapon_ID] ][weapon_info_AMMO])
				{
				    ShowPlayerMessage(playerid, "~r~Esta arma no requiere de munición.", 3);
					return 1;
				}

				ShowDialog(playerid, DIALOG_BLACK_MARKET_AMMO);
			}
			return 1;
		}
		case DIALOG_BLACK_MARKET_AMMO:
		{
			if (response)
			{
				new weapon_id;
				if (PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] != 9999)
				{
					if (IsWeaponType(PLAYER_VISUAL_INV[playerid][slot_TYPE][ PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] ]))
					{
						weapon_id = TypeToWeapon(PLAYER_VISUAL_INV[playerid][slot_TYPE][ PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] ]);
					}
					else return ShowPlayerMessage(playerid, "~r~Tienes que tener un arma en mano.", 4);
				}
				else return ShowPlayerMessage(playerid, "~r~Tienes que tener un arma en mano.", 4);

				if (!WEAPON_INFO[weapon_id][weapon_info_AMMO]) return ShowPlayerMessage(playerid, "~r~Esta arma no usa munición.", 4);

				if (PLAYER_WEAPONS[playerid][ GetWeaponSlot(weapon_id) ][player_weapon_AMMO] >= 1000)
				{
					ShowPlayerMessage(playerid, "~r~Esta arma ya tiene mucha munición.", 3);
					return 1;
				}

				switch(listitem)
				{
					case 0:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] <= 450) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);
						GivePlayerWeaponEx(playerid, weapon_id, 50, false, true);

						new str_text[128];
						format(str_text, sizeof(str_text), "Compraste 50 balas para tu %s.", WEAPON_INFO[ weapon_id ][weapon_info_NAME]);
						ShowPlayerNotification(playerid, str_text, 3);

						if (PLAYER_WORKS[playerid][WORK_POLICE])
						{
							ShowPlayerMessage(playerid, "No se te va a cobrar por ser policía.", 3);
							return 1;
						}
						else
						{
							GivePlayerCash(playerid, -450, false);
						}
						return 1;
					}
					case 1:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] <= 650) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);
						GivePlayerWeaponEx(playerid, weapon_id, 100, false, true);

						new str_text[128];
						format(str_text, sizeof(str_text), "Compraste 100 balas para tu %s.", WEAPON_INFO[ weapon_id ][weapon_info_NAME]);
						ShowPlayerNotification(playerid, str_text, 3);

						if (PLAYER_WORKS[playerid][WORK_POLICE])
						{
							ShowPlayerMessage(playerid, "No se te va a cobrar por ser policía.", 3);
							return 1;
						}
						else
						{
							GivePlayerCash(playerid, -650, false);
						}
						return 1;
					}
					case 2:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] <= 850) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);
						GivePlayerWeaponEx(playerid, weapon_id, 250, false, true);

						new str_text[128];
						format(str_text, sizeof(str_text), "Compraste 200 balas para tu %s.", WEAPON_INFO[ weapon_id ][weapon_info_NAME]);
						ShowPlayerNotification(playerid, str_text, 3);

						if (PLAYER_WORKS[playerid][WORK_POLICE])
						{
							ShowPlayerMessage(playerid, "No se te va a cobrar por ser policía.", 3);
							return 1;
						}
						else
						{
							GivePlayerCash(playerid, -850, false);
						}
						return 1;
					}
					case 3:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] <= 1350) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);
						GivePlayerWeaponEx(playerid, weapon_id, 300, false, true);

						new str_text[128];
						format(str_text, sizeof(str_text), "Compraste 300 balas para tu %s.", WEAPON_INFO[ weapon_id ][weapon_info_NAME]);
						ShowPlayerNotification(playerid, str_text, 3);

						if (PLAYER_WORKS[playerid][WORK_POLICE])
						{
							ShowPlayerMessage(playerid, "No se te va a cobrar por ser policía.", 3);
							return 1;
						}
						else
						{
							GivePlayerCash(playerid, -1350, false);
						}
						return 1;
					}
				}
			}
			return 1;
		}
		case DIALOG_TRICKS_SU:
		{
			if (response)
			{
				if (gettime() > PLAYER_TEMP[playerid][py_TRICK_TIME] + 20) return ShowPlayerMessage(playerid, "~r~Tardaste mucho en aceptar.", 3);
				if (!IsPlayerConnected(PLAYER_TEMP[playerid][py_TRICK_SELLER_PID])) return ShowPlayerMessage(playerid, "~r~El vendedor no está conectado.", 3);
				if (ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_TRICK_SELLER_PID] ][ac_ID] != PLAYER_TEMP[playerid][py_TRICK_SELLER_AID]) return ShowPlayerMessage(playerid, "~r~El vendedor no está conectado.", 3);

				new Float:x, Float:y, Float:z; GetPlayerPos(PLAYER_TEMP[playerid][py_TRICK_SELLER_PID], x, y, z);
				if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El vendedor no está cerca tuya.", 3);
				if (PLAYER_TEMP[ PLAYER_TEMP[playerid][py_TRICK_SELLER_PID] ][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~El vendedor no está disponible.", 3);


				ACCOUNT_INFO[playerid][ac_SD] += PLAYER_TEMP[playerid][py_TRICK_SELLER_EXTRA];
				ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_TRICK_SELLER_PID] ][ac_SD] -= PLAYER_TEMP[playerid][py_TRICK_SELLER_EXTRA];

				new DB_Query_update[256];
				format
				(
					DB_Query_update, sizeof DB_Query_update,

						"\
							UPDATE `ACCOUNTS` SET `SD` = '%d' WHERE `ID` = '%d';\
							UPDATE `ACCOUNTS` SET `SD` = '%d' WHERE `ID` = '%d';\
						",
							ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_ID],
							ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_TRICK_SELLER_PID] ][ac_SD], ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_TRICK_SELLER_PID] ][ac_ID]
				);
				db_free_result(db_query(Database, DB_Query_update));

				GivePlayerCash(playerid, -PLAYER_TEMP[playerid][py_TRICK_PRICE]);
				GivePlayerCash(PLAYER_TEMP[playerid][py_TRICK_SELLER_PID], PLAYER_TEMP[playerid][py_TRICK_PRICE]);

				SetPlayerChatBubble(PLAYER_TEMP[playerid][py_TRICK_SELLER_PID], "* Llega a un acuerdo con alguien.\n\n\n", 0xffcb90FF, 20.0, 5000);
			
				new str_text[164];
				format(str_text, sizeof(str_text), "%s (%d) le ha vendido %d hycoins a %s (%d) al precio de %d$.",
					PLAYER_TEMP[ PLAYER_TEMP[playerid][py_TRICK_SELLER_PID] ][py_NAME],
					PLAYER_TEMP[playerid][py_TRICK_SELLER_PID],
					PLAYER_TEMP[playerid][py_TRICK_SELLER_EXTRA],
					PLAYER_TEMP[playerid][py_NAME],
					playerid,
					PLAYER_TEMP[playerid][py_TRICK_PRICE]
				);
				Log("hycoin_sell", str_text);
			}
			else
			{
				if (gettime() > PLAYER_TEMP[playerid][py_TRICK_TIME] + 20) return 1;
				if (!IsPlayerConnected(PLAYER_TEMP[playerid][py_TRICK_SELLER_PID])) return 1;
				if (ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_TRICK_SELLER_PID] ][ac_ID] != PLAYER_TEMP[playerid][py_TRICK_SELLER_AID]) return 1;

			    ShowPlayerMessage(PLAYER_TEMP[playerid][py_TRICK_SELLER_PID], "~r~El comprador no ha aceptado tu trato.", 3);
			}
			return 1;
		}
		case DIALOG_SELECT_POLICE_SKIN:
		{
			if (response)
			{
				if (!PLAYER_WORKS[playerid][WORK_POLICE]) return 1;
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				if (POLICE_SKINS[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][police_skin_RANK] > PLAYER_SKILLS[playerid][WORK_POLICE]) return ShowDialog(playerid, dialogid);

				SetPlayerSkin(playerid, POLICE_SKINS[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][police_skin_SKIN]);
				PLAYER_TEMP[playerid][py_SKIN] = POLICE_SKINS[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][police_skin_SKIN];
				StartPlayerJob(playerid, WORK_POLICE);
				SetPlayerColorEx(playerid, 0x6060FF00);
			}
			return 1;
		}
		case DIALOG_POLICE_RADIOS:
		{
			if (response)
			{
				PLAYER_TEMP[playerid][py_POLICE_RADIO] = listitem;
				SendClientMessageEx(playerid, COLOR_WHITE, "Tu radio ha sido ajustada a la frecuencia %d.", listitem + 1);
			}
			return 1;
		}
		case DIALOG_POLICE_LIST:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -2) // Siguiente
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_WORKS` WHERE `ID_WORK` = '%d' AND `SET` = '1';", WORK_POLICE);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] >= GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] ++;
					ShowDialog(playerid, dialogid);
				}
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -3) //Anterior
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_WORKS` WHERE `ID_WORK` = '%d' AND `SET` = '1';", WORK_POLICE);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] <= 0) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] --;
					ShowDialog(playerid, dialogid);
				}
				else
				{
					if (PLAYER_SKILLS[playerid][WORK_POLICE] >= 11)
					{
						PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
						ShowDialog(playerid, DIALOG_POLICE_MODIFY);
					}
				}
			}
			return 1;
		}
		case DIALOG_POLICE_MODIFY:
		{
			if (response)
			{
				if (listitem > PLAYER_SKILLS[playerid][WORK_POLICE])
				{
				    ShowPlayerMessage(playerid, "~r~El rango que has seleccionado es superior al tuyo.", 3);

					return 1;
				}

				new DBResult:Result, DB_Query[256], name[24], connected, player_id, current_rank, bool:found;
				format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `ACCOUNTS`.`CONNECTED`, `ACCOUNTS`.`PLAYERID`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_POLICE);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result))
				{
					db_get_field_assoc(Result, "NAME", name, 24);
					connected = db_get_field_assoc_int(Result, "CONNECTED");
					player_id = db_get_field_assoc_int(Result, "PLAYERID");
					current_rank = db_get_field_assoc_int(Result, "TOTAL");
					found = true;
				}
				else found = false;
				db_free_result(Result);

				if (!found) return 1;
				if (current_rank > PLAYER_SKILLS[playerid][WORK_POLICE])
				{
				    ShowPlayerMessage(playerid, "~r~No puedes modificar el rango de este policía porque es un rango superior al tuyo.", 3);
					return 1;
				}

				format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_SKILLS` SET `TOTAL` = '%d' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", listitem, PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_POLICE);
				db_free_result(db_query(Database, DB_Query));
				SendClientMessageEx(playerid, COLOR_WHITE, ""COL_WHITE"El nuevo rango de %s es: '%s'.", name, POLICE_RANKS[listitem]);

				if (listitem == 0)
				{
					format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_WORKS` SET `SET` = '0' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_POLICE);
					db_free_result(db_query(Database, DB_Query));
				}

				if (connected)
				{
					PLAYER_SKILLS[player_id][WORK_POLICE] = listitem;

					if (listitem == 0)
					{
						if (PLAYER_TEMP[player_id][py_WORKING_IN] == WORK_POLICE) EndPlayerJob(player_id);
						PLAYER_WORKS[player_id][WORK_POLICE] = false;
						SendClientMessageEx(player_id, COLOR_WHITE, "El %s %s te ha expulsado del cuerpo de policía.", POLICE_RANKS[ PLAYER_SKILLS[playerid][WORK_POLICE] ], PLAYER_TEMP[playerid][py_RP_NAME]);
					}
					else SendClientMessageEx(player_id, COLOR_WHITE, ""COL_WHITE"El %s %s ha modificado tu rango del cuerpo de policía a '%s'.", POLICE_RANKS[ PLAYER_SKILLS[playerid][WORK_POLICE] ], PLAYER_TEMP[playerid][py_RP_NAME], POLICE_RANKS[listitem]);
				}
			}
			else ShowDialog(playerid, DIALOG_POLICE_LIST);
			return 1;
		}
		case DIALOG_MAFIA_LIST:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -2) // Siguiente
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_WORKS` WHERE `ID_WORK` = '%d' AND `SET` = '1';", WORK_MAFIA);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] >= GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] ++;
					ShowDialog(playerid, dialogid);
				}
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -3) //Anterior
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_WORKS` WHERE `ID_WORK` = '%d' AND `SET` = '1';", WORK_MAFIA);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] <= 0) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] --;
					ShowDialog(playerid, dialogid);
				}
				else
				{
					if (PLAYER_SKILLS[playerid][WORK_MAFIA] >= 15)
					{
						PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
						ShowDialog(playerid, DIALOG_MAFIA_MODIFY);
					}
				}
			}
			return 1;
		}
		case DIALOG_MAFIA_MODIFY:
		{
			if (response)
			{
				if (listitem > PLAYER_SKILLS[playerid][WORK_MAFIA])
				{
				    ShowPlayerMessage(playerid, "~r~El rango que has seleccionado es superior al tuyo.", 3);

					return 1;
				}

				new DBResult:Result, DB_Query[256], name[24], connected, player_id, current_rank, bool:found;
				format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `ACCOUNTS`.`CONNECTED`, `ACCOUNTS`.`PLAYERID`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_MAFIA);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result))
				{
					db_get_field_assoc(Result, "NAME", name, 24);
					connected = db_get_field_assoc_int(Result, "CONNECTED");
					player_id = db_get_field_assoc_int(Result, "PLAYERID");
					current_rank = db_get_field_assoc_int(Result, "TOTAL");
					found = true;
				}
				else found = false;
				db_free_result(Result);

				if (!found) return 1;
				if (current_rank > PLAYER_SKILLS[playerid][WORK_MAFIA])
				{
				    ShowPlayerMessage(playerid, "~r~No puedes modificar el rango de este jugador porque es un rango superior al tuyo.", 3);
					return 1;
				}

				format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_SKILLS` SET `TOTAL` = '%d' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", listitem, PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_MAFIA);
				db_free_result(db_query(Database, DB_Query));
				SendClientMessageEx(playerid, 0xa912e2FF, "[FSB] "COL_WHITE" El nuevo rango de %s es: %s.", name, MAFIA_RANKS[listitem]);

				if (listitem == 0)
				{
					format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_WORKS` SET `SET` = '0' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_MAFIA);
					db_free_result(db_query(Database, DB_Query));
				}

				if (connected)
				{
					PLAYER_SKILLS[player_id][WORK_MAFIA] = listitem;

					if (listitem == 0)
					{
						if (PLAYER_TEMP[player_id][py_WORKING_IN] == WORK_MAFIA) EndPlayerJob(player_id);
						PLAYER_WORKS[player_id][WORK_MAFIA] = false;
						SendClientMessageEx(player_id, 0xa912e2FF, "[FSB] "COL_WHITE" El %s %s te ha expulsado de Family SaintBlood'S.", MAFIA_RANKS[ PLAYER_SKILLS[playerid][WORK_MAFIA] ], PLAYER_TEMP[playerid][py_RP_NAME]);
					}
					else SendClientMessageEx(player_id, 0xa912e2FF, "[FSB] "COL_WHITE" El %s %s ha modificado tu rango a %s.", MAFIA_RANKS[ PLAYER_SKILLS[playerid][WORK_MAFIA] ], PLAYER_TEMP[playerid][py_RP_NAME], MAFIA_RANKS[listitem]);
				}
			}
			else ShowDialog(playerid, DIALOG_MAFIA_LIST);
			return 1;
		}
		case DIALOG_ENEMY_MAFIA_LIST:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -2) // Siguiente
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_WORKS` WHERE `ID_WORK` = '%d' AND `SET` = '1';", WORK_ENEMY_MAFIA);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] >= GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] ++;
					ShowDialog(playerid, dialogid);
				}
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -3) //Anterior
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_WORKS` WHERE `ID_WORK` = '%d' AND `SET` = '1';", WORK_ENEMY_MAFIA);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] <= 0) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] --;
					ShowDialog(playerid, dialogid);
				}
				else
				{
					if (PLAYER_SKILLS[playerid][WORK_ENEMY_MAFIA] >= 5)
					{
						PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
						ShowDialog(playerid, DIALOG_ENEMY_MAFIA_MODIFY);
					}
				}
			}
			return 1;
		}
		case DIALOG_ENEMY_MAFIA_MODIFY:
		{
			if (response)
			{
				if (listitem > PLAYER_SKILLS[playerid][WORK_ENEMY_MAFIA])
				{
				    ShowPlayerMessage(playerid, "~r~El rango que has seleccionado es superior al tuyo.", 3);

					return 1;
				}

				new DBResult:Result, DB_Query[256], name[24], connected, player_id, current_rank, bool:found;
				format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `ACCOUNTS`.`CONNECTED`, `ACCOUNTS`.`PLAYERID`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_ENEMY_MAFIA);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result))
				{
					db_get_field_assoc(Result, "NAME", name, 24);
					connected = db_get_field_assoc_int(Result, "CONNECTED");
					player_id = db_get_field_assoc_int(Result, "PLAYERID");
					current_rank = db_get_field_assoc_int(Result, "TOTAL");
					found = true;
				}
				else found = false;
				db_free_result(Result);

				if (!found) return 1;
				if (current_rank > PLAYER_SKILLS[playerid][WORK_ENEMY_MAFIA])
				{
				    ShowPlayerMessage(playerid, "~r~No puedes modificar el rango de este jugador porque es un rango superior al tuyo.", 3);
					return 1;
				}

				format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_SKILLS` SET `TOTAL` = '%d' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", listitem, PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_ENEMY_MAFIA);
				db_free_result(db_query(Database, DB_Query));
				SendClientMessageEx(playerid, 0xf5e30aFF, "[TSA] "COL_WHITE" El nuevo rango de %s es: %s.", name, ENEMY_MAFIA_RANKS[listitem]);

				if (listitem == 0)
				{
					format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_WORKS` SET `SET` = '0' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_ENEMY_MAFIA);
					db_free_result(db_query(Database, DB_Query));
				}

				if (connected)
				{
					PLAYER_SKILLS[player_id][WORK_ENEMY_MAFIA] = listitem;

					if (listitem == 0)
					{
						if (PLAYER_TEMP[player_id][py_WORKING_IN] == WORK_ENEMY_MAFIA) EndPlayerJob(player_id);
						PLAYER_WORKS[player_id][WORK_ENEMY_MAFIA] = false;
						SendClientMessageEx(player_id, 0xf5e30aFF, "[TSA] "COL_WHITE" El %s %s te ha expulsado de Triade di San Andreas.", ENEMY_MAFIA_RANKS[ PLAYER_SKILLS[playerid][WORK_ENEMY_MAFIA] ], PLAYER_TEMP[playerid][py_RP_NAME]);
					}
					else SendClientMessageEx(player_id, 0xf5e30aFF, "[TSA] "COL_WHITE" El %s %s ha modificado tu rango a %s.", ENEMY_MAFIA_RANKS[ PLAYER_SKILLS[playerid][WORK_ENEMY_MAFIA] ], PLAYER_TEMP[playerid][py_RP_NAME], ENEMY_MAFIA_RANKS[listitem]);
				}
			}
			else ShowDialog(playerid, DIALOG_ENEMY_MAFIA_LIST);
			return 1;
		}
		case DIALOG_OSBORN_MAFIA_LIST:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -2) // Siguiente
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_WORKS` WHERE `ID_WORK` = '%d' AND `SET` = '1';", WORK_OSBORN);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] >= GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] ++;
					ShowDialog(playerid, dialogid);
				}
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -3) //Anterior
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_WORKS` WHERE `ID_WORK` = '%d' AND `SET` = '1';", WORK_OSBORN);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] <= 0) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] --;
					ShowDialog(playerid, dialogid);
				}
				else
				{
					if (PLAYER_SKILLS[playerid][WORK_OSBORN] >= 19)
					{
						PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
						ShowDialog(playerid, DIALOG_OSBORN_MAFIA_MODIFY);
					}
				}
			}
			return 1;
		}
		case DIALOG_OSBORN_MAFIA_MODIFY:
		{
			if (response)
			{
				if (listitem > PLAYER_SKILLS[playerid][WORK_OSBORN])
				{
				    ShowPlayerMessage(playerid, "~r~El rango que has seleccionado es superior al tuyo.", 3);

					return 1;
				}

				new DBResult:Result, DB_Query[256], name[24], connected, player_id, current_rank, bool:found;
				format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `ACCOUNTS`.`CONNECTED`, `ACCOUNTS`.`PLAYERID`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_OSBORN);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result))
				{
					db_get_field_assoc(Result, "NAME", name, 24);
					connected = db_get_field_assoc_int(Result, "CONNECTED");
					player_id = db_get_field_assoc_int(Result, "PLAYERID");
					current_rank = db_get_field_assoc_int(Result, "TOTAL");
					found = true;
				}
				else found = false;
				db_free_result(Result);

				if (!found) return 1;
				if (current_rank > PLAYER_SKILLS[playerid][WORK_OSBORN])
				{
				    ShowPlayerMessage(playerid, "~r~No puedes modificar el rango de este jugador porque es un rango superior al tuyo.", 3);
					return 1;
				}

				format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_SKILLS` SET `TOTAL` = '%d' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", listitem, PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_OSBORN);
				db_free_result(db_query(Database, DB_Query));
				SendClientMessageEx(playerid, 0x3a3eabFF, "[Familia Osborn] "COL_WHITE" El nuevo rango de %s es: %s.", name, OSBORN_RANKS[listitem]);

				if (listitem == 0)
				{
					format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_WORKS` SET `SET` = '0' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_OSBORN);
					db_free_result(db_query(Database, DB_Query));
				}

				if (connected)
				{
					PLAYER_SKILLS[player_id][WORK_OSBORN] = listitem;

					if (listitem == 0)
					{
						if (PLAYER_TEMP[player_id][py_WORKING_IN] == WORK_OSBORN) EndPlayerJob(player_id);
						PLAYER_WORKS[player_id][WORK_OSBORN] = false;
						SendClientMessageEx(player_id, 0x3a3eabFF, "[Familia Osborn] "COL_WHITE" El %s %s te ha expulsado de Triade di San Andreas.", OSBORN_RANKS[ PLAYER_SKILLS[playerid][WORK_OSBORN] ], PLAYER_TEMP[playerid][py_RP_NAME]);
					}
					else SendClientMessageEx(player_id, 0x3a3eabFF, "[Familia Osborn] "COL_WHITE" El %s %s ha modificado tu rango a %s.", OSBORN_RANKS[ PLAYER_SKILLS[playerid][WORK_OSBORN] ], PLAYER_TEMP[playerid][py_RP_NAME], OSBORN_RANKS[listitem]);
				}
			}
			else ShowDialog(playerid, DIALOG_OSBORN_MAFIA_LIST);
			return 1;
		}
		case DIALOG_CONNOR_MAFIA_LIST:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -2) // Siguiente
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_WORKS` WHERE `ID_WORK` = '%d' AND `SET` = '1';", WORK_CONNOR);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] >= GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] ++;
					ShowDialog(playerid, dialogid);
				}
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -3) //Anterior
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_WORKS` WHERE `ID_WORK` = '%d' AND `SET` = '1';", WORK_CONNOR);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] <= 0) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] --;
					ShowDialog(playerid, dialogid);
				}
				else
				{
					if (PLAYER_SKILLS[playerid][WORK_CONNOR] >= 11)
					{
						PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
						ShowDialog(playerid, DIALOG_CONNOR_MAFIA_MODIFY);
					}
				}
			}
			return 1;
		}
		case DIALOG_CONNOR_MAFIA_MODIFY:
		{
			if (response)
			{
				if (listitem > PLAYER_SKILLS[playerid][WORK_CONNOR])
				{
				    ShowPlayerMessage(playerid, "~r~El rango que has seleccionado es superior al tuyo.", 3);

					return 1;
				}

				new DBResult:Result, DB_Query[256], name[24], connected, player_id, current_rank, bool:found;
				format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `ACCOUNTS`.`CONNECTED`, `ACCOUNTS`.`PLAYERID`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_CONNOR);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result))
				{
					db_get_field_assoc(Result, "NAME", name, 24);
					connected = db_get_field_assoc_int(Result, "CONNECTED");
					player_id = db_get_field_assoc_int(Result, "PLAYERID");
					current_rank = db_get_field_assoc_int(Result, "TOTAL");
					found = true;
				}
				else found = false;
				db_free_result(Result);

				if (!found) return 1;
				if (current_rank > PLAYER_SKILLS[playerid][WORK_CONNOR])
				{
				    ShowPlayerMessage(playerid, "~r~No puedes modificar el rango de este jugador porque es un rango superior al tuyo.", 3);
					return 1;
				}

				format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_SKILLS` SET `TOTAL` = '%d' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", listitem, PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_CONNOR);
				db_free_result(db_query(Database, DB_Query));
				SendClientMessageEx(playerid, 0xc33d3dFF, "[TFC] "COL_WHITE" El nuevo rango de %s es: %s.", name, CONNOR_RANKS[listitem]);

				if (listitem == 0)
				{
					format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_WORKS` SET `SET` = '0' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_CONNOR);
					db_free_result(db_query(Database, DB_Query));
				}

				if (connected)
				{
					PLAYER_SKILLS[player_id][WORK_CONNOR] = listitem;

					if (listitem == 0)
					{
						if (PLAYER_TEMP[player_id][py_WORKING_IN] == WORK_CONNOR) EndPlayerJob(player_id);
						PLAYER_WORKS[player_id][WORK_CONNOR] = false;
						SendClientMessageEx(player_id, 0xc33d3dFF, "[TFC] "COL_WHITE" El %s %s te ha expulsado de Triade di San Andreas.", CONNOR_RANKS[ PLAYER_SKILLS[playerid][WORK_CONNOR] ], PLAYER_TEMP[playerid][py_RP_NAME]);
					}
					else SendClientMessageEx(player_id, 0xc33d3dFF, "[TFC] "COL_WHITE" El %s %s ha modificado tu rango a %s.", CONNOR_RANKS[ PLAYER_SKILLS[playerid][WORK_CONNOR] ], PLAYER_TEMP[playerid][py_RP_NAME], CONNOR_RANKS[listitem]);
				}
			}
			else ShowDialog(playerid, DIALOG_CONNOR_MAFIA_LIST);
			return 1;
		}
		case DIALOG_DIVISO_MAFIA_LIST:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -2) // Siguiente
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_WORKS` WHERE `ID_WORK` = '%d' AND `SET` = '1';", WORK_DIVISO);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] >= GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] ++;
					ShowDialog(playerid, dialogid);
				}
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -3) //Anterior
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_WORKS` WHERE `ID_WORK` = '%d' AND `SET` = '1';", WORK_DIVISO);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] <= 0) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] --;
					ShowDialog(playerid, dialogid);
				}
				else
				{
					if (PLAYER_SKILLS[playerid][WORK_DIVISO] >= 11)
					{
						PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
						ShowDialog(playerid, DIALOG_DIVISO_MAFIA_MODIFY);
					}
				}
			}
			return 1;
		}
		case DIALOG_DIVISO_MAFIA_MODIFY:
		{
			if (response)
			{
				if (listitem > PLAYER_SKILLS[playerid][WORK_DIVISO])
				{
				    ShowPlayerMessage(playerid, "~r~El rango que has seleccionado es superior al tuyo.", 3);

					return 1;
				}

				new DBResult:Result, DB_Query[256], name[24], connected, player_id, current_rank, bool:found;
				format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `ACCOUNTS`.`CONNECTED`, `ACCOUNTS`.`PLAYERID`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_DIVISO);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result))
				{
					db_get_field_assoc(Result, "NAME", name, 24);
					connected = db_get_field_assoc_int(Result, "CONNECTED");
					player_id = db_get_field_assoc_int(Result, "PLAYERID");
					current_rank = db_get_field_assoc_int(Result, "TOTAL");
					found = true;
				}
				else found = false;
				db_free_result(Result);

				if (!found) return 1;
				if (current_rank > PLAYER_SKILLS[playerid][WORK_DIVISO])
				{
				    ShowPlayerMessage(playerid, "~r~No puedes modificar el rango de este jugador porque es un rango superior al tuyo.", 3);
					return 1;
				}

				format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_SKILLS` SET `TOTAL` = '%d' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", listitem, PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_DIVISO);
				db_free_result(db_query(Database, DB_Query));
				SendClientMessageEx(playerid, 0xE55B5BFF, "[GNR] "COL_WHITE" El nuevo rango de %s es: %s.", name, DIVISO_RANKS[listitem]);

				if (listitem == 0)
				{
					format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_WORKS` SET `SET` = '0' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_DIVISO);
					db_free_result(db_query(Database, DB_Query));
				}

				if (connected)
				{
					PLAYER_SKILLS[player_id][WORK_DIVISO] = listitem;

					if (listitem == 0)
					{
						if (PLAYER_TEMP[player_id][py_WORKING_IN] == WORK_DIVISO) EndPlayerJob(player_id);
						PLAYER_WORKS[player_id][WORK_DIVISO] = false;
						SendClientMessageEx(player_id, 0xE55B5BFF, "[GNR] "COL_WHITE" El %s %s te ha expulsado de Triade di San Andreas.", DIVISO_RANKS[ PLAYER_SKILLS[playerid][WORK_DIVISO] ], PLAYER_TEMP[playerid][py_RP_NAME]);
					}
					else SendClientMessageEx(player_id, 0xE55B5BFF, "[GNR] "COL_WHITE" El %s %s ha modificado tu rango a %s.", DIVISO_RANKS[ PLAYER_SKILLS[playerid][WORK_DIVISO] ], PLAYER_TEMP[playerid][py_RP_NAME], DIVISO_RANKS[listitem]);
				}
			}
			else ShowDialog(playerid, DIALOG_DIVISO_MAFIA_LIST);
			return 1;
		}
		case DIALOG_SINDACCO_MAFIA_LIST:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -2) // Siguiente
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_WORKS` WHERE `ID_WORK` = '%d' AND `SET` = '1';", WORK_SINDACCO);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] >= GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] ++;
					ShowDialog(playerid, dialogid);
				}
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -3) //Anterior
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_WORKS` WHERE `ID_WORK` = '%d' AND `SET` = '1';", WORK_SINDACCO);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] <= 0) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] --;
					ShowDialog(playerid, dialogid);
				}
				else
				{
					if (PLAYER_SKILLS[playerid][WORK_SINDACCO] >= 22)
					{
						PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
						ShowDialog(playerid, DIALOG_SINDACCO_MAFIA_MODIFY);
					}
				}
			}
			return 1;
		}
		case DIALOG_SINDACCO_MAFIA_MODIFY:
		{
			if (response)
			{
				if (listitem > PLAYER_SKILLS[playerid][WORK_SINDACCO])
				{
				    ShowPlayerMessage(playerid, "~r~El rango que has seleccionado es superior al tuyo.", 3);

					return 1;
				}

				new DBResult:Result, DB_Query[256], name[24], connected, player_id, current_rank, bool:found;
				format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `ACCOUNTS`.`CONNECTED`, `ACCOUNTS`.`PLAYERID`, `PLAYER_SKILLS`.`TOTAL` FROM `ACCOUNTS`, `PLAYER_SKILLS` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_SKILLS`.`ID_USER` = `ACCOUNTS`.`ID` AND `PLAYER_SKILLS`.`ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_SINDACCO);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result))
				{
					db_get_field_assoc(Result, "NAME", name, 24);
					connected = db_get_field_assoc_int(Result, "CONNECTED");
					player_id = db_get_field_assoc_int(Result, "PLAYERID");
					current_rank = db_get_field_assoc_int(Result, "TOTAL");
					found = true;
				}
				else found = false;
				db_free_result(Result);

				if (!found) return 1;
				if (current_rank > PLAYER_SKILLS[playerid][WORK_SINDACCO])
				{
				    ShowPlayerMessage(playerid, "~r~No puedes modificar el rango de este jugador porque es un rango superior al tuyo.", 3);
					return 1;
				}

				format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_SKILLS` SET `TOTAL` = '%d' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", listitem, PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_SINDACCO);
				db_free_result(db_query(Database, DB_Query));
				SendClientMessageEx(playerid, 0xFFFFFFFF, "[TFS] "COL_WHITE" El nuevo rango de %s es: %s.", name, SINDACCO_RANKS[listitem]);

				if (listitem == 0)
				{
					format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_WORKS` SET `SET` = '0' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID], WORK_SINDACCO);
					db_free_result(db_query(Database, DB_Query));
				}

				if (connected)
				{
					PLAYER_SKILLS[player_id][WORK_SINDACCO] = listitem;

					if (listitem == 0)
					{
						if (PLAYER_TEMP[player_id][py_WORKING_IN] == WORK_SINDACCO) EndPlayerJob(player_id);
						PLAYER_WORKS[player_id][WORK_SINDACCO] = false;
						SendClientMessageEx(player_id, 0xFFFFFFFF, "[TFS] "COL_WHITE" El %s %s te ha expulsado de Triade di San Andreas.", SINDACCO_RANKS[ PLAYER_SKILLS[playerid][WORK_SINDACCO] ], PLAYER_TEMP[playerid][py_RP_NAME]);
					}
					else SendClientMessageEx(player_id, 0xFFFFFFFF, "[TFS] "COL_WHITE" El %s %s ha modificado tu rango a %s.", SINDACCO_RANKS[ PLAYER_SKILLS[playerid][WORK_SINDACCO] ], PLAYER_TEMP[playerid][py_RP_NAME], SINDACCO_RANKS[listitem]);
				}
			}
			else ShowDialog(playerid, DIALOG_SINDACCO_MAFIA_LIST);
			return 1;
		}
		case DIALOG_POLICE_SHOP:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: ShowDialog(playerid, DIALOG_POLICE_WEAPONS);
					case 1: ShowDialog(playerid, DIALOG_POLICE_ARMOUR);
					case 2: ShowDialog(playerid, DIALOG_BLACK_MARKET_SELECT_WEA);
				}
			}
			return 1;
		}
		case DIALOG_POLICE_SELECT_WEAPON:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;

				PLAYER_TEMP[playerid][py_SELECTED_DIALOG_WEAPON_SLOT] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];

				if (!WEAPON_INFO[ PLAYER_WEAPONS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_DIALOG_WEAPON_SLOT] ][player_weapon_ID] ][weapon_info_AMMO])
				{
				    ShowPlayerMessage(playerid, "~r~Esta arma no requiere de munición.", 3);
					return 1;
				}

				ShowDialog(playerid, DIALOG_POLICE_AMMO);
			}
			return 1;
		}
		case DIALOG_POLICE_AMMO:
		{
			if (response)
			{
				if (sscanf(inputtext, "d", inputtext[0])) return ShowDialog(playerid, dialogid);
				if (inputtext[0] <= 0 || inputtext[0] > 9999) return ShowPlayerMessage(playerid, "~r~Cantidad de munición incorrecta.", 3);

				new price = 2 * inputtext[0];
				if (price > CHARACTER_INFO[playerid][ch_CASH]) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);

				if (PLAYER_WEAPONS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_DIALOG_WEAPON_SLOT] ][player_weapon_AMMO] + inputtext[0] > 9999)
				{
					ShowPlayerMessage(playerid, "~r~Esta arma no le entra esa cantidad de munición.", 3);
					return 1;
				}

				GivePlayerCash(playerid, -price);
				GivePlayerWeaponEx(playerid, PLAYER_WEAPONS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_DIALOG_WEAPON_SLOT] ][player_weapon_ID], inputtext[0]);

				SendClientMessageEx(playerid, COLOR_WHITE, ""COL_WHITE"Has comprado "COL_RED"%s "COL_WHITE"de munición para tu "COL_RED"'%s' "COL_WHITE"por %s$.", number_format_thousand(inputtext[0]), WEAPON_INFO[ PLAYER_WEAPONS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_DIALOG_WEAPON_SLOT] ][player_weapon_ID] ][weapon_info_NAME], number_format_thousand(price));
				ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
			}
			return 1;
		}
		case DIALOG_POLICE_WEAPONS:
		{
			if (response)
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= POLICE_SHOP_WEAPONS[listitem][police_shop_WEAPON_PRICE])
				{
					if (!PLAYER_WORKS[playerid][WORK_POLICE])
					{
						if (POLICE_SHOP_WEAPONS[listitem][police_shop_WEAPON_ID] == 23) return ShowPlayerMessage(playerid, "~r~Esta arma solo es para policías", 4);
					}

					if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);
					AddPlayerItem(playerid, WeaponToType(POLICE_SHOP_WEAPONS[listitem][police_shop_WEAPON_ID]));
					ShowPlayerNotification(playerid, "Arma adquirida", 3);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			return 1;
		}
		case DIALOG_ADMIN_LIST:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -2) // Siguiente
				{
					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] >= GetDatabasePages("SELECT COUNT() FROM `ACCOUNTS` WHERE `ADMIN_LEVEL` > 0;", PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] ++;
					ShowDialog(playerid, dialogid);
				}
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -3) //Anterior
				{
					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] <= 0) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = GetDatabasePages("SELECT COUNT() FROM `ACCOUNTS` WHERE `ADMIN_LEVEL` > 0;", PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] --;
					ShowDialog(playerid, dialogid);
				}
				else
				{
					if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] >= 4)
					{
						PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
						ShowDialog(playerid, DIALOG_ADMIN_MODIFY);
					}
				}
			}
			return 1;
		}
		case DIALOG_ADMIN_MODIFY:
		{
			if (response)
			{
				if (listitem > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
				{
				    ShowPlayerMessage(playerid, "~r~El rango que has seleccionado es superior al tuyo.", 3);
					return 1;
				}

				new DBResult:Result, DB_Query[256], name[24], connected, player_id, current_rank, bool:found;
				format(DB_Query, sizeof DB_Query, "SELECT `NAME`, `CONNECTED`, `PLAYERID`, `ADMIN_LEVEL` FROM `ACCOUNTS` WHERE `ID` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID]);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result))
				{
					db_get_field_assoc(Result, "NAME", name, 24);
					connected = db_get_field_assoc_int(Result, "CONNECTED");
					player_id = db_get_field_assoc_int(Result, "PLAYERID");
					current_rank = db_get_field_assoc_int(Result, "ADMIN_LEVEL");
					found = true;
				}
				else found = false;
				db_free_result(Result);

				if (!found) return 1;
				if (current_rank > ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
				{
					ShowPlayerMessage(playerid, "~r~No puedes modificar el rango de este admin porque es un rango superior al tuyo.", 3);
					return 1;
				}

				format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `ADMIN_LEVEL` = '%d' WHERE `ID` = '%d';", listitem, PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID]);
				db_free_result(db_query(Database, DB_Query));
				SendClientMessageEx(playerid, COLOR_WHITE, "El nuevo rango de %s es: '%s'.", name, ADMIN_LEVELS[listitem]);

				if (connected)
				{
					ACCOUNT_INFO[player_id][ac_ADMIN_LEVEL] = listitem;
					SendClientMessageEx(player_id, COLOR_WHITE, "%s cambió tu rango administrativo a: %s.", ACCOUNT_INFO[playerid][ac_NAME], ADMIN_LEVELS[listitem]);
					ShowPlayerMessage(player_id, "~g~Han cambiado tu rango administrativo.", 3);
				}
			}
			else ShowDialog(playerid, DIALOG_ADMIN_LIST);
			return 1;
		}
		case DIALOG_CHANGE_PASSWORD:
		{
			if (response)
			{
				if (!strlen(inputtext)) return ShowDialog(playerid, dialogid);

				new password[64 + 1];
				SHA256_PassHash(inputtext, ACCOUNT_INFO[playerid][ac_SALT], password, sizeof password);

				if (!strcmp(password, ACCOUNT_INFO[playerid][ac_PASS], false))
				{
					ShowDialog(playerid, DIALOG_CHANGE_PASSWORD_PASS);
					PLAYER_TEMP[playerid][py_BAD_LOGIN_ATTEMP] = 0;
				}
				else // Error
				{
					PLAYER_TEMP[playerid][py_BAD_LOGIN_ATTEMP] ++;
					if (PLAYER_TEMP[playerid][py_BAD_LOGIN_ATTEMP] > MAX_BAD_LOGIN_ATTEMPS) return KickEx(playerid, 100);
					ShowPlayerMessage(playerid, "~r~CONTRASEÑA INCORRECTA.", 3);
				}
			}
			return 1;
		}
		case DIALOG_CHANGE_PASSWORD_PASS:
		{
			if (response)
			{
				if (strlen(inputtext) < MIN_PASS_LENGTH || strlen(inputtext) > MAX_PASS_LENGTH) return ShowDialog(playerid, dialogid);

				new salt[16];
				getRandomSalt(salt);
				format(ACCOUNT_INFO[playerid][ac_SALT], 16, "%s", salt);
				SHA256_PassHash(inputtext, ACCOUNT_INFO[playerid][ac_SALT], ACCOUNT_INFO[playerid][ac_PASS], 64 + 1);

				new DB_Query[160];
				format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `SALT` = '%q' `PASS` = '%q' WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_SALT], ACCOUNT_INFO[playerid][ac_PASS], ACCOUNT_INFO[playerid][ac_ID]);
				db_free_result(db_query(Database, DB_Query));

				ShowPlayerNotification(playerid, "~r~Importante~w~~n~¡Nunca compartas o muestres la contraseña de tu cuenta! Los administradores de "SERVER_NAME" nunca solicitan esta información.", 4);
				ShowPlayerMessage(playerid, "~g~Tu contraseña ha sido cambiada correctamente.", 3);
			}
			return 1;
		}
		case DIALOG_ANTI_CHEAT:
		{
			if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < 4) return 1;

			if (response)
			{
				PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] = listitem;
				ShowDialog(playerid, DIALOG_ANTI_CHEAT_MODIFY);
			}
			return 1;
		}
		case DIALOG_ANTI_CHEAT_MODIFY:
		{
			if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < 4) return 1;

			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						if (ac_Info[ PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] ][ac_Enabled]) ac_Info[ PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] ][ac_Enabled] = false;
						else ac_Info[ PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] ][ac_Enabled] = true;
					}
					case 1: return ShowDialog(playerid, DIALOG_ANTI_CHEAT_MODIFY_DETECT);
					case 2:
					{
						if (ac_Info[ PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] ][ac_Kick]) ac_Info[ PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] ][ac_Kick] = false;
						else ac_Info[ PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] ][ac_Kick] = true;
					}
				}
				WriteAnticheatRules();
				ShowDialog(playerid, DIALOG_ANTI_CHEAT_MODIFY);
			}
			else ShowDialog(playerid, DIALOG_ANTI_CHEAT);
			return 1;
		}
		case DIALOG_ANTI_CHEAT_MODIFY_DETECT:
		{
			if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < 4) return 1;

			if (response)
			{
				new detections, seconds;
				if (sscanf(inputtext, "p<:>dd", detections, seconds))
				{
				    ShowPlayerMessage(playerid, "~r~Sintaxis no válida.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (detections < 1 || detections > 99999)
				{
				    ShowPlayerMessage(playerid, "~r~El número de detecciones debe ser 1 o mayor.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (seconds < 0 || seconds > 99999)
				{
				    ShowPlayerMessage(playerid, "~r~Los segundos no pueden ser un valor negativo.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				ac_Info[ PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] ][ac_Detections] = detections;
				ac_Info[ PLAYER_TEMP[playerid][py_SELECTED_AC_LISTITEM] ][ac_Interval] = seconds;

				WriteAnticheatRules();
				ShowDialog(playerid, DIALOG_ANTI_CHEAT_MODIFY);
			}
			else ShowDialog(playerid, DIALOG_ANTI_CHEAT_MODIFY);
			return 1;
		}
		case DIALOG_SHOP_TOYS:
		{
			if (response)
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= Toys_Shop[listitem][shop_toy_price])
				{
					new slot = GetEmptyPlayerToySlot(playerid);
					printf("%d", slot);

					if (!ACCOUNT_INFO[playerid][ac_SU] && slot >= MAX_NU_TOYS)
					{
						PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
						ShowPlayerMessage(playerid, "~r~No tienes más espacio para accesorios, elimina alguno si quieres comprar otro~n~o adquiere VIP.", 5);
						return 1;
					}

					if (slot == -1)
					{
						PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
						ShowPlayerMessage(playerid, "~r~No tienes más espacio para accesorios, elimina alguno si quieres comprar otro.", 5);
						return 1;
					}

					PLAYER_TOYS[playerid][slot][player_toy_VALID] = true;
					format(PLAYER_TOYS[playerid][slot][player_toy_NAME], 24, "%s", Toys_Shop[ listitem ][shop_toy_model]);
					PLAYER_TOYS[playerid][slot][player_toy_ATTACHED] = false;
					PLAYER_TOYS[playerid][slot][player_toy_MODELID] = Toys_Shop[ listitem ][shop_toy_modelid];
					PLAYER_TOYS[playerid][slot][player_toy_BONE] = -1;
					PLAYER_TOYS[playerid][slot][player_toy_OFFSET_X] = 0.0;
					PLAYER_TOYS[playerid][slot][player_toy_OFFSET_Y] = 0.0;
					PLAYER_TOYS[playerid][slot][player_toy_OFFSET_Z] = 0.0;
					PLAYER_TOYS[playerid][slot][player_toy_ROT_X] = 0.0;
					PLAYER_TOYS[playerid][slot][player_toy_ROT_Y] = 0.0;
					PLAYER_TOYS[playerid][slot][player_toy_ROT_Z] = 0.0;
					PLAYER_TOYS[playerid][slot][player_toy_SCALE_X] = 1.0;
					PLAYER_TOYS[playerid][slot][player_toy_SCALE_Y] = 1.0;
					PLAYER_TOYS[playerid][slot][player_toy_SCALE_Z] = 1.0;
					PLAYER_TOYS[playerid][slot][player_toy_COLOR_1] = 0;
					PLAYER_TOYS[playerid][slot][player_toy_COLOR_2] = 0;
					RegisterNewPlayerToy(playerid, slot);

					GivePlayerCash(playerid, -Toys_Shop[ listitem ][shop_toy_price]);

					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Gracias por comprar aquí, vuelva pronto.", 3);
					SavePlayerToysData(playerid);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 3);
				}
			}
			return 1;
		}
		case DIALOG_SHOP_SKINS:
		{
			if (response)
			{
				new clothe_info[3];
				switch(ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE])
				{
					case INTERIOR_BINCO:
					{
						switch(CHARACTER_INFO[playerid][ch_SEX])
						{
							case SEX_MALE: clothe_info = Binco_Shop_Male_Skins[listitem];
							case SEX_FEMALE: clothe_info = Binco_Shop_Female_Skins[listitem];
						}
					}
					case INTERIOR_SUBURBAN:
					{
						switch(CHARACTER_INFO[playerid][ch_SEX])
						{
							case SEX_MALE: clothe_info = Suburban_Shop_Male_Skins[listitem];
							case SEX_FEMALE: clothe_info = Suburban_Shop_Female_Skins[listitem];
						}
					}
					case INTERIOR_PROLAPS:
					{
						switch(CHARACTER_INFO[playerid][ch_SEX])
						{
							case SEX_MALE: clothe_info = Prolaps_Shop_Male_Skins[listitem];
							case SEX_FEMALE: clothe_info = Prolaps_Shop_Female_Skins[listitem];
						}
					}
					case INTERIOR_DIDIER_SACHS:
					{
						switch(CHARACTER_INFO[playerid][ch_SEX])
						{
							case SEX_MALE: clothe_info = Didier_Shop_Male_Skins[listitem];
							case SEX_FEMALE: clothe_info = Didier_Shop_Female_Skins[listitem];
						}
					}
					case INTERIOR_VICTIM:
					{
						switch(CHARACTER_INFO[playerid][ch_SEX])
						{
							case SEX_MALE: clothe_info = Victim_Shop_Male_Skins[listitem];
							case SEX_FEMALE: clothe_info = Victim_Shop_Female_Skins[listitem];
						}
					}
					case INTERIOR_ZIP:
					{
						switch(CHARACTER_INFO[playerid][ch_SEX])
						{
							case SEX_MALE: clothe_info = Zip_Shop_Male_Skins[listitem];
							case SEX_FEMALE: clothe_info = Zip_Shop_Female_Skins[listitem];
						}
					}
				}

				if (CHARACTER_INFO[playerid][ch_CASH] >= clothe_info[2])
				{
					GivePlayerCash(playerid, -clothe_info[2]);
					CHARACTER_INFO[playerid][ch_SKIN] = clothe_info[0];

					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Gracias por comprar aquí, vuelva pronto.", 3);
					SetPlayerSkin(playerid, CHARACTER_INFO[playerid][ch_SKIN]);
					PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 3);
				}
			}
			return 1;
		}
		case DIALOG_CLOTH_STORE:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: ShowDialog(playerid, DIALOG_SHOP_SKINS);
					case 1: ShowDialog(playerid, DIALOG_SHOP_TOYS);
				}
			}
			return 1;
		}
		case DIALOG_CRANE_SELECT_VEHICLE:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;

				new veh_money = (VEHICLE_INFO[GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][gb_vehicle_MODELID] - 400][vehicle_info_PRICE] / 100) + 350;
				if (veh_money > CHARACTER_INFO[playerid][ch_CASH])
				{
					ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente", 4, 1150);
					return 1;
				}

				if (GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][gb_vehicle_OCCUPIED])
				{
				    ShowPlayerMessage(playerid, "~r~No se puede remolcar tu vehículo porque hay alguien conduciéndolo.", 3);
					return 1;
				}

				PLAYER_TEMP[playerid][py_CRANE_VEHICLE] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
				ShowDialog(playerid, DIALOG_CRANE_SELECT_PLACE);
			}
			return 1;
		}
		case DIALOG_CRANE_SELECT_PLACE:
		{
			if (response)
			{
				new veh_money = (VEHICLE_INFO[GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_MODELID] - 400][vehicle_info_PRICE] / 100) + 350;
				if (veh_money > CHARACTER_INFO[playerid][ch_CASH])
				{
					ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente", 4, 1150);
					return 1;
				}

				if (GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_OCCUPIED])
				{
				    ShowPlayerMessage(playerid, "~r~No se puede remolcar tu vehículo porque hay alguien conduciéndolo.", 3);
					return 1;
				}

				GivePlayerCash(playerid, -veh_money);

				switch(listitem)
				{
					case 0:
					{
						// Spawn type
						new vehicle_type = GetVehicleType( GetVehicleModel(PLAYER_TEMP[playerid][py_CRANE_VEHICLE]) );

						switch(vehicle_type)
						{
							// Helicópteros
							case 0:
							{
								new crane_point = random(sizeof(HELI_POINTS));
								GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_SPAWN_X] = HELI_POINTS[crane_point][0];
								GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_SPAWN_Y] = HELI_POINTS[crane_point][1];
								GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_SPAWN_Z] = HELI_POINTS[crane_point][2];
								GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_SPAWN_ANGLE] = HELI_POINTS[crane_point][3];
								
								ShowPlayerMessage(playerid, "El vehículo ha sido remolcado al ~y~LS Airport~w~.", 6);
							}

							// Aviones
							case 1:
							{
								new crane_point = random(sizeof(PLANE_POINTS));
								GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_SPAWN_X] = PLANE_POINTS[crane_point][0];
								GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_SPAWN_Y] = PLANE_POINTS[crane_point][1];
								GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_SPAWN_Z] = PLANE_POINTS[crane_point][2];
								GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_SPAWN_ANGLE] = PLANE_POINTS[crane_point][3];
								
								ShowPlayerMessage(playerid, "El vehículo ha sido remolcado al ~y~LS Airport~w~.", 6);
							}

							// Barcos
							case 2:
							{
								new crane_point = random(sizeof(BOAT_POINTS));
								GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_SPAWN_X] = BOAT_POINTS[crane_point][0];
								GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_SPAWN_Y] = BOAT_POINTS[crane_point][1];
								GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_SPAWN_Z] = BOAT_POINTS[crane_point][2];
								GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_SPAWN_ANGLE] = BOAT_POINTS[crane_point][3];
								
								ShowPlayerMessage(playerid, "El vehículo ha sido remolcado a la ~y~Playa de Santa Maria~w~.", 6);
							}

							// Autos, motos, etc
							default:
							{
								new crane_point = random(sizeof(CRANE_POINTS));
								GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_SPAWN_X] = CRANE_POINTS[crane_point][0];
								GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_SPAWN_Y] = CRANE_POINTS[crane_point][1];
								GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_SPAWN_Z] = CRANE_POINTS[crane_point][2];
								GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_SPAWN_ANGLE] = CRANE_POINTS[crane_point][3];
								
								ShowPlayerNotification(playerid, "El vehículo ha sido remolcado al ~y~Depósito municipal~w~.", 4);
							}
						}

						// Reset
						GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_LAST_CLOSED_TIME] = gettime();
						GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_PARAMS_ENGINE] = 0;
						GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_PARAMS_LIGHTS] = 0;
						GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_PARAMS_DOORS] = 1;

						UpdateVehicleParams(PLAYER_TEMP[playerid][py_CRANE_VEHICLE]);
						SetVehicleToRespawnEx(PLAYER_TEMP[playerid][py_CRANE_VEHICLE]);
						RepairVehicleEx(PLAYER_TEMP[playerid][py_CRANE_VEHICLE]);
					}
					case 1:
					{
						GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_LAST_CLOSED_TIME] = gettime();
						GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_PARAMS_ENGINE] = 0;
						GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_PARAMS_LIGHTS] = 0;
						GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_CRANE_VEHICLE] ][gb_vehicle_PARAMS_DOORS] = 1;
						UpdateVehicleParams(PLAYER_TEMP[playerid][py_CRANE_VEHICLE]);
						SetVehicleToRespawnEx(PLAYER_TEMP[playerid][py_CRANE_VEHICLE]);
						RepairVehicleEx(PLAYER_TEMP[playerid][py_CRANE_VEHICLE]);

						ShowPlayerNotification(playerid, "El vehículo ha sido remolcado hasta el último estacionamiento.", 4);
					}
				}
			}
			return 1;
		}
		case DIALOG_USER_NOTIFICATIONS:
		{
			if (response)
			{
				return 1;
			}
			return 1;
		}
		case DIALOG_SEND_MONEY:
		{
			if (response)
			{
				if (sscanf(inputtext, "d", inputtext[0]))
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor numérico.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (inputtext[0] <= 0)
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor positivo.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (inputtext[0] > CHARACTER_INFO[playerid][ch_CASH])
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				GivePlayerCash(playerid, -inputtext[0]);
				GivePlayerCash(PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER], inputtext[0]);

				ShowPlayerMessage(playerid, "~g~Dinero enviado.", 3);
				SetPlayerChatBubble(playerid, "\n\n\n\n* saca dinero de su billetera y se lo da a alguien\n\n\n", 0xffcb90FF, 20.0, 5000);

				ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false);

				new str_text[144];
				format(str_text, sizeof(str_text), "%s (%d) le ha enviado %d$ a %s (%d).",
					PLAYER_TEMP[playerid][py_NAME],
					playerid,
					inputtext[0],
					PLAYER_TEMP[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][py_NAME],
					PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]
				);
				Log("money", str_text);
			}
			else ShowDialog(playerid, DIALOG_RANGE_USER);
			return 1;
		}
		case DIALOG_SEND_REPORT:
		{
			if (response)
			{
				if ((gettime() - PLAYER_TEMP[playerid][py_ANTIFLOOD_REPORT]) < 60) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 60 segundos para volver a reportar.", 3);
				PLAYER_TEMP[playerid][py_ANTIFLOOD_REPORT] = gettime();

				new reason[128];
				if (sscanf(inputtext, "s[128]", reason)) return ShowPlayerMessage(playerid, "~r~Formato incorrecto.", 3);
			    if (!IsPlayerConnected(PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER])) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);

				ShowPlayerMessage(playerid, "~g~Tu reporte fue enviado a los administradores en línea.", 3);

				new str[144]; format(str, 144, "[REPORTE]"COL_WHITE" %s (%d) > %s (%d): %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][ac_NAME], PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER], reason);
				SendMessageToAdmins(COLOR_ORANGE, str);
			}
			else ShowDialog(playerid, DIALOG_RANGE_USER);
			return 1;
		}
		case DIALOG_RANGE_USER:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;

				switch(PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem])
				{
					case 0:
					{
						ShowDialog(playerid, DIALOG_SEND_REPORT);
						return 1;
					}
					case 1:
					{
						if (ACCOUNT_INFO[playerid][ac_LEVEL] < 2) return ShowPlayerMessage(playerid, "~r~Tienes que ser nivel 2.", 3);
						ShowDialog(playerid, DIALOG_SEND_MONEY);
						return 1;
					}
					case 3:
					{
						ShowPlayerMessage(PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER], "Estás siendo esposado", 3);
					    ShowPlayerMessage(playerid, "Estás esposando a esta persona", 3);

						PLAYER_TEMP[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][py_CUFFED] = false;
						PLAYER_TEMP[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][py_CUFFING] = true;
						KillTimer(PLAYER_TEMP[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][py_TIMERS][14]);
						TogglePlayerControllableEx(PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER], false);
						SetPlayerSpecialAction(PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER], SPECIAL_ACTION_HANDSUP);
						PLAYER_TEMP[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][py_TIMERS][14] = SetTimerEx("CuffPlayer", 6000, false, "i", PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]);
						SendPoliceMark(PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER], 0x2DAA24FF);
						return 1;
					}
					case 2:
					{
						TogglePlayerControllableEx(PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER], true);
						PLAYER_TEMP[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][py_CUFFED] = false;
						PLAYER_TEMP[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][py_CUFFING] = false;
						SetPlayerSpecialAction(PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER], SPECIAL_ACTION_NONE);

						SetPlayerChatBubble(playerid, "\n\n\n\n* Le quita las esposas a alguien.\n\n\n", 0xffcb90FF, 20.0, 5000);
						SendPoliceMark(PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER], PLAYER_COLOR);
						return 1;
					}
					case 4:
					{
						if (PLAYER_TEMP[playerid][py_CUFFED]) return ShowPlayerMessage(playerid, "~r~No puedes hacer eso estando esposado.", 3);
						if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK) return ShowPlayerMessage(playerid, "~r~No puedes hacer eso estando herido.", 3);
						if (CHARACTER_INFO[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][ch_STATE] != ROLEPLAY_STATE_CRACK) return ShowPlayerMessage(playerid, "~r~El jugador tiene que estar herido.", 3);

						KillTimer(PLAYER_TEMP[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][py_TIMERS][16]);
						PLAYER_TEMP[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][py_TIMERS][16] = SetTimerEx("StandUpBotikin", 7000, false, "ii", playerid, PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]);

						ApplyAnimation(playerid, "MEDIC", "CPR", 4.1, false, 0, 0, 0, 0, 1);
						SetPlayerChatBubble(playerid, "\n\n\n\n* Usa un botiquín.", 0xffcb90FF, 20.0, 2000);
						return 1;
					}
					case 5:
					{
						if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MEMBERS] >= 20) return ShowPlayerMessage(playerid, "~r~La banda ya está llena.", 3);
						if (PLAYER_WORKS[PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No se pueden invitar a policías.", 3);
						if (PLAYER_CREW[PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~Este jugador ya tiene banda.", 3);
						if (PLAYER_TEMP[PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes invitar cuando la banda esta en combate.", 3);

						if (gettime() < PLAYER_TEMP[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][py_LAST_GOT_CREW] + 600)
						{
							new time = 600 - (gettime() - PLAYER_TEMP[PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]][py_LAST_GOT_CREW]), str_text[128];
							format(str_text, sizeof(str_text), "La otra persona debe esperar ~r~%s minutos~w~ para volver a ser invitada.", TimeConvert(time));
							return 1;
						}

						PLAYER_TEMP[playerid][py_CREW_INVITE_PID] = PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER];
						PLAYER_TEMP[playerid][py_CREW_INVITE_AID] = ACCOUNT_INFO[PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]][ac_ID];
						ShowPlayerMessage(playerid, "Seleccione el rango." ,3);
						ShowDialog(playerid, DIALOG_CREW_INVITE_RANK);
						return 1;
					}
					case 6:
					{
						InviteToSAPD(playerid, PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]);
						return 1;
					}
					case 7:
					{
						InviteToLCN(playerid, PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]);
						return 1;
					}
					case 8:
					{
						InviteToTCC(playerid, PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]);
						return 1;
					}
					case 9:
					{
						InviteToFO(playerid, PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]);
						return 1;
					}
					case 10:
					{
						InviteToFC(playerid, PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]);
						return 1;
					}
					case 11:
					{
						InviteToDS(playerid, PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]);
						return 1;
					}
					case 12:
					{
						InviteToSindacco(playerid, PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]);
						return 1;
					}
				}
			}
			return 1;
		}
		case DIALOG_CREATE_CREW:
		{
			if (response)
			{
				if (ACCOUNT_INFO[playerid][ac_LEVEL] < 2) return ShowPlayerMessage(playerid, "~r~Debes ser nivel 2 para crear una banda.", 3);
				ShowDialog(playerid, DIALOG_CREATE_CREW_NAME);
			}
			return 1;
		}
		case DIALOG_CREATE_CREW_NAME:
		{
			if (response)
			{
				if (strlen(inputtext) >= 24)
				{
				    ShowPlayerMessage(playerid, "~r~Como máximo puedes introducir un nombre de 24 caracteres.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				new crew_name[24];
				if (sscanf(inputtext, "s[24]", crew_name))
				{
				    ShowPlayerMessage(playerid, "Introduce un nombre para tu banda.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				format(PLAYER_TEMP[playerid][py_CREATE_CREW_NAME], 24, "%s", crew_name);
				ShowDialog(playerid, DIALOG_CREATE_CREW_COLOR);
			}
			return 1;
		}
		case DIALOG_CREATE_CREW_COLOR:
		{
			if (response)
			{
				PLAYER_TEMP[playerid][py_CREATE_CREW_COLOR] = listitem;
				ShowDialog(playerid, DIALOG_CREATE_CREW_CONFIRM);
			}
			else ShowDialog(playerid, DIALOG_CREATE_CREW_NAME);
			return 1;
		}
		case DIALOG_CREATE_CREW_CONFIRM:
		{
			if (response)
			{
				new index = GetAvaibleCrewIndex();
				if (index == -1)
				{
					SendClientMessageEx(playerid, COLOR_WHITE, "No se puede crear la banda porque no hay espacio disponible, el límite de CREWS es %d.", MAX_CREWS);
					ShowPlayerMessage(playerid, "~r~No se puede crear la crew porque no hay espacio disponible.", 3);
					return 1;
				}

				if (5000 > CHARACTER_INFO[playerid][ch_CASH])
				{
				    ShowPlayerMessage(playerid, "~r~Necesitas 100.000$ para crear la banda.", 3);
					return 1;
				}

				GivePlayerCash(playerid, -5000);
				CREW_INFO[index][crew_VALID] = true;
				format(CREW_INFO[index][crew_NAME], 32, "%s", PLAYER_TEMP[playerid][py_CREATE_CREW_NAME]);
				format(CREW_INFO[index][crew_DESCRIPTION], 32, "Banda de Hyaxe");
				CREW_INFO[index][crew_COLOR] = CrewColors[ PLAYER_TEMP[playerid][py_CREATE_CREW_COLOR] ];

				CREW_RANK_INFO[index][0][crew_rank_VALID] = true;
				format(CREW_RANK_INFO[index][0][crew_rank_NAME], 32, "Fundador");

				CREW_RANK_INFO[index][0][crew_rank_PERMISSION][CREW_RANK_CHANGE_NAME] =
				CREW_RANK_INFO[index][0][crew_rank_PERMISSION][CREW_RANK_INVITE] =
				CREW_RANK_INFO[index][0][crew_rank_PERMISSION][CREW_RANK_CAST_MEMBERS] =
				CREW_RANK_INFO[index][0][crew_rank_PERMISSION][CREW_RANK_MODIFY_MEMBERS] =
				CREW_RANK_INFO[index][0][crew_rank_PERMISSION][CREW_RANK_MODIFY_RANKS] =
				CREW_RANK_INFO[index][0][crew_rank_PERMISSION][CREW_RANK_ADD_PROPERTIES] =
				CREW_RANK_INFO[index][0][crew_rank_PERMISSION][CREW_RANK_DELETE_PROPERTIES] =
				CREW_RANK_INFO[index][0][crew_rank_PERMISSION][CREW_RANK_CHANGE_COLOR] =
				CREW_RANK_INFO[index][0][crew_rank_PERMISSION][CREW_RANK_LEAVE_TERRITORY] =
				CREW_RANK_INFO[index][0][crew_rank_PERMISSION][CREW_RANK_DELETE] = 1;

				NewCrewRegister(index);

				PLAYER_CREW[playerid][player_crew_VALID] = true;
				PLAYER_CREW[playerid][player_crew_ID] = CREW_INFO[index][crew_ID];
				PLAYER_CREW[playerid][player_crew_RANK] = 0;
				PLAYER_CREW[playerid][player_crew_INDEX] = index;
				SetPlayerGangZones(playerid);

				new DB_Query[200];
				format(DB_Query, sizeof DB_Query,

						"\
							DELETE FROM `PLAYER_CREW` WHERE `ID_USER` = '%d';\
							INSERT INTO `PLAYER_CREW` (`ID_USER`, `ID_CREW`, `RANK`) VALUES ('%d', '%d', '%d');\
						",
							ACCOUNT_INFO[playerid][ac_ID],
							ACCOUNT_INFO[playerid][ac_ID],
							PLAYER_CREW[playerid][player_crew_ID],
							PLAYER_CREW[playerid][player_crew_RANK]
				);
				db_free_result(db_query(Database, DB_Query));

				ShowPlayerNotification(playerid, "Banda creada", 3);
			}
			return 1;
		}
		case DIALOG_CREW_MENU_ONE:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: ShowDialog(playerid, DIALOG_CREW_MENU);
					case 1:
					{
						new 
							dialog[232],
							caption[64],
							time = (gettime() - GraffitiGetTime);

						format(caption, sizeof caption, "{%06x}%s", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] >>> 8, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
					    format(dialog, sizeof dialog, ""COL_WHITE"Los graffitis son cada 45 minutos, han pasado %s minutos desde el último.\nLa banda actualmente tiene %d graffitis.", TimeConvert(time), CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITIS_COUNT]);
					    ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, caption, dialog, "Cerrar", "");
					}
					case 2:
					{
						new 
							dialog[232],
							caption[64];

						format(caption, sizeof caption, "{%06x}%s", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] >>> 8, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
					    format(dialog, sizeof dialog, ""COL_WHITE"Las disputas de mercados son cada 7 dias, ha pasado %s desde el último.\nLa banda actualmente tiene %d mercados dominados.", ReturnTimelapse(MarketGetTime, gettime()), CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_COUNT]);
					    ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, caption, dialog, "Cerrar", "");
					}
				}
			}
			return 1;
		}
		case DIALOG_CREW_MENU:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 3);

			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;

				switch(PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem])
				{
					case CREW_RANK_SIZE: //Lista de miembros
					{
						HidePlayerDialog(playerid);
					}
					case CREW_RANK_CHANGE_NAME:
					{
						if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_CHANGE_NAME]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);
						if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_FIGHTING]) return ShowPlayerMessage(playerid, "~r~No se puede cambiar el nombre de la banda cuando la crew está en combate.", 3);
						ShowDialog(playerid, DIALOG_CREW_CHANGE_NAME);
					}
					case CREW_RANK_CAST_MEMBERS:
					{
						if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_CAST_MEMBERS]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

						PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
						PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
						ShowDialog(playerid, DIALOG_CREW_MEMBER_LIST_DELETE);
					}

					case CREW_RANK_MODIFY_RANKS:
					{
						if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_MODIFY_RANKS]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

						ShowDialog(playerid, DIALOG_CREW_RANKS);
					}
					case CREW_RANK_CHANGE_COLOR:
					{
						if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_CHANGE_COLOR]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

						if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_FIGHTING]) return ShowPlayerMessage(playerid, "~r~No se puede cambiar el color de la banda cuando la banda está en combate.", 3);
						ShowDialog(playerid, DIALOG_CREW_MODIFY_COLOR);
					}
					case CREW_RANK_DELETE:
					{
						if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_DELETE]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

						ShowDialog(playerid, DIALOG_CREW_DELETE);
					}
					case CREW_RANK_MODIFY_MEMBERS:
					{
						if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_MODIFY_MEMBERS]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

						PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
						PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
						ShowDialog(playerid, DIALOG_CREW_MODIFY_MEMBERS);
					}
					case CREW_RANK_SIZE + 1: //Abandonar banda
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
								ShowPlayerMessage(playerid, "~r~No puedes abandonar la banda porque eres el único miembro con el rango principal.", 3);
								return 1;
							}
						}
						ShowDialog(playerid, DIALOG_CREW_LEAVE);
					}
				}
			}
			return 1;
		}
		case DIALOG_CREW_MEMBER_LIST:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);

			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return ShowDialog(playerid, dialogid);
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -2) // Siguiente
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_CREW` WHERE `ID_CREW` = '%d';", PLAYER_CREW[playerid][player_crew_ID]);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] >= GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] ++;
					ShowDialog(playerid, dialogid);
				}
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -3) //Anterior
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_CREW` WHERE `ID_CREW` = '%d';", PLAYER_CREW[playerid][player_crew_ID]);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] <= 0) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] --;
					ShowDialog(playerid, dialogid);
				}
			}
			else ShowDialog(playerid, DIALOG_CREW_MENU);
			return 1;
		}
		case DIALOG_CREW_CHANGE_NAME:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_CHANGE_NAME]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_FIGHTING]) return ShowPlayerMessage(playerid, "~r~No se puede cambiar el nombre de la banda cuando la crew está en combate.", 3);
				if (strlen(inputtext) >= 32)
				{
					ShowPlayerMessage(playerid, "~r~Como máximo puedes introducir un nombre de 32 caracteres.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				new crew_name[32];
				if (sscanf(inputtext, "s[32]", crew_name))
				{
					ShowPlayerMessage(playerid, "Introduce un nombre para la banda.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				strreplace(crew_name, "~", "");

				ShowDialog(playerid, DIALOG_CREW_CHANGE_DESC);

				format(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], 32, "%s", crew_name);

				new DB_Query[164];
				format(DB_Query, sizeof DB_Query, "UPDATE `CREW` SET `NAME` = '%q' WHERE `ID` = '%d';", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID]);
				db_free_result(db_query(Database, DB_Query));

				new 
					message[144],
					label_str[264],
					city[45],
					zone[45],
					saved_noti[364];

				format(saved_noti, sizeof saved_noti, "%s cambió el nombre de la banda a %s.", PLAYER_TEMP[playerid][py_RP_NAME], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
				SaveNotificationToCrewMemeber(PLAYER_CREW[playerid][player_crew_ID], saved_noti);

				format(message, sizeof message, "{%06x}[BANDA] "COL_WHITE"%s (%s) cambió el nombre de la banda a %s.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] >>> 8, PLAYER_TEMP[playerid][py_RP_NAME], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_NAME], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
				SendMessageToCrewMembers(PLAYER_CREW[playerid][player_crew_ID], COLOR_WHITE, message);

				ShowCrew(playerid);

				for(new i = 0; i != MAX_PROPERTIES; i ++)
				{
					if (!PROPERTY_INFO[i][property_VALID]) continue;
					if (!PROPERTY_INFO[i][property_CREW]) continue;
					if (PROPERTY_INFO[i][property_CREW_ID] != PLAYER_CREW[playerid][player_crew_ID]) continue;

					GetPointZone(PROPERTY_INFO[i][property_EXT_X], PROPERTY_INFO[i][property_EXT_Y], city, zone);
					format
					(
						label_str,
						sizeof label_str,
						""COL_WHITE"\
							Propiedad en %s (%d)\n\
							Banda: %s\n\
						", zone, PROPERTY_INFO[i][property_ID], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]
					);

					UpdateDynamic3DTextLabelText(PROPERTY_INFO[i][property_EXT_LABEL_ID], 0xF0F0F000, label_str);
				}
			}
			else ShowDialog(playerid, DIALOG_CREW_MENU);
			return 1;
		}
		case DIALOG_CREW_CHANGE_DESC:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_CHANGE_NAME]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_FIGHTING]) return ShowPlayerMessage(playerid, "~r~No se puede cambiar el nombre de la banda cuando están en combate.", 3);
				if (strlen(inputtext) >= 32)
				{
					ShowPlayerMessage(playerid, "~r~Como máximo puedes introducir un algo de 32 caracteres.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				new crew_description[32];
				if (sscanf(inputtext, "s[32]", crew_description))
				{
					ShowPlayerMessage(playerid, "Introduce una descripción para la banda.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				format(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_DESCRIPTION], 32, "%s", crew_description);

				new DB_Query[128];
				format(DB_Query, sizeof DB_Query, "UPDATE `CREW` SET `DESC` = '%q' WHERE `ID` = '%d';", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_DESCRIPTION], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID]);
				db_free_result(db_query(Database, DB_Query));

				new 
					message[144],
					saved_noti[264];

				format(saved_noti, sizeof saved_noti, "%s cambió la descripción de la banda.", PLAYER_TEMP[playerid][py_RP_NAME]);
				SaveNotificationToCrewMemeber(PLAYER_CREW[playerid][player_crew_ID], saved_noti);

				format(message, sizeof message, "{%06x}[BANDA] "COL_WHITE"%s (%s) cambió la descripción de la banda.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] >>> 8, PLAYER_TEMP[playerid][py_RP_NAME], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_NAME]);
				SendMessageToCrewMembers(PLAYER_CREW[playerid][player_crew_ID], COLOR_WHITE, message);

				ShowCrew(playerid);

				ShowDialog(playerid, DIALOG_CREW_MENU);
			}
			else ShowDialog(playerid, DIALOG_CREW_MENU);
			return 1;
		}
		case DIALOG_CREW_MEMBER_LIST_DELETE:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_CAST_MEMBERS]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -2) // Siguiente
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_CREW` WHERE `ID_CREW` = '%d';", PLAYER_CREW[playerid][player_crew_ID]);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] >= GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] ++;
					ShowDialog(playerid, dialogid);
				}
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -3) //Anterior
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_CREW` WHERE `ID_CREW` = '%d';", PLAYER_CREW[playerid][player_crew_ID]);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] <= 0) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] --;
					ShowDialog(playerid, dialogid);
				}
				else
				{
					PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];

					new DBResult:Result, DB_Query[256], name[24], current_rank, bool:found;
					format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `PLAYER_CREW`.`RANK` FROM `ACCOUNTS`, `PLAYER_CREW` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_CREW`.`ID_USER` = `ACCOUNTS`.`ID`;", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID]);
					Result = db_query(Database, DB_Query);

					if (db_num_rows(Result))
					{
						db_get_field_assoc(Result, "NAME", name, 24);
						current_rank = db_get_field_assoc_int(Result, "RANK");
						found = true;
					}
					else found = false;
					db_free_result(Result);

					if (!found) return 1;
					if (current_rank < PLAYER_CREW[playerid][player_crew_RANK]) return ShowPlayerMessage(playerid, "~r~No puedes echar a este miembro porque es un rango superior al tuyo.", 3);
					if (current_rank == 0)
					{
						new DBResult:Result_count, total;
						format(DB_Query, sizeof DB_Query, "SELECT COUNT() FROM `PLAYER_CREW` WHERE `ID_CREW` = '%d' AND `RANK` = '0';", PLAYER_CREW[playerid][player_crew_ID]);
						Result_count = db_query(Database, DB_Query);

						if (db_num_rows(Result_count)) total = db_get_field_int(Result_count, 0);
						db_free_result(Result_count);

						if (total <= 1)
						{
							ShowPlayerMessage(playerid, "~r~No se puede echar a este miembro ya que es el único miembro con el rango principal.", 3);
							return 1;
						}
					}

					ShowDialog(playerid, DIALOG_CREW_CAST_MEMBER_CONFIRM);
				}
			}
			else ShowDialog(playerid, DIALOG_CREW_MENU);
			return 1;
		}
		case DIALOG_CREW_CAST_MEMBER_CONFIRM:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_CAST_MEMBERS]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				new DBResult:Result, DB_Query[320], name[24], current_rank, connected, player_id, bool:found;
				format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `ACCOUNTS`.`CONNECTED`, `ACCOUNTS`.`PLAYERID`, `PLAYER_CREW`.`RANK` FROM `ACCOUNTS`, `PLAYER_CREW` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_CREW`.`ID_USER` = `ACCOUNTS`.`ID`;", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID]);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result))
				{
					db_get_field_assoc(Result, "NAME", name, 24);
					connected = db_get_field_assoc_int(Result, "CONNECTED");
					player_id = db_get_field_assoc_int(Result, "PLAYERID");
					current_rank = db_get_field_assoc_int(Result, "RANK");
					found = true;
				}
				else found = false;
				db_free_result(Result);

				if (!found) return 1;
				if (current_rank < PLAYER_CREW[playerid][player_crew_RANK]) return ShowPlayerMessage(playerid, "~r~No puedes echar a este miembro porque es un rango superior al tuyo.", 3);
				if (current_rank == 0)
				{
					new DBResult:Result_count, total;
					format(DB_Query, sizeof DB_Query, "SELECT COUNT() FROM `PLAYER_CREW` WHERE `ID_CREW` = '%d' AND `RANK` = '0';", PLAYER_CREW[playerid][player_crew_ID]);
					Result_count = db_query(Database, DB_Query);

					if (db_num_rows(Result_count)) total = db_get_field_int(Result_count, 0);
					db_free_result(Result_count);

					if (total <= 1)
					{
						ShowPlayerMessage(playerid, "~r~No se puede echar a este miembro ya que es el único miembro con el rango principal.", 3);
						return 1;
					}
				}

				new message[144];
				format(message, sizeof message, "{%06x}[BANDA] "COL_WHITE"%s (%s) ha echado a %s de la banda.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] >>> 8, PLAYER_TEMP[playerid][py_RP_NAME], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_NAME], name);
				SendMessageToCrewMembers(PLAYER_CREW[playerid][player_crew_ID], COLOR_WHITE, message);

				ShowCrew(playerid);

				format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_CREW` WHERE `ID_USER` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID]);
				db_free_result(db_query(Database, DB_Query));

				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MEMBERS] --;
				if (connected)
				{
					CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ONLINE_MEMBERS] --;
					SetPlayerNormalColor(player_id);
					if (PLAYER_TEMP[playerid][py_LAST_TERRITORY] != INVALID_STREAMER_ID)
					{
						TextDrawHideForPlayer(player_id, Textdraws[textdraw_TERRITORY_BOX]);
						TextDrawHideForPlayer(player_id, TERRITORIES[ PLAYER_TEMP[playerid][py_LAST_TERRITORY] ][territory_TEXTDRAW]);
					}
					PLAYER_CREW[player_id][player_crew_VALID] = false;
					PLAYER_CREW[player_id][player_crew_ID] = 0;
					PLAYER_CREW[player_id][player_crew_RANK] = 0;
					PLAYER_CREW[player_id][player_crew_INDEX] = 0;
					HidePlayerGangZones(player_id);
				}
			}
			else ShowDialog(playerid, DIALOG_CREW_MEMBER_LIST_DELETE);
			return 1;
		}
		case DIALOG_CREW_INVITE_RANK:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_INVITE]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] < PLAYER_CREW[playerid][player_crew_RANK])
				{
				    ShowPlayerMessage(playerid, "~r~No puedes invitar con este rango.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				if (!IsPlayerConnected(PLAYER_TEMP[playerid][py_CREW_INVITE_PID])) return ShowPlayerMessage(playerid, "~r~El jugador no está conectado.", 2);

				new Float:x, Float:y, Float:z; GetPlayerPos(PLAYER_TEMP[playerid][py_CREW_INVITE_PID], x, y, z);
				if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no está cerca tuya.", 2);
				if (PLAYER_WORKS[ PLAYER_TEMP[playerid][py_CREW_INVITE_PID] ][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~Esta persona es policía y no puede tener banda.", 3);
				if (PLAYER_CREW[ PLAYER_TEMP[playerid][py_CREW_INVITE_PID] ][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~Esta persona pertenece a otra banda.", 3);
				if (PLAYER_TEMP[ PLAYER_TEMP[playerid][py_CREW_INVITE_PID] ][py_GAME_STATE] != GAME_STATE_NORMAL) ShowPlayerMessage(playerid, "~r~No puedes invitar a este jugador ahora, prueba despues.", 3);
				if (ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_CREW_INVITE_PID] ][ac_ID] != PLAYER_TEMP[playerid][py_CREW_INVITE_AID]) return ShowPlayerMessage(playerid, "~r~El jugador no está conectado.", 2);

				ShowPlayerMessage(playerid, "~g~Invitación enviada.", 3);

				PLAYER_TEMP[ PLAYER_TEMP[playerid][py_CREW_INVITE_PID] ][py_CREW_INVITE_INFO][0] = PLAYER_CREW[playerid][player_crew_ID];
				PLAYER_TEMP[ PLAYER_TEMP[playerid][py_CREW_INVITE_PID] ][py_CREW_INVITE_INFO][1] = PLAYER_CREW[playerid][player_crew_INDEX];
				PLAYER_TEMP[ PLAYER_TEMP[playerid][py_CREW_INVITE_PID] ][py_CREW_INVITE_INFO][2] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
				PLAYER_TEMP[ PLAYER_TEMP[playerid][py_CREW_INVITE_PID] ][py_CREW_INVITE_INFO][3] = gettime();
				ShowDialog(PLAYER_TEMP[playerid][py_CREW_INVITE_PID], DIALOG_CREW_INVITE_ACCEPT);
			}
			return 1;
		}
		case DIALOG_CREW_INVITE_ACCEPT:
		{
			if (response)
			{
				if (!CREW_INFO[ PLAYER_TEMP[playerid][py_CREW_INVITE_INFO][1] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~Esta banda ya no existe.", 2);
				if (!CREW_RANK_INFO[ PLAYER_TEMP[playerid][py_CREW_INVITE_INFO][1] ][ PLAYER_TEMP[playerid][py_CREW_INVITE_INFO][2] ][crew_rank_VALID]) return ShowPlayerMessage(playerid, "~r~El rango que te ofrecieron ya no existe.", 2);
				if (gettime() > PLAYER_TEMP[playerid][py_CREW_INVITE_INFO][3] + 20) return ShowPlayerMessage(playerid, "~r~Tardaste mucho en responder.", 2);
				if (CREW_INFO[ PLAYER_TEMP[playerid][py_CREW_INVITE_INFO][1] ][crew_FIGHTING]) return ShowPlayerMessage(playerid, "~r~No puedes unirte a la banda cuando la banda está en combate.", 2);

				PLAYER_CREW[playerid][player_crew_VALID] = true;
				PLAYER_CREW[playerid][player_crew_ID] = PLAYER_TEMP[playerid][py_CREW_INVITE_INFO][0];
				PLAYER_CREW[playerid][player_crew_RANK] = PLAYER_TEMP[playerid][py_CREW_INVITE_INFO][2];
				PLAYER_CREW[playerid][player_crew_INDEX] = PLAYER_TEMP[playerid][py_CREW_INVITE_INFO][1];
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MEMBERS] ++;
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ONLINE_MEMBERS] ++;
				PLAYER_TEMP[playerid][py_LAST_GOT_CREW] = gettime();
				SetPlayerGangZones(playerid);

				new DB_Query[200];
				format(DB_Query, sizeof DB_Query,

						"\
							DELETE FROM `PLAYER_CREW` WHERE `ID_USER` = '%d';\
							INSERT INTO `PLAYER_CREW` (`ID_USER`, `ID_CREW`, `RANK`) VALUES ('%d', '%d', '%d');\
						",
							ACCOUNT_INFO[playerid][ac_ID],
							ACCOUNT_INFO[playerid][ac_ID],
							PLAYER_CREW[playerid][player_crew_ID],
							PLAYER_CREW[playerid][player_crew_RANK]
				);
				db_free_result(db_query(Database, DB_Query));

				new message[144];
				format(message, sizeof message, "{%06x}[BANDA] "COL_WHITE"%s se ha unido a la banda con el rango %s.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] >>> 8, PLAYER_TEMP[playerid][py_RP_NAME], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_NAME]);
				SendMessageToCrewMembers(PLAYER_CREW[playerid][player_crew_ID], COLOR_WHITE, message);
			}
			return 1;
		}
		case DIALOG_CREW_RANKS:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La crew ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_MODIFY_RANKS]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				if (listitem < PLAYER_CREW[playerid][player_crew_RANK])
				{
					if (CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][listitem][crew_rank_VALID]) ShowPlayerMessage(playerid, "~r~No puedes modificar este rango porque es un rango superior al tuyo.", 3);
					else ShowPlayerMessage(playerid, "~r~No puedes crear un rango en este puesto porque es superior al tuyo.", 3);
					return 1;
				}

				PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] = listitem;
				if (CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][listitem][crew_rank_VALID]) ShowDialog(playerid, DIALOG_CREW_RANK_MODIFY);
				else ShowDialog(playerid, DIALOG_CREW_RANK_CREATE);
			}
			else ShowDialog(playerid, DIALOG_CREW_MENU);
			return 1;
		}
		case DIALOG_CREW_RANK_MODIFY:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_MODIFY_RANKS]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				switch(listitem)
				{
					case 0: ShowDialog(playerid, DIALOG_CREW_RANK_MODIFY_NAME);
					case 1:
					{
						if (PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] == 0)
						{
							ShowPlayerMessage(playerid, "~r~No se pueden modificar los permisos de este rango porque es el rango principal.", 3);
							return 1;
						}

						ShowDialog(playerid, DIALOG_CREW_RANK_MODIFY_PERMISS);
					}
					case 2:
					{
						if (PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] == 0)
						{
							ShowPlayerMessage(playerid, "~r~No se puede eliminar este rango porque es el rango principal.", 3);
							return 1;
						}

						ShowPlayerNotification(playerid, "Selecciona un nuevo rango para los miembros actuales.", 3);
						ShowDialog(playerid, DIALOG_CREW_RANK_DELETE);
					}
				}
			}
			else ShowDialog(playerid, DIALOG_CREW_RANKS);
			return 1;
		}
		case DIALOG_CREW_RANK_MODIFY_NAME:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_MODIFY_RANKS]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				if (strlen(inputtext) >= 32)
				{
				    ShowPlayerMessage(playerid, "~r~Como máximo puedes introducir un nombre de 32 caracteres.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				new rank_name[32];
				if (sscanf(inputtext, "s[32]", rank_name))
				{
				    ShowPlayerMessage(playerid, "Introduce el nuevo nombre para el rango.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				ShowCrew(playerid);
				format(CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_NAME], 32, "%s", rank_name);

				new DB_Query[144];
				format(DB_Query, sizeof DB_Query, "UPDATE `CREW_RANKS` SET `RANK_NAME` = '%q' WHERE `ID` = '%d';", CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_NAME], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_ID]);
				db_free_result(db_query(Database, DB_Query));
			}
			else ShowDialog(playerid, DIALOG_CREW_RANK_MODIFY);
			return 1;
		}
		case DIALOG_CREW_RANK_CREATE:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_MODIFY_RANKS]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				if (strlen(inputtext) >= 32)
				{
					ShowPlayerMessage(playerid, "~r~Como máximo puedes introducir un nombre de 32 caracteres.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				new rank_name[32];
				if (sscanf(inputtext, "s[32]", rank_name))
				{
					ShowPlayerMessage(playerid, "Introduce el nombre para el rango.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				if (CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_VALID])
				{
					ShowPlayerMessage(playerid, "~r~Ya hay un rango en este slot.", 3);
					return 1;
				}


				CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_VALID] = true;
				format(CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_NAME], 32, "%s", rank_name);

				CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][CREW_RANK_CHANGE_NAME] =
				CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][CREW_RANK_INVITE] =
				CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][CREW_RANK_CAST_MEMBERS] =
				CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][CREW_RANK_MODIFY_MEMBERS] =
				CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][CREW_RANK_MODIFY_RANKS] =
				CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][CREW_RANK_ADD_PROPERTIES] =
				CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][CREW_RANK_DELETE_PROPERTIES] =
				CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][CREW_RANK_CHANGE_COLOR] =
				CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][CREW_RANK_LEAVE_TERRITORY] =
				CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][CREW_RANK_DELETE] = 0;
				RegisterNewCrewRank(PLAYER_CREW[playerid][player_crew_INDEX], PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK]);

				ShowCrew(playerid);
				ShowPlayerMessage(playerid, "~g~Rango creado.", 3);
				ShowDialog(playerid, DIALOG_CREW_RANKS);
			}
			else ShowDialog(playerid, DIALOG_CREW_RANKS);
			return 1;
		}
		case DIALOG_CREW_RANK_MODIFY_PERMISS:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_MODIFY_RANKS]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][listitem])
				{
					ShowPlayerMessage(playerid, "~r~No puedes cambiar este permiso porque tu no tienes este permiso.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				if (CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][listitem]) CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][listitem] = false;
				else CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][listitem] = true;

				new DB_Query[120];
				format(DB_Query, sizeof DB_Query, "UPDATE `RANK_PERMISSIONS` SET `SET` = '%d' WHERE `ID_RANK` = '%d' AND `PERMISSION` = '%d';", CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][listitem], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_ID], listitem);
				db_free_result(db_query(Database, DB_Query));

				ShowDialog(playerid, dialogid);
			}
			else ShowDialog(playerid, DIALOG_CREW_RANK_MODIFY);
			return 1;
		}
		case DIALOG_CREW_RANK_DELETE:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_MODIFY_RANKS]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] < PLAYER_CREW[playerid][player_crew_RANK])
				{
					ShowPlayerMessage(playerid, "~r~No puedes seleccionar este rango porque es superior al tuyo.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				PLAYER_TEMP[playerid][py_CREW_SELECTED_NEW_RANK] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
				ShowDialog(playerid, DIALOG_CREW_RANK_DELETE_CONFIRM);
			}
			return 1;
		}
		case DIALOG_CREW_RANK_DELETE_CONFIRM:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_MODIFY_RANKS]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				new DB_Query[256];
				format(DB_Query, sizeof DB_Query,
					"\
						DELETE FROM `CREW_RANKS` WHERE `ID` = '%d';\
						UPDATE `PLAYER_CREW` SET `RANK` = '%d' WHERE `ID_CREW` = '%d' AND `RANK` = '%d';\
					",
						CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_ID],

						PLAYER_TEMP[playerid][py_CREW_SELECTED_NEW_RANK],
						PLAYER_CREW[playerid][player_crew_ID],
						PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK]
				);
				db_free_result(db_query(Database, DB_Query));

				ShowCrew(playerid);

				new message[144];
				format(message, sizeof message, "{%06x}[BANDA] "COL_WHITE"%s (%s) cambió tu rango al rango '%s'.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] >>> 8, PLAYER_TEMP[playerid][py_RP_NAME], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_NAME], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_NEW_RANK] ][crew_rank_NAME]);
				
				for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
				{
					if (IsPlayerConnected(i))
					{
						if (PLAYER_CREW[i][player_crew_VALID])
						{
							if (PLAYER_CREW[i][player_crew_ID] == PLAYER_CREW[playerid][player_crew_ID])
							{
								if (PLAYER_CREW[i][player_crew_RANK] == PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK])
								{
									PLAYER_CREW[i][player_crew_RANK] = PLAYER_TEMP[playerid][py_CREW_SELECTED_NEW_RANK];
									SendClientMessage(i, COLOR_WHITE, message);
								}
							}
						}
					}
				}

				CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_VALID] = false;
				CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_ID] = 0;
				CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_NAME][0] = EOS;
				for(new i = 0; i != CREW_RANK_SIZE; i ++) CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_CREW_SELECTED_RANK] ][crew_rank_PERMISSION][i] = 0;

			}
			else ShowDialog(playerid, DIALOG_CREW_RANKS);
			return 1;
		}
		case DIALOG_CREW_MODIFY_COLOR:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_CHANGE_COLOR]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_FIGHTING]) return ShowPlayerMessage(playerid, "~r~No se puede cambiar el color cuando la banda está en combate.", 3);

				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] = CrewColors[listitem];


				new r, g, b, a, new_territory_color;
				hy_HexToRGBA(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR], r, g, b, a);
				new_territory_color = hy_RGBAToHex(r, g, b, 135);
				for(new i = 0; i != MAX_TERRITORIES; i ++)
				{
					if (!TERRITORIES[i][territory_VALID]) continue;
					if (!TERRITORIES[i][territory_OCCUPIED]) continue;

					if (TERRITORIES[i][territory_CREW_ID] == PLAYER_CREW[playerid][player_crew_ID])
					{
						TERRITORIES[i][territory_COLOR] = new_territory_color;
						UpdateGangZoneColor(i);
					}
				}

				new DB_Query[90];
				format(DB_Query, sizeof DB_Query, "UPDATE `CREW` SET `COLOR` = '%d' WHERE `ID` = '%d';", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ID]);
				db_free_result(db_query(Database, DB_Query));

				new saved_noti[264];
				format(saved_noti, sizeof saved_noti, "%s cambió el color de la banda.", PLAYER_TEMP[playerid][py_RP_NAME]);
				SaveNotificationToCrewMemeber(PLAYER_CREW[playerid][player_crew_ID], saved_noti);

				ShowPlayerMessage(playerid, "El color de la banda se ha cambiado.", 3);

				ShowCrew(playerid);

				ShowDialog(playerid, DIALOG_CREW_MENU);
			}
			else ShowDialog(playerid, DIALOG_CREW_MENU);
			return 1;
		}
		case DIALOG_CREW_DELETE:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_DELETE]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_FIGHTING]) return ShowPlayerMessage(playerid, "~r~No se puede borrar la banda cuando está en combate.", 3);

				new message[144];
				format(message, sizeof message, "{%06x}[BANDA] "COL_WHITE"%s (%s) ha eliminado la banda.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] >>> 8, PLAYER_TEMP[playerid][py_RP_NAME], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_NAME]);

				new saved_noti[264];
				format(saved_noti, sizeof saved_noti, "%s ha eliminado la banda.", PLAYER_TEMP[playerid][py_RP_NAME]);
				SaveNotificationToCrewMemeber(PLAYER_CREW[playerid][player_crew_ID], saved_noti);

				HideInventory(playerid);

				new DB_Query[350];
				format(DB_Query, sizeof DB_Query, "DELETE FROM `CREW` WHERE `ID` = '%d';", PLAYER_CREW[playerid][player_crew_ID]);
				db_free_result(db_query(Database, DB_Query));

				new tmp_CREW_INFO[enum_CREW_INFO], old_crew_id = PLAYER_CREW[playerid][player_crew_ID];
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ] = tmp_CREW_INFO;

				new tmp_CREW_RANK_INFO[enum_CREW_RANK_INFO];
				for(new i = 0; i != MAX_CREW_RANKS; i ++) CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][i] = tmp_CREW_RANK_INFO;

				new tmp_PLAYER_CREW[enum_PLAYER_CREW];
				for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
				{
					if (IsPlayerConnected(i))
					{
						if (PLAYER_CREW[i][player_crew_VALID])
						{
							if (PLAYER_CREW[i][player_crew_ID] == PLAYER_CREW[playerid][player_crew_ID])
							{
								SetPlayerNormalColor(i);
								HidePlayerGangZones(i);
								if (PLAYER_TEMP[i][py_LAST_TERRITORY] != INVALID_STREAMER_ID)
								{
									TextDrawHideForPlayer(i, Textdraws[textdraw_TERRITORY_BOX]);
									TextDrawHideForPlayer(i, TERRITORIES[ PLAYER_TEMP[i][py_LAST_TERRITORY] ][territory_TEXTDRAW]);
								}
								PLAYER_CREW[i] = tmp_PLAYER_CREW;
								SendClientMessage(i, COLOR_WHITE, message);
							}
						}
					}
				}

				for(new i = 0; i != MAX_TERRITORIES; i ++)
				{
					if (!TERRITORIES[ i ][territory_VALID]) continue;
					if (!TERRITORIES[ i ][territory_OCCUPIED]) continue;
					if (TERRITORIES[ i ][territory_CREW_ID] != old_crew_id) continue;

					TERRITORIES[ i ][territory_OCCUPIED] = false;
					TERRITORIES[ i ][territory_CREW_ID] = 0;
					TERRITORIES[ i ][territory_CREW_INDEX] = 0;
					TERRITORIES[ i ][territory_COLOR] = 0xCCCCCC55;
					UpdateGangZoneColor(i);
				}

				for(new i = 0; i != MAX_PROPERTIES; i ++)
				{
					if (!PROPERTY_INFO[i][property_VALID]) continue;
					if (!PROPERTY_INFO[i][property_CREW]) continue;
					if (PROPERTY_INFO[i][property_CREW_ID] != old_crew_id) continue;

					PROPERTY_INFO[ i ][property_SOLD] = false;
					PROPERTY_INFO[ i ][property_CREW] = false;
					PROPERTY_INFO[ i ][property_OWNER_ID] = 0;
					PROPERTY_INFO[ i ][property_CREW_ID] = 0;

					new city[45], zone[45];
					GetPointZone(PROPERTY_INFO[i][property_EXT_X], PROPERTY_INFO[i][property_EXT_Y], city, zone);
					format(PROPERTY_INFO[ i ][property_NAME], 24, "%s (%d)", zone, PROPERTY_INFO[ i ][property_ID]);

					new info[3];
					UpdateUnnocupiedPropertyLabel(i);

					DestroyDynamicPickup(PROPERTY_INFO[ i ][property_EXT_PICKUP_ID]);
					PROPERTY_INFO[ i ][property_EXT_PICKUP_ID] = INVALID_STREAMER_ID;

					PROPERTY_INFO[ i ][property_EXT_PICKUP_ID] = CreateDynamicPickup(1273, 1, PROPERTY_INFO[ i ][property_EXT_X], PROPERTY_INFO[ i ][property_EXT_Y], PROPERTY_INFO[ i ][property_EXT_Z], 0, PROPERTY_INFO[ i ][property_EXT_INTERIOR]);
					info[0] = PICKUP_TYPE_PROPERTY;
					info[1] = i; // Index
					info[2] = 2; // Pickup Exterior
					Streamer_SetArrayData(STREAMER_TYPE_PICKUP, PROPERTY_INFO[ i ][property_EXT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

					format(DB_Query, sizeof(DB_Query), "DELETE FROM `PROPERTY_TERRITORY` WHERE `ID_PROPERTY` = '%d';", PROPERTY_INFO[i][property_ID]);
					db_free_result(db_query(Database, DB_Query));
				}

			}
			else ShowDialog(playerid, DIALOG_CREW_MENU);
			return 1;
		}
		case DIALOG_CREW_LEAVE:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);

			if (response)
			{
				new DB_Query[128];
				if (PLAYER_CREW[playerid][player_crew_RANK] == 0)
				{
					new DBResult:Result_count, total;
					format(DB_Query, sizeof DB_Query, "SELECT COUNT() FROM `PLAYER_CREW` WHERE `ID_CREW` = '%d' AND `RANK` = '0';", PLAYER_CREW[playerid][player_crew_ID]);
					Result_count = db_query(Database, DB_Query);

					if (db_num_rows(Result_count)) total = db_get_field_int(Result_count, 0);
					db_free_result(Result_count);

					if (total <= 1)
					{
						ShowPlayerMessage(playerid, "~r~No puedes abandonar la banda porque eres el único miembro con el rango principal.", 3);
						return 1;
					}
				}

				new message[144];
				format(message, sizeof message, "{%06x}[BANDA] "COL_WHITE"%s (%s) ha abandonado la banda.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] >>> 8, PLAYER_TEMP[playerid][py_RP_NAME], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_NAME]);
				SendMessageToCrewMembers(PLAYER_CREW[playerid][player_crew_ID], COLOR_WHITE, message);

				new saved_noti[264];
				format(saved_noti, sizeof saved_noti, "%s ha abandonado la banda.", PLAYER_TEMP[playerid][py_RP_NAME]);
				SaveNotificationToCrewMemeber(PLAYER_CREW[playerid][player_crew_ID], saved_noti);

				HideInventory(playerid);

				format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_CREW` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
				db_free_result(db_query(Database, DB_Query));

				SetPlayerNormalColor(playerid);
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MEMBERS] --;
				CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_ONLINE_MEMBERS] --;
				HidePlayerGangZones(playerid);

				new tmp_PLAYER_CREW[enum_PLAYER_CREW];
				PLAYER_CREW[playerid] = tmp_PLAYER_CREW;
			}
			return 1;
		}
		case DIALOG_CREW_MODIFY_MEMBERS:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_MODIFY_MEMBERS]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -2) // Siguiente
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_CREW` WHERE `ID_CREW` = '%d';", PLAYER_CREW[playerid][player_crew_ID]);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] >= GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] ++;
					ShowDialog(playerid, dialogid);
				}
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -3) //Anterior
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `PLAYER_CREW` WHERE `ID_CREW` = '%d';", PLAYER_CREW[playerid][player_crew_ID]);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] <= 0) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] --;
					ShowDialog(playerid, dialogid);
				}
				else
				{
					PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
					ShowDialog(playerid, DIALOG_CREW_MODIFY_MEMBER);
				}
			}
			else ShowDialog(playerid, DIALOG_CREW_MENU);
			return 1;
		}
		case DIALOG_CREW_MODIFY_MEMBER:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_MODIFY_MEMBERS]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;

				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] < PLAYER_CREW[playerid][player_crew_RANK])
				{
					ShowPlayerMessage(playerid, "~r~No puedes dar este rango porque es un rango superior al tuyo.", 3);
					return 1;
				}

				new DBResult:Result, DB_Query[320], name[24], current_rank, connected, player_id, bool:found;
				format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `ACCOUNTS`.`CONNECTED`, `ACCOUNTS`.`PLAYERID`, `PLAYER_CREW`.`RANK` FROM `ACCOUNTS`, `PLAYER_CREW` WHERE `ACCOUNTS`.`ID` = '%d' AND `PLAYER_CREW`.`ID_USER` = `ACCOUNTS`.`ID`;", PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID]);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result))
				{
					db_get_field_assoc(Result, "NAME", name, 24);
					connected = db_get_field_assoc_int(Result, "CONNECTED");
					player_id = db_get_field_assoc_int(Result, "PLAYERID");
					current_rank = db_get_field_assoc_int(Result, "RANK");
					found = true;
				}
				else found = false;
				db_free_result(Result);

				if (!found) return 1;
				if (current_rank < PLAYER_CREW[playerid][player_crew_RANK]) return ShowPlayerMessage(playerid, "~r~No puedes modificar el rango de este miembro porque es un rango superior al tuyo.", 3);
				if (current_rank == 0)
				{
					new DBResult:Result_count, total;
					format(DB_Query, sizeof DB_Query, "SELECT COUNT() FROM `PLAYER_CREW` WHERE `ID_CREW` = '%d' AND `RANK` = '0';", PLAYER_CREW[playerid][player_crew_ID]);
					Result_count = db_query(Database, DB_Query);

					if (db_num_rows(Result_count)) total = db_get_field_int(Result_count, 0);
					db_free_result(Result_count);

					if (total <= 1)
					{
						ShowPlayerMessage(playerid, "~r~No se puede modificar el rango de este miembro ya que es el único miembro con el rango principal.", 3);
						return 1;
					}
				}

				format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_CREW` SET `RANK` = '%d' WHERE `ID_USER` = '%d';", PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem], PLAYER_TEMP[playerid][py_SELECTED_DB_AC_ID]);
				db_free_result(db_query(Database, DB_Query));

				new message[144];
				if (connected)
				{
					PLAYER_CREW[player_id][player_crew_RANK] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
					format(message, sizeof message, "{%06x}[BANDA] "COL_WHITE"%s (%s) cambió tu rango al rango '%s'.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] >>> 8, PLAYER_TEMP[playerid][py_RP_NAME], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_NAME], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] ][crew_rank_NAME]);
					SendClientMessage(player_id, COLOR_WHITE, message);
				}

				ShowCrew(playerid);
			}
			else ShowDialog(playerid, DIALOG_CREW_MODIFY_MEMBERS);
			return 1;
		}
		case DIALOG_CREW_PROPERTY_CONFIRM:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_ADD_PROPERTIES]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				if (!TERRITORIES[ PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO] ][territory_VALID]) return ShowPlayerMessage(playerid, "~r~La propiedad no está dentro de un territorio de tu banda.", 3);
				if (!TERRITORIES[ PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO] ][territory_OCCUPIED]) return ShowPlayerMessage(playerid, "~r~La propiedad no está dentro de un territorio de tu banda.", 3);
				if (TERRITORIES[ PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO] ][territory_CREW_ID] != PLAYER_CREW[playerid][player_crew_ID]) return ShowPlayerMessage(playerid, "~r~La propiedad no está dentro de un territorio de tu banda.", 3);
				if (!IsPointInDynamicArea(TERRITORIES[ PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO] ][territory_AREA], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_X], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_Y], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_Z])) return SendClientMessage(playerid, COLOR_WHITE, "La propiedad no está dentro de un territorio de tu crew.");
				if (PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_OWNER_ID] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~Esta no es tu propiedad.", 3);


				new index = PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED];
				PROPERTY_INFO[ index ][property_CREW] = true;
				PROPERTY_INFO[ index ][property_OWNER_ID] = 0;
				PROPERTY_INFO[ index ][property_CREW_ID] = PLAYER_CREW[playerid][player_crew_ID];
				new label_str[256], city[45], zone[45];
				GetPointZone(PROPERTY_INFO[index][property_EXT_X], PROPERTY_INFO[index][property_EXT_Y], city, zone);
				format(PROPERTY_INFO[ index ][property_NAME], 24, "%s (%d)", zone, PROPERTY_INFO[ index ][property_ID]);

				format
				(
					label_str,
					sizeof label_str,
					""COL_WHITE"\
						Propiedad en %s (%d)\n\
						Banda: %s\n\
					", zone, PROPERTY_INFO[index][property_ID], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]
				);
				UpdateDynamic3DTextLabelText(PROPERTY_INFO[ index ][property_EXT_LABEL_ID], 0xF0F0F000, label_str);

				new DB_Query[350];

				format(DB_Query, sizeof(DB_Query), "INSERT INTO `PROPERTY_TERRITORY` (`ID_PROPERTY`, `ID_TERRITORY`) VALUES ('%d', '%d');", PROPERTY_INFO[ index ][property_ID], TERRITORIES[ PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO] ][territory_ID]);
				db_free_result(db_query(Database, DB_Query));

				format(DB_Query, sizeof(DB_Query), "DELETE FROM `PROPERTY_OWNER` WHERE `ID_PROPERTY` = '%d';", PROPERTY_INFO[ index ][property_ID]);
				db_free_result(db_query(Database, DB_Query));

				new message[144];
				format(message, sizeof message, "{%06x}[BANDA] "COL_WHITE"%s (%s) ha añadido una nueva propiedad en %s.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] >>> 8, PLAYER_TEMP[playerid][py_RP_NAME], CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_NAME], TERRITORIES[ PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO] ][territory_NAME]);
				SendMessageToCrewMembers(PLAYER_CREW[playerid][player_crew_ID], COLOR_WHITE, message);
			}
			return 1;
		}
		case DIALOG_CREW_LEAVE_TERRITORY:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_LEAVE_TERRITORY]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				if (!IsPlayerInDynamicArea(playerid, TERRITORIES[ PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO] ][territory_AREA])) return ShowPlayerMessage(playerid, "~r~No estas dentro de un territorio de tu banda.", 3);
				if (TERRITORIES[ PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO] ][territory_CREW_ID] != PLAYER_CREW[playerid][player_crew_ID]) return ShowPlayerMessage(playerid, "~r~No estas dentro de un territorio de tu banda.", 3);
				if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_FIGHTING]) return ShowPlayerMessage(playerid, "~r~No puedes abandonar territorios mientras tu banda está en combate.", 3);
				if (TERRITORIES[ PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO] ][territory_WAR]) return ShowPlayerMessage(playerid, "~r~No se puede abandonar este territorio cuando está siendo conquistado.", 3);

				TERRITORIES[ PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO] ][territory_OCCUPIED] = false;
				TERRITORIES[ PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO] ][territory_CREW_ID] = 0;
				TERRITORIES[ PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO] ][territory_CREW_INDEX] = 0;
				TERRITORIES[ PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO] ][territory_COLOR] = 0xCCCCCC55;
				UpdateGangZoneColor(PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO]);

				new DB_Query[350];
				format(DB_Query, sizeof DB_Query, "DELETE FROM `CREW_TERRITORIES` WHERE `ID_TERRITORY` = '%d';", TERRITORIES[ PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO] ][territory_ID]);
				db_free_result(db_query(Database, DB_Query));

				for(new i = 0; i != MAX_PROPERTIES; i ++)
				{
					if (!PROPERTY_INFO[i][property_VALID]) continue;
					if (!PROPERTY_INFO[i][property_CREW]) continue;
					if (PROPERTY_INFO[i][property_CREW_ID] != PLAYER_CREW[playerid][player_crew_ID]) continue;

					if (IsPointInDynamicArea(TERRITORIES[ PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO] ][territory_AREA], PROPERTY_INFO[i][property_EXT_X], PROPERTY_INFO[i][property_EXT_Y], PROPERTY_INFO[i][property_EXT_Z]))
					{
						PROPERTY_INFO[ i ][property_SOLD] = false;
						PROPERTY_INFO[ i ][property_CREW] = false;
						PROPERTY_INFO[ i ][property_OWNER_ID] = 0;
						PROPERTY_INFO[ i ][property_CREW_ID] = 0;
						new city[45], zone[45];
						GetPointZone(PROPERTY_INFO[i][property_EXT_X], PROPERTY_INFO[i][property_EXT_Y], city, zone);
						format(PROPERTY_INFO[ i ][property_NAME], 24, "%s (%d)", PROPERTY_INFO[ i ][property_ID]);

						new info[3];
						UpdateUnnocupiedPropertyLabel(i);

						DestroyDynamicPickup(PROPERTY_INFO[ i ][property_EXT_PICKUP_ID]);
						PROPERTY_INFO[ i ][property_EXT_PICKUP_ID] = INVALID_STREAMER_ID;

						PROPERTY_INFO[ i ][property_EXT_PICKUP_ID] = CreateDynamicPickup(1273, 1, PROPERTY_INFO[ i ][property_EXT_X], PROPERTY_INFO[ i ][property_EXT_Y], PROPERTY_INFO[ i ][property_EXT_Z], 0, PROPERTY_INFO[ i ][property_EXT_INTERIOR]);
						info[0] = PICKUP_TYPE_PROPERTY;
						info[1] = i; // Index
						info[2] = 2; // Pickup Exterior
						Streamer_SetArrayData(STREAMER_TYPE_PICKUP, PROPERTY_INFO[ i ][property_EXT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

						format(DB_Query, sizeof(DB_Query), "DELETE FROM `PROPERTY_TERRITORY` WHERE `ID_PROPERTY` = '%d';", PROPERTY_INFO[ i ][property_ID]);
						db_free_result(db_query(Database, DB_Query));
					}
				}

				new message[144];
				format(message, sizeof message, "%s ha abandonado un territorio en %s.", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME], TERRITORIES[ PLAYER_TEMP[playerid][py_PLAYER_TERRITORY_PRO] ][territory_NAME]);
				for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
				{
					if (IsPlayerConnected(i))
					{
						if (PLAYER_CREW[i][player_crew_VALID])
						{
							ShowPlayerNotification(i, message, 4);
						}
					}
				}
			}
			return 1;
		}
		case DIALOG_CREW_LEAVE_PROPERTY:
		{
			if (!PLAYER_CREW[playerid][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~No perteneces a ninguna crew.", 2);
			if (!CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_VALID]) return ShowPlayerMessage(playerid, "~r~La banda ya no existe.", 2);
			if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_DELETE_PROPERTIES]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);

			if (response)
			{
				if (!PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_CREW]) return ShowPlayerMessage(playerid, "~r~Esta no es una propiedad de tu banda.", 3);
				if (PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_CREW_ID] != PLAYER_CREW[playerid][player_crew_ID]) return ShowPlayerMessage(playerid, "~r~Esta no es una propiedad de tu banda.", 3);
				if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_FIGHTING]) return ShowPlayerMessage(playerid, "~r~No puedes liberar una propiedad cuando tu banda está en combate.", 3);

				PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_SOLD] = false;
				PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_CREW] = false;
				PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_OWNER_ID] = 0;
				PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_CREW_ID] = 0;
				new city[45], zone[45];
				GetPointZone(PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_X], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_Y], city, zone);
				format(PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_NAME], 24, "%s (%d)", zone, PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID]);

				new info[3];
				UpdateUnnocupiedPropertyLabel(PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED]);

				DestroyDynamicPickup(PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_PICKUP_ID]);
				PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_PICKUP_ID] = INVALID_STREAMER_ID;

				PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_PICKUP_ID] = CreateDynamicPickup(1273, 1, PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_X], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_Y], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_Z], 0, PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_INTERIOR]);
				info[0] = PICKUP_TYPE_PROPERTY;
				info[1] = PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED]; // Index
				info[2] = 2; // Pickup Exterior
				Streamer_SetArrayData(STREAMER_TYPE_PICKUP, PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_EXT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

				new DB_Query[128];
				format(DB_Query, sizeof DB_Query, "DELETE FROM `PROPERTY_TERRITORY` WHERE `ID_PROPERTY` = '%d';", PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID]);
				db_free_result(db_query(Database, DB_Query));

				ShowPlayerMessage(playerid, "La propiedad ha sido liberada.", 3);
			}
			return 1;
		}
		case DIALOG_POLICE_PENALTY:
		{
			if (response)
			{
				if (gettime() > PLAYER_TEMP[playerid][py_POLICE_PEN_TIME] + 20) return ShowPlayerMessage(playerid, "~r~Tardaste mucho en aceptar.", 3);
				if (!IsPlayerConnected(PLAYER_TEMP[playerid][py_POLICE_PEN_PID])) return ShowPlayerMessage(playerid, "~r~El policía no está conectado.", 3);
				if (ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_POLICE_PEN_PID] ][ac_ID] != PLAYER_TEMP[playerid][py_POLICE_PEN_AID]) return ShowPlayerMessage(playerid, "~r~El policía no está conectado.", 3);

				new Float:x, Float:y, Float:z; GetPlayerPos(PLAYER_TEMP[playerid][py_POLICE_PEN_PID], x, y, z);
				if (!IsPlayerInRangeOfPoint(playerid, 5.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El policía no estpa cerca tuya.", 3);

				if (PLAYER_TEMP[playerid][py_POLICE_PEN_IM] > CHARACTER_INFO[playerid][ch_CASH])
				{
					ShowPlayerMessage(playerid, "~r~No tienes dinero para pagar la multa.", 3);
					ShowPlayerMessage(PLAYER_TEMP[playerid][py_POLICE_PEN_PID], "~r~La persona ha aceptado la multa pero no tiene dinero para pagarla.", 3);
					return 1;
				}

				GivePlayerCash(playerid, -PLAYER_TEMP[playerid][py_POLICE_PEN_IM]);
				GivePlayerCash(PLAYER_TEMP[playerid][py_POLICE_PEN_PID], PLAYER_TEMP[playerid][py_POLICE_PEN_IM]/2);

			    ShowPlayerMessage(playerid, "~g~La multa fue pagada..", 3);
				ShowPlayerMessage(PLAYER_TEMP[playerid][py_POLICE_PEN_PID], "~g~La persona ha pagado la multa, la mitad del importe es para ti.", 3);

			}
			else
			{
				if (gettime() > PLAYER_TEMP[playerid][py_POLICE_PEN_TIME] + 20) return 1;
				if (!IsPlayerConnected(PLAYER_TEMP[playerid][py_POLICE_PEN_PID])) return 1;
				if (ACCOUNT_INFO[ PLAYER_TEMP[playerid][py_POLICE_PEN_PID] ][ac_ID] != PLAYER_TEMP[playerid][py_POLICE_PEN_AID]) return 1;

			    ShowPlayerMessage(PLAYER_TEMP[playerid][py_POLICE_PEN_PID], "~r~La persona se niega a pagar la multa.", 3);
			}
			return 1;
		}
		case DIALOG_SERVER_ECO:
		{
			if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < 5) return 1;

			if (response)
			{
				PLAYER_TEMP[playerid][py_DIALOG_ECO_SELECTED] = listitem;
				ShowDialog(playerid, DIALOG_SERVER_ECO_MODIFY);
			}
			return 1;
		}
		case DIALOG_SERVER_ECO_MODIFY:
		{
			if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < 5) return 1;

			if (response)
			{
				new Float:multiplier;
				if (sscanf(inputtext, "f", multiplier))
				{
				    ShowPlayerMessage(playerid, "~r~Sintaxis no válida.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				switch(PLAYER_TEMP[playerid][py_DIALOG_ECO_SELECTED])
				{
					case 0: MULTIPLIER_PROPERITES = multiplier;
					case 1: MULTIPLIER_VEHICLES = multiplier;
					case 2: MULTIPLIER_TOYS = multiplier;
					case 3: MULTIPLIER_SKINS = multiplier;
					case 4: MULTIPLIER_WEAPONS = multiplier;
					case 5: SU_SD_PRICE = floatround(multiplier);
				}

				WriteEconomyMultipliers();
				UpdateEconomy(PLAYER_TEMP[playerid][py_DIALOG_ECO_SELECTED]);
				ShowDialog(playerid, DIALOG_SERVER_ECO);
			}
			else ShowDialog(playerid, DIALOG_SERVER_ECO);
			return 1;
		}
		case DIALOG_SU_BUY:
		{
			if (response)
			{
				if (SU_SD_PRICE > ACCOUNT_INFO[playerid][ac_SD])
				{
					ShowPlayerNotification(playerid, "No tienes los "SERVER_COIN" suficientes.", 3);
					return 1;
				}

				SetPlayerVip(playerid, 1, SU_SD_PRICE, 30);
			}
			return 1;
		}
		case DIALOG_SU:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0, 1: ShowDialog(playerid, dialogid);
					case 2:
					{
						if (SU_SD_PRICE > ACCOUNT_INFO[playerid][ac_SD])
						{
							ShowPlayerNotification(playerid, "No tienes los "SERVER_COIN" suficientes.", 4);
							return 1;
						}

						ACCOUNT_INFO[playerid][ac_SD] -= SU_SD_PRICE;

						new DB_Query[128], DBResult:Result;
						format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `SD` = '%d', `SU` = '%d', `SU_EXPIRE_DATE` = DATETIME(`SU_EXPIRE_DATE`, '+30 day') WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_SU], ACCOUNT_INFO[playerid][ac_ID]);
						db_free_result(db_query(Database, DB_Query));

						format(DB_Query, sizeof DB_Query, "SELECT `SU_EXPIRE_DATE` FROM `ACCOUNTS` WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
						Result = db_query(Database, DB_Query);
						if (db_num_rows(Result)) db_get_field(Result, 0, ACCOUNT_INFO[playerid][ac_SU_EXPIRE_DATE], 24);
						db_free_result(Result);

						ShowPlayerNotification(playerid, "Has renovado tu VIP un mes.", 4);
						ShowPlayerMessage(playerid, "Puedes utilizar ~y~/vip ~w~para ver el tiempo restante o renovar.", 4);
					}
				}
			}
			return 1;
		}
		case DIALOG_VOBJECT_MENU:
		{
			if (response)
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
							ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP~w~ para tener más objetos.", 4);
							ShowDialog(playerid, dialogid);
							return 1;
						}

						if (slot == -1)
						{
						    ShowPlayerMessage(playerid, "~r~No hay más espacio para objetos en este vehículo.", 3);
							ShowDialog(playerid, dialogid);
							return 1;
						}

						PLAYER_TEMP[playerid][py_TUNING_GARAGE_SHOP] = true;

						new Float:p[6];
						GetPlayerCameraPos(playerid, p[0], p[1], p[2]);
						GetPlayerCameraLookAt(playerid, p[3], p[4], p[5]);
						InterpolateCameraPos(playerid, p[0], p[1], p[2], 1566.0983, -2179.3677, 16.1297, 2000);
						InterpolateCameraLookAt(playerid, p[3], p[4], p[5], 1565.2498, -2178.8325, 15.7447, 2000);

						TextDrawShowForPlayer(playerid, Textdraws[textdraw_SHOP_TUNING][0]);
						TextDrawShowForPlayer(playerid, Textdraws[textdraw_SHOP_TUNING][1]);
						TextDrawShowForPlayer(playerid, Textdraws[textdraw_SHOP_TUNING][2]);
						TextDrawShowForPlayer(playerid, Textdraws[textdraw_SHOP_TUNING][3]);
						TextDrawShowForPlayer(playerid, Textdraws[textdraw_SHOP_TUNING][4]);
						//PLAYER_TEMP[playerid][py_SELECT_TUNING_OBJECT] = 0;

						UpdateTuningShop(playerid);

						ShowPlayerMessage(playerid, "Pulsa ~y~ESCAPE ~w~si quieres salir del menú", 2);
						SelectTextDrawEx(playerid, 0xe8d08fFF);
					}
					case 2:
					{
						new slot = GetVehicleFreeObjectSlot(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID]);
						if (!ACCOUNT_INFO[playerid][ac_SU] && slot >= MAX_NU_VOBJECTS)
						{
							PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
							ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP~w~ para tener más objetos.", 4);
							ShowDialog(playerid, dialogid);
							return 1;
						}
						if (slot == -1)
						{
							ShowPlayerMessage(playerid, "~r~No hay más espacio para objetos en este vehículo.", 3);
							ShowDialog(playerid, dialogid);
							return 1;
						}

						if (500 > CHARACTER_INFO[playerid][ch_CASH])
						{
							PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					        ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
							ShowDialog(playerid, dialogid);
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
						UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], slot, true);

						ShowPlayerMessage(playerid, "El objeto de texto fue añadido.", 2);
						PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] = slot;
						ShowDialog(playerid, DIALOG_VOBJECT_OBJECT);
					}
					case 3:
					{
						new slot = GetVehicleFreeObjectSlot(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID]);
						if (!ACCOUNT_INFO[playerid][ac_SU] && slot >= MAX_NU_VOBJECTS)
						{
							PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
							ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP~w~ para tener más objetos.", 4);
							ShowDialog(playerid, dialogid);
							return 1;
						}
						if (slot == -1)
						{
							ShowPlayerMessage(playerid, "~r~No hay más espacio para objetos en este vehículo.", 3);
							ShowDialog(playerid, dialogid);
							return 1;
						}

						if (2000 > CHARACTER_INFO[playerid][ch_CASH])
						{
					        ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
							PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
							ShowDialog(playerid, dialogid);
							return 1;
						}

						PLAYER_TEMP[playerid][py_COUNTRY_TYPE] = 0;
						ShowDialog(playerid, DIALOG_VOBJECT_COUNTRY);
					}
					case 4:
					{
						new slot = GetVehicleFreeObjectSlot(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID]);
						if (!ACCOUNT_INFO[playerid][ac_SU] && slot >= MAX_NU_VOBJECTS)
						{
							PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
							ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP~w~ para tener más objetos.", 4);
							ShowDialog(playerid, dialogid);
							return 1;
						}
						if (slot == -1)
						{
							ShowPlayerMessage(playerid, "~r~No hay más espacio para objetos en este vehículo.", 3);
							ShowDialog(playerid, dialogid);
							return 1;
						}

						if (2000 > CHARACTER_INFO[playerid][ch_CASH])
						{
							PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					        ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
							ShowDialog(playerid, dialogid);
							return 1;
						}

						PLAYER_TEMP[playerid][py_COUNTRY_TYPE] = 1;
						ShowDialog(playerid, DIALOG_VOBJECT_COUNTRY);
					}
				}
			}
			return 1;
		}
		case DIALOG_VOBJECT_COUNTRY:
		{
			if (response)
			{
				new slot = GetVehicleFreeObjectSlot(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID]);
				if (!ACCOUNT_INFO[playerid][ac_SU] && slot >= MAX_NU_VOBJECTS)
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP~w~ para tener más objetos.", 4);
					ShowObjTuning(playerid);
					return 1;
				}
				if (slot == -1)
				{
					ShowPlayerMessage(playerid, "~r~No hay más espacio para objetos en este vehículo.", 3);
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

				GivePlayerCash(playerid, -2000);

				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_VALID] = true;
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_ID] = 0;
				if (PLAYER_TEMP[playerid][py_COUNTRY_TYPE] == 0)
				{
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_TYPE] = VOBJECT_TYPE_COUNTRY_FLAG;
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_MODELID] = 19307;
				}
				else if (PLAYER_TEMP[playerid][py_COUNTRY_TYPE] == 1)
				{
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_TYPE] = VOBJECT_TYPE_COUNTRY_PANEL;
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_MODELID] = 2661;
				}
				format(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_NAME], 32, "Pais");
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_ATTACHED] = true;
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_COLORS][0] = listitem;

				RegisterNewVehicleObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], slot);
				UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], slot, true);

				ShowPlayerMessage(playerid, "El objeto fue añadido.", 3);
				PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] = slot;
				ShowDialog(playerid, DIALOG_VOBJECT_OBJECT);
			}
			else ShowObjTuning(playerid);
			return 1;
		}
		case DIALOG_VOBJECT_OBJECTS:
		{
			if (response)
			{
				if (listitem == MAX_SU_VOBJECTS) return ShowDialog(playerid, DIALOG_VOBJECT_DELETE_ALL);
				if (!VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][listitem][vobject_VALID])
				{
				    ShowPlayerMessage(playerid, "~r~Este slot está vacío, puedes comprar un objeto nuevo.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] = listitem;
				ShowDialog(playerid, DIALOG_VOBJECT_OBJECT);
			}
			else ShowObjTuning(playerid);
			return 1;
		}
		case DIALOG_VOBJECT_OBJECT:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						if (VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ATTACHED])
						{
						    ShowPlayerMessage(playerid, "Objeto guardado", 2);
							VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ATTACHED] = false;
							UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
							ShowDialog(playerid, DIALOG_VOBJECT_OBJECT);
						}
						else
						{
						    ShowPlayerMessage(playerid, "Objeto colocado.", 2);
							VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ATTACHED] = true;
							UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
							ShowDialog(playerid, DIALOG_VOBJECT_OBJECT);
						}
					}
					case 1: ShowDialog(playerid, DIALOG_VOBJECT_OBJECT_CNAME);
					case 2:
					{
						if (!VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ATTACHED])
						{
						    ShowPlayerMessage(playerid, "~r~Primero debes colocar el nombre.", 2);
							ShowDialog(playerid, dialogid);
							return 1;
						}

						EditVehicleObject(playerid, PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
					}
					case 3:
					{
						switch(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_TYPE])
						{
							case VOBJECT_TYPE_OBJECT:
							{
								if (!VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ATTACHED])
								{
								    ShowPlayerMessage(playerid, "~r~Primero debes colocar el objeto.", 2);
									ShowDialog(playerid, dialogid);
									return 1;
								}
								ShowDialog(playerid, DIALOG_VOBJECT_OBJECT_COLORS);
							}
							case VOBJECT_TYPE_TEXT:
							{
								if (!VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ATTACHED])
								{
									ShowPlayerMessage(playerid, "~r~Primero debes colocar el objeto.", 2);
									ShowDialog(playerid, dialogid);
									return 1;
								}
								ShowDialog(playerid, DIALOG_VOBJECT_TEXT_MENU);
							}
							case VOBJECT_TYPE_COUNTRY_FLAG, VOBJECT_TYPE_COUNTRY_PANEL: ShowDialog(playerid, DIALOG_VOBJECT_OBJECT_CDELETE);
						}
					}
					case 4: ShowDialog(playerid, DIALOG_VOBJECT_OBJECT_CDELETE);
				}

			}
			else
			{
				UpdateVehicleObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
				ShowDialog(playerid, DIALOG_VOBJECT_OBJECTS);
			}
			return 1;
		}
		case DIALOG_VOBJECT_OBJECT_CNAME:
		{
			if (response)
			{
				if (!strlen(inputtext) || strlen(inputtext) > 32)
				{
				    ShowPlayerMessage(playerid, "~r~El nombre del objeto debe contener de 1 a 32 caracteres.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				format(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_NAME], 32, "%s", inputtext);
				ShowDialog(playerid, DIALOG_VOBJECT_OBJECT);
			}
			else ShowDialog(playerid, DIALOG_VOBJECT_OBJECT);
			return 1;
		}
		case DIALOG_VOBJECT_OBJECT_COLORS:
		{
			if (response)
			{
				PLAYER_TEMP[playerid][py_TUNING_EDIT_COLOR_SLOT] = listitem;
				ShowDialog(playerid, DIALOG_VOBJECT_OBJECT_COLOR);
			}
			else ShowDialog(playerid, DIALOG_VOBJECT_OBJECT);
			return 1;
		}
		case DIALOG_VOBJECT_OBJECT_COLOR:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_COLORS][ PLAYER_TEMP[playerid][py_TUNING_EDIT_COLOR_SLOT] ] = 0;
						UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
						ShowPlayerMessage(playerid, "Color actualizado.", 2);
						ShowDialog(playerid, DIALOG_VOBJECT_OBJECT_COLORS);
					}
					case 1:
					{
						VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_COLORS][ PLAYER_TEMP[playerid][py_TUNING_EDIT_COLOR_SLOT] ] = hy_RGBAToARGB(VEHICLE_COLORS[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][gb_vehicle_COLOR_1] ]);
						UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
						ShowPlayerMessage(playerid, "Color actualizado.", 2);
						ShowDialog(playerid, DIALOG_VOBJECT_OBJECT_COLORS);
					}
					case 2:
					{
						VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_COLORS][ PLAYER_TEMP[playerid][py_TUNING_EDIT_COLOR_SLOT] ] = hy_RGBAToARGB(VEHICLE_COLORS[ GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][gb_vehicle_COLOR_2] ]);
						UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
						ShowPlayerMessage(playerid, "Color actualizado.", 2);
						ShowDialog(playerid, DIALOG_VOBJECT_OBJECT_COLORS);
					}
					case 3: ShowDialog(playerid, DIALOG_VOBJECT_OBJECT_COLOR_HEX);
				}
			}
			else ShowDialog(playerid, DIALOG_VOBJECT_OBJECT_COLORS);
			return 1;
		}
		case DIALOG_VOBJECT_OBJECT_COLOR_HEX:
		{
			if (response)
			{
				if (strlen(inputtext) < 8) return ShowDialog(playerid, dialogid);

				new hexcolor;
				if (sscanf(inputtext, "h", hexcolor))
				{
					ShowDialog(playerid, dialogid);
					return 1;
				}

				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_COLORS][ PLAYER_TEMP[playerid][py_TUNING_EDIT_COLOR_SLOT] ] = hexcolor;
				UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
				ShowPlayerMessage(playerid, "Color actualizado.", 2);
				ShowDialog(playerid, DIALOG_VOBJECT_OBJECT_COLORS);
			}
			else ShowDialog(playerid, DIALOG_VOBJECT_OBJECT_COLOR);
			return 1;
		}
		case DIALOG_VOBJECT_OBJECT_CDELETE:
		{
			if (response)
			{
				if (VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OBJECT_ID] != INVALID_STREAMER_ID)
				{
					DestroyDynamicObject(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OBJECT_ID]);
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OBJECT_ID] = INVALID_STREAMER_ID;
				}

				new DB_Query[128];
				format(DB_Query, sizeof DB_Query, "DELETE FROM `VEHICLE_OBJECTS` WHERE `ID` = '%d';", VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ID]);
				db_free_result(db_query(Database, DB_Query));

				new temp_VEHICLE_OBJECTS[e_VEHICLE_OBJECTS];
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ] = temp_VEHICLE_OBJECTS;

				ShowPlayerMessage(playerid, "Objeto eliminado.", 2);
				ShowDialog(playerid, DIALOG_VOBJECT_OBJECTS);
			}
			else ShowDialog(playerid, DIALOG_VOBJECT_OBJECT);
			return 1;
		}
		case DIALOG_VOBJECT_DELETE_ALL:
		{
			if (response)
			{
				new DB_Query[128];
				format(DB_Query, sizeof DB_Query, "DELETE FROM `VEHICLE_OBJECTS` WHERE `ID_VEHICLE` = '%d';", PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][player_vehicle_ID]);
				db_free_result(db_query(Database, DB_Query));

				new temp_VEHICLE_OBJECTS[e_VEHICLE_OBJECTS];
				for(new i = 0; i != MAX_SU_VOBJECTS; i ++)
				{
					if (VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][i][vobject_OBJECT_ID] != INVALID_STREAMER_ID)
					{
						DestroyDynamicObject(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][i][vobject_OBJECT_ID]);
						VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][i][vobject_OBJECT_ID] = INVALID_STREAMER_ID;
					}

					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][i] = temp_VEHICLE_OBJECTS;
				}

				ShowPlayerMessage(playerid, "Todos los objetos de este vehículo han sido eliminados.", 2);
				ShowDialog(playerid, DIALOG_VOBJECT_OBJECTS);
			}
			else ShowDialog(playerid, DIALOG_VOBJECT_OBJECT);
			return 1;
		}
		case DIALOG_VOBJECT_TEXT_MENU:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: ShowDialog(playerid, DIALOG_VOBJECT_TEXT_TEXT);
					case 1: ShowDialog(playerid, DIALOG_VOBJECT_TEXT_FONT);
					case 2: ShowDialog(playerid, DIALOG_VOBJECT_TEXT_FONT_SIZE);
					case 3:
					{
						if (VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_BOLD])
						{
							VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_BOLD] = false;
					        ShowPlayerMessage(playerid, "Negrita ~r~deshabilitada", 2);
						}
						else
						{
							VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_BOLD] = true;
							ShowPlayerMessage(playerid, "Negrita ~g~habilitada", 2);
						}

						UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
						ShowDialog(playerid, dialogid);
					}
					case 4: ShowDialog(playerid, DIALOG_VOBJECT_TEXT_FONT_COLOR);
				}
			}
			else ShowDialog(playerid, DIALOG_VOBJECT_OBJECT);
			return 1;
		}
		case DIALOG_VOBJECT_TEXT_TEXT:
		{
			if (response)
			{
				if (strlen(inputtext) >= 32)
				{
				    ShowPlayerMessage(playerid, "~r~Como máximo puedes introducir un texto de 32 caracteres.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				if (sscanf(inputtext, "s[32]", inputtext))
				{
				    ShowPlayerMessage(playerid, "Introduce un texto.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				format(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_TEXT], 32, "%s", inputtext);
				UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
				ShowPlayerMessage(playerid, "Texto actualizado.", 2);
			}
			ShowDialog(playerid, DIALOG_VOBJECT_TEXT_MENU);
			return 1;
		}
		case DIALOG_VOBJECT_TEXT_FONT:
		{
			if (response)
			{
				if (strlen(inputtext) >= 24)
				{
				    ShowPlayerMessage(playerid, "~r~Como máximo puedes introducir una fuente de 24 caracteres.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				if (sscanf(inputtext, "s[24]", inputtext))
				{
					ShowPlayerMessage(playerid, "Introduce un texto.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				format(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_FONT], 24, "%s", inputtext);
				UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
				ShowPlayerMessage(playerid, "Fuente actualizada.", 2);
			}
			ShowDialog(playerid, DIALOG_VOBJECT_TEXT_MENU);
			return 1;
		}
		case DIALOG_VOBJECT_TEXT_FONT_SIZE:
		{
			if (response)
			{
				if (sscanf(inputtext, "d", inputtext[0]))
				{
				    ShowPlayerMessage(playerid, "Introduce un valor numérico.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (inputtext[0] <= 0 || inputtext[0] >= 255)
				{
				    ShowPlayerMessage(playerid, "Introduce un valor entre 1 y 255.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_FONT_SIZE] = inputtext[0];
				UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
				ShowPlayerMessage(playerid, "Tamaño de letra actualizado.", 2);
			}
			ShowDialog(playerid, DIALOG_VOBJECT_TEXT_MENU);
			return 1;
		}
		case DIALOG_VOBJECT_TEXT_FONT_COLOR:
		{
			if (response)
			{
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_FONT_COLOR] = hy_RGBAToARGB(CrewColors[listitem]);
				UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
				ShowPlayerMessage(playerid, "Color de letra actualizado.", 2);
			}
			ShowDialog(playerid, DIALOG_VOBJECT_TEXT_MENU);
			return 1;
		}
		case DIALOG_PLAYER_CONFIG:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						ShowDialog(playerid, DIALOG_CHANGE_PASSWORD);
					}
					case 1:
					{
						ShowDialog(playerid, DIALOG_PLAYER_CONFIG);
					}
					case 2:
					{
						if (PLAYER_PHONE[playerid][player_phone_VISIBLE_NUMBER])
						{
							PLAYER_PHONE[playerid][player_phone_VISIBLE_NUMBER] = false;
							ShowDialog(playerid, dialogid);
						}
						else
						{
							PLAYER_PHONE[playerid][player_phone_VISIBLE_NUMBER] = true;
							ShowDialog(playerid, dialogid);
						}
					}
					case 3:
					{
						if (ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL])
						{
							ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL] = false;
							ShowDialog(playerid, dialogid);
						}
						else
						{
							ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL] = true;
							ShowDialog(playerid, dialogid);
						}
					}
					case 4:
					{
						if (PLAYER_MISC[playerid][MISC_GLOBAL_CHAT])
						{
							PLAYER_MISC[playerid][MISC_GLOBAL_CHAT] = false;
							ShowDialog(playerid, dialogid);
						}
						else
						{
							PLAYER_MISC[playerid][MISC_GLOBAL_CHAT] = true;
							ShowDialog(playerid, dialogid);
						}
					}
					case 5:
					{
						if (PLAYER_MISC[playerid][MISC_CONFIG_HUD])
						{
							PLAYER_MISC[playerid][MISC_CONFIG_HUD] = false;
							ShowDialog(playerid, dialogid);
							HidePlayerHud(playerid);
						}
						else
						{
							PLAYER_MISC[playerid][MISC_CONFIG_HUD] = true;
							ShowDialog(playerid, dialogid);
							SetPlayerHud(playerid);
						}
					}
					case 6:
					{
						if (PLAYER_MISC[playerid][MISC_CONFIG_FP])
						{
							PLAYER_MISC[playerid][MISC_CONFIG_FP] = false;
							ShowDialog(playerid, dialogid);
							SetFirstPerson(playerid, false);
						}
						else
						{
							PLAYER_MISC[playerid][MISC_CONFIG_FP] = true;
							ShowDialog(playerid, dialogid);
							SetFirstPerson(playerid, true);
						}
					}
					case 7:
					{
						if (CHARACTER_INFO[playerid][ch_SEX] == SEX_MALE)
						{
							CHARACTER_INFO[playerid][ch_SEX] = SEX_FEMALE;
							ShowDialog(playerid, dialogid);
						}
						else
						{
							CHARACTER_INFO[playerid][ch_SEX] = SEX_MALE;
							ShowDialog(playerid, dialogid);
						}
					}
					case 8:
					{
						Streamer_Update(playerid);
					}
					case 9:
					{
						PLAYER_MISC[playerid][MISC_DAMAGE_INFORMER] = !PLAYER_MISC[playerid][MISC_DAMAGE_INFORMER];

						SavePlayerMisc(playerid);
						ShowDialog(playerid, dialogid);
					}
					case 10:
					{
						new dialog[64 * 10];

						new DBResult:Result, DB_Query[140];
						format(DB_Query, sizeof DB_Query, "SELECT * FROM `ADDRESS_LOG` WHERE `ID_USER` = '%d' ORDER BY `DATE` DESC LIMIT 10;", ACCOUNT_INFO[playerid][ac_ID]);
						Result = db_query(Database, DB_Query);

						if (db_num_rows(Result) == 0) strcat(dialog, ""COL_WHITE"No hay registros.");
						else
						{
							for(new i; i < db_num_rows(Result); i++ )
							{
								new 
									line_str[125],
									message[128],
									date;

								date = db_get_field_assoc_int(Result, "DATE");
								db_get_field_assoc(Result, "CONTENT", message, 128);

								format(line_str, sizeof line_str, ""COL_WHITE"%s\t%s\n", message, ReturnTimelapse(date, gettime()));
								strcat(dialog, line_str);

								db_next_row(Result);
							}
							db_free_result(Result);
						}

						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_TABLIST, ""COL_RED"Registro", dialog, "Cerrar", "");
					}
					case 11: ShowDialog(playerid, DIALOG_BUY_NAME_COLOR);
					case 12: ShowDialog(playerid, DIALOG_BUY_CHAT_COLOR);
					case 13:
					{
						if (ACCOUNT_INFO[playerid][ac_LEVEL] < 3) return ShowPlayerMessage(playerid, "~r~Necesitas ser nivel 3 para usar este modo.", 5);
						if (PLAYER_TEMP[playerid][py_COMBAT_MODE]) return ShowPlayerMessage(playerid, "~r~No puedes usar el modo pacífico estando en combate.", 5);

						PLAYER_TEMP[playerid][py_PACIFIC] = !PLAYER_TEMP[playerid][py_PACIFIC];

						if (PLAYER_TEMP[playerid][py_PACIFIC]) SetPlayerChatBubble(playerid, "\n\n\n\n* Ha entrado al modo pacífico.\n\n\n", 0xffcb90FF, 20.0, 7000);
						else SetPlayerChatBubble(playerid, "\n\n\n\n* Ha salido del modo pacífico.\n\n\n", 0xffcb90FF, 20.0, 7000);

						ShowDialog(playerid, DIALOG_PLAYER_CONFIG);
					}
				}
			}
			return 1;
		}
		case DIALOG_POLICE_BYC:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
						PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
						ShowDialog(playerid, DIALOG_POLICE_BYC_LAST_ALL);
					}
					case 1: ShowDialog(playerid, DIALOG_POLICE_BYC_NAME_FIND);
				}
			}
			return 1;
		}
		case DIALOG_POLICE_BYC_NAME_FIND:
		{
			if (response)
			{
				new name[24];
				if (sscanf(inputtext, "s[24]", name)) return ShowDialog(playerid, dialogid);

				new DBResult:Result, DB_Query[128], bool:found;
				format(DB_Query, sizeof DB_Query, "SELECT `ID` FROM `ACCOUNTS` WHERE `NAME` = '%q';", name);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result))
				{
					PLAYER_TEMP[playerid][py_SELECTED_BYC_USER_ID] = db_get_field_int(Result, 0);
					found = true;
				}
				db_free_result(Result);

				if (found)
				{
					PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
					PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
					ShowDialog(playerid, DIALOG_POLICE_BYC_LAST_PLAYER);
				}
				else ShowPlayerMessage(playerid, "~r~No se encontró a esa persona.", 3);
			}
			return 1;
		}
		case DIALOG_POLICE_BYC_LAST_ALL:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -2) // Siguiente
				{
					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] >= GetDatabasePages("SELECT COUNT() FROM `POLICE_HISTORY`;", PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] ++;
					ShowDialog(playerid, dialogid);
				}
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -3) //Anterior
				{
					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] <= 0) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = GetDatabasePages("SELECT COUNT() FROM `POLICE_HISTORY`;", PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] --;
					ShowDialog(playerid, dialogid);
				}
				else
				{
					PLAYER_TEMP[playerid][py_SELECTED_BYC_ID] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
					ShowDialog(playerid, DIALOG_POLICE_DELETE_BYC);
				}
			}
			return 1;
		}
		case DIALOG_POLICE_BYC_LAST_PLAYER:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -2) // Siguiente
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `POLICE_HISTORY` WHERE `ID_USER` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_BYC_USER_ID]);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] >= GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] ++;
					ShowDialog(playerid, dialogid);
				}
				else if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -3) //Anterior
				{
					new the_query[128];
					format(the_query, sizeof the_query, "SELECT COUNT() FROM `POLICE_HISTORY` WHERE `ID_USER` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_BYC_USER_ID]);

					if (PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] <= 0) PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = GetDatabasePages(the_query, PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]) - 1;
					else PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] --;
					ShowDialog(playerid, dialogid);
				}
				else
				{
					PLAYER_TEMP[playerid][py_SELECTED_BYC_ID] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
					ShowDialog(playerid, DIALOG_POLICE_DELETE_BYC);
				}
			}
			return 1;
		}
		case DIALOG_POLICE_DELETE_BYC:
		{
			if (response)
			{
				new DB_Query[128];
				format(DB_Query, sizeof DB_Query, "DELETE FROM `POLICE_HISTORY` WHERE `ID` = '%d';", PLAYER_TEMP[playerid][py_SELECTED_BYC_ID]);
				db_free_result(db_query(Database, DB_Query));

				ShowPlayerMessage(playerid, "~r~Registro borrado del historial policial.", 3);
			}
			return 1;
		}
		case DIALOG_GIFT:
		{
			if (response)
			{
				new DBResult:Result, DB_Query[140];
				format(DB_Query, sizeof DB_Query, "SELECT * FROM `GIFTS_CODES` WHERE `CODE` = '%q';", inputtext);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result) == 0) ShowPlayerMessage(playerid, "~r~El código no existe.", 4);
				else
				{
					new 
						str_text[128],
						code[24],
						type,
						extra,
						used;

					db_get_field_assoc(Result, "CODE", code, 24);
					type = db_get_field_assoc_int(Result, "TYPE");
					extra = db_get_field_assoc_int(Result, "EXTRA");
					used = db_get_field_assoc_int(Result, "USED");

					if (used == 0)
					{
						switch(type)
						{
							case 0:
							{
								format(str_text, sizeof(str_text), "~g~[DINERO]~w~ Has canjeado %d$", extra);
								ShowPlayerMessage(playerid, str_text, 4);
								GivePlayerCash(playerid, extra, false);
							}
							case 1:
							{
								CHARACTER_INFO[playerid][ch_SKIN] = extra;
    							SetPlayerSkin(playerid, CHARACTER_INFO[playerid][ch_SKIN]);
    							PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];
    							format(str_text, sizeof(str_text), "~g~[SKIN]~w~ Has canjeado la skin %d", extra);
								ShowPlayerMessage(playerid, str_text, 4);
							}
							case 2:
							{
								SetPlayerVip(playerid, 1, 0, extra);
							}
							case 3:
							{
								ACCOUNT_INFO[playerid][ac_SD] += extra;

								format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `SD` = '%d' WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_ID]);
								db_free_result(db_query(Database, DB_Query));

								format(str_text, sizeof(str_text), "~g~[HYCOINS]~w~ Has canjeado %d Hycoins", extra);
								ShowPlayerMessage(playerid, str_text, 4);
							}
							case 4:
							{
								SetPlayerVip(playerid, 2, 0, extra);
							}
						}//0: dinero, 1: skin, 2: vip, 3: hycoins

						format(DB_Query, sizeof DB_Query, "UPDATE `GIFTS_CODES` SET `USED` = '1' WHERE `CODE` = '%q';", inputtext);
						db_free_result(db_query(Database, DB_Query));
						return 1;
					}
					else ShowPlayerMessage(playerid, "~r~El código ya fue usado.", 4);
				}
				db_free_result(Result);
			}
			return 1;
		}
		case DIALOG_BUY_ROD:
		{
			if (response)
			{
				if (CHARACTER_INFO[playerid][ch_CASH] <= 455) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);

				if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);

				AddPlayerItem(playerid, 35);
            	GivePlayerCash(playerid, -455, false);
			}
			return 1;
		}
		case DIALOG_BUY_FIXKIT:
		{
			if (response)
			{
				if (CHARACTER_INFO[playerid][ch_CASH] <= 799) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);

				if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);
				AddPlayerItem(playerid, 37);
            	GivePlayerCash(playerid, -800, false);
     			SavePlayerMisc(playerid);
			}
			return 1;
		}
		case DIALOG_SELL_FISH:
		{
			if (response)
			{
				new 
					payment = (PLAYER_TEMP[playerid][py_FISHS] * 200),
					vip_payment = 0
				;

	    		if (ACCOUNT_INFO[playerid][ac_SU])
				{
					vip_payment = (PLAYER_TEMP[playerid][py_FISHS] * 100);				
				}

				payment = (payment + vip_payment);

				PLAYER_TEMP[playerid][py_FISHS] = 0;
            	GivePlayerCash(playerid, payment, true);
     			GivePlayerReputation(playerid);
			}
			return 1;
		}
		/*case DIALOG_CONFIG_VOICE:
		{
			if (response)
			{
				PLAYER_MISC[playerid][MISC_VOICE_KEY] = listitem;
				ShowDialog(playerid, DIALOG_PLAYER_CONFIG);
				SavePlayerMisc(playerid);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_CONFIG);
			return 1;
		}*/
		case DIALOG_BUY_VOBJECT:
		{
			if (response)
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

				if (listitem > sizeof(Tuning_Shop_Objects)) return ShowPlayerMessage(playerid, "~r~Index invalido", 3);

				if (Tuning_Shop_Objects[listitem][tuning_object_PRICE] > CHARACTER_INFO[playerid][ch_CASH])
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
					return 1;
				}

				GivePlayerCash(playerid, -Tuning_Shop_Objects[listitem][tuning_object_PRICE]);

				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_VALID] = true;
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_TYPE] = VOBJECT_TYPE_OBJECT;
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_ID] = 0;
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_MODELID] = Tuning_Shop_Objects[listitem][tuning_object_MODELID];
				format(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_NAME], 32, "%s", Tuning_Shop_Objects[listitem][tuning_object_NAME]);
				VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][slot][vobject_ATTACHED] = true;
				UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], slot);

				RegisterNewVehicleObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], slot);
				ShowDialog(playerid, DIALOG_VOBJECT_OBJECTS);
			}
			else ShowObjTuning(playerid);
			return 1;
		}
		case DIALOG_RADIO_STATIONS:
		{
			if (response)
			{
				new index = (listitem - 2);
				if (listitem == 0)
				{
					PLAYER_MISC[playerid][MISC_RADIO_STATION] = 100;
					ShowPlayerMessage(playerid, "Radio ~r~apagada", 2);
					new p_vehicleid = GetPlayerVehicleID(playerid);

					for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
					{
						if (IsPlayerConnected(i))
						{
							new vehicleid = GetPlayerVehicleID(i);
							if (vehicleid == p_vehicleid)
							{
								if (!PLAYER_TEMP[i][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);
							}
						}
					}
				}
				else if (listitem == 1)
				{
					if (PLAYER_TEMP[playerid][py_PLAYER_WAITING_MP3_HTTP]) return ShowPlayerMessage(playerid, "~r~Espera que termine la búsqueda actual.", 3, 1085);
					if (gettime() < PLAYER_TEMP[playerid][py_LAST_SEARCH] + 60) return ShowPlayerMessage(playerid, "~r~Solo puedes usar YouTube cada un minuto.", 3, 1085);

					ShowPlayerMessage(playerid, "~r~YouTube nos ha baneado, esta opcion se encuentra desactivada.", 4);
					//ShowDialog(playerid, DIALOG_PLAYER_MP3);
					PLAYER_MISC[playerid][MISC_RADIO_STATION] = 666;
				}
				else
				{
					PLAYER_MISC[playerid][MISC_RADIO_STATION] = index;
					ShowPlayerMessage(playerid, "Emisora ~g~cambiada", 2);
					new p_vehicleid = GetPlayerVehicleID(playerid);

					for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
					{
						if (IsPlayerConnected(i))
						{
							new vehicleid = GetPlayerVehicleID(i);
							if (vehicleid == p_vehicleid && !PLAYER_TEMP[i][py_TUTORIAL])
							{
								StopAudioStreamForPlayer(i);
								PlayAudioStreamForPlayer(i, RADIO_STATIONS[index][r_URL]);
							}
						}
					}
				}
			}
			else ShowDialog(playerid, DIALOG_VEHICLE_OPTIONS);
			return 1;
		}
		case DIALOG_VEHICLE_OPTIONS:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						SetEngineAction(playerid);
					}
					case 1:
					{
						SetVehicleLightsAction(playerid);
						ShowDialog(playerid, DIALOG_VEHICLE_OPTIONS);
					}
					case 2:
					{
						ShowDialog(playerid, DIALOG_RADIO_STATIONS);
					}
					case 3:
					{
						if (PLAYER_TEMP[playerid][py_GPS_MAP]) HidePlayerGpsMap(playerid);
						else ShowPlayerGpsMap(playerid);
					}
					case 4:
					{
						new 
							windows[4],
							vehicleid = GetPlayerVehicleID(playerid)
						;

						GetVehicleParamsCarWindows(vehicleid, windows[0], windows[1], windows[2], windows[3]);

						if (windows[0] == 0)
						{
							SetVehicleParamsCarWindows(vehicleid, 1, windows[1], windows[2], windows[3]);
							SetPlayerChatBubble(playerid, "\n\n\n\n* Ha cerrado la ventana de su vehículo.\n\n\n", 0xffcb90FF, 20.0, 5000);
							ShowPlayerMessage(playerid, "Ventana ~r~cerrada", 2);
						}
						else
						{
							SetVehicleParamsCarWindows(vehicleid, 0, windows[1], windows[2], windows[3]);
							SetPlayerChatBubble(playerid, "\n\n\n\n* Ha abierto la ventana de su vehículo.\n\n\n", 0xffcb90FF, 20.0, 5000);
							ShowPlayerMessage(playerid, "Ventana ~g~abierta", 2);
						}

						ShowDialog(playerid, dialogid);
					}
					case 5:
					{
						SetPlayerVehiclePark(playerid);
					}
					case 6:
					{
						new vehicleid = INVALID_VEHICLE_ID;
						if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER || GetPlayerState(playerid) == PLAYER_STATE_PASSENGER) vehicleid = GetPlayerVehicleID(playerid);

						if (vehicleid == INVALID_VEHICLE_ID) return ShowPlayerMessage(playerid, "~r~No estás en tu vehículo para aparcarlo.", 2);
						if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Este no es tú vehículo.", 2);
						if (PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~Este no es tú vehículo.", 2);
						ShowDialog(playerid, DIALOG_VEHICLE_KEYS);
					}
				}
			}
			return 1;
		}
		case DIALOG_MINER_STORE:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						if (CHARACTER_INFO[playerid][ch_CASH] <= 150) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);

						if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);
						AddPlayerItem(playerid, 36);
		            	GivePlayerCash(playerid, -150, false);
					}
					case 1..8:
					{
						new price = listitem * 1500; 
						if (CHARACTER_INFO[playerid][ch_CASH] <= price) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);

						if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);

						PLAYER_MISC[playerid][MISC_MINER_MULTIPLIER] += listitem * 5;
						ShowPlayerMessage(playerid, sprintf("Ahora puedes picar hasta ~y~%d rocas~w~ de forma veloz.", PLAYER_MISC[playerid][MISC_MINER_MULTIPLIER], 4));

		            	GivePlayerCash(playerid, -price, false);
					}
				}
			}
		}
		case DIALOG_SELL_HYCOIN:
		{
			if (response)
			{
				if (sscanf(inputtext, "d", inputtext[0]))
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor numérico.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (inputtext[0] <= 0)
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor positivo.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (inputtext[0] > ACCOUNT_INFO[playerid][ac_SD])
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~No tienes esa cantidad", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				new DB_Query[140];

				ACCOUNT_INFO[playerid][ac_SD] -= inputtext[0];

				format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `SD` = '%d' WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_ID]);
				db_free_result(db_query(Database, DB_Query));

				GivePlayerCash(playerid, 150000 * inputtext[0], true);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_CONFIG);
		}
		case DIALOG_DEATH:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: ExitCrack(playerid);
					case 1: SendAlertToMedics(playerid);
				}
			}
		}
		case DIALOG_PASSENGER_OPTIONS:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						new 
							windows[4],
							seat = GetPlayerVehicleSeat(playerid),
							vehicleid = GetPlayerVehicleID(playerid)
						;

						GetVehicleParamsCarWindows(vehicleid, windows[0], windows[1], windows[2], windows[3]);

						if (windows[seat] == 0)
						{
							switch(seat)
							{
								case 0: SetVehicleParamsCarWindows(vehicleid, 1, windows[1], windows[2], windows[3]);
								case 1: SetVehicleParamsCarWindows(vehicleid, windows[0], 1, windows[2], windows[3]);
								case 2: SetVehicleParamsCarWindows(vehicleid, windows[0], windows[1], 1, windows[3]);
								case 3: SetVehicleParamsCarWindows(vehicleid, windows[0], windows[1], windows[2], 1);
							}

							SetPlayerChatBubble(playerid, "\n\n\n\n* Ha cerrado la ventana de su asiento.\n\n\n", 0xffcb90FF, 20.0, 5000);
							ShowPlayerMessage(playerid, "Ventana ~r~cerrada", 2);
						}
						else
						{
							switch(seat)
							{
								case 0: SetVehicleParamsCarWindows(vehicleid, 0, windows[1], windows[2], windows[3]);
								case 1: SetVehicleParamsCarWindows(vehicleid, windows[0], 0, windows[2], windows[3]);
								case 2: SetVehicleParamsCarWindows(vehicleid, windows[0], windows[1], 0, windows[3]);
								case 3: SetVehicleParamsCarWindows(vehicleid, windows[0], windows[1], windows[2], 0);
							}

							SetPlayerChatBubble(playerid, "\n\n\n\n* Ha abierto la ventana de su asiento.\n\n\n", 0xffcb90FF, 20.0, 5000);
							ShowPlayerMessage(playerid, "Ventana ~g~abierta", 2);
						}
					}
				}
			}
		}
		case DIALOG_BOX_CLUB:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_YELLOW"Reglas del club", ""COL_WHITE"Caballeros, bienvenidos al Club de la pelea, reglas:\n1) No hables del Club de la pelea\n2) Nunca hables del Club de la pelea", "Cerrar", "");
					case 1:
					{
						if (!PLAYER_WORKS[playerid][WORK_BOX]) return ShowPlayerMessage(playerid, "~r~No eres boxeador", 4);
						if (PLAYER_TEMP[playerid][py_BOX_BETTING]) return ShowPlayerMessage(playerid, "~r~Un apostador no puede pelear", 4);

						PLAYER_TEMP[playerid][py_BOXING] = true;
						SetPlayerPosEx(playerid, -25.222457, 88.172157, 1098.070190, 357.011596, GetPlayerInterior(playerid), GetPlayerVirtualWorld(playerid), false);
						ShowPlayerMessage(playerid, "Entra al ~y~ring~w~ para desmostrar quien manda", 5);
						ResetItemBody(playerid);
					}
					case 2: ShowDialog(playerid, DIALOG_BOX_FIGHTERS);
				}
			}
		}
		case DIALOG_BOX_FIGHTERS:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_BOX_BETTING]) return ShowPlayerMessage(playerid, "~r~Solo puedes apostar a un jugador a la vez", 5);

				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				new player = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];

				if (!IsPlayerConnected(player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado", 4);
				if (!PLAYER_TEMP[player][py_BOXING]) return ShowPlayerMessage(playerid, "~r~Jugador fuera del ring", 4);

				PLAYER_TEMP[playerid][py_BOX_PLAYER] = player;

				ShowDialog(playerid, DIALOG_BOX_BET);
				return 1;
			}
			else ShowDialog(playerid, DIALOG_BOX_CLUB);
		}
		case DIALOG_BOX_BET:
		{
			if (response)
			{
				if (!IsPlayerConnected(PLAYER_TEMP[playerid][py_BOX_PLAYER])) return ShowPlayerMessage(playerid, "~r~Jugador desconectado", 4);
				if (!PLAYER_TEMP[ PLAYER_TEMP[playerid][py_BOX_PLAYER] ][py_BOXING]) return ShowPlayerMessage(playerid, "~r~Jugador fuera del ring", 4);
				
				if (sscanf(inputtext, "d", inputtext[0]))
				{
					ShowPlayerMessage(playerid, "Introduce un valor numérico.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				if (inputtext[0] <= 0)
				{
					ShowPlayerMessage(playerid, "Introduce un valor positivo.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				if (inputtext[0] < 100)
				{
					ShowPlayerMessage(playerid, "~r~Menudo tacaño, apuesta más.", 4);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				if (inputtext[0] > 500)
				{
					ShowPlayerMessage(playerid, "~r~Demasiado, tampoco te pases.", 4);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				if (inputtext[0] > CHARACTER_INFO[playerid][ch_CASH])
				{
					ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 2, 1150);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				GivePlayerCash(playerid, -inputtext[0], false);
				PLAYER_TEMP[ PLAYER_TEMP[playerid][py_BOX_PLAYER] ][py_BOX_PAY] += inputtext[0];
				PLAYER_TEMP[playerid][py_BOX_BET] = inputtext[0];
				PLAYER_TEMP[playerid][py_BOX_BETTING] = true;

				new str_text[128];
				format(str_text, sizeof(str_text), "%s ha apostado %d$ por %s.", PLAYER_TEMP[playerid][py_NAME], inputtext[0], PLAYER_TEMP[ PLAYER_TEMP[playerid][py_BOX_PLAYER] ][py_NAME]);
				SendBoxMessage(str_text, 3);
				return 1;
			}
			else ShowDialog(playerid, DIALOG_BOX_FIGHTERS);
		}
		case DIALOG_BOOMBOX_OPTIONS:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: UpdateBoombox(PLAYER_TEMP[playerid][py_MUSIC_BOOMBOX], !BOOMBOX[ PLAYER_TEMP[playerid][py_MUSIC_BOOMBOX] ][bb_PUBLIC]);
				}

				ShowDialog(playerid, DIALOG_BOOMBOX_OPTIONS);
			} else PLAYER_TEMP[playerid][py_MUSIC_BOOMBOX] = -1;
		}
		case DIALOG_ELECTRONIC_SHOP:
		{
			if (response)
			{
				if (ELECTRONIC_PRODUCTS[listitem][ep_PRICE] > CHARACTER_INFO[playerid][ch_CASH]) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 2, 1150);
				
				switch(ELECTRONIC_PRODUCTS[listitem][ep_TYPE])
				{
					case ELECTRONIC_MP3:
					{
						if (PLAYER_OBJECT[playerid][po_MP3]) return ShowPlayerMessage(playerid, "~r~Ya tienes un MP3.", 2);

						GivePlayerCash(playerid, -ELECTRONIC_PRODUCTS[listitem][ep_PRICE]);
						PLAYER_OBJECT[playerid][po_MP3] = true;
						ShowPlayerNotification(playerid, "Has comprado un MP3.", 4);
						ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false);
						return 1;
					}
					case ELECTRONIC_BOOMBOX:
					{
						if (PLAYER_OBJECT[playerid][po_BOOMBOX]) return ShowPlayerMessage(playerid, "~r~Ya tienes un parlante.", 2);
						if (!inv_GetFreeSlot(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);

						GivePlayerCash(playerid, -ELECTRONIC_PRODUCTS[listitem][ep_PRICE]);
						PLAYER_OBJECT[playerid][po_BOOMBOX] = true;
						ShowPlayerNotification(playerid, "Has comprado un parlante.", 4);
						ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false);
						return 1;
					}
					case ELECTRONIC_GEO:
					{
						if (!inv_GetFreeSlot(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);

						GivePlayerCash(playerid, -ELECTRONIC_PRODUCTS[listitem][ep_PRICE]);
						AddPlayerItem(playerid, 40);
						ShowPlayerNotification(playerid, "Has comprado un geolocalizador.", 4);
						ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false);
						SavePlayerMisc(playerid);
						return 1;
					}
					case ELECTRONIC_CAM:
					{
						if (!inv_GetFreeSlot(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);

						GivePlayerCash(playerid, -ELECTRONIC_PRODUCTS[listitem][ep_PRICE]);
						AddPlayerItem(playerid, 32);
						ShowPlayerNotification(playerid, "Has comprado una cámara.", 4);
						ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false);
						return 1;
					}
					default: return 0;
				}
			}
		}
		case DIALOG_FURNITURE_SHOP:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				new index = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];

				if (CHARACTER_INFO[playerid][ch_CASH] <= FURNITURE_OBJECTS[index][furniture_object_PRICE]) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);

				GivePlayerCash(playerid, -FURNITURE_OBJECTS[index][furniture_object_PRICE], false);

				AddPropertyObject(
					playerid,
					FURNITURE_OBJECTS[index][furniture_object_MODELID],
					PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID],
					FURNITURE_OBJECTS[index][furniture_object_NAME],
					FURNITURE_OBJECTS[index][furniture_object_TYPE],
					GetPlayerInterior(playerid),
					GetPlayerVirtualWorld(playerid)
				);
			}
			else ShowFurnitureMenu(playerid);
		}
		case DIALOG_FURNITURE_LIST:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				PLAYER_TEMP[playerid][py_FURNITURE_SELECTED] = PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem];
				ShowDialog(playerid, DIALOG_FURNITURE_OPTIONS);
			}
			else ShowFurnitureMenu(playerid);
		}
		case DIALOG_FURNITURE_OPTIONS:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						PLAYER_TEMP[playerid][py_EDITING_OBJ] = PROPERTY_OBJECT[ PLAYER_TEMP[playerid][py_FURNITURE_SELECTED] ][pobj_ID];
						EditingMode(playerid, PLAYER_TEMP[playerid][py_EDITING_OBJ]);
					}
					case 1:
					{
						new pay = minrand(200, 400);

						GivePlayerCash(playerid, pay, false);

						DeletePropertyObject(PROPERTY_OBJECT[ PLAYER_TEMP[playerid][py_FURNITURE_SELECTED] ][pobj_DB_ID], PLAYER_TEMP[playerid][py_FURNITURE_SELECTED]);
						ShowDialog(playerid, DIALOG_FURNITURE_LIST);
					}
				}
			}
			else ShowDialog(playerid, DIALOG_FURNITURE_LIST);
		}
		case DIALOG_SELECC_ANSWER:
		{
			if (response)
			{
				if (listitem == -1) listitem = 0;
				PLAYER_TEMP[playerid][py_ANSWER_INDEX] = listitem;
				ShowDialog(playerid, DIALOG_QUESTION_CREATE);
			}
			else
			{
				SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Razón: Respuesta incorrecta");
				KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
			}
		}
		case DIALOG_QUESTION_CREATE:
		{
			if (response)
			{
				if (strlen(inputtext) >= 32)
				{
					ShowPlayerMessage(playerid, "~r~La respuesta es muy larga.", 3);
					ShowDialog(playerid, DIALOG_QUESTION_CREATE);
					return 0;
				}

				new DB_Query[160];
				format
				(
					DB_Query, sizeof DB_Query,
					"\
						INSERT INTO `SECURITY_QUESTIONS`\
						(\
							`ID_USER`, `QUESTION`, 'RESPONSE'\
						)\
						VALUES\
						(\
							'%d', '%d', '%q'\
						);\
					",
					ACCOUNT_INFO[playerid][ac_ID],
					PLAYER_TEMP[playerid][py_ANSWER_INDEX],
					inputtext
				);
				db_free_result(db_query(Database, DB_Query));

				ShowPlayerNotification(playerid, "Perfecto, ya tienes protegida tu cuenta, recuerda no darle la respuesta a nadie.", 5);
			}
			else ShowDialog(playerid, DIALOG_SELECC_ANSWER);
		}
		case DIALOG_QUESTION_RESPONSE:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_ANSWER_INDEX] == 1337) return ShowDialog(playerid, DIALOG_SELECC_ANSWER);

				if (!strcmp(inputtext, PLAYER_TEMP[playerid][py_ANSWER_RESPONSE], false))
				{
					if (strlen(inputtext) >= 32)
					{
						ShowPlayerMessage(playerid, "~r~La respuesta es muy larga.", 3);
						ShowDialog(playerid, DIALOG_QUESTION_RESPONSE);
						return 0;
					}

					ShowPlayerNotification(playerid, "Respuesta correcta, ya puedes jugar nuevamente.", 4);
					format(ACCOUNT_INFO[playerid][ac_IP], 16, "%s", PLAYER_TEMP[playerid][py_IP]);
					PLAYER_TEMP[playerid][py_STEAL_SUSPICION] = false;
				}
				else
				{
					new str_text[264];
					format(str_text, sizeof(str_text), ""COL_WHITE"La repuesta "COL_RED"%s"COL_WHITE" es incorrecta, te hemos\nenviado un correo en caso que te hayas olvidado.", inputtext);
					ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Respuesta incorrecta", str_text, "Cerrar", "");

					format(str_text, sizeof(str_text), "Hola <b>%s</b>, alguien ha intentado acceder a tu cuenta desde la IP <code>%s</code>. En el caso que eras tu y te hayas olvidado la respuesta a la pregunta de seguridad, es la siguiente (respete las mayusculas y minusculas): <code>%s</code>",
						PLAYER_TEMP[playerid][py_NAME],
						PLAYER_TEMP[playerid][py_IP],
						PLAYER_TEMP[playerid][py_ANSWER_RESPONSE]
					);
					SendEmail(ACCOUNT_INFO[playerid][ac_EMAIL], "Respuesta de seguridad", str_text);

					SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Razón: Respuesta incorrecta");
					KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
				}
			}
			else Kick(playerid);
		}
		case DIALOG_SELECC_TYPE_AMMO:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: ShowDialog(playerid, DIALOG_BLACK_MARKET_SELECT_WEA);
					case 1: ShowDialog(playerid, DIALOG_BLACK_MARKET_AMMO_STOCK);
				}
			}
			else ShowDialog(playerid, DIALOG_BLACK_MARKET_SELECT);
		}
		case DIALOG_BLACK_MARKET_SELECT:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: ShowDialog(playerid, DIALOG_BLACK_MARKET_WEAPONS);
					case 1: ShowDialog(playerid, DIALOG_BLACK_MARKET_AMMO);
				}
			}
		}
		case DIALOG_CLUB:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0: ShowDialog(playerid, DIALOG_CLUB_BUY_FOOD);
					case 1: ShowDialog(playerid, DIALOG_CLUB_BUY_DRINK);
					case 2:
					{
						if (PLAYER_TEMP[playerid][py_CLUB_INDEX] != -1)
						{
							if (PLAYER_TEMP[playerid][py_CLUB_INDEX] != -1)
							{
								BuyClub(playerid, PLAYER_TEMP[playerid][py_CLUB_INDEX]);
							}
						}
					}
				}
			}
		}
		case DIALOG_CLUB_BUY_FOOD:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;

				new
					DBResult:Result,
					DB_Query[128],
					club = PLAYER_TEMP[playerid][py_CLUB_INDEX]
				;

				format(DB_Query, 128, "SELECT * FROM `CLUB_PRODUCTS` WHERE `ID` = '%d';", PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem]);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result))
				{
					for(new i; i < db_num_rows(Result); i++ )
					{
						new 
							name[32],
							price,
							extra
						;

						price = db_get_field_assoc_int(Result, "PRICE");
						extra = db_get_field_assoc_int(Result, "EXTRA");
						db_get_field_assoc(Result, "NAME", name, 32);

						if (CHARACTER_INFO[playerid][ch_CASH] <= price) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);

						new str_text[128];
						format(str_text, 128, "Compraste %s", name);
						ShowPlayerNotification(playerid, str_text, 3);

						CLUBS_INFO[club][club_BALANCE] += price;
						format(DB_Query, sizeof(DB_Query), "\
							UPDATE `CLUB_INFO` SET\
								`BALANCE` = '%d' \
							WHERE `ID` = '%d';\
						", CLUBS_INFO[club][club_BALANCE], club);
						db_free_result(db_query(Database, DB_Query));

						Add_Hungry_Thirst(playerid, floatround(extra), 0.0);

						SetPlayerChatBubble(playerid, "\n\n\n\n* Consume comida.\n\n\n", 0xffcb90FF, 20.0, 5000);
						ShowPlayerNotification(playerid, "Consumiendo...", 3);

						ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 0, 0, 0, 0, 0, 0);
						ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 4.1, false, true, true, false, 1000);

						GivePlayerCash(playerid, -price, false);
						db_next_row(Result);
					}
				}
				db_free_result(Result);
			}
			else ShowDialog(playerid, DIALOG_CLUB);
		}
		case DIALOG_CLUB_BUY_DRINK:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;

				new
					DBResult:Result,
					DB_Query[128],
					club = PLAYER_TEMP[playerid][py_CLUB_INDEX]
				;

				format(DB_Query, 128, "SELECT * FROM `CLUB_PRODUCTS` WHERE `ID` = '%d';", PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem]);
				Result = db_query(Database, DB_Query);

				if (db_num_rows(Result))
				{
					for(new i; i < db_num_rows(Result); i++ )
					{
						new 
							name[32],
							price,
							extra
						;

						price = db_get_field_assoc_int(Result, "PRICE");
						extra = db_get_field_assoc_int(Result, "EXTRA");
						db_get_field_assoc(Result, "NAME", name, 32);

						if (CHARACTER_INFO[playerid][ch_CASH] <= price) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3, 1150);

						new str_text[128];
						format(str_text, 128, "Compraste %s", name);
						ShowPlayerNotification(playerid, str_text, 3);

						CLUBS_INFO[club][club_BALANCE] += price;
						format(DB_Query, sizeof(DB_Query), "\
							UPDATE `CLUB_INFO` SET\
								`BALANCE` = '%d' \
							WHERE `ID` = '%d';\
						", CLUBS_INFO[club][club_BALANCE], club);
						db_free_result(db_query(Database, DB_Query));

						Add_Hungry_Thirst(playerid, 0.0, floatround(extra));

						SetPlayerChatBubble(playerid, "\n\n\n\n* Consume comida.\n\n\n", 0xffcb90FF, 20.0, 5000);
						ShowPlayerNotification(playerid, "Consumiendo...", 3);

						ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 0, 0, 0, 0, 0, 0);
						ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 4.1, false, true, true, false, 1000);

						GivePlayerCash(playerid, -price, false);
						db_next_row(Result);
					}
				}
				db_free_result(Result);
			}
			else ShowDialog(playerid, DIALOG_CLUB);
		}
		case DIALOG_CLUB_NAME:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_CLUB_INDEX] != -1)
				{
					new club = PLAYER_TEMP[playerid][py_CLUB_INDEX];
					
					if (strlen(inputtext) >= 32)
					{
						ShowPlayerMessage(playerid, "~r~Como máximo puedes introducir 32 caracteres.", 3);
						ShowDialog(playerid, dialogid);
						return 1;
					}

					if (sscanf(inputtext, "s[32]", CLUBS_INFO[club][club_NAME]))
					{
						ShowPlayerMessage(playerid, "~r~Tienes que introducir algo.", 3);
						ShowDialog(playerid, dialogid);
						return 1;
					}

					new DB_Query[128];
	    			format(DB_Query, sizeof(DB_Query), "\
						UPDATE `CLUB_INFO` SET\
							`NAME` = '%q' \
						WHERE `ID` = '%d';\
					", CLUBS_INFO[club][club_NAME], club);
					db_free_result(db_query(Database, DB_Query));

					new str_text[264];
					format(str_text, 264, ""COL_WHITE"%s (%s)\nEntrada: %s\nPropietario:{35A7FF} %s", CLUBS_INFO[club][club_NAME], (CLUBS_INFO[club][club_STATE] ? ""COL_GREEN"Abierto"COL_WHITE"" : ""COL_RED"Cerrado"COL_WHITE""), GetClubEnterPrice(club), PLAYER_TEMP[playerid][py_NAME]);
					UpdateDynamic3DTextLabelText(CLUBS_INFO[club][club_EXT_LABEL_ID], 0xF0F0F000, str_text);

					CheckClubOptions(playerid);
				}
			}
			else CheckClubOptions(playerid);
		}
		case DIALOG_CLUB_WELCOME:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_CLUB_INDEX] != -1)
				{
					new club = PLAYER_TEMP[playerid][py_CLUB_INDEX];
					
					if (strlen(inputtext) >= 64)
					{
						ShowPlayerMessage(playerid, "~r~Como máximo puedes introducir 64 caracteres.", 3);
						ShowDialog(playerid, dialogid);
						return 1;
					}

					if (sscanf(inputtext, "s[64]", CLUBS_INFO[club][club_WELCOME]))
					{
						ShowPlayerMessage(playerid, "~r~Tienes que introducir algo.", 3);
						ShowDialog(playerid, dialogid);
						return 1;
					}

					new DB_Query[128];
	    			format(DB_Query, sizeof(DB_Query), "\
						UPDATE `CLUB_INFO` SET\
							`WELCOME` = '%q' \
						WHERE `ID` = '%d';\
					", CLUBS_INFO[club][club_WELCOME], club);
					db_free_result(db_query(Database, DB_Query));

					ShowPlayerMessage(playerid, "Has cambiado el mensaje de bienvenida.", 3);

					CheckClubOptions(playerid);
				}
			}
			else CheckClubOptions(playerid);
		}
		case DIALOG_CLUB_PRODUCTS:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						new DBResult:Result, DB_Query[128];
						format(DB_Query, 128, "SELECT * FROM `CLUB_PRODUCTS` WHERE `CLUB_ID` = '%d';", CLUBS_INFO[ PLAYER_TEMP[playerid][py_CLUB_INDEX] ][club_ID]);
						Result = db_query(Database, DB_Query);

						if (db_num_rows(Result) >= MAX_CLUB_PRODUCTS)
						{
							ShowDialog(playerid, dialogid);
							ShowPlayerMessage(playerid, sprintf("~r~Solo puedes poner hasta %d productos.", MAX_CLUB_PRODUCTS), 4);
							return 1;
						}
						db_free_result(Result);

						ShowDialog(playerid, DIALOG_PRODUCT_NAME);
					}
					case 1: ShowDialog(playerid, DIALOG_PRODUCT_DELETE);
				}
			}
			else CheckClubOptions(playerid);
		}
		case DIALOG_CLUB_RADIO:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_CLUB_INDEX] != -1)
				{
					new 
						club = PLAYER_TEMP[playerid][py_CLUB_INDEX],
						index = (listitem - 1)
					;

					if (listitem == 0)
					{
						CLUBS_INFO[club][club_RADIO] = 100;
						ShowPlayerMessage(playerid, "Radio ~r~apagada", 2);

						for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
						{
							if (IsPlayerConnected(i))
							{
								if (PLAYER_TEMP[i][py_CLUB_INDEX] == PLAYER_TEMP[playerid][py_CLUB_INDEX])
								{
									StopAudioStreamForPlayer(i);
								}
							}
						}
					}
					else
					{
						CLUBS_INFO[club][club_RADIO] = index;
						ShowPlayerMessage(playerid, "Emisora ~g~cambiada", 2);

						for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
						{
							if (IsPlayerConnected(i))
							{
								if (PLAYER_TEMP[i][py_CLUB_INDEX] == PLAYER_TEMP[playerid][py_CLUB_INDEX])
								{
									StopAudioStreamForPlayer(i);
									PlayAudioStreamForPlayer(i, RADIO_STATIONS[index][r_URL]);
								}
							}
						}
					}

					new DB_Query[128];
	    			format(DB_Query, sizeof(DB_Query), "\
						UPDATE `CLUB_INFO` SET\
							`RADIO` = '%d' \
						WHERE `ID` = '%d';\
					", CLUBS_INFO[club][club_RADIO], club);
					db_free_result(db_query(Database, DB_Query));

					CheckClubOptions(playerid);
				}
			}
			else CheckClubOptions(playerid);
		}
		case DIALOG_CLUB_PRICE:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_CLUB_INDEX] != -1)
				{
					new club = PLAYER_TEMP[playerid][py_CLUB_INDEX];

					if (sscanf(inputtext, "d", inputtext[0]))
					{
						PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
						ShowPlayerMessage(playerid, "Introduce un valor numérico.", 2);
						ShowDialog(playerid, dialogid);
						return 1;
					}
					if (inputtext[0] < 0)
					{
						PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
						ShowPlayerMessage(playerid, "Introduce un valor positivo.", 2);
						ShowDialog(playerid, dialogid);
						return 1;
					}

					CLUBS_INFO[club][club_ENTER_PRICE] = inputtext[0];

					new DB_Query[128];
	    			format(DB_Query, sizeof(DB_Query), "\
						UPDATE `CLUB_INFO` SET\
							`ENTER_PRICE` = '%d' \
						WHERE `ID` = '%d';\
					", CLUBS_INFO[club][club_ENTER_PRICE], club);
					db_free_result(db_query(Database, DB_Query));				

					new str_text[264];
					format(str_text, 264, ""COL_WHITE"%s (%s)\nEntrada: %s\nPropietario:{35A7FF} %s", CLUBS_INFO[club][club_NAME], (CLUBS_INFO[club][club_STATE] ? ""COL_GREEN"Abierto"COL_WHITE"" : ""COL_RED"Cerrado"COL_WHITE""), GetClubEnterPrice(club), PLAYER_TEMP[playerid][py_NAME]);
					UpdateDynamic3DTextLabelText(CLUBS_INFO[club][club_EXT_LABEL_ID], 0xF0F0F000, str_text);

					ShowPlayerMessage(playerid, "Valor de entrada cambiado.", 3);

					CheckClubOptions(playerid);
				}
			}
			else CheckClubOptions(playerid);
		}
		case DIALOG_PRODUCT_NAME:
		{
			if (response)
			{
				if (strlen(inputtext) >= 32)
				{
					ShowPlayerMessage(playerid, "~r~Como máximo puedes introducir 32 caracteres.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				if (sscanf(inputtext, "s[32]", PLAYER_TEMP[playerid][py_PRODUCT_NAME]))
				{
					ShowPlayerMessage(playerid, "~r~Tienes que introducir algo.", 3);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				ShowDialog(playerid, DIALOG_PRODUCT_PRICE);
			}
			else ShowDialog(playerid, DIALOG_CLUB_PRODUCTS);
		}
		case DIALOG_PRODUCT_PRICE:
		{
			if (response)
			{
				if (sscanf(inputtext, "d", inputtext[0]))
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor numérico.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (inputtext[0] <= 0)
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor positivo.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				PLAYER_TEMP[playerid][py_PRODUCT_PRICE] = inputtext[0];
				ShowDialog(playerid, DIALOG_PRODUCT_TYPE);
			}
			else ShowDialog(playerid, DIALOG_PRODUCT_NAME);
		}
		case DIALOG_PRODUCT_TYPE:
		{
			if (response)
			{
				PLAYER_TEMP[playerid][py_PRODUCT_TYPE] = listitem;
				ShowDialog(playerid, DIALOG_PRODUCT_EXTRA);
			}
			else ShowDialog(playerid, DIALOG_CLUB_PRICE);
		}
		case DIALOG_PRODUCT_EXTRA:
		{
			if (response)
			{
				if (sscanf(inputtext, "d", inputtext[0]))
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor numérico.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (inputtext[0] <= 0)
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "Introduce un valor positivo.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}
				if (inputtext[0] > 25)
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Tiene que ser menor a 25.", 2);
					ShowDialog(playerid, dialogid);
					return 1;
				}

				PLAYER_TEMP[playerid][py_PRODUCT_EXTRA] = inputtext[0];

				AddClubProduct(
					CLUBS_INFO[ PLAYER_TEMP[playerid][py_CLUB_INDEX] ][club_ID],
					PLAYER_TEMP[playerid][py_PRODUCT_NAME],
					PLAYER_TEMP[playerid][py_PRODUCT_TYPE],
					PLAYER_TEMP[playerid][py_PRODUCT_EXTRA],
					PLAYER_TEMP[playerid][py_PRODUCT_PRICE]
				);

				ShowPlayerMessage(playerid, "Producto ~g~agregado", 3);
				ShowDialog(playerid, DIALOG_CLUB_PRODUCTS);
			}
			else ShowDialog(playerid, DIALOG_CLUB_PRICE);
		}
		case DIALOG_PRODUCT_DELETE:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;
				DeleteClubProduct(PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem]);

				ShowPlayerMessage(playerid, "Producto ~r~eliminado", 3);
				ShowDialog(playerid, DIALOG_CLUB_PRODUCTS);
			}
			else ShowDialog(playerid, DIALOG_CLUB_PRODUCTS);
		}
		case DIALOG_VEHICLE_KEYS:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						new vehicleid = INVALID_VEHICLE_ID;
						vehicleid = GetPlayerVehicleID(playerid);
						if (vehicleid == INVALID_VEHICLE_ID) return 0;

						if (GetUsedKeys(PLAYER_VEHICLES[vehicleid][player_vehicle_ID]) >= 5)
						{
							ShowPlayerMessage(playerid, "~r~No puedes dar mas de 5 llaves", 4);
							ShowDialog(playerid, DIALOG_VEHICLE_KEYS);
							return 1;
						}
						
						ShowDialog(playerid, DIALOG_VEHICLE_KEYS_ADD);
					}
					case 1: ShowDialog(playerid, DIALOG_VEHICLE_KEYS_DEL);
				}
			}
			else ShowDialog(playerid, DIALOG_VEHICLE_OPTIONS);
		}
		case DIALOG_VEHICLE_KEYS_ADD:
		{
			if (response)
			{
				new to_player;
			    if (sscanf(inputtext, "u", to_player))
			    {
			    	ShowPlayerMessage(playerid, "~r~Ingrese un nombre", 4);
			    	ShowDialog(playerid, dialogid);
			    	return 1;
			    }

			    if (!IsPlayerConnected(to_player))
			    {
			    	ShowPlayerMessage(playerid, "~r~Jugador desconectado", 4);
			    	ShowDialog(playerid, dialogid);
			    	return 1;
			    }

			    if (playerid == to_player)
			    {
			    	ShowPlayerMessage(playerid, "~r~Selecciona a otro usaurio", 4);
			    	ShowDialog(playerid, dialogid);
			    	return 1;
			    }

			    new vehicleid = INVALID_VEHICLE_ID;
				vehicleid = GetPlayerVehicleID(playerid);
				if (vehicleid == INVALID_VEHICLE_ID) return 0;

			    if (IsPlayerInKeys(PLAYER_VEHICLES[vehicleid][player_vehicle_ID], ACCOUNT_INFO[to_player][ac_ID]))
			    {
			    	ShowPlayerMessage(playerid, "~r~Ese jugador ya tiene las llaves", 4);
			    	ShowDialog(playerid, dialogid);
			    	return 1;	
			    }

				AddPlayerKey(PLAYER_VEHICLES[vehicleid][player_vehicle_ID], ACCOUNT_INFO[to_player][ac_ID]);
				ShowPlayerMessage(playerid, "Llave ~g~agregada", 4);

				ShowPlayerNotification(to_player, sprintf("%s te ha dado una copia de las llaves de su ~r~%s", PLAYER_TEMP[playerid][py_NAME], VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400 ][vehicle_info_NAME]), 5);
			}
			else ShowDialog(playerid, DIALOG_VEHICLE_KEYS);
		}
		case DIALOG_VEHICLE_KEYS_DEL:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem] == -1) return 1;

				new vehicleid = INVALID_VEHICLE_ID;
				vehicleid = GetPlayerVehicleID(playerid);
				if (vehicleid == INVALID_VEHICLE_ID) return 0;

				RemovePlayerKey(PLAYER_VEHICLES[vehicleid][player_vehicle_ID], PLAYER_TEMP[playerid][py_PLAYER_LISTITEM][listitem]);
				ShowPlayerMessage(playerid, "Llave ~r~eliminada", 4);
			}
			else ShowDialog(playerid, DIALOG_VEHICLE_KEYS);
		}
		case DIALOG_REGISTER_CIVIL:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						if (PLAYER_MISC[playerid][MISC_DNI] != 0) return ShowPlayerMessage(playerid, "~r~Ya tienes un documento.", 3);
						if (500 > CHARACTER_INFO[playerid][ch_CASH]) return ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
						
						PLAYER_MISC[playerid][MISC_DNI] = minrand(10000000, 99999999);

						ShowPlayerNotification(playerid, "Felicidades, ahora tienes documento, lo puedes ver en /est.", 6);

						GivePlayerCash(playerid, -500);
						SavePlayerMisc(playerid);
					}
					case 1:
					{
						if (PLAYER_MISC[playerid][MISC_DRIVE] != 0) return ShowPlayerMessage(playerid, "~r~Ya tienes una licencia de conducir.", 3);
						if (1000 > CHARACTER_INFO[playerid][ch_CASH]) return ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
					
						PLAYER_MISC[playerid][MISC_DRIVE] = 1;

						ShowPlayerNotification(playerid, "Felicidades, ahora tienes licencia de conducir.", 6);

						GivePlayerCash(playerid, -1000);
						SavePlayerMisc(playerid);
					}
				}
			}
		}
		/*case DIALOG_SELL_PUMPKIN:
		{
			if (response)
			{
				new 
					payment = (PLAYER_MISC[playerid][MISC_PUMPKIN] * 1000),
					vip_payment = 0
				;

	    		if (ACCOUNT_INFO[playerid][ac_SU])
				{
					vip_payment = (PLAYER_MISC[playerid][MISC_PUMPKIN] * 1500);				
				}

				payment = (payment + vip_payment);

				PLAYER_MISC[playerid][MISC_PUMPKIN] = 0;
				ResetItemBody(playerid);
            	GivePlayerCash(playerid, payment, true);

     			GivePlayerReputation(playerid);

     			new is_hycoin_best = minrand(0, 10);
			    if (is_hycoin_best == 5)
			    {
			    	new 
			    		random_hycoin = minrand(3, 8),
			    		coin_text[64];

			    	ACCOUNT_INFO[playerid][ac_SD] += random_hycoin;
			    	format(coin_text, sizeof(coin_text), "Acabas de ganar %d Hycoins.", random_hycoin);
			    	ShowPlayerNotification(playerid, coin_text, 4);
					new DB_Query[128];
					format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `SD` = '%d' WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_ID]);
					db_free_result(db_query(Database, DB_Query));
			    }
			}
		}*/
		case DIALOG_CLUB_SELL:
		{
			if (response)
			{
				if (PLAYER_TEMP[playerid][py_CLUB_INDEX] == -1) return 0;

				new 
					DB_Query[264],
					str_text[128],				
					extra = CLUBS_INFO[ PLAYER_TEMP[playerid][py_CLUB_INDEX] ][club_PRICE]
				;

				ACCOUNT_INFO[playerid][ac_SD] += extra;

				format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `SD` = '%d' WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_ID]);
				db_free_result(db_query(Database, DB_Query));

				format(str_text, sizeof(str_text), "Acabas de vender el local por ~y~%d Hycoins", extra);
				ShowPlayerMessage(playerid, str_text, 6);

				ReleaseClub(PLAYER_TEMP[playerid][py_CLUB_INDEX]);
			}
			else CheckClubOptions(playerid);
		}
		case DIALOG_BUY_ROCKET:
		{
			if (response)
			{
				switch(listitem)
				{
					case 0:
					{
						if (1000 > CHARACTER_INFO[playerid][ch_CASH]) return ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
						if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);
						AddPlayerItem(playerid, 42, 10);
						GivePlayerCash(playerid, -1000);
						SavePlayerMisc(playerid);
					}
					case 1:
					{
						if (2000 > CHARACTER_INFO[playerid][ch_CASH]) return ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
						if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);
						AddPlayerItem(playerid, 43, 5);
						GivePlayerCash(playerid, -2000);
						SavePlayerMisc(playerid);
					}
					case 2:
					{
						if (1000 > CHARACTER_INFO[playerid][ch_CASH]) return ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
						if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);
						AddPlayerItem(playerid, 44, 5);
						GivePlayerCash(playerid, -1000);
						SavePlayerMisc(playerid);
					}
					case 3:
					{
						if (500 > CHARACTER_INFO[playerid][ch_CASH]) return ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
						if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);
						AddPlayerItem(playerid, 45, 10);
						GivePlayerCash(playerid, -500);
						SavePlayerMisc(playerid);
					}
					case 4:
					{
						if (800 > CHARACTER_INFO[playerid][ch_CASH]) return ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
						if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);
						AddPlayerItem(playerid, 46, 10);
						GivePlayerCash(playerid, -800);
						SavePlayerMisc(playerid);
					}
					case 5:
					{
						if (1500 > CHARACTER_INFO[playerid][ch_CASH]) return ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
						if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);
						AddPlayerItem(playerid, 47, 10);
						GivePlayerCash(playerid, -1500);
						SavePlayerMisc(playerid);
					}
				}
			}
		}
		case DIALOG_CHANGE_ACCOUNT:
		{
			if (response)
			{
				printf("[account.pre.change] %s > %s", PLAYER_TEMP[playerid][py_NAME], inputtext);

				PLAYER_TEMP[playerid][py_USER_VALID_NAME] = true;

				if (strlen(inputtext) > 24) PLAYER_TEMP[playerid][py_USER_VALID_NAME] = false;
				if (strlen(inputtext) < 5) PLAYER_TEMP[playerid][py_USER_VALID_NAME] = false;

				if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] <= CMD_OWNER)
				{
					if (CheckNameFilterViolation(inputtext)) PLAYER_TEMP[playerid][py_USER_VALID_NAME] = false;
					if (!IsValidRPName(inputtext)) PLAYER_TEMP[playerid][py_USER_VALID_NAME] = false;
				}

				if (!PLAYER_TEMP[playerid][py_USER_VALID_NAME])
				{
					ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED""SERVER_NAME"", ""COL_WHITE"Tu nombre no es adecuado usa: "COL_RED"N"COL_WHITE"ombre_"COL_RED"A"COL_WHITE"pellido.\n\
						Recuerda que los nombres como Miguel_Gamer o que contentan insultos\n\
						no están permitidos, procura ponerte un nombre que parezca real.", "Cerrar", "");
					return 0;
				}

				printf("[account.post.change] %s > %s", PLAYER_TEMP[playerid][py_NAME], inputtext);

				SetPlayerName(playerid, inputtext);

				OnPlayerDisconnect(playerid, 0);
				OnPlayerConnect(playerid);
				OnPlayerRequestClass(playerid, 0);
			}
		}
		case DIALOG_BUY_NAME_COLOR:
		{
			if (response)
			{
				if (ACCOUNT_INFO[playerid][ac_SD] < 5) return ShowPlayerMessage(playerid, "~r~No tienes los Hycoins suficientes.", 4);
				
				ACCOUNT_INFO[playerid][ac_SD] -= 5;

				new DB_Query_update[160];
				format(DB_Query_update, sizeof(DB_Query_update), "UPDATE `ACCOUNTS` SET `SD` = '%d' WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_ID]);
				db_free_result(db_query(Database, DB_Query_update));

				PLAYER_MISC[playerid][MISC_GLOBAL_NAME_COLOR] = listitem;
				SavePlayerMisc(playerid);

				ShowPlayerMessage(playerid, sprintf("Has comprado el color %s.", COLOR_INFO[listitem][color_NAME]), 4);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_CONFIG);
		}
		case DIALOG_BUY_CHAT_COLOR:
		{
			if (response)
			{
				if (ACCOUNT_INFO[playerid][ac_SD] < 5) return ShowPlayerMessage(playerid, "~r~No tienes los Hycoins suficientes.", 4);
				
				ACCOUNT_INFO[playerid][ac_SD] -= 5;

				new DB_Query_update[160];
				format(DB_Query_update, sizeof(DB_Query_update), "UPDATE `ACCOUNTS` SET `SD` = '%d' WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_ID]);
				db_free_result(db_query(Database, DB_Query_update));

				PLAYER_MISC[playerid][MISC_GLOBAL_CHAT_COLOR] = listitem;
				SavePlayerMisc(playerid);

				ShowPlayerMessage(playerid, sprintf("Has comprado el color %s.", COLOR_INFO[listitem][color_NAME]), 4);
			}
			else ShowDialog(playerid, DIALOG_PLAYER_CONFIG);
		}
	}
	return 0;
}
