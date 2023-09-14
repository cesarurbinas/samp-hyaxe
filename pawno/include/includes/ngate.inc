/*****************************************************************************************************************************************************************************************
[N]ickk Gate
Autor: Nickk888/Nickk888SAMP
Wersja/Version: 3.0 Remastered
YouTube: https://www.youtube.com/channel/UCvjbpjJXET1QS9Wa0_XVCuw
Facebook: https://www.facebook.com/Nickk888FP/

Nie zezwalam na zmianê autora! / You have no permission to change the autor's name!
Nie zezwalam na republikacje na innych forach! / You have no permission to share this script on other forums!

PL:Zezwalam na edycjê poni¿szego kodu(Od linijki 26), pozostaw t¹ licencjê!
ENG:You have permission to change the code(Starting on line 26), don't change this license!

Funkcje/Functions:
NGateCreate(modelID, Float: objectX, Float: objectY, Float: objectZ, Float: objectRotX=0.0, Float: objectRotY=0.0, Float: objectRotZ=0.0, moveDirection = MOVE_DOWN, Float: movetoX = 0.0, Float: movetoY = 0.0, Float: movetoZ = 0.0, moveMode = MODE_ALL_AUTO, Float:moveSpeed = 3.0, Float:moveRadius = 6.0, accessID[]={ -1 }, Float: detectRadius=13.0, detectKey=KEY_CROUCH, CmdToOpen[]="", CmdToClose[]="", Float: cDetectX=0.0, Float: cDetectY=0.0, Float: cDetectZ=0.0, accessIDsize = sizeof accessID)
NBarrierCreate(Float: objectX, Float: objectY, Float: objectZ, Float:objectZRot, moveMode = MODE_ALL_AUTO, Float:RotSpeed = 1.0, accessID[]={ -1 }, Float: detectRadius=13.0,  detectKey=KEY_CROUCH, CmdToOpen[]="", CmdToClose[]="", Float: cDetectX=0.0, Float: cDetectY=0.0, Float: cDetectZ=0.0, accessIDsize = sizeof accessID)
NGateDestroy(gateid);
NGateSetAccessID(playerid, id);
NGateOpen(gateid);
NGateClose(gateid);
NGateIsGateOpen(gateid);
NGateCreateGroup();
NGateAddToGroup(gateid, groupid);
NGateReturnObjectID(gateid);
*****************************************************************************************************************************************************************************************/
#if defined _ngate_included
	#endinput
#endif
#define _ngate_included

#if !defined _streamer_included
	#include <streamer>
#endif

#include <YSI\y_iterate>
#include <YSI\y_hooks>

#define NGATE_MAX_GATES 1000
#define NGATE_MAX_GROUPS 500

#define MOVE_DOWN 0
#define MOVE_UP 1
#define MOVE_NORD 2
#define MOVE_OST 3
#define MOVE_SOUTH 4
#define MOVE_WEST 5
#define MOVE_CUSTOM 6

#define MODE_MANUAL 0
#define MODE_MANUAL_AUTO 1
#define MODE_ALL_AUTO 2
#define MODE_WALK_AUTO 3
#define MODE_VEHICLE_AUTO 4
#define MODE_ALL_KEYINPUT 5
#define MODE_WALK_KEYINPUT 6
#define MODE_VEHICLE_KEYINPUT 7
#define MODE_ALL_COMMANDINPUT 8
#define MODE_WALK_COMMANDINPUT 9
#define MODE_VEHICLE_COMMANDINPUT 10

#define BARRIER_ROT_NORD 90.0
#define BARRIER_ROT_OST 0.0
#define BARRIER_ROT_SOUTH -90.0
#define BARRIER_ROT_WEST 180.0

enum ngatedata
{
	ngOID,
	ngKey,
	ngAccessID[128],
	ngAccessIDSizeOf,
	ngGroupID,
	bool:slotAvailable,
	bool:ngIsOpen,
	bool:ngIsBarrier,
	bool:ngAutoClose,
	Float:ngX,
	Float:ngY,
	Float:ngZ,
	Float:ngdetectX,
	Float:ngdetectY,
	Float:ngdetectZ,
	Float:ngmX,
	Float:ngmY,
	Float:ngmZ,
	Float:ngdetectRadius,
	Float:ngSpeed,
	Float:ngRadius,
	Float:ngDirection,
	ngMode,
	ngTriggerZone,
	ngCommandOpen[64],
	ngCommandClose[64]
};
new NGate[NGATE_MAX_GATES][ngatedata];
new NGateAccessID[MAX_PLAYERS];
new NGatePlayerGateID[MAX_PLAYERS];
new NGate_Group[NGATE_MAX_GROUPS][NGATE_MAX_GATES];

