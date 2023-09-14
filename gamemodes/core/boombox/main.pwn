#define MAX_BOOMBOXS 25
enum E_BOOMBOX_DATA {
	bool:bb_VALID,
	bool:bb_PUBLIC,
	bb_OWNER,
	bool:bb_PLAYING,

	Float:bb_POS[3],
	bb_WORLD,
	bb_INTERIOR,
	bb_OBJECT,
	Text3D:bb_LABEL
};
new BOOMBOX[MAX_BOOMBOXS][E_BOOMBOX_DATA];

/*CreateBoombox(playerid)
{
	new id = GetBoomboxFreeIndex();
	if(id == -1) return -1;

	BOOMBOX[id][bb_VALID] = true;
	GetPlayerPos(playerid, BOOMBOX[id][bb_POS][0], BOOMBOX[id][bb_POS][1], BOOMBOX[id][bb_POS][2]);
	BOOMBOX[id][bb_INTERIOR] = GetPlayerInterior(playerid);
	BOOMBOX[id][bb_WORLD] = GetPlayerVirtualWorld(playerid);
	BOOMBOX[id][bb_OBJECT] = CreateDynamicObject(2226, BOOMBOX[id][bb_POS][0], BOOMBOX[id][bb_POS][1], BOOMBOX[id][bb_POS][2] - 1.0, 0.0, 0.0, 0.0, .worldid = BOOMBOX[id][bb_WORLD], .interiorid = BOOMBOX[id][bb_INTERIOR]);
	BOOMBOX[id][bb_LABEL] = CreateDynamic3DTextLabel(sprintf(""COL_YELLOW"Parlante de %s (ID %d)\n"COL_WHITE"Público: "COL_RED"No", ACCOUNT_INFO[playerid][ac_NAME], id), 0xFFFFFFFF, BOOMBOX[id][bb_POS][0], BOOMBOX[id][bb_POS][1], BOOMBOX[id][bb_POS][2], 5.0, .testlos = 1, .worldid = BOOMBOX[id][bb_WORLD], .interiorid = BOOMBOX[id][bb_INTERIOR]);
	BOOMBOX[id][bb_PUBLIC] =
	BOOMBOX[id][bb_PLAYING] = false;
	BOOMBOX[id][bb_OWNER] = ACCOUNT_INFO[playerid][ac_ID];

	return 1;
}*/

PlayAudioInBoombox(requester, id, const url[])
{
	if(!BOOMBOX[id][bb_VALID]) return 0;
	if(!BOOMBOX[id][bb_PUBLIC] && ACCOUNT_INFO[requester][ac_ID] != BOOMBOX[id][bb_OWNER]) return 0;

	BOOMBOX[id][bb_PLAYING] = true;
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if(!IsPlayerConnected(i)) continue;
		if(IsPlayerInRangeOfPoint(i, 50.0, BOOMBOX[id][bb_POS][0], BOOMBOX[id][bb_POS][1], BOOMBOX[id][bb_POS][2]))
		{
			PlayAudioStreamForPlayer(i, url, BOOMBOX[id][bb_POS][0], BOOMBOX[id][bb_POS][1], BOOMBOX[id][bb_POS][2], 50.0, 1);
			ShowPlayerNotification(i, sprintf("Reproduciendo %s. Solicitaddo por %s", PLAYER_DIALOG_MP3_RESULT[requester][ PLAYER_TEMP[requester][py_RESULT_INDEX] ][result_NAME], ACCOUNT_INFO[requester][ac_NAME]), 5);
		}
	}

	return 1;
}

UpdateBoombox(id, bool:ispublic)
{
	if(!BOOMBOX[id][bb_VALID]) return 0;
	BOOMBOX[id][bb_PUBLIC] = ispublic;
	if(ispublic) UpdateDynamic3DTextLabelText(BOOMBOX[id][bb_LABEL], COLOR_WHITE, sprintf(""COL_YELLOW"Parlante de %s (ID %d)\n"COL_WHITE"Público: "COL_YELLOW"Sí", ACCOUNT_INFO[ GetBoomboxOwner(id) ][ac_NAME], id));
	else UpdateDynamic3DTextLabelText(BOOMBOX[id][bb_LABEL], COLOR_WHITE, sprintf(""COL_YELLOW"Parlante de %s (ID %d)\n"COL_WHITE"Público: "COL_RED"No", ACCOUNT_INFO[ GetBoomboxOwner(id) ][ac_NAME], id));
	return 1;
}

