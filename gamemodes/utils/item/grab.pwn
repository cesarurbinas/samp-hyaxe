SubtractItem(playerid, type, slot, ammount = 1)
{
	switch(type)
	{
		case 0: return PLAYER_MISC[playerid][MISC_BOTIKIN] -= ammount;
		case 1: return PLAYER_MISC[playerid][MISC_MEDICINE] -= ammount;
		case 2: return PLAYER_MISC[playerid][MISC_VENDAS] -= ammount;
		case 3: return PLAYER_MISC[playerid][MISC_CANNABIS] -= ammount;
		case 4: return PLAYER_MISC[playerid][MISC_CRACK] -= ammount;
		case 5: return PLAYER_MISC[playerid][MISC_FUEL_DRUM] = 0;
		case 6: return PLAYER_MISC[playerid][MISC_SEED_MEDICINE] -= ammount;
		case 7: return PLAYER_MISC[playerid][MISC_SEED_CANNABIS] -= ammount;
		case 8: return PLAYER_MISC[playerid][MISC_SEED_CRACK] -= ammount;
		case 9: return PLAYER_MISC[playerid][MISC_CARTRIDGE_1] -= ammount;
		case 10: return PLAYER_MISC[playerid][MISC_CARTRIDGE_2] -= ammount;
		case 11: return PLAYER_MISC[playerid][MISC_CARTRIDGE_3] -= ammount;
		case 13: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 14: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 15: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 16: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 17: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 18: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 19: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 22: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 23: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 24: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 25: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 26: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 28: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 29: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 30: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 31: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 32: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 33: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 41: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 43: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 46: return RemovePlayerSlotWeapon(playerid, PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot], true);
		case 51: return PLAYER_MISC[playerid][MISC_ROD] -= ammount;
		case 52: return PLAYER_MISC[playerid][MISC_MALLET] -= ammount;
		case 53: return PLAYER_MISC[playerid][MISC_FIXKIT] -= ammount;
		case 54: return PLAYER_MISC[playerid][MISC_JOINT] -= ammount;
		case 55: return PLAYER_MISC[playerid][MISC_CARTRIDGE_4] -= ammount;
		case 56: return PLAYER_MISC[playerid][MISC_GEO] -= ammount;
	}
	return 1;
}

TypeToWeapon(type)
{
	new weapon;
	switch(type)
	{
		case 12: weapon = 5;//bat
		case 13: weapon = 3;//porra
		case 14: weapon = 4;//knife
		case 15: weapon = 6;//pala
		case 16: weapon = 7;//pool
		case 17: weapon = 17;
		case 18: weapon = 2;//golf
		case 19: weapon = 1;//punio
		case 22: weapon = 22;
		case 23: weapon = 23;
		case 24: weapon = 24;
		case 25: weapon = 25;
		case 26: weapon = 26;
		case 28: weapon = 28;
		case 29: weapon = 29;
		case 30: weapon = 30;
		case 31: weapon = 31;
		case 32: weapon = 32;
		case 33: weapon = 33;
		case 41: weapon = 41;
		case 43: weapon = 43;
		case 46: weapon = 46;
	}
	return weapon;
}

WeaponToType(type)
{
	new weapon;
	switch(type)
	{
		case 5: weapon = 12;//bat
		case 3: weapon = 13;//porra
		case 4: weapon = 14;//knife
		case 6: weapon = 15;//pala
		case 7: weapon = 16;//pool
		case 17: weapon = 17;
		case 2: weapon = 18;//golf
		case 1: weapon = 19;//punio
		case 22: weapon = 22;
		case 23: weapon = 23;
		case 24: weapon = 24;
		case 25: weapon = 25;
		case 26: weapon = 26;
		case 28: weapon = 28;
		case 29: weapon = 29;
		case 30: weapon = 30;
		case 31: weapon = 31;
		case 32: weapon = 32;
		case 33: weapon = 33;
		case 41: weapon = 41;
		case 43: weapon = 43;
		case 46: weapon = 46;
	}
	return weapon;
}

