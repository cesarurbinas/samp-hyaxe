CreateStalls()
{
	for (new i; i < sizeof(STALL_INFO); i++)
	{
		STALL_INFO[i][st_SKIN] = STALL_SKIN[ minrand(0, sizeof(STALL_SKIN))];
		STALL_INFO[i][st_PRODUCT] = minrand(0, sizeof(STALL_PRODUCT));

		STALL_INFO[i][st_ACTOR] = CreateDynamicActor(
			STALL_INFO[i][st_SKIN],
			STALL_INFO[i][st_X],
			STALL_INFO[i][st_Y],
			STALL_INFO[i][st_Z],
			STALL_INFO[i][st_ANGLE],
			true, 100.0, 0, 0
		);

		new
			Float:x = STALL_INFO[i][st_X],
			Float:y = STALL_INFO[i][st_Y]
		;

		GetXYFromAngle(x, y, STALL_INFO[i][st_ANGLE], 1.0);

		STALL_INFO[i][st_OBJECT] = CreateDynamicObject(
			3039,
			x,
			y,
			STALL_INFO[i][st_Z] - 1.0,
			0.0, 0.0, STALL_INFO[i][st_ANGLE], 0, 0
		);

		new str_text[128];
		format(str_text, sizeof(str_text),
			""COL_WHITE"Puesto de comida\n%s a "COL_GREEN"%d$",
			STALL_PRODUCT[ STALL_INFO[i][st_PRODUCT] ][stp_NAME],
			STALL_PRODUCT[ STALL_INFO[i][st_PRODUCT] ][stp_PRICE]
		);

		STALL_INFO[i][st_LABEL] = CreateDynamic3DTextLabel(
			str_text, 0xF7F7F700,
			x,
			y,
			STALL_INFO[i][st_Z] + 0.9,
			10.0
		);
	}
	return 1;
}