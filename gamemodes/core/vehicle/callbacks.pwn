public OnPlayerEditObject(playerid, playerobject, objectid, response, Float:fX, Float:fY, Float:fZ, Float:fRotX, Float:fRotY, Float:fRotZ)
{
	#if DEBUG_MODE == 1
		printf("OnPlayerEditObject %d",playerid); // debug juju
	#endif

	if (playerobject)
	{
		if (objectid == PLAYER_TEMP[playerid][py_PIVOT_OBJECT])
		{
			switch(response)
			{
				case EDIT_RESPONSE_CANCEL:
				{
					if (PLAYER_TEMP[playerid][py_PIVOT_OBJECT] != INVALID_OBJECT_ID)
					{
						DestroyPlayerObject(playerid, PLAYER_TEMP[playerid][py_PIVOT_OBJECT]);
						PLAYER_TEMP[playerid][py_PIVOT_OBJECT] = INVALID_OBJECT_ID;
					}

					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][0] = PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][0];
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][1] = PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][1];
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][2] = PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][2];
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ROT][0] = PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][3];
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ROT][1] = PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][4];
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ROT][2] = PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][5];
					UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
					Streamer_Update(playerid);
					
					switch(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_TYPE])
					{
					case VOBJECT_TYPE_OBJECT:
					{
						for(new i = 0; i != MAX_VEHICLE_OBJECTS_INDEXS; i ++)
						{
							SetDynamicObjectMaterial(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OBJECT_ID], i, -1, "none", "none", VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_COLORS][i]);
						}
					}
					case VOBJECT_TYPE_TEXT:
					{
						SetDynamicObjectMaterialText
						(
							VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OBJECT_ID],
							0,
							VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_TEXT],
							130,
							VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_FONT],
							VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_FONT_SIZE],
							VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_BOLD],
							VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_FONT_COLOR],
							0,
							OBJECT_MATERIAL_TEXT_ALIGN_CENTER
						);
					}
					case VOBJECT_TYPE_COUNTRY_FLAG: TextureCountryFlag(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OBJECT_ID], 1, VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_COLORS][0]);
					case VOBJECT_TYPE_COUNTRY_PANEL: TextureCountryFlag(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OBJECT_ID], 0, VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_COLORS][0]);
					}

					ShowPlayerMessage(playerid, "Has cancelado la edición.", 3);
					ShowDialog(playerid, DIALOG_VOBJECT_OBJECT);
				}
				case EDIT_RESPONSE_FINAL:
				{
					if (PLAYER_TEMP[playerid][py_PIVOT_OBJECT] != INVALID_OBJECT_ID)
					{
						DestroyPlayerObject(playerid, PLAYER_TEMP[playerid][py_PIVOT_OBJECT]);
						PLAYER_TEMP[playerid][py_PIVOT_OBJECT] = INVALID_OBJECT_ID;
					}
					
					new Float:v_size[3];
					GetVehicleModelInfo(GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][gb_vehicle_MODELID], VEHICLE_MODEL_INFO_SIZE, v_size[0], v_size[1], v_size[2]);
					
					if	(
							(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][0] >= v_size[0] || -v_size[0] >= VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][0]) || 
							(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][1] >= v_size[1] || -v_size[1] >= VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][1]) ||
							(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][2] >= v_size[2] || -v_size[2] >= VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][2])
						)
					{
						ShowPlayerNotification(playerid, "~r~La posición del objeto está demasiado lejos del vehículo.", 4);
						VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][0] = PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][0];
						VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][1] = PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][1];
						VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][2] = PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][2];
						VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ROT][0] = PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][3];
						VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ROT][1] = PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][4];
						VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ROT][2] = PLAYER_TEMP[playerid][py_OLD_EDIT_VOBJECT_POS][5];
						UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
						Streamer_Update(playerid);
					}
					
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ATTACHED] = true;
					UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT])
					
					/*switch(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_TYPE])
					{
						case VOBJECT_TYPE_OBJECT:
						{
							for(new i = 0; i != MAX_VEHICLE_OBJECTS_INDEXS; i ++)
							{
								SetDynamicObjectMaterial(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OBJECT_ID], i, -1, "none", "none", VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_COLORS][i]);
							}
						}
						case VOBJECT_TYPE_TEXT:
						{
							SetDynamicObjectMaterialText
							(
								VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OBJECT_ID],
								0,
								VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_TEXT],
								130,
								VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_FONT],
								VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_FONT_SIZE],
								VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_BOLD],
								VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_text_FONT_COLOR],
								0,
								OBJECT_MATERIAL_TEXT_ALIGN_CENTER
							);
						}
						case VOBJECT_TYPE_COUNTRY_FLAG: TextureCountryFlag(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OBJECT_ID], 1, VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_COLORS][0]);
						case VOBJECT_TYPE_COUNTRY_PANEL: TextureCountryFlag(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OBJECT_ID], 0, VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_COLORS][0]);
					}*/

					ShowPlayerMessage(playerid, "Objeto actualizado.", 4);
					ShowDialog(playerid, DIALOG_VOBJECT_OBJECT);
				}
				case EDIT_RESPONSE_UPDATE:
				{
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][0] = fX - GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][gb_vehicle_POS][0];
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][1] = fY - GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][gb_vehicle_POS][1];
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_OFFSET][2] = fZ - GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][gb_vehicle_POS][2];
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ROT][0] = fRotX;
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ROT][1] = fRotY;
					VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][ PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT] ][vobject_ROT][2] = fRotZ;

					UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
				}
			}
		}
	}
	return 1;
}

