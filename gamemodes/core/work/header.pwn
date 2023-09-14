/*{WORK_TYPE_NONE, 0, "ninguno",                         	false, 0, 0, 0},
	{WORK_TYPE_NORMAL, 1, "camionero",                     	false, 0, 50, 1300},
	{WORK_TYPE_NORMAL, 1, "cosechador",                    	false, 180, 30, 800},
	{WORK_TYPE_NORMAL, 1, "basurero",                      	true, 200, 50, 2000},
	{WORK_TYPE_NORMAL, 1, "minero",		   					false, 0, 0, 0},
	{WORK_TYPE_FAMILY, 0, "polic�a",                       	true, 1000, 1, 0},
	{WORK_TYPE_NORMAL, 1, "pescador",                     	false, 500, 50, 1300},
	{WORK_TYPE_NORMAL, 1, "m�dico",                      	true, 200, 50, 2000},
	{WORK_TYPE_NORMAL, 1, "boxeador",                      	false, 200, 50, 2000},
	{WORK_TYPE_NORMAL, 1, "le�ador",						true, 200, 50, 200}*/
enum
{
	WORK_TYPE_NONE,
	WORK_TYPE_NORMAL,
	WORK_TYPE_FAMILY
};
enum
{
	WORK_NONE, // Ninguno
	WORK_TRUCK, // Camionero
	WORK_HARVESTER, // Cosechador
	WORK_TRASH, // Basurero
	WORK_MINER, // Minero
	WORK_POLICE, // Policia
	WORK_FISHER, // Pescador
	WORK_MEDIC, // Medico
	WORK_BOX, // Boxeador
	WORK_WOODCUTTER // Le�ador
};
enum work_info_info
{
	work_info_TYPE,
	work_info_LEVEL,
	work_info_NAME[64],
	bool:work_info_NEED_DUTY,     //si este trabajo es normal y tiene vehiculos indica si es necesario que el jugador este de servicio para subirse
	work_info_EXTRA_PAY,          //dejar en 0 para no paga extra.......Paga extra de 'work_info_EXTRA_PAY' cada 'work_info_EXTRA_PAY_EXP' con un limite de 'work_info_EXTRA_PAY_LIMIT'
	work_info_EXTRA_PAY_EXP,
	work_info_EXTRA_PAY_LIMIT     // dejar en 0 para sin limites
};
new work_info[][work_info_info] =
{
	{WORK_TYPE_NONE, 0, "ninguno",                         	false, 0, 0, 0},
	{WORK_TYPE_NORMAL, 1, "camionero",                     	false, 0, 50, 1300},
	{WORK_TYPE_NORMAL, 1, "cosechador",                    	false, 180, 30, 800},
	{WORK_TYPE_NORMAL, 1, "basurero",                      	true, 200, 50, 2000},
	{WORK_TYPE_NORMAL, 1, "minero",		   					false, 0, 0, 0},
	{WORK_TYPE_FAMILY, 0, "polic�a",                       	true, 1000, 1, 0},
	{WORK_TYPE_NORMAL, 1, "pescador",                     	false, 500, 50, 1300},
	{WORK_TYPE_NORMAL, 1, "m�dico",                      	true, 200, 50, 2000},
	{WORK_TYPE_NORMAL, 1, "boxeador",                      	false, 200, 50, 2000},
	{WORK_TYPE_NORMAL, 1, "le�ador",						true, 200, 50, 200}
};

new PLAYER_WORKS[MAX_PLAYERS][sizeof(work_info)];
new PLAYER_SKILLS[MAX_PLAYERS][sizeof(work_info)];

