public OnGameModeInit()
{
	g_WoodcutterArea = CreateDynamicRectangle(-2065.0, -2446.1595458984375, -1707.5294494628906, -2092.0);

	for(new i = 0; i != sizeof(Trees); ++i)
	{
		new label[100];
		switch(Trees[i][tree_TYPE])
		{
			case TREE_TYPE_NORMAL:
			{
				Trees[i][tree_OBJECT] = CreateDynamicObject(696, Trees[i][tree_X], Trees[i][tree_Y], Trees[i][tree_Z], 0.0, 0.0, 0.0);
				format(label, sizeof(label), ""COL_RED"Árbol\n"COL_WHITE"Usa "COL_RED"ALT "COL_WHITE"para talarlo.");
			}
			case TREE_TYPE_UNCOMMON:
			{
				Trees[i][tree_OBJECT] = CreateDynamicObject(655, Trees[i][tree_X], Trees[i][tree_Y], Trees[i][tree_Z], 0.0, 0.0, 0.0);
				format(label, sizeof(label), ""COL_RED"Árbol poco común\n"COL_WHITE"Usa "COL_RED"ALT "COL_WHITE"para talarlo.");
			}
			case TREE_TYPE_RARE:
			{
				Trees[i][tree_OBJECT] = CreateDynamicObject(886, Trees[i][tree_X], Trees[i][tree_Y], Trees[i][tree_Z], 0.0, 0.0, 0.0);
				format(label, sizeof(label), ""COL_RED"Árbol raro\n"COL_WHITE"Usa "COL_RED"ALT "COL_WHITE"para talarlo.");
			}
		}

		Trees[i][tree_LABEL] = CreateDynamic3DTextLabel(label, 0xFFFFFF00, Trees[i][tree_X], Trees[i][tree_Y], Trees[i][tree_Z], 5.0, .testlos = true);
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
			format(label, sizeof(label), ""COL_RED"Árbol\n"COL_WHITE"Usa "COL_RED"ALT "COL_WHITE"para talarlo.");
		}
		case TREE_TYPE_UNCOMMON:
		{
			Trees[treeid][tree_OBJECT] = CreateDynamicObject(655, Trees[treeid][tree_X], Trees[treeid][tree_Y], Trees[treeid][tree_Z], 0.0, 0.0, 0.0);
			format(label, sizeof(label), ""COL_RED"Árbol poco común\n"COL_WHITE"Usa "COL_RED"ALT "COL_WHITE"para talarlo.");
		}
		case TREE_TYPE_RARE:
		{
			Trees[treeid][tree_OBJECT] = CreateDynamicObject(886, Trees[treeid][tree_X], Trees[treeid][tree_Y], Trees[treeid][tree_Z], 0.0, 0.0, 0.0);
			format(label, sizeof(label), ""COL_RED"Árbol raro\n"COL_WHITE"Usa "COL_RED"ALT "COL_WHITE"para talarlo.");
		}
	}

	UpdateDynamic3DTextLabelText(Trees[treeid][tree_LABEL], 0xFFFFFF00, label);
	Trees[treeid][tree_CHOPPED] = 
	Trees[treeid][tree_CHOPPING] = false;

	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if((newkeys & KEY_WALK) && PLAYER_WORKS[playerid][WORK_WOODCUTTER] && PLAYER_TEMP[playerid][py_WORKING_IN] == WORK_WOODCUTTER)
	{
		if(PLAYER_TEMP[playerid][py_CUTTING] == -1)
		{
			for(new i = 0; i != sizeof(Trees); ++i)
			{
				if(Trees[i][tree_CHOPPED] || Trees[i][tree_CHOPPING]) continue;
				if(!IsPlayerInRangeOfPoint(playerid, 2.0, Trees[i][tree_X], Trees[i][tree_Y], Trees[i][tree_Z])) continue;

				new colors[] = {0xe73939FF, 0x6ed854FF, 0xe3e145FF, 0x20aee7FF};
				new color = minrand(0, sizeof(colors));

				PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][1], "Talando...");
				PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][2], TextToSpanish("Pulsa ESPACIO rápidamente"));
				PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][1]);
				PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][2]);

				PlayerTextDrawBoxColor(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][3], AdjustDarkness(colors[color], 1.75));
				PlayerTextDrawBoxColor(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4], colors[color]);
				PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4], 382.000000, 0.000000);
				PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][3]);
				PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);

				KillTimer(PLAYER_TEMP[playerid][py_TIMERS][45]);
				KillTimer(PLAYER_TEMP[playerid][py_TIMERS][46]);
				PLAYER_TEMP[playerid][py_TIMERS][45] = SetTimerEx("FinishTreeCutting", 10000, false, "dd", playerid, i);
				PLAYER_TEMP[playerid][py_TIMERS][46] = SetTimerEx("UpdateTreeCutting", 100, true, "d", playerid);
				PLAYER_TEMP[playerid][py_CUTTING] = i;

				Trees[i][tree_CHOPPING] = true;
				break;
			}
		}
		else
		{
			PLAYER_TEMP[playerid][py_CUTTING_PROGRESS] += 5;

			new Float:size = (382.0 + PLAYER_TEMP[playerid][py_CUTTING_PROGRESS]);

			if(size < 382.0 && size > 246.0)
			{
				PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4], size, 0.000000);
			}

			PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);
		}
	}

	#if defined WOOD_OnPlayerKeyStateChange
		return WOOD_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
	#else
		return 1;
	#endif
}

