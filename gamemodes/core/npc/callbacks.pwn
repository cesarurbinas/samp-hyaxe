public FCNPC_OnFinishPlayback(npcid)
{
	for(new traindriver = 0; traindriver < MAX_STANDARD_NPC_TRAINDRIVERS; traindriver++) {
		if (npcid == TrainDriverNPCs[traindriver])
        {
			TrainDriverNextPlayback(traindriver);
			break;
		}
	}
	for(new pilot = 0; pilot < MAX_STANDARD_NPC_PILOTS; pilot++)
    {
		if (npcid == PilotNPCs[pilot])
        {
			PilotNextPlayback(pilot);
			break;
		}
	}
	return 1;
}

public FCNPC_OnVehicleTakeDamage(npcid, issuerid, vehicleid, Float:amount, weaponid, Float:fX, Float:fY, Float:fZ)
{
	for(new traindriver = 0; traindriver < MAX_STANDARD_NPC_TRAINDRIVERS; traindriver++)
    {
		if (npcid == TrainDriverNPCs[traindriver]) return 0;
	}

	for(new pilot = 0; pilot < MAX_STANDARD_NPC_PILOTS; pilot++)
    {
		if (npcid == PilotNPCs[pilot]) return 0;
	}
	return 1;
}