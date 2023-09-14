forward GetAmbulanceItem(playerid, vehicleid);
public GetAmbulanceItem(playerid, vehicleid)
{
	#if DEBUG_MODE == 1
		printf("GetAmbulanceItem"); // debug juju
	#endif

	ClearAnimations(playerid);
	PLAYER_MISC[playerid][MISC_BOTIKIN] += 1;
	GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~w~Botiquín"), 2000, 5);

	if (vehicleid != INVALID_VEHICLE_ID)
	{
		new doors[4];
		GetVehicleParamsCarDoors(vehicleid, doors[0], doors[1], doors[2], doors[3]);
		SetVehicleParamsCarDoors(vehicleid, doors[0], doors[1], 0, 0);
	}
	return 1; 
}