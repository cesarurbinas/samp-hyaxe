//a_utils by Atom

#if defined _a_utils_included
    #endinput
#endif
#define _a_utils_included

#include <a_samp>

/*NATIVES:
Chat:
ClearPlayerChat(playerid, lines)
ClearChatForAll(lines)

Sounds:
PlayerSoundForAll(sound)
PlayAmbientSound(sound, Float:X, Float:Y, Float:Z)
PlayAmbientSoundOnPlayer(playerid, sound)

Player:
PlayerBubbleAction(playerid, action[])
CrashPlayer(playerid)

Pickups:
CreatePickupInfoLabel(model, type, Float:X, Float:Y, Float:Z, Float:DrawDistance, Virtualworld, text[], color)

*/

/*CHAT*/
stock ClearPlayerChat(playerid, lines)
{
    for(new i = 0; i < lines; i++)
    {
        SendClientMessage(playerid, COLOR_WHITE, "");
    }
}

stock ClearChatForAll(lines)
{
    for(new i = 0; i < lines; i++)
    {
        SendClientMessageToAll(COLOR_WHITE, "");
    }
}

/*SOUNDS*/
stock PlayerSoundForAll(sound)
{
    for(new i = 0; i < MAX_PLAYERS; i++) PlayerPlaySound(i, sound, 0.0, 0.0, 0.0);
} 

PlayAmbientSound(sound, Float:X, Float:Y, Float:Z)
{
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        PlayerPlaySound(i, sound, X, Y, Z);
    }
    return 1;
}

PlayAmbientSoundOnPlayer(playerid, sound)
{
    new Float:Px, Float:Py, Float:Pz;
    GetPlayerPos(playerid, px, py, pz);
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        PlayerPlaySound(i, sound, Px, Py, Pz);
    }
    return 1;
}

/*PLAYER*/
stock PlayerBubbleAction(playerid, action[])
{
    new _str_text[145];
    format(_str_text, 145, "\n\n\n\n* %s", action);
    SetPlayerChatBubble(playerid, str_text, 0x13CBECFF, 20.0, 5000);
    return 1;
}


stock CrashPlayer(playerid)
{
    ApplyAnimation(playerid,"crashplayer", "autils", 4.0, 1, 0, 0, 0, 0);
    GameTextForPlayer(playerid, "•¤¶§!$$&'()*+,-./+1{5{01~!@#$^&*()_%-+={[}]:;'<,>.?/", 1000, 0);
    ApplyAnimation(playerid,"autils", "crash", 4.0, 1, 0, 0, 0, 0);
    GameTextForPlayer(playerid, "•¤¶§!$$&'()*+,-./+1{5{01~!@#$^&*()_%-+={[}]:;'<,>.?/", 2000, 1);
    ApplyAnimation(playerid,"crash", "autils", 4.0, 1, 0, 0, 0, 0);
    GameTextForPlayer(playerid, "•¤¶§!$$&'()*+,-./+1{5{01~!@#$^&*()_%-+={[}]:;'<,>.?/", 3000, 2);
    ApplyAnimation(playerid,"crash", "autils", 4.0, 1, 0, 0, 0, 0);
    GameTextForPlayer(playerid, "•¤¶§!$$&'()*+,-./+1{5{01~!@#$^&*()_%-+={[}]:;'<,>.?/", 4000, 3);
    ApplyAnimation(playerid,"autils", "crash", 4.0, 1, 0, 0, 0, 0);
    GameTextForPlayer(playerid, "•¤¶§!$$&'()*+,-./+1{5{01~!@#$^&*()_%-+={[}]:;'<,>.?/", 5000, 4);
    ApplyAnimation(playerid,"crash", "autils", 4.0, 1, 0, 0, 0, 0);
    GameTextForPlayer(playerid, "•¤¶§!$$&'()*+,-./+1{5{01~!@#$^&*()_%-+={[}]:;'<,>.?/", 6000, 5);
    ApplyAnimation(playerid,"crashplayer", "autils", 4.0, 1, 0, 0, 0, 0);
    GameTextForPlayer(playerid, "•¤¶§!$$&'()*+,-./+1{5{01~!@#$^&*()_%-+={[}]:;'<,>.?/", 7000, 6);
    ApplyAnimation(playerid,"crashplayer", "autils", 4.0, 1, 0, 0, 0, 0);
    return 1;
}

/*PICKUPS*/
stock CreatePickupInfoLabel(model, type, Float:X, Float:Y, Float:Z, Float:DrawDistance, Virtualworld, text[], color)
{
   CreatePickup(model, type, X, Y, Z, Virtualworld);
   Create3DTextLabel(text, color, X, Y, Z, DrawDistance, Virtualworld);
   return 1;
}