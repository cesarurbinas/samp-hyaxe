inv_AccommodateAccessories(playerid)
{
	new bool:toys_inv_slots[6];

	if (PLAYER_TOYS[playerid][0][player_toy_VALID])
	{
		if (!toys_inv_slots[0])
		{
			PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][5], PLAYER_TOYS[playerid][0][player_toy_MODELID]);
			PlayerTextDrawSetPreviewRot(playerid, PlayerTextdraws[playerid][ptextdraw_INV][5], -15.000000, 0.000000, 12.000000, 1.000000);
			toys_inv_slots[0] = true;
			PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]++;
		}
	}

	if (PLAYER_TOYS[playerid][1][player_toy_VALID])
	{
		if (!toys_inv_slots[1])
		{
			PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][6], PLAYER_TOYS[playerid][1][player_toy_MODELID]);
			PlayerTextDrawSetPreviewRot(playerid, PlayerTextdraws[playerid][ptextdraw_INV][6], -15.000000, 0.000000, 12.000000, 1.000000);
			toys_inv_slots[1] = true;
		}
	}

	if (PLAYER_TOYS[playerid][2][player_toy_VALID])
	{
		if (!toys_inv_slots[2])
		{
			PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][7], PLAYER_TOYS[playerid][2][player_toy_MODELID]);
			PlayerTextDrawSetPreviewRot(playerid, PlayerTextdraws[playerid][ptextdraw_INV][7], -15.000000, 0.000000, 12.000000, 1.000000);
			toys_inv_slots[2] = true;
			PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]++;
		}
	}

	if (PLAYER_TOYS[playerid][3][player_toy_VALID])
	{
		if (!toys_inv_slots[3])
		{
			PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][8], PLAYER_TOYS[playerid][3][player_toy_MODELID]);
			PlayerTextDrawSetPreviewRot(playerid, PlayerTextdraws[playerid][ptextdraw_INV][8], -15.000000, 0.000000, 12.000000, 1.000000);
			toys_inv_slots[3] = true;
			PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]++;
		}
	}

	if (PLAYER_TOYS[playerid][4][player_toy_VALID])
	{
		if (!toys_inv_slots[4])
		{
			PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][9], PLAYER_TOYS[playerid][0][player_toy_MODELID]);
			PlayerTextDrawSetPreviewRot(playerid, PlayerTextdraws[playerid][ptextdraw_INV][9], -15.000000, 0.000000, 12.000000, 1.000000);
			toys_inv_slots[4] = true;
			PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]++;
		}
	}
}

inv_GetFreeSlot(playerid, type = 0)
{
    new i = 12;

    switch(type)
    {
    	case 0: // Para inventario de jugador
    	{
    		while (--i != 0)
		    {
		        if (!PLAYER_VISUAL_INV[playerid][slot_VALID][i]) return i;
		    }
    	}
    	case 1: // Para almacenes de casas
    	{
    		while (--i != 0)
		    {
		        if (!PROPERTY_VISUAL_INV[playerid][slot_VALID][i]) return i;
		    }
    	}
    }
    return false;
}

GetTypePreviewRot(type, &Float:rx, &Float:ry, &Float:rz, &Float:zoom)
{
	rx = -15.000000;
	ry = 0.000000;
	rz = 30.000000;
	zoom = 1.000000;

	switch(type)
	{
		case 1..4: // Drogas y medicinas
		{
			rx = 90.000000;
			ry = 15.000000;
			rz = 0.000000;
			zoom = 1.000000;	
		}
		case 34: // Celular
		{
			rx = 90.000000;
			ry = 0.000000;
			rz = 0.000000;
			zoom = 0.800000;	
		}
		case 41: // Calabaza
		{
			zoom = 0.800000;
		}
	}
	return 1;
}

inv_ItemToTextdraw(playerid, slot, type)
{
	new 
		td_init = (slot + 10),
		td_ammount = td_init + 12,
		str_text[32],
		Float:rot[4];

	PLAYER_VISUAL_INV[playerid][slot_TD_ID][slot] = PlayerTextdraws[playerid][ptextdraw_INV][td_init];

	if (PLAYER_VISUAL_INV[playerid][slot_TYPE][slot] == 34)
	{
		format(str_text, sizeof(str_text), "Cel");
	}
	else
	{
		format(str_text, sizeof(str_text), "%d", PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][slot]);
	}

	if (ITEM_INFO[type][item_SINGLE_SLOT])
		format(str_text, sizeof(str_text), "");

	switch(PLAYER_VISUAL_INV[playerid][slot_TYPE][slot])
	{
		case 9, 10, 11, 39: format(str_text, sizeof(str_text), "Balas");
		case 40: format(str_text, sizeof(str_text), "Geo");
	}

	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_ammount], str_text);

	GetTypePreviewRot(type, rot[0], rot[1], rot[2], rot[3]);
	PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_init], ITEM_INFO[type][item_NAME]);
	PlayerTextDrawSetPreviewRot(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_init], rot[0], rot[1], rot[2], rot[3]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_init]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_ammount]);
	PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]++;
	return 1;
}

inv_AccommodatePropertyItems(playerid, property_id)
{
	PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] = 0;

	for(new x = 0; x != 12; x++)
	{
		PROPERTY_VISUAL_INV[playerid][slot_VALID][x] = false;
		PROPERTY_VISUAL_INV[playerid][slot_TYPE][x] = 0;
		PROPERTY_VISUAL_INV[playerid][slot_AMMOUNT][x] = 0;
		PROPERTY_VISUAL_INV[playerid][slot_WEAPON][x] = false;
		PROPERTY_VISUAL_INV[playerid][slot_WEAPON_SLOT][x] = 0;
	}

	new
		DBResult:Result,
		DB_Query[140]
	;

	format(DB_Query, sizeof DB_Query, "SELECT * FROM `PROPERTY_STORAGE` WHERE `ID_PROPERTY` = '%d';", property_id);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		for(new i; i < db_num_rows(Result); i++ )
		{
			new 
				str_text[32],
				td_init = (i + 10),
				td_ammount = td_init + 12,
				type = db_get_field_assoc_int(Result, "TYPE"),
				extra = db_get_field_assoc_int(Result, "EXTRA"),
				id = db_get_field_assoc_int(Result, "ID"),
				Float:rot[4]
			;

			//printf("slot: %d, type: %d, extra: %d, modelid: %d", i, type, extra, GetItemObjectByType(type));

			format(str_text, sizeof(str_text), "%d", extra);

			switch(type)
			{
				case 9, 10, 11, 55: format(str_text, sizeof(str_text), "Balas");
				case 56: format(str_text, sizeof(str_text), "Geo");
			}

			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_ammount], str_text);

			GetTypePreviewRot(type, rot[0], rot[1], rot[2], rot[3]);
			PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_init], ITEM_INFO[type][item_MODELID]);
			PlayerTextDrawSetPreviewRot(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_init], rot[0], rot[1], rot[2], rot[3]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_init]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_ammount]);
			
			PROPERTY_VISUAL_INV[playerid][slot_VALID][i] = true;
			PROPERTY_VISUAL_INV[playerid][slot_TYPE][i] = type;
			PROPERTY_VISUAL_INV[playerid][slot_AMMOUNT][i] = extra;
			PROPERTY_VISUAL_INV[playerid][slot_DB_ID][i] = id;

			PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] ++;
			db_next_row(Result);
		}
		db_free_result(Result);
	}
	return 1;
}

