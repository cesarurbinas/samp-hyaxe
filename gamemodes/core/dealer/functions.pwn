CreateDealers()
{
	for (new i; i < sizeof(DEALER_INFO); i++)
	{
		// Random features
		DEALER_INFO[i][dl_SKIN] = DEALER_SKIN[ minrand(0, sizeof(DEALER_SKIN))];

		// Seller actor
		DEALER_INFO[i][dl_ACTOR] = CreateDynamicActor(
			DEALER_INFO[i][dl_SKIN],
			DEALER_INFO[i][dl_X],
			DEALER_INFO[i][dl_Y],
			DEALER_INFO[i][dl_Z],
			DEALER_INFO[i][dl_ANGLE],
			false, 50.0, 0, 0
		);

		ApplyDynamicActorAnimation(DEALER_INFO[i][dl_ACTOR], "DEALER", "DEALER_IDLE", 4.0, 1, 1, 1, 0, 0);
		Streamer_SetIntData(STREAMER_TYPE_ACTOR, DEALER_INFO[i][dl_ACTOR], E_STREAMER_EXTRA_ID, ACTOR_TYPE_DEALER);

		// Key area
		AddKeyArea(DEALER_INFO[i][dl_X], DEALER_INFO[i][dl_Y], 1.5, KEY_TYPE_Y);
	}
	return 1;
}

CheckDealerSite(playerid)
{
	for (new i; i < sizeof(DEALER_INFO); i++)
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.0, DEALER_INFO[i][dl_X], DEALER_INFO[i][dl_Y], DEALER_INFO[i][dl_Z]))
		{
			if (IsDynamicActorInvulnerable(DEALER_INFO[i][dl_ACTOR])) return ShowPlayerMessage(playerid, "~r~Este vendedor esta muerto, vuelve mas tarde.", 3);
			PLAYER_TEMP[playerid][py_DEALER] = i;

			DEALER_INFO[i][dl_PRODUCT_TYPE] = random(3);
			DEALER_INFO[i][dl_PRODUCT_COUNT] = minrand(5, 15);
			DEALER_INFO[i][dl_PRICE] = ( DEALER_INFO[i][dl_PRODUCT_COUNT] * 80 ) + minrand(5, 100);
			DEALER_INFO[i][dl_PRICE_FOR_ASS] = minrand(1000, 2500);

			ShowPlayerMenu(playerid, DEALER_MENU, "Dealer");

			new str_text[128];
			switch(DEALER_INFO[i][dl_PRODUCT_TYPE])
			{
				case 1:
				{
					format(str_text, sizeof(str_text), "Comprar marihuana (x%d)", DEALER_INFO[i][dl_PRODUCT_COUNT]);
					AddPlayerMenuItem(playerid, str_text, sprintf("Precio: %d$", DEALER_INFO[i][dl_PRICE]));
				}
				default:
				{
					format(str_text, sizeof(str_text), "Comprar crack (x%d)", DEALER_INFO[i][dl_PRODUCT_COUNT]);
					AddPlayerMenuItem(playerid, str_text, sprintf("Precio: %d$", DEALER_INFO[i][dl_PRICE]));
				}
			}
			AddPlayerMenuItem(playerid, "Sobornar", sprintf("Precio: %d$", DEALER_INFO[i][dl_PRICE_FOR_ASS]));
		}
	}
	return 1;
}

forward TerminateDealingScene(playerid, actorid);
public TerminateDealingScene(playerid, actorid)
{
	ApplyDynamicActorAnimation(actorid, "DEALER", "DEALER_IDLE", 4.0, 1, 1, 1, 0, 0);
	ClearAnimations(playerid);
	return 1;
}

Menu:DEALER_MENU(playerid, response, listitem)
{
	new dealer = PLAYER_TEMP[playerid][py_DEALER];
    if (response == MENU_RESPONSE_SELECT)
    {
    	switch(listitem)
    	{
    		case 0:
    		{
    			if (CHARACTER_INFO[playerid][ch_CASH] < DEALER_INFO[dealer][dl_PRICE]) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3);
    			GivePlayerCash(playerid, -DEALER_INFO[dealer][dl_PRICE], false);

    			switch(DEALER_INFO[dealer][dl_PRODUCT_TYPE])
				{
					case 1: PLAYER_MISC[playerid][MISC_CANNABIS] += DEALER_INFO[dealer][dl_PRODUCT_COUNT];
					default: PLAYER_MISC[playerid][MISC_CANNABIS] += DEALER_INFO[dealer][dl_PRODUCT_COUNT];
				}

				SavePlayerMisc(playerid);

				// In-Front Position
				new
					Float:x = DEALER_INFO[dealer][dl_X],
					Float:y = DEALER_INFO[dealer][dl_Y],
					Float:angle
				;

				GetXYFromAngle(x, y, DEALER_INFO[dealer][dl_ANGLE], 1.0);

				GetPlayerFacingAngle(playerid, angle);
				SetPlayerPosEx(playerid, x, y, DEALER_INFO[dealer][dl_Z], angle, 0, 0);

				// Dealing scene
				ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.0, 1, 1, 1, 0, 0);
				ApplyDynamicActorAnimation(DEALER_INFO[dealer][dl_ACTOR], "DEALER", "DEALER_DEAL", 4.0, 1, 1, 1, 0, 0);

				SetTimerEx("TerminateDealingScene", 5000, false, "ii", playerid, DEALER_INFO[dealer][dl_ACTOR]);
    		}

    		case 1:
    		{
    			if (!PlayerIsInMafia(playerid)) return ShowPlayerMessage(playerid, "~r~No eres mafioso.", 3);
    			if (CHARACTER_INFO[playerid][ch_CASH] < DEALER_INFO[dealer][dl_PRICE_FOR_ASS]) return ShowPlayerMessage(playerid, "~r~No tienes dinero suficiente.", 3);
    			GivePlayerCash(playerid, -DEALER_INFO[dealer][dl_PRICE_FOR_ASS], false);

    			DEALER_INFO[dealer][dl_MAFIA] = GetPlayerMafia(playerid);

    			ShowPlayerNotification(playerid, "Ahora este ~r~dealer~w~ trabaja para tu mafia.", 4);
    		}
    	}
    }
    return 1;
}