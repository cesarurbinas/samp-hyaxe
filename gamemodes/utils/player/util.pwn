new NAME_WHITELIST[][24] =
{
	"Yahir_Kozel",
	"Atom_Palomita",
	"Pepe_Garcia",
	"Radric_Dresta",
	"Alex_Flores",
	"Travis Dalkowa",
	"Atom"
};

static const QUIT_KEYWORDS[][16] =
{
	"7q",
	"(q",
	"9/q",
	"(/q",
	"*/q",
	")q",
	"8q",
	"9q"
};

static const INVALID_WORDS[][] =
{
	"zoor",
	"zo0r",
	"samphub",
	"chanpu",
	"champu",
	"fenixzone",
	"pene",
	"vagina",
	"mierda",
	"goldenstate",
	"unplayer",
	"spell",
	"ecuazone",
	"pelotudo",
	"boludo",
	"omegazone",
	"starrp",
	"fabiking",
	"kreisel",
	"pingote",
	"kanox",
	"lexerzone",
	"puta",
	"sampdroid",
	"samp droid",
	"samp_droid",
	"puto",
	"put0",
	"chupas",
	"adobe",
	"chitero",
	"bots",
	".ga",
	"b0ts",
	".net",
	".xyz",
	".ml",
	".tk",
	"samptab",
	"heix",
	"aver no",
	"aber no",
	"- mong",
	"aver sido",
	"aber sido",
	"blade",
	"yarmak",
	"scythekill",
	"exterminio total",
	"BOTNET",
	"botnet",
	"betazone",
	"imgui",
	"adri1",
	"superroleplay",
	"sampvoice",
	"daniel mor",
	"github",
	"b0tnet",
	"botn3t",
	"b o t n e t",
	"botonet",
	"bot n3t",
	"b0t net",
	"b0t n3t",
	"pawncode",
	"pawnes",
	"hispawno",
	"world champion pawno scripta",
	"bigmommymilkers"
};

static const INVALID_NAMES[][100] =
{
	"Capija",
	"Mierda",
	"Caverga",
	"Melano",
	"Yahir_Kozel",
	"Apellido",
	"Sech",
	"Nombre",
	"Pija",
	"Conazo",
	"Misco_Jonnes",
	"Portuano",
	"Chorizo",
	"Turbado",
	"Nanero",
	"Pene",
	"Vagina",
	"Pompas",
	"Gaming",
	"Polainas",
	"Pingote",
	"Yarmak",
	"BetaZone",
	"Pearce",
	"Kanox",
	"Pingo",
	"Heix",
	"Avant",
	"Come_",
	"_Tela",
	"Morgan_Skulls",
	"Imgui",
	"ImGui",
	"Sampvoice",
	"Diablo",
	"Pito_Corto",
	"Empanada",
	"Hamburguesa",
	"Willyrex",
	"Telapone",
	"Tedoma",
	"Hambre",
	"Trabuco",
	"Mirry",
	"Mirri",
	"Verdesin",
	"Verdoso",
	"Verde",
	"Cheat",
	"Cheater",
	"Cheto",
	"Maricon",
	"Chitero",
	"Neptunia",
	"Pito",
	"Corto",
	"Fizio",
	"Peruano",
	"Boliviano",
	"Narizon",
	"Culon",
	"Gordo",
	"Teton",
	"Rubius",
	"Goku",
	"Vegeta",
	"Vegetta",
	"Puto",
	"Negro",
	"Fraca",
	"Heladero",
	"Panadero",
	"Whatsapp",
	"Facebook",
	"Instagram",
	"Lil_",
	"Gamer",
	"Chupador",
	"Play",
	"El_Vaginon",
	"El_",
	"Vaginon",
	"Elva_",
	"_Ginon",
	"Kreisel",
	"Ryan_West"
};

static const BAN_KEYWORDS[][100] =
{
	"fenixzone",
	"goldenstate",
	"golden state",
	"golden states",
	"unplayer",
	"z0ne",
	"zon3",
	"z0n3",
	"linox",
	"ZONE",
	"Z0NE",
	"LINOX",
	"z.o.n.e",
	"f.e.n.i.x",
	"samphub",
	"s4mp hub",
	"samp hub",
	"github",
	"b0tnet",
	"botn3t",
	"b o t n e t",
	"botonet",
	"bot n3t",
	"b0t net",
	"b0t n3t",
	"world champion pawno scripta",
	"sampvoice",
	"adobe",
	"ad0be",
	"ad0b3",
	"a.d.o.b.e",
	"b0ts",
	".net",
	".xyz",
	".ml",
	".tk",
	"bots",
	"omegazone",
	"ecuazone",
	"lexerzone",
	"sampdroid",
	"samp droid",
	"samp_droid",
	"B-O-T-S",
	"H-U-B",
	"b-o-t-s",
	"V0TS",
	"B0TS",
	"B-0-T-S",
	"VOTS",
	"V-O-T-S",
	"V-0-T-S",
	"B.O.T.S",
	"B.0.T.S",
	"V.O.T.S",
	"V.0.T.S",
	"B O T S",
	"B 0 T S",
	"V 0 T S",
	"V O T S",
	"H.U.B",
	"170.83.221.2",
	"BREÑAS",
	"cable color",
	"CABLE COLOR",
	"170.83.220.0/22",
	"doxbin",
	"wearelegal",
	"bit.ly",
	"dox",
	"server de mierda",
	"sampfive",
	"samp5",
	"sampfaiv",
	"samp five",
	"SAMPFIVE",
	"kreisel",
	"KREISEL",
	"SAMP FIVE"
};

new g_iPlayerLastUpdate[MAX_PLAYERS];

new const Float:NewUserPos[][] =
{
	{1090.567138, -1805.910156, 16.593750, 1.044739},
	{1098.168090, -1805.921508, 16.593750, 358.225128},
	{1109.456787, -1802.678344, 16.593750, 88.465942},
	{1109.102416, -1799.647583, 16.593750, 88.465942},
	{1108.857299, -1796.502441, 16.593750, 89.092605},
	{1108.432617, -1793.480102, 16.593750, 89.092605},
	{1108.954711, -1790.486816, 16.593750, 89.092605},
	{1108.645629, -1785.879882, 16.593750, 89.092559},
	{1109.832763, -1783.515502, 16.593750, 1.358403},
	{1097.333251, -1800.550903, 13.604625, 33.295372},
	{1096.499511, -1788.365478, 13.624750, 88.755897},
	{1084.961181, -1795.690673, 13.670027, 359.768463}
};

/*IsPlayerPaused(playerid)
{
	return (GetTickCount() - g_iPlayerLastUpdate[playerid] > 2000);
}*/

IsPlayerInWater(playerid)
{
	new lib[16], anims[32];
    GetAnimationName(GetPlayerAnimationIndex(playerid), lib, sizeof(lib), anims, sizeof(anims));
	if(!isnull(lib) && !strcmp(lib, "SWIM")) return 1;
    switch(GetPlayerAnimationIndex(playerid))
	{
	   case 1538..1542, 1544, 1250, 1062: return 1;
	   default: return 0;
	}
    return 0;
}

RandomFishName()
{
	new 
		name[32],
		index = minrand(0, 10);

	switch(index)
	{
		case 0: name = "un ~y~Salmón";
		case 1: name = "un ~y~Bacalao"; 
		case 2: name = "una ~y~Merluza"; 
		case 3: name = "un ~y~Rape";
		case 4: name = "una ~y~Anchoa"; 
		case 5: name = "una ~y~Sardina"; 
		case 6: name = "un ~y~Atún";
		case 7: name = "una ~y~Trucha"; 
		case 8: name = "un ~y~Besugo";
		case 9: name = "una ~y~Dorada"; 
		case 10: name = "una ~y~Caballa";
	}
	return name;
}

