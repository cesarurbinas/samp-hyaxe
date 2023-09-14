SendLGBTMessage(color, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_MISC[i][MISC_GAMEMODE] == 2)
			{
				SendResponsiveMessage(i, color, message, 135);
			}
		}
	}
	return 1;
}