DestroyBoombox(id)
{
	if(!BOOMBOX[id][bb_VALID]) return 1;

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if(IsPlayerInRangeOfPoint(i, 50.0, BOOMBOX[id][bb_POS][0], BOOMBOX[id][bb_POS][1], BOOMBOX[id][bb_POS][2]) && GetPlayerInterior(i) == BOOMBOX[id][bb_INTERIOR] && GetPlayerVirtualWorld(i) == BOOMBOX[id][bb_WORLD])
			StopAudioStreamForPlayer(i);
	}

	BOOMBOX[id][bb_VALID] =
	BOOMBOX[id][bb_PLAYING] = 
	BOOMBOX[id][bb_PUBLIC] = false;
	BOOMBOX[id][bb_POS][0] = 
	BOOMBOX[id][bb_POS][1] = 
	BOOMBOX[id][bb_POS][2] = -1.0;
	BOOMBOX[id][bb_OWNER] = 0;
	DestroyDynamicObject(BOOMBOX[id][bb_OBJECT]);
	DestroyDynamic3DTextLabel(BOOMBOX[id][bb_LABEL]);
	BOOMBOX[id][bb_OBJECT] = INVALID_OBJECT_ID;
	BOOMBOX[id][bb_LABEL] = INVALID_3DTEXT_ID;

	return 1; 
}

/*GetBoomboxFreeIndex()
{
	for(new i = 0; i < MAX_BOOMBOXS; i++)
	{
		if(!BOOMBOX[i][bb_VALID]) return i;
	}

	return -1;
}

IsPlayerNearBoombox(playerid, Float:range = 5.0)
{
	for(new i = 0; i < MAX_BOOMBOXS; i++)
	{
		if(!BOOMBOX[i][bb_VALID]) continue;
		if(GetPlayerInterior(playerid) == BOOMBOX[i][bb_INTERIOR] && GetPlayerVirtualWorld(playerid) == BOOMBOX[i][bb_WORLD] && IsPlayerInRangeOfPoint(playerid, range, BOOMBOX[i][bb_POS][0], BOOMBOX[i][bb_POS][1], BOOMBOX[i][bb_POS][2])) return i;
	}

	return -1;
}*/

GetBoomboxOwner(id)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if(!IsPlayerConnected(i)) continue;
		if(BOOMBOX[id][bb_OWNER] == ACCOUNT_INFO[i][ac_ID]) return i;
	}

	return DestroyBoombox(id);
}

bool:PlayerHasBoombox(playerid)
{
	for(new i = 0; i < MAX_BOOMBOXS; i++)
	{
		if(!BOOMBOX[i][bb_VALID]) continue;
		if(BOOMBOX[i][bb_OWNER] == ACCOUNT_INFO[playerid][ac_ID]) return true;
	}

	return false;
}

