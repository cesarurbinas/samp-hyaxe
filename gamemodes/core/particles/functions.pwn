forward DestroyParticleObject(objectid);
public DestroyParticleObject(objectid)
{
	#if DEBUG_MODE == 1
		printf("DestroyParticleObject"); // debug juju
	#endif

	return DestroyDynamicObject(objectid);
}

forward StopShitting(playerid);
public StopShitting(playerid)
{
	#if DEBUG_MODE == 1
		printf("StopShitting"); // debug juju
	#endif

	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 0, true);
	ClearAnimations(playerid);	
	SetPlayerChatBubble(playerid, "\n\n\n\n* Termina de cagar y se sube los pantalones.\n\n\n", 0xffcb90FF, 20.0, 5000);
	return 1;
}

PlayerBloodParticle(playerid)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);

	for(new i = 0, j = 5; i <= j; i++)
	{
		new
			blood_particle,
			Float:blood_x = x,
			Float:blood_y = y
		;
		
		RandomCordFromPoint(minrand(-2, 2), minrand(-2, 2), blood_x, blood_y);

		blood_particle = CreateDynamicObject(19836, blood_x, blood_y, z - 1.0, 0.0, 0.0, 0.0);
		SetTimerEx("DestroyParticleObject", minrand(5000, 12000), false, "i", blood_particle);
	}
	return 1;
}