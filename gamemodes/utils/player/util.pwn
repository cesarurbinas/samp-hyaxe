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
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 2, 17, 387.479644, 2324.503906, 1889.583374, 88.438690, 38, false, 0, 0, 2233.164306, -1333.295043, 23.981561, 90.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 3, 17, 387.479644, 2324.503906, 1889.583374, 88.438690, 38, false, 0, 0, 2490.7651, 918.6208, 11.0234, 95.5125, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia lv
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 4, 17, 387.479644, 2324.503906, 1889.583374, 88.438690, 38, false, 0, 0, 2519.0901, 2033.3397, 11.1719, 77.3339, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia lv
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 5, 17, 387.479644, 2324.503906, 1889.583374, 88.438690, 38, false, 0, 0, 2225.2419, 2522.4724, 11.0222, 182.3552, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia lv
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 6, 17, 387.479644, 2324.503906, 1889.583374, 88.438690, 38, false, 0, 0, 1455.4608, 750.8949, 11.0234, 94.6260, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia lv
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 7, 17, 387.479644, 2324.503906, 1889.583374, 88.438690, 38, false, 0, 0, -2664.6973, -2.3037, 6.1328, 89.0111, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia sf
	{-1, P_CHURCH, INTERIOR_NO_INFO, -1, true, 8, 17, 387.479644, 2324.503906, 1889.583374, 88.438690, 38, false, 0, 0, -1989.4664, 1117.8735, 54.4688, 271.7057, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1}, // iglesia sf
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

enum enum_JAIL_POSITIONS
{
	jail_INT,
	Float:jail_X,
	Float:jail_Y,
	Float:jail_Z,
	Float:jail_ANGLE,
	jail_INTERIOR
};
new JAIL_POSITIONS[][enum_JAIL_POSITIONS] =
{
	{INTERIOR_POLICE_LS, 1899.122192, -1757.699584, 5218.986816, 180.0, 6}, //jaills
	{INTERIOR_POLICE_SF, 1899.122192, -1757.699584, 5218.986816, 180.0, 6}, //jailsf
	{INTERIOR_POLICE_LV, 1899.122192, -1757.699584, 5218.986816, 180.0, 6} //jaillv
};

// Cloths
enum Clothing_Shop_Info
{
	clothing_shop_INTERIOR_TYPE,
	clothing_shop_NAME[24],
	Float:clothing_shop_X,
	Float:clothing_shop_Y,
	Float:clothing_shop_Z,
	Float:clothing_shop_ANGLE,
	clothing_shop_INTERIOR
};

new Clothing_Shop_Positions[][Clothing_Shop_Info] =
{
	{INTERIOR_BINCO, "Binco", 207.733657, -100.633468, 1005.257812, 180.0, 15}, //Binco
	{INTERIOR_SUBURBAN, "SubUrban", 203.905395, -43.450450, 1001.804687, 180.0, 1}, //SubUrban
	{INTERIOR_PROLAPS, "ProLaps", 207.049148, -129.177581, 1003.507812, 180.0, 3}, //prolaps
	{INTERIOR_DIDIER_SACHS, "Didier Sachs", 204.348281, -159.493728, 1000.523437, 180.0, 14}, //Didier
	{INTERIOR_VICTIM, "Victim", 206.374328, -7.241514, 1001.210937, 270.0, 5}, //Victim
	{INTERIOR_ZIP, "ZIP", 161.443634, -83.589271, 1001.804687, 180.0, 18} //Zip
};

// Super products
enum
{
	PRODUCT_TYPE_NONE,
	PRODUCT_TYPE_FOOD,
	PRODUCT_TYPE_PHONE,
	PRODUCT_TYPE_GPS,
	PRODUCT_TYPE_PHONE_RESOLVER
};
enum Supermarket_Enum
{
	product_TYPE,
	product_NAME[24],
	product_PRICE,
	Float:product_HUNGRY,
	Float:product_THIRST,
	product_DRUNK
};
new Supermarket_Product_List[][Supermarket_Enum] =
{
	{PRODUCT_TYPE_PHONE, NAME_PHONE, 350, 0.0, 0.0, 0},
	{PRODUCT_TYPE_PHONE_RESOLVER, NAME_PHONE_R, 200, 0.0, 0.0, 0},
	{PRODUCT_TYPE_GPS, "GPS", 300, 0.0, 0.0, 0},
	{PRODUCT_TYPE_FOOD, "Botella de agua", 80, 0.0, 25.0, 0},
	{PRODUCT_TYPE_FOOD, "Sprunk", 40, 0.0, 12.0, 0},
	//{PRODUCT_TYPE_FOOD, "Lata de refresco cola", 30, 0.0, 10.0, 0},
	{PRODUCT_TYPE_FOOD, "Barrita energética", 80, 15.0, 0.0, 0},
	//{PRODUCT_TYPE_FOOD, "Porción de pizza", 60, 20.0, 0.0, 0},
	//{PRODUCT_TYPE_FOOD, "Ensalada", 50, 15.0, 2.0, 0},
	{PRODUCT_TYPE_FOOD, "Leche", 70, 25.0, 25.0, 0},
	//{PRODUCT_TYPE_FOOD, "Sándwich de milanesa", 45, 10.0, 2.0, 0},
	//{PRODUCT_TYPE_FOOD, "Choripan", 45, 10.0, 2.0, 0},
	{PRODUCT_TYPE_FOOD, "Galletas", 20, 8.0, 2.0, 0},
	{PRODUCT_TYPE_FOOD, "Caramelos masticables", 1, 2.0, 0.0, 0},
	{PRODUCT_TYPE_FOOD, "Chicle bubbaloo", 3, 2.0, 0.0, 0},
	{PRODUCT_TYPE_FOOD, "Cerveza", 40, 0.0, 3.0, 1000},
	//{PRODUCT_TYPE_FOOD, "Vodka", 80, 0.0, 3.0, 2500},
	{PRODUCT_TYPE_FOOD, "Vino", 80, 0.0, 3.0, 2500}
	//{PRODUCT_TYPE_FOOD, "Orina de toro", 3000, 0.0, 40.0, 9500},
	//{PRODUCT_TYPE_FOOD, "Whisky", 200, 0.0, 3.0, 3000}
};

// Food
enum Fast_Food_Info
{
	fast_food_INTERIOR_TYPE,
	fast_food_NAME[24],
	Float:fast_food_X,
	Float:fast_food_Y,
	Float:fast_food_Z,
	fast_food_INTERIOR
};
new Fast_Food_Positions[][Fast_Food_Info] =
{
	{INTERIOR_BURGER_SHOT, "Burger Shot", 375.913238, -67.435272, 1001.507812, 10}, // BurgerShot
	{INTERIOR_PIZZA, "Well Stacked Pizza", 375.254730, -118.804710, 1001.499511, 5}, //Pizza
	{INTERIOR_CLUCKIN_BELL, "Cluckin Bell", 368.757904, -6.018908, 1001.851562, 9} //Cluckin Bell
};

ExitSite(playerid)
{
    if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return 0;

    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1881.801635, -1688.519531, 5216.709960))
    {
    	SetPlayerPosEx(playerid, 1555.400390, -1675.611694, 16.195312, 180.0, 0, 0, false);
        return 1;
    }

    if (IsPlayerInRangeOfPoint(playerid, 2.0, 1881.341674, -1727.080688, 5216.709960))
    {
    	SetPlayerPosEx(playerid, 1568.651977, -1690.080688, 6.218750, 180.0, 0, 0, false);
        return 1;
    }

    if (PLAYER_TEMP[playerid][py_LAST_PICKUP_ID] == 0) return 1;

    new info[3];
    Streamer_GetArrayData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_EXTRA_ID, info);
    if (info[0] == PICKUP_TYPE_NONE) return 0;

    new Float:x, Float:y, Float:z; 
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_X, x);
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Y, y);
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Z, z);

    if (!IsPlayerInRangeOfPoint(playerid, 1.0, x, y, z)) return 0;

    PLAYER_TEMP[playerid][py_IN_MARKET] = false;
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][41]);

    switch(info[0])
    {
        case PICKUP_TYPE_ENTER_EXIT:
        {
            if (info[2] == 1) // Está en el Pickup Interior y quiere ir al exterior
            {
                CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
                CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
                PLAYER_TEMP[playerid][py_INTERIOR_INDEX] = -1;
                SetPlayerPosEx(playerid, ENTER_EXIT[info[1]][ee_EXT_X], ENTER_EXIT[info[1]][ee_EXT_Y], ENTER_EXIT[info[1]][ee_EXT_Z], ENTER_EXIT[info[1]][ee_EXT_ANGLE], ENTER_EXIT[info[1]][ee_EXT_INTERIOR], ENTER_EXIT[info[1]][ee_EXT_WORLD], false /*ENTER_EXIT[info[1]][ee_EXT_FREEZE]*/);
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
                if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);
                FreezePlayer(playerid);

                if (ENTER_EXIT[ info[1] ][ee_EXT_INTERIOR] == 0) SetPlayerTime(playerid, SERVER_TIME[0], SERVER_TIME[1]);
                if (ENTER_EXIT[info[1]][ee_INTERIOR_TYPE] == INTERIOR_ALHAMBRA) if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);
            }
            else ShowPlayerMessage(playerid, "~r~No estás en sitio correcto.", 2);
        }
        case PICKUP_TYPE_PROPERTY:
        {
            if (info[2] == 1) // Está en el Pickup Interior y quiere ir al exterior
            {
            	PLAYER_TEMP[playerid][py_ACTUAL_PROPERTY] = 0;
                CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
                CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;
                PLAYER_TEMP[playerid][py_PROPERTY_INDEX] = -1;
                PLAYER_TEMP[playerid][py_CLUB_INDEX] = -1;
                SetPlayerPosEx(playerid, PROPERTY_INFO[info[1]][property_EXT_X], PROPERTY_INFO[info[1]][property_EXT_Y], PROPERTY_INFO[info[1]][property_EXT_Z], PROPERTY_INFO[info[1]][property_EXT_ANGLE], PROPERTY_INFO[info[1]][property_EXT_INTERIOR], 0, false /*PROPERTY_INFO[info[1]][property_EXT_FREEZE]*/, false);
                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
                if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);
                FreezePlayer(playerid);
            }
            else ShowPlayerMessage(playerid, "~r~No estás en sitio correcto.", 2);
        }
        case PICKUP_TYPE_CLUB:
        {
            if (info[2] == 1) // Está en el Pickup Interior y quiere ir al exterior
            {
            	PLAYER_TEMP[playerid][py_CLUB_INDEX] = -1;
                CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
                CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = 0;

                SetPlayerPosEx(
                	playerid,
                	CLUBS_INFO[ info[1] ][club_X],
                	CLUBS_INFO[ info[1] ][club_Y],
                	CLUBS_INFO[ info[1] ][club_Z],
                	CLUBS_INFO[ info[1] ][club_ANGLE],
                	0,
                	0,
                	false,
                	false
                );

                SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
                if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);
                FreezePlayer(playerid);
            }
            else ShowPlayerMessage(playerid, "~r~No estás en sitio correcto.", 2);
        }
        default: ShowPlayerMessage(playerid, "~r~No estás en sitio correcto.", 2);
    }
    return 1;
}