new Iterator:NGate_Iter<NGATE_MAX_GATES>;
new Iterator:NGate_Group_Iter<NGATE_MAX_GROUPS>;
new Iterator:NGate_GroupG_Iter[NGATE_MAX_GROUPS]<NGATE_MAX_GATES>;

#define INTERNAL_BARRIER_SPEED 0.00075
#define INTERNAL_BARRIER_ZOFFSET 0.001
#define INTERNAL_INVALID_GATE_ID -1

hook OnGameModeInit()
{
	Iter_Init(NGate_GroupG_Iter);
	foreach(new i : Player)
		NGatePlayerGateID[i] = INTERNAL_INVALID_GATE_ID;
	return 1;
}

hook OnFilterScriptInit()
{
	Iter_Init(NGate_GroupG_Iter);
	foreach(new i : Player)
		NGatePlayerGateID[i] = INTERNAL_INVALID_GATE_ID;
	return 1;
}

hook OnFilterScriptExit()
{
	foreach(new i : NGate_Iter)
		DestroyDynamicObject(NGate[i][ngOID]);
	return 1;
}

hook OnPlayerConnect(playerid)
{
	NGatePlayerGateID[playerid] = INTERNAL_INVALID_GATE_ID;
	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if(NGatePlayerGateID[playerid] != INTERNAL_INVALID_GATE_ID)
	{
		new ng_id = NGatePlayerGateID[playerid];
		NGatePlayerGateID[playerid] = INTERNAL_INVALID_GATE_ID;
		if(IsAnyPlayerInDynamicArea(ng_id)) return 1;
		if(NGate[ng_id][slotAvailable] == true && NGate[ng_id][ngIsOpen] == true)
			if(NGate[ng_id][ngAutoClose])
				NGateClose(ng_id);
	}
	return 1;
}

#if !defined _zcmd_included
	hook OnPlayerCommandText(playerid, cmdtext[]) {
		return NGateCheckCommand(playerid, cmdtext);
	}
#else
	hook OnPlayerCommandReceived(playerid, cmdtext[]) {
		return NGateCheckCommand(playerid, cmdtext);
	}
#endif

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(NGatePlayerGateID[playerid] != INTERNAL_INVALID_GATE_ID)
	{
		new ng_id = NGatePlayerGateID[playerid];
		if(NGate[ng_id][slotAvailable] == true && NGate[ng_id][ngIsOpen] == false && NGate[ng_id][ngKey] == newkeys && NGate[ng_id][ngMode] != MODE_MANUAL)
		{
			if(NGateCheckPermission(playerid, ng_id))
			{
				switch(NGate[ng_id][ngMode])
				{
					case MODE_ALL_KEYINPUT: NGateOpen(ng_id);
					case MODE_VEHICLE_KEYINPUT: if(IsPlayerInAnyVehicle(playerid)) NGateOpen(ng_id);
					case MODE_WALK_KEYINPUT: if(!IsPlayerInAnyVehicle(playerid)) NGateOpen(ng_id);
				}
			}
		}
	}
}

hook OnPlayerEnterDynArea(playerid, areaid)
{
	new ng_id = Streamer_GetIntData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID);
	NGatePlayerGateID[playerid] = ng_id;
	if(NGate[ng_id][slotAvailable] == true && NGate[ng_id][ngIsOpen] == false && NGate[ng_id][ngMode] != MODE_MANUAL)
	{
		if(NGateCheckPermission(playerid, ng_id))
		{
			switch(NGate[ng_id][ngMode])
			{
				case MODE_ALL_AUTO: NGateOpen(ng_id);
				case MODE_VEHICLE_AUTO: if(IsPlayerInAnyVehicle(playerid)) NGateOpen(ng_id);
				case MODE_WALK_AUTO: if(!IsPlayerInAnyVehicle(playerid)) NGateOpen(ng_id);
			}
		}
	}
	return 1;
}