forward CheckFish(playerid);
public CheckFish(playerid)
{
	if(PLAYER_TEMP[playerid][py_FISHING])
	{
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][47]);
		PLAYER_TEMP[playerid][py_FISHING] = false;

		if(PLAYER_TEMP[playerid][py_FISHING_PROGRESS] > 50)
		{
			new str_text[128];

			PLAYER_MISC[playerid][MISC_FISH] ++;

			format(str_text, sizeof(str_text), "Bien hecho, has tomado %s~w~. Ahora~n~tienes ~r~%d~w~ peces.", RandomFishName(), PLAYER_MISC[playerid][MISC_FISH]);

			ApplyAnimation(playerid, "OTB", "WTCHRACE_WIN", 4.1, false, false, false, false, 0, true);
			ShowPlayerMessage(playerid, str_text, 4);
		}
		else
		{
			ApplyAnimation(playerid, "OTB", "WTCHRACE_LOSE", 4.1, false, false, false, false, 0, true);
			ShowPlayerMessage(playerid, "~r~Has fallado", 3);
		}

		TextDrawHideForPlayer(playerid, Textdraws[textdraw_PROGRESS_BG]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][0]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][1]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][2]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][3]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);
		PLAYER_TEMP[playerid][py_FISHING_PROGRESS] = 0;
		PLAYER_TEMP[playerid][py_FISH] = false;
	}
	return 1;
}

ManualUpdateFish(playerid)
{
	if(PLAYER_TEMP[playerid][py_FISH])
	{
		PLAYER_TEMP[playerid][py_FISHING_PROGRESS] += 10;

		new Float:size = (382.0 + PLAYER_TEMP[playerid][py_FISHING_PROGRESS]);

		if(size < 382.0 && size > 246.0)
		{
			PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4], size, 0.000000);
		}

		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);
	}
	return 1;
}

forward UpdateFishing(playerid);
public UpdateFishing(playerid)
{
	if(PLAYER_TEMP[playerid][py_FISHING])
	{
		PLAYER_TEMP[playerid][py_FISHING_PROGRESS] -= (PLAYER_TEMP[playerid][py_FISHING_PROGRESS] / 9);
		if(PLAYER_TEMP[playerid][py_FISHING_PROGRESS] < 0) PLAYER_TEMP[playerid][py_FISHING_PROGRESS] = 1;

		new Float:size = (382.0 - PLAYER_TEMP[playerid][py_FISHING_PROGRESS]);

		if(size < 382.0 && size > 246.0)
		{
			PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4], size, 0.000000);
		}

		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);
	}
	return 1;
}

forward StartFishing(playerid);
public StartFishing(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][47]);

	new colors[] = {0xe73939FF, 0x6ed854FF, 0xe3e145FF, 0x20aee7FF};
	new color = minrand(0, sizeof(colors));

	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][2], TextToSpanish("Pulsa ESPACIO rápidamente"));
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][2]);

	PlayerTextDrawBoxColor(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][3], AdjustDarkness(colors[color], 1.75));
	PlayerTextDrawBoxColor(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4], colors[color]);
	PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4], 382.000000, 0.000000);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][3]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);

	ApplyAnimation(playerid, "SWORD", "SWORD_IDLE", 4.1, true, false, false, false, 0, true);

	PLAYER_TEMP[playerid][py_TIMERS][47] = SetTimerEx("UpdateFishing", 100, true, "i", playerid);
	SetTimerEx("CheckFish", 10000, false, "i", playerid);
	PLAYER_TEMP[playerid][py_FISH] = true;
	return 1;
}