EnterSite(playerid)
{
    if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_CRACK || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return 0;
    if (PLAYER_TEMP[playerid][py_LAST_PICKUP_ID] == 0) return 1;
        
    new info[3];
    Streamer_GetArrayData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_EXTRA_ID, info);
    if (info[0] == PICKUP_TYPE_NONE) return 0;
    
    new Float:x, Float:y, Float:z; 
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_X, x);
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Y, y);
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Z, z);
    
    if (!IsPlayerInRangeOfPoint(playerid, 1.0, x, y, z)) return 0;
    
    switch(info[0])
    {
        case PICKUP_TYPE_ENTER_EXIT:
        {
            PLAYER_TEMP[playerid][py_HOSPITAL] = GetNearestHospitalForPlayer(playerid);
            if (PLAYER_TEMP[playerid][py_HOSPITAL] == -1) PLAYER_TEMP[playerid][py_HOSPITAL] = 1;
    
            if (info[2] == 2) // Está en el Pickup Exterior y quiere ir al interior
            {
                if (ENTER_EXIT[info[1]][ee_TIME_OPEN] == 0 && ENTER_EXIT[info[1]][ee_TIME_CLOSE] == 0) // 24 horas
                {
                	if (PLAYER_TEMP[playerid][py_ROCK]) return ShowPlayerMessage(playerid, "~r~Primero debes entregar la roca.", 3);

                    if (ENTER_EXIT[ info[1] ][ee_INT_INTERIOR] == 25)
                 	{
                 		SetPlayerTime(playerid, 2, 2);
                 	}

                 	if (ENTER_EXIT[ info[1] ][ee_INT_INTERIOR] == 26)
                 	{
                 		if (PLAYER_SKILLS[playerid][WORK_MINER] < 150) return ShowPlayerMessage(playerid, "~r~Necesitas 150 de experiencia de minero para~n~picar en esta zona.", 5);
                 		SetPlayerTime(playerid, 2, 2);
                 	}

                 	if (ENTER_EXIT[ info[1] ][ee_INT_INTERIOR] == 27)
                 	{
                 		if (PLAYER_SKILLS[playerid][WORK_MINER] < 500) return ShowPlayerMessage(playerid, "~r~Necesitas 500 de experiencia de minero para~n~picar en esta zona.", 5);
                 		SetPlayerTime(playerid, 2, 2);
                 	}

                    CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_INTERIOR;
                    CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = ENTER_EXIT[info[1]][ee_ID];
                    PLAYER_TEMP[playerid][py_INTERIOR_INDEX] = info[1];
                    SetPlayerPosEx(playerid, ENTER_EXIT[info[1]][ee_INT_X], ENTER_EXIT[info[1]][ee_INT_Y], ENTER_EXIT[info[1]][ee_INT_Z], ENTER_EXIT[info[1]][ee_INT_ANGLE], ENTER_EXIT[info[1]][ee_INT_INTERIOR], ENTER_EXIT[info[1]][ee_INT_WORLD], false /*ENTER_EXIT[info[1]][ee_INT_FREEZE]*/, true);
                    FreezePlayer(playerid);

                    if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);

                    if (ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE] == INTERIOR_CLUB)
					{
						StopAudioStreamForPlayer(playerid);
						PlayAudioStreamForPlayer(playerid, "http://somafm.com/tags.pls");			
					}
                }
                else
                {
                    if (is_open(SERVER_TIME[0], ENTER_EXIT[info[1]][ee_TIME_OPEN], ENTER_EXIT[info[1]][ee_TIME_CLOSE]))
                    {
                        CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_INTERIOR;
                        CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = ENTER_EXIT[info[1]][ee_ID];
                        PLAYER_TEMP[playerid][py_INTERIOR_INDEX] = info[1];
                        SetPlayerPosEx(playerid, ENTER_EXIT[info[1]][ee_INT_X], ENTER_EXIT[info[1]][ee_INT_Y], ENTER_EXIT[info[1]][ee_INT_Z], ENTER_EXIT[info[1]][ee_INT_ANGLE], ENTER_EXIT[info[1]][ee_INT_INTERIOR], ENTER_EXIT[info[1]][ee_INT_WORLD], false /*ENTER_EXIT[info[1]][ee_INT_FREEZE]*/, true);
                        FreezePlayer(playerid);
                    }
                    else SendClientMessageEx(playerid, COLOR_WHITE, "{C4FF66}%s "COL_WHITE"está cerrado, su horario es: {C4FF66}%02d:00 - %02d:00.", ENTER_EXIT[info[1]][ee_NAME], ENTER_EXIT[info[1]][ee_TIME_OPEN], ENTER_EXIT[info[1]][ee_TIME_CLOSE]);
                }
            }
            else ExitSite(playerid);
        }
        case PICKUP_TYPE_PROPERTY:
        {
            PLAYER_TEMP[playerid][py_HOSPITAL] = GetNearestHospitalForPlayer(playerid);
            if (PLAYER_TEMP[playerid][py_HOSPITAL] == -1) PLAYER_TEMP[playerid][py_HOSPITAL] = 1;
            
            if (PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] > 0) return ShowPlayerMessage(playerid, "~r~No puedes entrar a una propiedad~n~teniendo cargos.", 3);

            if (info[2] == 2) // Está en el Pickup Exterior y quiere ir al interior
            {
                if (!PROPERTY_INFO[info[1]][property_SOLD])
                {
                	new str_text[264];
                	if (PROPERTY_INFO[info[1]][property_EXTRA])
                	{
                		format(str_text, sizeof(str_text), ""COL_WHITE"Precio: %d "SERVER_COIN"\nNivel: %d\n\nVIP: %d\n\nUse /comprar para comprar la propiedad", PROPERTY_INFO[info[1]][property_EXTRA], PROPERTY_INFO[info[1]][property_LEVEL], PROPERTY_INFO[info[1]][property_VIP_LEVEL]);
                	}
                	else
                	{
                		format(str_text, sizeof(str_text), ""COL_WHITE"Precio: %s$\nNivel: %d\nVIP: %d\n\nUse /comprar para comprar la propiedad", number_format_thousand(PROPERTY_INFO[info[1]][property_PRICE]), PROPERTY_INFO[info[1]][property_LEVEL], PROPERTY_INFO[info[1]][property_VIP_LEVEL]);	
                	}

                	PLAYER_TEMP[playerid][py_ACTUAL_PROPERTY] = PROPERTY_INFO[info[1]][property_ID];
					ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Propiedad", str_text, "Cerrar", "");

					new Float:apos[3];
                    GetPlayerPos(playerid, apos[0], apos[1], apos[2]);
                    SetTimerEx("RestorePlayerPos", 30000, false, "ifff", playerid, apos[0], apos[1], apos[2]);

                	CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_OWN_PROPERTY;
                    CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = PROPERTY_INFO[info[1]][property_ID];
                    PLAYER_TEMP[playerid][py_PROPERTY_INDEX] = info[1];
                    PLAYER_TEMP[playerid][py_CLUB_INDEX] = -1;
                    SetPlayerPosEx(playerid, PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_X], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_Y], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_Z], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_ANGLE], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_INTERIOR], PROPERTY_INFO[info[1]][property_ID], false /*PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_FREEZE]*/, true);
                    FreezePlayer(playerid);

                    ShowPlayerMessage(playerid, "Tienes ~r~30 segundos~w~ para ver la propiedad.", 10);
                    return 1;
                }

                if (PROPERTY_INFO[info[1]][property_CREW])
                {
                    if (!PLAYER_CREW[playerid][player_crew_VALID]) return SendClientMessageEx(playerid, COLOR_WHITE, "{999999}Solo miembros de la banda pueden entrar.");
                    if (PLAYER_CREW[playerid][player_crew_ID] != PROPERTY_INFO[info[1]][property_CREW_ID]) return SendClientMessageEx(playerid, COLOR_WHITE, "{999999}Solo miembros de la banda pueden entrar.");
                    
                    CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_GUEST_PROPERTY;
                    CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = PROPERTY_INFO[info[1]][property_ID];
                    PLAYER_TEMP[playerid][py_PROPERTY_INDEX] = info[1];
                    PLAYER_TEMP[playerid][py_CLUB_INDEX] = -1;
                    SetPlayerPosEx(playerid, PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_X], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_Y], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_Z], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_ANGLE], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_INTERIOR], PROPERTY_INFO[info[1]][property_ID], false /*PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_FREEZE]*/, true);
                    FreezePlayer(playerid);
                }
                else
                {
                    if (PROPERTY_INFO[info[1]][property_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID])
                    {
                        CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_OWN_PROPERTY;
                        CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = PROPERTY_INFO[info[1]][property_ID];
                        PLAYER_TEMP[playerid][py_PROPERTY_INDEX] = info[1];
                        PLAYER_TEMP[playerid][py_CLUB_INDEX] = -1;
                        SetPlayerPosEx(playerid, PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_X], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_Y], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_Z], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_ANGLE], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_INTERIOR], PROPERTY_INFO[info[1]][property_ID], false /*PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_FREEZE]*/, true);
                        FreezePlayer(playerid);
                    }
                    else
                    {
                        if (gettime() < PLAYER_TEMP[playerid][py_ANTIFLOOD_KNOCK_PROPERTY] + 10) return SendClientMessage(playerid, 0x999999AA, "Espera para volver a tocar, si no te quieren abrir, vete.");
                        
                        new owner_playerid = GetOwnerIntProperty(PROPERTY_INFO[info[1]][property_ID]);
                        if (owner_playerid == -1) return ShowPlayerMessage(playerid, "Has tocado en la puerta, pero parece que no hay nadie.", 4);
                        PLAYER_TEMP[playerid][py_ANTIFLOOD_KNOCK_PROPERTY] = gettime();
                        PLAYER_TEMP[owner_playerid][py_KNOCK_PLAYER_ID] = playerid;
                        ShowPlayerNotification(owner_playerid, "Están tocando en la puerta, presione la tecla Y estando en la puerta para dejarlo entrar o simplemente ignórelo.", 4);
                        ShowPlayerMessage(playerid, "Has tocado en la puerta, espera a que te abran.", 7);
                    }
                }
            }
            else ExitSite(playerid);
        }
        case PICKUP_TYPE_CLUB:
        {
            PLAYER_TEMP[playerid][py_HOSPITAL] = GetNearestHospitalForPlayer(playerid);
            if (PLAYER_TEMP[playerid][py_HOSPITAL] == -1) PLAYER_TEMP[playerid][py_HOSPITAL] = 1;
    
            if (info[2] == 2) // Está en el Pickup Exterior y quiere ir al interior
            {
            	if (CLUBS_INFO[ info[1] ][club_STATE] == 0 && CLUBS_INFO[ info[1] ][club_USER_ID] != ACCOUNT_INFO[playerid][ac_ID]) ShowPlayerMessage(playerid, "~r~Este negocio se encuentra cerrado.", 4);
                else
                {
                	if (PLAYER_TEMP[playerid][py_ROCK]) return ShowPlayerMessage(playerid, "~r~Primero debes entregar la roca.", 3);

                	if (CLUBS_INFO[ info[1] ][club_USER_ID] != ACCOUNT_INFO[playerid][ac_ID])
                	{
	                	if (CLUBS_INFO[ info[1] ][club_ENTER_PRICE] > 0)
	                	{
	                		if (CHARACTER_INFO[playerid][ch_CASH] <= CLUBS_INFO[ info[1] ][club_ENTER_PRICE])
	                		{
	                			new str_text[64];
	                			format(str_text, 64, "~r~La entrada al negocio vale %d$", CLUBS_INFO[ info[1] ][club_ENTER_PRICE]);
	                			ShowPlayerMessage(playerid, str_text, 4);
	                			return 0;
	                		}

	                		CLUBS_INFO[ info[1] ][club_BALANCE] += CLUBS_INFO[ info[1] ][club_ENTER_PRICE];

							new DB_Query[128];
							format(DB_Query, sizeof(DB_Query), "\
								UPDATE `CLUB_INFO` SET\
									`BALANCE` = '%d' \
								WHERE `ID` = '%d';\
							", CLUBS_INFO[ info[1] ][club_BALANCE], info[1]);
							db_free_result(db_query(Database, DB_Query));

							GivePlayerCash(playerid, -CLUBS_INFO[ info[1] ][club_ENTER_PRICE], false);
	                	}
	                }

                	new interior = CLUBS_INFO[ info[1] ][club_INTERIOR];
                    CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_OWN_CLUB;
                    CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA] = CLUBS_INFO[ info[1] ][club_ID];
                    PLAYER_TEMP[playerid][py_INTERIOR_INDEX] = info[1];
                    PLAYER_TEMP[playerid][py_CLUB_INDEX] = info[1];

                    SetPlayerPosEx(playerid,
                    	CLUBS_INTERIORS[interior][interior_X],
                    	CLUBS_INTERIORS[interior][interior_Y],
                    	CLUBS_INTERIORS[interior][interior_Z],
                    	CLUBS_INTERIORS[interior][interior_ANGLE],
                    	CLUBS_INTERIORS[interior][interior_ID],
                    	CLUBS_INFO[ info[1] ][club_ID],
                    	false,
                    	true
                    );
                    FreezePlayer(playerid);

                    if (!PLAYER_TEMP[playerid][py_TUTORIAL]) StopAudioStreamForPlayer(playerid);

                    if (CLUBS_INFO[ info[1] ][club_RADIO] < 100)
					{
						PlayAudioStreamForPlayer(playerid, RADIO_STATIONS[ CLUBS_INFO[ info[1] ][club_RADIO] ][r_URL]);
					}

					ShowPlayerNotification(playerid, CLUBS_INFO[ info[1] ][club_WELCOME], 4);
                }
            }
            else ExitSite(playerid);
        }
        default: ExitSite(playerid);
    }
    return 1;
}

CheckFarmerShop(playerid)
{
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, -382.580657, -1426.404296, 26.219505)) return 0;
	if (PlayerIsInMafia(playerid))
	{
		ShowDialog(playerid, DIALOG_SEED_LIST);
	}
	else return ShowPlayerMessage(playerid, "~r~No eres mafioso.", 3);
	return 1;
}

