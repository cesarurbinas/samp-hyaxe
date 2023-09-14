CreateStalls()
{
	for (new i; i < sizeof(STALL_INFO); i++)
	{
		STALL_INFO[i][st_SKIN] = minrand(0, sizeof(STALL_SKIN));
		STALL_INFO[i][st_PRODUCT] = minrand(0, sizeof(STALL_PRODUCT));

		CreateDynamicActor(
			STALL_INFO[i][st_SKIN],
			STALL_INFO[i][st_X],
			STALL_INFO[i][st_Y],
			STALL_INFO[i][st_Z],
			STALL_INFO[i][st_ANGLE],
			true, 100.0,
			0, 0
		);

		new Float:x, Float:y;
		x = 1.0 * floatsin(-STALL_INFO[i][st_ANGLE], degrees);
		y = 1.0 * floatcos(-STALL_INFO[i][st_ANGLE], degrees);

		CreateDynamicObject(
			3039,
			x,
			y,
			STALL_INFO[i][st_Z],
			0.0, 0.0, 0.0,
			0, 0
		);
	}
	return 1;
}