SetFirstPerson(playerid, bool:toggle, bool:tele = false)
{
	if (toggle)
	{
		if (IsValidObject(PLAYER_TEMP[playerid][py_FP_OBJ])) DestroyObject(PLAYER_TEMP[playerid][py_FP_OBJ]);

		PLAYER_TEMP[playerid][py_FP_OBJ] = CreateObject(19300, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

		if (tele == true) AttachObjectToPlayer(PLAYER_TEMP[playerid][py_FP_OBJ], playerid, 0.0, 0.100, 0.3, 0.0, 0.0, 0.0);
		else AttachObjectToPlayer(PLAYER_TEMP[playerid][py_FP_OBJ], playerid, 0.0, 0.35, 0.5, 0.0, 0.0, 0.0);

		AttachCameraToObject(playerid, PLAYER_TEMP[playerid][py_FP_OBJ]);
	}
	else
	{
		DestroyObject(PLAYER_TEMP[playerid][py_FP_OBJ]);
		SetCameraBehindPlayer(playerid);
	}
	return 1;
}

SetFirstPersonPos(playerid, Float:x, Float:y, Float:z)
{
	if (IsValidObject(PLAYER_TEMP[playerid][py_FP_OBJ])) DestroyObject(PLAYER_TEMP[playerid][py_FP_OBJ]);

	PLAYER_TEMP[playerid][py_FP_OBJ] = CreateObject(19300, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
	AttachObjectToPlayer(PLAYER_TEMP[playerid][py_FP_OBJ], playerid, x, y, z, 0.0, 0.0, 0.0);
	AttachCameraToObject(playerid, PLAYER_TEMP[playerid][py_FP_OBJ]);
	return 1;
}

/*bool:IsPlayerMoving(playerid)
{
    switch(GetPlayerAnimationIndex(playerid))
    {
        case 463 .. 470, 1222 .. 1236, 1256 .. 1273, 1276 .. 1287: return true;
    }

    return false;
}*/

PreloadAnims(playerid)
{
    PreloadAnimLib(playerid, "DANCING");
    PreloadAnimLib(playerid, "HEIST9");
    PreloadAnimLib(playerid, "BOMBER");
    PreloadAnimLib(playerid, "RAPPING");
    PreloadAnimLib(playerid, "SHOP");
    PreloadAnimLib(playerid, "BEACH");
    PreloadAnimLib(playerid, "SMOKING");
    PreloadAnimLib(playerid, "FOOD");
    PreloadAnimLib(playerid, "ON_LOOKERS");
    PreloadAnimLib(playerid, "DEALER");
    PreloadAnimLib(playerid, "CRACK");
    PreloadAnimLib(playerid, "CARRY");
    PreloadAnimLib(playerid, "COP_AMBIENT");
    PreloadAnimLib(playerid, "PARK");
    PreloadAnimLib(playerid, "INT_HOUSE");
    PreloadAnimLib(playerid, "FOOD" );
    PreloadAnimLib(playerid, "ped" );
    PreloadAnimLib(playerid, "MISC" );
    PreloadAnimLib(playerid, "POLICE" );
    PreloadAnimLib(playerid, "GRAVEYARD" );
    PreloadAnimLib(playerid, "WUZI" );
    PreloadAnimLib(playerid, "SUNBATHE" );
    PreloadAnimLib(playerid, "PLAYIDLES" );
    PreloadAnimLib(playerid, "CAMERA" );
    PreloadAnimLib(playerid, "RIOT" );
    PreloadAnimLib(playerid, "DAM_JUMP" );
    PreloadAnimLib(playerid, "JST_BUISNESS" );
    PreloadAnimLib(playerid, "KISSING" );
    PreloadAnimLib(playerid, "GANGS" );
    PreloadAnimLib(playerid, "GHANDS" );
    PreloadAnimLib(playerid, "BLOWJOBZ" );
    PreloadAnimLib(playerid, "SWEET" );
}

PreloadAnimLib(playerid, const animlib[])
{
	ApplyAnimation(playerid, animlib, "null", 0.0, 0, 0, 0, 0, 0);
}

CheckProxy(playerid)
{
	if (!strcmp(PLAYER_TEMP[playerid][py_IP], "127.0.0.1")) return 0;

	for(new i = 0; i < sizeof(NAME_WHITELIST); i ++)
    {
        if (!strcmp(PLAYER_TEMP[playerid][py_NAME], NAME_WHITELIST[i], true)) return 0;
    }

	new str_text[128];
	format(str_text, sizeof(str_text), "51.161.31.157:9991/proxycheck/%s,%s", PLAYER_TEMP[playerid][py_IP], PLAYER_TEMP[playerid][py_NAME]);
	HTTP(playerid, HTTP_GET, str_text, "", "OnPlayerProxyFound");
	return 1;
}

forward OnPlayerProxyFound(index, response_code, data[]);
public OnPlayerProxyFound(index, response_code, data[])
{
	if (response_code == 200)
	{
		if (data[0] == 'Y')
		{
			new str_text[144];
			format(str_text, sizeof(str_text), "[ANTI-CHEAT] Kick sobre %s (%d): Proxy/VPN", PLAYER_TEMP[index][py_NAME], index);
	    	SendMessageToAdmins(COLOR_ANTICHEAT, str_text);
	    	SendDiscordWebhook(str_text, 1);

	    	SendClientMessageEx(index, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado por usar Proxy/VPN");
	    	KickEx(index, 500);
		}

		if (data[0] == 'B')
		{
			ShowPlayerDialog(index, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"País bloqueado", ""COL_WHITE"Su país esta bloqueado, para verificar su cuenta\n\
				ingrese a https://www.hyaxe.com/samp", "Cerrar", "");
			KickEx(index, 500);
		}
	}
	return 1;
}

Float:CameraLookToAngle(playerid)
{
	new Float:x, Float:y, Float:z;
	GetPlayerCameraFrontVector(playerid, x, y, z);
	return atan2(y, x) + 270.0;
}

IsFakeClient(playerid)
{  
	if (IsPlayerNPC(playerid)) return 0;
	new TempId[80], TempNumb;  
	gpci(playerid, TempId, sizeof(TempId));  
	for(new i = 0; i < strlen(TempId); i++)  
	{  
		if(TempId[i] >= '0' && TempId[i] <= '9')  TempNumb++;  
	}  
	return (TempNumb >= 30 || strlen(TempId) <= 30) ? true : false;
}

GetDatabaseUserName(db_id)
{
	new
		DBResult:Result,
		DB_Query[128],
		name[25]
	;

	format(DB_Query, sizeof(DB_Query), "SELECT `NAME` FROM `CUENTA` WHERE `ID` = %d LIMIT 1;", db_id);
	Result = db_query(Database, DB_Query);
	if (db_num_rows(Result))
		db_get_field_assoc(Result, "NAME", name);

	db_free_result(Result);
	return name;
}

SendEmail(const email[], const title[], const content[])
{
	new payload[1024];
	format(payload, sizeof(payload), "{\"email\": \"%s\", \"title\": \"%s\", \"content\": \"%s\"}", email, title, content);
	HTTP(0, HTTP_POST, "51.161.31.157:9991/send_email", payload, "response_SendEmail");
	return 1;
}

forward response_SendEmail(index, response_code, const data[]);
public response_SendEmail(index, response_code, const data[])
{
	//printf("[EMAIL_DEBUG] Data: %s", data);
	return 1;
}

PlayerIsInMafia(playerid)
{
	if (PLAYER_WORKS[playerid][WORK_MAFIA]) return true;
	if (PLAYER_WORKS[playerid][WORK_ENEMY_MAFIA]) return true;
	if (PLAYER_WORKS[playerid][WORK_OSBORN]) return true;
	if (PLAYER_WORKS[playerid][WORK_CONNOR]) return true;
	if (PLAYER_WORKS[playerid][WORK_DIVISO]) return true;
	return false;
}

GetPlayerMafia(playerid)
{
	if (PLAYER_WORKS[playerid][WORK_MAFIA]) return WORK_MAFIA;
	if (PLAYER_WORKS[playerid][WORK_ENEMY_MAFIA]) return WORK_ENEMY_MAFIA;
	if (PLAYER_WORKS[playerid][WORK_OSBORN]) return WORK_OSBORN;
	if (PLAYER_WORKS[playerid][WORK_CONNOR]) return WORK_CONNOR;
	if (PLAYER_WORKS[playerid][WORK_DIVISO]) return WORK_DIVISO;
	return -1;
}

GetMafiaColor(mafia)
{
	new color = 0xFFFFFFFF;
	switch(mafia)
	{
		case WORK_MAFIA: color = 0xa912e2FF;
		case WORK_ENEMY_MAFIA: color = 0xf5e30aFF;
		case WORK_OSBORN: color = 0x3a3eabFF;
		case WORK_CONNOR: color = 0xFFFFFFFF;
		case WORK_DIVISO: color = 0xa9ee70FF;
	}
	return color;
}

stock RandomCordFromPoint(range, negative, &Float:x, &Float:y)
{
	x = ( x + ( random( range ) - negative ) );
	y = ( y + ( random( range ) - negative ) );
	return 1;
}

ValidSurfingVehicle(modelid)
{
	switch(modelid)
	{
		case 403: return false;
		case 406: return false;
		case 422: return false;
		case 430: return false;
		case 433: return false;
		case 441: return false;
		case 443: return false;
		case 444: return false;
		case 446: return false;
		case 449: return false;
		case 452..455: return false;
		case 464: return false;
		case 472: return false;
		case 473: return false;
		case 478: return false;
		case 484: return false;
		case 493: return false;
		case 500: return false;
		case 514: return false;
		case 515: return false;
		case 519: return false;
		case 543: return false;
		case 554: return false;
		case 556: return false;
		case 557: return false;
		case 564: return false;
		case 578: return false;
		case 595: return false;
		case 600: return false;
		case 605: return false;
	}
	return true;
}

enum {
	STATUS_TRUSTED,
	STATUS_MEDIUM,
	STATUS_WASTED
}

GetAccountStatusValue(playerid)
{
	new value;
	if (PLAYER_MISC[playerid][MISC_MUTES] >= 2) value ++;
	if (PLAYER_MISC[playerid][MISC_MUTES] >= 4) value ++;
	
	if (PLAYER_MISC[playerid][MISC_KICKS] >= 1) value ++;
	if (PLAYER_MISC[playerid][MISC_KICKS] >= 3) value ++;
	
	if (PLAYER_MISC[playerid][MISC_BANS] >= 1) value ++;
	if (PLAYER_MISC[playerid][MISC_BANS] >= 3) value += 5;
	
	if (PLAYER_MISC[playerid][MISC_JAILS] >= 3) value ++;
	if (PLAYER_MISC[playerid][MISC_JAILS] >= 5) value += 5;

	if (PLAYER_MISC[playerid][MISC_SANS] >= 3) value ++;
	if (PLAYER_MISC[playerid][MISC_SANS] >= 10) value += 5;
	
	//SendClientMessageEx(playerid, -1, "%d", value);
	return value;
}

/*GetAccountStatus(playerid)
{
	new status = GetAccountStatusValue(playerid);

	if (value < 3)
		return STATUS_TRUSTED;

	if (value >= 3)
		return STATUS_MEDIUM;

	if (value >= 5)
		return STATUS_WASTED;
	
	return 0;
}*/

GetAccountStatusName(playerid)
{
	new 
		name[64],
		value = GetAccountStatusValue(playerid)
	;

	if (value < 3)
		format(name, sizeof(name), ""COL_GREEN"Confiable"COL_WHITE"");

	if (value >= 3)
		format(name, sizeof(name), ""COL_YELLOW"Medio"COL_WHITE"");

	if (value >= 5)
		format(name, sizeof(name), ""COL_RED"Desconfiable"COL_WHITE"");
	
	return name;
}

// 2D Projection position based on distance and angle
stock GetXYFromAngle(&Float:x, &Float:y, Float:a, Float:distance) {
	x += (distance*floatsin(-a,degrees));
	y += (distance*floatcos(-a,degrees));
}

// 3D Projection position based on distance and angles
stock GetXYZFromAngle(&Float:x, &Float:y, &Float:z, Float:angle, Float:elevation, Float:distance) {
	x += distance * floatsin(angle, degrees) * floatcos(elevation, degrees);
	y += distance * floatcos(angle, degrees) * floatcos(elevation, degrees);
	z += distance * floatsin(elevation, degrees);
}

// Convert 3D velocity vectors to a single velocity unit (close to Km/h in SA:MP)
stock Float:CalculateVelocity(Float:x, Float:y, Float:z) {
	return floatsqroot((x * x) + (y * y) + (z * z)) * 150.0;
}

// Checks if one angle is within range of another angle
stock AngleInRangeOfAngle(Float:a1, Float:a2, Float:range) {
	a1 -= a2;
	return (a1 < range) && (a1 > -range);

}

// Vehicles
GetVehicleType(modelid)
{
	switch(modelid)
	{
		// Helicopteros
		case 548, 425, 417, 487, 488, 497, 563, 447, 469: return 0;
		// Aviones
		case 592, 577, 511, 512, 593, 520, 553, 476, 519, 460, 513: return 1;
		// Barcos
		case 472, 473, 493, 595, 484, 430, 453, 452, 446, 454: return 2;
	}
	return 3;
}

stock Float:frand(Float:min, Float:max)
{
    return float(random(floatround(min) - floatround(max))) + min + float(random(1000)) / 1000.0;
}

stock Float:float_random(Float:max) 
{ 
	return floatdiv(float(random(0)), floatdiv(float(cellmax), max)); 
}

stock Float:mathfrandom(Float:min, Float:max) 
{ 
	return floatadd(float_random(floatsub(max, min)), min); 
}

stock GiveGoldIngot(playerid, ammount = 1)
{
	PLAYER_MISC[playerid][MISC_GOLD_INGOT] += ammount;
	SavePlayerMisc(playerid);
	return 1;
}

/*IsPlayerInVehicle(playerid)
{
	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER || GetPlayerState(playerid) == PLAYER_STATE_PASSENGER) return true;
	return false;
}*/

TazerPlayer(playerid)
{
	SetPlayerChatBubble(playerid, "\n\n\n\n* Cae al piso al recibir el choque eléctrico de un tazer.\n\n\n", 0xffcb90FF, 20.0, 5000);
	FreezePlayer(playerid, 30000);
	ApplyAnimation(playerid, "PED", "BIKE_fallR", 4.0, 0, 1, 1, 1, 0);
	ShowPlayerMessage(playerid, "~y~Te dieron una descarga eléctrica con un Tazer.", 3);
	return 1;
}

SetPlayerNormalColor(playerid)
{
	SetPlayerColorEx(playerid, PLAYER_COLOR);
	return 1;
}

FreezePlayer(playerid, ms = 2000)
{
	TogglePlayerControllableEx(playerid, false);
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][3]);
	PLAYER_TEMP[playerid][py_TIMERS][3] = SetTimerEx("TogglePlayerControl", ms, false, "ib", playerid, true);
	return 1;
}

IsPlayerInSafeZone(playerid)
{
	for(new i = 0; i != sizeof SAFE_ZONES; i ++)
	{
		if (IsPlayerInDynamicArea(playerid, SAFE_ZONES[i][safe_zone_AREA_ID]))
		{
			return true;
		}
	}
	return false;
}

SetPlayerVip(playerid, vip_level, price_coin = 0, days = 30)
{
	if (vip_level < 1) return 0;

	ACCOUNT_INFO[playerid][ac_SD] -= price_coin;
	ACCOUNT_INFO[playerid][ac_SU] = vip_level;

	new DB_Query[128], DBResult:Result;
	format(DB_Query, sizeof DB_Query, "UPDATE `CUENTA` SET `SD` = '%d', `SU` = '%d', `SU_EXPIRE_DATE` = DATETIME('NOW', '+%d day') WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_SU], days, ACCOUNT_INFO[playerid][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	format(DB_Query, sizeof DB_Query, "SELECT `SU_EXPIRE_DATE` FROM `CUENTA` WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);
	if (db_num_rows(Result)) db_get_field(Result, 0, ACCOUNT_INFO[playerid][ac_SU_EXPIRE_DATE], 24);
	db_free_result(Result);

	SendClientMessageEx(playerid, COLOR_RED, "VIP %d:"COL_WHITE" %d días, fecha de caducidad: %s.", ACCOUNT_INFO[playerid][ac_SU], days, ACCOUNT_INFO[playerid][ac_SU_EXPIRE_DATE]);
	ShowPlayerNotification(playerid, "Ahora tienes VIP, felicidades.", 3);
	ShowPlayerMessage(playerid, "Puedes utilizar ~p~/vip ~w~para ver el tiempo restante o renovar.", 5);

	UnlockPlayerVehicles(playerid);
	if (GetPlayerSkin(playerid) == CHARACTER_INFO[playerid][ch_SKIN]) SetPlayerToys(playerid);
	return 1;
}

PlayerPlaySoundEx(playerid, sound, Float:X, Float:Y, Float:Z)
{
	if (PLAYER_MISC[playerid][MISC_CONFIG_SOUNDS]) PlayerPlaySound(playerid, sound, X, Y, Z);
	return 1;
}

TogglePlayerControllableEx(playerid, bool:controllable)
{
	PLAYER_TEMP[playerid][py_CONTROL] = controllable;
	return TogglePlayerControllable(playerid, controllable);
}

ShowPlayerKeyMessage(playerid, const key[])
{
	new str_text[64];
	format(str_text, sizeof(str_text), "Pulsa %s", key);

	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_KEY], str_text);
	PlayerTextDrawBoxColor(playerid, PlayerTextdraws[playerid][ptextdraw_KEY], 0x000000DD);
	PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_KEY], 0x000000DD);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_KEY]);
	return 1;
}

