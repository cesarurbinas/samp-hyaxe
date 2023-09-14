GetItemNameByType(type)
{
	new name[64];

	switch(type)
	{
		case 0: name = "Botiquín";
		case 1: name = "Medicamento";
		case 2: name = "Venda";
		case 3: name = "Marihuana";
		case 4: name = "Crack";
		case 5: name = "Bidón de gasolina";
		case 6: name = "Semillas de aloe vera";
		case 7: name = "Semillas de marihuana";
		case 8: name = "Semillas de coca";
		case 9: name = "Balas";
		case 10: name = "Balas";
		case 11: name = "Balas";
		case 12: name = "Bate";//bat
		case 13: name = "Porra";//porra
		case 14: name = "Cuchillo";//knife
		case 15: name = "Pala";//pala
		case 16: name = "Palo de billar";//pool
		case 17: name = "Gas";
		case 18: name = "Palo de golf";//golf
		case 19: name = "Manopla";//punio
		case 22: name = "9mm";
		case 23: name = "Tazer";
		case 24: name = "Desert Eagle";
		case 25: name = "Escopeta";
		case 26: name = "Recortada";
		case 28: name = "Micro UZI";
		case 29: name = "MP5";
		case 30: name = "AK-47";
		case 31: name = "M4";
		case 32: name = "Tec-9";
		case 33: name = "Rifle";
		case 41: name = "Bote de spray";
		case 43: name = "Cámara";
		case 46: name = "Paracaídas";
		case 50: name = "Celular";
		case 51: name = "Caña de pescar";
		case 52: name = "Mazo";
		case 53: name = "Kit de reparación";
		case 54: name = "Porro";
	}
	return name;
}

/*GetItemAmmount(playerid, type)
{
	new ammount;

	switch(type)
	{
		case 0: ammount = PLAYER_MISC[playerid][MISC_BOTIKIN];
		case 1: ammount = PLAYER_MISC[playerid][MISC_MEDICINE];
		case 2: ammount = PLAYER_MISC[playerid][MISC_VENDAS];
		case 3: ammount = PLAYER_MISC[playerid][MISC_CANNABIS];
		case 4: ammount = PLAYER_MISC[playerid][MISC_CRACK];
		case 5: ammount = PLAYER_MISC[playerid][MISC_FUEL_DRUM];
		case 6: ammount = PLAYER_MISC[playerid][MISC_SEED_MEDICINE];
		case 7: ammount = PLAYER_MISC[playerid][MISC_SEED_CANNABIS];
		case 8: ammount = PLAYER_MISC[playerid][MISC_SEED_CRACK];
		case 9: ammount = PLAYER_MISC[playerid][MISC_CARTRIDGE_1];
		case 10: ammount = PLAYER_MISC[playerid][MISC_CARTRIDGE_2];
		case 11: ammount = PLAYER_MISC[playerid][MISC_CARTRIDGE_3];
	}
	return ammount;
}*/

/*GetNoUseItem(type)
{
	new valid;
	switch(type)
	{
		case 12..43: valid = true;
	}
	return valid;
}*/

GetItemObjectByType(type)
{
	new modelid;

	switch(type)
	{
		case 0: modelid = 11738;
		case 1: modelid = 11736;
		case 2: modelid = 11747;
		case 3: modelid = 1578;
		case 4: modelid = 1575;
		case 5: modelid = 1650;
		case 6: modelid = 11739;
		case 7: modelid = 11739;
		case 8: modelid = 11739;
		case 9: modelid = 19832;
		case 10: modelid = 19832;
		case 11: modelid = 19832;
		case 12: modelid = 336;//bat
		case 13: modelid = 334;//porra
		case 14: modelid = 335;//knife
		case 15: modelid = 337;//pala
		case 16: modelid = 338;//pool
		case 17: modelid = 343;
		case 18: modelid = 333;//golf
		case 19: modelid = 331;//punio
		case 22: modelid = 346;
		case 23: modelid = 347;
		case 24: modelid = 348;
		case 25: modelid = 349;
		case 26: modelid = 350;
		case 28: modelid = 352;
		case 29: modelid = 353;
		case 30: modelid = 355;
		case 31: modelid = 356;
		case 32: modelid = 372;
		case 33: modelid = 357;
		case 41: modelid = 365;
		case 43: modelid = 367;
		case 46: modelid = 371;
		case 50: modelid = 18866;
		case 51: modelid = 18632;
		case 52: modelid = 19631;
		case 53: modelid = 19921;
		case 54: modelid = 3027;
	}
	return modelid;
}

