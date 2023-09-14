GetFreeDropItemSlot()
{
    new i = MAX_DROP_ITEMS;
    while (--i != 0)
    {
        if (!DROP_ITEMS[i][itm_VALID]) return i;
    }
    return -1;
}

CreateDropItem(modelid, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz, worldid, interiorid, const name[] = "Null", const owner[] = "Null", type, ammount = 1, color = 0x00F7F7F7)
{
	new index = GetFreeDropItemSlot();
	if (index == -1) return print("[DEBUG] Error: Todos los slots de item sueltos estan ocupados.");

	DROP_ITEMS[index][itm_ID] = CreateDynamicObject(modelid, x, y, z, rx, ry, rz, worldid, interiorid);
	DROP_ITEMS[index][itm_MODELID] = modelid;
	DROP_ITEMS[index][itm_VALID] = true;
	DROP_ITEMS[index][itm_TYPE] = type;
	DROP_ITEMS[index][itm_AMMOUNT] = ammount;
	DROP_ITEMS[index][itm_COLOR] = color;
	DROP_ITEMS[index][itm_WORLD] = worldid;
	DROP_ITEMS[index][itm_INTERIOR] = interiorid;
	format(DROP_ITEMS[index][itm_NAME], 64, name);
	format(DROP_ITEMS[index][itm_OWNER], 24, owner);

	//SetDynamicObjectMaterial(DROP_ITEMS[index][itm_ID], 0, -1, "none", "none", color);

	if (interiorid == 0)
	{
		CA_FindZ_For2DCoord(x, y, z);
		MoveDynamicObject(DROP_ITEMS[index][itm_ID], x, y, z, 12.0, rx, ry, rz);
	}

	new str_text[72];
	format(str_text, sizeof(str_text), "{FFFFFF}%s", name);
	DROP_ITEMS[index][itm_LABEL] = CreateDynamic3DTextLabel(str_text, 0xFFFFFF00, x, y, z + 0.4, 3.0, .testlos = true, .worldid = worldid, .interiorid = interiorid);

	SetTimerEx("DeleteDropItem", DELETE_ITEM_TIME, false, "i", index);
	return 1;
}

forward DeleteDropItem(index);
public DeleteDropItem(index)
{
	DestroyDynamicObject(DROP_ITEMS[index][itm_ID]);
	DestroyDynamic3DTextLabel(DROP_ITEMS[index][itm_LABEL]);

	DROP_ITEMS[index][itm_VALID] = false;
	DROP_ITEMS[index][itm_ID] = INVALID_STREAMER_ID;
	DROP_ITEMS[index][itm_MODELID] = INVALID_STREAMER_ID;
	DROP_ITEMS[index][itm_LABEL] = Text3D:INVALID_STREAMER_ID;
	DROP_ITEMS[index][itm_TYPE] = 0;
	DROP_ITEMS[index][itm_AMMOUNT] = 0;
	DROP_ITEMS[index][itm_WORLD] = 0;
	DROP_ITEMS[index][itm_INTERIOR] = 0;
	DROP_ITEMS[index][itm_OWNER] = EOS;
	DROP_ITEMS[index][itm_NAME] = EOS;
	return 1;
}