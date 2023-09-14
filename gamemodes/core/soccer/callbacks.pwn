public OnPlayerDisconnect(playerid, reason)
{
	if(BallHolder == playerid)
		RecreateBall();

	#if defined Soccer_OnPlayerDisconnect
		return Soccer_OnPlayerDisconnect(playerid, reason);
	#else
		return 1;
	#endif
}

#if defined Soccer_OnPlayerDisconnect
	forward Soccer_OnPlayerDisconnect(playerid, reason);
#endif

#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif

#define OnPlayerDisconnect Soccer_OnPlayerDisconnect

public OnPlayerSpawn(playerid)
{
	if(BallHolder == playerid)
		RecreateBall();

	#if defined Soccer_OnPlayerSpawn
		return Soccer_OnPlayerSpawn(playerid);
	#else
		return 1;
	#endif
}

#if defined Soccer_OnPlayerSpawn
	forward Soccer_OnPlayerSpawn(playerid);
#endif

#if defined _ALS_OnPlayerSpawn
	#undef OnPlayerSpawn
#else
	#define _ALS_OnPlayerSpawn
#endif

#define OnPlayerSpawn Soccer_OnPlayerSpawn

public OnPlayerDeath(playerid, killerid, reason)
{
	if(BallHolder == playerid)
		RecreateBall();

	#if defined Soccer_OnPlayerDeath
		return Soccer_OnPlayerDeath(playerid, killerid, reason);
	#else
		return 1;
	#endif
}

#if defined Soccer_OnPlayerDeath
	forward Soccer_OnPlayerDeath(playerid, killerid, reason);
#endif

#if defined _ALS_OnPlayerDeath
	#undef OnPlayerDeath
#else
	#define _ALS_OnPlayerDeath
#endif

#define OnPlayerDeath Soccer_OnPlayerDeath

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (GetPlayerVirtualWorld(playerid) == 1336)
	{
		new
			tick = GetTickCount(),
			dif;

		if (PRESSED(KEY_HANDBRAKE))
			pLastTick[playerid] = tick;

		else if (RELEASED(KEY_HANDBRAKE))
		{
			dif = tick - pLastTick[playerid];
			pLastTick[playerid] = -1;
			if(dif < 2000)
			{
				new
					Float:ox, Float:oy, Float:oz,
					Float:x, Float:y, Float:z;
				GetBallPos(ox, oy, oz);
				GetPlayerPos(playerid, x, y, z);
				if(IsPlayerInRangeOfPoint(playerid, 1.2, ox, oy, z) && floatabs(oz - z) < 1.8)
				{
					new
						Float:speed,
						Float:angle,
						Float:vx, Float:vy, Float:vz;

					if(dif > 1000)
						dif = 2000 - dif;
					speed = (float(dif + 400) / (1000)) * 20.0;

					if(BallHolder != -1)
					{
						DestroyBall();
						CreateBall();
						SetObjectPos(Ball, ox, oy, oz);
						BallHolder = -1;
					}

					GetPlayerFacingAngle(playerid, angle);
					vx = speed * floatsin(-angle, degrees),
					vy = speed * floatcos(-angle, degrees);
					vz = (speed / 5.2);

					PHY_SetObjectVelocity(Ball, vx, vy, vz);

					if(oz > BallSpawn[2] + (1.0 - 0.875))
						ApplyAnimation(playerid, "WAYFARER", "WF_Fwd", 4.0, 0, 0, 0, 0, 0);
					else if(dif > 300)
						ApplyAnimation(playerid, "FIGHT_D", "FightD_1", 4.1, 0, 1, 1, 0, 0);
					PlayerPlaySound(playerid, 1130, 0.0, 0.0, 0.0);

					LastTouch = playerid;
				}
			}
		}

		if (PRESSED(KEY_WALK))
			pLastTick[playerid] = tick;

		else if (RELEASED(KEY_WALK))
		{
			dif = tick - pLastTick[playerid];
			pLastTick[playerid] = -1;
			if(dif < 2000)
			{
				new
					Float:ox, Float:oy, Float:oz,
					Float:x, Float:y, Float:z;
				GetBallPos(ox, oy, oz);
				GetPlayerPos(playerid, x, y, z);
				if(IsPlayerInRangeOfPoint(playerid, 1.2, ox, oy, z) && floatabs(oz - z) < 1.8)
				{
					new
						Float:speed,
						Float:angle,
						Float:vx, Float:vy, Float:vz;

					if(dif > 1000)
						dif = 2000 - dif;
					speed = (float(dif + 400) / (1000)) * 15.0;

					if(BallHolder != -1)
					{
						DestroyBall();
						CreateBall();
						SetObjectPos(Ball, ox, oy, oz);
						BallHolder = -1;
					}

					GetPlayerFacingAngle(playerid, angle);
					vx = speed * floatsin(-angle, degrees),
					vy = speed * floatcos(-angle, degrees);
					vz = speed / 1.3;
					PHY_SetObjectVelocity(Ball, vx, vy, vz);

					if(oz > BallSpawn[2] + (1.0 - 0.875))
						ApplyAnimation(playerid, "WAYFARER", "WF_Fwd", 4.0, 0, 0, 0, 0, 0);
					else if(dif > 300)
						ApplyAnimation(playerid, "FIGHT_D", "FightD_1", 4.1, 0, 1, 1, 0, 0);
					PlayerPlaySound(playerid, 1130, 0.0, 0.0, 0.0);

					LastTouch = playerid;
				}
			}
		}

		if (PRESSED(KEY_SECONDARY_ATTACK))
			pLastTick[playerid] = tick;

		else if (RELEASED(KEY_SECONDARY_ATTACK))
		{
			dif = tick - pLastTick[playerid];
			pLastTick[playerid] = -1;
			if(dif < 2000)
			{
				new
					Float:ox, Float:oy, Float:oz,
					Float:x, Float:y, Float:z;

				GetBallPos(ox, oy, oz);
				GetPlayerPos(playerid, x, y, z);

				if(IsPlayerInRangeOfPoint(playerid, 1.2, ox, oy, z) && floatabs(oz - z) < 1.8)
				{
					new
						Float:speed,
						Float:angle,
						Float:vx, Float:vy, Float:vz;

					if(dif > 1000)
						dif = 2000 - dif;
					speed = (float(dif + 400) / (1000)) * 16.0;

					if(BallHolder != -1)
					{
						DestroyBall();
						CreateBall();
						SetObjectPos(Ball, ox, oy, oz);
						BallHolder = -1;
					}

					GetPlayerFacingAngle(playerid, angle);
					vx = speed * floatsin(-angle, degrees),
					vy = speed * floatcos(-angle, degrees);
					vz = speed / 2.0;
					PHY_SetObjectVelocity(Ball, vx, vy, vz);

					if(oz > BallSpawn[2] + (1.0 - 0.875))
						ApplyAnimation(playerid, "WAYFARER", "WF_Fwd", 4.0, 0, 0, 0, 0, 0);

					else if(dif > 300)
						ApplyAnimation(playerid, "FIGHT_D", "FightD_1", 4.1, 0, 1, 1, 0, 0);
					PlayerPlaySound(playerid, 1130, 0.0, 0.0, 0.0);

					LastTouch = playerid;
				}
			}
		}

		if(PRESSED(KEY_FIRE))
		{
			new
				Float:ox, Float:oy, Float:oz,
				Float:x, Float:y, Float:z;
			GetBallPos(ox, oy, oz);
			if(BallHolder == playerid)
			{
				DestroyBall();
				CreateBall();
				SetObjectPos(Ball, ox, oy, oz);
				BallHolder = -1;
			}
			else
			{
				GetPlayerPos(playerid, x, y, z);
				if(IsPlayerInRangeOfPoint(playerid, 1.2, ox, oy, z) && oz < z && (z - oz) < 1.2)
				{
					GetObjectRot(Ball, ox, oy, oz);
					AttachObjectToPlayer(Ball, playerid, 0.0, 0.6, -0.875, ox, oy, oz);

					if(BallHolder != -1)
						PlayerPlaySound(BallHolder, 1130, 0.0, 0.0, 0.0);
					PlayerPlaySound(playerid, 1130, 0.0, 0.0, 0.0);

					BallHolder = playerid;
					LastTouch = playerid;
				}
			}
		}
	}

	#if defined Soccer_OnPlayerKeyStateChange
		return Soccer_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
	#else
		return 1;
	#endif
}

