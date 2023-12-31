public OnGameModeInit()
{
	g_WoodcutterArea = CreateDynamicRectangle(-2081.361572, -2550.739990, -1625.361572, -2046.739990);
	
	new DBResult:Result;
	Result = db_query(Database, "SELECT `SAWMILL_STOCK` FROM `SERVER_PROPERTIES`;");
	if(db_num_rows(Result)) g_iSawmillStock = db_get_field_assoc_int(Result, "SAWMILL_STOCK");

	// Informaci�n
	CreateDynamicPickup(1275, 1, -1932.7006, -2454.7651, 30.7005);
	CreateDynamic3DTextLabel(""COL_YELLOW"Armario del aserradero\n"COL_WHITE"Usa "COL_YELLOW"Y"COL_WHITE" para ponerte en servicio.", COLOR_WHITE, -1932.7006, -2454.7651, 30.7005, 10.0, .testlos = true);

	// Cinta transportadora
	CreateDynamicPickup(1318, 1, -1989.2733, -2383.7856, 30.6250);
	CreateDynamic3DTextLabel(""COL_YELLOW"Cinta transportadora\n"COL_WHITE"Usa "COL_YELLOW"Y"COL_WHITE" para soltar tus troncos y recibir tu paga", COLOR_WHITE, -1989.2733, -2383.7856, 30.6250, 10.0, .testlos = true);

	// Stock del aserradero
	SawmillLabel = CreateDynamic3DTextLabel(sprintf(""COL_YELLOW"Existencias del aserradero\n"COL_WHITE"%d troncos", g_iSawmillStock), COLOR_WHITE, -1942.0737, -2453.7593, 30.6734, 5.0);
	
	new label[100];
	for(new i = 0; i != sizeof(Trees); ++i)
	{
		switch(Trees[i][tree_TYPE])
		{
			case TREE_TYPE_NORMAL:
			{
				Trees[i][tree_OBJECT] = CreateDynamicObject(696, Trees[i][tree_X], Trees[i][tree_Y], Trees[i][tree_Z], 0.0, 0.0, 0.0);
				format(label, sizeof(label), ""COL_YELLOW"�rbol\n"COL_WHITE"Usa "COL_YELLOW"ALT "COL_WHITE"para talarlo.");
				Trees[i][tree_LABEL] = CreateDynamic3DTextLabel(label, 0xFFFFFF00, Trees[i][tree_X], Trees[i][tree_Y], Trees[i][tree_Z] - 1.8, 10.0, .testlos = 0);
			}
			case TREE_TYPE_UNCOMMON:
			{
				Trees[i][tree_OBJECT] = CreateDynamicObject(655, Trees[i][tree_X], Trees[i][tree_Y], Trees[i][tree_Z], 0.0, 0.0, 0.0);
				format(label, sizeof(label), ""COL_YELLOW"�rbol poco com�n\n"COL_WHITE"Usa "COL_YELLOW"ALT "COL_WHITE"para talarlo.");
				Trees[i][tree_LABEL] = CreateDynamic3DTextLabel(label, 0xFFFFFF00, Trees[i][tree_X], Trees[i][tree_Y], Trees[i][tree_Z] + 0.5, 10.0, .testlos = 0);
			}
			case TREE_TYPE_RARE:
			{
				Trees[i][tree_OBJECT] = CreateDynamicObject(886, Trees[i][tree_X], Trees[i][tree_Y], Trees[i][tree_Z], 0.0, 0.0, 0.0);
				format(label, sizeof(label), ""COL_YELLOW"�rbol raro\n"COL_WHITE"Usa "COL_YELLOW"ALT "COL_WHITE"para talarlo.");
				Trees[i][tree_LABEL] = CreateDynamic3DTextLabel(label, 0xFFFFFF00, Trees[i][tree_X], Trees[i][tree_Y], Trees[i][tree_Z] + 0.5, 10.0, .testlos = 0);
			}
		}

		Streamer_SetIntData(STREAMER_TYPE_OBJECT, Trees[i][tree_OBJECT], E_STREAMER_EXTRA_ID, i);
	}

	#if defined WOOD_OnGameModeInit
		return WOOD_OnGameModeInit();
	#else
		return 1;
	#endif
}

