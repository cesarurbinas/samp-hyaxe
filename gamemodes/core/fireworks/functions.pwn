// Utils
new FIREWORK_PARTICLES[] =
{
	19282, 19283, 19281, 19284
};

GetParticleRange(Float:range, Float:negative, &Float:x, &Float:y)
{	
	x = ( x + ( float_random( range ) - negative ) );
	y = ( y + ( float_random( range ) - negative ) );
	return 1;
}

RefreshFireworks(Float:range, Float:x, Float:y, Float:z)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
			{
				new Float:distance = GetPlayerDistanceFromPoint(i, x, y, z);
				if (distance <= range)
					Streamer_Update(i);
			}
		}
	}
	return 1;
}

/* Rocket firework */
forward DeleteRocketParticle(objectid);
public DeleteRocketParticle(objectid)
{
	DestroyDynamicObject(objectid);
	return 1;
}

forward RotateRocketParticle(objectid);
public RotateRocketParticle(objectid)
{
	new Float:x, Float:y, Float:z;
	GetDynamicObjectPos(objectid, x, y, z);

	MoveDynamicObject(objectid, x, y, z - 10.0, 2.0, 0.0, 0.0, 0.0);
	SetTimerEx("DeleteRocketParticle", minrand(900, 1200), false, "i", objectid);
	return 1;
}

forward ExplodeRocket(objectid);
public ExplodeRocket(objectid)
{
	new Float:x, Float:y, Float:z;
	GetDynamicObjectPos(objectid, x, y, z);
	DestroyDynamicObject(objectid);

	CreateExplosion(x, y, z, 12, 0.5);

	/*PlayFireworkSound(1131, 10.0, 0.0, 0.0, 0.0);
	new explosion = CreateDynamicObject(18681, x, y, z, 0.0, 0.0, 0.0, 0, 0);
	SetTimerEx("DeleteRocketParticle", 1000, false, "i", explosion);*/

	for(new i = 0; i != 12; i++)
	{
		new 
			Float:p_x = x,
			Float:p_y = y,
			Float:p_z = z
		;

		GetParticleRange(float_random(3.0), float_random(5.0), p_x, p_y);
		p_z = ( p_z + ( float_random(2.0) - float_random(2.0) ) );

		new projectile = CreateDynamicObject(FIREWORK_PARTICLES[ minrand(0, sizeof(FIREWORK_PARTICLES))], x, y, z, 0.0, 0.0, 0.0, 0, 0);
		MoveDynamicObject(projectile, p_x, p_y, p_z, 16.0, 0.0, 0.0, 0.0);
		SetTimerEx("RotateRocketParticle", 800, false, "i", projectile);
	}

	for(new i = 0; i != 12; i++)
	{
		new 
			Float:p_x = x,
			Float:p_y = y,
			Float:p_z = z
		;
		
		GetParticleRange(float_random(3.0), 0.0, p_x, p_y);
		p_z = ( p_z + ( float_random(2.0) + float_random(2.0) ) );

		new projectile = CreateDynamicObject(FIREWORK_PARTICLES[ minrand(0, sizeof(FIREWORK_PARTICLES))], x, y, z, 0.0, 0.0, 0.0, 0, 0);
		MoveDynamicObject(projectile, p_x, p_y, p_z, 16.0, 0.0, 0.0, 0.0);
		SetTimerEx("RotateRocketParticle", 800, false, "i", projectile);
	}

	RefreshFireworks(150.0, x, y, z);
	return 1;
}
/* End rocket firework*/

/* Volcan firework */
forward StartVolcanParticle(objectid, final);
public StartVolcanParticle(objectid, final)
{
	new Float:x, Float:y, Float:z;
	GetDynamicObjectPos(objectid, x, y, z);

	new 
		Float:p_x = x,
		Float:p_y = y
	;

	if (random(1) == 0) GetParticleRange(float_random(1.5), float_random(1.5), p_x, p_y);
	else GetParticleRange(float_random(1.5), 0.0, p_x, p_y);

	new projectile = CreateDynamicObject(minrand(19282, 19284), x, y, z, 0.0, 0.0, 0.0, 0, 0);
	MoveDynamicObject(projectile, p_x, p_y, z + 2.5 + float_random(1.0), 10.0, 0.0, 0.0, 0.0);
	SetTimerEx("RotateRocketParticle", 500, false, "i", projectile);

	RefreshFireworks(80.0, x, y, z);

	if (final) DestroyDynamicObject(objectid);
	return 1;
}