inv_AccommodateVehicleItems(playerid, vehicle_id)
{
	PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] = 0;

	for(new x = 0; x != 12; x++)
	{
		PROPERTY_VISUAL_INV[playerid][slot_VALID][x] = false;
		PROPERTY_VISUAL_INV[playerid][slot_TYPE][x] = 0;
		PROPERTY_VISUAL_INV[playerid][slot_AMMOUNT][x] = 0;
		PROPERTY_VISUAL_INV[playerid][slot_WEAPON][x] = false;
		PROPERTY_VISUAL_INV[playerid][slot_WEAPON_SLOT][x] = 0;
	}

	new
		DBResult:Result,
		DB_Query[140]
	;

	format(DB_Query, sizeof DB_Query, "SELECT * FROM `VEHICLE_STORAGE` WHERE `ID_VEHICLE` = '%d';", vehicle_id);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		for(new i; i < db_num_rows(Result); i++ )
		{
			new 
				str_text[32],
				td_init = (i + 10),
				td_ammount = td_init + 12,
				type = db_get_field_assoc_int(Result, "TYPE"),
				extra = db_get_field_assoc_int(Result, "EXTRA"),
				id = db_get_field_assoc_int(Result, "ID"),
				Float:rot[4]
			;

			//printf("slot: %d, type: %d, extra: %d, modelid: %d", i, type, extra, GetItemObjectByType(type));

			format(str_text, sizeof(str_text), "%d", extra);

			switch(type)
			{
				case 9, 10, 11, 55: format(str_text, sizeof(str_text), "Balas");
				case 56: format(str_text, sizeof(str_text), "Geo");
			}

			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_ammount], str_text);

			GetTypePreviewRot(type, rot[0], rot[1], rot[2], rot[3]);
			PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_init], ITEM_INFO[type][item_MODELID]);
			PlayerTextDrawSetPreviewRot(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_init], rot[0], rot[1], rot[2], rot[3]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_init]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_ammount]);
			
			PROPERTY_VISUAL_INV[playerid][slot_VALID][i] = true;
			PROPERTY_VISUAL_INV[playerid][slot_TYPE][i] = type;
			PROPERTY_VISUAL_INV[playerid][slot_AMMOUNT][i] = extra;
			PROPERTY_VISUAL_INV[playerid][slot_DB_ID][i] = id;

			PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] ++;
			db_next_row(Result);
		}
		db_free_result(Result);
	}
	return 1;
}

inv_AccommodateItems(playerid, bool:is_visual = true)
{
	for(new x = 0; x != 12; x++)
	{
		PLAYER_VISUAL_INV[playerid][slot_VALID][x] = false;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][x] = 0;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][x] = 0;
		PLAYER_VISUAL_INV[playerid][slot_WEAPON][x] = false;
		PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][x] = 0;
	}

	new free_slot;

	if (PLAYER_PHONE[playerid][player_phone_VALID])
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 50;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = 1;
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 50);
	}

	for(new i; i != 13; i ++)
	{
		if (!PLAYER_WEAPONS[playerid][i][player_weapon_VALID]) continue;

		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = WeaponToType(PLAYER_WEAPONS[playerid][i][player_weapon_ID]);
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_WEAPONS[playerid][i][player_weapon_AMMO];
		PLAYER_VISUAL_INV[playerid][slot_WEAPON][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][free_slot] = i;
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, WeaponToType(PLAYER_WEAPONS[playerid][i][player_weapon_ID]));
	}

	if (PLAYER_MISC[playerid][MISC_BOTIKIN] > 0)
	{
		for(new i; i != PLAYER_MISC[playerid][MISC_BOTIKIN]; i ++)
		{
			free_slot = inv_GetFreeSlot(playerid);
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

			PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
			PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 0;
			PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = 1;
			if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 0);
		}
	}

	if (PLAYER_MISC[playerid][MISC_FIXKIT] > 0)
	{
		for(new i; i != PLAYER_MISC[playerid][MISC_FIXKIT]; i ++)
		{
			free_slot = inv_GetFreeSlot(playerid);
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

			PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
			PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 53;
			PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = 1;
			if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 53);
		}
	}

	if (PLAYER_MISC[playerid][MISC_MEDICINE] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 1;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_MEDICINE];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 1);
	}

	if (PLAYER_MISC[playerid][MISC_VENDAS] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 2;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_VENDAS];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 2);
	}

	if (PLAYER_MISC[playerid][MISC_CANNABIS] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 3;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_CANNABIS];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 3);
	}

	if (PLAYER_MISC[playerid][MISC_CRACK] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 4;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_CRACK];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 4);
	}

	if (PLAYER_MISC[playerid][MISC_JOINT] > 0)
	{
		for(new i; i != PLAYER_MISC[playerid][MISC_JOINT]; i ++)
		{
			free_slot = inv_GetFreeSlot(playerid);
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

			PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
			PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 54;
			PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = 1;
			if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 54);
		}
	}

	if (PLAYER_MISC[playerid][MISC_FUEL_DRUM] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 5;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_FUEL_DRUM];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 5);
	}

	if (PLAYER_MISC[playerid][MISC_ROD] > 0)
	{
		for(new i; i != PLAYER_MISC[playerid][MISC_ROD]; i ++)
		{
			free_slot = inv_GetFreeSlot(playerid);
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

			PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
			PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 51;
			PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = 1;
			if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 51);
		}
	}

	if (PLAYER_MISC[playerid][MISC_MALLET] > 0)
	{
		for(new i; i != PLAYER_MISC[playerid][MISC_MALLET]; i ++)
		{
			free_slot = inv_GetFreeSlot(playerid);
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

			PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
			PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 52;
			PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = 1;
			if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 52);
		}
	}

	if (PLAYER_MISC[playerid][MISC_SEED_MEDICINE] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 6;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_SEED_MEDICINE];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 6);
	}

	if (PLAYER_MISC[playerid][MISC_SEED_CANNABIS] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 7;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_SEED_CANNABIS];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 7);
	}

	if (PLAYER_MISC[playerid][MISC_SEED_CRACK] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 8;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_SEED_CRACK];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 8);
	}

	if (PLAYER_MISC[playerid][MISC_CARTRIDGE_1] > 0)
	{
		for(new i; i != PLAYER_MISC[playerid][MISC_CARTRIDGE_1]; i ++)
		{
			free_slot = inv_GetFreeSlot(playerid);
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

			PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
			PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 9;
			PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = 1;
			if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 9);
		}
	}

	if (PLAYER_MISC[playerid][MISC_CARTRIDGE_2] > 0)
	{
		for(new i; i != PLAYER_MISC[playerid][MISC_CARTRIDGE_2]; i ++)
		{
			free_slot = inv_GetFreeSlot(playerid);
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

			PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
			PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 10;
			PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = 1;
			if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 10);
		}
	}

	if (PLAYER_MISC[playerid][MISC_CARTRIDGE_3] > 0)
	{
		for(new i; i != PLAYER_MISC[playerid][MISC_CARTRIDGE_3]; i ++)
		{
			free_slot = inv_GetFreeSlot(playerid);
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

			PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
			PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 11;
			PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = 1;
			if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 11);
		}
	}

	if (PLAYER_MISC[playerid][MISC_CARTRIDGE_4] > 0)
	{
		for(new i; i != PLAYER_MISC[playerid][MISC_CARTRIDGE_4]; i ++)
		{
			free_slot = inv_GetFreeSlot(playerid);
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

			PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
			PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 55;
			PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = 1;
			if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 55);
		}
	}

	if (PLAYER_MISC[playerid][MISC_GEO] > 0)
	{
		for(new i; i != PLAYER_MISC[playerid][MISC_GEO]; i ++)
		{
			free_slot = inv_GetFreeSlot(playerid);
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

			PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
			PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 56;
			PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = 1;
			if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 56);
		}
	}

	if (PLAYER_MISC[playerid][MISC_PUMPKIN] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 57;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_PUMPKIN];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 57);
	}

	if (PLAYER_MISC[playerid][MISC_ROCKET] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 58;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_ROCKET];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 58);
	}

	if (PLAYER_MISC[playerid][MISC_MORTERO] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 59;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_MORTERO];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 59);
	}

	if (PLAYER_MISC[playerid][MISC_PETARDO] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 60;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_PETARDO];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 60);
	}

	if (PLAYER_MISC[playerid][MISC_VOLCAN] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 61;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_VOLCAN];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 61);
	}

	if (PLAYER_MISC[playerid][MISC_LAVAKO] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 62;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_LAVAKO];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 62);
	}

	if (PLAYER_MISC[playerid][MISC_12TIROS] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podr·s usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 63;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_12TIROS];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 63);
	}
	return 1;
}

