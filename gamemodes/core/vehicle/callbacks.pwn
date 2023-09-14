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
					
					new Float:v_size[3];
					GetVehicleModelInfo(GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][gb_vehicle_MODELID], VEHICLE_MODEL_INFO_SIZE, v_size[0], v_size[1], v_size[2]);

					if	(
							(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]][vobject_OFFSET][0] >= v_size[0] || -v_size[0] >= VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]][vobject_OFFSET][0]) || 
							(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]][vobject_OFFSET][1] >= v_size[1] || -v_size[1] >= VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]][vobject_OFFSET][1]) ||
							(VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]][vobject_OFFSET][2] >= v_size[2] || -v_size[2] >= VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]][vobject_OFFSET][2])
						)
					{
						VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]][vobject_OFFSET][0] = 0.0;
						VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]][vobject_OFFSET][1] = 0.0;
						VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]][vobject_OFFSET][2] = 0.0;
						VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]][vobject_ROT][0] = 0.0;
						VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]][vobject_ROT][1] = 0.0;
						VEHICLE_OBJECTS[ PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] ][PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]][vobject_ROT][2] = 0.0;
						//ShowPlayerNotification(playerid, "No alejes mucho el objeto.", 0);
						ShowPlayerMessage(playerid, "~r~No alejes mucho el objeto.", 3);
						return 0;
					}

					UpdateVehicleAttachedObject(PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID], PLAYER_TEMP[playerid][py_TUNING_EDIT_SLOT]);
				}
			}
		}
	}
	return 1;
}
