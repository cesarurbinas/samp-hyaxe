new
	g_iInvLastTick[MAX_PLAYERS];

ShowInventory(playerid, type = 0)
{
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

	PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][10], COLOR_GREY_TWO);
	PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][11], COLOR_GREY_TWO);
	PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][12], COLOR_GREY_TWO);
	PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][13], COLOR_GREY_TWO);
	PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][14], COLOR_GREY_TWO);
	PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][15], COLOR_GREY_TWO);
	PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][16], COLOR_GREY_TWO);
	PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][17], COLOR_GREY_TWO);
	PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][18], COLOR_GREY_TWO);
	PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][19], COLOR_GREY_TWO);
	PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][20], COLOR_GREY_TWO);
	PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_INV][21], COLOR_GREY_TWO);

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

	switch(type)
	{
		case 0:
		{
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], "Inventario");
			inv_AccommodateItems(playerid);

			new 
				target_player = GetPlayerCameraTargetPlayer(playerid),
				Float:pos[4],
				str_text[128],
				Float:size_items = 330.000000;
				
			format(str_text, sizeof(str_text), "%d/16", PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] + 1);
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
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], "Propiedad");
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2]);
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3]);
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);

			inv_AccommodatePropertyItems(playerid, PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_ID]);

			new 
				str_text[128],
				Float:size_items = 330.000000
			;
				
			format(str_text, sizeof(str_text), "%d/16", PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] + 1);
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
			PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][1], "Propiedad");
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][2]);
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][3]);
			PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_INV][40]);
				
			inv_AccommodateItems(playerid);

			new
				str_text[128],
				Float:size_items = 330.000000;
				
			format(str_text, sizeof(str_text), "%d/16", PLAYER_TEMP[playerid][py_INV_OCC_SLOTS] + 1);
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
	}

	SelectTextDrawEx(playerid, COLOR_RED);
	return 1;
}

HideInventory(playerid)
{
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
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_INV][48], TextToSpanish("~w~La idea de Hyaxe surgió en 2018, pero no fue hasta mediados de 2019 que comenzó a desarrollarse, con tiempos más activos y otros no tanto, pasó por varios cambios, primero fue un juego de roles y luego de supervivencia, nos quedamos con la primera opción porque la encontramos más rentable en SA:MP. Con el tiempo ampliamos nuestras fronteras a nuevos juegos como GTA:V, Rust, entre otros, las personas que trabajan en Hyaxe son pocas, pero esperamos que en el futuro aumente el número de miembros del equipo."));

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