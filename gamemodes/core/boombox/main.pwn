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

/*
	====================================================================================================
                              AAA               PPPPPPPPPPPPPPPPP   IIIIIIIIII
                             A:::A              P::::::::::::::::P  I::::::::I
                            A:::::A             P::::::PPPPPP:::::P I::::::::I
                           A:::::::A            PP:::::P     P:::::PII::::::II
                          A:::::::::A             P::::P     P:::::P  I::::I  
                         A:::::A:::::A            P::::P     P:::::P  I::::I  
                        A:::::A A:::::A           P::::PPPPPP:::::P   I::::I  
                       A:::::A   A:::::A          P:::::::::::::PP    I::::I  
                      A:::::A     A:::::A         P::::PPPPPPPPP      I::::I  
                     A:::::AAAAAAAAA:::::A        P::::P              I::::I  
                    A:::::::::::::::::::::A       P::::P              I::::I  
                   A:::::AAAAAAAAAAAAA:::::A      P::::P              I::::I  
                  A:::::A             A:::::A   PP::::::PP          II::::::II
                 A:::::A               A:::::A  P::::::::P          I::::::::I
                A:::::A                 A:::::A P::::::::P          I::::::::I
               AAAAAAA                   AAAAAAAPPPPPPPPPP          IIIIIIIIII
	====================================================================================================                                                                
*/

CreateBoombox(playerid)
{
	new id = GetBoomboxFreeIndex();
	if(id == -1) return -1;

	BOOMBOX[id][bb_VALID] = true;
	GetPlayerPos(playerid, BOOMBOX[id][bb_POS][0], BOOMBOX[id][bb_POS][1], BOOMBOX[id][bb_POS][2]);
	BOOMBOX[id][bb_INTERIOR] = GetPlayerInterior(playerid);
	BOOMBOX[id][bb_WORLD] = GetPlayerVirtualWorld(playerid);
	BOOMBOX[id][bb_OBJECT] = CreateDynamicObject(2226, BOOMBOX[id][bb_POS][0], BOOMBOX[id][bb_POS][1], BOOMBOX[id][bb_POS][2], 0.0, 0.0, 0.0, .worldid = BOOMBOX[id][bb_WORLD], .interiorid = BOOMBOX[id][bb_INTERIOR]);
	BOOMBOX[id][bb_LABEL] = CreateDynamic3DTextLabel(sprintf(""COL_RED"Boombox de %s\n"COL_WHITE"Pública: "COL_RED"No", ACCOUNT_INFO[playerid][ac_NAME]), 0xFFFFFFFF, BOOMBOX[id][bb_POS][0], BOOMBOX[id][bb_POS][1], BOOMBOX[id][bb_POS][2] + 2.5, 5.0, .testlos = 1, .worldid = BOOMBOX[id][bb_WORLD], .interiorid = BOOMBOX[id][bb_INTERIOR]);
	BOOMBOX[id][bb_PUBLIC] =
	BOOMBOX[id][bb_PLAYING] = false;
	BOOMBOX[id][bb_OWNER] = ACCOUNT_INFO[playerid][ac_ID];

	return 1;
}

PlayAudioInBoombox(requester, id, const url[])
{
	if(!BOOMBOX[id][bb_VALID]) return 0;
	if(!BOOMBOX[id][bb_PUBLIC] && ACCOUNT_INFO[requester][ac_ID] != BOOMBOX[id][bb_OWNER]) return 0;

	BOOMBOX[id][bb_PLAYING] = true;
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if(!IsPlayerConnected(i)) continue;
		PlayAudioStreamForPlayer(i, url, BOOMBOX[id][bb_POS][0], BOOMBOX[id][bb_POS][1], BOOMBOX[id][bb_POS][2], 50.0, 1);
		ShowPlayerNotification(i, sprintf("Reproduciendo %s. Solicitaddo por %s", PLAYER_DIALOG_MP3_RESULT[requester][ PLAYER_TEMP[requester][py_RESULT_INDEX] ][result_NAME], ACCOUNT_INFO[requester][ac_NAME]), 5);
	}

	return 1;
}

UpdateBoombox(id, bool:ispublic)
{
	if(!BOOMBOX[id][bb_VALID]) return 0;
	BOOMBOX[id][bb_PUBLIC] = ispublic;
	if(ispublic) UpdateDynamic3DTextLabelText(BOOMBOX[id][bb_LABEL], 0xFFFFFFFF, sprintf(""COL_RED"Boombox de %s\n"COL_WHITE"Pública: "COL_RED"Sí", ACCOUNT_INFO[ GetBoomboxOwner(id) ][ac_NAME]));
	else UpdateDynamic3DTextLabelText(BOOMBOX[id][bb_LABEL], 0xFFFFFFFF, sprintf(""COL_RED"Boombox de %s\n"COL_WHITE"Pública: "COL_RED"No", ACCOUNT_INFO[ GetBoomboxOwner(id) ][ac_NAME]));
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

GetBoomboxFreeIndex()
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
}

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
		if(BOOMBOX[i][bb_OWNER] == ACCOUNT_INFO[playerid][ac_ID]) return true;
	}

	return false;
}