ShowPlayerNotification(playerid, const message[], time = 1, bool:auto_jump = true)
{
	#pragma unused time

	new str_text[264];
	format(str_text, sizeof(str_text), "~w~%s", TextToSpanish(message));
	Notification_Show(playerid, str_text, auto_jump);
	return 1;
}

forward HidePlayerNotification(playerid);
public HidePlayerNotification(playerid)
{
	#if DEBUG_MODE == 1
		printf("HidePlayerNotification"); // debug juju
	#endif

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][45]);
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_NOTIFICATION_MESSAGE], "_");
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_NOTIFICATION_MESSAGE]);
	return 1;
}

forward ContinuePlayerIntro(playerid, step);
public ContinuePlayerIntro(playerid, step)
{
	#if DEBUG_MODE == 1
		printf("ContinuePlayerIntro"); // debug juju
	#endif

	switch(step)
	{
		case 0:
		{
			ClearPlayerChatBox(playerid);

            CHARACTER_INFO[playerid][ch_CASH] = 10000;
			new index_pos = minrand(0, sizeof(NewUserPos));
			CHARACTER_INFO[playerid][ch_POS][0] = NewUserPos[index_pos][0];
			CHARACTER_INFO[playerid][ch_POS][1] = NewUserPos[index_pos][1];
			CHARACTER_INFO[playerid][ch_POS][2] = NewUserPos[index_pos][2];
			CHARACTER_INFO[playerid][ch_ANGLE] = NewUserPos[index_pos][3];
			CHARACTER_INFO[playerid][ch_FIGHT_STYLE] = 4;
			CHARACTER_INFO[playerid][ch_HEALTH] = 100.0;
			CHARACTER_INFO[playerid][ch_ARMOUR] = 0.0;
			CHARACTER_INFO[playerid][ch_HUNGRY] = 90.0;
			CHARACTER_INFO[playerid][ch_THIRST] = 95.0;
			PLAYER_MISC[playerid][MISC_CONFIG_SOUNDS] = true;
			PLAYER_MISC[playerid][MISC_CONFIG_AUDIO] = true;
			PLAYER_MISC[playerid][MISC_CONFIG_HUD] = true;
			PLAYER_MISC[playerid][MISC_CONFIG_LOWPC] = false;
			PLAYER_MISC[playerid][MISC_CONFIG_FP] = false;
			PLAYER_MISC[playerid][MISC_CONFIG_ADMIN] = false;

			SetPlayerScore(playerid, ACCOUNT_INFO[playerid][ac_LEVEL]);
			PLAYER_TEMP[playerid][py_DOUBT_CHANNEL_TIME] = gettime();
			ResetPlayerWeapons(playerid);
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, CHARACTER_INFO[playerid][ch_CASH]);
			SetPlayerFightingStyle(playerid, CHARACTER_INFO[playerid][ch_FIGHT_STYLE]);
			SetPlayerHealthEx(playerid, CHARACTER_INFO[playerid][ch_HEALTH]);
			SetPlayerArmourEx(playerid, CHARACTER_INFO[playerid][ch_ARMOUR]);
			SetPlayerVirtualWorld(playerid, 0);
			SetSpawnInfo(playerid, DEFAULT_TEAM, CHARACTER_INFO[playerid][ch_SKIN], CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], 0, 0, 0, 0, 0, 0);
			SetPlayerInterior(playerid, CHARACTER_INFO[playerid][ch_INTERIOR]);
			PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];

			RegisterNewPlayer(playerid);
			PLAYER_TEMP[playerid][py_NEW_USER] = true;
			TogglePlayerSpectatingEx(playerid, false);

			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
			PLAYER_TEMP[playerid][py_TIMERS][18] = SetTimerEx("ContinuePlayerIntro", 500, false, "id", playerid, 1);
		}
		case 1:
		{
			SavePlayerNotification(playerid, "Bienvenido a Hyaxe Roleplay");

			StopAudioStreamForPlayer(playerid);
			PLAYER_MISC[playerid][MISC_CONFIG_HUD] = true;
			PLAYER_MISC[playerid][MISC_CONFIG_LOWPC] = false;
			PLAYER_MISC[playerid][MISC_CONFIG_ADMIN] = false;
			SetPlayerHud(playerid);
			PLAYER_TEMP[playerid][py_NEW_USER] = false;
			PLAYER_TEMP[playerid][py_TUTORIAL] = true;
			PLAYER_TEMP[playerid][py_TUTORIAL_STEP] = 1;
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);

			TogglePlayerControllableEx(playerid, true);
			ShowPlayerNotification(playerid, "Bienvenido a Hyaxe Roleplay, versión experimental.", 12);
			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);

			SetPlayerPosEx(playerid, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], 0, 0);
			PLAYER_TEMP[playerid][py_TIMERS][18] = SetTimerEx("ContinuePlayerIntro", 2000, false, "id", playerid, 2);
		}
		case 2:
		{
			StopAudioStreamForPlayer(playerid);

			if (PLAYER_TEMP[playerid][py_TUTORIAL_STEP] == 1) PlayAudioStreamForPlayer(playerid, "http://tmp6.hyaxe.com:20100/tutorial_1.mp3");
			PLAYER_TEMP[playerid][py_TUTORIAL_STEP] = 2;

			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
		}
		case 3:
		{
			StopAudioStreamForPlayer(playerid);
			
			if (PLAYER_TEMP[playerid][py_TUTORIAL_STEP] == 6) PlayAudioStreamForPlayer(playerid, "http://tmp6.hyaxe.com:20100/tutorial_6.mp3");
			PLAYER_TEMP[playerid][py_TUTORIAL_STEP] = 7;

			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
			PLAYER_TEMP[playerid][py_TIMERS][18] = SetTimerEx("ContinuePlayerIntro", 51000, false, "id", playerid, 4);
		}
		case 4:
		{
			StopAudioStreamForPlayer(playerid);
			if (PLAYER_TEMP[playerid][py_TUTORIAL_STEP] == 7) PlayAudioStreamForPlayer(playerid, "http://tmp6.hyaxe.com:20100/tutorial_7.mp3");
			PLAYER_TEMP[playerid][py_TUTORIAL] = false;

			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
		}
		case 5:
		{
			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
			StopAudioStreamForPlayer(playerid);

			if (PLAYER_TEMP[playerid][py_TUTORIAL_STEP] == 4) PlayAudioStreamForPlayer(playerid, "http://tmp6.hyaxe.com:20100/tutorial_4.mp3");
			PLAYER_TEMP[playerid][py_TUTORIAL_STEP] = 5;
		}

	}
	return 1;
}

