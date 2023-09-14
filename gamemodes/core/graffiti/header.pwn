/* Graffiti System */
new 
	GraffitiGlobalTime,
	GraffitiGetTime,
	GraffitiCancelTimer;

enum graffitis_info
{
	g_MODELID,
	Float:g_X,
	Float:g_Y,
	Float:g_Z,
	Float:g_RX,
	Float:g_RY,
	Float:g_RZ,
	g_ZONE_NAME[128],
	g_FONT[64], //URL: https://www.dafont.com/es/a-dripping-marker.font
	g_CREW_ONE,
	g_CREW_TWO,
	g_CREW_THREE,
	g_OBJ_CREW_ONE,
	g_OBJ_CREW_TWO,
	g_OBJ_CREW_THREE,
	bool:g_ACTIVATED,
	g_ID
};
new GRAFFITIS_OBJ[][graffitis_info] =
{
	{19482, 1927.280151, -2123.087402, 14.134556, 0.000000, 0.000000, -179.999847, "El Corona", "Comic Sans MS"},
	{19482, 1928.959716, -2031.454956, 14.036877, 0.000000, 0.000000, 0.000000, "El Corona", "Comic Sans MS"},
	{19482, 2077.273437, -1965.150268, 16.382827, 0.000000, 0.000000, 90.099952, "Willowfield", "Comic Sans MS"},
	{19482, 2331.430175, -1962.326538, 13.947140, 0.000000, 0.000000, -89.999938, "Willowfield", "Comic Sans MS"},
	{19482, 2451.227294, -1993.214843, 14.036875, 0.000000, 0.000000, 0.000000, "Willowfield", "Comic Sans MS"},
	{19482, 2756.278076, -2025.680175, 14.184690, 0.000000, 0.000000, 0.000000, "Playa del Seville", "Comic Sans MS"},
	{19482, 2506.598632, -1908.694335, 13.796878, 0.000000, 0.000000, 0.000000, "Willowfield", "Comic Sans MS"},
	{19482, 2081.605224, -1858.660400, 4.404378, 0.000000, 0.000000, 90.000068, "Willowfield", "Comic Sans MS"},
	{19482, 1901.501586, -1873.113281, 13.836730, 0.000000, 0.000000, -179.899948, "El Corona", "Comic Sans MS"},
	{19482, 1683.654418, -1893.120849, 14.335426, 0.000000, 0.000000, 0.000000, "Verdant Bluffs", "Comic Sans MS"},
	{19482, 1611.957763, -1913.331665, 19.618974, 0.699995, 0.000000, 89.899955, "Verdant Bluffs", "Comic Sans MS"},
	{19482, 1109.902099, -1874.032836, 13.906878, 0.000000, 0.000000, -89.999855, "Verdant Bluffs", "Comic Sans MS"},
	{19482, 1179.670776, -1677.983398, 14.652946, 0.000000, 0.000000, 0.000000, "Verona Beach", "Comic Sans MS"},
	{19482, 1732.407104, -1755.445678, 13.976381, 0.000000, 0.000000, 89.899955, "Little Mexico", "Comic Sans MS"},
	{19482, 2041.724487, -1831.741577, 14.096876, 0.000000, 0.000000, 179.899993, "Idlewood", "Comic Sans MS"},
	{19482, 2052.555419, -1884.408447, 13.776877, 0.000000, 0.000000, 89.899879, "Willowfield", "Comic Sans MS"},
	{19482, 2498.504394, -1773.022094, 13.706875, 0.000000, 0.000000, -90.200019, "Ganton", "Comic Sans MS"},
	{19482, 2358.530029, -1698.422363, 13.599339, 0.000000, 0.000000, -90.000038, "Ganton", "Comic Sans MS"},
	{19482, 2046.394531, -1643.161987, 13.666854, 1.000000, -0.400000, 178.900085, "Idlewood", "Comic Sans MS"},
	{19482, 2119.749755, -1594.611572, 14.285271, 0.000000, 0.000000, -90.100021, "Idlewood", "Comic Sans MS"},
	{19482, 2198.615722, -1593.728393, 14.449634, 0.399998, 0.000000, 167.199798, "Idlewood", "Comic Sans MS"},
	{19482, 1948.569091, -1576.395141, 14.231763, 0.000000, 0.000000, 135.099990, "Idlewood", "Comic Sans MS"},
	{19482, 1991.463256, -1548.016967, 13.829974, 0.000000, 0.000000, 90.000076, "Idlewood", "Comic Sans MS"},
	{19482, 1642.020141, -1463.881591, 14.386878, 0.000000, 0.000000, 89.900009, "Commerce", "Comic Sans MS"},
	{19482, 1813.535888, -1429.794677, 14.089694, 0.000000, 0.000000, 179.899612, "Commerce", "Comic Sans MS"},
	{19482, 1912.686401, -1417.371582, 14.090314, 0.000000, 0.000000, 91.099983, "Glen Park", "Comic Sans MS"},
	{19482, 2172.338623, -1507.887451, 24.286792, 0.000000, 0.000000, 179.900253, "Idlewood", "Comic Sans MS"},
	{19482, 2493.648681, -1564.366821, 23.987714, 0.000000, 0.000000, -89.599945, "East LS", "Comic Sans MS"},
	{19482, 2668.090820, -1564.791748, 19.811384, 4.899998, 0.200000, 0.000000, "East Beach", "Comic Sans MS"},
	{19482, 2780.257324, -1521.607788, 23.749608, 0.000000, 0.000000, 0.100001, "East Beach", "Comic Sans MS"},
	{19482, 2788.880615, -1464.685913, 24.577440, 0.000000, 0.199999, 0.000000, "East Beach", "Comic Sans MS"},
	{19482, 2823.777099, -1360.494384, 26.374938, 0.000000, 0.000000, 0.000000, "East Beach", "Comic Sans MS"},
	{19482, 2708.867919, -1333.161254, 47.937526, 0.000000, 0.399999, 89.799858, "Los Flores", "Comic Sans MS"},
	{19482, 2330.717529, -1347.739501, 24.661052, 0.000000, 0.000000, 0.000000, "East LS", "Comic Sans MS"},
	{19482, 2204.208496, -1334.810180, 24.564376, 0.000000, 0.000000, 0.000000, "Jefferson", "Comic Sans MS"},
	{19482, 2095.185058, -1345.671264, 24.494382, 0.000000, 0.000000, 90.099960, "Jefferson", "Comic Sans MS"},
	{19482, 2023.380737, -1294.620727, 21.437919, 0.000000, 0.000000, 0.000000, "Glen Park", "Comic Sans MS"},
	{19482, 1973.904541, -1299.795288, 24.150003, 0.000000, 0.000000, -89.999977, "Glen Park", "Comic Sans MS"},
	{19482, 2238.810302, -1193.024414, 26.204978, 0.000000, 0.000000, -89.899917, "Jefferson", "Comic Sans MS"},
	{19482, 2320.259033, -1211.424682, 28.336568, 0.000000, 0.000000, -179.999862, "East LS", "Comic Sans MS"},
	{19482, 2352.015136, -1247.249145, 22.720005, 0.000000, 0.000000, -179.900009, "East LS", "Comic Sans MS"},
	{19482, 2391.119384, -1244.501953, 24.955768, 2.799999, 0.000000, 0.000002, "East LS", "Comic Sans MS"},
	{19482, 2819.505126, -1161.833496, 25.672191, 0.000000, 0.000000, 89.999931, "East Beach", "Comic Sans MS"},
	{19482, 2502.500000, -1109.301513, 55.447704, 1.800000, -2.699999, -176.999969, "Las Colinas", "Comic Sans MS"},
	{19482, 2192.404785, -1093.436889, 30.591245, 0.000000, 1.700000, 155.399963, "Las Colinas", "Comic Sans MS"},
	{19482, 2222.512695, -1041.193847, 58.108978, 0.399999, 0.000000, -45.299930, "Las Colinas", "Comic Sans MS"},
	{19482, 2206.778564, -990.313842, 69.929756, 0.000000, 0.000000, 159.100128, "Las Colinas", "Comic Sans MS"},
	{19482, 2040.751953, -997.808227, 47.362178, 0.000000, 0.000000, -179.899703, "Las Colinas", "Comic Sans MS"},
	{19482, 1950.298461, -1146.292114, 22.868036, 0.000000, 0.000000, -89.800010, "Glen Park", "Comic Sans MS"},
	{19482, 1924.770263, -1093.111328, 25.566953, 0.000000, 0.000000, 85.799957, "Glen Park", "Comic Sans MS"},
	{19482, 1831.401977, -1101.332519, 24.160825, 0.000000, 0.000000, -179.999938, "Glen Park", "Comic Sans MS"},
	{19482, 1785.751098, -1011.347351, 24.598131, 0.000000, 0.000000, -104.200050, "Mulholland", "Comic Sans MS"}
};