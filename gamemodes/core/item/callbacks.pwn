forward DeleteDropItem(index);
public DeleteDropItem(index)
{
	DestroyDynamicObject(DROP_ITEMS[index][itm_ID]);
	DestroyDynamic3DTextLabel(DROP_ITEMS[index][itm_LABEL]);

	DROP_ITEMS[index][itm_VALID] = false;
	DROP_ITEMS[index][itm_ID] = INVALID_STREAMER_ID;
	DROP_ITEMS[index][itm_LABEL] = Text3D:INVALID_STREAMER_ID;
	DROP_ITEMS[index][itm_TYPE] = 0;
	DROP_ITEMS[index][itm_AMMOUNT] = 0;
	DROP_ITEMS[index][itm_WORLD] = 0;
	DROP_ITEMS[index][itm_INTERIOR] = 0;
	DROP_ITEMS[index][itm_OWNER] = EOS;
	return 1;
}

forward FinishEat(playerid);
public FinishEat(playerid)
{
	ResetItemBody(playerid);
	ClearAnimations(playerid);
	PLAYER_TEMP[playerid][py_EATING] = false;
	return 1;
}