forward CarJackingFinish(playerid);
public CarJackingFinish(playerid)
{
	#if DEBUG_MODE == 1
		printf("CarJackingFinish"); // debug juju
	#endif

	TogglePlayerControllableEx(playerid, true);
	return 1;
}

GetPlayerCameraLookAt(playerid, &Float:X, &Float:Y, &Float:Z)
{
    new Float:pos[6];
    GetPlayerCameraPos(playerid, pos[0], pos[1], pos[2]);
    GetPlayerCameraFrontVector(playerid, pos[3], pos[4], pos[5]);
    X = floatadd(pos[0], pos[3]);
    Y = floatadd(pos[1], pos[4]);
    Z = floatadd(pos[2], pos[5]);
    return 1;
}

CheckPlayerSuperUser(playerid)
{
	new DBResult:Result, DB_Query[144], bool:expired;
	format(DB_Query, sizeof DB_Query, "SELECT `ID` FROM `CUENTA` WHERE `ID` = '%d' AND DATETIME('NOW') >= `SU_EXPIRE_DATE`;", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		expired = true;
		format(DB_Query, sizeof DB_Query, "UPDATE `CUENTA` SET `SU` = 0, `SU_EXPIRE_DATE` = '0' WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
		db_free_result(db_query(Database, DB_Query));
	}
	db_free_result(Result);

	if (expired)
	{
		ACCOUNT_INFO[playerid][ac_SU] = false;
		ACCOUNT_INFO[playerid][ac_SU_EXPIRE_DATE][0] = EOS;
		ShowPlayerMessage(playerid, "~r~VIP EXPIRADO", 4);
		ShowPlayerNotification(playerid, "~r~VIP EXPIRADO~w~~n~Tu VIP ha expirado, usa /vip si quieres comprar de nuevo.", 4);
		if (GetPlayerSkin(playerid) == CHARACTER_INFO[playerid][ch_SKIN]) SetPlayerToys(playerid);
		ReLockPlayerVehicles(playerid, true);
	}

	PLAYER_TEMP[playerid][py_LAST_SU_CHECK] = gettime();
	return 1;
}

UnlockPlayerVehicles(playerid)
{
	new total;
	for(new i = 0; i != MAX_VEHICLES; i ++)
	{
		if (!GLOBAL_VEHICLES[i][gb_vehicle_VALID]) continue;
		if (!PLAYER_VEHICLES[i][player_vehicle_VALID]) continue;

		if (PLAYER_VEHICLES[i][player_vehicle_ID] == ACCOUNT_INFO[playerid][ac_ID])
		{
			if (total >= MAX_SU_VEHICLES) break;

			PLAYER_VEHICLES[i][player_vehicle_ACCESSIBLE] = true;
		}
	}
	return total;
}

ReLockPlayerVehicles(playerid, bool:remove = false)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;
	if (ACCOUNT_INFO[playerid][ac_SU]) return 0;

	new DBResult:Result, DB_Query[128];
	format(DB_Query, sizeof(DB_Query), "SELECT `ID` FROM `PLAYER_VEHICLES` WHERE `ID_USER` = '%d' ORDER BY `ID` DESC LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], MAX_SU_VEHICLES);
	Result = db_query(Database, DB_Query);

	new total_vehicles, veh_did;
	for(new i; i < db_num_rows(Result); i++ )
	{
		if (total_vehicles >= MAX_SU_VEHICLES)
		{
			printf("[debug]  MAX_SU_VEHICLES superado al cargar de base de datos.");
			break;
		}

		veh_did = db_get_field_int(Result, 0);
		new vehicle_id = GetPlayerVehicleIdFromDbId(veh_did);
		if (vehicle_id != INVALID_VEHICLE_ID)
		{
			PLAYER_VEHICLES[vehicle_id][player_vehicle_ACCESSIBLE] = true;
			if (total_vehicles >= MAX_NU_VEHICLES)
			{
				if (remove)
				{
					if (GLOBAL_VEHICLES[vehicle_id][gb_vehicle_OCCUPIED])
					{
						SetVehicleVelocity(vehicle_id, 0.0, 0.0, 0.0);
						if (GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DRIVER] != INVALID_PLAYER_ID) RemovePlayerFromVehicle(playerid);
					}
				}
				GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PARAMS_ENGINE] = 0;
				GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PARAMS_LIGHTS] = 0;
				GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PARAMS_DOORS] = 1;
				PLAYER_VEHICLES[vehicle_id][player_vehicle_ACCESSIBLE] = false;
				UpdateVehicleParams(vehicle_id);
			}
		}

		total_vehicles ++;
		db_next_row(Result);
	}

	db_free_result(Result);
	return 1;
}