GrabWeapon(playerid, type, ammount, color = 0x00F7F7F7)
{
	new 
		weapon_id = TypeToWeapon(type), 
		weapon_slot = WEAPON_INFO[weapon_id][weapon_info_SLOT],
		str_text[128]
	;

	if(PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_ID] != 0)
	{
		format(str_text, sizeof(str_text), "Para agarrar esta arma tienes que deshacerte de tu %s para tener espacio.", WEAPON_INFO[ PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_ID] ][weapon_info_NAME]);
		ShowPlayerNotification(playerid, str_text, 4);
		return 1;
	}

	RegisterNewPlayerWeapon(playerid, weapon_slot);
	GivePlayerWeaponEx(playerid, weapon_id, ammount, color);
	return 1;
}

GrabItem(playerid, type, ammount = 1, color = 0x00F7F7F7)
{
	switch(type)
	{
		case 0: return PLAYER_MISC[playerid][MISC_BOTIKIN] += ammount;
		case 1: return PLAYER_MISC[playerid][MISC_MEDICINE] += ammount;
		case 2: return PLAYER_MISC[playerid][MISC_VENDAS] += ammount;
		case 3: return PLAYER_MISC[playerid][MISC_CANNABIS] += ammount;
		case 4: return PLAYER_MISC[playerid][MISC_CRACK] += ammount;
		case 5: return PLAYER_MISC[playerid][MISC_FUEL_DRUM] = 20;
		case 6: return PLAYER_MISC[playerid][MISC_SEED_MEDICINE] += ammount;
		case 7: return PLAYER_MISC[playerid][MISC_SEED_CANNABIS] += ammount;
		case 8: return PLAYER_MISC[playerid][MISC_SEED_CRACK] += ammount;
		case 9: return PLAYER_MISC[playerid][MISC_CARTRIDGE_1] += ammount;
		case 10: return PLAYER_MISC[playerid][MISC_CARTRIDGE_2] += ammount;
		case 11: return PLAYER_MISC[playerid][MISC_CARTRIDGE_3] += ammount;
		case 12: return GrabWeapon(playerid, type, ammount, color);
		case 13: return GrabWeapon(playerid, type, ammount, color);
		case 14: return GrabWeapon(playerid, type, ammount, color);
		case 15: return GrabWeapon(playerid, type, ammount, color);
		case 16: return GrabWeapon(playerid, type, ammount, color);
		case 17: return GrabWeapon(playerid, type, ammount, color);
		case 18: return GrabWeapon(playerid, type, ammount, color);
		case 19: return GrabWeapon(playerid, type, ammount, color);
		case 22: return GrabWeapon(playerid, type, ammount, color);
		case 23: return GrabWeapon(playerid, type, ammount, color);
		case 24: return GrabWeapon(playerid, type, ammount, color);
		case 25: return GrabWeapon(playerid, type, ammount, color);
		case 26: return GrabWeapon(playerid, type, ammount, color);
		case 28: return GrabWeapon(playerid, type, ammount, color);
		case 29: return GrabWeapon(playerid, type, ammount, color);
		case 30: return GrabWeapon(playerid, type, ammount, color);
		case 31: return GrabWeapon(playerid, type, ammount, color);
		case 32: return GrabWeapon(playerid, type, ammount, color);
		case 33: return GrabWeapon(playerid, type, ammount, color);
		case 41: return GrabWeapon(playerid, type, ammount, color);
		case 43: return GrabWeapon(playerid, type, ammount, color);
		case 46: return GrabWeapon(playerid, type, ammount, color);
		case 51: return PLAYER_MISC[playerid][MISC_ROD] += ammount;
		case 52: return PLAYER_MISC[playerid][MISC_MALLET] += ammount;
		case 53: return PLAYER_MISC[playerid][MISC_FIXKIT] += ammount;
		case 54: return PLAYER_MISC[playerid][MISC_JOINT] += ammount;
		case 55: return PLAYER_MISC[playerid][MISC_CARTRIDGE_4] += ammount;
		case 56: return PLAYER_MISC[playerid][MISC_GEO] += ammount;
	}
	return 1;
}

IsFullInventory(playerid)
{
	new free_slot = inv_GetFreeSlot(playerid);
	if(!free_slot) return 1;
	else return 0;
}