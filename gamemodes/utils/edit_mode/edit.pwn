EditingMode(playerid, objectid)
{
	ShowPlayerNotification(playerid, "~w~Mover/Rotar: ~r~WASD~w~~n~Subir: ~r~C~w~~n~Bajar: ~r~SPACE~w~~n~Cambiar modo: ~r~H~w~~n~Salir: ~r~ALT", 12);

	new Float:pos[3];
	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);

	PLAYER_TEMP[playerid][py_EDITING_MODE] = true;
	PLAYER_TEMP[playerid][py_EDITING_OBJ] = objectid;
	PLAYER_TEMP[playerid][py_EDITING_MODE_TYPE] = 0;
	TogglePlayerControllableEx(playerid, false);

	SetPlayerCameraPos(playerid, pos[0], pos[1] + 0.40, pos[2] + 0.5);

	GetDynamicObjectPos(objectid, pos[0], pos[1], pos[2]);
	SetPlayerCameraLookAt(playerid, pos[0], pos[1], pos[2]);

	Streamer_Update(playerid);
	ShowPlayerMessage(playerid, "Modo de edición: ~r~Posición", 3600);
	return 1;
}

SetEditModeType(playerid, type = 0)
{
	PLAYER_TEMP[playerid][py_EDITING_MODE_TYPE] = type;
	
	if (type == 0) ShowPlayerMessage(playerid, "Modo de edición: ~r~Posición", 3600);
	else ShowPlayerMessage(playerid, "Modo de edición: ~r~Rotación", 3600);

	PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	return 1;
}

CancelEditingMode(playerid)
{
	PLAYER_TEMP[playerid][py_EDITING_MODE] = false;
	TogglePlayerControllableEx(playerid, true);

	if (PLAYER_MISC[playerid][MISC_CONFIG_FP]) SetFirstPerson(playerid, true);
	else SetCameraBehindPlayer(playerid);

	ShowPlayerNotification(playerid, "Has salido del modo de edición.", 3);
	ShowPlayerMessage(playerid, "_", 1);
	return 1;
}