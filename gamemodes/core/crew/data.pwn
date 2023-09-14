// Crews
#define MAX_CREWS       500
#define MAX_CREW_RANKS   10

enum enum_CREW_INFO
{
	bool:crew_VALID,
	crew_ID,
	crew_NAME[32],
	crew_DESCRIPTION[32],
	crew_COLOR,

	bool:crew_FIGHTING,
	crew_LAST_ATTACK,

	crew_GRAFFITI_PROGRESS,
	bool:crew_IN_GRAFFITI,
	crew_GRAFFITIS_COUNT,

	crew_MARKET_PROGRESS,
	bool:crew_IN_MARKET,
	crew_MARKET_COUNT,

	crew_MEMBERS,
	crew_ONLINE_MEMBERS
};
new CREW_INFO[MAX_CREWS][enum_CREW_INFO];

new CrewColors[] =
{
	0x3563e9FF,
	0xe93535FF,
	0xe7e53cFF,
	0xa43ce7FF,
	0x6ad64cFF,
	0xFF8A00FF,
	0x6bc3fcFF
};

new CrewNameColors[][] =
{
	"Azul",
	"Rojo",
	"Amarillo",
	"Morado",
	"Verde",
	"Naranja",
	"Celeste"
};