SetPlayerColorEx(playerid, color)
{
	PLAYER_TEMP[playerid][py_PLAYER_COLOR] = color;
	return SetPlayerColor(playerid, color);
}

InviteToSAPD(playerid, to_player)
{
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (to_player == playerid) return 1;

	new Float:x, Float:y, Float:z; GetPlayerPos(to_player, x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~Esta persona no está cerca tuya.", 3);
	if (PLAYER_CREW[to_player][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~Esta persona tiene banda.", 3);
	if (PLAYER_WORKS[to_player][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~Este usuario ya es policía.", 3);
	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes reclutar a esta persona por ahora.", 3);

	new player_jobs = CountPlayerJobs(to_player);
	if (ACCOUNT_INFO[to_player][ac_SU])
	{
		if (player_jobs >= MAX_SU_WORKS)
		{
		    ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}
	else
	{
		if (player_jobs >= MAX_NU_WORKS)
		{
			ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}

	if (PLAYER_TEMP[to_player][py_WORKING_IN]) return ShowPlayerMessage(playerid, "~r~Esta persona no puede unirse porque esta de servicio en su trabajo.", 3);

	PLAYER_WORKS[to_player][WORK_POLICE] = true;
	PLAYER_SKILLS[to_player][WORK_POLICE] = 1;
	SavePlayerWorks(to_player);
	SavePlayerSkills(to_player);

	new DBResult:Result_pnumber, phone_number;
	Result_pnumber = db_query(Database, "SELECT ABS(RANDOM() % 10000000) AS `NUM` WHERE `NUM` NOT IN (SELECT `EXTRA` FROM `PLAYER_MISC` WHERE `ID` = '14') LIMIT 1;");
	if (db_num_rows(Result_pnumber)) phone_number = db_get_field_int(Result_pnumber, 0);
	db_free_result(Result_pnumber);
	PLAYER_MISC[to_player][MISC_PLACA_PD] = phone_number;
	SavePlayerMisc(to_player);

	SendClientMessageEx(playerid, COLOR_WHITE, "%s ahora es policía.", PLAYER_TEMP[to_player][py_RP_NAME]);
	ShowPlayerMessage(to_player, "~y~Ahora eres policía.", 3);
	return 1;
}

InviteToLCN(playerid, to_player)
{
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (to_player == playerid) return 1;

	new Float:x, Float:y, Float:z; GetPlayerPos(to_player, x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~Esta persona no está cerca tuya.", 3);
	if (PLAYER_CREW[to_player][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~Esta persona tiene banda.", 3);
	if (PlayerIsInMafia(to_player)) return ShowPlayerMessage(playerid, "~r~Este usuario ya es mafioso.", 3);
	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes reclutar a esta persona por ahora.", 3);

	new player_jobs = CountPlayerJobs(to_player);
	if (ACCOUNT_INFO[to_player][ac_SU])
	{
		if (player_jobs >= MAX_SU_WORKS)
		{
		    ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}
	else
	{
		if (player_jobs >= MAX_NU_WORKS)
		{
			ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}

	if (PLAYER_TEMP[to_player][py_WORKING_IN]) return ShowPlayerMessage(playerid, "~r~Esta persona no puede unirse porque esta de servicio en su trabajo.", 3);

	PLAYER_WORKS[to_player][WORK_MAFIA] = true;
	PLAYER_SKILLS[to_player][WORK_MAFIA] = 1;
	SavePlayerWorks(to_player);
	SavePlayerSkills(to_player);

	SendClientMessageEx(playerid, 0xa912e2FF, "[FSB] "COL_WHITE" %s ahora es de la mafia.", PLAYER_TEMP[to_player][py_RP_NAME]);
	ShowPlayerMessage(to_player, "~y~Ahora eres mafioso.", 3);
	return 1;
}

InviteToTCC(playerid, to_player)
{
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (to_player == playerid) return 1;

	new Float:x, Float:y, Float:z; GetPlayerPos(to_player, x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~Esta persona no está cerca tuya.", 3);
	if (PLAYER_CREW[to_player][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~Esta persona tiene banda.", 3);
	if (PlayerIsInMafia(to_player)) return ShowPlayerMessage(playerid, "~r~Este usuario ya es mafioso.", 3);
	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes reclutar a esta persona por ahora.", 3);

	new player_jobs = CountPlayerJobs(to_player);
	if (ACCOUNT_INFO[to_player][ac_SU])
	{
		if (player_jobs >= MAX_SU_WORKS)
		{
		    ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}
	else
	{
		if (player_jobs >= MAX_NU_WORKS)
		{
			ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}

	if (PLAYER_TEMP[to_player][py_WORKING_IN]) return ShowPlayerMessage(playerid, "~r~Esta persona no puede unirse porque esta de servicio en su trabajo.", 3);

	PLAYER_WORKS[to_player][WORK_ENEMY_MAFIA] = true;
	PLAYER_SKILLS[to_player][WORK_ENEMY_MAFIA] = 1;
	SavePlayerWorks(to_player);
	SavePlayerSkills(to_player);

	SendClientMessageEx(playerid, 0xa912e2FF, "[FSB] "COL_WHITE" %s ahora es de la mafia.", PLAYER_TEMP[to_player][py_RP_NAME]);
	ShowPlayerMessage(to_player, "~y~Ahora eres mafioso enemigo.", 3);
	return 1;
}

InviteToFO(playerid, to_player)
{
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (to_player == playerid) return 1;

	new Float:x, Float:y, Float:z; GetPlayerPos(to_player, x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~Esta persona no está cerca tuya.", 3);
	if (PLAYER_CREW[to_player][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~Esta persona tiene banda.", 3);
	if (PlayerIsInMafia(to_player)) return ShowPlayerMessage(playerid, "~r~Este usuario ya es mafioso.", 3);
	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes reclutar a esta persona por ahora.", 3);

	new player_jobs = CountPlayerJobs(to_player);
	if (ACCOUNT_INFO[to_player][ac_SU])
	{
		if (player_jobs >= MAX_SU_WORKS)
		{
		    ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}
	else
	{
		if (player_jobs >= MAX_NU_WORKS)
		{
			ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}

	if (PLAYER_TEMP[to_player][py_WORKING_IN]) return ShowPlayerMessage(playerid, "~r~Esta persona no puede unirse porque esta de servicio en su trabajo.", 3);

	PLAYER_WORKS[to_player][WORK_OSBORN] = true;
	PLAYER_SKILLS[to_player][WORK_OSBORN] = 1;
	SavePlayerWorks(to_player);
	SavePlayerSkills(to_player);

	SendClientMessageEx(playerid, 0x3a3eabFF, "[Familia Osborn] "COL_WHITE" %s ahora es de la mafia.", PLAYER_TEMP[to_player][py_RP_NAME]);
	ShowPlayerMessage(to_player, "~y~Ahora eres mafioso.", 3);
	return 1;
}

InviteToFC(playerid, to_player)
{
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (to_player == playerid) return 1;

	new Float:x, Float:y, Float:z; GetPlayerPos(to_player, x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~Esta persona no está cerca tuya.", 3);
	if (PLAYER_CREW[to_player][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~Esta persona tiene banda.", 3);
	if (PlayerIsInMafia(to_player)) return ShowPlayerMessage(playerid, "~r~Este usuario ya es mafioso.", 3);
	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes reclutar a esta persona por ahora.", 3);

	new player_jobs = CountPlayerJobs(to_player);
	if (ACCOUNT_INFO[to_player][ac_SU])
	{
		if (player_jobs >= MAX_SU_WORKS)
		{
		    ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}
	else
	{
		if (player_jobs >= MAX_NU_WORKS)
		{
			ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}

	if (PLAYER_TEMP[to_player][py_WORKING_IN]) return ShowPlayerMessage(playerid, "~r~Esta persona no puede unirse porque esta de servicio en su trabajo.", 3);

	PLAYER_WORKS[to_player][WORK_CONNOR] = true;
	PLAYER_SKILLS[to_player][WORK_CONNOR] = 1;
	SavePlayerWorks(to_player);
	SavePlayerSkills(to_player);

	SendClientMessageEx(playerid, 0xc33d3dFF, "[TFC] "COL_WHITE" %s ahora es de la mafia.", PLAYER_TEMP[to_player][py_RP_NAME]);
	ShowPlayerMessage(to_player, "~y~Ahora eres mafioso.", 3);
	return 1;
}

InviteToDS(playerid, to_player)
{
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (to_player == playerid) return 1;

	new Float:x, Float:y, Float:z; GetPlayerPos(to_player, x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~Esta persona no está cerca tuya.", 3);
	if (PLAYER_CREW[to_player][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~Esta persona tiene banda.", 3);
	if (PlayerIsInMafia(to_player)) return ShowPlayerMessage(playerid, "~r~Este usuario ya es mafioso.", 3);
	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes reclutar a esta persona por ahora.", 3);

	new player_jobs = CountPlayerJobs(to_player);
	if (ACCOUNT_INFO[to_player][ac_SU])
	{
		if (player_jobs >= MAX_SU_WORKS)
		{
		    ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}
	else
	{
		if (player_jobs >= MAX_NU_WORKS)
		{
			ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}

	if (PLAYER_TEMP[to_player][py_WORKING_IN]) return ShowPlayerMessage(playerid, "~r~Esta persona no puede unirse porque esta de servicio en su trabajo.", 3);

	PLAYER_WORKS[to_player][WORK_DIVISO] = true;
	PLAYER_SKILLS[to_player][WORK_DIVISO] = 1;
	SavePlayerWorks(to_player);
	SavePlayerSkills(to_player);

	SendClientMessageEx(playerid, 0xa9ee70FF, "[DPT] "COL_WHITE" %s ahora es de la mafia.", PLAYER_TEMP[to_player][py_RP_NAME]);
	ShowPlayerMessage(to_player, "~y~Ahora eres mafioso.", 3);
	return 1;
}

CountPlayerJobs(playerid)
{
	new count;
	for(new i = 1; i != sizeof(work_info); i ++)
	{
		if (PLAYER_WORKS[playerid][i]) count ++;
	}
	return count;
}

getPlayerWorks(playerid)
{
	new works[27 * sizeof(work_info)], count;
	for(new i = 1; i != sizeof(work_info); i ++)
	{
		if (PLAYER_WORKS[playerid][i])
		{
			if (count > 0) strcat(works, ", ");
			strcat(works, work_info[i][work_info_NAME]);

			count ++;
		}
	}

	if (!count) works = "ninguno";
	return works;
}

SetPlayerSkillLevels(playerid)
{
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SAWNOFF_SHOTGUN, 0);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 0);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL_SILENCED, 0);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_DESERT_EAGLE, 999);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SHOTGUN, 999);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SPAS12_SHOTGUN, 0);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SAWNOFF_SHOTGUN, 0);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MICRO_UZI, 0);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5, 999);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47, 999);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_M4, 999);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SNIPERRIFLE, 999);
	return 1;
}

forward HealthDown(playerid);
public HealthDown(playerid)
{
	#if DEBUG_MODE == 1
		printf("HealthDown"); // debug juju
	#endif

	if (CHARACTER_INFO[playerid][ch_STATE] != ROLEPLAY_STATE_CRACK) return 1;

	GivePlayerHealthEx(playerid, -1.0);

	if (GetPlayerDistanceFromPoint(playerid, PLAYER_TEMP[playerid][py_INJURED_POS][0], PLAYER_TEMP[playerid][py_INJURED_POS][1], PLAYER_TEMP[playerid][py_INJURED_POS][2]) > 0.10) ApplyAnimation(playerid, "SWEET", "SWEET_INJUREDLOOP", 4.1, true, false, false, 1, 0, 1);
	ApplyAnimation(playerid, "SWEET", "SWEET_INJUREDLOOP", 4.1, true, false, false, 1, 0, 1);

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][16]);
	PLAYER_TEMP[playerid][py_TIMERS][16] = SetTimerEx("HealthDown", 8000, false, "i", playerid);
	return 1;
}

forward StandUpBotikin(medic, playerid);
public StandUpBotikin(medic, playerid)
{
	#if DEBUG_MODE == 1
		printf("StandUpBotikin"); // debug juju
	#endif

	PLAYER_MISC[medic][MISC_BOTIKIN] --;
	ResetItemBody(medic);
	SavePlayerMisc(medic);
	ShowPlayerMessage(medic, "~g~Has curado a esta persona.", 3);

	CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
	ResetItemBody(playerid);

	if (ACCOUNT_INFO[playerid][ac_SU]) SetPlayerHealthEx(playerid, 100.0);
	else SetPlayerHealthEx(playerid, 25.0);

	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 0, true);
	ClearAnimations(playerid);

	if (PLAYER_WORKS[medic][WORK_MEDIC] && PLAYER_TEMP[medic][py_WORKING_IN] == WORK_MEDIC)
	{
		if (PLAYER_TEMP[playerid][py_WANT_MEDIC])
		{
			new pay = (1000 + PLAYER_SKILLS[medic][WORK_MEDIC]);

			if (ACCOUNT_INFO[medic][ac_SU]) pay += minrand(200, 500);

			GivePlayerCash(medic, pay);

			PLAYER_SKILLS[medic][WORK_MEDIC] += 5;
			SavePlayerSkills(medic);
			GivePlayerReputation(medic);
		}
		else ShowPlayerNotification(playerid, "Este jugador no ha pedido un medico entonces no has ganado nada.", 4);
	}

	DisablePlayerMedicMark(playerid);
	return 1;
}


CheckKillEvadeAttemp(const str_text[])
{
	for(new x = 0; x < sizeof(QUIT_KEYWORDS); x ++)
    {
        if (strfind(str_text, QUIT_KEYWORDS[x], true) != -1)
        {
        	printf("[QUIT-CHECK] %s - %s", QUIT_KEYWORDS[x], str_text);
        	return true;
    	}
    }
	return false;
}

CheckSpamViolation(const str_text[])
{
	for(new x = 0; x < sizeof(BAN_KEYWORDS); x ++)
    {
        if (strfind(str_text, BAN_KEYWORDS[x], true) != -1)
        {
        	printf("[SPAM-CHECK] %s - %s", BAN_KEYWORDS[x], str_text);
        	return true;
    	}
    }
	return false;
}

CheckFilterViolation(const str_text[])
{
	for(new x = 0; x < sizeof(INVALID_WORDS); x ++)
    {
        if (strfind(str_text, INVALID_WORDS[x], true) != -1) return true;
    }
	return false;
}

CheckNameFilterViolation(const str_text[])
{
	for(new x = 0; x < sizeof(INVALID_NAMES); x ++)
    {
        if (strfind(str_text, INVALID_NAMES[x], true) != -1) return true;
    }
	return false;
}

SendMafiaMessage(color, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_WORKS[i][WORK_MAFIA])
			{
				SendResponsiveMessage(i, color, message, 135);
			}
		}
	}
	return 1;
}

SendEnemyMafiaMessage(color, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_WORKS[i][WORK_ENEMY_MAFIA])
			{
				SendResponsiveMessage(i, color, message, 135);
			}
		}
	}
	return 1;
}

SendOsbornMafiaMessage(color, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_WORKS[i][WORK_OSBORN])
			{
				SendResponsiveMessage(i, color, message, 135);
			}
		}
	}
	return 1;
}

SendConnorMafiaMessage(color, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_WORKS[i][WORK_CONNOR])
			{
				SendResponsiveMessage(i, color, message, 135);
			}
		}
	}
	return 1;
}

SendDivisoMafiaMessage(color, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_WORKS[i][WORK_DIVISO])
			{
				SendResponsiveMessage(i, color, message, 135);
			}
		}
	}
	return 1;
}

PutPlayerInVehicleEx(playerid, vehicleid, seat)
{
	PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_DOORS][p_ac_info_IMMUNITY] = gettime() + 5;
	PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_NOFUEL][p_ac_info_IMMUNITY] = gettime() + 15;
	PLAYER_TEMP[playerid][py_VEHICLEID] = vehicleid;
	return PutPlayerInVehicle(playerid, vehicleid, seat);
}