CheckTrashJobSite(playerid)
{
	if (!PLAYER_WORKS[playerid][WORK_TRASH]) return 0;
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_NONE && PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_TRASH) return 0;

	if (GetPlayerVirtualWorld(playerid) != 0) return 0;
	if (GetPlayerInterior(playerid) != 0) return 0;
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 0;
	if (!IsPlayerInRangeOfPoint(playerid, 1.0, 1626.089355, -2174.786132, 13.554687)) return 0;

	if (!PLAYER_TEMP[playerid][py_WORKING_IN]) StartPlayerJob(playerid, WORK_TRASH);
	else EndPlayerJob(playerid);
	return 1;
}

CheckMedicJobSite(playerid)
{
	if (!PLAYER_WORKS[playerid][WORK_MEDIC]) return 0;
	if (PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_NONE && PLAYER_TEMP[playerid][py_WORKING_IN] != WORK_MEDIC) return 0;

	if (IsPlayerInRangeOfPoint(playerid, 1.0, -212.521926, -1739.015014, 675.768737))
	{
		if (!PLAYER_TEMP[playerid][py_WORKING_IN]) StartPlayerJob(playerid, WORK_MEDIC);
		else EndPlayerJob(playerid);
	}
	return 1;
}

CheckIsFireWeapon(weapon)
{
	switch(weapon)
	{
		case 0..18: return 0;
		case 22..38: return 1;
		case 39..46: return 0;
	}
	return 1;
}

ResyncWeapon(playerid, weapon)
{
	switch(weapon)
	{
		case 22: // 9MM
		{
			GivePlayerWeaponEx(playerid, weapon, 15, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munición ~r~+15"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 24: // Desert
		{
			GivePlayerWeaponEx(playerid, weapon, 7, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munición ~r~+7"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 32: // TEC9
		{
			GivePlayerWeaponEx(playerid, weapon, 20, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munición ~r~+20"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 28: // UZI
		{
			GivePlayerWeaponEx(playerid, weapon, 25, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munición ~r~+25"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 33: // Rifle
		{
			GivePlayerWeaponEx(playerid, weapon, 8, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munición ~r~+8"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "RIFLE", "RIFLE_load", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 26: // Recortada
		{
			GivePlayerWeaponEx(playerid, weapon, 2, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munición ~r~+2"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 25: // Escopeta
		{
			GivePlayerWeaponEx(playerid, weapon, 5, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munición ~r~+5"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 29: // MP5
		{
			GivePlayerWeaponEx(playerid, weapon, 35, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munición ~r~+35"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 30: // AK-47
		{
			GivePlayerWeaponEx(playerid, weapon, 50, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munición ~r~+50"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
		case 31: // M4
		{
			GivePlayerWeaponEx(playerid, weapon, 50, 0x00F7F7F7, true);
			GameTextForPlayer(playerid, TextToSpanish("~n~~n~~n~~n~~n~~n~~w~Munición ~r~+50"), 2000, 5);
			PlayerPlaySound(playerid, 36401, 0.0, 0.0, 0.0);
			ApplyAnimation(playerid, "PYTHON", "python_reload", 4.0, 0, 0, 0, 0, 1000);
			return 1;
		}
	}
	return 1;
}

CheckAndReload(playerid)
{
	if (PLAYER_TEMP[playerid][py_GAME_STATE] == GAME_STATE_NORMAL && GetPlayerAnimationIndex(playerid) != 1537 && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
		if (PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT] != 9999)
		{
			new slot = PLAYER_TEMP[playerid][py_INV_SELECTED_SLOT];

			if (PLAYER_VISUAL_INV[playerid][slot_WEAPON][slot])
			{
				new actual_weapon = PLAYER_WEAPONS[playerid][ PLAYER_VISUAL_INV[playerid][slot_WEAPON_SLOT][slot] ][player_weapon_ID];
				if (CheckIsFireWeapon(actual_weapon))
				{
					switch(actual_weapon)
					{
						case 22..24: // Pistolas
						{
							if (PLAYER_MISC[playerid][MISC_CARTRIDGE_1] > 0)
							{
								ResyncWeapon(playerid, actual_weapon);
								PLAYER_MISC[playerid][MISC_CARTRIDGE_1] --;
								return 1;
							}
						}
						case 25..27: // Escopetas
						{
							if (PLAYER_MISC[playerid][MISC_CARTRIDGE_2] > 0)
							{
								ResyncWeapon(playerid, actual_weapon);
								PLAYER_MISC[playerid][MISC_CARTRIDGE_2] --;
								return 1;
							}
						}
						case 33, 34: // Rifles
						{
							if (PLAYER_MISC[playerid][MISC_CARTRIDGE_3] > 0)
							{
								ResyncWeapon(playerid, actual_weapon);
								PLAYER_MISC[playerid][MISC_CARTRIDGE_3] --;
								return 1;
							}
						}
						case 28..32: // Subfusiles
						{
							if (PLAYER_MISC[playerid][MISC_CARTRIDGE_4] > 0)
							{
								ResyncWeapon(playerid, actual_weapon);
								PLAYER_MISC[playerid][MISC_CARTRIDGE_4] --;
								return 1;
							}
						}
					}
				}
			}
		}
	}
	return 1;
}

GetPlayerZones(playerid, city[], zone[])
{
	new Float:f_Pos[3];

	switch(CHARACTER_INFO[playerid][ch_STATE])
	{
		case ROLEPLAY_STATE_INTERIOR:
		{
			f_Pos[0] = ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_EXT_X];
			f_Pos[1] = ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_EXT_Y];
			f_Pos[2] = ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_EXT_Z];
		}
		case ROLEPLAY_STATE_OWN_PROPERTY, ROLEPLAY_STATE_GUEST_PROPERTY:
		{
			f_Pos[0] = PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PROPERTY_INDEX] ][property_EXT_X];
			f_Pos[1] = PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PROPERTY_INDEX] ][property_EXT_Y];
			f_Pos[2] = PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PROPERTY_INDEX] ][property_EXT_Z];
		}
		default: GetPlayerPos(playerid, f_Pos[0], f_Pos[1], f_Pos[2]);
	}

    format(city, 45, "San Andreas");
    format(zone, 45, "Desconocida");

	for(new i = 0; i < sizeof(g_Cities); i++)
	{
	    if (   (f_Pos[0] >= g_Cities[i][z_MinX] && f_Pos[0] < g_Cities[i][z_MaxX]) && (f_Pos[1] >= g_Cities[i][z_MinY] && f_Pos[1] < g_Cities[i][z_MaxY]) )
		{
			format(city, 45, g_Cities[i][z_Name]);
		    break;
		}
	}

	for(new i = 0; i < sizeof(g_Zones); i++)
	{
	    if (   (f_Pos[0] >= g_Zones[i][z_MinX] && f_Pos[0] < g_Zones[i][z_MaxX]) && (f_Pos[1] >= g_Zones[i][z_MinY] && f_Pos[1] < g_Zones[i][z_MaxY]) )
		{
			format(zone, 45, g_Zones[i][z_Name]);
		    break;
		}
	}

	return 1;
}

JailPlayer(playerid, seconds = 300)
{
	PLAYER_TEMP[playerid][py_CLUB_INDEX] = -1;
	ResetItemBody(playerid);

    CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_JAIL;
    CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] = seconds;

    PLAYER_TEMP[playerid][py_ENTER_JAIL_TIME] = gettime();
    SetPlayerPosEx(playerid, JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID] ][jail_X], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_Y], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_Z], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_ANGLE], JAIL_POSITIONS[ CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID]  ][jail_INTERIOR], 0, true);

    KillTimer(PLAYER_TEMP[playerid][py_TIMERS][15]);
    PLAYER_TEMP[playerid][py_TIMERS][15] = SetTimerEx("UnjailPlayer", CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] * 1000, false, "i", playerid);

    new time = CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] - (gettime() - PLAYER_TEMP[playerid][py_ENTER_JAIL_TIME]);
    
    new str_text[128];
	format(str_text, sizeof(str_text), "~r~Encarcelado~w~~n~%s minutos.", TimeConvert(time));
	ShowPlayerMessage(playerid, str_text, 1);

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][38]);
	PLAYER_TEMP[playerid][py_TIMERS][38] = SetTimerEx("SavePrisionTime", 60000, true, "i", playerid);

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][39]);
	PLAYER_TEMP[playerid][py_TIMERS][39] = SetTimerEx("UpdatePrisionTime", 1000, true, "i", playerid);

    ResetPlayerWeaponsEx(playerid);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
    TogglePlayerControllableEx(playerid, false);
    SetPlayerPoliceSearchLevel(playerid, 0);
    SendPoliceMark(playerid, PLAYER_COLOR);
    SetPlayerColorEx(playerid, PLAYER_COLOR);
    return 1;
}

/*IsPlayerPaused(playerid)
{
	return (GetTickCount() - g_iPlayerLastUpdate[playerid] > 2000);
}*/

IsPlayerInWater(playerid)
{
	new lib[16], anims[32];
    GetAnimationName(GetPlayerAnimationIndex(playerid), lib, sizeof(lib), anims, sizeof(anims));
	if(!isnull(lib) && !strcmp(lib, "SWIM")) return 1;
    switch(GetPlayerAnimationIndex(playerid))
	{
	   case 1538..1542, 1544, 1250, 1062: return 1;
	   default: return 0;
	}
    return 0;
}

RandomFishName()
{
	new 
		name[32],
		index = minrand(0, 10);

	switch(index)
	{
		case 0: name = "un ~y~Salmón";
		case 1: name = "un ~y~Bacalao"; 
		case 2: name = "una ~y~Merluza"; 
		case 3: name = "un ~y~Rape";
		case 4: name = "una ~y~Anchoa"; 
		case 5: name = "una ~y~Sardina"; 
		case 6: name = "un ~y~Atún";
		case 7: name = "una ~y~Trucha"; 
		case 8: name = "un ~y~Besugo";
		case 9: name = "una ~y~Dorada"; 
		case 10: name = "una ~y~Caballa";
	}
	return name;
}

forward CheckFish(playerid);
public CheckFish(playerid)
{
	if(PLAYER_TEMP[playerid][py_FISHING])
	{
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][47]);
		PLAYER_TEMP[playerid][py_FISHING] = false;

		if(PLAYER_TEMP[playerid][py_FISHING_PROGRESS] > 50)
		{
			new str_text[128];

			PLAYER_MISC[playerid][MISC_FISH] ++;

			format(str_text, sizeof(str_text), "Bien hecho, has tomado %s~w~. Ahora~n~tienes ~r~%d~w~ peces.", RandomFishName(), PLAYER_MISC[playerid][MISC_FISH]);

			ApplyAnimation(playerid, "OTB", "WTCHRACE_WIN", 4.1, false, false, false, false, 0, true);
			ShowPlayerMessage(playerid, str_text, 4);
		}
		else
		{
			ApplyAnimation(playerid, "OTB", "WTCHRACE_LOSE", 4.1, false, false, false, false, 0, true);
			ShowPlayerMessage(playerid, "~r~Has fallado", 3);
		}

		TextDrawHideForPlayer(playerid, Textdraws[textdraw_PROGRESS_BG]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][0]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][1]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][2]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][3]);
		PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);
		PLAYER_TEMP[playerid][py_FISHING_PROGRESS] = 0;
		PLAYER_TEMP[playerid][py_FISH] = false;
	}
	return 1;
}

ManualUpdateFish(playerid)
{
	if(PLAYER_TEMP[playerid][py_FISH])
	{
		PLAYER_TEMP[playerid][py_FISHING_PROGRESS] += 10;

		new Float:size = (382.0 + PLAYER_TEMP[playerid][py_FISHING_PROGRESS]);

		if(size < 382.0 && size > 246.0)
		{
			PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4], size, 0.000000);
		}

		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);
	}
	return 1;
}

forward UpdateFishing(playerid);
public UpdateFishing(playerid)
{
	if(PLAYER_TEMP[playerid][py_FISHING])
	{
		PLAYER_TEMP[playerid][py_FISHING_PROGRESS] -= (PLAYER_TEMP[playerid][py_FISHING_PROGRESS] / 9);
		if(PLAYER_TEMP[playerid][py_FISHING_PROGRESS] < 0) PLAYER_TEMP[playerid][py_FISHING_PROGRESS] = 1;

		new Float:size = (382.0 - PLAYER_TEMP[playerid][py_FISHING_PROGRESS]);

		if(size < 382.0 && size > 246.0)
		{
			PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4], size, 0.000000);
		}

		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);
	}
	return 1;
}

