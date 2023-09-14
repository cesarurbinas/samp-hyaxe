#define MAX_PROPERTIES 3333
enum Property_Info_Enum
{
	property_VALID,
	property_ID,
	Float:property_EXT_X,
	Float:property_EXT_Y,
	Float:property_EXT_Z,
	Float:property_EXT_ANGLE,
	property_EXT_INTERIOR,
	property_EXT_FREEZE,
	property_ID_INTERIOR,

	bool:property_SOLD,
	bool:property_CREW,
	property_OWNER_ID,
	property_CREW_ID,
	property_NAME[24],
	property_PRICE,
	property_LEVEL,
	property_EXTRA,
	property_VIP_LEVEL,

	Text3D:property_EXT_LABEL_ID,
	property_EXT_PICKUP_ID,
	property_INT_PICKUP_ID,

	property_PRICE_BASE
};
new PROPERTY_INFO[MAX_PROPERTIES][Property_Info_Enum];

/* PROPERTY CONSTRUCTOR */
new TOTAL_PROPERTIES_LOADED;
enum PROPERTY_INTERIOR_ENUM
{
	property_creator_LEVEL,
	property_creator_PRICE,
	Float:property_INT_X,
	Float:property_INT_Y,
	Float:property_INT_Z,
	Float:property_INT_ANGLE,
	property_INT_INTERIOR,
	bool:property_INT_FREEZE
};

// Interiores de casas
new PROPERTY_INTERIORS[][PROPERTY_INTERIOR_ENUM] =
{
	{6, 180000, 140.249008, 1366.197509, 1083.859375, 0.0, 5, false},
	{6, 160000, 2324.530029, -1149.540039, 1050.710083, 0.0, 12, false},
	{6, 270000, 225.679992, 1021.450012, 1084.017700, 0.0, 7, false},
	{6, 190000, 234.190002, 1063.729980, 1084.212280, 0.0, 6, false},
	{6, 120000, 226.300003, 1114.239990, 1080.992919, 270.0, 5, false},
	{6, 180000, 2317.889892, -1026.760009, 1050.217773, 0.0, 9, false},
	{6, 120000, 2495.979980, -1692.079956, 1014.742187, 180.0, 3, false},
	{6, 90000,  2196.626464, -1204.321411, 1049.023437, 90.0, 6, false},
	{6, 105000, 2270.143554, -1210.490600, 1047.562500, 90.0, 10, false},
	{4, 90000,  2365.199951, -1135.595825, 1050.882568, 0.0, 8, false},
	{3, 75000,  2237.590087, -1081.640014, 1049.023437, 0.0, 2, false},
	{4, 65000,  2468.840087, -1698.239990, 1013.507812, 90.0, 2, false},
	{3, 45000,  2282.928955, -1140.004516, 1050.898437, 0.0, 11, false},
	{4, 50000,  2308.775878, -1212.731689, 1049.023437, 0.0, 6, false},
	{6, 135000, 2233.681396, -1114.973510, 1050.882812, 0.0, 5, false},
	{6, 230000, 2218.162597, -1076.148315, 1050.484375, 90.0, 1, false},
	{6, 220000, 266.654327, 304.961791, 999.148437, 270.0, 2, false},
	{6, 30000,  243.720001, 304.910003, 999.148437, 270.0, 1, false},
	{6, 65000,  2259.440673, -1135.905883, 1050.640258, 270.0, 10, false},
	{12, 3000000, 1260.910034, -785.320068, 1091.906250, 280.0, 5, false}
};

enum PLAYER_PROPERTY_CONSTRUCTOR_ENU
{
	bool:player_property_creator_ENABLED,
	player_property_creator_INTERIO,
	Float:player_property_creator_EXT_X,
	Float:player_property_creator_EXT_Y,
	Float:player_property_creator_EXT_Z,
	Float:player_property_creator_EXT_ANG,
	player_property_creator_EXT_INT
};
new PLAYER_PROPERTY_CONSTRUCTOR[MAX_PLAYERS][PLAYER_PROPERTY_CONSTRUCTOR_ENU];

enum
{
	PICKUP_TYPE_NONE,
	PICKUP_TYPE_ENTER_EXIT,
	PICKUP_TYPE_ATM,
	PICKUP_TYPE_PROPERTY,
	PICKUP_TYPE_CLUB,
	PICKUP_TYPE_MONEY,
	PICKUP_TYPE_DRUG
};