forward OnFreezeCheckEnd(playerid, adminid, vehicleid);
forward UpdateLabel(playerid, adminid);

// =============================================================

public OnFreezeCheckEnd(playerid, adminid, vehicleid)
{
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(adminid, COLOR_WHITE, "El jugador bajo de su vehículo.");
	if(GetPlayerVehicleID(playerid) != vehicleid) return SendClientMessage(adminid, COLOR_WHITE, "El jugador cambio de vehículo.");

	new Float:health;
	GetVehicleHealth(vehicleid, health);
	if(health >= PLAYER_TEMP[playerid][py_CHECK_VEHICLE_HEALTH]) SendClientMessage(adminid, COLOR_RED, "Chequeo finalizado. "COL_WHITE"Este jugador "COL_RED"puede estar usando FreezeCollisions"COL_WHITE".");
	else SendClientMessage(adminid, COLOR_RED, "Chequeo finalizado. "COL_WHITE"Es "COL_RED"improbable "COL_WHITE"que este jugador este usando FreezeCollisions.");

	DestroyPlayerObject(playerid, PLAYER_TEMP[playerid][py_CHECK_OBJECT]);
	PLAYER_TEMP[playerid][py_CHECK_OBJECT] = INVALID_OBJECT_ID;
	GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH] = PLAYER_TEMP[playerid][py_CHECK_VEHICLE_HEALTH];
	PLAYER_TEMP[playerid][py_CHECK_VEHICLE_HEALTH] = -1.0;
	SetVehicleHealthEx(vehicleid, GLOBAL_VEHICLES[vehicleid][gb_vehicle_HEALTH]);
	UpdateVehicleDamageStatus(vehicleid, PLAYER_TEMP[playerid][py_CHECK_DAMAGES][0], PLAYER_TEMP[playerid][py_CHECK_DAMAGES][1], PLAYER_TEMP[playerid][py_CHECK_DAMAGES][2], PLAYER_TEMP[playerid][py_CHECK_DAMAGES][3]);
	SetVehicleVelocity(vehicleid, 0.0, 0.0, 0.0);

	return 1;
}

public UpdateLabel(playerid, adminid)
{
	if(!IsPlayerConnected(playerid))
	{
		DestroyDynamic3DTextLabel(PLAYER_TEMP[adminid][py_DL_LABEL]);
		KillTimer(PLAYER_TEMP[adminid][py_DL_TIMER]);
		PLAYER_TEMP[adminid][py_DL_LABEL] = INVALID_3DTEXT_ID;
		return 1;
	}

	new Float:vx, Float:vy, Float:vz, Float:x, Float:y, Float:z;
	GetPlayerVelocity(playerid, vx, vy, vz);
	GetPlayerPos(playerid, x, y, z);

	new string[250];
	format(string, sizeof(string), ""COL_RED"Velocidad: "COL_WHITE"X %0.2f - Y %0.2f - Z %0.2f\n"COL_RED"Posición: "COL_WHITE"X %0.2f - Y %0.2f - Z %0.2f\n"COL_RED"Ping: "COL_WHITE"%d\n"COL_RED"PacketLoss: "COL_WHITE"%0.2f", vx, vy, vz, x, y, z, GetPlayerPing(playerid), NetStats_PacketLossPercent(playerid));
	UpdateDynamic3DTextLabelText(PLAYER_TEMP[adminid][py_DL_LABEL], 0xFFFFFFFF, string);

	return 1;
}