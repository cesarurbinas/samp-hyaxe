StartPlayerJob(playerid, work, vehicleid = INVALID_VEHICLE_ID)
{
	switch(work)
	{
		case WORK_TRUCK:
		{
			if (TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADED])
			{
				if (TRUCK_VEHICLE[vehicleid][truck_vehicle_DELIVERED]) ShowPlayerMessage(playerid, "Vuelve a la ~y~estación", 7);
				else ShowPlayerMessage(playerid, "Ve a entregar la mercancía", 7);

				new Float:val = 70.0;
				if (val + GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] > GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS]) val = GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS];
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] = val;

				SetPlayerTruckCheckpoint(playerid, vehicleid);
			}
			else ShowPlayerMessage(playerid, "Ve a los ~b~puntos de carga", 7);

			DisableRemoteVehicleCollisions(playerid, 1);
		}
		case WORK_HARVESTER:
		{
			PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] = 0;
			ShowPlayerMessage(playerid, "Ve hasta los ~y~puntos de control~w~.", 3);
			Set_HARVEST_Checkpoint(playerid);
			DisableRemoteVehicleCollisions(playerid, 1);
		}
		case WORK_TRASH:
		{
			if (CHARACTER_INFO[playerid][ch_SEX] == SEX_MALE)
			{
				DisableRemoteVehicleCollisions(playerid, 1);
				SetPlayerSkin(playerid, 16);
				PLAYER_TEMP[playerid][py_SKIN] = 16;
				for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++) RemovePlayerAttachedObject(playerid, i);
			}
		}
		case WORK_MECHANIC:
		{
			if (CHARACTER_INFO[playerid][ch_SEX] == SEX_MALE)
			{
				SetPlayerSkin(playerid, 50);
				PLAYER_TEMP[playerid][py_SKIN] = 50;
				for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++) RemovePlayerAttachedObject(playerid, i);
			}
			SetMechanicPlayerMarkers(playerid);
		}
		case WORK_POLICE:
		{
			new label_str[128];
			format(label_str, sizeof label_str, "%s | Nº%d | %c. %s", POLICE_RANKS[ PLAYER_SKILLS[playerid][WORK_POLICE] ], PLAYER_MISC[playerid][MISC_PLACA_PD], PLAYER_TEMP[playerid][py_FIRST_NAME][0], PLAYER_TEMP[playerid][py_SUB_NAME]);

			if (IsValidDynamic3DTextLabel(PLAYER_TEMP[playerid][py_POLICE_LABEL]))
			{
				DestroyDynamic3DTextLabel(PLAYER_TEMP[playerid][py_POLICE_LABEL]);
				PLAYER_TEMP[playerid][py_POLICE_LABEL] = Text3D:INVALID_STREAMER_ID;
			}
			PLAYER_TEMP[playerid][py_POLICE_LABEL] = CreateDynamic3DTextLabel(label_str, 0xF7F7F700, 0.0, 0.0, 0.3, 20.0, playerid, .testlos = true);

			//for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++) RemovePlayerAttachedObject(playerid, i);
		}
		case WORK_MEDIC:
		{
			if (CHARACTER_INFO[playerid][ch_SEX] == SEX_MALE) SetPlayerSkin(playerid, minrand(274, 276));
			else SetPlayerSkin(playerid, 308);

			SetMedicPlayerMarkers(playerid);
			ShowPlayerMessage(playerid, "Ve hasta los puntos marcados en el mapa.", 3);
		}
		case WORK_WOODCUTTER:
		{
			for(new i = 0; i != 10; ++i) RemovePlayerAttachedObject(playerid, i);
			SetPlayerAttachedObject(playerid, 0, 18638, 2, 0.152999, 0.007999, -0.005000, 0.0, 0.0, -16.199993, 1.0, 1.0, 1.0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
			SetPlayerAttachedObject(playerid, 1, 1458, 6, 1.840000, -0.546001, 0.419000, 62.100097, -158.799804, 78.600196, 0.474999, 1.000000, 1.000000);
			// SetPlayerAttachedObject(playerid, 2, 341, 6, 0.026999, -0.015000, -0.096999, 0.000000, -35.600006, 0.000000, 1.000000, 1.000000, 1.000000);

			LogCarts[playerid][cart_VALID] = true;
			LogCarts[playerid][cart_AMOUNT] = 0;
			LogCarts[playerid][cart_OBJECT] = INVALID_OBJECT_ID;
			PLAYER_TEMP[playerid][py_HOLDING_CART] = true;

			ShowPlayerNotification(playerid, "Ahora estas de servicio como leñador, ve al bosque y tala algunos arboles. Usa ~r~ALT ~w~+ ~r~CLICK ~w~para soltar tu carro.", 5);
		}
	}

	PLAYER_TEMP[playerid][py_WORKING_IN] = work;
	return 1;
}

