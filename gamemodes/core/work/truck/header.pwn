//Camioneros
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