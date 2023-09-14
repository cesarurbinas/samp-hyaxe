ClickInventorySlot(playerid, td_init, bool:simple = false)
{
	new slot;
	if (simple == false) slot = (td_init - 10);
	else slot = td_init;
	
	if (PLAYER_VISUAL_INV[playerid][slot_VALID][slot])
	{
		if (PLAYER_TEMP[playerid][py_ROCK]) return ShowPlayerMessage(playerid, "~r~Primero debes entregar la roca.", 3);
		new item_str[64];
		format(item_str, sizeof(item_str), "~n~~n~~n~~n~~n~~n~~w~%s", GetItemNameByType(PLAYER_VISUAL_INV[playerid][slot_TYPE][slot]));
		GameTextForPlayer(playerid, TextToSpanish(item_str), 2000, 5);

		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
		ResetItemBody(playerid);

		if (PLAYER_TEMP[playerid][py_PLAYER_IN_INV])
		{
			PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][10], COLOR_GREY_TWO);
			PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][11], COLOR_GREY_TWO);
			PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][12], COLOR_GREY_TWO);
			PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][13], COLOR_GREY_TWO);
			PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][14], COLOR_GREY_TWO);
			PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][15], COLOR_GREY_TWO);
			PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][16], COLOR_GREY_TWO);
			PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][17], COLOR_GREY_TWO);
			PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][18], COLOR_GREY_TWO);
			PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][19], COLOR_GREY_TWO);
			PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][20], COLOR_GREY_TWO);
			PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][21], COLOR_GREY_TWO);
			PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_init], COLOR_RED);
			HideInventory(playerid);
		}
		
		SetItemToBody(playerid, PLAYER_VISUAL_INV[playerid][slot_TYPE][slot]);

		if (PLAYER_VISUAL_INV[playerid][slot_WEAPON][slot])
		{
			if (IsPlayerInRangeOfPoint(playerid, 30.0, -17.344648, 99.261329, 1100.822021)) return ShowPlayerMessage(playerid, "~r~No puedes sacar armas en el club.", 3);

			ResetPlayerWeapons(playerid);
			CheckBlockedWeapon(playerid, PLAYER_WEAPONS[playerid][ PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot] ][player_weapon_ID]);
			
			if (CHARACTER_INFO[playerid][ch_STATE] != ROLEPLAY_STATE_CRACK)
			{
				if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
				{
					GivePlayerWeapon(playerid, PLAYER_WEAPONS[playerid][ PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot] ][player_weapon_ID], PLAYER_WEAPONS[playerid][ PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot] ][player_weapon_AMMO]);
				}
				else if (PLAYER_WORKS[playerid][WORK_POLICE] || PLAYER_WORKS[playerid][WORK_MAFIA] || PLAYER_WORKS[playerid][WORK_ENEMY_MAFIA] || PLAYER_WORKS[playerid][WORK_OSBORN])
				{
					GivePlayerWeapon(playerid, PLAYER_WEAPONS[playerid][ PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot] ][player_weapon_ID], PLAYER_WEAPONS[playerid][ PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot] ][player_weapon_AMMO]);
				}
			}
		}

		PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] = slot;
	}
	else
	{
		ResetItemBody(playerid);
		GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~w~Vacio", 2000, 5);
		PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
		HideInventory(playerid);
		return 1;
	}
	return 1;
}

DropItemSlot(playerid, anim = true)
{
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT)
	{
		if (anim) return 0;
	}
	
	new 
		Float:pos[3],
		slot = PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT];

	if (PLAYER_VISUAL_INV[playerid][slot_TYPE][slot] == 50) return 0;

	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);

	if (GetPlayerInterior(playerid) == 0)
	{
		new Float:fPX, Float:fPY, Float:fPZ, Float:fVX, Float:fVY, Float:fVZ;
		GetPlayerCameraPos(playerid, fPX, fPY, fPZ);
	    GetPlayerCameraFrontVector(playerid, fVX, fVY, fVZ);

	    pos[0] = fPX + floatmul(fVX, 5.0);
	    pos[1] = fPY + floatmul(fVY, 5.0);
	}

	if (anim) ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 1000, true);
	
	if (PLAYER_VISUAL_INV[playerid][slot_WEAPON][slot] == true)
	{
		CreateDropItem(GetItemObjectByType(PLAYER_VISUAL_INV[playerid][slot_TYPE][slot]), pos[0], pos[1], pos[2] - 1, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), GetItemNameByType(PLAYER_VISUAL_INV[playerid][slot_TYPE][slot]), PLAYER_TEMP[playerid][py_NAME], PLAYER_VISUAL_INV[playerid][slot_TYPE][slot], PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][slot]);
	}
	else
	{
		CreateDropItem(GetItemObjectByType(PLAYER_VISUAL_INV[playerid][slot_TYPE][slot]), pos[0], pos[1], pos[2] - 1, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), GetItemNameByType(PLAYER_VISUAL_INV[playerid][slot_TYPE][slot]), PLAYER_TEMP[playerid][py_NAME], PLAYER_VISUAL_INV[playerid][slot_TYPE][slot]);
	}

	SubtractItem(playerid, PLAYER_VISUAL_INV[playerid][slot_TYPE][slot], slot);
	ResetItemBody(playerid);
	PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]--;
	return 1;
}