public RegenerateTree(treeid)
{
	if(IsValidDynamicObject(Trees[treeid][tree_CHOPPED_OBJECT]))
	{
		DestroyDynamicObject(Trees[treeid][tree_CHOPPED_OBJECT]);
		Trees[treeid][tree_CHOPPED_OBJECT] = INVALID_OBJECT_ID;
	}

	new label[100];

	switch(Trees[treeid][tree_TYPE])
	{
		case TREE_TYPE_NORMAL:
		{
			Trees[treeid][tree_OBJECT] = CreateDynamicObject(696, Trees[treeid][tree_X], Trees[treeid][tree_Y], Trees[treeid][tree_Z], 0.0, 0.0, 0.0);
			format(label, sizeof(label), ""COL_YELLOW"�rbol\n"COL_WHITE"Usa "COL_YELLOW"ALT "COL_WHITE"para talarlo.");
		}
		case TREE_TYPE_UNCOMMON:
		{
			Trees[treeid][tree_OBJECT] = CreateDynamicObject(655, Trees[treeid][tree_X], Trees[treeid][tree_Y], Trees[treeid][tree_Z], 0.0, 0.0, 0.0);
			format(label, sizeof(label), ""COL_YELLOW"�rbol poco com�n\n"COL_WHITE"Usa "COL_YELLOW"ALT "COL_WHITE"para talarlo.");
		}
		case TREE_TYPE_RARE:
		{
			Trees[treeid][tree_OBJECT] = CreateDynamicObject(886, Trees[treeid][tree_X], Trees[treeid][tree_Y], Trees[treeid][tree_Z], 0.0, 0.0, 0.0);
			format(label, sizeof(label), ""COL_YELLOW"�rbol raro\n"COL_WHITE"Usa "COL_YELLOW"ALT "COL_WHITE"para talarlo.");
		}
	}

	UpdateDynamic3DTextLabelText(Trees[treeid][tree_LABEL], 0xFFFFFF00, label);
	Trees[treeid][tree_CHOPPED] = 
	Trees[treeid][tree_CHOPPING] = false;

	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(PLAYER_WORKS[playerid][WORK_WOODCUTTER])
	{
		if((newkeys & KEY_YES))
		{
			if(IsPlayerInRangeOfPoint(playerid, 1.0, -1932.7006, -2454.7651, 30.7005))
			{
				if(!PLAYER_TEMP[playerid][py_WORKING_IN]) StartPlayerJob(playerid, WORK_WOODCUTTER);
				else EndPlayerJob(playerid);
			}
		}

		if(PLAYER_TEMP[playerid][py_WORKING_IN] == WORK_WOODCUTTER)
		{
			if((newkeys & KEY_WALK) && (newkeys & KEY_FIRE) && !CA_IsPlayerBlocked(playerid))
			{
				if(PLAYER_TEMP[playerid][py_HOLDING_CART])
				{
					new Float:x, Float:y, Float:z;
					GetXYInFrontOfPlayer(playerid, x, y, 3.5);
					CA_FindZ_For2DCoord(x, y, z);

					LogCarts[playerid][cart_OBJECT] = CreateDynamicObject(1458, x, y, z, 0.0, 0.0, 0.0);
					LogCarts[playerid][cart_LABEL] = CreateDynamic3DTextLabel(sprintf(""COL_YELLOW"Carrito de %s\n"COL_WHITE"Usa "COL_YELLOW"ALT + CLICK "COL_WHITE"para agarrarlo.", ACCOUNT_INFO[playerid][ac_NAME]), COLOR_WHITE, x, y, z + 0.5, 5.0);
			
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					RemovePlayerAttachedObject(playerid, 1);
					SetPlayerAttachedObject(playerid, 2, 341, 6, 0.026999, -0.015000, -0.096999, 0.000000, -35.600006, 0.000000, 1.000000, 1.000000, 1.000000);
					
					PLAYER_TEMP[playerid][py_HOLDING_CART] = false;
				}
				else
				{
					if(LogCarts[playerid][cart_VALID] && IsValidDynamicObject(LogCarts[playerid][cart_OBJECT]))
					{
						new Float:x, Float:y, Float:z;
						GetDynamicObjectPos(LogCarts[playerid][cart_OBJECT], x, y, z);
						if(IsPlayerInRangeOfPoint(playerid, 1.5, x, y, z))
						{
							RemovePlayerAttachedObject(playerid, 1);
							RemovePlayerAttachedObject(playerid, 2);
							SetPlayerAttachedObject(playerid, 1, 1458, 6, 1.840000, -0.546001, 0.419000, 62.100097, -158.799804, 78.600196, 0.474999, 1.000000, 1.000000);
							SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
							DestroyDynamicObject(LogCarts[playerid][cart_OBJECT]);
							DestroyDynamic3DTextLabel(LogCarts[playerid][cart_LABEL]);
							PLAYER_TEMP[playerid][py_HOLDING_CART] = true;
						}
					}
				}
			}

			if((newkeys & KEY_WALK) && !PLAYER_TEMP[playerid][py_HOLDING_CART])
			{
				if(PLAYER_TEMP[playerid][py_CUTTING] == -1)
				{
					new object = GetPlayerCameraTargetObject(playerid);
					if(object != INVALID_OBJECT_ID)
					{
						new index = Streamer_GetItemStreamerID(playerid, STREAMER_TYPE_OBJECT, object);
						new model = Streamer_GetIntData(STREAMER_TYPE_OBJECT, index, E_STREAMER_MODEL_ID);
						if(model == 696 || model == 655 || model == 886)
						{
							new treeid = Streamer_GetIntData(STREAMER_TYPE_OBJECT, index, E_STREAMER_EXTRA_ID);

							if(Trees[treeid][tree_CHOPPED] || Trees[treeid][tree_CHOPPING] || Trees[treeid][tree_TYPE] == NOT_A_TREE) return 1;

							new Float:x, Float:y, Float:z;
							GetDynamicObjectPos(index, x, y, z);
							CA_FindZ_For2DCoord(x, y, z);

							if(!IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) return 1;

							new colors[5] = {0xe73939FF, 0x6ed854FF, 0xe3e145FF, 0x20aee7FF};
							new color = minrand(0, sizeof(colors));

							TextDrawShowForPlayer(playerid, Textdraws[textdraw_PROGRESS_BG]);
							PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][0], "hud:radar_gangY");
							PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][1], "Talando...");
							PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][2], TextToSpanish("Pulsa ESPACIO r�pidamente"));
							PlayerTextDrawBoxColor(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][3], AdjustDarkness(colors[color], 1.75));
							PlayerTextDrawBoxColor(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4], colors[color]);
							PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4], 382.000000, 0.000000);
							PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][0]);
							PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][1]);
							PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][2]);
							PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][3]);
							PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);

							KillTimer(PLAYER_TEMP[playerid][py_TIMERS][45]);
							KillTimer(PLAYER_TEMP[playerid][py_TIMERS][46]);

							new time;
							switch(Trees[treeid][tree_TYPE])
							{
								case TREE_TYPE_NORMAL: time = 30000;
								case TREE_TYPE_UNCOMMON: time = 45000;
								case TREE_TYPE_RARE: time = 65000;
							}
							PLAYER_TEMP[playerid][py_TIMERS][45] = SetTimerEx("FinishTreeCutting", time, false, "dd", playerid, treeid);
							PLAYER_TEMP[playerid][py_TIMERS][46] = SetTimerEx("UpdateTreeCutting", 100, true, "d", playerid);
							ApplyAnimation(playerid, "CHAINSAW", "null", 0.0, 0, 0, 0, 0, 0, 0); // Preload
							ApplyAnimation(playerid, "CHAINSAW", "WEAPON_CSAW", 4.1, true, false, false, true, 0, true);

							PLAYER_TEMP[playerid][py_CUTTING] = treeid;

							Trees[treeid][tree_CHOPPING] = true;
						}
					}
				}
			}

			if(newkeys & KEY_SPRINT)
			{
				if(PLAYER_TEMP[playerid][py_CUTTING] != -1 && Trees[ PLAYER_TEMP[playerid][py_CUTTING] ][tree_CHOPPING])
				{
					PLAYER_TEMP[playerid][py_CUTTING_PROGRESS] += 8;

					new Float:size = (382.0 + PLAYER_TEMP[playerid][py_CUTTING_PROGRESS]);

					if(size < 382.0 && size > 246.0)
					{
						PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4], size, 0.000000);
					}

					PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);
				}
				else
				{
					PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);
				}
			}

			if((newkeys & KEY_YES) && PLAYER_TEMP[playerid][py_HOLDING_CART])
			{
				if(IsPlayerInRangeOfPoint(playerid, 1.0, -1989.2733, -2383.7856, 30.6250))
				{
					if(LogCarts[playerid][cart_AMOUNT] <= 0) return ShowPlayerNotification(playerid, "Tu carro no tiene troncos que soltar.", 3);
					new object = CreateDynamicObject(19793, -1989.995337, -2384.471191, 29.726585, 0.0, 0.0, -44.100006);
					MoveDynamicObject(object, -1993.934570, -2388.530761, 31.026594, 1.0, 0.0, 0.0, -44.100006);
					SetTimerEx("GenerateLogs", 1000, false, "d", LogCarts[playerid][cart_AMOUNT] - 1);
					SetTimerEx("DestroyLogs", 5000, false, "d", object);

					g_iSawmillStock += LogCarts[playerid][cart_AMOUNT];
					safe_db_query(sprintf("UPDATE `SERVER_PROPERTIES` SET `SAWMILL_STOCK` = %d;", g_iSawmillStock));
					UpdateDynamic3DTextLabelText(SawmillLabel, COLOR_WHITE, sprintf(""COL_YELLOW"Existencias del aserradero\n"COL_WHITE"%d troncos", g_iSawmillStock));

					GivePlayerCash(playerid, 150 * LogCarts[playerid][cart_AMOUNT]);
					ShowPlayerNotification(playerid, sprintf("Procesaste ~r~%d ~w~troncos y recibiste ~g~%d$ ~w~como paga.", LogCarts[playerid][cart_AMOUNT], 150 * LogCarts[playerid][cart_AMOUNT]), 3);
					LogCarts[playerid][cart_AMOUNT] = 0;
				}
			}
		}
	}

	#if defined WOOD_OnPlayerKeyStateChange
		return WOOD_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
	#else
		return 1;
	#endif
}