GetPlayersInIP(const ip[])
{
	new 
		temp_ip[16],
		count = 0
	;

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
		    GetPlayerIp(i, temp_ip, 16);
		    if (!strcmp(temp_ip, ip)) count ++;
		}
	}
	return count;
}

KickEx(playerid, time = 0)
{
	if (GetPlayerState(playerid) == PLAYER_STATE_SPECTATING) return 0;
	PLAYER_TEMP[playerid][py_KICKED] = true;
	
	if (!time) Kick(playerid);
	else
	{
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][0]);
		PLAYER_TEMP[playerid][py_TIMERS][0] = SetTimerEx("KickPlayer", time, false, "i", playerid);
	}
	return 1;
}

forward KickPlayer(playerid);
public KickPlayer(playerid)
{
	#if DEBUG_MODE == 1
		printf("KickPlayer"); // debug juju
	#endif

	return Kick(playerid);
}

SetPlayerPosEx(playerid, Float:x, Float:y, Float:z, Float:angle, interior, world, freeze = 0, addoffset = 0)
{
	PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_UNOCCUPIED_VEHICLE_TP][p_ac_info_IMMUNITY] = gettime() + 5;

	if (addoffset)
	{
		x += (1.5 * floatsin(-angle, degrees));
		y += (1.5 * floatcos(-angle, degrees));
	}

	if (PLAYER_MISC[playerid][MISC_GAMEMODE] == 0)
	{
		CHARACTER_INFO[playerid][ch_POS][0] = x;
		CHARACTER_INFO[playerid][ch_POS][1] = y;
		CHARACTER_INFO[playerid][ch_POS][2] = z;
		CHARACTER_INFO[playerid][ch_ANGLE] = angle;
		CHARACTER_INFO[playerid][ch_INTERIOR] = interior;
		PLAYER_MISC[playerid][MISC_LAST_WORLD] = world;
	}

	SetPlayerPos(playerid, x, y, z);
	SetPlayerFacingAngle(playerid, angle);
	SetPlayerInterior(playerid, interior);
	SetPlayerVirtualWorld(playerid, world);
	SetCameraBehindPlayer(playerid);

	if (freeze)
	{
		Streamer_UpdateEx(playerid, x, y, z, world, interior, -1, -1, 1);
		TogglePlayerControllableEx(playerid, false);
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][3]);
		PLAYER_TEMP[playerid][py_TIMERS][3] = SetTimerEx("TogglePlayerControl", 2000, false, "ib", playerid, true);
		ShowPlayerMessage(playerid, "~r~CARGANDO...~w~~n~Espere por favor", 2);
	}

	if (PLAYER_MISC[playerid][MISC_CONFIG_FP])
	{
		SetFirstPerson(playerid, true);
	}
	return 1;
}

