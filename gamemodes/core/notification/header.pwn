#define MAX_NOTIFICATIONS 10

enum notification_enum
{
	nt_ID,
	PlayerText:nt_TD,
	PlayerText:nt_BG_TD,
	nt_TEXT[128],
	nt_POS[2],
	nt_TIME_OUT,
	nt_TIMER
}

new
	NotificationData[MAX_PLAYERS][MAX_NOTIFICATIONS][notification_enum],
	LastNotificationID = 0
;