UseItemSlot(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][41]);
	new slot = PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT];

	switch(PLAYER_VISUAL_INV[playerid][slot_TYPE][slot])
	{
		case 0:
		{
			new 
				target_player = GetPlayerCameraTargetPlayer(playerid),
				Float:pos[4];
		
			PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] = target_player;
			GetPlayerPos(target_player, pos[0], pos[1], pos[2]);

			if (IsPlayerInRangeOfPoint(playerid, 1.2, pos[0], pos[1], pos[2]))
			{
				KillTimer(PLAYER_TEMP[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][py_TIMERS][16]);
				PLAYER_TEMP[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][py_TIMERS][16] = SetTimerEx("StandUpBotikin", 5000, false, "ii", playerid, PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]);

				ApplyAnimation(playerid, "MEDIC", "CPR", 4.1, false, 0, 0, 0, 0, 1);
				SetPlayerChatBubble(playerid, "\n\n\n\n* Usa un botiquí­n.", 0xffcb90FF, 20.0, 2000);
			}
			return 1;
		}

		case 1:
		{
			if (PLAYER_MISC[playerid][MISC_MEDICINE] <= 0) return ShowPlayerMessage(playerid, "~r~No tienes medicamentos.", 3);
			if ((gettime() - PLAYER_TEMP[playerid][py_LIMIT_REMEDY]) < 60 * 1) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 1 minuto para volver a consumir medicamentos.", 3);
			//if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK) return ShowPlayerMessage(playerid, "~r~No puedes hacer eso estando herido.", 3);

			PLAYER_MISC[playerid][MISC_MEDICINE] --;
			SavePlayerMisc(playerid);
			GivePlayerHealthEx(playerid, 10.0);
			SetPlayerChatBubble(playerid, "\n\n\n\n* Se toma un medicamento.", 0xffcb90FF, 20.0, 2000);
			ShowPlayerMessage(playerid, "Consumiste un medicamento.", 2);
			ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 0, 0, 0, 0, 0, 0);
			ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 4.1, false, true, true, false, 1000);
			PLAYER_TEMP[playerid][py_LIMIT_REMEDY] = gettime();
			ResetItemBody(playerid);
			return 1;
		}

		case 2:
		{
			if (PLAYER_MISC[playerid][MISC_VENDAS] <= 0) return ShowPlayerMessage(playerid, "~r~No tienes vendas.", 3);
			if ((gettime() - PLAYER_TEMP[playerid][py_LIMIT_BAND]) < 10) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 10 segundos para volver a usar vendas.", 3);
			//if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK) return ShowPlayerMessage(playerid, "~r~No puedes hacer eso estando herido.", 3);

			PLAYER_MISC[playerid][MISC_VENDAS] --;
			SavePlayerMisc(playerid);
			GivePlayerHealthEx(playerid, 5.0);
			SetPlayerChatBubble(playerid, "\n\n\n\n* Usa una venda.", 0xffcb90FF, 20.0, 2000);
			ShowPlayerMessage(playerid, "Usaste una venda.", 2);
			PLAYER_TEMP[playerid][py_LIMIT_BAND] = gettime();
			ResetItemBody(playerid);
			return 1;
		}

		case 3:
		{
			if (PLAYER_MISC[playerid][MISC_CANNABIS] <= 0) return ShowPlayerMessage(playerid, "~r~No tienes marihuana.", 3);
			if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK) return ShowPlayerMessage(playerid, "~r~No puedes hacer eso estando herido.", 3);

			PLAYER_MISC[playerid][MISC_CANNABIS] --;
			PLAYER_MISC[playerid][MISC_JOINT] ++;
			SavePlayerMisc(playerid);
			SetPlayerChatBubble(playerid, "\n\n\n\n* Crea un porro.", 0xffcb90FF, 20.0, 2000);
			ShowPlayerMessage(playerid, "Creaste un porro", 3);
			ResetItemBody(playerid);
			return 1;
		}

		case 4:
		{
			if (PLAYER_MISC[playerid][MISC_CRACK] <= 0) return ShowPlayerMessage(playerid, "~r~No tienes crack.", 3);
			if ((gettime() - PLAYER_TEMP[playerid][py_LIMIT_CRACK]) < 60 * 1) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 1 minuto para volver a consumir crack.", 3);
			//if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK) return ShowPlayerMessage(playerid, "~r~No puedes hacer eso estando herido.", 3);
			
			PLAYER_MISC[playerid][MISC_CRACK] --;
			SavePlayerMisc(playerid);
			GivePlayerHealthEx(playerid, 25.0);
			SetPlayerChatBubble(playerid, "\n\n\n\n* Consume crack", 0xffcb90FF, 20.0, 2000);
			ShowPlayerMessage(playerid, "Consumiste crack.", 2);
			GivePlayerDrunkLevel(playerid, 10000);
			ApplyAnimation(playerid,"ped","Smoke_in_car",4.1,1,1,1,1,1);
			SetTimerEx("StopDrugEffect", 15000, false, "i", playerid);
			PLAYER_TEMP[playerid][py_LIMIT_CRACK] = gettime();
			ResetItemBody(playerid);
			return 1;
		}

		case 5:
		{
			if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerNotification(playerid, "Tienes que estar fuera del vehí­culo para vertir el bidón.", 3);

			new vehicleid = GetPlayerCameraTargetVehicle(playerid);
			if (vehicleid == INVALID_VEHICLE_ID) return ShowPlayerNotification(playerid, "No estás cerca de ningún vehí­culo.", 3);

			if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE])
			{
				ShowPlayerNotification(playerid, "Por favor, para primero el motor del vehí­culo.", 3);
				return 1;
			}

			ShowDialog(playerid, DIALOG_FUEL_DRUM);
			ResetItemBody(playerid);
			return 1;
		}

		case 50:
		{
			ShowPhone(playerid);
			return 1;
		}

		case 51:
		{
			if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 0;

			if (PLAYER_WORKS[playerid][WORK_FISHER])
			{
				if (!IsPlayerInWater(playerid))
				{
					if (PLAYER_TEMP[playerid][py_FISHING] == false)
					{
						if (IsPlayerInRangeOfPoint(playerid, 30.0, 1955.022094, -189.402023, -2.332746) || IsPlayerInRangeOfPoint(playerid, 30.0, 2209.482421, -231.312026, -2.332746)|| IsPlayerInRangeOfPoint(playerid, 30.0, 2209.482421, -231.312026, -2.332746)|| IsPlayerInRangeOfPoint(playerid, 30.0, 1858.291503, -69.229499, -2.332746))
						{
							PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][0], "hud:radar_centre");
							PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][1], "Pescando...");
							PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][2], "Espera a que muerdan el anzuelo...");
							TextDrawShowForPlayer(playerid, Textdraws[textdraw_PROGRESS_BG]);
							PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][0]);
							PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][1]);
							PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][2]);
							PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][3]);
							PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);
							ApplyAnimation(playerid, "SWORD", "SWORD_IDLE", 4.1, true, false, false, false, 0, true);
							SetTimerEx("StartFishing", minrand(6000, 30000), false, "i", playerid);
							PLAYER_TEMP[playerid][py_FISHING] = true;
						}
					}
				}
			}
		}

		case 6:
		{
			StartPlanting(playerid, 0);
			return 1;
		}

		case 7:
		{
			StartPlanting(playerid, 1);
			return 1;
		}

		case 8:
		{
			StartPlanting(playerid, 2);
			return 1;
		}

		case 53:
		{
			if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No estás depie.", 3);
			{
				if (PLAYER_TEMP[playerid][py_FIX_VALUE] > 0) return ShowPlayerNotification(playerid, "Espere hasta terminar.", 4);

				new vehicleid = INVALID_VEHICLE_ID;
				vehicleid = GetPlayerCameraTargetVehicle(playerid);

				if (vehicleid != INVALID_VEHICLE_ID)
				{
					new Float:pos[3];
					GetVehiclePos(vehicleid, pos[0], pos[1], pos[2]);
					if (GetPlayerDistanceFromPoint(playerid, pos[0], pos[1], pos[2]) < 10.0)
					{
						if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_OCCUPIED]) return ShowPlayerNotification(playerid, "~r~El vehí­culo está ocupado.", 4);

						if (PLAYER_MISC[playerid][MISC_FIXKIT])
						{
							PLAYER_TEMP[playerid][py_FIX_VALUE] = 0;
							KillTimer(PLAYER_TEMP[playerid][py_TIMERS][32]);
							PLAYER_TEMP[playerid][py_TIMERS][32] = SetTimerEx("FixVehicleUpdate", 1000, true, "ii", playerid, vehicleid);
						}
					}
				}
			}
			return 1;
		}

		case 56:
		{
			if ((gettime() - PLAYER_TEMP[playerid][py_LAST_GEO_USE]) < 60 * 5) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 5 minutos para volver a hacer eso.", 4);
			if (!PLAYER_CREW[playerid][player_crew_VALID]) ShowPlayerMessage(playerid, "~r~No tienes banda.", 3);
			if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar el geolocalizador.", 3);

			new city[45], zone[45];
			GetPlayerZones(playerid, city, zone);

			new message[144];
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

		default: CheckAndReload(playerid);
	}
	return 1;
}