forward StartFishing(playerid);
public StartFishing(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][47]);

	new colors[] = {0xe73939FF, 0x6ed854FF, 0xe3e145FF, 0x20aee7FF};
	new color = minrand(0, sizeof(colors));

	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][2], TextToSpanish("Pulsa ESPACIO rápidamente"));
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][2]);

	PlayerTextDrawBoxColor(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][3], AdjustDarkness(colors[color], 1.75));
	PlayerTextDrawBoxColor(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4], colors[color]);
	PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4], 382.000000, 0.000000);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][3]);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_PROGRESS][4]);

	ApplyAnimation(playerid, "SWORD", "SWORD_IDLE", 4.1, true, false, false, false, 0, true);

	PLAYER_TEMP[playerid][py_TIMERS][47] = SetTimerEx("UpdateFishing", 100, true, "i", playerid);
	SetTimerEx("CheckFish", 10000, false, "i", playerid);
	PLAYER_TEMP[playerid][py_FISH] = true;
	return 1;
}


SetFirstPerson(playerid, bool:toggle, bool:tele = false)
{
	if (toggle)
	{
		if (IsValidObject(PLAYER_TEMP[playerid][py_FP_OBJ])) DestroyObject(PLAYER_TEMP[playerid][py_FP_OBJ]);

		PLAYER_TEMP[playerid][py_FP_OBJ] = CreateObject(19300, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);

		if (tele == true) AttachObjectToPlayer(PLAYER_TEMP[playerid][py_FP_OBJ], playerid, 0.0, 0.100, 0.3, 0.0, 0.0, 0.0);
		else AttachObjectToPlayer(PLAYER_TEMP[playerid][py_FP_OBJ], playerid, 0.0, 0.35, 0.5, 0.0, 0.0, 0.0);

		AttachCameraToObject(playerid, PLAYER_TEMP[playerid][py_FP_OBJ]);
	}
	else
	{
		DestroyObject(PLAYER_TEMP[playerid][py_FP_OBJ]);
		SetCameraBehindPlayer(playerid);
	}
	return 1;
}

SetFirstPersonPos(playerid, Float:x, Float:y, Float:z)
{
	if (IsValidObject(PLAYER_TEMP[playerid][py_FP_OBJ])) DestroyObject(PLAYER_TEMP[playerid][py_FP_OBJ]);

	PLAYER_TEMP[playerid][py_FP_OBJ] = CreateObject(19300, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
	AttachObjectToPlayer(PLAYER_TEMP[playerid][py_FP_OBJ], playerid, x, y, z, 0.0, 0.0, 0.0);
	AttachCameraToObject(playerid, PLAYER_TEMP[playerid][py_FP_OBJ]);
	return 1;
}

/*bool:IsPlayerMoving(playerid)
{
    switch(GetPlayerAnimationIndex(playerid))
    {
        case 463 .. 470, 1222 .. 1236, 1256 .. 1273, 1276 .. 1287: return true;
    }

    return false;
}*/

PreloadAnims(playerid)
{
    PreloadAnimLib(playerid, "DANCING");
    PreloadAnimLib(playerid, "HEIST9");
    PreloadAnimLib(playerid, "BOMBER");
    PreloadAnimLib(playerid, "RAPPING");
    PreloadAnimLib(playerid, "SHOP");
    PreloadAnimLib(playerid, "BEACH");
    PreloadAnimLib(playerid, "SMOKING");
    PreloadAnimLib(playerid, "FOOD");
    PreloadAnimLib(playerid, "ON_LOOKERS");
    PreloadAnimLib(playerid, "DEALER");
    PreloadAnimLib(playerid, "CRACK");
    PreloadAnimLib(playerid, "CARRY");
    PreloadAnimLib(playerid, "COP_AMBIENT");
    PreloadAnimLib(playerid, "PARK");
    PreloadAnimLib(playerid, "INT_HOUSE");
    PreloadAnimLib(playerid, "FOOD" );
    PreloadAnimLib(playerid, "ped" );
    PreloadAnimLib(playerid, "MISC" );
    PreloadAnimLib(playerid, "POLICE" );
    PreloadAnimLib(playerid, "GRAVEYARD" );
    PreloadAnimLib(playerid, "WUZI" );
    PreloadAnimLib(playerid, "SUNBATHE" );
    PreloadAnimLib(playerid, "PLAYIDLES" );
    PreloadAnimLib(playerid, "CAMERA" );
    PreloadAnimLib(playerid, "RIOT" );
    PreloadAnimLib(playerid, "DAM_JUMP" );
    PreloadAnimLib(playerid, "JST_BUISNESS" );
    PreloadAnimLib(playerid, "KISSING" );
    PreloadAnimLib(playerid, "GANGS" );
    PreloadAnimLib(playerid, "GHANDS" );
    PreloadAnimLib(playerid, "BLOWJOBZ" );
    PreloadAnimLib(playerid, "SWEET" );
}

PreloadAnimLib(playerid, const animlib[])
{
	ApplyAnimation(playerid, animlib, "null", 0.0, 0, 0, 0, 0, 0);
}

CheckProxy(playerid)
{
	if (!strcmp(PLAYER_TEMP[playerid][py_IP], "127.0.0.1")) return 0;

	for(new i = 0; i < sizeof(NAME_WHITELIST); i ++)
    {
        if (!strcmp(PLAYER_TEMP[playerid][py_NAME], NAME_WHITELIST[i], true)) return 0;
    }

	new str_text[128];
	format(str_text, sizeof(str_text), "51.161.31.157:9991/proxycheck/%s,%s", PLAYER_TEMP[playerid][py_IP], PLAYER_TEMP[playerid][py_NAME]);
	HTTP(playerid, HTTP_GET, str_text, "", "OnPlayerProxyFound");
	return 1;
}

forward OnPlayerProxyFound(index, response_code, data[]);
public OnPlayerProxyFound(index, response_code, data[])
{
	if (response_code == 200)
	{
		if (data[0] == 'Y')
		{
			new str_text[144];
			format(str_text, sizeof(str_text), "[ANTI-CHEAT] Kick sobre %s (%d): Proxy/VPN", PLAYER_TEMP[index][py_NAME], index);
	    	SendMessageToAdmins(COLOR_ANTICHEAT, str_text);
	    	SendDiscordWebhook(str_text, 1);

	    	SendClientMessageEx(index, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado por usar Proxy/VPN");
	    	KickEx(index, 500);
		}

		if (data[0] == 'B')
		{
			ShowPlayerDialog(index, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"País bloqueado", ""COL_WHITE"Su país esta bloqueado, para verificar su cuenta\n\
				ingrese a https://www.hyaxe.com/samp", "Cerrar", "");
			KickEx(index, 500);
		}
	}
	return 1;
}

Float:CameraLookToAngle(playerid)
{
	new Float:x, Float:y, Float:z;
	GetPlayerCameraFrontVector(playerid, x, y, z);
	return atan2(y, x) + 270.0;
}

IsFakeClient(playerid)
{  
	if (IsPlayerNPC(playerid)) return 0;
	new TempId[80], TempNumb;  
	gpci(playerid, TempId, sizeof(TempId));  
	for(new i = 0; i < strlen(TempId); i++)  
	{  
		if(TempId[i] >= '0' && TempId[i] <= '9')  TempNumb++;  
	}  
	return (TempNumb >= 30 || strlen(TempId) <= 30) ? true : false;
}

GetDatabaseUserName(db_id)
{
	new
		DBResult:Result,
		DB_Query[128],
		name[25]
	;

	format(DB_Query, sizeof(DB_Query), "SELECT `NAME` FROM `CUENTA` WHERE `ID` = %d LIMIT 1;", db_id);
	Result = db_query(Database, DB_Query);
	if (db_num_rows(Result))
		db_get_field_assoc(Result, "NAME", name);

	db_free_result(Result);
	return name;
}

SendEmail(const email[], const title[], const content[])
{
	new payload[1024];
	format(payload, sizeof(payload), "{\"email\": \"%s\", \"title\": \"%s\", \"content\": \"%s\"}", email, title, content);
	HTTP(0, HTTP_POST, "51.161.31.157:9991/send_email", payload, "response_SendEmail");
	return 1;
}

forward response_SendEmail(index, response_code, const data[]);
public response_SendEmail(index, response_code, const data[])
{
	//printf("[EMAIL_DEBUG] Data: %s", data);
	return 1;
}

PlayerIsInMafia(playerid)
{
	if (PLAYER_WORKS[playerid][WORK_MAFIA]) return true;
	if (PLAYER_WORKS[playerid][WORK_ENEMY_MAFIA]) return true;
	if (PLAYER_WORKS[playerid][WORK_OSBORN]) return true;
	if (PLAYER_WORKS[playerid][WORK_CONNOR]) return true;
	if (PLAYER_WORKS[playerid][WORK_DIVISO]) return true;
	return false;
}

GetPlayerMafia(playerid)
{
	if (PLAYER_WORKS[playerid][WORK_MAFIA]) return WORK_MAFIA;
	if (PLAYER_WORKS[playerid][WORK_ENEMY_MAFIA]) return WORK_ENEMY_MAFIA;
	if (PLAYER_WORKS[playerid][WORK_OSBORN]) return WORK_OSBORN;
	if (PLAYER_WORKS[playerid][WORK_CONNOR]) return WORK_CONNOR;
	if (PLAYER_WORKS[playerid][WORK_DIVISO]) return WORK_DIVISO;
	return -1;
}

GetMafiaColor(mafia)
{
	new color = 0xFFFFFFFF;
	switch(mafia)
	{
		case WORK_MAFIA: color = 0xa912e2FF;
		case WORK_ENEMY_MAFIA: color = 0xf5e30aFF;
		case WORK_OSBORN: color = 0x3a3eabFF;
		case WORK_CONNOR: color = 0xFFFFFFFF;
		case WORK_DIVISO: color = 0xa9ee70FF;
	}
	return color;
}

stock RandomCordFromPoint(range, negative, &Float:x, &Float:y)
{
	x = ( x + ( random( range ) - negative ) );
	y = ( y + ( random( range ) - negative ) );
	return 1;
}

ValidSurfingVehicle(modelid)
{
	switch(modelid)
	{
		case 403: return false;
		case 406: return false;
		case 422: return false;
		case 430: return false;
		case 433: return false;
		case 441: return false;
		case 443: return false;
		case 444: return false;
		case 446: return false;
		case 449: return false;
		case 452..455: return false;
		case 464: return false;
		case 472: return false;
		case 473: return false;
		case 478: return false;
		case 484: return false;
		case 493: return false;
		case 500: return false;
		case 514: return false;
		case 515: return false;
		case 519: return false;
		case 543: return false;
		case 554: return false;
		case 556: return false;
		case 557: return false;
		case 564: return false;
		case 578: return false;
		case 595: return false;
		case 600: return false;
		case 605: return false;
	}
	return true;
}

enum {
	STATUS_TRUSTED,
	STATUS_MEDIUM,
	STATUS_WASTED
}

GetAccountStatusValue(playerid)
{
	new value;
	if (PLAYER_MISC[playerid][MISC_MUTES] >= 2) value ++;
	if (PLAYER_MISC[playerid][MISC_MUTES] >= 4) value ++;
	
	if (PLAYER_MISC[playerid][MISC_KICKS] >= 1) value ++;
	if (PLAYER_MISC[playerid][MISC_KICKS] >= 3) value ++;
	
	if (PLAYER_MISC[playerid][MISC_BANS] >= 1) value ++;
	if (PLAYER_MISC[playerid][MISC_BANS] >= 3) value += 5;
	
	if (PLAYER_MISC[playerid][MISC_JAILS] >= 3) value ++;
	if (PLAYER_MISC[playerid][MISC_JAILS] >= 5) value += 5;

	if (PLAYER_MISC[playerid][MISC_SANS] >= 3) value ++;
	if (PLAYER_MISC[playerid][MISC_SANS] >= 10) value += 5;
	
	//SendClientMessageEx(playerid, -1, "%d", value);
	return value;
}

/*GetAccountStatus(playerid)
{
	new status = GetAccountStatusValue(playerid);

	if (value < 3)
		return STATUS_TRUSTED;

	if (value >= 3)
		return STATUS_MEDIUM;

	if (value >= 5)
		return STATUS_WASTED;
	
	return 0;
}*/

GetAccountStatusName(playerid)
{
	new 
		name[64],
		value = GetAccountStatusValue(playerid)
	;

	if (value < 3)
		format(name, sizeof(name), ""COL_GREEN"Confiable"COL_WHITE"");

	if (value >= 3)
		format(name, sizeof(name), ""COL_YELLOW"Medio"COL_WHITE"");

	if (value >= 5)
		format(name, sizeof(name), ""COL_RED"Desconfiable"COL_WHITE"");
	
	return name;
}

// 2D Projection position based on distance and angle
stock GetXYFromAngle(&Float:x, &Float:y, Float:a, Float:distance) {
	x += (distance*floatsin(-a,degrees));
	y += (distance*floatcos(-a,degrees));
}

// 3D Projection position based on distance and angles
stock GetXYZFromAngle(&Float:x, &Float:y, &Float:z, Float:angle, Float:elevation, Float:distance) {
	x += distance * floatsin(angle, degrees) * floatcos(elevation, degrees);
	y += distance * floatcos(angle, degrees) * floatcos(elevation, degrees);
	z += distance * floatsin(elevation, degrees);
}

// Convert 3D velocity vectors to a single velocity unit (close to Km/h in SA:MP)
stock Float:CalculateVelocity(Float:x, Float:y, Float:z) {
	return floatsqroot((x * x) + (y * y) + (z * z)) * 150.0;
}

// Checks if one angle is within range of another angle
stock AngleInRangeOfAngle(Float:a1, Float:a2, Float:range) {
	a1 -= a2;
	return (a1 < range) && (a1 > -range);

}

// Vehicles
GetVehicleType(modelid)
{
	switch(modelid)
	{
		// Helicopteros
		case 548, 425, 417, 487, 488, 497, 563, 447, 469: return 0;
		// Aviones
		case 592, 577, 511, 512, 593, 520, 553, 476, 519, 460, 513: return 1;
		// Barcos
		case 472, 473, 493, 595, 484, 430, 453, 452, 446, 454: return 2;
	}
	return 3;
}

stock Float:frand(Float:min, Float:max)
{
    return float(random(floatround(min) - floatround(max))) + min + float(random(1000)) / 1000.0;
}

Float:float_random(Float:max) 
{ 
	return floatdiv(float(random(0)), floatdiv(float(cellmax), max)); 
}

stock Float:mathfrandom(Float:min, Float:max) 
{ 
	return floatadd(float_random(floatsub(max, min)), min); 
}

stock GiveGoldIngot(playerid, ammount = 1)
{
	PLAYER_MISC[playerid][MISC_GOLD_INGOT] += ammount;
	SavePlayerMisc(playerid);
	return 1;
}

/*IsPlayerInVehicle(playerid)
{
	if (GetPlayerState(playerid) == PLAYER_STATE_DRIVER || GetPlayerState(playerid) == PLAYER_STATE_PASSENGER) return true;
	return false;
}*/

TazerPlayer(playerid)
{
	SetPlayerChatBubble(playerid, "\n\n\n\n* Cae al piso al recibir el choque eléctrico de un tazer.\n\n\n", 0xffcb90FF, 20.0, 5000);
	FreezePlayer(playerid, 30000);
	ApplyAnimation(playerid, "PED", "BIKE_fallR", 4.0, 0, 1, 1, 1, 0);
	ShowPlayerMessage(playerid, "~y~Te dieron una descarga eléctrica con un Tazer.", 3);
	return 1;
}

SetPlayerNormalColor(playerid)
{
	SetPlayerColorEx(playerid, PLAYER_COLOR);
	return 1;
}

FreezePlayer(playerid, ms = 2000)
{
	TogglePlayerControllableEx(playerid, false);
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][3]);
	PLAYER_TEMP[playerid][py_TIMERS][3] = SetTimerEx("TogglePlayerControl", ms, false, "ib", playerid, true);
	return 1;
}

