//aNotifications by Atom

#if defined _anotitications_included
    #endinput
#endif
#define _anotitications_included

#include <a_samp>

static
    PlayerText:NOTIFICATION_MESSAGE[MAX_PLAYERS][4],
    NotificationSlot[MAX_PLAYERS][3],
    NotificationTime[MAX_PLAYERS][3];

public OnPlayerConnect(playerid)
{
    NOTIFICATION_MESSAGE[playerid][0] = CreatePlayerTextDraw(playerid,15.000000, 295.000000, "_");
    PlayerTextDrawBackgroundColor(playerid,NOTIFICATION_MESSAGE[playerid][0], 0x00000088);
    PlayerTextDrawFont(playerid,NOTIFICATION_MESSAGE[playerid][0], 1);
    PlayerTextDrawLetterSize(playerid,NOTIFICATION_MESSAGE[playerid][0], 0.268999, 1.419165);
    PlayerTextDrawColor(playerid,NOTIFICATION_MESSAGE[playerid][0], -1);
    PlayerTextDrawSetOutline(playerid,NOTIFICATION_MESSAGE[playerid][0], 0);
    PlayerTextDrawSetProportional(playerid,NOTIFICATION_MESSAGE[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid,NOTIFICATION_MESSAGE[playerid][0], 0);
    PlayerTextDrawUseBox(playerid,NOTIFICATION_MESSAGE[playerid][0], 1);
    PlayerTextDrawBoxColor(playerid,NOTIFICATION_MESSAGE[playerid][0], 0x00000088);
    PlayerTextDrawTextSize(playerid,NOTIFICATION_MESSAGE[playerid][0], 142.000000, 0.000000);
    PlayerTextDrawSetSelectable(playerid,NOTIFICATION_MESSAGE[playerid][0], 0);

    NOTIFICATION_MESSAGE[playerid][1] = CreatePlayerTextDraw(playerid,15.000000, 246.000000, "_");
    PlayerTextDrawBackgroundColor(playerid,NOTIFICATION_MESSAGE[playerid][1], 0x00000088);
    PlayerTextDrawFont(playerid,NOTIFICATION_MESSAGE[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid,NOTIFICATION_MESSAGE[playerid][1], 0.268999, 1.419165);
    PlayerTextDrawColor(playerid,NOTIFICATION_MESSAGE[playerid][1], -1);
    PlayerTextDrawSetOutline(playerid,NOTIFICATION_MESSAGE[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid,NOTIFICATION_MESSAGE[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid,NOTIFICATION_MESSAGE[playerid][1], 0);
    PlayerTextDrawUseBox(playerid,NOTIFICATION_MESSAGE[playerid][1], 1);
    PlayerTextDrawBoxColor(playerid,NOTIFICATION_MESSAGE[playerid][1], 0x00000088);
    PlayerTextDrawTextSize(playerid,NOTIFICATION_MESSAGE[playerid][1], 142.000000, 0.000000);
    PlayerTextDrawSetSelectable(playerid,NOTIFICATION_MESSAGE[playerid][1], 0);

    NOTIFICATION_MESSAGE[playerid][2] = CreatePlayerTextDraw(playerid,15.000000, 197.000000, "_");
    PlayerTextDrawBackgroundColor(playerid,NOTIFICATION_MESSAGE[playerid][2], 0x00000088);
    PlayerTextDrawFont(playerid,NOTIFICATION_MESSAGE[playerid][2], 1);
    PlayerTextDrawLetterSize(playerid,NOTIFICATION_MESSAGE[playerid][2], 0.268999, 1.419165);
    PlayerTextDrawColor(playerid,NOTIFICATION_MESSAGE[playerid][2], -1);
    PlayerTextDrawSetOutline(playerid,NOTIFICATION_MESSAGE[playerid][2], 0);
    PlayerTextDrawSetProportional(playerid,NOTIFICATION_MESSAGE[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid,NOTIFICATION_MESSAGE[playerid][2], 0);
    PlayerTextDrawUseBox(playerid,NOTIFICATION_MESSAGE[playerid][2], 1);
    PlayerTextDrawBoxColor(playerid,NOTIFICATION_MESSAGE[playerid][2], 0x00000088);
    PlayerTextDrawTextSize(playerid,NOTIFICATION_MESSAGE[playerid][2], 142.000000, 0.000000);
    PlayerTextDrawSetSelectable(playerid,NOTIFICATION_MESSAGE[playerid][2], 0);

    NOTIFICATION_MESSAGE[playerid][3] = CreatePlayerTextDraw(playerid, 320.000000, 370.833435, "_");
    PlayerTextDrawLetterSize(playerid, NOTIFICATION_MESSAGE[playerid][3], 0.236499, 1.057499);
    PlayerTextDrawAlignment(playerid, NOTIFICATION_MESSAGE[playerid][3], 2);
    PlayerTextDrawColor(playerid, NOTIFICATION_MESSAGE[playerid][3], -1);
    PlayerTextDrawSetShadow(playerid, NOTIFICATION_MESSAGE[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, NOTIFICATION_MESSAGE[playerid][3], 1);
    PlayerTextDrawBackgroundColor(playerid, NOTIFICATION_MESSAGE[playerid][3], 255);
    PlayerTextDrawFont(playerid, NOTIFICATION_MESSAGE[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, NOTIFICATION_MESSAGE[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, NOTIFICATION_MESSAGE[playerid][3], 0); 
    
    #if defined NOT_OnPlayerConnect
        return NOT_OnPlayerConnect(playerid);
    #else
        return 1;
    #endif
}

public OnPlayerDisconnect(playerid, reason)
{
    PlayerTextDrawDestroy(playerid, NOTIFICATION_MESSAGE[playerid][0]);
    PlayerTextDrawDestroy(playerid, NOTIFICATION_MESSAGE[playerid][1]);
    PlayerTextDrawDestroy(playerid, NOTIFICATION_MESSAGE[playerid][2]);
    PlayerTextDrawDestroy(playerid, NOTIFICATION_MESSAGE[playerid][3]);
    
    #if defined NOT_OnPlayerDisconnect
        return NOT_OnPlayerDisconnect(playerid, reason);
    #else
        return 1;
    #endif
}

stock SendPlayerNotification(playerid,text_[])
{
    if (NotificationSlot[playerid][0] == 0) 
    {
        PlayerTextDrawSetString(playerid,NOTIFICATION_MESSAGE[playerid][2], text_);
        PlayerTextDrawShow(playerid,NOTIFICATION_MESSAGE[playerid][2]); 
        NotificationSlot[playerid][0] = 1; 
        NotificationTime[playerid][0] = SetTimerEx("hideNotificationInSlot1", 7000, 0,"d",playerid); 
    }
    else if (NotificationSlot[playerid][1] == 0) 
    {
        PlayerTextDrawSetString(playerid,NOTIFICATION_MESSAGE[playerid][1], text_);
        PlayerTextDrawShow(playerid,NOTIFICATION_MESSAGE[playerid][1]); 
        NotificationSlot[playerid][1] = 1; 
        NotificationTime[playerid][1] = SetTimerEx("hideNotificationInSlot2", 7000, 0,"d",playerid); 
    }
    else if (NotificationSlot[playerid][2] == 0) 
    {
        PlayerTextDrawSetString(playerid,NOTIFICATION_MESSAGE[playerid][0], text_);
        PlayerTextDrawShow(playerid,NOTIFICATION_MESSAGE[playerid][0]); 
        NotificationSlot[playerid][2] = 1; 
        NotificationTime[playerid][2] = SetTimerEx("hideNotificationInSlot3", 7000, 0,"d",playerid);
        return 1;
    }
    if(NotificationSlot[playerid][0] == 1 && NotificationSlot[playerid][1] == 1 && NotificationSlot[playerid][2] == 1)
    {
        PlayerTextDrawSetString(playerid,NOTIFICATION_MESSAGE[playerid][3], text_);
        PlayerTextDrawShow(playerid,NOTIFICATION_MESSAGE[playerid][3]); 
        NotificationTime[playerid][2] = SetTimerEx("hideNotificationInSlot4", 7000, 0,"d",playerid); 
    }
    return 1;
}

forward hideNotificationInSlot1(playerid);
public hideNotificationInSlot1(playerid)
{
    PlayerTextDrawHide(playerid,NOTIFICATION_MESSAGE[playerid][2]); 
    NotificationSlot[playerid][0] = 0; 
    return 1;
}

forward hideNotificationInSlot2(playerid);
public hideNotificationInSlot2(playerid)
{
    PlayerTextDrawHide(playerid,NOTIFICATION_MESSAGE[playerid][1]); 
    NotificationSlot[playerid][1] = 0; 
    return 1;
}

forward hideNotificationInSlot3(playerid);
public hideNotificationInSlot3(playerid)
{
    PlayerTextDrawHide(playerid,NOTIFICATION_MESSAGE[playerid][0]); 
    NotificationSlot[playerid][2] = 0; 
    return 1;
}

forward hideNotificationInSlot4(playerid);
public hideNotificationInSlot4(playerid)
{
    PlayerTextDrawHide(playerid,NOTIFICATION_MESSAGE[playerid][3]); 
    NotificationSlot[playerid][2] = 0; 
    return 1;
}

#if defined _ALS_OnPlayerConnect
    #undef OnPlayerConnect
#else
    #define _ALS_OnPlayerConnect
#endif
#define OnPlayerConnect NOT_OnPlayerConnect
#if defined NOT_OnPlayerConnect
    forward NOT_OnPlayerConnect(playerid);
#endif

#if defined _ALS_OnPlayerDisconnect
    #undef OnPlayerDisconnect
#else
    #define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect NOT_OnPlayerDisconnect
#if defined NOT_OnPlayerDisconnect
    forward NOT_OnPlayerDisconnect(playerid, reason);
#endif