IRPC:VehicleDestroyed(playerid, BitStream:bs)
{
    new vehicleid;

    BS_ReadUint16(bs, vehicleid);

    if (GetVehicleModel(vehicleid) < 400)
    {
        return 0;
    }

    return OnVehicleRequestDeath(vehicleid, playerid);
}

forward OnVehicleRequestDeath(vehicleid, killerid);
public OnVehicleRequestDeath(vehicleid, killerid)
{
	#if DEBUG_MODE == 1
		printf("OnVehicleRequestDeath %d %d",vehicleid, killerid); // debug juju
	#endif

    new Float:health;

    GetVehicleHealth(vehicleid, health);

    if (health >= 250.0)
    {
        return 0;
    }
    return 1;
}

IPacket:UNOCCUPIED_SYNC(playerid, BitStream:bs)
{
    new unoccupiedData[PR_UnoccupiedSync];
 
    BS_IgnoreBits(bs, 8);
    BS_ReadUnoccupiedSync(bs, unoccupiedData);
 
    if (GetVehicleModel(unoccupiedData[PR_vehicleId]) == 425) return 0;

    if ((unoccupiedData[PR_roll][0] == unoccupiedData[PR_direction][0]) &&
        (unoccupiedData[PR_roll][1] == unoccupiedData[PR_direction][1]) &&
        (unoccupiedData[PR_roll][2] == unoccupiedData[PR_direction][2])
    )
    {
        return 0;
    }

    if ((floatabs(unoccupiedData[PR_roll][0]) > 1.0) ||
        (floatabs(unoccupiedData[PR_roll][1]) > 1.0) ||
        (floatabs(unoccupiedData[PR_roll][2]) > 1.0) ||
        (floatabs(unoccupiedData[PR_direction][0]) > 1.0) ||
        (floatabs(unoccupiedData[PR_direction][1]) > 1.0) ||
        (floatabs(unoccupiedData[PR_direction][2]) > 1.0) ||
        (floatabs(unoccupiedData[PR_position][0]) > 20000.0) ||
        (floatabs(unoccupiedData[PR_position][1]) > 20000.0) ||
        (floatabs(unoccupiedData[PR_position][2]) > 20000.0) ||
        (floatabs(unoccupiedData[PR_angularVelocity][0]) > 1.0) ||
        (floatabs(unoccupiedData[PR_angularVelocity][1]) > 1.0) ||
        (floatabs(unoccupiedData[PR_angularVelocity][2]) > 1.0) ||
        (floatabs(unoccupiedData[PR_velocity][0]) > 100.0) ||
        (floatabs(unoccupiedData[PR_velocity][1]) > 100.0) ||
        (floatabs(unoccupiedData[PR_velocity][2]) > 100.0)
    )
    {
        return 0;
    }

    if ((unoccupiedData[PR_angularVelocity][0] >= 90000) &&
        (unoccupiedData[PR_angularVelocity][1] >= 90000) &&
        (unoccupiedData[PR_angularVelocity][2] >= 90000)
    )
    {
        return 0;
    }
    return 1;
}

