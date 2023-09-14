forward HidePlayerMessage(playerid);
public HidePlayerMessage(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][17]);
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_MESSAGE], "_");
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_MESSAGE]);
	return 1;
}

forward HidePlayerAlert(playerid);
public HidePlayerAlert(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][20]);
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_ALERT], "_");
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_ALERT]);
	return 1;
}