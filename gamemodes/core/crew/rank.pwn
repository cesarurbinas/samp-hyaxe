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