ShowInventory(playerid, type = 0)
{
	PLAYER_TEMP[playerid][py_DAMAGER_ALERTS] = 0;
	PLAYER_TEMP[playerid][py_INVENTORY_TYPE] = type;

	new ms = (200 + GetPlayerPing(playerid));

	g_iInvLastTick[playerid] = GetTickCount() + ms;

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][41]);
	PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	HidePhone(playerid);
	
	PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] = 0;
	PLAYER_TEMP[playerid][py_PLAYER_IN_INV] = true;
	
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_INV_BG]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][0]);
	PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], COLOR_RED);
	PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2], COLOR_WHITE);
	PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3], COLOR_WHITE);
	PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40], COLOR_WHITE);

	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][41]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][42]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][43]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][44]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][45]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][46]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48]);

	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);
	PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][4], CHARACTER_INFO[playerid][ch_SKIN]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][4]);

	inv_AccommodateAccessories(playerid);

	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][5]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][6]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][7]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][8]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][9]);

	RefreshItemList(playerid);

	SelectTextDrawEx(playerid, COLOR_RED);
	return 1;
}

HideInventory(playerid)
{
	switch(PLAYER_TEMP[playerid][py_INVENTORY_TYPE])
	{
		case 3, 4:
		{
			GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] ][gb_vehicle_PARAMS_BOOT] = false;
			UpdateVehicleParams(PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE]);
			SetPlayerChatBubble(playerid, "\n\n\n\n* Cierra el maletero de un veh√≠culo.\n\n\n", 0xffcb90FF, 20.0, 5000);
		}
	}

	PLAYER_TEMP[playerid][py_INVENTORY_TYPE] = 0;

	PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] = 0;
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_INV_BG]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][0]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][4]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][5]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][6]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][7]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][8]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][9]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][10]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][11]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][12]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][13]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][14]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][15]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][16]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][17]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][18]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][19]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][20]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][21]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][22]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][23]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][24]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][25]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][26]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][27]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][28]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][29]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][30]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][31]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][32]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][33]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][34]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][35]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][37]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][38]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][39]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][41]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][42]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][43]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][44]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][45]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][46]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48]);

	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][4]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][5]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][6]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][7]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][8]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][9]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][10]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][11]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][12]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][13]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][14]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][15]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][16]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][17]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][18]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][19]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][20]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][21]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][22]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][23]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][24]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][25]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][26]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][27]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][28]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][29]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][30]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][31]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][32]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][33]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][34]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][35]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][36]);

	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][49]);

	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][10 + 40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][11 + 40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][12 + 40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][13 + 40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][14 + 40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][15 + 40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][16 + 40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][17 + 40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][18 + 40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][19 + 40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][20 + 40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][21 + 40]);
	
	CancelSelectTextDrawEx(playerid);
	PLAYER_TEMP[playerid][py_PLAYER_IN_INV] = false;
	PLAYER_TEMP[playerid][py_PLAYER_IN_SINV] = false;
	return 1;
}