hook OnPlayerLeaveDynArea(playerid, areaid)
{
	new ng_id = Streamer_GetIntData(STREAMER_TYPE_AREA, areaid, E_STREAMER_EXTRA_ID);
	NGatePlayerGateID[playerid] = INTERNAL_INVALID_GATE_ID;
	if(IsAnyPlayerInDynamicArea(areaid)) return 1;
	if(NGate[ng_id][slotAvailable] == true && NGate[ng_id][ngIsOpen] == true)
		if(NGate[ng_id][ngAutoClose])
			NGateClose(ng_id);
	return 1;
}

//STOCKS

stock NGateReturnObjectID(ng_gateid)
	return NGate[ng_gateid][ngOID];

stock bool:NGateIsGateOpen(ng_gateid)
	return NGate[ng_gateid][ngIsOpen];

stock NGateSetAccessID(playerid, ng_id)
{
	if(IsPlayerConnected(playerid)) {
		NGateAccessID[playerid] = ng_id;
		return 1;
	}
	return 0;
}

stock NGateClose(ng_gateid)
{
	if(NGate[ng_gateid][slotAvailable] == true && NGate[ng_gateid][ngIsOpen] == true)
	{
		if(NGate[ng_gateid][ngGroupID] != -1)
		{
			//Checking group for cascade opening
			new ng_groupid = NGate[ng_gateid][ngGroupID];
			new ng_g_gid;
			foreach(new i : NGate_GroupG_Iter[ng_groupid])
			{
				ng_g_gid = NGate_Group[ng_groupid][i];
				if(NGate[ng_g_gid][ngIsBarrier] == false) MoveDynamicObject(NGate[ng_g_gid][ngOID], NGate[ng_g_gid][ngX], NGate[ng_g_gid][ngY], NGate[ng_g_gid][ngZ], NGate[ng_g_gid][ngSpeed]);
				else MoveDynamicObject(NGate[ng_g_gid][ngOID], NGate[ng_g_gid][ngX], NGate[ng_g_gid][ngY], NGate[ng_g_gid][ngZ] - INTERNAL_BARRIER_ZOFFSET, INTERNAL_BARRIER_SPEED * NGate[ng_gateid][ngSpeed], 0.0, 90.0, NGate[ng_g_gid][ngmZ]);
				NGate[ng_g_gid][ngIsOpen] = false;
			}
		}
		else
		{
			if(NGate[ng_gateid][ngIsBarrier] == false) MoveDynamicObject(NGate[ng_gateid][ngOID], NGate[ng_gateid][ngX], NGate[ng_gateid][ngY], NGate[ng_gateid][ngZ], NGate[ng_gateid][ngSpeed]);
			else MoveDynamicObject(NGate[ng_gateid][ngOID], NGate[ng_gateid][ngX], NGate[ng_gateid][ngY], NGate[ng_gateid][ngZ] - INTERNAL_BARRIER_ZOFFSET, INTERNAL_BARRIER_SPEED * NGate[ng_gateid][ngSpeed], 0.0, 90.0, NGate[ng_gateid][ngmZ]);
			NGate[ng_gateid][ngIsOpen] = false;
		}
	}
	return 1;
}

stock NGateOpen(ng_gateid)
{
	if(NGate[ng_gateid][slotAvailable] == true && NGate[ng_gateid][ngIsOpen] == false)
	{
		if(NGate[ng_gateid][ngGroupID] != -1)
		{
			//Checking group for cascade opening
			new ng_groupid = NGate[ng_gateid][ngGroupID];
			new ng_g_gid;
			foreach(new i : NGate_GroupG_Iter[ng_groupid])
			{
				ng_g_gid = NGate_Group[ng_groupid][i];
				if(NGate[ng_g_gid][ngIsBarrier] == false) MoveDynamicObject(NGate[ng_g_gid][ngOID], NGate[ng_g_gid][ngmX], NGate[ng_g_gid][ngmY], NGate[ng_g_gid][ngmZ], NGate[ng_g_gid][ngSpeed]);
				else MoveDynamicObject(NGate[ng_g_gid][ngOID], NGate[ng_g_gid][ngX], NGate[ng_g_gid][ngY], NGate[ng_g_gid][ngZ] + INTERNAL_BARRIER_ZOFFSET, INTERNAL_BARRIER_SPEED * NGate[ng_gateid][ngSpeed], 0.0, 0.0, NGate[ng_g_gid][ngmZ]);
				NGate[ng_g_gid][ngIsOpen] = true;
			}
		}
		else
		{
			if(NGate[ng_gateid][ngIsBarrier] == false) MoveDynamicObject(NGate[ng_gateid][ngOID], NGate[ng_gateid][ngmX], NGate[ng_gateid][ngmY], NGate[ng_gateid][ngmZ], NGate[ng_gateid][ngSpeed]);
			else MoveDynamicObject(NGate[ng_gateid][ngOID], NGate[ng_gateid][ngX], NGate[ng_gateid][ngY], NGate[ng_gateid][ngZ] + INTERNAL_BARRIER_ZOFFSET, INTERNAL_BARRIER_SPEED * NGate[ng_gateid][ngSpeed], 0.0, 0.0, NGate[ng_gateid][ngmZ]);
			NGate[ng_gateid][ngIsOpen] = true;
		}
	}
	return 1;
}

