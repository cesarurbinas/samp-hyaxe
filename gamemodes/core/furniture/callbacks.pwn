forward OnEditFinish(playerid, objectid);
public OnEditFinish(playerid, objectid)
{
	if (PLAYER_TEMP[playerid][py_FURNITURE_SELECTED])
	{
		UpdatePropertyObject(PLAYER_TEMP[playerid][py_FURNITURE_SELECTED], objectid);
	}
	return 1;
}