/*
	====================================================================================================
	                                                                                                                                                 
               MMMMMMMM               MMMMMMMM                    iiii                   
               M:::::::M             M:::::::M                   i::::i                  
               M::::::::M           M::::::::M                    iiii                   
               M:::::::::M         M:::::::::M                                           
               M::::::::::M       M::::::::::M  aaaaaaaaaaaaa   iiiiiiinnnn  nnnnnnnn    
               M:::::::::::M     M:::::::::::M  a::::::::::::a  i:::::in:::nn::::::::nn  
               M:::::::M::::M   M::::M:::::::M  aaaaaaaaa:::::a  i::::in::::::::::::::nn 
               M::::::M M::::M M::::M M::::::M           a::::a  i::::inn:::::::::::::::n
               M::::::M  M::::M::::M  M::::::M    aaaaaaa:::::a  i::::i  n:::::nnnn:::::n
               M::::::M   M:::::::M   M::::::M  aa::::::::::::a  i::::i  n::::n    n::::n
               M::::::M    M:::::M    M::::::M a::::aaaa::::::a  i::::i  n::::n    n::::n
               M::::::M     MMMMM     M::::::Ma::::a    a:::::a  i::::i  n::::n    n::::n
               M::::::M               M::::::Ma::::a    a:::::a i::::::i n::::n    n::::n
               M::::::M               M::::::Ma:::::aaaa::::::a i::::::i n::::n    n::::n
               M::::::M               M::::::M a::::::::::aa:::ai::::::i n::::n    n::::n
               MMMMMMMM               MMMMMMMM  aaaaaaaaaa  aaaaiiiiiiii nnnnnn    nnnnnn

	====================================================================================================
*/

CMD:parlante(playerid, params[])
{
	new options[12];
	if(sscanf(params, "s[12]", options)) return SendClientMessage(playerid, COLOR_WHITE, "USO: /parlante (colocar/reproducir/recoger/parar/opciones)");

	if(isequal(options, "colocar", true))
	{
		if(PlayerHasBoombox(playerid)) return ShowPlayerMessage(playerid, "~r~Ya tienes un parlante colocado.", 4);
		if(IsPlayerNearBoombox(playerid, 50.0) != -1) return ShowPlayerMessage(playerid, "~r~Ya hay un parlante cerca.", 4);
		if(CreateBoombox(playerid) != -1) 
		{
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 1000, true);
			SendClientMessage(playerid, COLOR_WHITE, "Colocaste tu "COL_RED"parlante "COL_WHITE"en el suelo.");
		} else SendClientMessage(playerid, COLOR_RED, "Hay muchos parlantes colocados en el mundo. Intenta más tarde.");
	}
	else if(isequal(options, "reproducir", true))
	{
		new bbid = IsPlayerNearBoombox(playerid);
		if(bbid == -1) return ShowPlayerMessage(playerid, "~r~No estás cerca de un parlante.", 4);
		if(!BOOMBOX[bbid][bb_PUBLIC] && BOOMBOX[bbid][bb_OWNER] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~No puedes usar este parlante porque no es público.", 4);
		if(BOOMBOX[bbid][bb_PLAYING]) return ShowPlayerMessage(playerid, "~r~Este parlante ya esta reproduciendo algo. Usa /parlante parar.", 4);
		
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
		SendClientMessage(playerid, COLOR_WHITE, "Recogiste tu "COL_RED"parlante"COL_WHITE".");
	}
	else if(isequal(options, "parar", true))
	{
		new bbid = IsPlayerNearBoombox(playerid);
		if(bbid == -1) return ShowPlayerMessage(playerid, "~r~No estás cerca de un parlante.", 4);
		if(!BOOMBOX[bbid][bb_PUBLIC] && BOOMBOX[bbid][bb_OWNER] != ACCOUNT_INFO[playerid][ac_ID]) return ShowPlayerMessage(playerid, "~r~No puedes usar este parlante porque no es público.", 4);
		if(!BOOMBOX[bbid][bb_PLAYING]) return ShowPlayerMessage(playerid, "~r~Este parlante no esta reproduciendo nada.", 4);

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
	}

	return 1;
}
alias:parlante("boombox")