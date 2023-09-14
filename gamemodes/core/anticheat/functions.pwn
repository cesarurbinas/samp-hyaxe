bool:IsPlayerJumping(playerid)
{
	switch(GetPlayerAnimationIndex(playerid))
	{
		case 1128 .. 1138, 1195 .. 1198, 1438 .. 1440, 1061 .. 1064: return true;
	}

	return false;
}