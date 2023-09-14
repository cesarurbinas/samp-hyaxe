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

CreateFlashObject(Float:x, Float:y, Float:z)
{
	new oid = CreateObject(18680, x, y, z, 0.0, 0.0, 0.0);
	SetTimerEx("DestroyFlashObject", 1000, false, "i", oid);
	return 1;
}

forward DestroyFlashObject(objectid);
public DestroyFlashObject(objectid)
{
	#if DEBUG_MODE == 1
		printf("DestroyFlashObject"); // debug juju
	#endif

	return DestroyObject(objectid);
}

CreatePlayerFlashObject(playerid, Float:x, Float:y, Float:z)
{
	new oid = CreatePlayerObject(playerid, 18680, x, y, z, 0.0, 0.0, 0.0);
	SetTimerEx("DestroyPlayerFlashObject", 1000, false, "ii", playerid, oid);
	return 1;
}

forward DestroyPlayerFlashObject(playerid, objectid);
public DestroyPlayerFlashObject(playerid, objectid)
{
	#if DEBUG_MODE == 1
		printf("DestroyPlayerFlashObject"); // debug juju
	#endif

	return DestroyPlayerObject(playerid, objectid);
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
			Float:blood_y = y,
			rand = random(9)
		;

		switch(rand)
		{
			case 0: blood_x += -0.3;
			case 1: blood_x += -0.2;
			case 2: blood_x += -0.1;
			case 3: blood_x += 0.3;
			case 4: blood_x += 0.2;
			case 5: blood_x += 0.1;
			case 6: blood_x += 0.4;
			case 7: blood_x += 0.5;
			case 8: blood_x += -0.4;
			case 9: blood_x += -0.5;
			default: blood_x = 0.0;
		}

		rand = random(9);

		switch(rand)
		{
			case 0: blood_y += -0.3;
			case 1: blood_y += -0.2;
			case 2: blood_y += -0.1;
			case 3: blood_y += 0.3;
			case 4: blood_y += 0.2;
			case 5: blood_y += 0.1;
			case 6: blood_y += 0.4;
			case 7: blood_y += 0.5;
			case 8: blood_y += -0.4;
			case 9: blood_y += -0.5;
			default: blood_y = 0.0;
		}

		blood_particle = CreateDynamicObject(19836, blood_x, blood_y, z - 1.0, 0.0, 0.0, 0.0);
		SetTimerEx("DestroyParticleObject", minrand(5000, 12000), false, "i", blood_particle);
	}
	return 1;
}