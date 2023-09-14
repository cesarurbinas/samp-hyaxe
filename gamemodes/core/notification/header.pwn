#if defined CORE_NOTIFICATIONS_H_
	#endinput
#endif

#define CORE_NOTIFICATIONS_H_

#define MAX_NOTIFICATIONS_WAITING_MSGS 		30

enum waiting_notifications_enum {
	bool:wn_VALID,
	wn_TEXT[264],
	wn_TIME,
	wn_SOUND
};
new 
	WAITING_NOTIFICATIONS[MAX_PLAYERS][waiting_notifications_enum],
	PlayerText:g_ptdNotification[MAX_PLAYERS char],
	bool:g_ActiveNotification[MAX_PLAYERS]
;