IPacket:VEHICLE_SYNC(playerid, BitStream:bs)
{
    new inCarData[PR_InCarSync];

    BS_IgnoreBits(bs, 8);
    BS_ReadInCarSync(bs, inCarData);

    if (PLAYER_TEMP[playerid][py_KICKED]) return 0;

   	if (!IsPlayerNPC(playerid) && IsPlayerInAnyVehicle(playerid) && PLAYER_TEMP[playerid][py_VEHICLEID] != inCarData[PR_vehicleId])
	{
		if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] >= 2) return 1;
		
		new string[128];
		format(string, sizeof(string), "[ANTI-CHEAT] Kick sobre %s (%d): Vehicle Grabber (1)", ACCOUNT_INFO[playerid][ac_NAME], playerid);
		SendMessageToAdminsAC(COLOR_ANTICHEAT, string);
		SendDiscordWebhook(string, 1);

		SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Razón: Vehicle Grabber (1)");
		KickEx(playerid, 500);// printf("[kick] line: %d", __line); printf("[kick] filename: %s", __file);
		return 0;
	}
    return 1;
}

public OnVehicleSpawn(vehicleid)
{
	#if DEBUG_MODE == 1
		printf("OnVehicleSpawn %d",vehicleid); // debug juju
	#endif

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_TP_IMMUNITY] = gettime() + 5;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWNED] = true;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_ATTACHED_TO] = INVALID_VEHICLE_ID;

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] < MIN_VEHICLE_HEALTH) GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = MIN_VEHICLE_HEALTH;

	if (IsValidDynamic3DTextLabel(GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL]))
	{
		DestroyDynamic3DTextLabel(GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL]);
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL] = Text3D:INVALID_STREAMER_ID;
	}

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE] == VEHICLE_TYPE_WORK)
	{
		if (WORK_VEHICLES[vehicleid][work_vehicle_WORK] == WORK_TRASH)
		{
			if (TRASH_VEHICLES[vehicleid][trash_vehicle_JOB_STARTED])
			{
				CancelTrashWork(TRASH_VEHICLES[vehicleid][trash_vehicle_DRIVER_ID], TRASH_VEHICLES[vehicleid][trash_vehicle_PASSENGER_ID], vehicleid);
			}
		}

		GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] = frandom(GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS] / 3, 2);
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = 1000.0;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_PANELS] = 0;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_DOORS] = 0;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_LIGHTS] = 0;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_TIRES] = 0;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] = INVALID_PLAYER_ID;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_LAST_DRIVER] = INVALID_PLAYER_ID;
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_OCCUPIED] = false;

		switch(WORK_VEHICLES[vehicleid][work_vehicle_WORK])
		{
			case WORK_TRUCK: ResetTruckInfo(vehicleid);
			case WORK_TRASH: ResetTrashInfo(vehicleid);
		}
	}

	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE] == VEHICLE_TYPE_RENT)
	{
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] = frandom(GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS] / 3, 2);
		RepairVehicleEx(vehicleid);
	}

	SetVehicleNumberPlate(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_NUMBER_PLATE]);
	SetVehicleHealthEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH]);
	UpdateVehicleDamageStatus(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_PANELS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_DOORS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_LIGHTS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_TIRES]);
    ChangeVehicleColor(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_1], GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_2]);
	ChangeVehiclePaintjob(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_PAINTJOB]);
	SetVehiclePosEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_X], GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Y], GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Z]);
	SetVehicleZAngle(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_ANGLE]);
	LinkVehicleToInteriorEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_INTERIOR]);
	SetVehicleVirtualWorldEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_WORLD]);
	AddVehicleComponents(vehicleid);

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_LIGHTS] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ALARM] = 0;
	if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_DOORS] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_BONNET] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_BOOT] = 0;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_OBJECTIVE] = 0;
	UpdateVehicleParams(vehicleid);
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	#if DEBUG_MODE == 1
		printf("OnVehicleDeath",vehicleid,killerid); // debug juju
	#endif

	GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWNED] = false;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_DRIVER] = INVALID_PLAYER_ID;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_LAST_DRIVER] = INVALID_PLAYER_ID;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_OCCUPIED] = false;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_ATTACHED_TO] = INVALID_VEHICLE_ID;

	if (IsValidDynamic3DTextLabel(GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL]))
	{
		DestroyDynamic3DTextLabel(GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL]);
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL] = Text3D:INVALID_STREAMER_ID;
	}

	switch(GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE])
	{
		case VEHICLE_TYPE_TEST: DestroyVehicleEx(vehicleid);
		case VEHICLE_TYPE_PERSONAL:
		{
			if (VEHICLE_INFO[GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400][vehicle_info_VALID])
			{
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] = VEHICLE_STATE_DAMAGED;
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = MIN_VEHICLE_HEALTH;
			}
			else
			{
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = 1000.0;
			}

			new playerid = GetPlayerIdFromAccountId(PLAYER_VEHICLES[vehicleid][player_vehicle_OWNER_ID]);
			if (playerid != INVALID_PLAYER_ID)
			{
				if (PLAYER_PHONE[playerid][player_phone_VALID])
				{
					new message[64]; format(message, sizeof message, "Vehículo de sustitución entregado en últ. estacionamiento.");
					RegisterPhoneMessage(38350, PLAYER_PHONE[playerid][player_phone_NUMBER], message);
					if (PLAYER_PHONE[playerid][player_phone_STATE] == PHONE_STATE_ON)
					{
						if ((PLAYER_TEMP[playerid][py_GAME_STATE] == GAME_STATE_NORMAL || PLAYER_TEMP[playerid][py_GAME_STATE] == GAME_STATE_DEAD))
						{
							SendClientMessageEx(playerid, COLOR_WHITE, ""COL_GREEN"[Mensaje] "COL_WHITE"%s: %s", convertPhoneNumber(playerid, 38350), message);
							//PlayAudioStreamForPlayer(playerid, "https://www.dl.dropboxusercontent.com/s/do1ntkjac2kb7qn/ntf.mp3");
						}
					}
				}
			}
		}
		default:
		{
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] = frandom(GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS], GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS] / 3, 2);
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = 1000.0;
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_PANELS] = 0;
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_DOORS] = 0;
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_LIGHTS] = 0;
			GLOBAL_VEHICLES[vehicleid][gb_vehicle_DAMAGE_TIRES] = 0;
		}
	}
    return 1;
}

