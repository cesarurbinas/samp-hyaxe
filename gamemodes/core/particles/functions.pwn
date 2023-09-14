forward DestroyShitObject(objectid);
public DestroyShitObject(objectid)
{
	#if DEBUG_MODE == 1
		printf("DestroyShitObject"); // debug juju
	#endif

	return DestroyDynamicObject(objectid);
}

forward StopShitting(playerid);
public StopShitting(playerid)
{
	#if DEBUG_MODE == 1
		printf("StopShitting"); // debug juju
	#endif

	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 0, true);
	ClearAnimations(playerid);	
	SetPlayerChatBubble(playerid, "\n\n\n\n* Termina de cagar y se sube los pantalones.\n\n\n", 0xffcb90FF, 20.0, 5000);
	return 1;
}