RefreshItemList(playerid)
{
	// Hide item box
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][10]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][11]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][12]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][13]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][14]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][15]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][16]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][17]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][18]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][19]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][20]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][21]);

	// Hide item name
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][22]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][23]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][24]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][25]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][26]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][27]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][28]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][29]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][30]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][31]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][32]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][33]);

	// Hide bar
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][34]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][35]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36]);

	// Item view
	PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][10], 19482);
	PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][11], 19482);
	PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][12], 19482);
	PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][13], 19482);
	PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][14], 19482);
	PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][15], 19482);
	PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][16], 19482);
	PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][17], 19482);
	PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][18], 19482);
	PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][19], 19482);
	PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][20], 19482);
	PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][21], 19482);

	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][10]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][11]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][12]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][13]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][14]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][15]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][16]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][17]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][18]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][19]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][20]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][21]);

	switch(PLAYER_TEMP[playerid][py_INVENTORY_TYPE])
	{
		case 0:
		{
			PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], 212.00000, 18.0000);
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], "Inventario");

			inv_AccommodateItems(playerid);

			new 
				target_player = GetPlayerCameraTargetPlayer(playerid),
				Float:pos[4],
				str_text[128],
				Float:size_items = 330.000000;
				
			format(str_text, sizeof(str_text), "%d/16", PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]);
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][35], str_text);

			for (new i = 0; i < PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]; i++)
			{
				size_items += 8.0;
			}

			if(PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] >= 15)
			{
				PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36], 458.000000, 0.000000);
			}
			else
			{
				PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36], size_items + 20.0, 0.000000);
			}

			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][34]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][35]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36]);
			
			PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] = target_player;
			GetPlayerPos(target_player, pos[0], pos[1], pos[2]);

			if (IsPlayerInRangeOfPoint(playerid, 1.2, pos[0], pos[1], pos[2]))
			{
				format(str_text, sizeof(str_text), "Interactuar con %s", PLAYER_TEMP[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][py_NAME]);
				PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][37], str_text);
				PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][37]);
			}
		}
		case 1:
		{
			PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], 800.00000, 18.0000);
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_NAME]);
			
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2]);
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3]);
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);

			PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] = 0;
			inv_AccommodatePropertyItems(playerid, PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID]);

			new 
				str_text[128],
				Float:size_items = 335.000000
			;
				
			format(str_text, sizeof(str_text), "%d/12", PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]);
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][35], str_text);

			for (new i = 0; i < PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]; i++)
			{
				size_items += 8.0;
			}

			if(PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] >= 15)
			{
				PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36], 458.000000, 0.000000);
			}
			else
			{
				PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36], size_items + 20.0, 0.000000);
			}

			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][34]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][35]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36]);

			ShowPlayerMessage(playerid, "Seleccione un item para sacar del almacenamiento.", 5);
		}
		case 2:
		{
			PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], 800.00000, 18.0000);
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_NAME]);

			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2]);
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3]);
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);
			
			PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] = 0;
			inv_AccommodateItems(playerid);

			new
				str_text[128],
				Float:size_items = 335.000000;
				
			format(str_text, sizeof(str_text), "%d/12", PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]);
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][35], str_text);

			for (new i = 0; i < PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]; i++)
			{
				size_items += 8.0;
			}

			if(PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] >= 15)
			{
				PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36], 458.000000, 0.000000);
			}
			else
			{
				PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36], size_items + 20.0, 0.000000);
			}

			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][34]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][35]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36]);

			ShowPlayerMessage(playerid, "Seleccione un item para meter al almacenamiento.", 5);
		}
		case 3:
		{
			PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], 800.00000, 18.0000);
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], VEHICLE_INFO[GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] ][gb_vehicle_MODELID] - 400][vehicle_info_NAME]);
			
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2]);
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3]);
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);

			PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] = 0; // No poner luego de este linea
			inv_AccommodateVehicleItems(playerid, PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] ][player_vehicle_ID]);

			new 
				str_text[128],
				Float:size_items = 335.000000
			;
			
			format(str_text, sizeof(str_text), "%d/12", PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]);
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][35], str_text);

			for (new i = 0; i < PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]; i++)
			{
				size_items += 8.0;
			}

			if(PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] >= 15)
			{
				PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36], 458.000000, 0.000000);
			}
			else
			{
				PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36], size_items + 20.0, 0.000000);
			}

			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][34]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][35]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36]);

			GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] ][gb_vehicle_PARAMS_BOOT] = true;
			UpdateVehicleParams(PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE]);

			ShowPlayerMessage(playerid, "Seleccione un item para sacar del maletero.", 5);

			SetPlayerChatBubble(playerid, "\n\n\n\n* Abre el maletero de un veh√≠culo.\n\n\n", 0xffcb90FF, 20.0, 5000);
		}
		case 4:
		{
			PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], 800.00000, 18.0000);
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], VEHICLE_INFO[GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] ][gb_vehicle_MODELID] - 400][vehicle_info_NAME]);

			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2]);
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3]);
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);
			
			PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] = 0;
			inv_AccommodateItems(playerid);

			new
				str_text[128],
				Float:size_items = 335.000000;

			format(str_text, sizeof(str_text), "%d/12", PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]);
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][35], str_text);

			for (new i = 0; i < PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]; i++)
			{
				size_items += 8.0;
			}

			if(PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] >= 15)
			{
				PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36], 458.000000, 0.000000);
			}
			else
			{
				PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36], size_items + 20.0, 0.000000);
			}

			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][34]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][35]);
			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36]);

			GLOBAL_VEHICLES[ PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] ][gb_vehicle_PARAMS_BOOT] = true;
			UpdateVehicleParams(PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE]);

			ShowPlayerMessage(playerid, "Seleccione un item para meter al maletero.", 5);

			SetPlayerChatBubble(playerid, "\n\n\n\n* Abre el maletero de un veh√≠culo.\n\n\n", 0xffcb90FF, 20.0, 5000);
		}
	}
	return 1;
}

ShowHelpMenu(playerid)
{
	HideCrew(playerid);
	PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);

	PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] = 0;
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][4]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][5]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][6]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][7]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][8]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][9]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][10]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][11]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][12]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][13]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][14]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][15]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][16]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][17]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][18]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][19]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][20]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][21]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][22]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][23]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][24]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][25]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][26]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][27]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][28]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][29]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][30]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][31]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][32]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][33]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][34]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][35]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][37]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][38]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][39]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][41]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][42]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][43]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][44]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][45]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][46]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48]);

	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][41]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][42]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][43]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][44]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][45]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][46]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48]);

	/* Header */
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47], "Bienvenido a Hyaxe");
	/* Body */
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48], TextToSpanish("~w~La idea de Hyaxe surgi√≥ en 2018, pero no fue hasta mediados de 2019 que comenz√≥ a desarrollarse, con tiempos m√°s activos y otros no tanto, pas√≥ por varios cambios, primero fue un juego de roles y luego de supervivencia, nos quedamos con la primera opci√≥n porque la encontramos m√°s rentable en SA:MP. Con el tiempo ampliamos nuestras fronteras a nuevos juegos como GTA:V, Rust, entre otros, las personas que trabajan en Hyaxe son pocas, pero esperamos que en el futuro aumente el n√∫mero de miembros del equipo."));

	SelectTextDrawEx(playerid, COLOR_RED);
	return 1;
}

ShowCrew(playerid)
{
	PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);

	PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] = 0;
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][4]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][5]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][6]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][7]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][8]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][9]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][10]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][11]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][12]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][13]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][14]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][15]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][16]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][17]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][18]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][19]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][20]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][21]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][22]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][23]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][24]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][25]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][26]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][27]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][28]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][29]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][30]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][31]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][32]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][33]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][34]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][35]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][37]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][38]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][39]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][41]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][42]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][43]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][44]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][45]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][46]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48]);


	new str_text[500], rank_str[664];

	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][18], TextToSpanish(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]));
	PlayerTextDrawColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][18], CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);

	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][19], TextToSpanish(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_DESCRIPTION]));

	format(str_text, sizeof(str_text), "%d/20", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MEMBERS]);
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][15], str_text);

	format(str_text, sizeof(str_text), "%d/%d", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITIS_COUNT], sizeof(GRAFFITIS_OBJ));
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][16], str_text);

	format(str_text, sizeof(str_text), "%d/%d", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_COUNT], sizeof(BLACK_MARKET_OBJ));
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][17], str_text);

	new DBResult:Result, DB_Query[320];
	PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT] = 20;
	PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] = 0;

	format(DB_Query, sizeof DB_Query, "SELECT `CUENTA`.`NAME`, `CUENTA`.`LAST_CONNECTION`, `CUENTA`.`CONNECTED`, `PLAYER_CREW`.`RANK` FROM `CUENTA`, `PLAYER_CREW` WHERE `PLAYER_CREW`.`ID_USER` = `CUENTA`.`ID` AND `PLAYER_CREW`.`ID_CREW` = '%d' ORDER BY `CUENTA`.`CONNECTED` DESC, `PLAYER_CREW`.`RANK` ASC LIMIT %d, %d;", PLAYER_CREW[playerid][player_crew_ID], PLAYER_TEMP[playerid][py_DIALOG_DB_PAGE] * PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT], PLAYER_TEMP[playerid][py_DIALOG_DB_LIMIT]);
	Result = db_query(Database, DB_Query);

	format(str_text, sizeof(str_text), "");

	for(new i; i < db_num_rows(Result); i++ )
	{
		new name[24], connected, rank;

		db_get_field_assoc(Result, "NAME", name, 24);
		connected = db_get_field_assoc_int(Result, "CONNECTED");
		rank = db_get_field_assoc_int(Result, "RANK");

		new line_str[128], line_rank_str[64];
		if(connected) format(line_str, sizeof line_str, "~g~+~w~ %s~n~", name);
		else format(line_str, sizeof line_str, "~r~+~w~ %s~n~", name);

		format(line_rank_str, sizeof(line_rank_str), "%s~n~", CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ rank ][crew_rank_NAME]);

		strcat(str_text, line_str);
		strcat(rank_str, line_rank_str);

		db_next_row(Result);
	}
	db_free_result(Result);

	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][6], str_text);
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][7], rank_str);

	if(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] == CrewColors[0])
	{
		PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][20], "ld_otb2:ric1");
	}

	if(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] == CrewColors[1])
	{
		PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][20], "ld_otb2:ric2");
	}

	if(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] == CrewColors[2])
	{
		PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][20], "ld_otb2:ric3");
	}

	if(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] == CrewColors[3])
	{
		PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][20], "ld_otb2:ric4");
	}

	if(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] == CrewColors[4])
	{
		PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][20], "ld_otb2:ric5");
	}

	if(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] == CrewColors[5])
	{
		PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][20], "ld_otb2:ric3");
	}

	if(CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR] == CrewColors[6])
	{
		PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][20], "ld_otb2:ric1");
	}

	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][4]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][5]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][6]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][7]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][9]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][10]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][11]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][12]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][13]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][14]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][15]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][16]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][17]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][18]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][19]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][20]);
	return 1;
}

