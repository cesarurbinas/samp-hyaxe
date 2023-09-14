#include <Discord.CMD>

DISCORD:id(user, args)
{
    new to_player;
	if (sscanf(args, "u", to_player)) return DiscordReply("756714765920763925", ":warning: Uso: `!id <id o nombre>`");
	if (!IsPlayerConnected(to_player)) return DiscordReply("756714765920763925", ":x: Jugador desconectado");

	new
		str_text[164],
		player_version[32],
		acid
	;

	GetPlayerVersion(to_player, player_version, sizeof player_version);

	if (ACCOUNT_INFO[to_player][ac_ID] == 0)
	{
		acid = minrand(80000, 90000);
	}
	else acid = ACCOUNT_INFO[to_player][ac_ID];

	format(str_text, sizeof(str_text), "• Nombre: %s (%d) [Nivel %d] | ID de cuenta: %d\n• Versión: %s | PacketLoss: %.2f | Ping: %d",
		PLAYER_TEMP[to_player][py_NAME],
		to_player,
		GetPlayerScore(to_player),
		acid,
		player_version,
		NetStats_PacketLossPercent(to_player),
		GetPlayerPing(to_player)
	);

	DiscordReply("756714765920763925", str_text);
    return 1;
}