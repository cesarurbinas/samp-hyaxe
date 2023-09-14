#define MAX_VEHICLE_COMPONENTS 14

enum
{
	VEHICLE_TYPE_NONE,
	VEHICLE_TYPE_TEST,
	VEHICLE_TYPE_SELL,
	VEHICLE_TYPE_PERSONAL,
	VEHICLE_TYPE_WORK,
	VEHICLE_TYPE_RENT
};

enum
{
	VEHICLE_STATE_NORMAL,
	VEHICLE_STATE_DAMAGED
};

enum Global_Vehicles_Info
{
	bool:gb_vehicle_VALID,
	bool:gb_vehicle_OCCUPIED,
	gb_vehicle_TYPE,
	gb_vehicle_MODELID,
	gb_vehicle_NUMBER_PLATE[32],
	Float:gb_vehicle_POS[3],
	Float:gb_vehicle_SPAWN_X,
	Float:gb_vehicle_SPAWN_Y,
	Float:gb_vehicle_SPAWN_Z,
	Float:gb_vehicle_SPAWN_ANGLE,
	Float:gb_vehicle_HEALTH,
	gb_vehicle_DAMAGE_PANELS,
	gb_vehicle_DAMAGE_DOORS,
	gb_vehicle_DAMAGE_LIGHTS,
	gb_vehicle_DAMAGE_TIRES,
	gb_vehicle_COLOR_1,
	gb_vehicle_COLOR_2,
	gb_vehicle_PAINTJOB,
	Float:gb_vehicle_GAS,
	Float:gb_vehicle_MAX_GAS,
	gb_vehicle_COMPONENTS[MAX_VEHICLE_COMPONENTS],
	gb_vehicle_STATE,
	gb_vehicle_INTERIOR,
	gb_vehicle_WORLD,
	gb_vehicle_PARAMS_ENGINE,
	gb_vehicle_PARAMS_LIGHTS,
	gb_vehicle_PARAMS_ALARM,
	gb_vehicle_PARAMS_DOORS,
	gb_vehicle_PARAMS_BONNET,
	gb_vehicle_PARAMS_BOOT,
	gb_vehicle_PARAMS_OBJECTIVE,
	gb_vehicle_DRIVER,
	gb_vehicle_LAST_DRIVER,
	gb_vehicle_LAST_CLOSED_TIME,
	gb_vehicle_LAST_REPAIR_TIME,

	bool:gb_vehicle_SPAWNED,
	gb_vehicle_TP_IMMUNITY,
	gp_vehicle_vip,
	gb_vehicle_ATTACHED_TO,
	Text3D:gb_vehicle_LABEL
};
new GLOBAL_VEHICLES[MAX_VEHICLES][Global_Vehicles_Info];