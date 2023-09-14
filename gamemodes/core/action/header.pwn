#define ACTION_RESPONSE_NO_CHOOSE	(-1)
#define ACTION_RESPONSE_NO			(0)
#define ACTION_RESPONSE_YES			(1)

#define ACTION_TIMER_UPDATE_RATE	(80)

#define ACTION_SOUND_MENU			(0)

#define ACTION_FREEZE_PLAYER		(0)

#define Action:%0(%1,%2) \
	forward TDA_%0(%1,%2);public TDA_%0(%1,%2)

enum E_TEXTDRAW_ACTIONS
{
	tda_action_name[32],
	tda_action_timer,
	tda_action_ms,
	Float:tda_action_percent,
}
new g_PlayerActionsData[MAX_PLAYERS][E_TEXTDRAW_ACTIONS];
new PlayerText:g_PlayerActionsTD[MAX_PLAYERS][7];