HideCrew(playerid)
{
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][4]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][5]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][6]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][7]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][8]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][9]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][10]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][11]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][12]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][13]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][14]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][15]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][16]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][17]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][18]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][19]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][20]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][21]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][22]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][23]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][24]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][25]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][26]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][27]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][28]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][29]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][30]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][31]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][32]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][33]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][34]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][35]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][36]);
	return 1;
}

ShowPhone(playerid)
{
	PLAYER_TEMP[playerid][py_PLAYER_IN_INV] = false;
	PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] = 0;

	TextDrawHideForPlayer(playerid, Textdraws[textdraw_INV_BG]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][0]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][4]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][5]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][6]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][7]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][8]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][9]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][10]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][11]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][12]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][13]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][14]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][15]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][16]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][17]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][18]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][19]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][20]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][21]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][22]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][23]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][24]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][25]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][26]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][27]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][28]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][29]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][30]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][31]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][32]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][33]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][34]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][35]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][36]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][37]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][38]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][39]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][41]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][42]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][43]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][44]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][45]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][46]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][47]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48]);

	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][4]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][5]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][6]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][7]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][8]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][9]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][10]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][11]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][12]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][13]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][14]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][15]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][16]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][17]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][18]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][19]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][20]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][21]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][22]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][23]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][24]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][25]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][26]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][27]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][28]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][29]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][30]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][31]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][32]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][33]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][34]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][35]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV_CREW][36]);
	
	new phone_time[2], str_text[6];
	gettime(phone_time[0], phone_time[1]);

	format(str_text, sizeof(str_text), "%d:%d", phone_time[0], phone_time[1]);
	TextDrawSetString(Textdraws[textdraw_PHONE_MENU][21], str_text);

	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PHONE_MENU]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][0]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][1]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][2]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][3]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][4]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][5]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][6]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][7]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][8]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][9]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][10]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][11]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][12]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][13]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][14]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][15]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][16]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][17]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][18]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][19]);
	TextDrawShowForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][21]);

	SelectTextDrawEx(playerid, COLOR_RED);
	PLAYER_TEMP[playerid][py_PLAYER_IN_PHONE] = true;
	return 1;
}

HidePhone(playerid)
{
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PHONE_MENU]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][0]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][1]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][2]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][3]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][4]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][5]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][6]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][7]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][8]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][9]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][10]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][11]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][12]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][13]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][14]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][15]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][16]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][17]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][18]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][19]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][20]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PHONE_MENU][21]);

	CancelSelectTextDrawEx(playerid);
	PLAYER_TEMP[playerid][py_PLAYER_IN_PHONE] = false;
	PLAYER_TEMP[playerid][py_PLAYER_IN_INV] = false;
	return 1;
}

