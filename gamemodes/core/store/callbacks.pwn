forward StoreBuyRecv(index, response_code, const data[]);
public StoreBuyRecv(index, response_code, const data[])
{
	#if DEBUG_MODE == 1
		printf("StoreBuyRecv %d %d %s", index, response_code, data);
	#endif

	if (IsPlayerConnected(index))
	{
	    if (response_code == 200)
	    {
	    	if (data[0] == 'Y')
			{
				switch( STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_TYPE] )
				{
					// HyCoins
					case 0:
					{
						new DB_Query[140];
						ACCOUNT_INFO[index][ac_SD] += STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA];

						format(DB_Query, sizeof DB_Query, "UPDATE `CUENTA` SET `SD` = '%d' WHERE `ID` = '%d';", ACCOUNT_INFO[index][ac_SD], ACCOUNT_INFO[index][ac_ID]);
						db_free_result(db_query(Database, DB_Query));
					}

					// Dinero
					case 1:
					{
						GivePlayerCash(index, STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA], false);
					}

					// VIP Classic
					case 2:
					{
						SetPlayerVip(index, 1, 0, STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA]);
					}

					// VIP Turbo
					case 3:
					{
						SetPlayerVip(index, 2, 0, STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA]);
					}

					// Nivel
					case 4:
					{
						KillTimer(PLAYER_TEMP[index][py_TIMERS][2]);

						ACCOUNT_INFO[index][ac_REP] = 1;
						ACCOUNT_INFO[index][ac_LEVEL] += STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA];
						SetPlayerSkillLevels(index);

						SetPlayerScore(index, ACCOUNT_INFO[index][ac_LEVEL]);

						ACCOUNT_INFO[index][ac_TIME_FOR_REP] = TIME_FOR_REP;
						PLAYER_TEMP[index][py_TIME_PASSED_LAST_REP] = gettime() * 1000;

						ACCOUNT_INFO[index][ac_TIME_PLAYING] += gettime() - PLAYER_TEMP[index][py_TIME_PLAYING];
						PLAYER_TEMP[index][py_TIME_PLAYING] = gettime();
						new DB_Query[256];
						format(DB_Query, sizeof DB_Query,

							"\
								UPDATE `CUENTA` SET `TIME-PLAYING` = '%d', `LEVEL` = '%d', `REP` = '%d', `TIME_FOR_REP` = '%d', `PAYDAY_REP` = '%d' WHERE `ID` = '%d';\
							",
								ACCOUNT_INFO[index][ac_TIME_PLAYING], ACCOUNT_INFO[index][ac_LEVEL], ACCOUNT_INFO[index][ac_REP], TIME_FOR_REP, ACCOUNT_INFO[index][ac_PAYDAY_REP], ACCOUNT_INFO[index][ac_ID]
						);
						db_free_result(db_query(Database, DB_Query));

						KillTimer(PLAYER_TEMP[index][py_TIMERS][2]);
						PLAYER_TEMP[index][py_TIMERS][2] = SetTimerEx("AddPlayerReputation", ACCOUNT_INFO[index][ac_TIME_FOR_REP], false, "i", index);
					}

					// Vehiculo
					case 5:
					{
						new
							Float:x, Float:y, Float:z, Float:angle,
							modelid = STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA],
							vehicle_type = GetVehicleType(STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA])
						;

						switch(vehicle_type)
						{
							// Helicópteros
							case 0:
							{
								new crane_point = random(sizeof(HELI_POINTS));
								x = HELI_POINTS[crane_point][0];
								y = HELI_POINTS[crane_point][1];
								z = HELI_POINTS[crane_point][2];
								angle = HELI_POINTS[crane_point][3];
							}

							// Aviones
							case 1:
							{
								new crane_point = random(sizeof(PLANE_POINTS));
								x = PLANE_POINTS[crane_point][0];
								y = PLANE_POINTS[crane_point][1];
								z = PLANE_POINTS[crane_point][2];
								angle = PLANE_POINTS[crane_point][3];
							}

							// Barcos
							case 2:
							{
								new crane_point = random(sizeof(BOAT_POINTS));
								x = BOAT_POINTS[crane_point][0];
								y = BOAT_POINTS[crane_point][1];
								z = BOAT_POINTS[crane_point][2];
								angle = BOAT_POINTS[crane_point][3];
							}

							// Autos, motos, etc
							default:
							{
								new crane_point = random(sizeof(CRANE_POINTS));
								x = CRANE_POINTS[crane_point][0];
								y = CRANE_POINTS[crane_point][1];
								z = CRANE_POINTS[crane_point][2];
								angle = CRANE_POINTS[crane_point][3];
							}
						}

						new vid = AddPersonalVehicle(
							index,
							modelid,
							x, y, z,
							angle,
							minrand(1, 10),
							minrand(1, 10),
							VEHICLE_INFO[ STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA] - 400 ][vehicle_info_MAX_GAS]
						);
						if (!vid) ShowPlayerNotification(index, "Tu vehículo se ha comprado correctamente pero no pudo spawnear debido a que ya hay muchos vehículos creados.", 4);
					}

					// Skin
					case 6:
					{
						CHARACTER_INFO[index][ch_SKIN] = STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_EXTRA];
    					SetPlayerSkin(index, CHARACTER_INFO[index][ch_SKIN]);
    					PLAYER_TEMP[index][py_SKIN] = CHARACTER_INFO[index][ch_SKIN];
					}
				}

				new str_text[232];
				format(str_text, sizeof(str_text), "Has comprado el producto \"%s\" por %d$. Felicidades.",
					STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_NAME],
					STORE_PRODUCTS[ PLAYER_TEMP[index][py_CREDIT_PRODUCT] ][store_PRICE]
				);
				ShowPlayerNotification(index, str_text, 4);
			}
			else ShowPlayerNotification(index, "No tienes los créditos suficientes para realizar esta compra en la tienda.", 4);
	    }
	    else
	    {
			ShowPlayerMessage(index, "~r~Hubo un error al intentar conectarse a la tienda", 7);
	    }
	}
	return 1;
}

forward StoreMenuRecv(index, response_code, const data[]);
public StoreMenuRecv(index, response_code, const data[])
{
	#if DEBUG_MODE == 1
		printf("StoreMenuRecv %d %d %s", index, response_code, data);
	#endif

	if (IsPlayerConnected(index))
	{
	    if (response_code == 200)
	    {
	    	format(PLAYER_TEMP[index][py_CREDIT], 32, "%s", data);
	    	ShowDialog(index, DIALOG_STORE);
	    }
	    else
	    {
			ShowPlayerMessage(index, "~r~Hubo un error al intentar conectarse a la tienda", 7);
	    }
	}
	return 1;
}