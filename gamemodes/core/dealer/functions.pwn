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

		// Key area
		AddKeyArea(DEALER_INFO[i][dl_X], DEALER_INFO[i][dl_Y], 1.5, KEY_TYPE_Y);
	}
	return 1;
}