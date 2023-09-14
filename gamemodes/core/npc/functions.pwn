InitPilotsNpc()
{
    TrainDriverVehicles[0] = AddStaticVehicleEx(537, 1462.0745, 2630.8787, 10.8203, 270.0, -1, -1, 0); // freight
	TrainDriverVehicles[1] = AddStaticVehicleEx(537, -1942.7950, 168.4164, 27.0006, 270.0, -1, -1, 0); // freight
	TrainDriverVehicles[2] = AddStaticVehicleEx(537, 1700.7551, -1953.6531, 14.8756, 270.0, -1, -1, 0); // freight
	
    TrainDriverNPCs[0] = FCNPC_Create("TrainDriverLS");
	TrainDriverNPCs[1] = FCNPC_Create("TrainDriverSF");
	TrainDriverNPCs[2] = FCNPC_Create("TrainDriverLV");

	for(new traindriver = 0; traindriver < MAX_STANDARD_NPC_TRAINDRIVERS; traindriver++)
    {
		if (TrainDriverNPCs[traindriver] != INVALID_PLAYER_ID && TrainDriverVehicles[traindriver] != INVALID_VEHICLE_ID)
        {
			FCNPC_Spawn(TrainDriverNPCs[traindriver], 255, 0.0, 0.0, 0.0);
			//SetPlayerTeam(TrainDriverNPCs[traindriver], 69);
			FCNPC_SetInvulnerable(TrainDriverNPCs[traindriver], true);
			SetPlayerColor(TrainDriverNPCs[traindriver], 0xFFFFFF00);
			FCNPC_PutInVehicle(TrainDriverNPCs[traindriver], TrainDriverVehicles[traindriver], 0);
			TrainDriverPlaybackCycle[traindriver] = traindriver;
			TrainDriverNextPlayback(traindriver);
		}
	}

	PilotVehicles[0] = AddStaticVehicleEx(577, 0.0, 0.0, 0.0, 315.1902, -1, -1, 0); // at400
	PilotVehicles[1] = AddStaticVehicleEx(577, 0.0, 0.0, 0.0, 315.1902, -1, -1, 0); // at400
	PilotVehicles[2] = AddStaticVehicleEx(577, 0.0, 0.0, 0.0, 315.1902, -1, -1, 0); // at400
	PilotNPCs[0] = FCNPC_Create("PilotLS");
	PilotNPCs[1] = FCNPC_Create("PilotSF");
	PilotNPCs[2] = FCNPC_Create("PilotLV");

	for(new pilot = 0; pilot < MAX_STANDARD_NPC_PILOTS; pilot++)
    {
		if (PilotNPCs[pilot] != INVALID_PLAYER_ID && PilotVehicles[pilot] != INVALID_VEHICLE_ID)
        {
			FCNPC_Spawn(PilotNPCs[pilot], 61, 0.0, 0.0, 0.0);
			FCNPC_SetInvulnerable(PilotNPCs[pilot], true);
			SetPlayerColor(PilotNPCs[pilot], 0xFFFFFF00);
			FCNPC_PutInVehicle(PilotNPCs[pilot], PilotVehicles[pilot], 0);
			PilotPlaybackCycle[pilot] = pilot;
			PilotNextPlayback(pilot);
		}
	}
    return 1;
}

ExitPilotsNpc()
{
    for(new traindriver = 0; traindriver < MAX_STANDARD_NPC_TRAINDRIVERS; traindriver++)
    {
		FCNPC_StopPlayingPlayback(TrainDriverVehicles[traindriver]);
		DestroyVehicle(TrainDriverVehicles[traindriver]);
		TrainDriverVehicles[traindriver] = INVALID_VEHICLE_ID;
		FCNPC_Destroy(TrainDriverNPCs[traindriver]);
		TrainDriverNPCs[traindriver] = INVALID_PLAYER_ID;
		TrainDriverPlaybackCycle[traindriver] = 0;
	}

	for(new pilot = 0; pilot < MAX_STANDARD_NPC_PILOTS; pilot++)
    {
		FCNPC_StopPlayingPlayback(PilotNPCs[pilot]);
		DestroyVehicle(PilotVehicles[pilot]);
		PilotVehicles[pilot] = INVALID_VEHICLE_ID;
		FCNPC_Destroy(PilotNPCs[pilot]);
		PilotNPCs[pilot] = INVALID_PLAYER_ID;
		PilotPlaybackCycle[pilot] = 0;
	}
    return 1;
}

TrainDriverNextPlayback(index)
{
	switch(TrainDriverPlaybackCycle[index])
    {
		case 0: FCNPC_StartPlayingPlayback(TrainDriverNPCs[index], "train_ls_to_sf");
		case 1: FCNPC_StartPlayingPlayback(TrainDriverNPCs[index], "train_sf_to_lv");
		case 2: FCNPC_StartPlayingPlayback(TrainDriverNPCs[index], "train_lv_to_ls");
	}

	TrainDriverPlaybackCycle[index] ++;
	if (TrainDriverPlaybackCycle[index] == 3)
		TrainDriverPlaybackCycle[index] = 0;

    return 1;
}

PilotNextPlayback(index)
{
	switch(PilotPlaybackCycle[index])
    {
		case 0: FCNPC_StartPlayingPlayback(PilotNPCs[index], "at400_ls_to_lv");
		case 1: FCNPC_StartPlayingPlayback(PilotNPCs[index], "at400_lv_to_sf");
		case 2: FCNPC_StartPlayingPlayback(PilotNPCs[index], "at400_sf_to_ls");
	}

	PilotPlaybackCycle[index] ++;
	if (PilotPlaybackCycle[index] == 3)
        PilotPlaybackCycle[index] = 0;

    return 1;
}