forward StartVolcan(objectid);
public StartVolcan(objectid)
{
	new
		ammount = minrand(50, 70),
		last_time
	;

	for(new i = 0; i != ammount; i++)
	{
		last_time += 1000;
		if (i >= (ammount - 1))
		{
			SetTimerEx("StartVolcanParticle", last_time - minrand(300, 600), false, "id", objectid, 1);
			break;
		}
		else SetTimerEx("StartVolcanParticle", last_time - minrand(300, 600), false, "id", objectid, 0);
	}
	return 1;
}
/* End volcan firework */


/* Petardo firwork */
forward StartPetardo(objectid);
public StartPetardo(objectid)
{
	new Float:x, Float:y, Float:z;
	GetDynamicObjectPos(objectid, x, y, z);
	DestroyDynamicObject(objectid);

	CreateExplosion(x, y, z, 12, 0.5);

	for(new i = 0; i != 10; i++)
	{
		new 
			Float:p_x = x,
			Float:p_y = y,
			Float:p_z = z + 2.5
		;
		
		GetParticleRange(float_random(3.0), float_random(3.0), p_x, p_y);
		p_z = ( p_z + ( float_random(1.0) + float_random(0.5) ) );

		new projectile = CreateDynamicObject(19282, x, y, z, 0.0, 0.0, 0.0, 0, 0);
		MoveDynamicObject(projectile, p_x, p_y, p_z, 16.0, 0.0, 0.0, 0.0);
		SetTimerEx("DeleteRocketParticle", 700, false, "i", projectile);
	}

	for(new i = 0; i != 10; i++)
	{
		new 
			Float:p_x = x,
			Float:p_y = y,
			Float:p_z = z
		;
		
		GetParticleRange(float_random(3.0), 0.0, p_x, p_y);
		p_z = ( p_z + ( float_random(1.0) + float_random(0.5) ) );

		new projectile = CreateDynamicObject(19282, x, y, z, 0.0, 0.0, 0.0, 0, 0);
		MoveDynamicObject(projectile, p_x, p_y, p_z, 16.0, 0.0, 0.0, 0.0);
		SetTimerEx("DeleteRocketParticle", 700, false, "i", projectile);
	}

	RefreshFireworks(50.0, x, y, z);
	return 1;
}
/* End petardo firework */

/* Lavako firework */
forward StartLavakoParticle(objectid, final);
public StartLavakoParticle(objectid, final)
{
	new Float:x, Float:y, Float:z;
	GetDynamicObjectPos(objectid, x, y, z);

	new projectile = CreateDynamicObject(19294, x, y, z, 0.0, 0.0, 0.0, 0, 0);
	MoveDynamicObject(projectile, x, y, z + 10.0 + float_random(10.0), 16.0, 0.0, 0.0, 0.0);
	SetTimerEx("RotateRocketParticle", 700, false, "i", projectile);

	RefreshFireworks(80.0, x, y, z);

	if (final) DestroyDynamicObject(objectid);
	return 1;
}

forward StartLavako(objectid);
public StartLavako(objectid)
{
	new
		ammount = minrand(50, 70),
		last_time
	;

	for(new i = 0; i != ammount; i++)
	{
		last_time += 200;
		if (i >= (ammount - 1))
		{
			SetTimerEx("StartLavakoParticle", last_time - minrand(300, 600), false, "id", objectid, 1);
			break;
		}
		else SetTimerEx("StartLavakoParticle", last_time - minrand(300, 600), false, "id", objectid, 0);
	}
	return 1;
}
/* End lavako firework */

/* 12 tiros firework */
forward DestryDocetiroParticle(objectid);
public DestryDocetiroParticle(objectid)
{
	new Float:x, Float:y, Float:z;
	GetDynamicObjectPos(objectid, x, y, z);
	CreateExplosion(x, y, z, 12, 0.5);
	DestroyDynamicObject(objectid);
	return 1;
}