ClickInventorySlot(playerid, td_init, bool:simple = false)
{
	new slot;
	if (!simple) slot = (td_init - 10);
	else slot = td_init;
	
	switch(PLAYER_TEMP[playerid][py_INVENTORY_TYPE])
	{
		case 0:
		{
			if (PLAYER_VISUAL_INV[playerid][slot_VALID][slot])
			{
				if (PLAYER_TEMP[playerid][py_ROCK]) return ShowPlayerMessage(playerid, "~r~Primero debes entregar la roca.", 3);
				new item_str[64];
				format(item_str, sizeof(item_str), "~n~~n~~n~~n~~n~~n~~w~%s", ITEM_INFO[ PLAYER_VISUAL_INV[playerid][slot_TYPE][slot] ][item_NAME]);
				GameTextForPlayer(playerid, TextToSpanish(item_str), 2000, 5);

				PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
				ResetItemBody(playerid);

				if (PLAYER_TEMP[playerid][py_PLAYER_IN_INV]) HideInventory(playerid);

				SetItemToBody(playerid, PLAYER_VISUAL_INV[playerid][slot_TYPE][slot]);

				if (PLAYER_VISUAL_INV[playerid][slot_WEAPON][slot])
				{
					if (!PLAYER_WORKS[playerid][WORK_POLICE])
					{
						if (IsPlayerInSafeZone(playerid)) return ShowPlayerMessage(playerid, "~r~No puedes sacar armas en zona segura.", 3);
						if (IsPlayerInRangeOfPoint(playerid, 30.0, -17.344648, 99.261329, 1100.822021)) return ShowPlayerMessage(playerid, "~r~No puedes sacar armas en el club.", 3);
						if (PLAYER_TEMP[playerid][py_PACIFIC])
						{
							PLAYER_TEMP[playerid][py_PACIFIC] = !PLAYER_TEMP[playerid][py_PACIFIC];
							ShowPlayerMessage(playerid, "~r~Se ha desactivado el modo pacÌfico.", 3);
						}
					}

					ResetPlayerWeapons(playerid);
					//CheckBlockedWeapon(playerid, PLAYER_WEAPONS[playerid][ PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot] ][player_weapon_ID]);
					
					if (CHARACTER_INFO[playerid][ch_STATE] != ROLEPLAY_STATE_CRACK)
					{
						if (GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
						{
							GivePlayerWeapon(playerid, PLAYER_WEAPONS[playerid][ PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot] ][player_weapon_ID], PLAYER_WEAPONS[playerid][ PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot] ][player_weapon_AMMO]);
						}
						else if (PLAYER_WORKS[playerid][WORK_POLICE] || PlayerIsInMafia(playerid))
						{
							GivePlayerWeapon(playerid, PLAYER_WEAPONS[playerid][ PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot] ][player_weapon_ID], PLAYER_WEAPONS[playerid][ PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot] ][player_weapon_AMMO]);
						}
					}
				}

				PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] = slot;
			}
			else
			{
				ResetItemBody(playerid);
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~w~Vacio", 2000, 5);
				PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
				HideInventory(playerid);
				return 1;
			}
		}
		case 1:
		{
			if (PROPERTY_VISUAL_INV[playerid][slot_VALID][slot])
			{
				if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);

				new 
					is_weapon = IsWeaponType(PROPERTY_VISUAL_INV[playerid][slot_TYPE][slot]),
					grab_status
				;

				if (is_weapon)
				{
					grab_status = GrabItem(playerid, PROPERTY_VISUAL_INV[playerid][slot_TYPE][slot], PROPERTY_VISUAL_INV[playerid][slot_AMMOUNT][slot]);
					PROPERTY_VISUAL_INV[playerid][slot_AMMOUNT][slot] = 0;
				}
				else
				{
					PROPERTY_VISUAL_INV[playerid][slot_AMMOUNT][slot] -= 1;
					grab_status = GrabItem(playerid, PROPERTY_VISUAL_INV[playerid][slot_TYPE][slot]);
				}

				if (grab_status)
				{
					new item_str[64];
					format(item_str, sizeof(item_str), "~n~~n~~n~~n~~n~~n~~w~%s", ITEM_INFO[ PROPERTY_VISUAL_INV[playerid][slot_TYPE][slot] ][item_NAME]);
					GameTextForPlayer(playerid, TextToSpanish(item_str), 2000, 5);

					PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
					ResetItemBody(playerid);

					new DB_Query[132];

					if (PROPERTY_VISUAL_INV[playerid][slot_AMMOUNT][slot] <= 0)
					{
						format(DB_Query, sizeof DB_Query,
							"DELETE FROM `PROPERTY_STORAGE` WHERE `ID` = '%d';", 
							PROPERTY_VISUAL_INV[playerid][slot_DB_ID][slot]
						);
					}
					else
					{
						format(DB_Query, sizeof DB_Query,
							"UPDATE `PROPERTY_STORAGE` SET `EXTRA` = '%d' WHERE `ID` = '%d';",
							PROPERTY_VISUAL_INV[playerid][slot_AMMOUNT][slot],
							PROPERTY_VISUAL_INV[playerid][slot_DB_ID][slot]
						);
					}

					db_free_result(db_query(Database, DB_Query));

					RefreshItemList(playerid);
				}
			}
			else
			{
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~w~Vacio", 2000, 5);
				PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
				return 1;
			}
		}
		case 2:
		{
			if (PLAYER_VISUAL_INV[playerid][slot_VALID][slot])
			{
				new count = GetPropertyItemsCount(PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID]);
				if (count >= 11) return ShowPlayerMessage(playerid, "~r~El almacenamiento de la propiedad se encuentra lleno.", 4);

				if (PLAYER_VISUAL_INV[playerid][slot_TYPE][slot] == 50) return 0;

				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~w~Item guardado", 2000, 5);
				ResetItemBody(playerid);

				SubtractItem(playerid, PLAYER_VISUAL_INV[playerid][slot_TYPE][slot], slot);

				if (PLAYER_VISUAL_INV[playerid][slot_WEAPON][slot])
				{
					AddItemToProperty(
						PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID],
						PLAYER_VISUAL_INV[playerid][slot_TYPE][slot],
						PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][slot]
					);
				}
				else
				{
					new already_exists = ItemAlreadyInProperty(PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID], PLAYER_VISUAL_INV[playerid][slot_TYPE][slot]);

					if (already_exists)
					{
						new DB_Query[164];
						format(DB_Query, sizeof DB_Query,
							"UPDATE `PROPERTY_STORAGE` SET `EXTRA` = EXTRA + '1' WHERE `ID` = '%d';",
							already_exists
						);
						db_free_result(db_query(Database, DB_Query));
					}
					else
					{
						AddItemToProperty(
							PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID],
							PLAYER_VISUAL_INV[playerid][slot_TYPE][slot],
							1
						);		
					}
				}

				RefreshItemList(playerid);
			}
			else
			{
				ResetItemBody(playerid);
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~w~Vacio", 2000, 5);
				PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
				return 1;
			}
		}
		case 3:
		{
			if (PROPERTY_VISUAL_INV[playerid][slot_VALID][slot])
			{
				if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno.", 4);

				new 
					is_weapon = IsWeaponType(PROPERTY_VISUAL_INV[playerid][slot_TYPE][slot]),
					grab_status
				;

				if (is_weapon)
				{
					grab_status = GrabItem(playerid, PROPERTY_VISUAL_INV[playerid][slot_TYPE][slot], PROPERTY_VISUAL_INV[playerid][slot_AMMOUNT][slot]);
					PROPERTY_VISUAL_INV[playerid][slot_AMMOUNT][slot] = 0;
				}
				else
				{
					PROPERTY_VISUAL_INV[playerid][slot_AMMOUNT][slot] -= 1;
					grab_status = GrabItem(playerid, PROPERTY_VISUAL_INV[playerid][slot_TYPE][slot]);
				}

				if (grab_status)
				{
					new item_str[64];
					format(item_str, sizeof(item_str), "~n~~n~~n~~n~~n~~n~~w~%s", ITEM_INFO[ PROPERTY_VISUAL_INV[playerid][slot_TYPE][slot] ][item_NAME]);
					GameTextForPlayer(playerid, TextToSpanish(item_str), 2000, 5);

					PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
					ResetItemBody(playerid);

					new DB_Query[132];

					if (PROPERTY_VISUAL_INV[playerid][slot_AMMOUNT][slot] <= 0)
					{
						format(DB_Query, sizeof DB_Query,
							"DELETE FROM `VEHICLE_STORAGE` WHERE `ID` = '%d';", 
							PROPERTY_VISUAL_INV[playerid][slot_DB_ID][slot]
						);
					}
					else
					{
						format(DB_Query, sizeof DB_Query,
							"UPDATE `VEHICLE_STORAGE` SET `EXTRA` = '%d' WHERE `ID` = '%d';",
							PROPERTY_VISUAL_INV[playerid][slot_AMMOUNT][slot],
							PROPERTY_VISUAL_INV[playerid][slot_DB_ID][slot]
						);
					}

					db_free_result(db_query(Database, DB_Query));

					RefreshItemList(playerid);
				}

				SetPlayerChatBubble(playerid, "\n\n\n\n* Saca algo del maletero.\n\n\n", 0xffcb90FF, 20.0, 5000);
			}
			else
			{
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~w~Vacio", 2000, 5);
				PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
				return 1;
			}
		}
		case 4:
		{
			if (PLAYER_VISUAL_INV[playerid][slot_VALID][slot])
			{
				new count = GetVehicleItemsCount(PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] ][player_vehicle_ID]);
				if (count >= 11) return ShowPlayerMessage(playerid, "~r~El maletero se encuentra lleno.", 4);

				if (PLAYER_VISUAL_INV[playerid][slot_TYPE][slot] == 50) return 0;

				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~w~Item guardado", 2000, 5);
				ResetItemBody(playerid);

				SubtractItem(playerid, PLAYER_VISUAL_INV[playerid][slot_TYPE][slot], slot);

				if (PLAYER_VISUAL_INV[playerid][slot_WEAPON][slot])
				{
					AddItemToVehicle(
						PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] ][player_vehicle_ID],
						PLAYER_VISUAL_INV[playerid][slot_TYPE][slot],
						PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][slot]
					);
				}
				else
				{
					new already_exists = ItemAlreadyInVehicle(PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] ][player_vehicle_ID], PLAYER_VISUAL_INV[playerid][slot_TYPE][slot]);

					if (already_exists)
					{
						new DB_Query[164];
						format(DB_Query, sizeof DB_Query,
							"UPDATE `VEHICLE_STORAGE` SET `EXTRA` = EXTRA + '1' WHERE `ID` = '%d';",
							already_exists
						);
						db_free_result(db_query(Database, DB_Query));
					}
					else
					{
						AddItemToVehicle(
							PLAYER_VEHICLES[ PLAYER_TEMP[playerid][py_DIALOG_BOT_VEHICLE] ][player_vehicle_ID],
							PLAYER_VISUAL_INV[playerid][slot_TYPE][slot],
							1
						);		
					}
				}

				RefreshItemList(playerid);
				SetPlayerChatBubble(playerid, "\n\n\n\n* Mete algo al maletero.\n\n\n", 0xffcb90FF, 20.0, 5000);
			}
			else
			{
				ResetItemBody(playerid);
				GameTextForPlayer(playerid, "~n~~n~~n~~n~~n~~n~~w~Vacio", 2000, 5);
				PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
				return 1;
			}
		}
	}
	return 1;
}