stock NGateDestroy(ng_gateid)
{
	if(NGate[ng_gateid][slotAvailable] == true)
	{
		NGate[ng_gateid][slotAvailable] = false;
		DestroyDynamicObject(NGate[ng_gateid][ngOID]);
		DestroyDynamicArea(NGate[ng_gateid][ngTriggerZone]);
		Iter_Remove(NGate_Iter, ng_gateid);
		
		//Removing gate from group if assigned
		new ng_groupid = NGate[ng_gateid][ngGroupID];
		if(ng_groupid != -1)
		{
			foreach(new i : NGate_GroupG_Iter[ng_groupid])
			{
				if(NGate_Group[ng_groupid][i] == ng_gateid)
				{
					new old = i;
					Iter_SafeRemove(NGate_GroupG_Iter[ng_groupid], old, i);
					break;
				}
			}
		}
		return 1;
	}
	return 0;
}

stock NBarrierCreate(Float: objectX, Float: objectY, Float: objectZ, Float:objectZRot, moveMode = MODE_ALL_AUTO, Float:RotSpeed = 1.0, accessID[]={ -1 }, Float: detectRadius=13.0,  detectKey=KEY_CROUCH, CmdToOpen[]="", CmdToClose[]="", Float: cDetectX=0.0, Float: cDetectY=0.0, Float: cDetectZ=0.0, accessIDsize = sizeof accessID)
{
	new i = Iter_Free(NGate_Iter);
	if(i != -1)
	{
		NGate[i][slotAvailable] = true;
		NGate[i][ngIsBarrier] = true;
		if(strlen(CmdToClose) > 1 || moveMode == MODE_MANUAL) {
			NGate[i][ngAutoClose] = false;
			format(NGate[i][ngCommandClose], 64, CmdToClose);
		}
		else NGate[i][ngAutoClose] = true;
		NGate[i][ngSpeed] = RotSpeed;
		NGate[i][ngX] = objectX;
		NGate[i][ngY] = objectY;
		NGate[i][ngZ] = objectZ;
		NGate[i][ngKey] = detectKey;
		NGate[i][ngAccessIDSizeOf] = accessIDsize;
		NGate[i][ngGroupID] = -1;
		for(new aid; aid < NGate[i][ngAccessIDSizeOf]; aid++)
			NGate[i][ngAccessID][aid] = accessID[aid];
		format(NGate[i][ngCommandOpen], 64, CmdToOpen);
		if((moveMode == MODE_ALL_COMMANDINPUT || moveMode == MODE_VEHICLE_COMMANDINPUT || moveMode == MODE_WALK_COMMANDINPUT) && strlen(CmdToOpen) <= 1) {
			NGate[i][slotAvailable] = false;
			printf("[NGATE] Podczas tworzenia Bariery o ID %i wyst¹pi³ problem: Brak komendy podczas trybu komend!", i);
			printf("[NGATE] An Error has occured when creating gate ID %i Error: No command on command mode!", i);
			return 0;
		}
		NGate[i][ngMode] = moveMode;
		NGate[i][ngmZ] = objectZRot;
		NGate[i][ngdetectRadius] = detectRadius;
		if(cDetectX == 0.0 && cDetectY == 0.0 && cDetectZ == 0.0){
			NGate[i][ngdetectX] = objectX;
			NGate[i][ngdetectY] = objectY;
			NGate[i][ngdetectZ] = objectZ;
		}
		else{
			NGate[i][ngdetectX] = cDetectX;
			NGate[i][ngdetectY] = cDetectY;
			NGate[i][ngdetectZ] = cDetectZ;
		}
		NGate[i][ngOID] = CreateDynamicObject(968, NGate[i][ngX], NGate[i][ngY], NGate[i][ngZ], 0.0, 90.0, NGate[i][ngmZ], -1, -1, -1, 500.0);
		NGate[i][ngTriggerZone] = CreateDynamicSphere(NGate[i][ngdetectX], NGate[i][ngdetectY], NGate[i][ngdetectZ], NGate[i][ngdetectRadius]);
		Streamer_SetIntData(STREAMER_TYPE_AREA, NGate[i][ngTriggerZone], E_STREAMER_EXTRA_ID, i);
		Iter_Add(NGate_Iter, i);
	}
	return i;
}

