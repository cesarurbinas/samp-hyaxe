enum
{
	INTERIOR_NO_INFO,
	INTERIOR_BINCO,
	INTERIOR_SUBURBAN,
	INTERIOR_PROLAPS,
	INTERIOR_DIDIER_SACHS,
	INTERIOR_VICTIM,
	INTERIOR_ZIP,
	INTERIOR_247,
	INTERIOR_PIZZA,
	INTERIOR_CLUCKIN_BELL,
	INTERIOR_BURGER_SHOT,
	INTERIOR_BANK_LS,
	INTERIOR_BANK_SF,
	INTERIOR_BANK_LV,
	INTERIOR_CITY_HALL_LS,
	INTERIOR_UNITY_STATION,
	INTERIOR_TRUCK,
	INTERIOR_POLICE_LS,
	INTERIOR_POLICE_SF,
	INTERIOR_POLICE_LV,
	INTERIOR_ALHAMBRA,
	INTERIOR_POLICE_GARAGE,
	INTERIOR_HOSPITAL,
	INTERIOR_CLUB
};
enum Enter_Exits
{
	ee_ID,
	ee_NAME[32],
	
	ee_INTERIOR_TYPE,
	
	ee_INT_MAPICON,
	ee_INT_FREEZE,
	ee_INT_WORLD,
	ee_INT_INTERIOR,
	Float:ee_INT_X,
	Float:ee_INT_Y,
	Float:ee_INT_Z,
	Float:ee_INT_ANGLE,
	
	ee_EXT_MAPICON,
	ee_EXT_FREEZE,
	ee_EXT_WORLD,
	ee_EXT_INTERIOR,
	Float:ee_EXT_X,
	Float:ee_EXT_Y,
	Float:ee_EXT_Z,
	Float:ee_EXT_ANGLE,
	
	ee_TIME_OPEN,
	ee_TIME_CLOSE,
	
	ee_INT_MAPICON_ID,
	ee_EXT_MAPICON_ID,
	Text3D:ee_INT_LABEL_ID,
	Text3D:ee_EXT_LABEL_ID,
	
	
	ee_INT_PICKUP_ID,	// No son pickups decorativos
	ee_EXT_PICKUP_ID	// Son pickups para identificar el id
};