EndPlayerJob(playerid, changeskin = true)
{
	switch(PLAYER_TEMP[playerid][py_WORKING_IN])
	{
		case WORK_TRUCK:
		{
			if (PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] != INVALID_VEHICLE_ID)
			{
				if (TRUCK_VEHICLE[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][truck_vehicle_DRIVER_USER_ID] == ACCOUNT_INFO[playerid][ac_ID])
				{
					if (TRUCK_VEHICLE[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][truck_vehicle_LOADING])
					{
						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][9]);
						SetVehicleToRespawnEx(PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID]);
					}
					if (TRUCK_VEHICLE[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][truck_vehicle_UNLOADING])
					{
						TRUCK_VEHICLE[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][truck_vehicle_UNLOADING] = false;
						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][9]);
					}
				}
			}
			if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]))
			{
				DestroyDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]);
	   			CancelTracing(playerid);
				PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT] = INVALID_STREAMER_ID;
			}
		}
		case WORK_HARVESTER:
		{
			if (IsValidDynamicRaceCP(PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT]))
			{
				DestroyDynamicRaceCP(PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT]);
				PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT] = INVALID_STREAMER_ID;
			}
			if (PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] != INVALID_VEHICLE_ID)
			{
				if (WORK_VEHICLES[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][work_vehicle_WORK] == WORK_HARVESTER) SetVehicleToRespawnEx(PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID]);
			}
		}
		case WORK_FARMER: CancelPlayerPlanting(playerid);
		case WORK_TRASH:
		{
			if (changeskin)
			{
				SetPlayerSkin(playerid, CHARACTER_INFO[playerid][ch_SKIN]);
				PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];
				SetPlayerToys(playerid);
			}

			if (PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] != INVALID_VEHICLE_ID)
			{
				if (TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_JOB_STARTED])
				{
					if (PLAYER_TEMP[playerid][py_TRASH_DRIVER])
					{
						ShowPlayerMessage(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], "~r~El trabajo se ha cancelado porque tu compañero ha dejado de trabajar.", 3);
						CancelTrashWork(playerid, TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);
					}
					if (PLAYER_TEMP[playerid][py_TRASH_PASSENGER])
					{
						ShowPlayerMessage(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], "~r~El trabajo se ha cancelado porque tu compañero ha dejado de trabajar.", 3);
						CancelTrashWork(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], playerid, PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);
					}
				}
			}
		}
		case WORK_POLICE:
		{
			PLAYER_TEMP[playerid][py_POLICE_RADIO] = 0;
			if (IsValidDynamic3DTextLabel(PLAYER_TEMP[playerid][py_POLICE_LABEL]))
			{
				DestroyDynamic3DTextLabel(PLAYER_TEMP[playerid][py_POLICE_LABEL]);
				PLAYER_TEMP[playerid][py_POLICE_LABEL] = Text3D:INVALID_STREAMER_ID;
			}

			if (changeskin)
			{
				SetPlayerSkin(playerid, CHARACTER_INFO[playerid][ch_SKIN]);
				PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];
				//SetPlayerToys(playerid);
			}

			SetPlayerColorEx(playerid, PLAYER_COLOR);
			SetNormalPlayerMarkers(playerid);
		}
		case WORK_MECHANIC:
		{
			if (changeskin)
			{
				SetPlayerSkin(playerid, CHARACTER_INFO[playerid][ch_SKIN]);
				PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];
				SetPlayerToys(playerid);
			}
			SetNormalPlayerMarkers(playerid);
		}
		case WORK_MEDIC:
		{
			SetPlayerSkin(playerid, CHARACTER_INFO[playerid][ch_SKIN]);
			PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];
			SetNormalPlayerMarkers(playerid);
		}
		case WORK_WOODCUTTER:
		{
			RemovePlayerAttachedObject(playerid, 0);
			RemovePlayerAttachedObject(playerid, 1);
			RemovePlayerAttachedObject(playerid, 2);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			ClearAnimations(playerid);
			
			SetPlayerToys(playerid);

			if (IsValidDynamicObject(LogCarts[playerid][cart_OBJECT]))
				DestroyDynamicObject(LogCarts[playerid][cart_OBJECT]);

			if (IsValidDynamic3DTextLabel(LogCarts[playerid][cart_LABEL]))
				DestroyDynamic3DTextLabel(LogCarts[playerid][cart_LABEL]);

			if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT]))
			{
				TogglePlayerDynamicCP(playerid, PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT], false);
				DestroyDynamicCP(PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT]);
			}
			
			LogCarts[playerid][cart_VALID] = false;
		}
	}

	PLAYER_TEMP[playerid][py_WORKING_IN] = WORK_NONE;

	SavePlayerSkills(playerid);
	return 1;
}