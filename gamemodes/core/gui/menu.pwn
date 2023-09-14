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
				ShowPlayerMessage(playerid, "~r~El vehículo no tiene ningún paintjob.", 3);
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
			ShowPlayerMessage(playerid, "Vehículo ~g~reparado", 2);
			ShowTuningMenu(playerid);
        }

        else if (listitem == 1)
        {
        	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Solo puedes tunear tus vehículos personales.", 3);
        	
        	ShowDialog(playerid, DIALOG_TUNING_SELECT_COL_SLOT);
        }

        else if (listitem == 2)
        {
        	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Solo puedes tunear tus vehículos personales.", 3);

			new paintjobs = VehiclePaintjob(GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID]);
			if (paintjobs == 0)
			{
				ShowPlayerMessage(playerid, "~r~Este vehículo no soporta paintjobs.", 3);
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
        	//ShowPlayerMessage(playerid, "~r~Esto no esta disponible", 4);
        	ShowObjTuning(playerid);
        }

       	else if (listitem == 4)
        {
        	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Solo puedes tunear tus vehículos personales.", 3);
        	ShowDialog(playerid, DIALOG_TUNING_REMOVE);
        }

        else
		{
			new new_listitem = listitem - 5;
			if (isnull(PLAYER_TUNING_MENU[playerid][new_listitem][tuning_menu_NAME])) return 1;
			if (!GLOBAL_VEHICLES[vehicleid][gb_vehicle_VALID]) return 1;

			new Float:Vehicle_Pos[3];
			GetVehiclePos(vehicleid, Vehicle_Pos[0], Vehicle_Pos[1], Vehicle_Pos[2]);
			if (!IsPlayerInRangeOfPoint(playerid, 5.0, Vehicle_Pos[0], Vehicle_Pos[1], Vehicle_Pos[2])) return ShowPlayerMessage(playerid, "~r~El vehículo está muy lejos.", 3);

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

				ShowDialog(playerid, DIALOG_BUY_VOBJECT);
			}
			case 2:
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

				PLAYER_TEMP[playerid][py_COUNTRY_TYPE] = 1;
				ShowDialog(playerid, DIALOG_VOBJECT_COUNTRY);
			}
            case 3:
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
				UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], slot, true);

				ShowPlayerMessage(playerid, "El objeto de texto fue añadido.", 2);
				PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] = slot;
				ShowDialog(playerid, DIALOG_VOBJECT_OBJECT);
			}
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
			case 5:
			{
				ShowDialog(playerid, DIALOG_PROPERTY_KEYS);
			}
    	}
    }
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