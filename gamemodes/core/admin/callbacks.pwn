forward OnFreezeCheckEnd(playerid, adminid, vehicleid);

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