IsPlayerInSafeZone(playerid)
{
	for(new i = 0; i != sizeof SAFE_ZONES; i ++)
	{
		if (IsPlayerInDynamicArea(playerid, SAFE_ZONES[i][safe_zone_AREA_ID]))
		{
			return true;
		}
	}
	return false;
}

SetPlayerVip(playerid, vip_level, price_coin = 0, days = 30)
{
	if (vip_level < 1) return 0;

	ACCOUNT_INFO[playerid][ac_SD] -= price_coin;
	ACCOUNT_INFO[playerid][ac_SU] = vip_level;

	new DB_Query[128], DBResult:Result;
	format(DB_Query, sizeof DB_Query, "UPDATE `CUENTA` SET `SD` = '%d', `SU` = '%d', `SU_EXPIRE_DATE` = DATETIME('NOW', '+%d day') WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_SU], days, ACCOUNT_INFO[playerid][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	format(DB_Query, sizeof DB_Query, "SELECT `SU_EXPIRE_DATE` FROM `CUENTA` WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);
	if (db_num_rows(Result)) db_get_field(Result, 0, ACCOUNT_INFO[playerid][ac_SU_EXPIRE_DATE], 24);
	db_free_result(Result);

	SendClientMessageEx(playerid, COLOR_RED, "VIP %d:"COL_WHITE" %d días, fecha de caducidad: %s.", ACCOUNT_INFO[playerid][ac_SU], days, ACCOUNT_INFO[playerid][ac_SU_EXPIRE_DATE]);
	ShowPlayerNotification(playerid, "Ahora tienes VIP, felicidades.", 3);
	ShowPlayerMessage(playerid, "Puedes utilizar ~p~/vip ~w~para ver el tiempo restante o renovar.", 5);

	UnlockPlayerVehicles(playerid);
	if (GetPlayerSkin(playerid) == CHARACTER_INFO[playerid][ch_SKIN]) SetPlayerToys(playerid);
	return 1;
}

PlayerPlaySoundEx(playerid, sound, Float:X, Float:Y, Float:Z)
{
	if (PLAYER_MISC[playerid][MISC_CONFIG_SOUNDS]) PlayerPlaySound(playerid, sound, X, Y, Z);
	return 1;
}

TogglePlayerControllableEx(playerid, bool:controllable)
{
	PLAYER_TEMP[playerid][py_CONTROL] = controllable;
	return TogglePlayerControllable(playerid, controllable);
}

ShowPlayerKeyMessage(playerid, const key[])
{
	new str_text[64];
	format(str_text, sizeof(str_text), "Pulsa %s", key);

	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_KEY], str_text);
	PlayerTextDrawBoxColor(playerid, PlayerTextdraws[playerid][ptextdraw_KEY], 0x000000DD);
	PlayerTextDrawBackgroundColor(playerid, PlayerTextdraws[playerid][ptextdraw_KEY], 0x000000DD);
	PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_KEY]);
	return 1;
}

ShowPlayerNotification(playerid, const message[], time = 1, bool:auto_jump = true)
{
	#pragma unused time

	new str_text[264];
	format(str_text, sizeof(str_text), "~w~%s", TextToSpanish(message));
	Notification_Show(playerid, str_text, auto_jump);
	return 1;
}

forward HidePlayerNotification(playerid);
public HidePlayerNotification(playerid)
{
	#if DEBUG_MODE == 1
		printf("HidePlayerNotification"); // debug juju
	#endif

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][45]);
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_NOTIFICATION_MESSAGE], "_");
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_NOTIFICATION_MESSAGE]);
	return 1;
}

forward ContinuePlayerIntro(playerid, step);
public ContinuePlayerIntro(playerid, step)
{
	#if DEBUG_MODE == 1
		printf("ContinuePlayerIntro"); // debug juju
	#endif

	switch(step)
	{
		case 0:
		{
			ClearPlayerChatBox(playerid);

            CHARACTER_INFO[playerid][ch_CASH] = 10000;
			new index_pos = minrand(0, sizeof(NewUserPos));
			CHARACTER_INFO[playerid][ch_POS][0] = NewUserPos[index_pos][0];
			CHARACTER_INFO[playerid][ch_POS][1] = NewUserPos[index_pos][1];
			CHARACTER_INFO[playerid][ch_POS][2] = NewUserPos[index_pos][2];
			CHARACTER_INFO[playerid][ch_ANGLE] = NewUserPos[index_pos][3];
			CHARACTER_INFO[playerid][ch_FIGHT_STYLE] = 4;
			CHARACTER_INFO[playerid][ch_HEALTH] = 100.0;
			CHARACTER_INFO[playerid][ch_ARMOUR] = 0.0;
			CHARACTER_INFO[playerid][ch_HUNGRY] = 90.0;
			CHARACTER_INFO[playerid][ch_THIRST] = 95.0;
			PLAYER_MISC[playerid][MISC_CONFIG_SOUNDS] = true;
			PLAYER_MISC[playerid][MISC_CONFIG_AUDIO] = true;
			PLAYER_MISC[playerid][MISC_CONFIG_HUD] = true;
			PLAYER_MISC[playerid][MISC_CONFIG_LOWPC] = false;
			PLAYER_MISC[playerid][MISC_CONFIG_FP] = false;
			PLAYER_MISC[playerid][MISC_CONFIG_ADMIN] = false;

			SetPlayerScore(playerid, ACCOUNT_INFO[playerid][ac_LEVEL]);
			PLAYER_TEMP[playerid][py_DOUBT_CHANNEL_TIME] = gettime();
			ResetPlayerWeapons(playerid);
			ResetPlayerMoney(playerid);
			GivePlayerMoney(playerid, CHARACTER_INFO[playerid][ch_CASH]);
			SetPlayerFightingStyle(playerid, CHARACTER_INFO[playerid][ch_FIGHT_STYLE]);
			SetPlayerHealthEx(playerid, CHARACTER_INFO[playerid][ch_HEALTH]);
			SetPlayerArmourEx(playerid, CHARACTER_INFO[playerid][ch_ARMOUR]);
			SetPlayerVirtualWorld(playerid, 0);
			SetSpawnInfo(playerid, DEFAULT_TEAM, CHARACTER_INFO[playerid][ch_SKIN], CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], 0, 0, 0, 0, 0, 0);
			SetPlayerInterior(playerid, CHARACTER_INFO[playerid][ch_INTERIOR]);
			PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];

			RegisterNewPlayer(playerid);
			PLAYER_TEMP[playerid][py_NEW_USER] = true;
			TogglePlayerSpectatingEx(playerid, false);

			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
			PLAYER_TEMP[playerid][py_TIMERS][18] = SetTimerEx("ContinuePlayerIntro", 500, false, "id", playerid, 1);
		}
		case 1:
		{
			SavePlayerNotification(playerid, "Bienvenido a Hyaxe Roleplay");

			StopAudioStreamForPlayer(playerid);
			PLAYER_MISC[playerid][MISC_CONFIG_HUD] = true;
			PLAYER_MISC[playerid][MISC_CONFIG_LOWPC] = false;
			PLAYER_MISC[playerid][MISC_CONFIG_ADMIN] = false;
			SetPlayerHud(playerid);
			PLAYER_TEMP[playerid][py_NEW_USER] = false;
			PLAYER_TEMP[playerid][py_TUTORIAL] = true;
			PLAYER_TEMP[playerid][py_TUTORIAL_STEP] = 1;
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);

			TogglePlayerControllableEx(playerid, true);
			ShowPlayerNotification(playerid, "Bienvenido a Hyaxe Roleplay, versión experimental.", 12);
			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);

			SetPlayerPosEx(playerid, CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], 0, 0);
			PLAYER_TEMP[playerid][py_TIMERS][18] = SetTimerEx("ContinuePlayerIntro", 2000, false, "id", playerid, 2);
		}
		case 2:
		{
			StopAudioStreamForPlayer(playerid);

			if (PLAYER_TEMP[playerid][py_TUTORIAL_STEP] == 1) PlayAudioStreamForPlayer(playerid, "http://tmp6.hyaxe.com:20100/tutorial_1.mp3");
			PLAYER_TEMP[playerid][py_TUTORIAL_STEP] = 2;

			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
		}
		case 3:
		{
			StopAudioStreamForPlayer(playerid);
			
			if (PLAYER_TEMP[playerid][py_TUTORIAL_STEP] == 6) PlayAudioStreamForPlayer(playerid, "http://tmp6.hyaxe.com:20100/tutorial_6.mp3");
			PLAYER_TEMP[playerid][py_TUTORIAL_STEP] = 7;

			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
			PLAYER_TEMP[playerid][py_TIMERS][18] = SetTimerEx("ContinuePlayerIntro", 51000, false, "id", playerid, 4);
		}
		case 4:
		{
			StopAudioStreamForPlayer(playerid);
			if (PLAYER_TEMP[playerid][py_TUTORIAL_STEP] == 7) PlayAudioStreamForPlayer(playerid, "http://tmp6.hyaxe.com:20100/tutorial_7.mp3");
			PLAYER_TEMP[playerid][py_TUTORIAL] = false;

			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
		}
		case 5:
		{
			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][18]);
			StopAudioStreamForPlayer(playerid);

			if (PLAYER_TEMP[playerid][py_TUTORIAL_STEP] == 4) PlayAudioStreamForPlayer(playerid, "http://tmp6.hyaxe.com:20100/tutorial_4.mp3");
			PLAYER_TEMP[playerid][py_TUTORIAL_STEP] = 5;
		}

	}
	return 1;
}

