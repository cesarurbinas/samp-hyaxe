enum E_MISC_DATA {
	MISC_MUTES,
	MISC_KIKEOS,
	MISC_BANEOS,
	MISC_SANS,
	MISC_JAILS,
	MISC_MECHANIC_PIECES,
	MISC_FUEL_DRUM,
	MISC_SEED_MEDICINE,
	MISC_SEED_CANNABIS,
	MISC_SEED_CRACK,
	MISC_CUETE,
	MISC_MEDICINE,
	MISC_VENDAS,
	MISC_BOTIKIN,
	MISC_BONUZ,
	MISC_CANNABIS,
	MISC_CRACK,
	MISC_CONFIG_SOUNDS,
	MISC_CONFIG_AUDIO,
	bool:MISC_CONFIG_LOWPC,
	MISC_CONFIG_HUD,
	MISC_CONFIG_ADMIN,
	MISC_MUTE,
	MISC_PLACA_PD,
	MISC_SEARCH_LEVEL,
	MISC_LAST_WORLD,
	MISC_STATS_GET,
	MISC_CARTRIDGE_1, // ROJA PISTOLAS
	MISC_CARTRIDGE_2, // AMARILLA ESCOPETA
	MISC_CARTRIDGE_3, // VERDE RIFLE
	MISC_CARTRIDGE_4, // AZUL SUBFUSIC
	MISC_ROD,
	MISC_FISH,
	MISC_MHZ,
	MISC_VOICE_KEY,
	MISC_RADIO_STATION,
	MISC_MALLET,
	MISC_FIXKIT,
	MISC_CONFIG_FP,
	bool:MISC_BALLOON,
	bool:MISC_DAMAGE_INFORMER,
	MISC_DOUBT_SENT,
	MISC_JOINT,
	MISC_GEO,
	MISC_DNI,
	MISC_DRIVE
};
new PLAYER_MISC[MAX_PLAYERS][E_MISC_DATA];