SetTeleView(playerid)
{
	new Float:angle;
	GetPlayerFacingAngle(playerid, angle);

	PLAYER_TEMP[playerid][py_IN_TELE] = true;

	TogglePlayerControllableEx(playerid, false);
	SetFirstPerson(playerid, true, true);

	ShowPlayerMessage(playerid, "Presiona ~r~ALT~w~ para salir", 3);
	return 1;
}

CloseTeleView(playerid)
{
	PLAYER_TEMP[playerid][py_IN_TELE] = false;
	ClearAnimations(playerid);
	TogglePlayerControllableEx(playerid, true);

	if (PLAYER_MISC[playerid][MISC_CONFIG_FP]) SetFirstPerson(playerid, true);
	else SetCameraBehindPlayer(playerid);
	return 1;
}