forward DestroyParticleObject(objectid);
public DestroyParticleObject(objectid)
{
	Logger_Debug("DestroyParticleObject"); // This is a debug line!

	return DestroyDynamicObject(objectid);
}

forward StopShitting(playerid);
public StopShitting(playerid)
{
	Logger_Debug("StopShitting"); // This is a debug line!

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
	Logger_Debug("DestroyFlashObject"); // This is a debug line!
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
	Logger_Debug("DestroyPlayerFlashObject"); // This is a debug line!

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

ActorBloodParticle(actorid)
{
	new Float:x, Float:y, Float:z;
	GetDynamicActorPos(actorid, x, y, z);

	for(new i = 0, j = 8; i <= j; i++)
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

		blood_particle = CreateDynamicObject(19836, blood_x, blood_y, z - 1.0, 0.0, 0.0, 0.0, GetDynamicActorVirtualWorld(actorid));
		SetTimerEx("DestroyParticleObject", minrand(5000, 12000), false, "i", blood_particle);
	}
	return 1;
}