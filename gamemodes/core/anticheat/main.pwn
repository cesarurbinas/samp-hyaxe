IPacket:PLAYER_SYNC(playerid, BitStream:bs)
{
	if(PLAYER_TEMP[playerid][py_KICKED]) return 0;

	new onFootData[PR_OnFootSync];

	BS_IgnoreBits(bs, 8);
	BS_ReadOnFootSync(bs, onFootData);

	if(ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
	{
		if(!IsPlayerInAnyVehicle(playerid) && onFootData[PR_specialAction] != SPECIAL_ACTION_USEJETPACK && !onFootData[PR_surfingVehicleId])
		{
			if(!IsPlayerJumping(playerid))
			{
				if(onFootData[PR_animationId] == 1159 && (floatabs(onFootData[PR_velocity][0]) > 0.08 || floatabs(onFootData[PR_velocity][1]) > 0.08))
				{
					if(floatabs(onFootData[PR_velocity][0]) > floatabs(onFootData[PR_velocity][1])) OnPlayerCheatDetected(playerid, CHEAT_PLAYER_SPEED, onFootData[PR_velocity][0]);
					else OnPlayerCheatDetected(playerid, CHEAT_PLAYER_SPEED, onFootData[PR_velocity][1]);
					return 0;
				}

				if(floatabs(onFootData[PR_velocity][0]) > 0.32 || floatabs(onFootData[PR_velocity][1]) > 0.32)
				{
					if(floatabs(onFootData[PR_velocity][0]) > floatabs(onFootData[PR_velocity][1])) OnPlayerCheatDetected(playerid, CHEAT_PLAYER_SPEED, onFootData[PR_velocity][0]);
					else OnPlayerCheatDetected(playerid, CHEAT_PLAYER_SPEED, onFootData[PR_velocity][1]);
					return 0;
				}
			}
		}
	}

	return 1;
}