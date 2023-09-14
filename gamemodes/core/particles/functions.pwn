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

BloodParticle(playerid)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);

	new blood_particle = CreateDynamicObject(19836, x, y, z, 0.0, 0.0, 0.0);
	SetTimerEx("DestroyParticleObject", 5000, false, "i", blood_particle);
	return 1;
}