public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat, Float:new_x, Float:new_y, Float:new_z, Float:vel_x, Float:vel_y, Float:vel_z)
{
	if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_VALID])
	{
		if (ac_Info[CHEAT_UNOCCUPIED_VEHICLE_TP][ac_Enabled])
		{
			if (PLAYER_TEMP[playerid][py_KICKED]) return 0;

			new Float:veh_x, Float:veh_y, Float:veh_z, Float:veh_dis;
			GetVehiclePos(vehicleid, veh_x, veh_y, veh_z);
			veh_dis = GetVehicleDistanceFromPoint(vehicleid, new_x, new_y, new_z);

			if (gettime() > GLOBAL_VEHICLES[vehicleid][gb_vehicle_TP_IMMUNITY] && GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWNED])
			{
				if (veh_dis > 20.0 && veh_z > -70.0)
				{
					if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_UNOCCUPIED_VEHICLE_TP][p_ac_info_IMMUNITY])
					{
						if (!ac_Info[CHEAT_UNOCCUPIED_VEHICLE_TP][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_UNOCCUPIED_VEHICLE_TP, veh_dis);
						else
						{
							if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_UNOCCUPIED_VEHICLE_TP][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_UNOCCUPIED_VEHICLE_TP][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_UNOCCUPIED_VEHICLE_TP][p_ac_info_DETECTIONS] = 0;
							else PLAYER_AC_INFO[playerid][CHEAT_UNOCCUPIED_VEHICLE_TP][p_ac_info_DETECTIONS] ++;

							PLAYER_AC_INFO[playerid][CHEAT_UNOCCUPIED_VEHICLE_TP][p_ac_info_LAST_DETECTION] = gettime();
							if (PLAYER_AC_INFO[playerid][CHEAT_UNOCCUPIED_VEHICLE_TP][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_UNOCCUPIED_VEHICLE_TP][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_UNOCCUPIED_VEHICLE_TP, veh_dis);
						}
					}

					SetVehicleVelocity(vehicleid, 0.0, 0.0, 0.0);
					return 0;
				}
			}
		}

		new Float:spawn_distance = GetVehicleDistanceFromPoint(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_X], GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Y], GLOBAL_VEHICLES[vehicleid][gb_vehicle_SPAWN_Z]);
		switch(GLOBAL_VEHICLES[vehicleid][gb_vehicle_TYPE])
		{
			case VEHICLE_TYPE_SELL:
			{
				if (spawn_distance > 10.0) SetVehicleToRespawnEx(vehicleid);
			}
			case VEHICLE_TYPE_WORK:
			{
				if (TRASH_VEHICLES[vehicleid][trash_vehicle_JOB_STARTED]) return 1;
				if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] == 453) return 1;
				if (spawn_distance < 25.0)
				{
					if (spawn_distance > 25.0) SetVehicleToRespawnEx(vehicleid);
				}
			}
		}
	}
    return 1;
}

