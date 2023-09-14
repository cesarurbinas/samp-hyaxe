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

enum VEHICLE_INFO_enum
{
	bool:vehicle_info_VALID,
	vehicle_info_NAME[24],
	Float:vehicle_info_MAX_GAS, // Por defecto
	Float:vehicle_info_MAX_VEL,
	vehicle_info_PRICE,
	vehicle_info_LEVEL,
	vehicle_info_EXTRA,
	vehicle_info_BOOT_SLOTS,
	vehicle_info_SEATS,
	bool:vehicle_info_ENGINE,
	bool:vehicle_info_DRIVER_DOOR,
	bool:vehicle_info_PASSENGER_DOOR,
	vehicle_info_VIP_LEVEL,
	vehicle_info_COINS,
	bool:vehicle_info_MECHANIC_TRAILER
};
new VEHICLE_INFO[][VEHICLE_INFO_enum] =
{
    {true, "Landstalker", 80.0, 159.00, 50000, 6, 0, 10         , 4     , true, true, true, 0, 0, true},
    {true, "Bravura", 45.0, 148.00, 25000, 4, 0, 6              , 2     , true, true, true, 0, 0, true},
    {true, "Buffalo", 50.0, 188.00, 150000, 8, 0, 6             , 2     , true, true, true, 0, 0, true},
    {true, "Linerunner", 150.0, 110.00, 40000, 30, 0, 0         , 2     , true, true, true, 0, 0, false},
    {true, "Perrenial", 50.0, 134.00, 5000, 2, 0, 10            , 4     , true, true, true, 0, 0, true},
    {true, "Sentinel", 45.0, 165.00, 12000, 2, 0, 6             , 4     , true, true, true, 0, 0, true},
    {true, "Dumper", 20.0, 111.00, 700000, 30, 0, 0             , 1     , true, true, true, 0, 0, false},
    {true, "Firetruck", 120.0, 149.00, 500000, 30, 0, 0         , 2     , true, true, true, 0, 0, false},
    {true, "Trashmaster", 80.0, 101.00, 300000, 30, 0, 0        , 2     , true, true, true, 0, 0, false},
    {true, "Stretch", 80.0, 159.00, 800000, 15, 0, 12           , 4     , true, true, true, 0, 0, true},
    {true, "Manana", 40.0, 131.00, 8000, 2, 0, 4                , 2     , true, true, true, 0, 0, true},
    {true, "Infernus", 80.0, 223.00, 350000, 15, 0, 6           , 2     , true, true, true, 1, 20, true},
    {true, "Voodoo", 45.0, 170.00, 25000, 6, 0, 4               , 2     , true, true, true, 0, 0, true},
    {true, "Pony", 60.0, 111.00, 30000, 6, 0, 12                , 4     , true, true, true, 0, 0, false},
    {true, "Mule", 60.0, 106.00, 30000, 8, 0, 0                 , 2     , true, true, true, 0, 0, false},
    {true, "Cheetah", 65.0, 194.00, 20000, 15, 0, 4             , 2     , true, true, true, 1, 15, true},
    {true, "Ambulance", 120.0, 155.00, 600000, 30, 0, 0         , 4     , true, true, true, 0, 0, false},
    {false, "Leviathan", 1.0, 1.00, 1500000, 30, 0, 0           , 2     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Moonbeam", 60.0, 116.00, 16000, 2, 0, 12            , 4     , true, true, true, 0, 0, false},
    {true, "Esperanto", 40.0, 150.00, 20000, 3, 0, 5            , 2     , true, true, true, 0, 0, true},
    {true, "Taxi", 60.0, 146.00, 80000, 8, 0, 8                 , 4     , true, true, true, 0, 0, true}, // >>>> No.
    {true, "Washington", 50.0, 155.00, 15000, 2, 0, 6           , 4     , true, true, true, 0, 0, true},
    {true, "Bobcat", 70.0, 141.00, 20000, 6, 0, 8               , 2     , true, true, true, 0, 0, true},
    {true, "MrWhoopee", 60.0, 99.00, 30000, 15, 0, 0            , 2     , true, true, true, 0, 0, false},
    {true, "BFInjection", 30.0, 136.00, 20000, 12, 0, 4         , 2     , true, true, false, 1, 20, true},
    {false, "Hunter", 1.0, 1.00, 3000000, 30, 0, 0              , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Premier", 70.0, 175.00, 21000, 3, 0, 6              , 4     , true, true, true, 0, 0, true},
    {true, "Enforcer", 120.0, 167.00, 200000, 16, 0, 0          , 4     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Securicar", 80.0, 158.00, 150000, 15, 0, 12         , 4     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Banshee", 65.0, 203.00, 20000, 15, 0, 4             , 2     , true, true, true, 1, 15, true},
    {false, "Predator", 1.0, 1.00, 80000, 10, 0, 0              , 1     , true, true, true, 0, 0, false},
    {true, "Bus", 180.0, 131.00, 500000, 20, 0, 20              , 500   , true, true, true, 0, 0, false},
    {true, "Rhino", 200.0, 95.00, 10000000, 100, 0, 0           , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Barracks", 150.0, 111.00, 600000, 80, 0, 0          , 2     , true, true, true, 0, 0, false},
    {true, "Hotknife", 50.0, 168.00, 300000, 15, 0, 4           , 2     , true, true, true, 0, 0, true}, // >>>> No.
    {false, "Trailer1", 1.0, 1.00, 50000, 5, 0, 0               , 0     , false, false, false, 0, 0, false}, // >>>> No.
    {true, "Previon", 40.0, 150.00, 8000, 2, 0, 6               , 2     , true, true, true, 0, 0, true},
    {true, "Coach", 150.0, 159.00, 450000, 30, 0, 20            , 500   , true, true, true, 0, 0, false},
    {true, "Cabbie", 80.0, 144.00, 54000, 5, 0, 6               , 4     , true, true, true, 0, 0, true}, // >>>> No.
    {true, "Stallion", 60.0, 170.00, 15000, 2, 0, 6             , 2     , true, true, true, 0, 0, true},
    {true, "Rumpo", 60.0, 137.00, 20000, 5, 0, 12               , 4     , true, true, true, 0, 0, false},
    {false, "RCBandit", 1.0, 1.00, 500, 1, 0, 0                 , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Romero", 60.0, 140.00, 80000, 10, 0, 0              , 2     , true, true, true, 0, 0, true},
    {true, "Packer", 150.0, 127.00, 500000, 15, 0, 0            , 2     , true, true, true, 0, 0, false},
    {true, "Monster", 80.0, 111.00, 20000, 20, 0, 20            , 2     , true, true, true, 2, 50, false},
    {true, "Admiral", 65.0, 165.00, 5000, 1, 0, 4               , 4     , true, true, true, 0, 0, true},
    {false, "Squalo", 1.0, 1.00, 20000, 12, 0, 0                , 1     , true, true, true, 2, 35, false},
    {false, "Seasparrow", 1.0, 1.00, 500000, 16, 0, 0           , 2     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Pizzaboy", 20.0, 116.00, 1600, 1, 0, 0              , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {false, "Tram", 1.0, 1.00, 0, 0, 0, 0                       , 0     , false, false, false, 0, 0, false}, // >>>> No.
    {false, "Trailer2", 1.0, 1.00, 0, 0, 0, 0                   , 0     , false, false, false, 0, 0, false}, // >>>> No.
    {true, "Turismo", 80.0, 195.00, 20000, 15, 0, 6             , 2     , true, true, true, 1, 20, true},
    {false, "Speeder", 1.0, 1.00, 1500000, 15, 0, 0             , 1     , true, true, true, 0, 0, false},
    {false, "Reefer", 1.0, 1.00, 800000, 10, 0, 0               , 1     , true, true, true, 0, 0, false},
    {false, "Tropic", 1.0, 1.00, 1600000, 15, 0, 0              , 1     , true, true, true, 2, 35, false},
    {true, "Flatbed", 120.0, 159.00, 50000, 10, 0, 0            , 2     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Yankee", 50.0, 107.00, 80000, 8, 0, 15              , 2     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Caddy", 10.0, 96.00, 20000, 1, 0, 0                 , 2     , true, true, false, 1, 30, false}, // >>>> No.
    {true, "Solair", 80.0, 158.00, 20000, 3, 0, 8               , 4     , true, true, true, 0, 0, true},
    {true, "BerkleyRCVan", 60.0, 137.00, 50000, 5, 0, 12        , 4     , true, true, true, 0, 0, false}, // >>>> No.
    {false, "Skimmer", 1.0, 1.00, 160000, 15, 0, 0              , 2     , true, true, true, 0, 0, false},
    {true, "PCJ-600", 45.0, 167.00, 40000, 5, 0, 0              , 2     , true, true, false, 0, 0, false},
    {true, "Faggio", 20.0, 107.00, 1500, 1, 0, 0                , 2     , true, true, false, 0, 0, false},
    {true, "Freeway", 60.0, 142.00, 30000, 6, 0, 0              , 2     , true, true, false, 0, 0, false},
    {false, "RCBaron", 1.0, 1.00, 500, 1, 0, 0                  , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {false, "RCRaider", 1.0, 1.00, 500, 1, 0, 0                 , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Glendale", 50.0, 148.00, 2000, 1, 0, 6              , 4     , true, true, true, 0, 0, true},
    {true, "Oceanic", 50.0, 141.00, 16000, 1, 0, 6              , 4     , true, true, true, 0, 0, true},
    {true, "Sanchez", 40.0, 143.00, 50000, 2, 0, 0              , 2     , true, true, false, 0, 0, false},
    {false, "Sparrow", 1.0, 1.00, 500000, 30, 0, 0              , 2     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Patriot", 120.0, 158.00, 20000, 15, 0, 8            , 4     , true, true, true, 1, 30, true},
    {true, "Quad", 25.0, 111.00, 20000, 1, 0, 0                 , 2     , true, true, false, 1, 10, false},
    {false, "Coastguard", 1.0, 1.00, 150000, 5, 0, 0            , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {false, "Dinghy", 1.0, 1.00, 10000, 5, 0, 0                 , 1     , true, true, true, 0, 0, false},
    {true, "Hermes", 80.0, 150.00, 9000, 2, 0, 6                , 2     , true, true, true, 0, 0, true},
    {true, "Sabre", 45.0, 174.00, 12000, 2, 0, 6                , 2     , true, true, true, 0, 0, true},
    {false, "Rustler", 1.0, 1.00, 30000, 15, 0, 0               , 1     , true, true, true, 0, 0, false},
    {true, "ZR-350", 60.0, 188.00, 120000, 3, 0, 4              , 2     , true, true, true, 0, 0, true},
    {true, "Walton", 50.0, 118.00, 3500, 1, 0, 6                , 2     , true, true, true, 0, 0, true},
    {true, "Regina", 80.0, 141.00, 10000, 5, 0, 10              , 4     , true, true, true, 0, 0, true},
    {true, "Comet", 45.0, 186.00, 130000, 6, 0, 4               , 2     , true, true, true, 0, 0, true},
    {false, "BMX", 1.0, 1.00, 150, 1, 0, 0                      , 1     , false, true, true, 0, 0, false},
    {true, "Burrito", 60.0, 158.00, 40000, 6, 0, 20             , 4     , true, true, true, 0, 0, false},
    {true, "Camper", 50.0, 124.00, 60000, 9, 0, 10              , 3     , true, true, true, 0, 0, false},
    {false, "Marquis", 1.0, 1.00, 6000000, 20, 0, 0             , 1     , true, true, true, 0, 0, false},
    {true, "Baggage", 20.0, 100.00, 1000, 1, 0, 0               , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Dozer", 25.0, 65.00, 50000, 5, 0, 0                 , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {false, "Maverick", 1.0, 1.00, 20000, 20, 0, 0              , 4     , true, true, true, 1, 60, false}, // >>>> No.
    {false, "NewsChopper", 1.0, 1.00, 500000, 20, 0, 0          , 2     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Rancher", 90.0, 140.00, 60000, 6, 0, 10             , 2     , true, true, true, 0, 0, true},
    {true, "FBIRancher", 90.0, 158.00, 80000, 8, 0, 12          , 4     , true, true, true, 0, 0, true}, // >>>> No.
    {true, "Virgo", 45.0, 150.00, 6000, 1, 0, 4                 , 2     , true, true, true, 0, 0, true},
    {true, "Greenwood", 45.0, 141.00, 12000, 2, 0, 4            , 4     , true, true, true, 0, 0, true},
    {false, "Jetmax", 1.0, 1.00, 5000000, 20, 0, 0              , 1     , true, true, true, 1, 35, false},
    {true, "Hotring", 80.0, 216.00, 20000, 15, 0, 0             , 2     , true, true, true, 1, 35, true},
    {true, "Sandking", 60.0, 178.00, 20000, 15, 0, 0            , 2     , true, true, true, 1, 35, true},
    {true, "Blista Compact", 60.0, 164.00, 6500, 1, 0, 4        , 2     , true, true, true, 0, 0, true},
    {false, "Police Maverick", 1.0, 1.00, 600000, 20, 0, 0      , 4     , true, true, true, 0, 0, false},
    {true, "Boxville", 60.0, 109.00, 80000, 12, 0, 12           , 4     , true, true, true, 0, 0, false},
    {true, "Benson", 70.0, 124.00, 80000, 12, 0, 12             , 2     , true, true, true, 0, 0, false},
    {true, "Mesa", 60.0, 141.00, 30000, 5, 0, 2                 , 2     , true, true, true, 0, 0, true},
    {false, "RCGoblin", 1.0, 1.00, 500, 1, 0, 0                 , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "HotringRacer A", 80.0, 216.00, 20000, 20, 0, 0      , 2     , true, true, true, 1, 35, true},
    {true, "HotringRacer B", 80.0, 216.00, 20000, 20, 0, 0      , 2     , true, true, true, 1, 35, true},
    {true, "BloodringBanger", 40.0, 174.00, 80000, 15, 0, 0     , 2     , true, true, true, 1, 20, true},
    {true, "Rancher", 80.0, 140.00, 60000, 6, 0, 10             , 2     , true, true, true, 0, 0, true},
    {true, "SuperGT", 60.0, 180.00, 250000, 15, 0, 4            , 2     , true, true, true, 0, 0, true},
    {true, "Elegant", 65.0, 167.00, 5000, 1, 0, 6               , 4     , true, true, true, 0, 0, true},
    {true, "Journey", 90.0, 108.00, 40000, 4, 0, 12             , 2     , true, true, true, 0, 0, false},
    {false, "Bike", 1.0, 1.00, 500, 1, 0, 0                     , 1     , false, true, true, 0, 0, false}, // >>>> No.
    {false, "MountainBike", 1.0, 1.00, 500, 1, 0, 0             , 1     , false, true, true, 0, 0, false}, // >>>> No.
    {false, "Beagle", 1.0, 1.00, 6000000, 16, 0, 0              , 2     , true, true, true, 0, 0, false}, // >>>> No.
    {false, "Cropdust", 1.0, 1.00, 1200000, 12, 0, 0            , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {false, "Stunt", 1.0, 1.00, 1200000, 12, 0, 0               , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Tanker", 130.0, 121.00, 500000, 20, 0, 0            , 2     , true, true, true, 0, 0, false},
    {true, "Roadtrain", 150.0, 143.00, 500000, 20, 0, 10         , 2     , true, true, true, 0, 0, false},
    {true, "Nebula", 60.0, 158.00, 4000, 1, 0, 4                , 4     , true, true, true, 0, 0, true},
    {true, "Majestic", 45.0, 158.00, 4000, 1, 0, 4              , 2     , true, true, true, 0, 0, true},
    {true, "Buccaneer", 50.0, 165.00, 4500, 1, 0, 4             , 2     , true, true, true, 0, 0, true},
    {false, "Shamal", 1.0, 1.00, 20000000, 30, 0, 0             , 1     , true, true, true, 0, 0, false},
    {false, "Hydra", 1.0, 1.00  , 50000000, 100, 0, 0           , 1     , true, true, true, 0, 0, false},
    {true, "FCR-900", 50.0, 169.00, 60000, 6, 0, 0              , 2     , true, true, false, 1, 25, false},
    {true, "NRG-500", 40.0, 190.00, 80000, 8, 0, 0              , 2     , true, true, false, 1, 30, false},
    {true, "HPV1000", 60.0, 168.00, 50000, 8, 0, 0              , 2     , true, true, false, 0, 0, false}, // >>>> No.
    {true, "CementTruck", 30.0, 131.00, 80000, 8, 0, 0          , 2     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "TowTruck", 60.0, 162.00, 30000, 3, 0, 4             , 2     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Fortune", 40.0, 159.00, 10000, 2, 0, 4              , 2     , true, true, true, 0, 0, true},
    {true, "Cadrona", 45.0, 150.00, 10000, 2, 0, 4              , 2     , true, true, true, 0, 0, true},
    {true, "FBITruck", 80.0, 178.00, 150000, 15, 0, 12          , 2     , true, true, true, 0, 0, true}, // >>>> No.
    {true, "Willard", 55.0, 150.00, 5000, 1, 0, 6               , 4     , true, true, true, 0, 0, true},
    {true, "Forklift", 10.0, 61.00, 1500, 1, 0, 0               , 1     , true, true, true, 0, 0, false},
    {true, "Tractor", 30.0, 71.00, 2000, 1, 0, 0                , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Combine", 20.0, 111.00, 10000, 2, 0, 0              , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Feltzer", 50.0, 168.00, 13000, 3, 0, 6              , 2     , true, true, true, 0, 0, true},
    {true, "Remington", 60.0, 170.00, 15000, 3, 0, 4            , 2     , true, true, true, 0, 0, true},
    {true, "Slamvan", 60.0, 159.00, 20000, 8, 0, 4              , 2     , true, true, true, 0, 0, true},
    {true, "Blade", 62.0, 174.00, 30000, 4, 0, 6                , 2     , true, true, true, 0, 0, true},
    {false, "Freight", 1.0, 1.00, 1000000, 100, 0, 0            , 500   , true, true, true, 0, 0, false}, // >>>> No.
    {false, "Streak", 1.0, 1.00, 1000000, 100, 0, 0             , 500   , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Vortex", 20.0, 100.00, 2000, 20, 0, 0               , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Vincent", 40.0, 150.00, 5000, 1, 0, 6               , 4     , true, true, true, 0, 0, true},
    {true, "Bullet", 60.0, 204.00, 20000, 15, 0, 4              , 2     , true, true, true, 1, 30, true},
    {true, "Clover", 45.0, 165.00, 6000, 1, 0, 4                , 2     , true, true, true, 0, 0, true},
    {true, "Sadler", 60.0, 152.00, 5000, 1, 0, 8                , 2     , true, true, true, 0, 0, true},
    {true, "FiretruckLA", 120.0, 149.00, 2000000, 20, 0, 0      , 2     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Hustler", 80.0, 148.00, 60000, 25, 0, 6             , 2     , true, true, true, 0, 0, true},
    {true, "Intruder", 60.0, 150.00, 15000, 3, 0, 6             , 4     , true, true, true, 0, 0, true},
    {true, "Primo", 55.0, 144.00, 3000, 1, 0, 6                 , 4     , true, true, true, 0, 0, true},
    {false, "Cargobob", 1.0, 1.00, 3000000, 20, 0, 0            , 2     , true, true, true, 0, 0, false},
    {true, "Tampa", 60.0, 154.00, 12000, 2, 0, 4                , 2     , true, true, true, 0, 0, true},
    {true, "Sunrise", 60.0, 146.00, 9000, 2, 0, 6               , 4     , true, true, true, 0, 0, true},
    {true, "Merit", 55.0, 158.00, 8000, 2, 0, 6                 , 4     , true, true, true, 0, 0, true},
    {true, "Utility", 60.0, 122.00, 30000, 3, 0, 6              , 2     , true, true, true, 0, 0, true}, // >>>> No.
    {false, "Nevada", 1.0, 1.00, 2000000, 30, 0, 0              , 1     , true, true, true, 0, 0, false},
    {true, "Yosemite", 60.0, 145.00, 25000, 3, 0, 8             , 2     , true, true, true, 0, 0, true},
    {true, "Windsor", 45.0, 159.00, 13500, 3, 0, 4              , 2     , true, true, true, 0, 0, true},
    {true, "MonsterA", 45.0, 111.00, 20000, 20, 0, 20           , 2     , true, true, true, 1, 50, false},
    {true, "MonsterB", 60.0, 111.00, 20000, 20, 0, 20           , 2     , true, true, true, 1, 50, false},
    {true, "Uranus", 80.0, 157.00, 15000, 3, 0, 4               , 2     , true, true, true, 0, 0, true},
    {true, "Jester", 60.0, 179.00, 25000, 5, 0, 4               , 2     , true, true, true, 1, 15, true},
    {true, "Sultan", 60.0, 170.00, 80000, 5, 0, 6               , 4     , true, true, true, 0, 0, true},
    {true, "Stratum", 60.0, 155.00, 29000, 4, 0, 8              , 4     , true, true, true, 0, 0, true},
    {true, "Elegy", 60.0, 179.00, 20000, 6, 0, 6                , 2     , true, true, true, 1, 15, true},
    {false, "Raindance", 1.0, 1.00, 500000, 15, 0, 0            , 2     , true, true, true, 0, 0, false},
    {false, "RC Tiger", 1.0, 1.00, 500, 1, 0, 0                 , 1     , true, true, true, 0, 0, false},
    {true, "Flash", 60.0, 166.00, 60000, 6, 0, 8                , 2     , true, true, true, 0, 0, true},
    {true, "Tahoma", 40.0, 161.00, 15000, 1, 0, 6               , 4     , true, true, true, 0, 0, true},
    {true, "Savanna", 50.0, 174.00, 30000, 5, 0, 6              , 4     , true, true, true, 0, 0, true},
    {true, "Bandito", 30.0, 147.00, 30000, 5, 0, 0              , 1     , true, true, true, 0, 0, true},
    {false, "FreightFlat", 1.0, 1.00, 5000000, 50, 0, 0         , 0     , true, true, true, 0, 0, false},
    {false, "StreakCarriage", 1.0, 1.00, 5000000, 50, 0, 0      , 0     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Kart", 10.0, 94.00, 20000, 1, 0, 0                  , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Mower", 15.0, 61.00, 1200, 1, 0, 0                  , 1     , true, true, true, 0, 0, false},
    {true, "Duneride", 80.0, 111.00, 1000000, 20, 0, 20         , 2     , true, true, true, 2, 50, false},
    {true, "Sweeper", 20.0, 61.00, 4000, 1, 0, 2                , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Broadway", 45.0, 159.00, 20000, 6, 0, 4             , 2     , true, true, true, 0, 0, true},
    {true, "Tornado", 40.0, 159.00, 6000, 1, 0, 4               , 2     , true, true, true, 0, 0, true},
    {false, "AT-400", 1.0, 1.00, 10000000, 50, 0, 0             , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "DFT-30", 80.0, 131.00, 100000, 10, 0, 4             , 2     , true, true, true, 0, 0, false},
    {true, "Huntley", 80.0, 159.00, 60000, 6, 0, 8              , 4     , true, true, true, 0, 0, true},
    {true, "Stafford", 60.0, 154.00, 90000, 2, 0, 6             , 4     , true, true, true, 0, 0, true},
    {true, "BF-400", 35.0, 168.00, 13000, 2, 0, 0               , 2     , true, true, false, 0, 0, false},
    {true, "Newsvan", 60.0, 137.00, 30000, 3, 0, 10             , 4     , false, false, false, 0, 0, false},
    {true, "Tug", 15.0, 86.00, 2000, 1, 0, 0                    , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {false, "Trailer 3", 1.0, 1.00, 160000, 15, 0, 0            , 0     , true, true, true, 0, 0, false},
    {true, "Emperor", 60.0, 154.00, 6000, 1, 0, 6               , 4     , true, true, true, 0, 0, true},
    {true, "Wayfarer", 50.0, 158.00, 8000, 2, 0, 0              , 2     , true, true, false, 0, 0, false},
    {true, "Euros", 50.0, 166.00, 20000, 3, 5, 5                , 2     , true, true, true, 0, 0, true},
    {true, "Hotdog", 60.0, 109.00, 30000, 5, 0, 12              , 2     , true, true, true, 0, 0, false},
    {true, "Club", 65.0, 164.00, 20000, 10, 0, 6                , 2     , true, true, true, 0, 0, true},
    {false, "FreightCarriage", 1.0, 1.00, 1000000, 100, 0, 0    , 0     , false, false, false, 0, 0, false}, // >>>> No.
    {false, "Trailer3", 1.0, 1.00, 1000000, 100, 0, 0           , 0     , false, false, false, 0, 0, false}, // >>>> No.
    {false, "Andromada", 1.0, 1.00, 1000000, 100, 0, 0          , 500   , true, true, true, 0, 0, false}, // >>>> No.
    {false, "Dodo", 1.0, 1.00, 750000, 12, 0, 0                 , 2     , true, true, true, 0, 0, false}, // >>>> No.
    {false, "RCCam", 1.0, 1.00, 500, 1, 0, 0                    , 2     , true, true, true, 0, 0, false}, // >>>> No.
    {false, "Launch", 1.0, 1.00, 800000, 8, 0, 0                , 1     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "LSPD", 60.0, 177.00, 50000, 10, 0, 8                , 4     , true, true, true, 0, 0, true}, // >>>> No.
    {true, "SFPD", 60.0, 177.00, 50000, 10, 0, 8                , 4     , true, true, true, 0, 0, true}, // >>>> No.
    {true, "LVPD", 60.0, 177.00, 50000, 10, 0, 8                , 4     , true, true, true, 0, 0, true},
    {true, "PoliceRanger", 90.0, 159.00, 70000, 10, 0, 12       , 2     , true, true, true, 0, 0, true}, // // >>>> No. >>>> No.
    {true, "Picador", 40.0, 152.00, 4500, 1, 0, 6               , 2     , true, true, true, 0, 0, true},
    {true, "S.W.A.T.Van", 30.0, 111.00, 4000000, 50, 0, 0       , 2     , true, true, true, 0, 0, true}, // >>>> No.
    {true, "Alpha", 60.0, 170.00, 50000, 8, 0, 4                , 2     , true, true, true, 0, 0, true},
    {true, "Phoenix", 60.0, 172.00, 35000, 10, 0, 4             , 2     , true, true, true, 0, 0, true},
    {true, "Glendale", 30.0, 148.00, 1500, 1, 0, 6              , 4     , true, true, true, 0, 0, true},
    {true, "Sadler", 40.0, 152.00, 1600, 1, 0, 6                , 2     , true, true, true, 0, 0, true},
    {false, "LuggageTrailerA", 1.0, 1.00, 500, 1, 0, 0          , 0     , true, true, true, 0, 0, false},
    {false, "LuggageTrailerB", 1.0, 1.00, 500, 1, 0, 0          , 0     , true, true, true, 0, 0, false}, // >>>> No.
    {false, "StairTrailer", 1.0, 1.00, 500, 1, 0, 0             , 0     , true, true, true, 0, 0, false}, // >>>> No.
    {true, "Boxville", 90.0, 108.00, 60000, 6, 0, 15            , 4     , true, true, true, 0, 0, false}, // >>>> No.
    {false, "FarmPlow", 1.0, 1.00, 3000, 1, 0, 0                , 0     , true, true, true, 0, 0, false}, // >>>> No.
    {false, "UtilityTrailer", 1.0, 1.00, 1000, 1, 0, 0          , 0     , true, true, true, 0, 0, false} // >>>> No.
};

#define MAX_BOOT_SLOTS   20
enum
{
	BOOT_TYPE_WEAPON
};
enum enum_VEHICLE_BOOT
{
	bool:vehicle_boot_VALID,
	vehicle_boot_OBJECT_ID,
	vehicle_boot_TYPE,
	vehicle_boot_INT,
	vehicle_boot_INT_EXTRA
};
new VEHICLE_BOOT[MAX_VEHICLES][MAX_BOOT_SLOTS][enum_VEHICLE_BOOT];

enum SELL_INFO_VEHICLES_Enum
{
	sel_info_vehicle_MODELID,
	Float:sell_info_SPAWN_X,
	Float:sell_info_SPAWN_Y,
	Float:sell_info_SPAWN_Z,
	Float:sell_info_SPAWN_ANGLE,
	sell_info_COLOR_1,
	sell_info_COLOR_2,
	sell_info_SHOP
};

new SELL_INFO_VEHICLES[][SELL_INFO_VEHICLES_Enum] =
{
	{400, -1971.730834, 305.717071, 35.281467, 112.761856, -1, -1, 0}, //conce0 sf
	{489, -1972.303588, 299.899291, 35.315319, 113.739143, -1, -1, 0}, //conce0
	{500, -1989.106811, 267.932830, 35.276290, 267.933868, -1, -1, 0}, //conce0
	{516, -1988.849243, 262.505828, 35.014682, 273.633972, -1, -1, 0}, //conce0
	{517, -1989.152587, 257.527374, 35.020854, 278.511993, -1, -1, 0}, //0
	{518, -1990.650756, 252.367614, 34.853424, 260.343750, -1, -1, 0}, //0
	{526, -1991.783203, 247.102294, 34.938541, 263.152526, -1, -1, 0}, //0
	{529, -1992.195556, 241.864547, 34.804782, 265.900787, -1, -1, 0}, //0
	{533, -1970.909790, 271.824432, 34.874591, 92.208198, -1, -1, 0}, //0
	{534, -1971.686889, 266.768585, 34.897808, 90.052833, -1, -1, 0}, //0
	{535, -1972.078857, 261.530334, 34.940402, 91.687599, -1, -1, 0}, //0
	{536, -1971.535644, 255.783843, 34.909259, 90.030273, -1, -1, 0}, //0
	{540, -1985.110107, 303.989593, 35.031871, 247.498382, -1, -1, 0}, //0
	{543, -1959.895751, 272.834747, 35.330417, 315.005645, -1, -1, 0}, //0
	{546, -1947.004760, 265.553222, 35.208316, 44.999832, -1, -1, 0}, //0
	{547, -1957.724731, 261.617736, 35.244117, 134.999298, -1, -1, 0}, //0
	{549, -1950.561035, 258.919067, 35.165855, 23.361270, -1, -1, 0}, //0
	{551, -1961.752929, 284.531127, 35.270526, 0.696665, -1, -1, 0}, //0
	{554, -1946.718139, 257.937591, 41.083919, 45.030506, -1, -1, 0}, //0
	{555, -1955.544677, 257.741241, 40.755210, 315.004882, -1, -1, 0}, //0
	{558, -1945.867919, 273.318969, 40.666416, 135.659255, -1, -1, 0}, //0
	{559, -1946.407836, 264.562194, 40.705158, 70.021125, -1, -1, 0}, //0
	{560, -1953.854003, 295.461822, 40.762950, 141.442657, -1, -1, 0}, //0
	{561, -1954.960693, 302.385498, 40.873092, 45.000858, -1, -1, 0}, //0
	{562, -1955.735351, 274.163513, 40.699062, 224.775680, -1, -1, 0}, //0
	{565, 561.566101, -1290.956542, 16.871730, 13.598201, -1, -1, 1}, //1 gotti
	{566, 555.651794, -1290.101562, 17.030550, 12.250467, -1, -1, 1}, //1
	{567, 548.681701, -1288.398803, 17.121070, 2.627753, -1, -1, 1}, //1
	{575, 543.408569, -1290.018676, 16.844970, 12.805674, -1, -1, 1}, //1
	{576, 537.712585, -1289.785278, 16.853311, 8.072924, -1, -1, 1}, //1
	{579, 531.610229, -1289.627563, 17.179222, 0.727972, -1, -1, 1}, //1 
	{580, 524.575805, -1290.402587, 17.038362, 347.873016, -1, -1, 1}, //1
	{585, 519.242980, -1287.057373, 16.828090, 306.424560, -1, -1, 1}, //1
	{587, 527.172241, -1282.828613, 16.988870, 225.000015, -1, -1, 1}, //1
	{589, 531.867553, -1279.575195, 16.918565, 225.000091, -1, -1, 1}, //1
	{600, 536.016235, -1276.898681, 16.963094, 225.002395, -1, -1, 1}, //1
	{602, 539.315979, -1273.561767, 17.073772, 224.999908, -1, -1, 1}, //1
	{603, 543.021911, -1270.594482, 17.126434, 224.998825, -1, -1, 1}, //1
	{402, 547.388854, -1268.065185, 17.089252, 225.000061, -1, -1, 1}, //1
	{405, 550.830261, -1264.989990, 17.167030, 225.000000, -1, -1, 1}, //1
	{604, 2123.362304, -1144.851196, 24.472566, 314.818267, -1, -1, 2}, //2 ls
	{605, 2120.166748, -1141.430053, 24.722545, 314.695739, -1, -1, 2}, //2
	{542, 2120.096923, -1136.088378, 24.996570, 314.858062, -1, -1, 2}, //2
	{462, 2126.857177, -1147.089843, 24.115188, 314.773010, -1, -1, 2}, //2
	{543, 2132.541748, -1142.541259, 24.895196, 44.777957, -1, -1, 2}, //2
	{529, 2135.447509, -1140.396362, 24.948331, 45.030994, -1, -1, 2}, //2
	{401, 1730.930053, 1887.108520, 10.599695, 134.999694, -1, -1, 3}, //
	{404, 1731.381225, 1892.453125, 10.569231, 134.707473, -1, -1, 3}, //
	{405, 1731.109252, 1898.369384, 10.702906, 135.000000, -1, -1, 3}, //
	{410, 1731.451293, 1903.748901, 10.504331, 135.005813, -1, -1, 3}, //
	{412, 1730.241699, 1908.477050, 10.707293, 134.881576, -1, -1, 3}, //
	{413, 1730.819458, 1914.079833, 10.902223, 134.658706, -1, -1, 3}, //
	{418, 1730.897949, 1919.471923, 10.925701, 135.000335, -1, -1, 3}, //
	{419, 1730.598510, 1924.523437, 10.644100, 135.000000, -1, -1, 3}, //
	{421, 1730.842407, 1929.510375, 10.778207, 134.998794, -1, -1, 3}, //
	{422, 1731.021850, 1934.202270, 10.808994, 135.312362, -1, -1, 3}, //
	{426, 1731.136352, 1938.637451, 10.596670, 134.887939, -1, -1, 3}, //
	{426, 1730.754760, 1943.268554, 10.570414, 134.479446, -1, -1, 3}, //
	{439, 1731.084106, 1948.810180, 10.755937, 134.970794, -1, -1, 3}, //
	{445, 1730.763916, 1954.217285, 10.718680, 134.999984, -1, -1, 3}, //
	{458, 1731.066528, 1959.513549, 10.657438, 136.287368, -1, -1, 3}, //
	{459, 1731.444946, 1964.863403, 10.899006, 134.975570, -1, -1, 3}, //
	{466, 1730.831176, 1969.622192, 10.593549, 134.999984, -1, -1, 3}, //
	{467, 1730.754882, 1975.104492, 10.608223, 134.999969, -1, -1, 3}, //
	{474, 1730.852539, 1980.575927, 10.568473, 135.129379, -1, -1, 3}, //
	{475, 1730.986572, 1986.015014, 10.660503, 134.965286, -1, -1, 3}, //
	{477, 1731.019409, 1990.834350, 10.559190, 134.795349, -1, -1, 3}, //
	{478, 1731.501220, 1996.037841, 10.857707, 134.984298, -1, -1, 3}, //
	{479, 1731.119262, 2000.719360, 10.598874, 134.999588, -1, -1, 3}, //
	{480, 1731.495361, 2005.884155, 10.634652, 134.999740, -1, -1, 3}, //
	{482, 1731.285766, 2010.759765, 10.950078, 135.215301, -1, -1, 3}, //
	{483, 1730.935058, 2014.496948, 10.826995, 135.018432, -1, -1, 3}, //
	{489, 1731.131103, 2019.822509, 10.965262, 134.999526, -1, -1, 3}, //
	{491, 1742.855224, 1886.187866, 10.607666, 224.881958, -1, -1, 3}, //
	{492, 1742.420410, 1891.042602, 10.625684, 225.000015, -1, -1, 3}, //
	{496, 1741.725830, 1895.996459, 10.518464, 224.999679, -1, -1, 3}, //
	{500, 1741.789916, 1901.220703, 10.979518, 224.999908, -1, -1, 3}, //
	{507, 1742.658081, 1905.751464, 10.650567, 224.999938, -1, -1, 3}, //
	{461, 1745.890258, 1853.801513, 10.397463, 44.999942, -1, -1, 3}, //
	{462, 1741.982177, 1853.458618, 10.424824, 45.022659, -1, -1, 3}, //
	{463, 1738.716674, 1853.531250, 10.366888, 45.000011, -1, -1, 3}, //
	{468, 1735.504272, 1853.494750, 10.499835, 44.996749, -1, -1, 3}, //
	{471, 1732.698120, 1853.572998, 10.344942, 44.999938, -1, -1, 3}, //
	{521, 1729.782714, 1853.793823, 10.406937, 44.999969, -1, -1, 3}, //
	{522, 1727.729858, 1853.685791, 10.398012, 44.997669, -1, -1, 3}, //
	{581, 1725.653930, 1853.688842, 10.425397, 45.000293, -1, -1, 3}, //
	{586, 1722.802734, 1853.941406, 10.325091, 45.006359, -1, -1, 3}, //
	{470, 1742.820800, 1913.142211, 10.816078, 229.028472, -1, -1, 3},
	{444, 1742.383178, 1877.171997, 11.191605, 207.159729, -1, -1, 3},
	{556, 1730.099609, 1877.612792, 11.195281, 145.682418, -1, -1, 3},
	{568, 1741.999877, 1919.793823, 10.684306, 230.327041, -1, -1, 3},
	{531, 1742.570190, 1923.476196, 10.785881, 234.443817, -1, -1, 3},
	{409, 1736.970092, 2030.637451, 10.619542, 359.768463, -1, -1, 3},
	{573, 1736.567016, 1873.478393, 11.484094, 181.366882, -1, -1, 3},
	{402, -1660.500610, 1214.428955, 7.081802, 245.781250, -1, -1, 4}, //
	{411, -1659.630004, 1216.934814, 13.398953, 332.907165, -1, -1, 4}, //
	{415, -1653.029663, 1210.681518, 13.444266, 253.155578, -1, -1, 4}, //
	{429, -1669.283081, 1206.197265, 13.351553, 294.647796, -1, -1, 4}, //
	{451, -1666.966186, 1205.829345, 20.861524, 324.716613, -1, -1, 4}, //
	{506, -1658.944458, 1206.433837, 20.860774, 17.348609, -1, -1, 4}, //
	{541, -1649.423461, 1206.491821, 20.775476, 133.478042, -1, -1, 4}, //
	{545, -1656.527587, 1216.405029, 21.003622, 44.999988, -1, -1, 4} //
	/*{446, -2231.2676, 2451.4797, 0.0119, 228.6364, -1, -1, 5},
	{452, -2241.1306, 2440.2146, 0.0119, 226.4393, -1, -1, 5},
	{453, -2250.6514, 2428.3452, 0.0119, 226.4393, -1, -1, 5},
	{454, -2262.2539, 2419.0127, 0.0119, 226.4393, -1, -1, 5},
	{454, -2202.1697, 2421.1807, 0.0119, 45.7924, -1, -1,  5},
	{472, -2234.6467, 2394.7185, 0.2970, 42.8398, -1, -1,  5},
	{484, -2213.1201, 2411.4111, 0.0119, 46.0592, -1, -1,  5},
	{473, -2237.2305, 2390.8669, 0.2970, 42.8398, -1, -1,  5},
	{493, -2223.5603, 2400.2893, -0.0596, 46.0592, -1, -1, 5},
	{595, -2245.3577, 2433.8679, 0.5854, 226.4393, -1, -1, 5}*/
};

new Float:SELL_VEHICLES_SHOPS_SPAWN[][] =
{
	{-1920.1965, 302.7697, 40.5643, -90.0000}, //sf
	{563.774475, -1273.510986, 16.867170, 12.636687}, //grotti
	{2126.008544,-1115.513916,25.176628,69.340042},//ls trucho
	{1642.246582,1796.102050,10.820312,180.149368}, //lv
	{-1645.245361, 1217.047973, 6.732273, 224.517120} //sf 2
	//{-2258.0054, 2477.0315, 0.2512, 313.4971} barcos
};

enum SELL_VEHICLES_Enum
{
	bool:sell_vehicle_VALID,
	sell_vehicle_SHOP,
	sell_vehicle_PRICE,
	sell_vehicle_LEVEL,
	sell_vehicle_EXTRA,
	sell_vehicle_VIP_LEVEL,
	Text3D:sell_vehicle_LABEL_ID
};
new SELL_VEHICLES[MAX_VEHICLES][SELL_VEHICLES_Enum];