stock NGateCreate(modelID, Float: objectX, Float: objectY, Float: objectZ, Float: objectRotX=0.0, Float: objectRotY=0.0, Float: objectRotZ=0.0, moveDirection = MOVE_DOWN, Float: movetoX = 0.0, Float: movetoY = 0.0, Float: movetoZ = 0.0, moveMode = MODE_ALL_AUTO, Float:moveSpeed = 3.0, Float:moveRadius = 6.0, accessID[]={ -1 }, Float: detectRadius=13.0, detectKey=KEY_CROUCH, CmdToOpen[]="", CmdToClose[]="", Float: cDetectX=0.0, Float: cDetectY=0.0, Float: cDetectZ=0.0, accessIDsize = sizeof accessID)
{
	new i = Iter_Free(NGate_Iter);
	if(i != -1)
	{
		NGate[i][ngOID] = CreateDynamicObject(modelID, objectX, objectY, objectZ, objectRotX, objectRotY, objectRotZ, -1, -1, -1, 500.0);
		NGate[i][slotAvailable] = true;
		NGate[i][ngIsBarrier] = false;
		if(strlen(CmdToClose) > 1 || moveMode == MODE_MANUAL) {
			NGate[i][ngAutoClose] = false;
			format(NGate[i][ngCommandClose], 64, CmdToClose);
		}
		else NGate[i][ngAutoClose] = true;
		NGate[i][ngX] = objectX;
		NGate[i][ngY] = objectY;
		NGate[i][ngZ] = objectZ;
		NGate[i][ngSpeed] = moveSpeed;
		NGate[i][ngRadius] = moveRadius;
		NGate[i][ngDirection] = moveDirection;
		NGate[i][ngKey] = detectKey;
		NGate[i][ngAccessIDSizeOf] = accessIDsize;
		NGate[i][ngGroupID] = -1;
		for(new aid; aid < NGate[i][ngAccessIDSizeOf]; aid++)
			NGate[i][ngAccessID][aid] = accessID[aid];
		format(NGate[i][ngCommandOpen], 64, CmdToOpen);
		if((moveMode == MODE_ALL_COMMANDINPUT || moveMode == MODE_VEHICLE_COMMANDINPUT || moveMode == MODE_WALK_COMMANDINPUT) && strlen(CmdToOpen) <= 1) {
			NGate[i][slotAvailable] = false;
			printf("[NGATE] Podczas tworzenia Bramy o ID %i wyst¹pi³ problem: Brak komendy podczas trybu komend!", i);
			printf("[NGATE] An Error has occured when creating gate ID %i Error: No command on command mode!", i);
			return 0;
		}
		NGate[i][ngMode] = moveMode;
		NGate[i][ngmX] = objectX;
		NGate[i][ngmY] = objectY;
		NGate[i][ngmZ] = objectZ;
		NGate[i][ngdetectRadius] = detectRadius;
		switch(moveDirection) {
			case MOVE_DOWN: NGate[i][ngmZ] = NGate[i][ngmZ] - moveRadius;
			case MOVE_UP: NGate[i][ngmZ] = NGate[i][ngmZ] + moveRadius;
			case MOVE_NORD: NGate[i][ngmY] = NGate[i][ngmY] + moveRadius;
			case MOVE_SOUTH: NGate[i][ngmY] = NGate[i][ngmY] - moveRadius;
			case MOVE_OST: NGate[i][ngmX] = NGate[i][ngmX] + moveRadius;
			case MOVE_WEST: NGate[i][ngmX] = NGate[i][ngmX] - moveRadius;
			default: 
			{
				NGate[i][ngmX] = movetoX;
				NGate[i][ngmY] = movetoY;
				NGate[i][ngmZ] = movetoZ;
			}
		}
		
		if(cDetectX == 0.0 && cDetectY == 0.0 && cDetectZ == 0.0){
			NGate[i][ngdetectX] = objectX;
			NGate[i][ngdetectY] = objectY;
			NGate[i][ngdetectZ] = objectZ;
		}
		else{
			NGate[i][ngdetectX] = cDetectX;
			NGate[i][ngdetectY] = cDetectY;
			NGate[i][ngdetectZ] = cDetectZ;
		}
		NGate[i][ngTriggerZone] = CreateDynamicSphere(NGate[i][ngdetectX], NGate[i][ngdetectY], NGate[i][ngdetectZ], NGate[i][ngdetectRadius]);
		Streamer_SetIntData(STREAMER_TYPE_AREA, NGate[i][ngTriggerZone], E_STREAMER_EXTRA_ID, i);
		Iter_Add(NGate_Iter, i);
	}
	return i;
}