public GenerateLogs(amount)
{
	if(amount <= 0) return 1;

	new object = CreateDynamicObject(19793, -1989.995337, -2384.471191, 29.726585, 0.0, 0.0, -44.100006);
	MoveDynamicObject(object, -1993.934570, -2388.530761, 31.026594, 1.0, 0.0, 0.0, -44.100006);

	SetTimerEx("GenerateLogs", 1000, false, "d", amount - 1);
	SetTimerEx("DestroyLogs", 5000, false, "d", object);
	return 1;
}

public DestroyLogs(object)
{
	if(IsValidDynamicObject(object))
		DestroyDynamicObject(object);

	return 1;
}

public UpdateTreeCutting(playerid)
{
	if(PLAYER_TEMP[playerid][py_CUTTING] != -1)
	{
		PLAYER_TEMP[playerid][py_CUTTING_PROGRESS] -= (PLAYER_TEMP[playerid][py_CUTTING_PROGRESS] / 15);
		if(PLAYER_TEMP[playerid][py_CUTTING_PROGRESS] < 0) PLAYER_TEMP[playerid][py_CUTTING_PROGRESS] = 1;

		new Float:size = (382.0 - PLAYER_TEMP[playerid][py_CUTTING_PROGRESS]);

		if(size < 382.0 && size > 246.0)
		{
			PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4], size, 0.000000);
		}

		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);
	}

	return 1;
}

