#if defined CORE_PLAYER_FLAGS_H_
	#endinput
#endif

#define CORE_PLAYER_FLAGS_H_

enum (<<= 1)
{
	e_bmPlayerDead = 1
};

new
	g_rgbitsPlayerFlags[MAX_PLAYERS];