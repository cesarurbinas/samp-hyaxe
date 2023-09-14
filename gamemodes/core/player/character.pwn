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