forward CarJackingFinish(playerid);
public CarJackingFinish(playerid)
{
	#if DEBUG_MODE == 1
		printf("CarJackingFinish"); // debug juju
	#endif

	TogglePlayerControllableEx(playerid, true);
	return 1;
}

GetPlayerCameraLookAt(playerid, &Float:X, &Float:Y, &Float:Z)
{
    new Float:pos[6];
    GetPlayerCameraPos(playerid, pos[0], pos[1], pos[2]);
    GetPlayerCameraFrontVector(playerid, pos[3], pos[4], pos[5]);
    X = floatadd(pos[0], pos[3]);
    Y = floatadd(pos[1], pos[4]);
    Z = floatadd(pos[2], pos[5]);
    return 1;
}

CheckPlayerSuperUser(playerid)
{
	new DBResult:Result, DB_Query[144], bool:expired;
	format(DB_Query, sizeof DB_Query, "SELECT `ID` FROM `CUENTA` WHERE `ID` = '%d' AND DATETIME('NOW') >= `SU_EXPIRE_DATE`;", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		expired = true;
		format(DB_Query, sizeof DB_Query, "UPDATE `CUENTA` SET `SU` = 0, `SU_EXPIRE_DATE` = '0' WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
		db_free_result(db_query(Database, DB_Query));
	}
	db_free_result(Result);

	if (expired)
	{
		ACCOUNT_INFO[playerid][ac_SU] = false;
		ACCOUNT_INFO[playerid][ac_SU_EXPIRE_DATE][0] = EOS;
		ShowPlayerMessage(playerid, "~r~VIP EXPIRADO", 4);
		ShowPlayerNotification(playerid, "~r~VIP EXPIRADO~w~~n~Tu VIP ha expirado, usa /vip si quieres comprar de nuevo.", 4);
		if (GetPlayerSkin(playerid) == CHARACTER_INFO[playerid][ch_SKIN]) SetPlayerToys(playerid);
		ReLockPlayerVehicles(playerid, true);
	}

	PLAYER_TEMP[playerid][py_LAST_SU_CHECK] = gettime();
	return 1;
}

UnlockPlayerVehicles(playerid)
{
	new total;
	for(new i = 0; i != MAX_VEHICLES; i ++)
	{
		if (!GLOBAL_VEHICLES[i][gb_vehicle_VALID]) continue;
		if (!PLAYER_VEHICLES[i][player_vehicle_VALID]) continue;

		if (PLAYER_VEHICLES[i][player_vehicle_ID] == ACCOUNT_INFO[playerid][ac_ID])
		{
			if (total >= MAX_SU_VEHICLES) break;

			PLAYER_VEHICLES[i][player_vehicle_ACCESSIBLE] = true;
		}
	}
	return total;
}

ReLockPlayerVehicles(playerid, bool:remove = false)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;
	if (ACCOUNT_INFO[playerid][ac_SU]) return 0;

	new DBResult:Result, DB_Query[128];
	format(DB_Query, sizeof(DB_Query), "SELECT `ID` FROM `PLAYER_VEHICLES` WHERE `ID_USER` = '%d' ORDER BY `ID` DESC LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], MAX_SU_VEHICLES);
	Result = db_query(Database, DB_Query);

	new total_vehicles, veh_did;
	for(new i; i < db_num_rows(Result); i++ )
	{
		if (total_vehicles >= MAX_SU_VEHICLES)
		{
			printf("[debug]  MAX_SU_VEHICLES superado al cargar de base de datos.");
			break;
		}

		veh_did = db_get_field_int(Result, 0);
		new vehicle_id = GetPlayerVehicleIdFromDbId(veh_did);
		if (vehicle_id != INVALID_VEHICLE_ID)
		{
			PLAYER_VEHICLES[vehicle_id][player_vehicle_ACCESSIBLE] = true;
			if (total_vehicles >= MAX_NU_VEHICLES)
			{
				if (remove)
				{
					if (GLOBAL_VEHICLES[vehicle_id][gb_vehicle_OCCUPIED])
					{
						SetVehicleVelocity(vehicle_id, 0.0, 0.0, 0.0);
						if (GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DRIVER] != INVALID_PLAYER_ID) RemovePlayerFromVehicle(playerid);
					}
				}
				GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PARAMS_ENGINE] = 0;
				GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PARAMS_LIGHTS] = 0;
				GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PARAMS_DOORS] = 1;
				PLAYER_VEHICLES[vehicle_id][player_vehicle_ACCESSIBLE] = false;
				UpdateVehicleParams(vehicle_id);
			}
		}

		total_vehicles ++;
		db_next_row(Result);
	}

	db_free_result(Result);
	return 1;
}

SetPlayerColorEx(playerid, color)
{
	PLAYER_TEMP[playerid][py_PLAYER_COLOR] = color;
	return SetPlayerColor(playerid, color);
}