DropItemSlot(playerid, anim = true)
{
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT)
	{
		if (anim) return 0;
	}
	
	new 
		Float:pos[3],
		slot = PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT];

	if (PLAYER_VISUAL_INV[playerid][slot_TYPE][slot] == 50) return 0;

	GetPlayerPos(playerid, pos[0], pos[1], pos[2]);

	if (GetPlayerInterior(playerid) == 0)
	{
		new Float:fPX, Float:fPY, Float:fPZ, Float:fVX, Float:fVY, Float:fVZ;
		GetPlayerCameraPos(playerid, fPX, fPY, fPZ);
	    GetPlayerCameraFrontVector(playerid, fVX, fVY, fVZ);

	    pos[0] = fPX + floatmul(fVX, 5.0);
	    pos[1] = fPY + floatmul(fVY, 5.0);
	}

	if (anim) ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 1000, true);
	
	if (PLAYER_VISUAL_INV[playerid][slot_WEAPON][slot])
	{
		CreateDropItem(PLAYER_VISUAL_INV[playerid][slot_TYPE][slot], pos[0], pos[1], pos[2] - 1, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), PLAYER_TEMP[playerid][py_NAME], PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][slot]);
	}
	else
	{
		CreateDropItem(PLAYER_VISUAL_INV[playerid][slot_TYPE][slot], pos[0], pos[1], pos[2] - 1, 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), PLAYER_TEMP[playerid][py_NAME]);
	}

	SubtractItem(playerid, PLAYER_VISUAL_INV[playerid][slot_TYPE][slot], slot);
	ResetItemBody(playerid);
	PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]--;
	return 1;
}

