#if defined DAMAGE_TIMERS
	#endinput
#endif

#define DAMAGE_TIMERS

forward TIMER_RemoveDamageInformer(playerid);
public TIMER_RemoveDamageInformer(playerid)
{
	Damage_ResetInformer(playerid);
	return 1;
}