InviteToSAPD(playerid, to_player)
{
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (to_player == playerid) return 1;

	new Float:x, Float:y, Float:z; GetPlayerPos(to_player, x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~Esta persona no está cerca tuya.", 3);
	if (PLAYER_CREW[to_player][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~Esta persona tiene banda.", 3);
	if (PLAYER_WORKS[to_player][WORK_POLICE]) return ShowPlayerMessage(playerid, "~r~Este usuario ya es policía.", 3);
	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes reclutar a esta persona por ahora.", 3);

	new player_jobs = CountPlayerJobs(to_player);
	if (ACCOUNT_INFO[to_player][ac_SU])
	{
		if (player_jobs >= MAX_SU_WORKS)
		{
		    ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}
	else
	{
		if (player_jobs >= MAX_NU_WORKS)
		{
			ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}

	if (PLAYER_TEMP[to_player][py_WORKING_IN]) return ShowPlayerMessage(playerid, "~r~Esta persona no puede unirse porque esta de servicio en su trabajo.", 3);

	PLAYER_WORKS[to_player][WORK_POLICE] = true;
	PLAYER_SKILLS[to_player][WORK_POLICE] = 1;
	SavePlayerWorks(to_player);
	SavePlayerSkills(to_player);

	new DBResult:Result_pnumber, phone_number;
	Result_pnumber = db_query(Database, "SELECT ABS(RANDOM() % 10000000) AS `NUM` WHERE `NUM` NOT IN (SELECT `EXTRA` FROM `PLAYER_MISC` WHERE `ID` = '14') LIMIT 1;");
	if (db_num_rows(Result_pnumber)) phone_number = db_get_field_int(Result_pnumber, 0);
	db_free_result(Result_pnumber);
	PLAYER_MISC[to_player][MISC_PLACA_PD] = phone_number;
	SavePlayerMisc(to_player);

	SendClientMessageEx(playerid, COLOR_WHITE, "%s ahora es policía.", PLAYER_TEMP[to_player][py_RP_NAME]);
	ShowPlayerMessage(to_player, "~y~Ahora eres policía.", 3);
	return 1;
}

InviteToLCN(playerid, to_player)
{
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (to_player == playerid) return 1;

	new Float:x, Float:y, Float:z; GetPlayerPos(to_player, x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~Esta persona no está cerca tuya.", 3);
	if (PLAYER_CREW[to_player][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~Esta persona tiene banda.", 3);
	if (PlayerIsInMafia(to_player)) return ShowPlayerMessage(playerid, "~r~Este usuario ya es mafioso.", 3);
	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes reclutar a esta persona por ahora.", 3);

	new player_jobs = CountPlayerJobs(to_player);
	if (ACCOUNT_INFO[to_player][ac_SU])
	{
		if (player_jobs >= MAX_SU_WORKS)
		{
		    ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}
	else
	{
		if (player_jobs >= MAX_NU_WORKS)
		{
			ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}

	if (PLAYER_TEMP[to_player][py_WORKING_IN]) return ShowPlayerMessage(playerid, "~r~Esta persona no puede unirse porque esta de servicio en su trabajo.", 3);

	PLAYER_WORKS[to_player][WORK_MAFIA] = true;
	PLAYER_SKILLS[to_player][WORK_MAFIA] = 1;
	SavePlayerWorks(to_player);
	SavePlayerSkills(to_player);

	SendClientMessageEx(playerid, 0xa912e2FF, "[FSB] "COL_WHITE" %s ahora es de la mafia.", PLAYER_TEMP[to_player][py_RP_NAME]);
	ShowPlayerMessage(to_player, "~y~Ahora eres mafioso.", 3);
	return 1;
}

InviteToTCC(playerid, to_player)
{
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (to_player == playerid) return 1;

	new Float:x, Float:y, Float:z; GetPlayerPos(to_player, x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~Esta persona no está cerca tuya.", 3);
	if (PLAYER_CREW[to_player][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~Esta persona tiene banda.", 3);
	if (PlayerIsInMafia(to_player)) return ShowPlayerMessage(playerid, "~r~Este usuario ya es mafioso.", 3);
	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes reclutar a esta persona por ahora.", 3);

	new player_jobs = CountPlayerJobs(to_player);
	if (ACCOUNT_INFO[to_player][ac_SU])
	{
		if (player_jobs >= MAX_SU_WORKS)
		{
		    ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}
	else
	{
		if (player_jobs >= MAX_NU_WORKS)
		{
			ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}

	if (PLAYER_TEMP[to_player][py_WORKING_IN]) return ShowPlayerMessage(playerid, "~r~Esta persona no puede unirse porque esta de servicio en su trabajo.", 3);

	PLAYER_WORKS[to_player][WORK_ENEMY_MAFIA] = true;
	PLAYER_SKILLS[to_player][WORK_ENEMY_MAFIA] = 1;
	SavePlayerWorks(to_player);
	SavePlayerSkills(to_player);

	SendClientMessageEx(playerid, 0xa912e2FF, "[FSB] "COL_WHITE" %s ahora es de la mafia.", PLAYER_TEMP[to_player][py_RP_NAME]);
	ShowPlayerMessage(to_player, "~y~Ahora eres mafioso enemigo.", 3);
	return 1;
}

InviteToFO(playerid, to_player)
{
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (to_player == playerid) return 1;

	new Float:x, Float:y, Float:z; GetPlayerPos(to_player, x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~Esta persona no está cerca tuya.", 3);
	if (PLAYER_CREW[to_player][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~Esta persona tiene banda.", 3);
	if (PlayerIsInMafia(to_player)) return ShowPlayerMessage(playerid, "~r~Este usuario ya es mafioso.", 3);
	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes reclutar a esta persona por ahora.", 3);

	new player_jobs = CountPlayerJobs(to_player);
	if (ACCOUNT_INFO[to_player][ac_SU])
	{
		if (player_jobs >= MAX_SU_WORKS)
		{
		    ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}
	else
	{
		if (player_jobs >= MAX_NU_WORKS)
		{
			ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}

	if (PLAYER_TEMP[to_player][py_WORKING_IN]) return ShowPlayerMessage(playerid, "~r~Esta persona no puede unirse porque esta de servicio en su trabajo.", 3);

	PLAYER_WORKS[to_player][WORK_OSBORN] = true;
	PLAYER_SKILLS[to_player][WORK_OSBORN] = 1;
	SavePlayerWorks(to_player);
	SavePlayerSkills(to_player);

	SendClientMessageEx(playerid, 0x3a3eabFF, "[Familia Osborn] "COL_WHITE" %s ahora es de la mafia.", PLAYER_TEMP[to_player][py_RP_NAME]);
	ShowPlayerMessage(to_player, "~y~Ahora eres mafioso.", 3);
	return 1;
}

InviteToFC(playerid, to_player)
{
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (to_player == playerid) return 1;

	new Float:x, Float:y, Float:z; GetPlayerPos(to_player, x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~Esta persona no está cerca tuya.", 3);
	if (PLAYER_CREW[to_player][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~Esta persona tiene banda.", 3);
	if (PlayerIsInMafia(to_player)) return ShowPlayerMessage(playerid, "~r~Este usuario ya es mafioso.", 3);
	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes reclutar a esta persona por ahora.", 3);

	new player_jobs = CountPlayerJobs(to_player);
	if (ACCOUNT_INFO[to_player][ac_SU])
	{
		if (player_jobs >= MAX_SU_WORKS)
		{
		    ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}
	else
	{
		if (player_jobs >= MAX_NU_WORKS)
		{
			ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}

	if (PLAYER_TEMP[to_player][py_WORKING_IN]) return ShowPlayerMessage(playerid, "~r~Esta persona no puede unirse porque esta de servicio en su trabajo.", 3);

	PLAYER_WORKS[to_player][WORK_CONNOR] = true;
	PLAYER_SKILLS[to_player][WORK_CONNOR] = 1;
	SavePlayerWorks(to_player);
	SavePlayerSkills(to_player);

	SendClientMessageEx(playerid, 0xc33d3dFF, "[TFC] "COL_WHITE" %s ahora es de la mafia.", PLAYER_TEMP[to_player][py_RP_NAME]);
	ShowPlayerMessage(to_player, "~y~Ahora eres mafioso.", 3);
	return 1;
}

InviteToDS(playerid, to_player)
{
	if (!IsPlayerConnected(to_player)) return ShowPlayerMessage(playerid, "~r~Jugador desconectado.", 3);
	if (to_player == playerid) return 1;

	new Float:x, Float:y, Float:z; GetPlayerPos(to_player, x, y, z);
	if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return ShowPlayerMessage(playerid, "~r~Esta persona no está cerca tuya.", 3);
	if (PLAYER_CREW[to_player][player_crew_VALID]) return ShowPlayerMessage(playerid, "~r~Esta persona tiene banda.", 3);
	if (PlayerIsInMafia(to_player)) return ShowPlayerMessage(playerid, "~r~Este usuario ya es mafioso.", 3);
	if (PLAYER_TEMP[to_player][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~No puedes reclutar a esta persona por ahora.", 3);

	new player_jobs = CountPlayerJobs(to_player);
	if (ACCOUNT_INFO[to_player][ac_SU])
	{
		if (player_jobs >= MAX_SU_WORKS)
		{
		    ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}
	else
	{
		if (player_jobs >= MAX_NU_WORKS)
		{
			ShowPlayerMessage(playerid, "~r~Esta persona ya no puede tener más trabajos.", 3);
			return 1;
		}
	}

	if (PLAYER_TEMP[to_player][py_WORKING_IN]) return ShowPlayerMessage(playerid, "~r~Esta persona no puede unirse porque esta de servicio en su trabajo.", 3);

	PLAYER_WORKS[to_player][WORK_DIVISO] = true;
	PLAYER_SKILLS[to_player][WORK_DIVISO] = 1;
	SavePlayerWorks(to_player);
	SavePlayerSkills(to_player);

	SendClientMessageEx(playerid, 0xa9ee70FF, "[DPT] "COL_WHITE" %s ahora es de la mafia.", PLAYER_TEMP[to_player][py_RP_NAME]);
	ShowPlayerMessage(to_player, "~y~Ahora eres mafioso.", 3);
	return 1;
}

CountPlayerJobs(playerid)
{
	new count;
	for(new i = 1; i != sizeof(work_info); i ++)
	{
		if (PLAYER_WORKS[playerid][i]) count ++;
	}
	return count;
}

getPlayerWorks(playerid)
{
	new works[27 * sizeof(work_info)], count;
	for(new i = 1; i != sizeof(work_info); i ++)
	{
		if (PLAYER_WORKS[playerid][i])
		{
			if (count > 0) strcat(works, ", ");
			strcat(works, work_info[i][work_info_NAME]);

			count ++;
		}
	}

	if (!count) works = "ninguno";
	return works;
}

SetPlayerSkillLevels(playerid)
{
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SAWNOFF_SHOTGUN, 0);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL, 0);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_PISTOL_SILENCED, 0);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_DESERT_EAGLE, 999);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SHOTGUN, 999);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SPAS12_SHOTGUN, 0);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SAWNOFF_SHOTGUN, 0);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MICRO_UZI, 0);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_MP5, 999);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_AK47, 999);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_M4, 999);
	SetPlayerSkillLevel(playerid, WEAPONSKILL_SNIPERRIFLE, 999);
	return 1;
}

forward HealthDown(playerid);
public HealthDown(playerid)
{
	#if DEBUG_MODE == 1
		printf("HealthDown"); // debug juju
	#endif

	if (CHARACTER_INFO[playerid][ch_STATE] != ROLEPLAY_STATE_CRACK) return 1;

	GivePlayerHealthEx(playerid, -1.0);

	if (GetPlayerDistanceFromPoint(playerid, PLAYER_TEMP[playerid][py_INJURED_POS][0], PLAYER_TEMP[playerid][py_INJURED_POS][1], PLAYER_TEMP[playerid][py_INJURED_POS][2]) > 0.10) ApplyAnimation(playerid, "SWEET", "SWEET_INJUREDLOOP", 4.1, true, false, false, 1, 0, 1);
	ApplyAnimation(playerid, "SWEET", "SWEET_INJUREDLOOP", 4.1, true, false, false, 1, 0, 1);

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][16]);
	PLAYER_TEMP[playerid][py_TIMERS][16] = SetTimerEx("HealthDown", 8000, false, "i", playerid);
	return 1;
}

forward StandUpBotikin(medic, playerid);
public StandUpBotikin(medic, playerid)
{
	#if DEBUG_MODE == 1
		printf("StandUpBotikin"); // debug juju
	#endif

	PLAYER_MISC[medic][MISC_BOTIKIN] --;
	ResetItemBody(medic);
	SavePlayerMisc(medic);
	ShowPlayerMessage(medic, "~g~Has curado a esta persona.", 3);

	CHARACTER_INFO[playerid][ch_STATE] = ROLEPLAY_STATE_NORMAL;
	ResetItemBody(playerid);

	if (ACCOUNT_INFO[playerid][ac_SU]) SetPlayerHealthEx(playerid, 100.0);
	else SetPlayerHealthEx(playerid, 25.0);

	ApplyAnimation(playerid, "CARRY", "crry_prtial", 4.1, 0, 0, 0, 0, 0, true);
	ClearAnimations(playerid);

	if (PLAYER_WORKS[medic][WORK_MEDIC] && PLAYER_TEMP[medic][py_WORKING_IN] == WORK_MEDIC)
	{
		if (PLAYER_TEMP[playerid][py_WANT_MEDIC])
		{
			new pay = (1000 + PLAYER_SKILLS[medic][WORK_MEDIC]);

			if (ACCOUNT_INFO[medic][ac_SU]) pay += minrand(200, 500);

			GivePlayerCash(medic, pay);

			PLAYER_SKILLS[medic][WORK_MEDIC] += 5;
			SavePlayerSkills(medic);
			GivePlayerReputation(medic);
		}
		else ShowPlayerNotification(playerid, "Este jugador no ha pedido un medico entonces no has ganado nada.", 4);
	}

	DisablePlayerMedicMark(playerid);
	return 1;
}


CheckKillEvadeAttemp(const str_text[])
{
	for(new x = 0; x < sizeof(QUIT_KEYWORDS); x ++)
    {
        if (strfind(str_text, QUIT_KEYWORDS[x], true) != -1)
        {
        	printf("[QUIT-CHECK] %s - %s", QUIT_KEYWORDS[x], str_text);
        	return true;
    	}
    }
	return false;
}

CheckSpamViolation(const str_text[])
{
	for(new x = 0; x < sizeof(BAN_KEYWORDS); x ++)
    {
        if (strfind(str_text, BAN_KEYWORDS[x], true) != -1)
        {
        	printf("[SPAM-CHECK] %s - %s", BAN_KEYWORDS[x], str_text);
        	return true;
    	}
    }
	return false;
}

CheckFilterViolation(const str_text[])
{
	for(new x = 0; x < sizeof(INVALID_WORDS); x ++)
    {
        if (strfind(str_text, INVALID_WORDS[x], true) != -1) return true;
    }
	return false;
}

CheckNameFilterViolation(const str_text[])
{
	for(new x = 0; x < sizeof(INVALID_NAMES); x ++)
    {
        if (strfind(str_text, INVALID_NAMES[x], true) != -1) return true;
    }
	return false;
}

SendMafiaMessage(color, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_WORKS[i][WORK_MAFIA])
			{
				SendResponsiveMessage(i, color, message, 135);
			}
		}
	}
	return 1;
}

SendEnemyMafiaMessage(color, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_WORKS[i][WORK_ENEMY_MAFIA])
			{
				SendResponsiveMessage(i, color, message, 135);
			}
		}
	}
	return 1;
}

SendOsbornMafiaMessage(color, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_WORKS[i][WORK_OSBORN])
			{
				SendResponsiveMessage(i, color, message, 135);
			}
		}
	}
	return 1;
}

SendConnorMafiaMessage(color, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_WORKS[i][WORK_CONNOR])
			{
				SendResponsiveMessage(i, color, message, 135);
			}
		}
	}
	return 1;
}

SendDivisoMafiaMessage(color, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_WORKS[i][WORK_DIVISO])
			{
				SendResponsiveMessage(i, color, message, 135);
			}
		}
	}
	return 1;
}

PutPlayerInVehicleEx(playerid, vehicleid, seat)
{
	PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_PLAYER_VEHICLE_DOORS][p_ac_info_IMMUNITY] = gettime() + 5;
	PLAYER_AC_INFO[playerid][CHEAT_VEHICLE_NOFUEL][p_ac_info_IMMUNITY] = gettime() + 15;
	PLAYER_TEMP[playerid][py_VEHICLEID] = vehicleid;
	return PutPlayerInVehicle(playerid, vehicleid, seat);
}

GetPlayersInIP(const ip[])
{
	new 
		temp_ip[16],
		count = 0
	;

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
		    GetPlayerIp(i, temp_ip, 16);
		    if (!strcmp(temp_ip, ip)) count ++;
		}
	}
	return count;
}

KickEx(playerid, time = 0)
{
	if (GetPlayerState(playerid) == PLAYER_STATE_SPECTATING) return 0;
	PLAYER_TEMP[playerid][py_KICKED] = true;
	
	if (!time) Kick(playerid);
	else
	{
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][0]);
		PLAYER_TEMP[playerid][py_TIMERS][0] = SetTimerEx("KickPlayer", time, false, "i", playerid);
	}
	return 1;
}

forward KickPlayer(playerid);
public KickPlayer(playerid)
{
	#if DEBUG_MODE == 1
		printf("KickPlayer"); // debug juju
	#endif

	return Kick(playerid);
}

SetPlayerPosEx(playerid, Float:x, Float:y, Float:z, Float:angle, interior, world, freeze = 0, addoffset = 0)
{
	PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_UNOCCUPIED_VEHICLE_TP][p_ac_info_IMMUNITY] = gettime() + 5;

	if (addoffset)
	{
		x += (1.5 * floatsin(-angle, degrees));
		y += (1.5 * floatcos(-angle, degrees));
	}

	if (PLAYER_MISC[playerid][MISC_GAMEMODE] == 0)
	{
		CHARACTER_INFO[playerid][ch_POS][0] = x;
		CHARACTER_INFO[playerid][ch_POS][1] = y;
		CHARACTER_INFO[playerid][ch_POS][2] = z;
		CHARACTER_INFO[playerid][ch_ANGLE] = angle;
		CHARACTER_INFO[playerid][ch_INTERIOR] = interior;
		PLAYER_MISC[playerid][MISC_LAST_WORLD] = world;
	}

	SetPlayerPos(playerid, x, y, z);
	SetPlayerFacingAngle(playerid, angle);
	SetPlayerInterior(playerid, interior);
	SetPlayerVirtualWorld(playerid, world);
	SetCameraBehindPlayer(playerid);

	if (freeze)
	{
		Streamer_UpdateEx(playerid, x, y, z, world, interior, -1, -1, 1);
		TogglePlayerControllableEx(playerid, false);
		KillTimer(PLAYER_TEMP[playerid][py_TIMERS][3]);
		PLAYER_TEMP[playerid][py_TIMERS][3] = SetTimerEx("TogglePlayerControl", 2000, false, "ib", playerid, true);
		ShowPlayerMessage(playerid, "~r~CARGANDO...~w~~n~Espere por favor", 2);
	}

	if (PLAYER_MISC[playerid][MISC_CONFIG_FP])
	{
		SetFirstPerson(playerid, true);
	}
	return 1;
}

GetNearestHospitalForPlayer(playerid)
{
	new Float:distance = 99999.0,
	   Float:tmp_distance,
	   closest = -1;

    for(new i = 0; i < sizeof Hospital_Spawn_Positions; i++)
    {
	   tmp_distance = GetPlayerDistanceFromPoint(playerid, Hospital_Spawn_Positions[i][0], Hospital_Spawn_Positions[i][1], Hospital_Spawn_Positions[i][2]);
	   if (tmp_distance < distance)
	   {
		  distance = tmp_distance;
		  closest = i;
	   }
    }
	return closest;
}

GetHospitalSpawnPosition(hospital, &Float:x, &Float:y, &Float:z, &Float:angle, &interior, &local_interior, &rp_state)
{
	x = Hospital_Spawn_Positions[hospital][0];
	y = Hospital_Spawn_Positions[hospital][1];
	z = Hospital_Spawn_Positions[hospital][2];
	angle = Hospital_Spawn_Positions[hospital][3];
	interior = 0;
	local_interior = 0;
	rp_state = ROLEPLAY_STATE_NORMAL;
	return 1;
}