SetItemToBody(playerid, type)
{
	RemovePlayerAttachedObject(playerid, 9);

	switch(type)
	{
		case 0: SetPlayerAttachedObject(playerid, 9, 11738, 6, 0.2470, 0.0139, 0.0519, 0.5999, -102.4999, 0.4000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
		case 1: SetPlayerAttachedObject(playerid, 9, 11736, 6, 0.2470, 0.0139, 0.0069, 90.3999, 175.6999, 7.3000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
		case 2: SetPlayerAttachedObject(playerid, 9, 11747, 6, 0.0850, 0.0189, 0.0069, -157.9001, 175.6999, 7.3000, 1.2790, 1.3560, 1.4689, 0xFFFFFFFF, 0xFFFFFFFF);
		case 3, 4: SetPlayerAttachedObject(playerid, 9, GetItemObjectByType(type), 6, 0.0850, 0.0389, 0.0069, -81.2000, 175.6999, 7.3000, 0.3079, 0.3089, 0.2209, 0xFFFFFFFF, 0xFFFFFFFF);
		case 5: SetPlayerAttachedObject(playerid, 9, 1650, 6, 0.1430, 0.0249, 0.0149, -81.2000, -88.4000, 7.3000, 0.4980, 1.6589, 0.9489, 0xFFFFFFFF, 0xFFFFFFFF);
		case 6..8: SetPlayerAttachedObject(playerid, 9, 11739, 6, 0.1430, 0.0249, 0.0149, -81.2000, -88.4000, 7.3000, 0.4980, 0.5799, 0.9489, 0xFFFFFFFF, 0xFFFFFFFF);
		case 9..11: SetPlayerAttachedObject(playerid, 9, 19832, 6, 0.2910, -0.0060, 0.0149, -81.2000, -88.4000, 95.5000, 0.6470, 0.5799, 0.9489, 0xFFFFFFFF, 0xFFFFFFFF);
		case 12..43: SetPlayerAttachedObject(playerid, 9, GetItemObjectByType(type), 6, 0.0040, -0.0000, -0.0000, 0.5999, -0.2000, 0.4000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
		case 50: SetPlayerAttachedObject(playerid, 9, 18866, 6, 0.0970, 0.0429, 0.0149, 2.7999, -83.7000, -81.7000, 1.0330, 1.1429, 0.8569, 0xFFFFFFFF, 0xFFFFFFFF);
		case 51: SetPlayerAttachedObject(playerid, 9, 18632, 6, 0.0620, 0.0199, 0.0149, 9.1999, 171.9999, 103.0999, 0.8920, 0.9029, 1.0589, 0xFFFFFFFF, 0xFFFFFFFF);
		case 52: SetPlayerAttachedObject(playerid, 9, 19631, 6, 0.0789, 0.0000, 0.2580, -86.0000, -97.5000, 0.0000, 1.0000, 1.0000, 1.0000, 0xFFFFFFFF, 0xFFFFFFFF);
		case 53: SetPlayerAttachedObject(playerid, 9, 19921, 6, 0.0699, 0.0289, 0.0000, -75.9000, -5.8000, -84.7999, 0.6219, 0.6579, 0.5109, 0xFFFFFFFF, 0xFFFFFFFF);
		case 54: SetPlayerSpecialAction(playerid, SPECIAL_ACTION_SMOKE_CIGGY);
	}
	return 1;
}

ResetItemBody(playerid)
{
	RemovePlayerAttachedObject(playerid, 9);
	ac_ResetPlayerWeapons(playerid);
	PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] = 9999;
	return 1;
}