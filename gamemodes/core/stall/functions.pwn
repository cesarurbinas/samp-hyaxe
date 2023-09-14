CreateStalls()
{
	for (new i; i < sizeof(STALL_INFO); i++)
	{
		// Random features
		STALL_INFO[i][st_SKIN] = STALL_SKIN[ minrand(0, sizeof(STALL_SKIN))];
		STALL_INFO[i][st_PRODUCT] = minrand(0, sizeof(STALL_PRODUCT));

		// Seller actor
		STALL_INFO[i][st_ACTOR] = CreateDynamicActor(
			STALL_INFO[i][st_SKIN],
			STALL_INFO[i][st_X],
			STALL_INFO[i][st_Y],
			STALL_INFO[i][st_Z],
			STALL_INFO[i][st_ANGLE],
			true, 100.0, 0, 0
		);

		// In-Front Position
		new
			Float:x = STALL_INFO[i][st_X],
			Float:y = STALL_INFO[i][st_Y]
		;

		GetXYFromAngle(x, y, STALL_INFO[i][st_ANGLE], 1.0);

		// Stall object
		STALL_INFO[i][st_OBJECT] = CreateDynamicObject(
			3039,
			x,
			y,
			STALL_INFO[i][st_Z] - 1.0,
			0.0, 0.0, STALL_INFO[i][st_ANGLE], 0, 0
		);

		// Information label
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

		// Key area
		AddKeyArea(x, y, 1.6, KEY_TYPE_ALT);
	}
	return 1;
}

CheckStallPoint(playerid)
{
	for (new i; i < sizeof(STALL_INFO); i++)
	{
		if (IsPlayerInRangeOfPoint(playerid, 2.6, STALL_INFO[i][st_X], STALL_INFO[i][st_Y], STALL_INFO[i][st_Z]))
		{
			if (CHARACTER_INFO[playerid][ch_CASH] <= STALL_PRODUCT[ STALL_INFO[i][st_PRODUCT] ][stp_PRICE])
				return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3);
			
			GivePlayerCash(playerid, -STALL_PRODUCT[ STALL_INFO[i][st_PRODUCT] ][stp_PRICE], false);

			switch(STALL_PRODUCT[ STALL_INFO[i][st_PRODUCT] ][stp_TYPE])
			{
				case 0:
				{
					ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 0, 0, 0, 0, 0, 0);
					ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 4.1, false, true, true, false, 1000);
				}
				case 1:
				{
					ApplyAnimation(playerid, "GANGS", "DRNKBR_PRTL", 0, 0, 0, 0, 0, 0);
					ApplyAnimation(playerid, "GANGS", "DRNKBR_PRTL", 4.1, false, true, true, false, 1000);
				}
			}

			Add_Hungry_Thirst(
				playerid,
				STALL_PRODUCT[ STALL_INFO[i][st_PRODUCT] ][stp_HUNGRY],
				STALL_PRODUCT[ STALL_INFO[i][st_PRODUCT] ][stp_THIRST]
			);

			if (random(50) == 25) GivePlayerReputation(playerid);
			break;
		}
	}

	return 1;
}