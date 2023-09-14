#define MAX_CLUBS 100
enum club_obj_enum
{
	bool:club_VALID,
	club_ID,
	club_USER_ID,
	club_NAME[32],
	club_WELCOME[64],
	Float:club_X,
	Float:club_Y,
	Float:club_Z,
	Float:club_ANGLE,
	Text3D:club_EXT_LABEL_ID,
	club_EXT_PICKUP_ID,
	club_INT_PICKUP_ID,
	club_STATE,
	club_INTERIOR,
	club_BALANCE,
	club_ENTER_PRICE,
	club_PRICE,
	club_RADIO
};
new CLUBS_INFO[MAX_CLUBS][club_obj_enum];

enum club_interior_enum
{
	interior_ID,
	Float:interior_X,
	Float:interior_Y,
	Float:interior_Z,
	Float:interior_ANGLE,
	Float:interior_BUY_X,
	Float:interior_BUY_Y,
	Float:interior_BUY_Z
};
new CLUBS_INTERIORS[][club_interior_enum] =
{
	{17, 493.3484, -24.2474, 1000.6797, 3.4467, 499.7140, -20.6645, 1000.6797},
	{11, 502.0828, -67.9835, 998.7578, 184.3867, 496.9311, -75.7746, 998.7578},
	{18, -228.8764, 1401.1167, 27.7656, 269.9042, -224.8640, 1403.8942, 27.7734},
	{4, 460.2027, -88.6521, 999.5547, 92.5791, 450.2049, -83.9086, 999.5547},
	{17, 377.1364, -192.8721, 1000.6401, 1.4217, 378.8471, -184.0867, 1000.6328},
	{3, -2636.5503, 1402.8658, 906.4609, 2.6516, -2652.3777, 1410.4259, 906.2734},
	{1, -794.9175, 489.5493, 1376.1953, 2.0483, -787.8307, 500.2868, 1371.7422},
	{64, 2627.9360, 490.5309, 2621.2078, 173.315292, 2620.1409, 480.0729, 2621.2000} // Decente
};