public UpdateTreeCutting(playerid)
{
	if(PLAYER_TEMP[playerid][py_CUTTING] != -1)
	{
		PLAYER_TEMP[playerid][py_CUTTING_PROGRESS] -= (PLAYER_TEMP[playerid][py_CUTTING_PROGRESS] / 9);
		if(PLAYER_TEMP[playerid][py_CUTTING_PROGRESS] < 0) PLAYER_TEMP[playerid][py_CUTTING_PROGRESS] = 1;

		new Float:size = (382.0 - PLAYER_TEMP[playerid][py_CUTTING_PROGRESS]);

		if(size < 382.0 && size > 246.0)
		{
			PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4], size, 0.000000);
		}

		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);
	} else KillTimer(PLAYER_TEMP[playerid][py_TIMERS][46]);

	return 1;
}

public FinishTreeCutting(playerid, treeid)
{
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_PROGRESS_BG]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][0]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][1]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][2]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][3]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);
	PLAYER_TEMP[playerid][py_CUTTING_PROGRESS] = 0;
	PLAYER_TEMP[playerid][py_CUTTING] = -1;

	if(!IsPlayerInRangeOfPoint(playerid, 2.0, Trees[treeid][tree_X], Trees[treeid][tree_Y], Trees[treeid][tree_Z])) return ShowPlayerNotification(playerid, "Te alejaste mucho del árbol y no lo pudiste cortar.", 3);
	if(PLAYER_TEMP[playerid][py_CUTTING_PROGRESS] < 50) return ShowPlayerNotification(playerid, "No pusiste suficiente empeño en cortar el árbol.", 3);

	new label[100];
	DestroyDynamicObject(Trees[treeid][tree_OBJECT]);
	format(label, sizeof(label), ""COL_RED"Ramas de un arbol\n"COL_WHITE"Este árbol fue cortado hace poco. Crecera en unos minutos.");

	UpdateDynamic3DTextLabelText(Trees[treeid][tree_LABEL], 0xFFFFFF00, label);
	Trees[treeid][tree_CHOPPED_OBJECT] = CreateDynamicObject(831, Trees[treeid][tree_X], Trees[treeid][tree_Y], Trees[treeid][tree_Z], 0.0, 0.0, 0.0);
	Trees[treeid][tree_CHOPPED] = true;
	Trees[treeid][tree_CHOPPING] = false;

	SetTimerEx("RegenerateTree", 120000 * (Trees[treeid][tree_TYPE] + 1), false, "d", treeid);

	switch(Trees[treeid][tree_TYPE])
	{
		case TREE_TYPE_NORMAL: format(label, sizeof(label), "Talaste un árbol y un tronco fue agregado a tu carrito.");
		case TREE_TYPE_UNCOMMON: format(label, sizeof(label), "Talaste un árbol poco común y dos troncos fueron agregados a tu carrito.");
		case TREE_TYPE_RARE: format(label, sizeof(label), "Talaste un árbol raro y tres troncos fueron agregados a tu carrito.");
	}
	
	ShowPlayerNotification(playerid, label, 5);
	return 1;
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