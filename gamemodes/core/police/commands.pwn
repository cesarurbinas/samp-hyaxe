CMD:antecedente(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);

	new to_player, reason[128];
	if (sscanf(params, "us[128]", to_player, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /antecedentes <playerid> <razon>");
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (to_player == playerid) return 1;

	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No se puede añadir algo a este jugador ahora.", 3);
	if (PLAYER_WORKS[to_player][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No se puede añadir algo a este jugador porque es policía.", 3);

	AddPlayerPoliceHistory(to_player, ACCOUNT_INFO[playerid][ac_NAME], reason);
	SendPoliceNotification(sprintf("%s ha actualizado el historial de ~y~%s~w~.", PLAYER_TEMP[playerid][py_RP_NAME], PLAYER_TEMP[to_player][py_RP_NAME]), 4);
	return 1;
}

CMD:limpiar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);
	if (PLAYER_SKILLS[playerid][WORK_POLICE] < 11) return ShowPlayerNotification(playerid, "No tienes rango suficiente.", 3);

	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /limpiar <playerid>");
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No se puede eliminar el historial policial de este jugador ahora.", 3);

	new DB_Query[128];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `POLICE_HISTORY` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[to_player][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	SendPoliceNotification(sprintf("%s ha borrado el historial de ~y~%s~w~.", PLAYER_TEMP[playerid][py_RP_NAME], PLAYER_TEMP[to_player][py_RP_NAME]), 4);
	return 1;
}

CMD:historial(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);

	ShowDialog(playerid, DIALOG_POLICE_BYC);
	return 1;
}

CMD:c(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerNotification(playerid, "Ahora no puedes usar comandos.", 3);

	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_SKILLS[playerid][WORK_POLICE] < 1) return ShowPlayerNotification(playerid, "No tienes rango suficiente.", 3);

	new to_player, level, reason[32];
	if (sscanf(params, "uds[32]", to_player, level, reason)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /c <ID o nombre> <1/6> <razon>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (to_player == playerid) return ShowPlayerMessage(playerid, "~r~No puedes darte cargos a tu mismo");
	if (PLAYER_WORKS[to_player][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~Este jugador es miembro de la policía.", 3);
	if (level > 6) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /c <ID o nombre> <1/6> <razon>");
	if (strlen(reason) >= 24) return ShowPlayerMessage(playerid, "~r~Como máximo puedes introducir una razón de 32 caracteres.", 3);

	PLAYER_TEMP[to_player][py_POLICE_REASON] = reason;

	new str_text[128];
	format(str_text, sizeof(str_text), "%s le puso %d cargos a ~r~%s~w~ (%s).", PLAYER_TEMP[playerid][py_NAME], level, PLAYER_TEMP[to_player][py_NAME], reason);
	SendPoliceNotification(str_text, 4);

	SetPlayerPoliceSearchLevel(to_player, level);
	return 1;
}

CMD:cargos(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerNotification(playerid, "Ahora no puedes usar comandos.", 3);

	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_SKILLS[playerid][WORK_POLICE] < 1) return ShowPlayerNotification(playerid, "No tienes rango suficiente.", 3);

	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /cargos <ID o nombre>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	if (to_player == playerid) return ShowPlayerMessage(playerid, "~r~No puedes verte a tu mismo");
	if (PLAYER_WORKS[to_player][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~Este jugador es miembro de la policía.", 3);
	if (!PLAYER_TEMP[to_player][py_POLICE_REASON]) return ShowPlayerMessage(playerid, "~r~Este jugador no tiene razones de cargos.", 3);

	SendClientMessageEx(playerid, COLOR_WHITE, "%s tiene cargos por "COL_RED"%s", PLAYER_TEMP[to_player][py_NAME], PLAYER_TEMP[to_player][py_POLICE_REASON]);
	return 1;
}

CMD:documento(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerNotification(playerid, "Ahora no puedes usar comandos.", 3);

	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_SKILLS[playerid][WORK_POLICE] < 1) return ShowPlayerNotification(playerid, "No tienes rango suficiente.", 3);

	new to_player;
	if (sscanf(params, "u", to_player)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /documento <ID o nombre>");
	if (!IsPlayerConnected(to_player)) return SendClientMessageEx(playerid, COLOR_WHITE, "Jugador (%d) desconectado", to_player);
	new Float:x, Float:y, Float:z;
	GetPlayerPos(to_player, x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no está cerca tuya.", 2);

	SetPlayerChatBubble(playerid, "\n\n\n\n* Revisa el documento de alguien\n\n\n", 0xffcb90FF, 20.0, 5000);

	new
		caption[64],
		dialog[144],
		drive[3],
		dni[64]
	;

	if (PLAYER_MISC[to_player][MISC_DRIVE] != 0) drive = "Si";
	else drive = "No";

	if (PLAYER_MISC[to_player][MISC_DNI]) format(dni, sizeof(dni), "%d", PLAYER_MISC[to_player][MISC_DNI]);
	else dni = "No";

	format(caption, sizeof(caption), ""COL_RED"%s", PLAYER_TEMP[to_player][py_NAME]);
	format(dialog, sizeof(dialog), ""COL_WHITE"Documento: %s\nLicencia de conducir: %s", dni, drive);

	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, caption, dialog, "Cerrar", "");
	return 1;
}

CMD:frecuencias(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);

	ShowDialog(playerid, DIALOG_POLICE_RADIOS);
	return 1;
}

CMD:entregar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);

	if (sscanf(params, "ud", params[0], params[1])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /entregar [ID o nombre] [Minutos]");
	if (params[1] < 1 || params[1] > 1440) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: cantidad de minutos no válida.");

	if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return ShowPlayerMessage(playerid, "~r~Para entregar tienes que estar dentro de un vehículo policial.", 3);

	new vehicleid = GetPlayerVehicleID(playerid);
	if (!WORK_VEHICLES[vehicleid][work_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Para entregar tienes que estar dentro de un vehículo policial.", 3);
	if (WORK_VEHICLES[vehicleid][work_vehicle_WORK] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~Para entregar tienes que estar dentro de un vehículo policial.", 3);

	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador no conectado.", 3);
	new Float:x, Float:y, Float:z; GetPlayerPos(params[0], x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 5.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no está cerca tuya.", 2);
	if (PLAYER_TEMP[params[0]][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes arrestar a este jugador ahora.", 3);
	if (GetPlayerState(params[0]) != PLAYER_STATE_PASSENGER) return ShowPlayerMessage(playerid, "~r~Para entregar a esta persona tiene que estar dentro del vehículo policial.", 3);
	if (GetPlayerVehicleID(params[0]) != vehicleid) return ShowPlayerMessage(playerid, "~r~Para entregar a esta persona tiene que estar dentro del vehículo policial.", 3);

	if (IsPlayerInRangeOfPoint(playerid, 20.0, 1564.971923, -1694.916381, 5.617697))
	{
	    ShowPlayerMessage(playerid, "~g~La persona fue enviada a la cárcel.", 3);
		CHARACTER_INFO[params[0]][ch_POLICE_JAIL_ID] = 0;
		JailPlayer(params[0], params[1] * 60);
		AddPlayerPoliceHistory(params[0], "Central", "Encarcelamiento");
	}
	else if (IsPlayerInRangeOfPoint(playerid, 20.0, -1589.333496, 716.759521, -5.515106))
	{
		ShowPlayerMessage(playerid, "~g~La persona fue enviada a la cárcel", 3);
		CHARACTER_INFO[params[0]][ch_POLICE_JAIL_ID] = 1;
		JailPlayer(params[0], params[1] * 60);
		AddPlayerPoliceHistory(params[0], "Central", "Encarcelamiento");
	}
	else if (IsPlayerInRangeOfPoint(playerid, 20.0, 2282.200439, 2431.598632, 3.000518))
	{
		ShowPlayerMessage(playerid, "~g~La persona fue enviada a la cárcel", 3);
		CHARACTER_INFO[params[0]][ch_POLICE_JAIL_ID] = 2;
		JailPlayer(params[0], params[1] * 60);
		AddPlayerPoliceHistory(params[0], "Central", "Encarcelamiento");
	}
	else ShowPlayerMessage(playerid, "~r~No estás en el sitio correcto.", 3);

	new str_text[128];
	format(str_text, sizeof(str_text), "%s ha entregado a ~g~%s~w~.", PLAYER_TEMP[playerid][py_NAME], PLAYER_TEMP[params[0]][py_NAME]);
	SendPoliceNotification(str_text, 4);
	return 1;
}

CMD:policias(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);

	PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 10;
	PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;
	ShowDialog(playerid, DIALOG_POLICE_LIST);
	return 1;
}

CMD:m(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);

	if (!IsPlayerInAnyVehicle(playerid)) return ShowPlayerMessage(playerid, "~r~Para usar el megáfono tienes que estar dentro de un vehículo policial.", 3);

	new vehicleid = GetPlayerVehicleID(playerid);
	if (!WORK_VEHICLES[vehicleid][work_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Para usar el megáfono tienes que estar dentro de un vehículo policial.", 3);
	if (WORK_VEHICLES[vehicleid][work_vehicle_WORK] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~Para usar el megáfono tienes que estar dentro de un vehículo policial.", 3);

	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /m [Mensaje]");

	new str_text[190];
	format(str_text, 190, "(Megáfono) %s: %s", PLAYER_TEMP[playerid][py_RP_NAME], params);
	ProxDetector(playerid, 40.0, str_text, 0x4FAFFFFF, 0x4FAFFFFF, 0x4FAFFFFF, 0x4FAFFFFF, 0x4FAFFFFF, 85);
	return 1;
}

CMD:multar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);
	if (sscanf(params, "ud", params[0], params[1])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /multar [ID o nombre] [precio$]");
	if (params[1] < 0) return ShowPlayerMessage(playerid, "~r~El precio no puede ser menor a 0$.", 3);
	else if (params[1] > 500000) return ShowPlayerMessage(playerid, "~r~El precio no puede ser mayor a 500.000$.", 3);

	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador no conectado.", 3);
	new Float:x, Float:y, Float:z; GetPlayerPos(params[0], x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 5.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no está cerca tuya.", 2);
	if (PLAYER_TEMP[params[0]][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes multar a este jugador ahora.", 3);
	if (CHARACTER_INFO[params[0]][ch_STATE] == ROLEPLAY_STATE_ARRESTED || CHARACTER_INFO[params[0]][ch_STATE] == ROLEPLAY_STATE_JAIL) return ShowPlayerMessage(playerid, "~r~No puedes multar a este jugador ahora.", 3);

	PLAYER_TEMP[params[0]][py_POLICE_PEN_PID] = playerid;
	PLAYER_TEMP[params[0]][py_POLICE_PEN_AID] = ACCOUNT_INFO[playerid][ac_ID];
	PLAYER_TEMP[params[0]][py_POLICE_PEN_IM] = params[1];
	PLAYER_TEMP[params[0]][py_POLICE_PEN_TIME] = gettime();
	ShowDialog(params[0], DIALOG_POLICE_PENALTY);

	ShowPlayerMessage(playerid, "~r~La multa ha sido enviada, espera para ver si el jugador la acepta.", 3);
	return 1;
}

CMD:arrestar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);

	if (sscanf(params, "ud", params[0], params[1])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /arrestar [ID o nombre] [Asiento 1 ó 2]");
	if (params[1] < 1 || params[1] > 2) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /arrestar [ID o nombre] [Asiento 1 ó 2]");
	params[1] ++;

	if (!IsPlayerInAnyVehicle(playerid)) return ShowPlayerMessage(playerid, "~r~Para arrestar tienes que estar dentro de un vehículo policial.", 3);

	new vehicleid = GetPlayerVehicleID(playerid);
	if (!WORK_VEHICLES[vehicleid][work_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Para arrestar tienes que estar dentro de un vehículo policial.", 3);
	if (WORK_VEHICLES[vehicleid][work_vehicle_WORK] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~Para arrestar tienes que estar dentro de un vehículo policial.", 3);
	if ( (params[1] + 1) > VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400 ][vehicle_info_SEATS]) return SendClientMessageEx(playerid, COLOR_WHITE, "Este vehículo policial es de %d pasajeros, así que no puedes llevar arrestados en él.", VEHICLE_INFO[ GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400 ][vehicle_info_SEATS]);

	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador no conectado.", 3);
	new Float:x, Float:y, Float:z; GetPlayerPos(params[0], x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 20.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no está cerca tuya.", 2);
	if (PLAYER_TEMP[params[0]][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes arrestar a este jugador ahora.", 3);

	if (!PLAYER_TEMP[params[0]][py_CUFFED]) return ShowPlayerMessage(playerid, "~r~Para arrestar a esta persona tiene que estar esposada.", 3);

	if (CHARACTER_INFO[params[0]][ch_STATE] == ROLEPLAY_STATE_ARRESTED)
	{
		CHARACTER_INFO[params[0]][ch_STATE] = ROLEPLAY_STATE_NORMAL;
		ShowPlayerNotification(playerid, "Has soltado al detenido.", 3);
		return 1;
	}
	else
	{
		CHARACTER_INFO[params[0]][ch_STATE] = ROLEPLAY_STATE_ARRESTED;
		PutPlayerInVehicleEx(params[0], vehicleid, params[1]);
		TogglePlayerControllableEx(params[0], false);
	}
	return 1;
}

CMD:callsing(playerid, params[])
{
	print("callsing 0");
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);
	if (PLAYER_SKILLS[playerid][WORK_POLICE] < 2) return ShowPlayerNotification(playerid, "No tienes rango suficiente.", 3);
	print("callsing 1");
	if (isnull(params)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /callsing [Texto]");
	if (!IsPlayerInAnyVehicle(playerid)) return ShowPlayerMessage(playerid, "~r~Para asignar callsing tienes que estar dentro de un vehículo policial.", 3);
	print("callsing 3");
	new vehicleid = GetPlayerVehicleID(playerid);
	if (!WORK_VEHICLES[vehicleid][work_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Para asignar callsing tienes que estar dentro de un vehículo policial.", 3);
	if (WORK_VEHICLES[vehicleid][work_vehicle_WORK] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~Para asignar callsing tienes que estar dentro de un vehículo policial.", 3);
	print("callsing 4");
	if (IsValidDynamic3DTextLabel(GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL]))
	{
		print("callsing 5");
		DestroyDynamic3DTextLabel(GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL]);
		GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL] = Text3D:INVALID_STREAMER_ID;
	}
	print("callsing 6");
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_LABEL] = CreateDynamic3DTextLabel(params, COLOR_WHITE, -0.7, -1.9, -0.3, 20.0, .attachedvehicle = vehicleid);
	return 1;
}

CMD:econtrol(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);
	if (PLAYER_SKILLS[playerid][WORK_POLICE] < 8) return ShowPlayerNotification(playerid, "No tienes rango suficiente.", 3);

	if (GetPlayerVirtualWorld(playerid) != 0 || GetPlayerInterior(playerid) != 0) return ShowPlayerMessage(playerid, "~r~No puedes editar objetos policiales aquí.", 3);

	SelectObject(playerid);
	return 1;
}

CMD:control(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);
	if (PLAYER_SKILLS[playerid][WORK_POLICE] < 8) return ShowPlayerNotification(playerid, "No tienes rango suficiente.", 3);

	if (GetPlayerVirtualWorld(playerid) != 0 || GetPlayerInterior(playerid) != 0) return ShowPlayerMessage(playerid, "~r~No puedes colocar objetos policiales aquí.", 3);

	new type;
	if (sscanf(params, "d", type)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /control "COL_WHITE"[Tipo 1-6]");

	new modelid;
	switch(type)
	{
		case 1: modelid = 1459;
		case 2: modelid = 1238;
		case 3: modelid = 1425;
		case 4: modelid = 3265;
		case 5: modelid = 3091;
        case 6: modelid = 3091;
		default: return ShowPlayerMessage(playerid, "~r~No puedes colocar objetos policiales aquí.", 3);
	}

	new index = GetFreePoliceObjectSlot();
	if (index == -1) return ShowPlayerMessage(playerid, "~r~No se pueden crear más objetos policiales.", 3);

	POLICE_OBJECTS[index][police_object_VALID] = true;
	format(POLICE_OBJECTS[index][police_object_USER], 24, "%s", ACCOUNT_INFO[playerid][ac_NAME]);

	new Float:x, Float:y, Float:z, Float:angle;
	GetPlayerPos(playerid, x, y, z);
	GetPlayerFacingAngle(playerid, angle);
	x += (1.5 * floatsin(-angle, degrees));
	y += (1.5 * floatcos(-angle, degrees));

	POLICE_OBJECTS[index][police_object_OBJECT_ID] = CreateDynamicObject(modelid, x, y, z, 0.0, 0.0, angle, 0, 0);
	Streamer_Update(playerid);
	new info[2];
	info[0] = WORK_POLICE;
	info[1] = index; // Index
	Streamer_SetArrayData(STREAMER_TYPE_OBJECT, POLICE_OBJECTS[index][police_object_OBJECT_ID], E_STREAMER_EXTRA_ID, info);
	PLAYER_TEMP[playerid][py_SELECTED_POLICE_OBJECT_INDEX] = index;
	EditDynamicObject(playerid, POLICE_OBJECTS[index][police_object_OBJECT_ID]);

	ShowPlayerMessage(playerid, "~r~Coloca el objeto, posteriormente puedes usar /econtrol para moverlo o eliminarlo.", 3);
	return 1;
}

CMD:policia(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_NONE && PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE)
	{
	    ShowPlayerMessage(playerid, "~r~Ya estas en servicio en otro trabajo.", 3);
		return 1;
	}

	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No estás depie.", 3);
	{
		if (!PLAYER_TEMP[playerid][py_WORKING_IN]) ShowDialog(playerid, DIALOG_SELECT_POLICE_SKIN);
		else EndPlayerJob(playerid);
	}

	return 1;
}

CMD:esposar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);
	if (sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /esposar [ID o nombre]");
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No estás depie.", 3);

	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador no conectado.", 3);
	new Float:x, Float:y, Float:z; GetPlayerPos(params[0], x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 30.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no está cerca tuya.", 2);
	if (PLAYER_TEMP[params[0]][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes esposar a este jugador ahora.", 3);
	if (GetPlayerState(params[0]) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~Para esposar a esta persona tiene que estar depie.", 3);
	if (params[0] == playerid) return ShowPlayerMessage(playerid, "~r~No puedes esposarte a ti mismo");
	if (PLAYER_WORKS[params[0]][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~Este jugador es miembro de la policía.", 3);

	if (PLAYER_TEMP[params[0]][py_CUFFED])
	{
		TogglePlayerControllableEx(params[0], true);
		PLAYER_TEMP[params[0]][py_CUFFED] = false;
		PLAYER_TEMP[params[0]][py_CUFFING] = false;
		SetPlayerSpecialAction(params[0], SPECIAL_ACTION_NONE);

		SetPlayerChatBubble(playerid, "\n\n\n\n* Le quita las esposas a alguien.\n\n\n", 0xffcb90FF, 20.0, 5000);
		SendPoliceMark(params[0], PLAYER_COLOR);
		return 1;
	}

	if (!PLAYER_TEMP[params[0]][py_CUFFING])
	{
	    ShowPlayerMessage(params[0], "Estás siendo esposado", 3);
	    ShowPlayerMessage(playerid, "Estás esposando a esta persona", 3);

	    CHARACTER_INFO[params[0]][ch_STATE] = ROLEPLAY_STATE_NORMAL;
		if (ACCOUNT_INFO[params[0]][ac_SU]) SetPlayerHealthEx(params[0], 50.0);
		else SetPlayerHealthEx(params[0], 25.0);

		DisablePlayerMedicMark(params[0]);

		ApplyAnimation(params[0], "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 0, true);
		ClearAnimations(params[0]);

		PLAYER_TEMP[params[0]][py_CUFFED] = false;
		PLAYER_TEMP[params[0]][py_CUFFING] = true;
		KillTimer(PLAYER_TEMP[params[0]][py_TIMERS][14]);
		TogglePlayerControllableEx(params[0], false);
		SetPlayerSpecialAction(params[0], SPECIAL_ACTION_HANDSUP);
		PLAYER_TEMP[params[0]][py_TIMERS][14] = SetTimerEx("CuffPlayer", 1000, false, "i", params[0]);
		SendPoliceMark(params[0], 0x2DAA24FF);
	}
	return 1;
}

CMD:placa(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);
	if (sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /placa [ID o nombre]");

	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador no conectado.", 3);
	new Float:x, Float:y, Float:z; GetPlayerPos(params[0], x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no está cerca tuya.", 2);
	if (PLAYER_TEMP[params[0]][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes enseñarle tu placa a este jugador ahora.", 3);

	SetPlayerChatBubble(playerid, "\n\n\n\n* Le enseña su placa a alguien.\n\n\n", 0xffcb90FF, 20.0, 5000);
	SendClientMessageEx(params[0], COLOR_WHITE, "%s %c. %s "COL_YELLOW"[Placa: %d]", POLICE_RANKS[ PLAYER_SKILLS[playerid][WORK_POLICE] ], PLAYER_TEMP[playerid][py_FIRST_NAME][0], PLAYER_TEMP[playerid][py_SUB_NAME], PLAYER_MISC[playerid][MISC_PLACA_PD]);
	ShowPlayerMessage(playerid, "Has mostrado tu placa", 3);
	return 1;
}

CMD:revisar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);
	if (sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /revisar [ID o nombre]");
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No estás depie.", 3);

	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador no conectado.", 3);
	new Float:x, Float:y, Float:z; GetPlayerPos(params[0], x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no está cerca tuya.", 2);
	if (PLAYER_TEMP[params[0]][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes revisar a este jugador ahora.", 3);
	if (GetPlayerState(params[0]) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~Para revisar a esta persona tiene que estar depie.", 3);
	if (!PLAYER_TEMP[params[0]][py_CUFFED]) return ShowPlayerMessage(playerid, "~r~Para revisar a esta persona tiene que estar esposada.", 3);

	ShowPlayerInventory(playerid, params[0]);

	SetPlayerChatBubble(playerid, "\n\n\n\n* Revisa a alguien\n\n\n", 0xffcb90FF, 20.0, 5000);
	return 1;
}
alias:revisar("cachear")

CMD:requisar(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (!PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~No eres policía.", 3);
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);
	if (sscanf(params, "u", params[0])) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /requisar [ID o nombre]");
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No estás depie.", 3);

	if (!IsPlayerConnected(params[0])) return ShowPlayerMessage(playerid, "~r~Jugador no conectado.", 3);
	new Float:x, Float:y, Float:z; GetPlayerPos(params[0], x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~El jugador no está cerca tuya.", 2);
	if (PLAYER_TEMP[params[0]][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes revisar a este jugador ahora.", 3);
	if (GetPlayerState(params[0]) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~Para revisar a esta persona tiene que estar depie.", 3);
	if (!PLAYER_TEMP[params[0]][py_CUFFED]) return ShowPlayerMessage(playerid, "~r~Para revisar a esta persona tiene que estar esposada.", 3);

	DeleteIlegalInv(params[0], true);

	SetPlayerChatBubble(playerid, "\n\n\n\n* Requisa las pertenecias ilegales de alguien.\n\n\n", 0xffcb90FF, 20.0, 5000);
	ShowPlayerMessage(playerid, "Has requisado a este jugador", 3);
	return 1;
}

CMD:ref(playerid, params[])
{
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	if (PLAYER_WORKS[playerid][WORK_POLICE])
	{
		if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_POLICE) return ShowPlayerMessage(playerid, "~r~No estás de servicio como policía.", 3);

		new city[45], zone[45];
		GetPlayerZones(playerid, city, zone);

		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][43]);

		new message[144];
		format(message, sizeof message, "~b~%s~w~: refuerzos en %s.", PLAYER_TEMP[playerid][py_RP_NAME], zone);
		SendPoliceNotification(message, 4);

		for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
		{
			if (IsPlayerConnected(i))
			{
				if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
				{
					if (PLAYER_WORKS[i][WORK_POLICE])
					{
						if (PLAYER_TEMP[i][py_WORKING_IN] == WORK_POLICE)
						{
							SetPlayerMarkerForPlayer(i, playerid, 0x0087ffFF);
						}
					}
	   			}
			}
	 	}

	 	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][38]);
		PLAYER_TEMP[playerid][py_TIMERS][38] = SetTimerEx("DisableRefMark", 120000, false, "i", playerid);
	}
	else ActiveGeolocation(playerid);
	return 1;
}
alias:ref("refuerzos")