enum obtain_work_coords_info
{
	Float:obtain_work_X,
	Float:obtain_work_Y,
	Float:obtain_work_Z,
	obtain_work_INTERIOR,
	bool:obtain_work_MAP_ICON,
	obtain_work_MAP_ICON_ID,
	Float:obtain_work_MAP_ICON_X,
	Float:obtain_work_MAP_ICON_Y,
	Float:obtain_work_MAP_ICON_Z,
};
new Float:obtain_work_coords[][obtain_work_coords_info] =
{
	{0.0, 0.0, 0.0, 0, false, 0, 0.0, 0.0, 0.0}, // Ninguno
	{1297.107543, -65.027748, 1002.498046, 18, true, 61, 2509.533935, -2637.530761, 13.645265}, // Camionero
	{-372.126922, -1435.706298, 25.726562, 0, true, 61, -372.126922, -1435.706298, 25.726562}, // Cosechador
	{1490.845581, 1305.730102, 1093.296386, 3, true, 61, 1664.634033, -2185.537353, 13.546875}, // Basurero
	{572.808532, -703.072082, 13.075838, 0, true, 61, 572.808532, -703.072082, 13.075838}, // Minero
	{-510.972015, 324.242736, 2004.585937, 20, false, 0, 1480.966918, -1772.065673, 18.795755}, // Policia
	{2158.550048, -97.376449, 2.844641, 0, true, 61, 2158.550048, -97.376449, 2.844641}, // Pescador
	{-201.724212, -1742.832641, 675.768737, 3, false, 0, 1172.832763, -1323.269531, 15.400051}, // Medico
	{-20.062799, 99.009475, 1098.068603, 16, false, 0, 950.341247, -987.135864, 38.743835}, // Boxeador
	{-1931.8711, -2448.0129, 30.6250, 0, true, 61, -1931.8711, -2448.0129, 30.6250} // Le�ador
};

// Basurero
enum Trash_Object_Info
{
	bool:trash_route_VALID,
	trash_route_OBJECTS,
	Float:trash_route_DISTANCE,
	trash_route_MONEY,
	trash_object_MODELID[MAX_OBJECTS_PER_ROUTE],
	Float:trash_object_X[MAX_OBJECTS_PER_ROUTE],
	Float:trash_object_Y[MAX_OBJECTS_PER_ROUTE],
	Float:trash_object_Z[MAX_OBJECTS_PER_ROUTE],
	Float:trash_object_RX[MAX_OBJECTS_PER_ROUTE],
	Float:trash_object_RY[MAX_OBJECTS_PER_ROUTE],
	Float:trash_object_RZ[MAX_OBJECTS_PER_ROUTE]
};
new TRASH_OBJECTS[MAX_ROUTES][Trash_Object_Info];
new TRASH_PLAYER_OBJECTS[MAX_PLAYERS][MAX_OBJECTS_PER_ROUTE];

enum TRASH_VEHICLES_INFO
{
	bool:trash_vehicle_JOB_STARTED,
	trash_vehicle_ROUTE,
	trash_vehicle_CP,
	trash_vehicle_DRIVER_ID,
	trash_vehicle_PASSENGER_ID
};
new TRASH_VEHICLES[MAX_VEHICLES][TRASH_VEHICLES_INFO];

// Camionero
new Float:LoadTrucksPoints[][] =
{
	{2430.781250, -2656.628662, 13.664062, 0.0},
	{2453.145751, -2568.576171, 13.656103, 0.0},
	{2453.460205, -2599.491943, 13.656026, 0.0},
	{2452.829101, -2627.258300, 13.663995 ,0.0}
};

enum TRUCK_VEHICLE_Info
{
	bool:truck_vehicle_LOADED,
	bool:truck_vehicle_LOADING,
	bool:truck_vehicle_UNLOADING,
	bool:truck_vehicle_DELIVERED,
	truck_vehicle_DRIVER_USER_ID,
	truck_vehicle_POINT,
};
new TRUCK_VEHICLE[MAX_VEHICLES][TRUCK_VEHICLE_Info];

enum Truck_Content_Info
{
	truck_content_EXP,
	truck_content_NAME[24],
	truck_content_MONEY,
	Float:truck_content_X,
	Float:truck_content_Y,
	Float:truck_content_Z
};
new Truck_Contents[][Truck_Content_Info] = //recos camionero
{
	{0, T_REC_0, 900, 1071.016235, -934.561523, 42.539730},
	{25, T_REC_1, 950, -185.473693, -280.008880, 1.603357},
	{50, T_REC_2, 1150, 667.775512, -458.185913, 16.335937},
	{70, T_REC_3, 1250, 645.397155, -522.815002, 16.335937},
	{100, T_REC_4, 1300, 1355.020385, 243.499816, 19.566932},
	{150, T_REC_5, 1400, 2337.287109, -53.487117, 26.484375},
	{200, T_REC_6, 1800, 2327.318115, -21.905473, 26.484375},
	{300, T_REC_7, 2000, 2338.490966, 60.734577, 26.484375}
};