#if defined Soccer_OnPlayerKeyStateChange
	forward Soccer_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
#endif

#if defined _ALS_OnPlayerKeyStateChange
	#undef OnPlayerKeyStateChange
#else
	#define _ALS_OnPlayerKeyStateChange
#endif

#define OnPlayerKeyStateChange Soccer_OnPlayerKeyStateChange

public PHY_OnObjectUpdate(objectid)
{
	if(objectid != Ball)
		return 1;

	new
		Float:x, Float:y, Float:z,
		goal;

	GetBallPos(x, y, z);

	if(!(2669.03 < x < 2745.12 && -1864.08 < y < -1740.54))
	{
		RecreateBall();
		SendToAllStadium("La pelota se fue de la cancha.");
	}
	else if((2701.92 < x < 2711.87 && -1862.75 < y < -1857.30 && (goal = 1)) || (2701.92 < x < 2711.89 && -1747.10 < y < -1741.60 && (goal = 2)))
	{
		PHY_SetObjectZBound(Ball, _, 425.6 , 0.5);

		if(z > 425.6)
		{
			RecreateBall();
			SendToAllStadium("La pelota se fue de la cancha.");

			new
				Float:mindist = FLOAT_INFINITY,
				Float:dist,
				closest;
			for(new i; i < sizeof Corners; i++)
			{
				dist = (x - Corners[i][0]) * (x - Corners[i][0]) + (y - Corners[i][1]) * (y - Corners[i][1]);
				if(dist < mindist)
				{
					mindist = dist;
					closest = i;
				}
			}
			SetObjectPos(Ball, Corners[closest][0], Corners[closest][1], Corners[closest][2]);
		}
		else if(!Goal)
		{
			new
				string[128],
				name[MAX_PLAYER_NAME];

			Goal = 1;

			GetPlayerName(LastTouch, name, sizeof name);
			format(string, sizeof string, "%s ha anotado un gol.", name);
			SendToAllStadium(string);
			#pragma unused goal
		}
	}
	else if(Goal)
	{
		Goal = 0;
		PHY_SetObjectZBound(Ball, _, FLOAT_INFINITY, 0.5);
	}

	return 1;
}
