new STALL_SKIN[] =
{
	28, 29, 21, 44, 14, 58
};

enum stall_product_enum
{
	stp_NAME[32],
	stp_PRICE,
	Float:stp_HUNGRY,
	Float:stp_THIRST
};

new STALL_PRODUCT[][stall_product_enum] =
{
	{"Kebab", 200, 50.0, 0.0},
	{"HotDog", 50, 10.0, 0.0},
	{"Sprunk", 90, 0.0, 30.0},
	{"Agua Mineral", 50, 0.0, 40.0},
	{"Helado", 150, 20.0, 20.0},
	{"Choripan", 200, 50.0, 0.0}
};

enum stall_enum
{
	Float:st_X,
	Float:st_Y,
	Float:st_Z,
	Float:st_ANGLE,
	st_SKIN,
	st_PRODUCT,
	st_ACTOR,
	Text3D:st_LABEL,
	st_OBJECT
};

new STALL_INFO[][stall_enum] =
{
	{ 2481.0144, -1745.2509, 13.5469, 1.1748, 0, 0 },
	{ 2353.6777, -1721.0406, 13.5509, 131.8641, 0, 0 },
	{ 2229.2869, -1742.4028, 13.5444, 89.2503, 0, 0 }
};