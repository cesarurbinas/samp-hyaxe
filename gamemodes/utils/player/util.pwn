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

new g_iPlayerLastUpdate[MAX_PLAYERS];

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

	new str_text[50];
	format(str_text, sizeof(str_text), "51.161.31.157:9991/proxycheck/%s", PLAYER_TEMP[playerid][py_IP]);
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
	return false;
}

GetPlayerMafia(playerid)
{
	if (PLAYER_WORKS[playerid][WORK_MAFIA]) return WORK_MAFIA;
	if (PLAYER_WORKS[playerid][WORK_ENEMY_MAFIA]) return WORK_ENEMY_MAFIA;
	if (PLAYER_WORKS[playerid][WORK_OSBORN]) return WORK_OSBORN;
	if (PLAYER_WORKS[playerid][WORK_CONNOR]) return WORK_CONNOR;
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

// Truncates a value to the range 0.0 - 360.0
stock Float:GetAbsoluteAngle(Float:angle) {
	// Note that 360 is equal to 0
	return ((angle / 360.0) - floatround((angle / 360.0), floatround_floor)) * 360.0;
}

// Returns the offset heading from north between a point and a destination
stock Float:GetAngleToPoint(Float:fPointX, Float:fPointY, Float:fDestX, Float:fDestY) {
	return GetAbsoluteAngle(-(
		90 - (
			atan2(
				(fDestY - fPointY),
				(fDestX - fPointX)
			)
		)
	));
}

// Returns the distance between two points in 3D space
stock Float:GetDistance3D(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2) {
	return floatsqroot(
		((x1 - x2) * (x1 - x2)) +
		((y1 - y2) * (y1 - y2)) +
		((z1 - z2) * (z1 - z2))
	);
}

// Returns the distance between two points in 2D space
stock Float:GetDistance2D(Float:x1, Float:y1, Float:x2, Float:y2) {
	return floatsqroot(
		((x1 - x2) * (x1 - x2)) +
		((y1 - y2) * (y1 - y2))
	);
}

// Distance from any point on a projected line to a point
stock Float:GetDistancePointLine(
	Float:line_x, Float:line_y, Float:line_z,
	Float:vector_x, Float:vector_y, Float:vector_z,
	Float:point_x, Float:point_y, Float:point_z
) {
	return (
		floatsqroot(
			floatpower((vector_y) * ((point_z) - (line_z)) - (vector_z) * ((point_y) - (line_y)), 2.0) +
			floatpower((vector_z) * ((point_x) - (line_x)) - (vector_x) * ((point_z) - (line_z)), 2.0) +
			floatpower((vector_x) * ((point_y) - (line_y)) - (vector_y) * ((point_x) - (line_x)), 2.0)
		) /
		floatsqroot((vector_x) * (vector_x) + (vector_y) * (vector_y) + (vector_z) * (vector_z))
	);
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

// Return a floating point random number
stock Float:frandom(Float:max, Float:min = 0.0, decimalPlaces = 4) {
	new
		Float:multiplier = floatpower(10.0, decimalPlaces),
		minRounded = floatround(min * multiplier),
		maxRounded = floatround(max * multiplier);
	return float(random(maxRounded - minRounded) + minRounded) / multiplier;
}

// Checks if one angle is within range of another angle
stock AngleInRangeOfAngle(Float:a1, Float:a2, Float:range) {
	a1 -= a2;
	return (a1 < range) && (a1 > -range);

}

// Returns the absolute value of an integer
stock abs(int) {
	if(int < 0) {
		return -int;
	}
	return int;
}

// Picks <sizeof(output)> numbers from a list ranging from 0 to <max>
stock PickFromList(max, count, output[]) {
	new
		idx,
		picked[256];

	if(max > 256) {
		return 1;
	}

	while(idx < count) {
		output[idx] = random(max);

		if(picked[output[idx]] == 0) {
			picked[output[idx]] = 1;
			idx++;
		}
	}

	return 0;
}

// Checks if a variable is not a number
stock IsNaN(Float:number) {
	return !(number <= 0 || number > 0);
}