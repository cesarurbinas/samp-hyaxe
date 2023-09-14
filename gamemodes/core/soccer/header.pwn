stock const
	Float:BallSpawn[3] = {2706.9944, -1802.1829, 422.8372},
	Float:Corners[4][3] = {
		{2677.1453, -1748.0548, 422.8372},
		{2736.6797, -1747.9595, 422.8372},
		{2736.7180, -1856.2570, 422.8372},
		{2677.3398, -1856.5066, 422.8372}
	};


new
	Ball = -1,
	Goal = 0,
	LastTouch = INVALID_PLAYER_ID,
	pLastTick[MAX_PLAYERS],
	BallHolder = -1;