new ENTER_EXIT[][Enter_Exits] = // EE = EnterExits
{
	// Tiendas de ropa
	{-1, "Binco", INTERIOR_BINCO, -1, false, 0, 15, 207.744949, -111.073318, 1005.132812, 0.0,	45, false, 0, 0, 2244.484863, -1665.223510, 15.476562, 0.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Binco", INTERIOR_BINCO, -1, false, 1, 15, 207.744949, -111.073318, 1005.132812, 0.0,	45, false, 0, 0, 2102.4263, 2257.5750, 11.0234, 273.9107, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // binco lv
	{-1, "Binco", INTERIOR_BINCO, -1, false, 2, 15, 207.744949, -111.073318, 1005.132812, 0.0,	45, false, 0, 0, 1656.5707, 1733.1418, 10.8281, 91.4768, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // binco lv
	{-1, "Binco", INTERIOR_BINCO, -1, false, 3, 15, 207.744949, -111.073318, 1005.132812, 0.0,	45, false, 0, 0, -2374.1768, 910.1226, 45.4317, 88.0863, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // binco sf
	{-1, "SubUrban", INTERIOR_SUBURBAN, -1, false, 0, 1, 203.906326, -50.494247, 1001.804687, 0.0,	45, false, 0, 0, 2112.835205, -1211.456665, 23.962865, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "SubUrban", INTERIOR_SUBURBAN, -1, false, 1, 1, 203.906326, -50.494247, 1001.804687, 0.0,	45, false, 0, 0, 2779.4438, 2453.6345, 11.0625, 133.9879, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // su lv
	{-1, "SubUrban", INTERIOR_SUBURBAN, -1, false, 2, 1, 203.906326, -50.494247, 1001.804687, 0.0,	45, false, 0, 0, -2490.3079, -28.9528, 25.6172, 87.1329, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // su sf
	{-1, "ProLaps", INTERIOR_PROLAPS, -1, false, 0, 3, 206.995925, -140.021163, 1003.507812, 0.0,	45, false, 0, 0, 499.498168, -1360.616088, 16.368682, 340.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Didier Sachs", INTERIOR_DIDIER_SACHS, -1, false, 0, 14, 204.348281, -168.678985, 1000.523437, 0.0,	45, false, 0, 0, 453.858032, -1478.098632, 30.813968, 111.110641, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Victim", INTERIOR_VICTIM, -1, false, 0, 5, 227.350250, -8.188652, 1002.210937, 90.0,	45, false, 0, 0, 461.541320, -1500.892333, 31.049194, 98.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Victim", INTERIOR_VICTIM, -1, false, 1, 5, 227.350250, -8.188652, 1002.210937, 90.0,	45, false, 0, 0, -1694.8934, 951.5375, 24.8906, 138.3028, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // victim sf
	{-1, "Victim", INTERIOR_VICTIM, -1, false, 2, 5, 227.350250, -8.188652, 1002.210937, 90.0,	45, false, 0, 0, 2802.7219, 2430.3391, 11.0625, 133.3612, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // victim lv
	{-1, "ZIP", INTERIOR_ZIP, -1, false, 0, 18, 161.401184, -96.887367, 1001.804687, 0.0,	45, false, 0, 0, 1456.611816, -1137.818969, 23.961400, 215.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "ZIP", INTERIOR_ZIP, -1, false, 1, 18, 161.401184, -96.887367, 1001.804687, 0.0,	45, false, 0, 0, 2571.9072, 1904.4851, 11.0234, 191.6232, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // zip lv
	{-1, "ZIP", INTERIOR_ZIP, -1, false, 2, 18, 161.401184, -96.887367, 1001.804687, 0.0,	45, false, 0, 0, 2090.3845, 2224.2493, 11.0234, 179.2598, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // zip lv
	{-1, "ZIP", INTERIOR_ZIP, -1, false, 3, 18, 161.401184, -96.887367, 1001.804687, 0.0,	45, false, 0, 0, -1882.4941, 866.1361, 35.1719, 135.4828, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // zip sf
	// 24/7
	{-1, "24/7", INTERIOR_247, -1, false, 0, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 1352.314941, -1758.961425, 13.507812, 0.0,	0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "24/7", INTERIOR_247, -1, false, 1, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 1833.540771, -1842.542724, 13.578125, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "24/7", INTERIOR_247, -1, false, 2, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 1315.453247, -897.967102, 39.578125, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "24/7", INTERIOR_247, -1, false, 3, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 1000.317199, -919.933349, 42.328125, 105.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "24/7", INTERIOR_247, -1, false, 4, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2117.6494, 897.1806, 11.1797, 12.1038, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 5, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2637.5356, 1129.2190, 11.1797, 182.5185, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 6, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2546.6067, 1972.2355, 10.8203, 180.0468, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 7, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2452.4578, 2064.7595, 10.8203, 181.0483, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 8, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2194.5137, 1991.1290, 12.2969, 91.8167, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 9, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2097.4353, 2224.2637, 11.0234, 180.5131, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 10, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 1937.4686, 2307.2776, 10.8203, 92.3837, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 11, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2188.1104, 2469.9355, 11.2422, 272.2827, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 12, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2150.9756, 2734.2964, 11.1763, 3.1420, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 13, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, 2884.8887, 2453.7634, 11.0690, 224.2287, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 lv
	{-1, "24/7", INTERIOR_247, -1, false, 14, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, -1676.0208, 432.0192, 7.1797, 223.0368, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 sf
	{-1, "24/7", INTERIOR_247, -1, false, 15, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, -2419.8621, 969.9724, 45.2969, 271.3646, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 sf
	{-1, "24/7", INTERIOR_247, -1, false, 16, 18, -30.958774, -91.807441, 1003.546875, 0.0,	17, false, 0, 0, -2442.8604, 755.0207, 35.1719, 179.8825, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, //  24/7 sf
	// WSP
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 0, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 2105.234619, -1806.479614, 13.554687, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 1, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 1366.856079, 248.451507, 19.566932, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 2, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 2333.892333, 74.830787, 26.620975, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 3, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 2637.8176, 1849.6595, 11.0234, 91.6690, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // ps lv
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 4, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 2540.3069, 2150.0823, 10.8203, 92.0697, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // ps lv
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 5, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 2469.5881, 2124.7515, 10.8203, 2.2244, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // ps lv
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 6, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 2083.4851, 2224.2705, 11.0234, 181.7665, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // ps lv
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 7, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 2351.9446, 2532.8774, 10.8203, 184.0101, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // ps lv
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 8, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, 2756.3547, 2477.1909, 11.0625, 140.5680, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // ps lv
	{-1, "Well Stacked Pizza", INTERIOR_PIZZA, -1, false, 9, 5, 372.310729, -133.246292, 1001.492187, 0.0,	29, false, 0, 0, -1808.3300, 945.7053, 24.8906, 219.7702, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // ps sf
	// CB
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 0, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, 2419.926025, -1509.024780, 24.000000, 270.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 1, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, 2397.772949, -1898.847778, 13.546875, 0.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 2, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, 928.553466, -1352.848876, 13.343750, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 3, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, 2637.8179, 1671.8778, 11.0234, 91.0423, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // cb lv
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 4, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, 2393.0376, 2042.6967, 10.8203, 4.9767, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // cb lv
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 5, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, 2102.3667, 2228.7712, 11.0234, 270.4406, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // cb lv
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 6, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, 2838.4988, 2407.5911, 11.0690, 222.9754, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // cb lv
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 7, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, -2672.3337, 258.6855, 4.6328, 0.1230, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // cb sf
	{-1, "Cluckin Bell", INTERIOR_CLUCKIN_BELL, -1, false, 8, 9, 364.914093, -11.778851, 1001.851562, 0.0,	14, false, 0, 0, -2671.8418, 258.2193, 4.6328, 4.9983, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // cb sf
	// BS
	{-1, "Burger Shot", INTERIOR_BURGER_SHOT, -1, false, 0, 10, 362.869354, -75.153747, 1001.507812, 315.0,	10, false, 0, 0, 810.715270, -1616.163330, 13.546875, 270.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Burger Shot", INTERIOR_BURGER_SHOT, -1, false, 1, 10, 362.869354, -75.153747, 1001.507812, 315.0,	10, false, 0, 0, 1199.272216, -918.372253, 43.121376, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Burger Shot", INTERIOR_BURGER_SHOT, -1, false, 2, 10, 362.869354, -75.153747, 1001.507812, 315.0,	10, false, 0, 0, 2478.7559, 2034.7145, 11.0625, 112.9093, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // bs lv
	{-1, "Burger Shot", INTERIOR_BURGER_SHOT, -1, false, 3, 10, 362.869354, -75.153747, 1001.507812, 315.0,	10, false, 0, 0, 2366.6165, 2071.0725, 10.8203, 88.0179, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // bs lv
	{-1, "Burger Shot", INTERIOR_BURGER_SHOT, -1, false, 4, 10, 362.869354, -75.153747, 1001.507812, 315.0,	10, false, 0, 0, 1872.5840, 2071.9214, 11.0625, 270.1482, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // bs lv
	{-1, "Burger Shot", INTERIOR_BURGER_SHOT, -1, false, 5, 10, 362.869354, -75.153747, 1001.507812, 315.0,	10, false, 0, 0, 2169.7883, 2795.8948, 10.8203, 272.9245, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // bs lv
	{-1, "Burger Shot", INTERIOR_BURGER_SHOT, -1, false, 6, 10, 362.869354, -75.153747, 1001.507812, 315.0,	10, false, 0, 0, -2336.4749, -166.7181, 35.5547, 270.8090, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // bs sf
	{-1, "Burger Shot", INTERIOR_BURGER_SHOT, -1, false, 7, 10, 362.869354, -75.153747, 1001.507812, 315.0,	10, false, 0, 0, -1912.3065, 828.4004, 35.1852, 317.1945, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // bs sf
	// OTHER
	{-1, P_BANK, INTERIOR_CITY_HALL_LS, -1, true, 20, 20, 1807.021240, -1393.364135, 2770.660156, 177.306365, 37, false, 0, 0, 1571.468627, -1336.893188, 16.484375, 0.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Sanitary Andreas", INTERIOR_UNITY_STATION, -1, false, 0, 3, 1494.416015, 1303.681884, 1093.289062, 0.0, -1, false, 0, 0, 1664.634033, -2185.537353, 13.546875, 270.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, P_TRUCKS, INTERIOR_TRUCK, -1, true, 25, 18, 1297.457031, -61.437820, 1002.498046, 180.0, -1, false, 0, 0, 2509.533935, -2637.530761, 13.645265, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, P_SAPD, INTERIOR_POLICE_LS, -1, true, 0, 6, 1881.801635, -1688.519531, 5216.709960, 130.0, 30, false, 0, 0, 1555.400390, -1675.611694, 16.195312, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, P_GARAGE, INTERIOR_POLICE_GARAGE, -1, true, 0, 6, 1881.341674, -1727.080688, 5216.709960, 270.594818, -1, false, 0, 0, 1568.651977, -1690.080688, 6.218750, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	//{-1, "Alhambra Club", INTERIOR_ALHAMBRA, -1, false, 0, 17, 493.487731, -24.662528, 1000.679687, 0.0, 48, false, 0, 0, 1836.876586, -1682.407104, 13.329626, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Tecno", INTERIOR_NO_INFO, -1, true, 1, 17, 1715.986572, -1254.442993, 471.174316, 269.257873, 42, false, 0, 0, 1738.542846, -1269.991577, 13.543532, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 55, 17, 310.9720, 2500.2966, 17.7957, 38, false, 0, 0, 2233.164306, -1333.295043, 23.981561, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 55, 17, 310.9720, 2500.2966, 17.7957, 38, false, 0, 0, 2490.7651, 918.6208, 11.0234, 95.5125, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia lv
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 55, 17, 310.9720, 2500.2966, 17.7957, 38, false, 0, 0, 2519.0901, 2033.3397, 11.1719, 77.3339, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia lv
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 55, 17, 310.9720, 2500.2966, 17.7957, 38, false, 0, 0, 2225.2419, 2522.4724, 11.0222, 182.3552, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia lv
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 55, 17, 310.9720, 2500.2966, 17.7957, 38, false, 0, 0, 1455.4608, 750.8949, 11.0234, 94.6260, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia lv
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 55, 17, 310.9720, 2500.2966, 17.7957, 38, false, 0, 0, -2664.6973, -2.3037, 6.1328, 89.0111, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia sf
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 55, 17, 310.9720, 2500.2966, 17.7957, 38, false, 0, 0, -1989.4664, 1117.8735, 54.4688, 271.7057, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia sf
	//{-1, P_D_BM, INTERIOR_NO_INFO, -1, true, 11, 17, 2319.062011, -1786.475708, 1600.751953, 90.0, 23, false, 0, 0, 2071.894287, -1551.255737, 13.424154, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, P_W_BM, INTERIOR_NO_INFO, -1, true, 21, 20, 2140.289062, -1172.987060, -10.893062, 350.0, 23, false, 0, 0, 2355.609375, -1039.150268, 54.148437, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, P_W_BM, INTERIOR_NO_INFO, -1, true, 31, 21, 2140.289062, -1172.987060, -10.893062, 350.0, 23, false, 0, 0, 2494.093261, -1464.236328, 24.025127, 360.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Mina", INTERIOR_NO_INFO, -1, true, 36, 25, 1147.865356, 1001.796081, -99.214622, 273.832519, 11, false, 0, 0, 509.152374, -723.324951, 19.869243, 340.774505, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Sección B", INTERIOR_NO_INFO, -1, true, 37, 26, 1988.257446, 1204.595825, -63.139907, 268.650756, 56, false, 36, 25, 1270.046142, 1000.668884, -99.214637, 81.757308, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Sección C", INTERIOR_NO_INFO, -1, true, 38, 27, 2546.433105, 1924.534423, -58.649192, 265.830688, 56, false, 37, 26, 2067.543212, 1201.233398, -61.074184, 85.059127, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "MFB", INTERIOR_NO_INFO, -1, true, 0, 28, 3854.231933, -1265.252319, 7547.983398, 188.315292, -1, false, 0, 0, 2770.574462, -1628.717163, 12.177460, 358.490142, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Prostíbulo", INTERIOR_CLUB, -1, false, 0, 3, 1212.160522, -26.097007, 1000.953125, 180.0, 21, false, 0, 0, 693.761047, 1967.498168, 5.539062, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Prostíbulo", INTERIOR_CLUB, -1, false, 1, 3, 1212.160522, -26.097007, 1000.953125, 180.0, 21, false, 0, 0, 1145.013916,-1131.447998, 23.828125, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Prostíbulo", INTERIOR_CLUB, -1, false, 2, 3, 1212.160522, -26.097007, 1000.953125, 180.0, 21, false, 0, 0, 2421.501953,-1219.768432, 25.527839, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Maik Santander", INTERIOR_CLUB, -1, false, 6, 5, 1267.663208, -781.323242, 1091.906250, 180.0, -1, false, 0, 0, -245.578720, -2193.103271, 29.839702, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Maik Santander", INTERIOR_CLUB, -1, false, 174, 5, 1267.663208, -781.323242, 1091.906250, 180.0, -1, false, 0, 0, 1456.5785, 2773.6423, 10.8203, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Club de la pelea", INTERIOR_NO_INFO, -1, false, 0, 16, -14.497008, 100.967079, 1101.521118, 180.0, -1, false, 0, 0, 950.341247, -987.135864, 38.743835, 322.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Osborn", INTERIOR_NO_INFO, -1, true, 0, 29, 887.343566, 1918.198364, -88.974365, 93.182411, -1, false, 0, 0, -2517.1223, -664.4894, 139.3531, 358.490142, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Estadio", INTERIOR_NO_INFO, -1, true, 1336, 0, 2684.587890, -1733.565185, 424.386718, 180.0, -1, false, 0, 0, 2781.461181, -1813.566162, 11.843750, 211.490142, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	//{-1, "Moriarty Luxury Bar", INTERIOR_NO_INFO, -1, true, 0, 64, 2627.9360, 490.5309, 2621.2078, 173.315292, -1, false, 0, 0, 2851.3330, -1532.3297, 11.0991, 271.490142, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "TFC", INTERIOR_NO_INFO, -1, true, 0, 55, 436.9655, -996.6303, 931.0529, -90.0, -1, false, 0, 0, 437.3256, -999.9439, 93.1982, 92.18, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "DPT", INTERIOR_CLUB, -1, false, 264, 5, 1267.663208, -781.323242, 1091.906250, 180.0, -1, false, 0, 0, 1132.5565, -2034.1417, 69.1477, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, "Hospital", INTERIOR_HOSPITAL, -1, true, 2, 3, -204.522659, -1735.630004, 675.768737, 181.129348, 22, false, 0, 0, 1172.832763, -1323.269531, 15.400051, 270.0	, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}
};