stock NGateAddToGroup(gateid, groupid)
{
	new i = Iter_Free(NGate_GroupG_Iter[groupid]);
	if(i != -1)
	{
		NGate_Group[groupid][i] = gateid;
		NGate[gateid][ngGroupID] = groupid;
		Iter_Add(NGate_GroupG_Iter[groupid], i);
		return 1;
	}
	return 0;
}

stock NGateCreateGroup()
{
	new i = Iter_Free(NGate_Group_Iter);
	if(i != -1)
		Iter_Add(NGate_Group_Iter, i);
	return i;
}

stock NGateCheckPermission(playerid, ng_gateid)
{
	if(NGate[ng_gateid][ngAccessID][0] == -1) return 1;
	else for(new i; i < NGate[ng_gateid][ngAccessIDSizeOf]; i++) if(NGate[ng_gateid][ngAccessID][i] == NGateAccessID[playerid]) return 1;
	return 0;
}

stock NGateCheckCommand(playerid, cmdtext[])
{
	if(NGatePlayerGateID[playerid] != INTERNAL_INVALID_GATE_ID)
	{
		new ng_id = NGatePlayerGateID[playerid];
		if(NGate[ng_id][slotAvailable] == true)
		{
			if((NGate[ng_id][ngMode] == MODE_ALL_COMMANDINPUT || NGate[ng_id][ngMode] == MODE_VEHICLE_COMMANDINPUT || NGate[ng_id][ngMode] == MODE_WALK_COMMANDINPUT) && NGate[ng_id][ngMode] != MODE_MANUAL)
			{
				if(strlen(NGate[ng_id][ngCommandOpen]) && !strcmp(NGate[ng_id][ngCommandOpen], cmdtext, true))
				{
					if(NGateCheckPermission(playerid, ng_id))
					{
						if(NGate[ng_id][ngIsOpen] == false)
						{
							switch(NGate[ng_id][ngMode])
							{						
								case MODE_ALL_COMMANDINPUT: NGateOpen(ng_id);
								case MODE_VEHICLE_COMMANDINPUT: if(IsPlayerInAnyVehicle(playerid)) NGateOpen(ng_id);
								case MODE_WALK_COMMANDINPUT: if(!IsPlayerInAnyVehicle(playerid)) NGateOpen(ng_id);
							}
						}
					}
					else SendClientMessage(playerid, -1, "{FF0000}You have no permission!");
					#if defined _zcmd_included 
						return 0;
					#else 
						return 1;
					#endif
				}
				if(strlen(NGate[ng_id][ngCommandClose]) && !strcmp(NGate[ng_id][ngCommandClose], cmdtext, true))
				{
					if(NGateCheckPermission(playerid, ng_id))
					{
						if(NGate[ng_id][ngIsOpen] == true)
						{
							switch(NGate[ng_id][ngMode])
							{						
								case MODE_ALL_COMMANDINPUT: NGateClose(ng_id);
								case MODE_VEHICLE_COMMANDINPUT: if(IsPlayerInAnyVehicle(playerid)) NGateClose(ng_id);
								case MODE_WALK_COMMANDINPUT: if(!IsPlayerInAnyVehicle(playerid)) NGateClose(ng_id);
							}
						}								
					}
					else SendClientMessage(playerid, -1, "{FF0000}You have no permission!");
					#if defined _zcmd_included 
						return 0;
					#else 
						return 1;
					#endif
				}
			}
		}
	}
	#if defined _zcmd_included 
		return 1;
	#else 
		return 0;
	#endif
}