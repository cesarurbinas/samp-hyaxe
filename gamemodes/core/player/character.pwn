enum
{
	SEX_MALE,
	SEX_FEMALE
};

enum Character_Enum
{
	ch_SKIN,
	ch_CASH,
	Float:ch_POS[3],
	Float:ch_ANGLE,
	ch_STATE,
	ch_INTERIOR,
	ch_INTERIOR_EXTRA,
	ch_WORLD,
	ch_FIGHT_STYLE,
	Float:ch_HEALTH,
	Float:ch_ARMOUR,
	ch_SEX,
	Float:ch_HUNGRY,
	Float:ch_THIRST,
	ch_BLACK_MARKET_LEVEL,
	ch_POLICE_JAIL_TIME,
	ch_POLICE_JAIL_ID, //interior
	ch_JAIL_REASON[65],
	ch_JAILED_BY
};
new CHARACTER_INFO[MAX_PLAYERS][Character_Enum]; // CI (CharacterInfo)

// Player gps
enum
{
	CHECKPOINT_TYPE_NONE,
	CHECKPOINT_TYPE_GPS,
	CHECKPOINT_TYPE_UNLOAD_TRUCK,
	CHECKPOINT_TYPE_FINISH_TRUCK,
	CHECKPOINT_TYPE_HARVEST,
	CHECKPOINT_TYPE_TRASH,
	CHECKPOINT_TYPE_FINISH_TRASH
	//CHECKPOINT_TYPE_CLEANER,
	//CHECKPOINT_TYPE_FINISH_CLEANER
};

enum Player_GPS_Enum
{
	player_gps_VALID,
	player_gps_ID,
	player_gps_NAME[24],
	Float:player_gps_X,
	Float:player_gps_Y,
	Float:player_gps_Z,
	player_gps_WORLD,
	player_gps_INTERIOR
};
new PLAYER_GPS[MAX_PLAYERS][MAX_PLAYER_GPS_SAVES][Player_GPS_Enum];