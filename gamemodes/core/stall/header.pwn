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
	{ 2229.2869, -1742.4028, 13.5444, 89.2503, 0, 0 },
	{ 2073.9368, -1774.5253, 13.5570, 262.5525, 0, 0 },
	{ 1804.4763, -1636.2441, 13.5266, 270.3859, 0, 0 },
	{ 1506.4745, -1748.0049, 13.5469, 359.0800, 0, 0 },
	{ 1282.9099, -1669.2659, 13.5469, 264.8615, 0, 0 },
	{ 1220.9332, -1421.7311, 13.2806, 359.6226, 0, 0 },
	{ 1008.0678, -947.6264, 42.2462, 244.5979, 0, 0 },
	{ 1686.3192, -1095.2195, 24.0999, 48.0241, 0, 0 },
	{ 1836.7865, -1191.0834, 23.8060, 312.2600, 0, 0 },
	{ 2153.8445, -1106.7976, 25.4482, 252.5675, 0, 0 },
	{ 1977.4243, -1451.4811, 13.5559, 222.5437, 0, 0 },
	{ 505.0323, -695.0594, 19.1613, 234.3288, 0, 0 },
	{ -1949.7878, -2426.3552, 30.6250, 269.1091, 0, 0 },
	{ 2232.8813, -37.6906, 26.4844, 42.6138, 0, 0 },
	{ 1616.1772, -2180.9705, 13.5547, 181.6883, 0, 0 },
	{ 2455.9546, -2647.7563, 13.6593, 252.2123, 0, 0 },
	{ -397.9071, -1454.9432, 25.7266, 231.5088, 0, 0 },
	{ 179.5990, -1632.4048, 14.6422, 308.7294, 0, 0 },
	{ 339.7999, -1441.6218, 34.4935, 218.3275, 0, 0 },
	{ 515.3698, -1460.8120, 15.0982, 303.5196, 0, 0 },
	{ 1464.4797, -1431.1536, 13.5469, 134.4479, 0, 0 },
	{ 1024.0094, -1782.6796, 13.7780, 265.1982, 0, 0 },
	{ 1022.3405, -1834.1270, 13.6813, 310.9453, 0, 0 },
	{ 850.7712, -1999.0518, 12.8672, 87.4132, 0, 0 },
	{ 427.7779, -1789.1816, 5.5469, 2.9744, 0, 0 },
	{ 239.9366, -1833.4965, 3.6920, 219.0301, 0, 0 },
	{ 198.2404, -1828.9215, 4.0050, 205.5332, 0, 0 },
	{ 1811.3086, -1864.8340, 13.5842, 310.6433, 0, 0 },
	{ 2117.8909, -1906.4839, 13.5469, 358.8107, 0, 0 },
	{ 2796.1072, -1996.3658, 13.5520, 88.7119, 0, 0 }
};