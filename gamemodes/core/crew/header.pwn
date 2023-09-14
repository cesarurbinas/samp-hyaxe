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
	0x6bc3fcFF,
	0xFFFFFFFF,
	0x7CD895FF
};

new CrewNameColors[][] =
{
	"Azul",
	"Rojo",
	"Amarillo",
	"Morado",
	"Verde",
	"Naranja",
	"Celeste",
	"Blanco",
	"Lima"
};

#define MAX_TERRITORIES 100
enum enum_TERRITORIES
{
	bool:territory_VALID,
	territory_ID,
	territory_NAME[32],
	bool:territory_OCCUPIED,
	territory_CREW_ID,
	territory_CREW_INDEX,
	territory_COLOR,
	Float:territory_MIN_X,
	Float:territory_MIN_Y,
	Float:territory_MIN_Z,
	Float:territory_MAX_X,
	Float:territory_MAX_Y,
	Float:territory_MAX_Z,

	territory_AREA,
	territory_GANG_ZONE,

	bool:territory_WAR,
	territory_ATTACKER_CREW_INDEX,
	territory_WAR_TIME_LEFT,
	Text:territory_TEXTDRAW,
	territory_TIMER,
	territory_LAST_ATTACK
};
new TERRITORIES[MAX_TERRITORIES][enum_TERRITORIES];

/*
Permisos de rangos

0 - cambiar nombre
1 - invitar
2 - echar
3 - cambiar rango de miembros
4 - crear rangos y modificar rangos
5 - poner casas personales a casas de crew
6 - vender casas de crew
7 - cambiar color de la crew
8 - abandonar territorio
9 - destruir ccrew
*/

//permisos
enum
{
	CREW_RANK_CHANGE_NAME,
	CREW_RANK_INVITE,
	CREW_RANK_CAST_MEMBERS,
	CREW_RANK_MODIFY_MEMBERS,
	CREW_RANK_MODIFY_RANKS,
	CREW_RANK_ADD_PROPERTIES,
	CREW_RANK_DELETE_PROPERTIES,
	CREW_RANK_CHANGE_COLOR,
	CREW_RANK_LEAVE_TERRITORY,
	CREW_RANK_DELETE,

	CREW_RANK_SIZE // dejar siempre el ultimo
};

new CREW_RANKS_PERMISSIONS[][] =
{
	"cambiar nombre y descripcion",
	"invitar jugadores",
	"expulsar miembros",
	"cambiar rangos de miembros",
	"crear rangos o modificarlos",
	"poner propiedades de crew",
	"liberar propiedades de crew",
	"cambiar color de la crew",
	"abandonar territorios",
	"eliminar crew"
};

enum enum_CREW_RANK_INFO
{
	bool:crew_rank_VALID,
	crew_rank_ID,
	crew_rank_NAME[32],
	crew_rank_PERMISSION[CREW_RANK_SIZE]
};
new CREW_RANK_INFO[MAX_CREWS][MAX_CREW_RANKS][enum_CREW_RANK_INFO];