public FinishTreeCutting(playerid, treeid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][45]);
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][46]);

	if(!IsPlayerConnected(playerid)) return 1;

	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PROGRESS_BG]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][0]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][1]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][2]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][3]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);
	ClearAnimations(playerid);

	if(!IsPlayerInRangeOfPoint(playerid, 5.0, Trees[treeid][tree_X], Trees[treeid][tree_Y], Trees[treeid][tree_Z]))
	{
		Trees[ PLAYER_TEMP[playerid][py_CUTTING] ][tree_CHOPPING] =
		Trees[ PLAYER_TEMP[playerid][py_CUTTING] ][tree_CHOPPED] = false;
		PLAYER_TEMP[playerid][py_CUTTING] = -1;
		return ShowPlayerNotification(playerid, "Te alejaste mucho del �rbol y no lo pudiste cortar.", 3);
	}
	if(PLAYER_TEMP[playerid][py_CUTTING_PROGRESS] < 50)
	{
		Trees[ PLAYER_TEMP[playerid][py_CUTTING] ][tree_CHOPPING] =
		Trees[ PLAYER_TEMP[playerid][py_CUTTING] ][tree_CHOPPED] = false;
		PLAYER_TEMP[playerid][py_CUTTING] = -1;
		return ShowPlayerNotification(playerid, "No pusiste suficiente empe�o en cortar el �rbol.", 3);
	}

	PLAYER_TEMP[playerid][py_CUTTING] = -1;

	PLAYER_TEMP[playerid][py_CUTTING_PROGRESS] = 0;
	PLAYER_SKILLS[playerid][WORK_WOODCUTTER]++;

	new label[100], Float:z;
	DestroyDynamicObject(Trees[treeid][tree_OBJECT]);
	format(label, sizeof(label), ""COL_YELLOW"Ramas de un arbol\n"COL_WHITE"Este �rbol fue cortado hace poco. Crecera en unos minutos.");

	CA_FindZ_For2DCoord(Trees[treeid][tree_X], Trees[treeid][tree_Y], z);
	UpdateDynamic3DTextLabelText(Trees[treeid][tree_LABEL], 0xFFFFFF00, label);

	Trees[treeid][tree_CHOPPED_OBJECT] = CreateDynamicObject(831, Trees[treeid][tree_X], Trees[treeid][tree_Y], z, 0.0, 0.0, 0.0);

	Trees[treeid][tree_CHOPPED] = true;
	Trees[treeid][tree_CHOPPING] = false;

	SetTimerEx("RegenerateTree", 120000 * (Trees[treeid][tree_TYPE] + 1), false, "d", treeid);

	switch(Trees[treeid][tree_TYPE])
	{
		case TREE_TYPE_NORMAL: format(label, sizeof(label), "Talaste un �rbol. Acerca tu carrito para agarrar los troncos.");
		case TREE_TYPE_UNCOMMON: format(label, sizeof(label), "Talaste un �rbol poco com�n. Acerca tu carrito para agarrar los troncos.");
		case TREE_TYPE_RARE: format(label, sizeof(label), "Talaste un �rbol raro. Acerca tu carrito para agarrar los troncos.");
	}
	
	ShowPlayerNotification(playerid, label, 5);

	PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT] = CreateDynamicCP(Trees[treeid][tree_X], Trees[treeid][tree_Y], Trees[treeid][tree_Z], 5.0, .playerid = playerid);
	Streamer_SetIntData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT], E_STREAMER_EXTRA_ID, treeid);
	TogglePlayerDynamicCP(playerid, PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT], true);

	Streamer_Update(playerid);

	return 1;
}

