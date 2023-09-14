forward GetAmbulanceItem(playerid, vehicleid);
public GetAmbulanceItem(playerid, vehicleid)
{
	Logger_Debug("GetAmbulanceItem"); // This is a debug line!

	if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);
	ClearAnimations(playerid);
	AddPlayerItem(playerid, 0);
	GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~w~Botiquin"), 2000, 5);

	if (vehicleid != INVALID_VEHICLE_ID)
	{
		new doors[4];
		GetVehicleParamsCarDoors(vehicleid, doors[0], doors[1], doors[2], doors[3]);
		SetVehicleParamsCarDoors(vehicleid, doors[0], doors[1], 0, 0);
	}
	return 1; 
}