GetNearestHospitalForPlayer(playerid)
{
	new Float:distance = 99999.0,
	   Float:tmp_distance,
	   closest = -1;

    for(new i = 0; i < sizeof Hospital_Spawn_Positions; i++)
    {
	   tmp_distance = GetPlayerDistanceFromPoint(playerid, Hospital_Spawn_Positions[i][0], Hospital_Spawn_Positions[i][1], Hospital_Spawn_Positions[i][2]);
	   if (tmp_distance < distance)
	   {
		  distance = tmp_distance;
		  closest = i;
	   }
    }
	return closest;
}

GetHospitalSpawnPosition(hospital, &Float:x, &Float:y, &Float:z, &Float:angle, &interior, &local_interior, &rp_state)
{
	x = Hospital_Spawn_Positions[hospital][0];
	y = Hospital_Spawn_Positions[hospital][1];
	z = Hospital_Spawn_Positions[hospital][2];
	angle = Hospital_Spawn_Positions[hospital][3];
	interior = 0;
	local_interior = 0;
	rp_state = ROLEPLAY_STATE_NORMAL;
	return 1;
}

UpdateHospitalSizeTextdrawLife(playerid)
{
	new str_text[64];
	format(str_text, sizeof(str_text), "Recuperandote ~r~%d %", PLAYER_TEMP[playerid][py_HOSPITAL_LIFE]);
	ShowPlayerMessage(playerid, str_text, 2);
	return 1;
}

TogglePlayerSpectatingEx(playerid, bool:spectate)
{
	PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_SPECTATE][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_TEMP[playerid][py_PLAYER_SPECTATE] = spectate;
	return TogglePlayerSpectating(playerid, spectate);
}

ClearPlayerChatBox(playerid, ammount = 20)
{
	for(new i = 0; i != ammount; i++) SendClientMessage(playerid, -1, " ");
	return 1;
}