public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
	if(PLAYER_TEMP[playerid][py_WORKING_IN] == WORK_WOODCUTTER)
	{
		if(IsValidDynamicCP(PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT]))
		{
			if(checkpointid == PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT])
			{
				if(PLAYER_TEMP[playerid][py_HOLDING_CART])
				{
					new index = Streamer_GetIntData(STREAMER_TYPE_CP, PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT], E_STREAMER_EXTRA_ID);
					LogCarts[playerid][cart_AMOUNT] += Trees[index][tree_TYPE];
					if(LogCarts[playerid][cart_AMOUNT] > 10)
					{
						LogCarts[playerid][cart_AMOUNT] = 10;
						ShowPlayerNotification(playerid, TextToSpanish("No pudiste agarrar m�s troncos porque tu carrito est� lleno. Entregalos en la cinta transportadora."), 5);
					}
					else
					{
						ShowPlayerNotification(playerid, sprintf("Agarraste ~r~%d ~w~tronco%s. Tu carrito ahora tiene ~r~%d/10 ~w~troncos.", Trees[index][tree_TYPE], Trees[index][tree_TYPE] + 1 > 1 ? "s" : "", LogCarts[playerid][cart_AMOUNT]), 5);
					}

					TogglePlayerDynamicCP(playerid, PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT], false);
					DestroyDynamicCP(PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT]);

					return 1;
				}
			}
		}
	}

	#if defined WOOD_OnPlayerEnterDynamicCP
		return WOOD_OnPlayerEnterDynamicCP(playerid, checkpointid);
	#else
		return 1;
	#endif
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{	
	if(areaid == g_WoodcutterArea && PLAYER_TEMP[playerid][py_WORKING_IN] == WORK_WOODCUTTER)
	{
		ShowPlayerNotification(playerid, TextToSpanish("Fuiste removido del servicio como le�ador por salir del bosque y el aserradero."), 5);
		EndPlayerJob(playerid);

		return 1;
	}

	#if defined WOOD_OnPlayerLeaveDynamicArea
		return WOOD_OnPlayerLeaveDynamicArea(playerid, areaid);
	#else
		return 1;
	#endif
}