forward StartDocetiroParticle(objectid, final);
public StartDocetiroParticle(objectid, final)
{
	new Float:x, Float:y, Float:z;
	GetDynamicObjectPos(objectid, x, y, z);

	new projectile = CreateDynamicObject(FIREWORK_PARTICLES[ minrand(0, sizeof(FIREWORK_PARTICLES))], x, y, z, 0.0, 0.0, 0.0, 0, 0);
	MoveDynamicObject(projectile, x, y, z + 10.0 + float_random(10.0), 16.0, 0.0, 0.0, 0.0);
	SetTimerEx("DestryDocetiroParticle", 700, false, "i", projectile);

	RefreshFireworks(80.0, x, y, z);

	if (final) DestroyDynamicObject(objectid);
	return 1;
}

forward StartDocetiro(objectid);
public StartDocetiro(objectid)
{
	new
		ammount = 12,
		last_time
	;

	for(new i = 0; i != ammount; i++)
	{
		last_time += 1500;
		if (i >= (ammount - 1))
		{
			SetTimerEx("StartDocetiroParticle", last_time, false, "id", objectid, 1);
			break;
		}
		else SetTimerEx("StartDocetiroParticle", last_time, false, "id", objectid, 0);
	}
	return 1;
}
/* End 12tiros firework */

/* Mortero firework */
forward DeleteMorteroParticle(objectid);
public DeleteMorteroParticle(objectid)
{
	DestroyDynamicObject(objectid);
	return 1;
}

forward RotateMorteroParticle(objectid);
public RotateMorteroParticle(objectid)
{
	new Float:x, Float:y, Float:z;
	GetDynamicObjectPos(objectid, x, y, z);

	MoveDynamicObject(objectid, x, y, z - 10.0, 2.0, 0.0, 0.0, 0.0);
	SetTimerEx("DeleteMorteroParticle", minrand(500, 800), false, "i", objectid);
	return 1;
}

MorteroBall(modelid, ammount, Float:range, Float:range_z, Float:x, Float:y, Float:z)
{
	CreateExplosion(x, y, z, 12, 0.5);

	for(new i = 0; i != ammount; i++)
	{
		new 
			Float:p_x = x,
			Float:p_y = y,
			Float:p_z = z
		;

		GetParticleRange(float_random(range), float_random(range), p_x, p_y);
		p_z = ( p_z + ( float_random(range_z) - float_random(range_z) ) );

		new projectile = CreateDynamicObject(modelid, x, y, z, 0.0, 0.0, 0.0, 0, 0);
		MoveDynamicObject(projectile, p_x, p_y, p_z, 16.0, 0.0, 0.0, 0.0);
		SetTimerEx("RotateMorteroParticle", 800, false, "i", projectile);
	}

	for(new i = 0; i != ammount; i++)
	{
		new 
			Float:p_x = x,
			Float:p_y = y,
			Float:p_z = z
		;
		
		GetParticleRange(float_random(range), 0.0, p_x, p_y);
		p_z = ( p_z + ( float_random(range_z) + float_random(range_z) ) );

		new projectile = CreateDynamicObject(modelid, x, y, z, 0.0, 0.0, 0.0, 0, 0);
		MoveDynamicObject(projectile, p_x, p_y, p_z, 16.0, 0.0, 0.0, 0.0);
		SetTimerEx("RotateMorteroParticle", 800, false, "i", projectile);
	}

	RefreshFireworks(150.0, x, y, z);
	return 1;
}

forward Mortero_1(Float:x, Float:y, Float:z);
public Mortero_1(Float:x, Float:y, Float:z)
{
	for(new i = 0; i != 4; i++)
	{
		new 
			Float:p_x = x,
			Float:p_y = y,
			Float:p_z = z
		;

		GetParticleRange(float_random(5.0), float_random(5.0), p_x, p_y);
		p_z = ( p_z + ( float_random(2.0) - float_random(2.0) ) );

		MorteroBall(FIREWORK_PARTICLES[ minrand(0, sizeof(FIREWORK_PARTICLES))], 12, 3.0, 1.0, p_x, p_y, p_z);
	}

	return 1;
}

