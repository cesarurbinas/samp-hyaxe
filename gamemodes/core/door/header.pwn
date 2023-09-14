// Barrier
enum San_Andreas_Barriers_Info
{
	barrier_VEHICLE_TYPE,
	barrier_VEHICLE_TYPE_IN,
	Float:barrier_X,
	Float:barrier_Y,
	Float:barrier_Z,
	Float:barrier_ROTATION,
	barrier_INTERIOR,
	barrier_WORLD,
	barrier_OBJECT_ID,
	barrier_TIMER,
	bool:barrier_CLOSING
};
new San_Andreas_Barriers[][San_Andreas_Barriers_Info] = // usar VEHICLE_TYPE_NONE para que puedan pasar todos
{
	{VEHICLE_TYPE_WORK, WORK_NONE, -495.0410, -562.1307, 24.4932, 180.0, 0, 0, INVALID_STREAMER_ID, -1, false}, // barrera camioneros
	{VEHICLE_TYPE_WORK, WORK_POLICE, 1544.69629, -1630.79651, 12.31840, -90.0, 0, 0, INVALID_STREAMER_ID, -1, false}, // barrera POLICIA LS
	{VEHICLE_TYPE_WORK, WORK_POLICE, 2238.19897, 2450.41797, 9.80680, -90.0, 0, 0, INVALID_STREAMER_ID, -1, false}, // barrera POLICIA LV
	{VEHICLE_TYPE_WORK, WORK_POLICE, -1572.20313, 658.83588, 6.07810, -90.0, 0, 0, INVALID_STREAMER_ID, -1, false}, // barrera POLICIA SF 1
	{VEHICLE_TYPE_WORK, WORK_POLICE, -1701.42969, 687.59381, 23.88280, 90.0, 0, 0, INVALID_STREAMER_ID, -1, false}, // barrera POLICIA SF 2
	{VEHICLE_TYPE_NONE, WORK_NONE, -1526.39063, 481.38281, 6.17970, 0.0, 0, 0, INVALID_STREAMER_ID, -1, false}, // ejercito??
	{VEHICLE_TYPE_NONE, WORK_NONE, -82.1645, -1123.0260, 0.0373, 67.1102, 0, 0, INVALID_STREAMER_ID, -1, false} // grua
};

// Mafia doors
enum
{
	DOOR_TYPE_ALL,
	DOOR_TYPE_MAFIA,
	DOOR_TYPE_USER,
	DOOR_TYPE_CREW
}

enum enum_MAFIA_DOORS
{
	mafia_door_MODELID,
	Float:mafia_door_X,
	Float:mafia_door_Y,
	Float:mafia_door_Z,
	Float:mafia_door_RZ,
	mafia_door_INTERIOR,
	mafia_door_WORLD,
	bool:mafia_door_CLOSED,
	mafia_door_TYPE,
	mafia_door_MAFIA,
	mafia_door_OBJECT_ID,
	mafia_door_TIMER
};
new MAFIA_DOORS[][enum_MAFIA_DOORS] =
{
	{980, 210.82076, -1350.47852, 52.72700, 41.00000, 0, 0, true, DOOR_TYPE_USER, 9482, INVALID_STREAMER_ID, -1}
};