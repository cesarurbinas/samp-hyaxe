inv_AccommodateAccessories(playerid)
{
	new bool:toys_inv_slots[6];

	if (PLAYER_TOYS[playerid][0][player_toy_VALID])
	{
		if (toys_inv_slots[0] == false)
		{
			PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][5], PLAYER_TOYS[playerid][0][player_toy_MODELID]);
			PlayerTextDrawSetPreviewRot(playerid, PlayerTextdraws[playerid][ptextdraw_INV][5], -15.000000, 0.000000, 12.000000, 1.000000);
			toys_inv_slots[0] = true;
			PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]++;
		}
	}

	if (PLAYER_TOYS[playerid][1][player_toy_VALID])
	{
		if (toys_inv_slots[1] == false)
		{
			PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][6], PLAYER_TOYS[playerid][1][player_toy_MODELID]);
			PlayerTextDrawSetPreviewRot(playerid, PlayerTextdraws[playerid][ptextdraw_INV][6], -15.000000, 0.000000, 12.000000, 1.000000);
			toys_inv_slots[1] = true;
		}
	}

	if (PLAYER_TOYS[playerid][2][player_toy_VALID])
	{
		if (toys_inv_slots[2] == false)
		{
			PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][7], PLAYER_TOYS[playerid][2][player_toy_MODELID]);
			PlayerTextDrawSetPreviewRot(playerid, PlayerTextdraws[playerid][ptextdraw_INV][7], -15.000000, 0.000000, 12.000000, 1.000000);
			toys_inv_slots[2] = true;
			PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]++;
		}
	}

	if (PLAYER_TOYS[playerid][3][player_toy_VALID])
	{
		if (toys_inv_slots[3] == false)
		{
			PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][8], PLAYER_TOYS[playerid][3][player_toy_MODELID]);
			PlayerTextDrawSetPreviewRot(playerid, PlayerTextdraws[playerid][ptextdraw_INV][8], -15.000000, 0.000000, 12.000000, 1.000000);
			toys_inv_slots[3] = true;
			PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]++;
		}
	}

	if (PLAYER_TOYS[playerid][4][player_toy_VALID])
	{
		if (toys_inv_slots[4] == false)
		{
			PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][9], PLAYER_TOYS[playerid][0][player_toy_MODELID]);
			PlayerTextDrawSetPreviewRot(playerid, PlayerTextdraws[playerid][ptextdraw_INV][9], -15.000000, 0.000000, 12.000000, 1.000000);
			toys_inv_slots[4] = true;
			PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]++;
		}
	}
}

inv_GetFreeSlot(playerid)
{
    new i = 12;
    while (--i != 0)
    {
        if (!PLAYER_VISUAL_INV[playerid][slot_VALID][i]) return i;
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
		case 0, 5, 53:
		{
			rx = -15.000000;
			ry = 0.000000;
			rz = 30.000000;
			zoom = 1.000000;
		}
		case 1..4:
		{
			rx = 90.000000;
			ry = 15.000000;
			rz = 0.000000;
			zoom = 1.000000;	
		}
		case 50:
		{
			rx = 90.000000;
			ry = 0.000000;
			rz = 0.000000;
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

	if (PLAYER_VISUAL_INV[playerid][slot_TYPE][slot] == 50)
	{
		format(str_text, sizeof(str_text), "Cel");
	}
	else
	{
		format(str_text, sizeof(str_text), "%d", PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][slot]);
	}

	switch(PLAYER_VISUAL_INV[playerid][slot_TYPE][slot])
	{
		case 0, 53, 51, 54, 41: format(str_text, sizeof(str_text), " ");
		case 9: format(str_text, sizeof(str_text), "B-1");
		case 10: format(str_text, sizeof(str_text), "B-2");
		case 11: format(str_text, sizeof(str_text), "B-3");
		case 55: format(str_text, sizeof(str_text), "B-4");
	}

	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_ammount], str_text);

	GetTypePreviewRot(type, rot[0], rot[1], rot[2], rot[3]);
	PlayerTextDrawSetPreviewModel(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_init], GetItemObjectByType(type));
	PlayerTextDrawSetPreviewRot(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_init], rot[0], rot[1], rot[2], rot[3]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_init]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_INV][td_ammount]);
	PLAYER_TEMP[playerid][py_INV_OCC_SLOTS]++;
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
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 50;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = 1;
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 50);
	}

	for(new i; i != 13; i ++)
	{
		if (!PLAYER_WEAPONS[playerid][i][player_weapon_VALID]) continue;

		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

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
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

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
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

			PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
			PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 53;
			PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = 1;
			if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 53);
		}
	}

	if (PLAYER_MISC[playerid][MISC_MEDICINE] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 1;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_MEDICINE];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 1);
	}

	if (PLAYER_MISC[playerid][MISC_VENDAS] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 2;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_VENDAS];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 2);
	}

	if (PLAYER_MISC[playerid][MISC_CANNABIS] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 3;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_CANNABIS];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 3);
	}

	if (PLAYER_MISC[playerid][MISC_CRACK] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

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
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

			PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
			PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 54;
			PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = 1;
			if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 54);
		}
	}

	if (PLAYER_MISC[playerid][MISC_FUEL_DRUM] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

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
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

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
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

			PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
			PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 52;
			PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = 1;
			if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 52);
		}
	}

	if (PLAYER_MISC[playerid][MISC_SEED_MEDICINE] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 6;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_SEED_MEDICINE];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 6);
	}

	if (PLAYER_MISC[playerid][MISC_SEED_CANNABIS] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

		PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
		PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 7;
		PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = PLAYER_MISC[playerid][MISC_SEED_CANNABIS];
		if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 7);
	}

	if (PLAYER_MISC[playerid][MISC_SEED_CRACK] > 0)
	{
		free_slot = inv_GetFreeSlot(playerid);
		if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

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
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

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
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

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
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

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
			if (!free_slot) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno, no podrás usar algunos items.", 3);

			PLAYER_VISUAL_INV[playerid][slot_VALID][free_slot] = true;
			PLAYER_VISUAL_INV[playerid][slot_TYPE][free_slot] = 55;
			PLAYER_VISUAL_INV[playerid][slot_AMMOUNT][free_slot] = 1;
			if (is_visual) inv_ItemToTextdraw(playerid, free_slot, 55);
		}
	}
	return 1;
}