forward Mortero_2(Float:x, Float:y, Float:z);
public Mortero_2(Float:x, Float:y, Float:z)
{
	MorteroBall(19294, 25, 15.0, 3.0, x, y, z);
	return 1;
}

forward Mortero_3(Float:x, Float:y, Float:z);
public Mortero_3(Float:x, Float:y, Float:z)
{
	MorteroBall(FIREWORK_PARTICLES[ minrand(0, sizeof(FIREWORK_PARTICLES))], 30, 15.0, 3.0, x, y, z);
	return 1;
}

forward ExplodeMortero(objectid);
public ExplodeMortero(objectid)
{
	new Float:x, Float:y, Float:z;
	GetDynamicObjectPos(objectid, x, y, z);
	DestroyDynamicObject(objectid);

	for(new i = 0; i != 2; i++)
	{
		new 
			Float:p_x = x,
			Float:p_y = y,
			Float:p_z = z
		;

		GetParticleRange(float_random(15.0), float_random(1.5), p_x, p_y);
		p_z = ( p_z + ( float_random(2.0) - float_random(2.0) ) );

		MorteroBall(19283, 5, 2.0, 1.0, p_x, p_y, p_z);

		SetTimerEx("Mortero_1", 1000, false, "fff", p_x, p_y, p_z);
	}

	SetTimerEx("Mortero_2", 3000, false, "fff", x, y, z);
	SetTimerEx("Mortero_3", 4000, false, "fff", x, y, z);
	return 1;
}
/* End mortero firework*/

PlayerFirework(playerid, type)
{
	if ((gettime() - PLAYER_TEMP[playerid][py_LIMIT_FIREWORK]) < 15) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 15 segundos para volver a~n~usar un fuego artificial.", 3);

	switch(type)
	{
		case 0:
		{
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 900, true);

			new Float:angle, Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			GetPlayerFacingAngle(playerid, angle);

			new projectile = CreateDynamicObject(19289, x, y, z + 1, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
			RefreshFireworks(80.0, x, y, z);
			
			PlayerPlaySound(playerid, 1131, 0.0, 0.0, 0.0);

			GetXYFromAngle(x, y, angle, 20.0);
			MoveDynamicObject(projectile, x, y, z + 13.0, 15.0, 0.0, 0.0, 0.0);
			
			SetTimerEx("ExplodeRocket", 1000, false, "i", projectile);
		}

		case 1:
		{
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 900, true);

			new Float:angle, Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			GetPlayerFacingAngle(playerid, angle);

			new projectile = CreateDynamicObject(19289, x, y, z + 1, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
			RefreshFireworks(150.0, x, y, z);
			
			PlayerPlaySound(playerid, 1131, 0.0, 0.0, 0.0);

			GetXYFromAngle(x, y, angle, 20.0);
			MoveDynamicObject(projectile, x, y, z + 25.0, 15.0, 0.0, 0.0, 0.0);
			
			SetTimerEx("ExplodeMortero", 1000, false, "i", projectile);
		}

		case 2:
		{
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 900, true);

			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);

			new petardo = CreateDynamicObject(18693, x, y, z - 2.5, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
			Streamer_Update(playerid);
			
			SetTimerEx("StartPetardo", 5000, false, "i", petardo);
		}

		case 3:
		{
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 900, true);

			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);

			new volcan = CreateDynamicObject(3013, x, y, z - 1.0, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
			Streamer_Update(playerid);
			
			SetTimerEx("StartVolcan", 3000, false, "i", volcan);
		}

		case 4:
		{
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 900, true);

			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);

			new lavako = CreateDynamicObject(3013, x, y, z - 1.0, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
			Streamer_Update(playerid);
			
			SetTimerEx("StartLavako", 3000, false, "i", lavako);
		}

		case 5:
		{
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 900, true);

			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);

			new docetiro = CreateDynamicObject(3013, x, y, z - 1.0, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));
			Streamer_Update(playerid);
			
			SetTimerEx("StartDocetiro", 3000, false, "i", docetiro);
		}
	}

	ResetItemBody(playerid);
	PLAYER_TEMP[playerid][py_LIMIT_FIREWORK] = gettime();
	return 1;
}

CMD:realfirework(playerid, params[])
{
	#emit jump cellmax
	return 1;
}