CMD:parlante(playerid, params[])
{	
	ShowPlayerMessage(playerid, "~r~YouTube nos ha baneado, esta opcion se encuentra desactivada.", 4);

	/*new options[12];
	if(sscanf(params, "s[12]", options)) return SendClientMessage(playerid, COLOR_WHITE, "Syntax: /parlante (colocar/reproducir/recoger/parar/opciones)");

	if(isequal(options, "colocar", true))
	{
		if(!PLAYER_OBJECT[playerid][po_BOOMBOX]) return ShowPlayerMessage(playerid, "~r~No tienes parlantes. Ve a una tienda electrónica.", 4);

		if(PlayerHasBoombox(playerid)) return ShowPlayerMessage(playerid, "~r~Ya tienes un parlante colocado.", 4);
		if(IsPlayerNearBoombox(playerid, 50.0) != -1) return ShowPlayerMessage(playerid, "~r~Ya hay un parlante cerca.", 4);
		if(CreateBoombox(playerid) != -1) 
		{
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 1000, true);
			SendClientMessage(playerid, COLOR_WHITE, "Colocaste tu "COL_YELLOW"parlante "COL_WHITE"en el suelo.");
		} else SendClientMessage(playerid, COLOR_YELLOW, "Hay muchos parlantes colocados en el mundo. Intenta más tarde.");
	}
	else if(isequal(options, "reproducir", true))
	{
		new bbid = IsPlayerNearBoombox(playerid);
		if(bbid == -1) return ShowPlayerMessage(playerid, "~r~No estás cerca de un parlante.", 4);
		if(!BOOMBOX[bbid][bb_PUBLIC] && BOOMBOX[bbid][bb_OWNER] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~No puedes usar este parlante porque no es público.", 4);
		if(BOOMBOX[bbid][bb_PLAYING]) return ShowPlayerMessage(playerid, "~r~Este parlante ya está reproduciendo algo. Usa /parlante parar.", 4);
		if(gettime() < PLAYER_TEMP[playerid][py_LAST_SEARCH] + 60) return ShowPlayerMessage(playerid, "~r~Solo puedes buscar cada 60 segundos.", 4);
		
		PLAYER_TEMP[playerid][py_MUSIC_BOOMBOX] = bbid;
		ShowDialog(playerid, DIALOG_PLAYER_MP3);
	}
	else if(isequal(options, "recoger", true))
	{
		new bbid = IsPlayerNearBoombox(playerid);
		if(bbid == -1) return ShowPlayerMessage(playerid, "~r~No estás cerca de un parlante.", 4);
		if(BOOMBOX[bbid][bb_OWNER] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~Este parlante no es tuyo.", 4);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 1000, true);
		DestroyBoombox(bbid);
		SendClientMessage(playerid, COLOR_WHITE, "Recogiste tu "COL_YELLOW"parlante"COL_WHITE".");
	}
	else if(isequal(options, "parar", true))
	{
		new bbid = IsPlayerNearBoombox(playerid);
		if(bbid == -1) return ShowPlayerMessage(playerid, "~r~No estás cerca de un parlante.", 4);
		if(!BOOMBOX[bbid][bb_PUBLIC] && BOOMBOX[bbid][bb_OWNER] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~No puedes usar este parlante porque no es público.", 4);
		if(!BOOMBOX[bbid][bb_PLAYING]) return ShowPlayerMessage(playerid, "~r~Este parlante no está reproduciendo nada.", 4);

		BOOMBOX[bbid][bb_PLAYING] = false;
		for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
		{
			if(!IsPlayerConnected(i)) continue;
			if(GetPlayerInterior(i) == BOOMBOX[bbid][bb_INTERIOR] && GetPlayerVirtualWorld(i) == BOOMBOX[bbid][bb_WORLD] && IsPlayerInRangeOfPoint(i, 50.0, BOOMBOX[bbid][bb_POS][0], BOOMBOX[bbid][bb_POS][1], BOOMBOX[bbid][bb_POS][2]))
				StopAudioStreamForPlayer(i);
		}
	}
	else if(isequal(options, "opciones", true))
	{
		new bbid = IsPlayerNearBoombox(playerid);
		if(bbid == -1) return ShowPlayerMessage(playerid, "~r~No estás cerca de un parlante.", 4);
		if(BOOMBOX[bbid][bb_OWNER] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~Este parlante no es tuyo.", 4);
		PLAYER_TEMP[playerid][py_MUSIC_BOOMBOX] = bbid;
		ShowDialog(playerid, DIALOG_BOOMBOX_OPTIONS);
	}*/

	return 1;
}
alias:parlante("boombox")

CMD:destruirparlante(playerid, params[])
{
	new id;
	if(sscanf(params, "d", id)) return SendClientMessage(playerid, COLOR_YELLOW, "Syntax: "COL_WHITE"/destruirparlante (id)");
	if(!BOOMBOX[id][bb_VALID]) return SendClientMessage(playerid, COLOR_YELLOW, "La ID proporcionada no corresponde a un parlante válido.");

	DestroyBoombox(id);
	return 1;
}
flags:destruirparlante(CMD_MODERATOR2)
alias:destruirparlante("destruirboombox")