public OnEnterExitModShop(playerid, enterexit, interiorid)
{
	#if DEBUG_MODE == 1
		printf("OnEnterExitModShop",playerid); // debug juju
    #endif

    if (enterexit) // Entra
    {
		ShowPlayerMessage(playerid, "~r~Solo puedes tunear vehículos en el mecánico, búscalo con el /GPS.", 2);
		//SendClientMessage(playerid, COLOR_WHITE, "{ffff35}[ATENCION] "COL_WHITE"Si reaflizas alguna modificación al vehículo en este garaje serás expulsado.");
    }
	else
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if (vehicleid != INVALID_VEHICLE_ID)
		{
			ChangeVehicleColor(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_1], GLOBAL_VEHICLES[vehicleid][gb_vehicle_COLOR_2]);
			ChangeVehiclePaintjob(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_PAINTJOB]);
			AddVehicleComponents(vehicleid);
		}
	}
    return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	#if DEBUG_MODE == 1
		printf("OnVehicleMod %d %d %d",playerid,vehicleid,componentid); // debug juju
	#endif

	if (ac_Info[CHEAT_CAR_MOD][ac_Enabled])
	{
		if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_IMMUNITY])
		{
			if (!ac_Info[CHEAT_CAR_MOD][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_CAR_MOD);
			else
			{
				if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_CAR_MOD][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_DETECTIONS] = 0;
				else PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_DETECTIONS] ++;

				PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_LAST_DETECTION] = gettime();
				if (PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_CAR_MOD][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_CAR_MOD);
			}
		}
	}
    return 0;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	#if DEBUG_MODE == 1
		printf("OnVehiclePaintjob %d %d %d",playerid,vehicleid,paintjobid); // debug juju
	#endif

	if (ac_Info[CHEAT_CAR_MOD][ac_Enabled])
	{
		if (gettime() > PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_IMMUNITY])
		{
			if (!(-1 < paintjobid < 3) && paintjobid != 255)
			{
				if (!ac_Info[CHEAT_CAR_MOD][ac_Interval]) OnPlayerCheatDetected(playerid, CHEAT_CAR_MOD);
				else
				{
					if (gettime() - PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_LAST_DETECTION] > ac_Info[CHEAT_CAR_MOD][ac_Interval]) PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_DETECTIONS] = 0;
					else PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_DETECTIONS] ++;

					PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_LAST_DETECTION] = gettime();
					if (PLAYER_AC_INFO[playerid][CHEAT_CAR_MOD][p_ac_info_DETECTIONS] >= ac_Info[CHEAT_CAR_MOD][ac_Detections]) OnPlayerCheatDetected(playerid, CHEAT_CAR_MOD);
				}
			}
		}
	}
	return 1;
}