UpdateHospitalSizeTextdrawLife(playerid)
{
	new str_text[64];
	format(str_text, sizeof(str_text), "Recuperandote ~r~%d %", PLAYER_TEMP[playerid][py_HOSPITAL_LIFE]);
	ShowPlayerMessage(playerid, str_text, 2);
	return 1;
}

TogglePlayerSpectatingEx(playerid, bool:spectate)
{
	PLAYER_AC_INFO[playerid][CHEAT_STATE_SPAMMER][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_POS][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_SPECTATE][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_TEMP[playerid][py_PLAYER_SPECTATE] = spectate;
	return TogglePlayerSpectating(playerid, spectate);
}

ClearPlayerChatBox(playerid, ammount = 20)
{
	for(new i = 0; i != ammount; i++) SendClientMessage(playerid, -1, " ");
	return 1;
}

ShowPlayerStats(playerid, pid)
{
	if (!IsPlayerConnected(pid)) return 0;
	if (ACCOUNT_INFO[pid][ac_ID] == 0) return 0;

	ACCOUNT_INFO[pid][ac_TIME_PLAYING] += gettime() - PLAYER_TEMP[pid][py_TIME_PLAYING];
	PLAYER_TEMP[pid][py_TIME_PLAYING] = gettime();

	new Float:hours;
	ConvertTime_SecondsToHoursFloat(ACCOUNT_INFO[pid][ac_TIME_PLAYING], hours);

	new next_rep[24], neccessary_rep = ACCOUNT_INFO[pid][ac_LEVEL] * REP_MULTIPLIER;
	if (ACCOUNT_INFO[pid][ac_REP] < neccessary_rep)
	{
		new time = (ACCOUNT_INFO[pid][ac_TIME_FOR_REP] - (gettime() * 1000 - PLAYER_TEMP[pid][py_TIME_PASSED_LAST_REP])) / 1000;
		if (time < 3) time = 3;

		format(next_rep, sizeof next_rep, "%sm", TimeConvert(time));
	}
	else format(next_rep, sizeof next_rep, "/comprarnivel");

	new caption[48], dialog[600 + (27 * sizeof(work_info))];
	format(caption, sizeof caption, ""COL_RED"%s", PLAYER_TEMP[pid][py_RP_NAME]);

	new
		drive[3],
		dni[64]
	;

	if (PLAYER_MISC[playerid][MISC_DRIVE] != 0) drive = "Si";
	else drive = "No";

	if (PLAYER_MISC[playerid][MISC_DNI]) format(dni, sizeof(dni), "%d", PLAYER_MISC[playerid][MISC_DNI]);
	else dni = "No";

	format(dialog, sizeof dialog,

		"\
		"COL_WHITE"  ID de cuenta: "COL_RED"%d\n\
		"COL_WHITE"  Fecha de registro: "COL_RED"%s\n\
		"COL_WHITE"  Tiempo jugando: "COL_GREEN"%.1f horas\n\
		"COL_WHITE"  Nivel: "COL_YELLOW"%d\n\
		"COL_WHITE"  Reputación: "COL_ORANGE"%d/%d\n\
		"COL_WHITE"  Siguiente reputación: "COL_ORANGE"%s\n\
		"COL_WHITE"  Banda: "COL_RED"%s\n\
		"COL_WHITE"  Trabajo: "COL_GREEN"%s\n\
		"COL_WHITE"  "SERVER_COIN": "COL_GREEN"%d\n\
	    "COL_WHITE"  Muteos: "COL_RED"%d\n\
	    "COL_WHITE"  Kicks: "COL_RED"%d\n\
	    "COL_WHITE"  Baneos: "COL_RED"%d\n\
	    "COL_WHITE"  Advertencias: "COL_RED"%d\n\
	    "COL_WHITE"  Jails: "COL_RED"%d\n\
	    "COL_WHITE"  Dudas enviadas: "COL_GREEN"%d\n\
		"COL_WHITE"  VIP: "COL_YELLOW"%s\n\
		"COL_WHITE"  DNI: %s\n\
		"COL_WHITE"  Licencia de conducir: %s\n\
		"COL_WHITE"  Estado social: %s",

			ACCOUNT_INFO[pid][ac_ID],
			ACCOUNT_INFO[pid][reg_DATE],
			hours,
			ACCOUNT_INFO[pid][ac_LEVEL],
			ACCOUNT_INFO[pid][ac_REP], neccessary_rep,
			next_rep,
			getPlayerCrew(pid),
			getPlayerWorks(pid),
			ACCOUNT_INFO[pid][ac_SD],
			PLAYER_MISC[pid][MISC_MUTES],
			PLAYER_MISC[pid][MISC_KICKS],
			PLAYER_MISC[pid][MISC_BANS],
			PLAYER_MISC[pid][MISC_SANS],
			PLAYER_MISC[pid][MISC_JAILS],
			PLAYER_MISC[pid][MISC_DOUBT_SENT],
			getPlayerVip(pid),
			dni,
			drive,
			GetAccountStatusName(playerid)
	);

	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, caption, dialog, "Cerrar", "");
	return 1;
}

getCrewIndexWithId(id)
{
	for(new i = 0; i < sizeof(CREW_INFO); i ++)
	{
		if (CREW_INFO[i][crew_ID] == id) return i;
	}
	return 0;
}

getPlayerCrew(playerid)
{
	new crew[32];
	if (!PLAYER_CREW[playerid][player_crew_VALID]) crew = "ninguna";
	else format(crew, sizeof crew, "%s", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_NAME]);
	return crew;
}

getPlayerCrewColor(playerid)
{
    return !PLAYER_CREW[playerid][player_crew_VALID] ? -1 : CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR];
}

getPlayerVip(playerid)
{
	new vip[16];
	if (!ACCOUNT_INFO[playerid][ac_SU]) vip = "No";
	else if (ACCOUNT_INFO[playerid][ac_SU] == 1) vip = "Classic";
	else if (ACCOUNT_INFO[playerid][ac_SU] >= 2) vip = "Turbo";
	return vip;
}

AddPlayerBadHistory(account_id, by_account_id, type, const text[])
{
	new DB_Query[266];
	format(DB_Query, sizeof DB_Query, "INSERT INTO `BAD_HISTORY` (`ID_USER`, `TYPE`, `BY`, `TEXT`) VALUES('%d', '%d', '%d', '%q');", account_id, type, by_account_id, text);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

AddPlayerBan(account_id, account_name[], account_ip[], by_account_id, type, const text[], days = 0, mod[] = "day", const account_gpci[] = "NULL")
{
	new DB_Query[450];

	if (!days)
	{
		format(DB_Query, sizeof DB_Query,

			"\
			INSERT INTO `BAD_HISTORY` (`ID_USER`, `TYPE`, `BY`, `TEXT`) VALUES('%d', '%d', '%d', '%q');\
			INSERT INTO `BANS` (`NAME`, `IP`, `GPCI`, `ID_HISTORY`, `EXPIRE_DATE`) SELECT '%q', '%q', '%q', MAX(`ID`), '0' FROM `BAD_HISTORY`;\
			",

				account_id, type, by_account_id, text,
				account_name, account_ip, account_gpci

		);
	}
	else
	{
		format(DB_Query, sizeof DB_Query,

			"\
			INSERT INTO `BAD_HISTORY` (`ID_USER`, `TYPE`, `BY`, `TEXT`) VALUES('%d', '%d', '%d', '%q');\
			INSERT INTO `BANS` (`NAME`, `IP`, `GPCI`, `ID_HISTORY`, `EXPIRE_DATE`) SELECT '%q', '%q', '%q', MAX(`ID`), DATETIME('NOW', '+%d %s') FROM `BAD_HISTORY`;\
			",

				account_id, type, by_account_id, text,
				account_name, account_ip, account_gpci, days, mod

		);
	}

	safe_db_query(DB_Query);
	return 1;
}

DeletePlayerJobs(playerid)
{
	for(new i = 0; i != sizeof work_info; i ++)
	{
		if (work_info[i][work_info_TYPE] == WORK_TYPE_NORMAL)
		{
			new DB_Query[256];
			format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_WORKS` SET `SET` = '0' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", ACCOUNT_INFO[playerid][ac_ID], i);
			db_free_result(db_query(Database, DB_Query));

			PLAYER_WORKS[playerid][i] = 0;
			SavePlayerWorks(playerid);
		}
	}
	return 1;
}

SendMessageToAdmins(color, const message[], level = 0)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
	    if (IsPlayerConnected(i))
	    {
		   if (ACCOUNT_INFO[i][ac_ADMIN_LEVEL] > level && PLAYER_TEMP[i][py_ADMIN_SERVICE])
		   {
			  SendClientMessage(i, color, message);
		   }
	    }
	}
	return 1;
}

SendCmdLogToAdmins(playerid, const cmdtext[], const params[])
{
	new
		message[144],
		str_text[144];

	if (isnull(params)) format(message, sizeof message, "%s (%d) uso el comando /%s", ACCOUNT_INFO[playerid][ac_NAME], playerid, cmdtext);
	else format(message, sizeof message, "%s (%d) uso el comando /%s %s", ACCOUNT_INFO[playerid][ac_NAME], playerid, cmdtext, params);

	format(str_text, sizeof(str_text), ":page_with_curl: %s", message);
	SendDiscordWebhook(str_text, 1);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
	    if (IsPlayerConnected(i))
	    {
		   if (ACCOUNT_INFO[i][ac_ADMIN_LEVEL] >= ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] && PLAYER_TEMP[i][py_ADMIN_SERVICE])
		   {
			  if (PLAYER_TEMP[i][py_SEE_ACMD_LOG]) SendClientMessage(i, 0x9A9A9AFF, message);
		   }
	    }
	}
	return 1;
}

SendMessageToAdminsAC(color, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
	    if (IsPlayerConnected(i))
	    {
		   if (ACCOUNT_INFO[i][ac_ADMIN_LEVEL] > 1 && PLAYER_TEMP[i][py_ADMIN_SERVICE])
		   {
			  if (PLAYER_TEMP[i][py_SEE_AC_LOG]) SendClientMessage(i, color, message);
		   }
	    }
	}
	printf(message);
	return 1;
}

RespawnAllUnoccupiedVehicles()
{
	for(new i = 0; i != MAX_VEHICLES; i ++)
	{
		if (!GLOBAL_VEHICLES[i][gb_vehicle_VALID]) continue;
		if (GLOBAL_VEHICLES[i][gb_vehicle_OCCUPIED]) continue;
		if (GLOBAL_VEHICLES[i][gb_vehicle_TYPE] == VEHICLE_TYPE_TEST)
		{
			DestroyVehicleEx(i);
			continue;
		}

		SetVehicleToRespawnEx(i);
	}
	return 1;
}

RespawnGlobalUnoccupiedVehicles()
{
	for(new i = 0; i != MAX_VEHICLES; i ++)
	{
		if (!GLOBAL_VEHICLES[i][gb_vehicle_VALID]) continue;
		if (GLOBAL_VEHICLES[i][gb_vehicle_TYPE] == VEHICLE_TYPE_PERSONAL) continue;
		if (GLOBAL_VEHICLES[i][gb_vehicle_OCCUPIED]) continue;

		SetVehicleToRespawnEx(i);
	}
	return 1;
}

getRandomSalt(salt[], length = sizeof salt)
{
    for(new i = 0; i != length; i ++)
	{
		salt[i] = random(2) ? (random(26) + (random(2) ? 'a' : 'A')) : (random(10) + '0');
	}
	return true;
}

GetTickDiff(newtick, oldtick)
{
	if (oldtick < 0 && newtick >= 0) {
		return newtick - oldtick;
	} else if (oldtick >= 0 && newtick < 0 || oldtick > newtick) {
		return (cellmax - oldtick + 1) - (cellmin - newtick);
	}
	return newtick - oldtick;
}

GetPlayerSpeed(vehicleid)
{
	new Float:xPos[3];
	GetPlayerVelocity(vehicleid, xPos[0], xPos[1], xPos[2]);
	return floatround(floatsqroot(xPos[0] * xPos[0] + xPos[1] * xPos[1] + xPos[2] * xPos[2]) * 170.00);
}

GetEnterExitIndexById(id)
{
	for(new i = 0; i != sizeof ENTER_EXIT; i ++)
	{
		if (ENTER_EXIT[i][ee_ID] == 0) continue;
		if (ENTER_EXIT[i][ee_ID] == id) return i;
	}
	return -1;
}