/* 			Hooks			*/

#if defined _ALS_OnGameModeInit
	#undef OnGameModeInit
#else
	#define _ALS_OnGameModeInit
#endif
#define OnGameModeInit WOOD_OnGameModeInit
#if defined WOOD_OnGameModeInit
	forward WOOD_OnGameModeInit();
#endif


#if defined _ALS_OnPlayerKeyStateChange
	#undef OnPlayerKeyStateChange
#else
	#define _ALS_OnPlayerKeyStateChange
#endif
#define OnPlayerKeyStateChange WOOD_OnPlayerKeyStateChange
#if defined WOOD_OnPlayerKeyStateChange
	forward WOOD_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
#endif


#if defined _ALS_OnPlayerEnterDynamicCP
	#undef OnPlayerEnterDynamicCP
#else
	#define _ALS_OnPlayerEnterDynamicCP
#endif
#define OnPlayerEnterDynamicCP WOOD_OnPlayerEnterDynamicCP
#if defined WOOD_OnPlayerEnterDynamicCP
	forward WOOD_OnPlayerEnterDynamicCP(playerid, checkpointid);
#endif


#if defined _ALS_OnPlayerLeaveDynamicArea
	#undef OnPlayerLeaveDynamicArea
#else
	#define _ALS_OnPlayerLeaveDynamicArea
#endif
#define OnPlayerLeaveDynamicArea WOOD_OnPlayerLeaveDynamicArea
#if defined WOOD_OnPlayerLeaveDynamicArea
	forward WOOD_OnPlayerLeaveDynamicArea(playerid, areaid);
#endif