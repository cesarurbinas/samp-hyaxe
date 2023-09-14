#if defined CORE_NOTIFICATIONS_H_
	#endinput
#endif

#define CORE_NOTIFICATIONS_H_

#define MAX_NOTIFICATIONS 					3
#define MAX_NOTIFICATIONS_WAITING_MSGS 		30

#define NOTIFICATION_BAR_START				167
#define NOTIFICATION_BAR_END 				8
#define NOTIFICATION_LIMIT_TEXT 			38

new
	g_iNotificationCount_0[MAX_PLAYERS char],
	g_iNotificationCount_1[MAX_PLAYERS char],
	g_iNotificationCount_2[MAX_PLAYERS char],

	//g_iNotificationJumps_0[MAX_PLAYERS char],
	//g_iNotificationJumps_1[MAX_PLAYERS char],
	//g_iNotificationJumps_2[MAX_PLAYERS char],

	g_rgszNotificationWaitingList[MAX_PLAYERS][MAX_NOTIFICATIONS_WAITING_MSGS][256 char],
	
	Float:g_iNotificationOffset_0[MAX_PLAYERS],
	Float:g_iNotificationOffset_1[MAX_PLAYERS],
	Float:g_iNotificationOffset_2[MAX_PLAYERS],

	Float:g_iNotificationBg2Size_0[MAX_PLAYERS],
	Float:g_iNotificationBg2Size_1[MAX_PLAYERS],
	Float:g_iNotificationBg2Size_2[MAX_PLAYERS],
	
	g_szNotificationText_0[MAX_PLAYERS][250 char],
	g_szNotificationText_1[MAX_PLAYERS][250 char],
	g_szNotificationText_2[MAX_PLAYERS][250 char],

	PlayerText:g_ptdNotificationBg_0[MAX_PLAYERS char],
	PlayerText:g_ptdNotificationBg_1[MAX_PLAYERS char],
	PlayerText:g_ptdNotificationBg_2[MAX_PLAYERS char],
	
	PlayerText:g_ptdNotificationBg2_0[MAX_PLAYERS char],
	PlayerText:g_ptdNotificationBg2_1[MAX_PLAYERS char],
	PlayerText:g_ptdNotificationBg2_2[MAX_PLAYERS char],

	PlayerText:g_ptdNotificationText_0[MAX_PLAYERS char],
	PlayerText:g_ptdNotificationText_1[MAX_PLAYERS char],
	PlayerText:g_ptdNotificationText_2[MAX_PLAYERS char],

	PlayerText:g_ptdNotificationBar_0[MAX_PLAYERS char],
	PlayerText:g_ptdNotificationBar_1[MAX_PLAYERS char],
	PlayerText:g_ptdNotificationBar_2[MAX_PLAYERS char];