UseItemSlot(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][41]);
	new slot = PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT];

	switch(PLAYER_VISUAL_INV[playerid][slot_TYPE][slot])
	{
		case 0:
		{
			if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK) return ShowPlayerMessage(playerid, "~r~No puedes hacer eso estando herido.", 3);
			
			new 
				target_player = GetPlayerCameraTargetPlayer(playerid),
				Float:pos[4];
		
			PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] = target_player;
			GetPlayerPos(target_player, pos[0], pos[1], pos[2]);

			if (IsPlayerInRangeOfPoint(playerid, 1.2, pos[0], pos[1], pos[2]))
			{
				if (CHARACTER_INFO[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][ch_STATE] != ROLEPLAY_STATE_CRACK) return ShowPlayerMessage(playerid, "~r~El jugador tiene que estar herido.", 3);
				
				KillTimer(PLAYER_TEMP[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][py_TIMERS][16]);
				PLAYER_TEMP[ PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] ][py_TIMERS][16] = SetTimerEx("StandUpBotikin", 5000, false, "ii", playerid, PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER]);

				ApplyAnimation(playerid, "MEDIC", "CPR", 4.1, false, 0, 0, 0, 0, 1);
				SetPlayerChatBubble(playerid, "\n\n\n\n* Usa un botiquÌ≠n.", 0xffcb90FF, 20.0, 2000);
			}
			return 1;
		}

		case 1:
		{
			if (PLAYER_MISC[playerid][MISC_MEDICINE] <= 0) return ShowPlayerMessage(playerid, "~r~No tienes medicamentos.", 3);
			if ((gettime() - PLAYER_TEMP[playerid][py_LIMIT_REMEDY]) < 60 * 1) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 1 minuto para volver a consumir medicamentos.", 3);
			//if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK) return ShowPlayerMessage(playerid, "~r~No puedes hacer eso estando herido.", 3);

			PLAYER_MISC[playerid][MISC_MEDICINE] --;
			SavePlayerMisc(playerid);
			GivePlayerHealthEx(playerid, 10.0);
			SetPlayerChatBubble(playerid, "\n\n\n\n* Se toma un medicamento.", 0xffcb90FF, 20.0, 2000);
			ShowPlayerMessage(playerid, "Consumiste un medicamento.", 2);
			ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 0, 0, 0, 0, 0, 0);
			ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 4.1, false, true, true, false, 1000);
			PLAYER_TEMP[playerid][py_LIMIT_REMEDY] = gettime();
			ResetItemBody(playerid);
			return 1;
		}

		case 2:
		{
			if (PLAYER_MISC[playerid][MISC_VENDAS] <= 0) return ShowPlayerMessage(playerid, "~r~No tienes vendas.", 3);
			if ((gettime() - PLAYER_TEMP[playerid][py_LIMIT_BAND]) < 10) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 10 segundos para volver a usar vendas.", 3);
			//if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK) return ShowPlayerMessage(playerid, "~r~No puedes hacer eso estando herido.", 3);

			PLAYER_MISC[playerid][MISC_VENDAS] --;
			SavePlayerMisc(playerid);
			GivePlayerHealthEx(playerid, 5.0);
			SetPlayerChatBubble(playerid, "\n\n\n\n* Usa una venda.", 0xffcb90FF, 20.0, 2000);
			ShowPlayerMessage(playerid, "Usaste una venda.", 2);
			PLAYER_TEMP[playerid][py_LIMIT_BAND] = gettime();
			ResetItemBody(playerid);
			return 1;
		}

		case 3:
		{
			if (PLAYER_MISC[playerid][MISC_CANNABIS] <= 0) return ShowPlayerMessage(playerid, "~r~No tienes marihuana.", 3);
			if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK) return ShowPlayerMessage(playerid, "~r~No puedes hacer eso estando herido.", 3);

			PLAYER_MISC[playerid][MISC_CANNABIS] --;
			PLAYER_MISC[playerid][MISC_JOINT] ++;
			SavePlayerMisc(playerid);
			SetPlayerChatBubble(playerid, "\n\n\n\n* Crea un porro.", 0xffcb90FF, 20.0, 2000);
			ShowPlayerMessage(playerid, "Creaste un porro", 3);
			ResetItemBody(playerid);
			return 1;
		}

		case 4:
		{
			if (PLAYER_MISC[playerid][MISC_CRACK] <= 0) return ShowPlayerMessage(playerid, "~r~No tienes crack.", 3);
			if ((gettime() - PLAYER_TEMP[playerid][py_LIMIT_CRACK]) < 60 * 1) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 1 minuto para volver a consumir crack.", 3);
			//if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK) return ShowPlayerMessage(playerid, "~r~No puedes hacer eso estando herido.", 3);
			
			PLAYER_MISC[playerid][MISC_CRACK] --;
			SavePlayerMisc(playerid);
			GivePlayerHealthEx(playerid, 25.0);
			SetPlayerChatBubble(playerid, "\n\n\n\n* Consume crack", 0xffcb90FF, 20.0, 2000);
			ShowPlayerMessage(playerid, "Consumiste crack.", 2);
			GivePlayerDrunkLevel(playerid, 10000);
			ApplyAnimation(playerid,"ped","Smoke_in_car",4.1,1,1,1,1,1);
			SetTimerEx("StopDrugEffect", 15000, false, "i", playerid);
			PLAYER_TEMP[playerid][py_LIMIT_CRACK] = gettime();
			ResetItemBody(playerid);
			return 1;
		}

		case 5:
		{
			if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerNotification(playerid, "Tienes que estar fuera del vehÌ≠culo para vertir el bidÛn.", 3);

			new vehicleid = GetPlayerCameraTargetVehicle(playerid);
			if (vehicleid == INVALID_VEHICLE_ID) return ShowPlayerNotification(playerid, "No est·s cerca de ning˙n vehÌ≠culo.", 3);

			if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE])
			{
				ShowPlayerNotification(playerid, "Por favor, para primero el motor del vehÌ≠culo.", 3);
				return 1;
			}

			ShowDialog(playerid, DIALOG_FUEL_DRUM);
			ResetItemBody(playerid);
			return 1;
		}

		case 50:
		{
			ShowPhone(playerid);
			return 1;
		}

		case 51:
		{
			if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 0;

			if (PLAYER_WORKS[playerid][WORK_FISHER])
			{
				if (!IsPlayerInWater(playerid))
				{
					if (!PLAYER_TEMP[playerid][py_FISHING])
					{
						if (IsPlayerInRangeOfPoint(playerid, 30.0, 1955.022094, -189.402023, -2.332746) || IsPlayerInRangeOfPoint(playerid, 30.0, 2209.482421, -231.312026, -2.332746)|| IsPlayerInRangeOfPoint(playerid, 30.0, 2209.482421, -231.312026, -2.332746)|| IsPlayerInRangeOfPoint(playerid, 30.0, 1858.291503, -69.229499, -2.332746))
						{
							PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][0], "hud:radar_centre");
							PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][1], "Pescando...");
							PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][2], "Espera a que muerdan el anzuelo...");
							TextDrawShowForPlayer(playerid, Textdraws[textdraw_PROGRESS_BG]);
							PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][0]);
							PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][1]);
							PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][2]);
							PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][3]);
							PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);
							ApplyAnimation(playerid, "SWORD", "SWORD_IDLE", 4.1, true, false, false, false, 0, true);
							SetTimerEx("StartFishing", minrand(6000, 30000), false, "i", playerid);
							PLAYER_TEMP[playerid][py_FISHING] = true;
						}
					}
				}
			}
		}

		case 6:
		{
			StartPlanting(playerid, 0);
			return 1;
		}

		case 7:
		{
			StartPlanting(playerid, 1);
			return 1;
		}

		case 8:
		{
			StartPlanting(playerid, 2);
			return 1;
		}

		case 53:
		{
			if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return ShowPlayerMessage(playerid, "~r~No est·s depie.", 3);
			{
				if (PLAYER_TEMP[playerid][py_FIX_VALUE] > 0) return ShowPlayerNotification(playerid, "Espere hasta terminar.", 4);

				new vehicleid = INVALID_VEHICLE_ID;
				vehicleid = GetPlayerCameraTargetVehicle(playerid);

				if (vehicleid != INVALID_VEHICLE_ID)
				{
					new Float:pos[3];
					GetVehiclePos(vehicleid, pos[0], pos[1], pos[2]);
					if (GetPlayerDistanceFromPoint(playerid, pos[0], pos[1], pos[2]) < 10.0)
					{
						if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_OCCUPIED]) return ShowPlayerNotification(playerid, "~r~El vehÌ≠culo est· ocupado.", 4);

						if (PLAYER_MISC[playerid][MISC_FIXKIT])
						{
							PLAYER_TEMP[playerid][py_FIX_VALUE] = 0;
							KillTimer(PLAYER_TEMP[playerid][py_TIMERS][32]);
							PLAYER_TEMP[playerid][py_TIMERS][32] = SetTimerEx("FixVehicleUpdate", 1000, true, "ii", playerid, vehicleid);
						}
					}
				}
			}
			return 1;
		}

		case 56:
		{
			ActiveGeolocation(playerid);
			return 1;
		}

		case 58:
		{
			if (PLAYER_MISC[playerid][MISC_ROCKET] <= 0) return ShowPlayerMessage(playerid, "~r~No tienes este tipo de fuego artificial.", 3);
			PLAYER_MISC[playerid][MISC_ROCKET] --;
			SavePlayerMisc(playerid);

			PlayerFirework(playerid, 0);
			return 1;
		}

		case 59:
		{
			if (PLAYER_MISC[playerid][MISC_MORTERO] <= 0) return ShowPlayerMessage(playerid, "~r~No tienes este tipo de fuego artificial.", 3);
			PLAYER_MISC[playerid][MISC_MORTERO] --;
			SavePlayerMisc(playerid);

			PlayerFirework(playerid, 1);
			return 1;
		}

		case 60:
		{
			if (PLAYER_MISC[playerid][MISC_PETARDO] <= 0) return ShowPlayerMessage(playerid, "~r~No tienes este tipo de fuego artificial.", 3);
			PLAYER_MISC[playerid][MISC_PETARDO] --;
			SavePlayerMisc(playerid);

			PlayerFirework(playerid, 2);
			return 1;
		}

		case 61:
		{
			if (PLAYER_MISC[playerid][MISC_VOLCAN] <= 0) return ShowPlayerMessage(playerid, "~r~No tienes este tipo de fuego artificial.", 3);
			PLAYER_MISC[playerid][MISC_VOLCAN] --;
			SavePlayerMisc(playerid);

			PlayerFirework(playerid, 3);
			return 1;
		}

		case 62:
		{
			if (PLAYER_MISC[playerid][MISC_LAVAKO] <= 0) return ShowPlayerMessage(playerid, "~r~No tienes este tipo de fuego artificial.", 3);
			PLAYER_MISC[playerid][MISC_LAVAKO] --;
			SavePlayerMisc(playerid);

			PlayerFirework(playerid, 4);
			return 1;
		}

		case 63:
		{
			if (PLAYER_MISC[playerid][MISC_12TIROS] <= 0) return ShowPlayerMessage(playerid, "~r~No tienes este tipo de fuego artificial.", 3);
			PLAYER_MISC[playerid][MISC_12TIROS] --;
			SavePlayerMisc(playerid);

			PlayerFirework(playerid, 5);
			return 1;
		}

		default: CheckAndReload(playerid);
	}
	return 1;
}