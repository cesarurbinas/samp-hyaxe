// Atm
enum atm_bank_info
{
	atm_modelid,
	Float:atm_X,
	Float:atm_Y,
	Float:atm_Z,
	Float:atm_RX,
	Float:atm_RY,
	Float:atm_RZ,
	atm_WORLD,
	atm_INTERIOR
};
new ATM_BANK[][atm_bank_info] =
{
	{19324, 1319.238037, 340.231872, 19.152904, 0.000000, 0.000000, 64.699989},
	{19324, 2303.583740, 3.406874, 26.091539, 0.000000, 0.000000, 270.000000},
	{19324, 712.046325, -543.663879, 15.945730, 0.000000, 0.000000, 90.000000},
	{19324, 173.195358, -173.908737, 1.173805, 0.000000, 0.000000, 90.000000},
	{19324, 2021.162963, -1406.334594, 16.806646, 0.000000, 0.000000, 90.000000},
	{19324, 1186.187988, -1368.703002, 13.187811, 0.000000, 0.000000, 90.000000},
	{19324, 547.349426, -1261.883544, 16.384935, 0.000000, 0.000000, -144.400115},
	{19324, 1539.197265, -1603.699584, 13.170522, 0.000000, 0.000000, 270.000000},
	{19324, 1607.591796, -2204.406982, 13.177502, 0.000000, 0.000000, 180.000000},
	{19324, 2228.404052, -1715.259399, 13.155408, 0.000000, 0.000000, 270.000000},
	{19324, 1810.780395, -1876.730834, 13.224149, 0.000000, 0.000000, 450.000000},
	{19324, 1022.552307, -937.373962, 41.803440, 0.000000, 0.000000, -81.899993},
	{19324, 1918.745605, -1765.868041, 13.180094, 0.000000, 0.000000, 180.000000},
	{19324, -2127.926269, -2444.903320, 30.236198, 0.000000, 0.000000, 50.900016},
	{19324, -1976.735229, 309.361358, 34.794040, 0.000000, 0.000000, 0.000000},
	{19324, -1642.021728, 1207.664794, 6.816609, 0.000000, 0.000000, 133.800003},
	{19324, -2235.729736, 2370.975097, 4.633686, 0.000000, 0.000000, 135.800003},
	{19324, -2625.825927, 631.261413, 14.101068, 0.000000, 0.000000, 0.000000},
	{19324, -778.213012, 1501.443237, 23.508373, 0.000000, 0.000000, 0.000000},
	{19324, -792.469787, 2744.103515, 45.508438, 0.000000, 0.000000, 0.000000},
	{19324, -266.641815, 2686.121337, 62.293029, 0.000000, 0.000000, 90.000000},
	{19324, -1436.010009, 2617.189697, 55.444923, 0.000000, 0.000000, 90.000000},
	{19324, -75.126441, 1126.046264, 19.346963, 0.000000, 0.000000, 90.000000},
	{19324, 1627.274047, 1814.493408, 10.467087, 0.000000, 0.000000, 180.000000},
	{19324, 1704.924560, 1852.382324, 10.464756, 0.000000, 0.000000, 180.000000},
	{19324, 456.807006, -1486.700683, 30.736743, 0.000000, 0.000000, -70.699996},
	{19324, 2184.752197, -1139.379882, 24.193698, 0.000000, 0.000000, 270.000000},
	{2942, 1092.4537, -1803.6158, 13.2584, 0.0000, 0.0000, -176.1998},
	{2942, 1516.5130, 662.8303, 10.4726, 0.0000, 0.0000, 0.0000},
	{2942, 2340.5314, 2722.8740, 10.4767, 0.0000, 0.0000, 0.0000},
	{2942, 1977.8226, 716.3564, 10.4669, 0.0000, 0.0000, 88.8999},
	{2942, 2123.1389, 896.7738, 10.8202, 0.0000, 0.0000, 179.7000},
	{2942, 1661.3525, 1722.8962, 10.4866, 0.0000, 0.0000, 0.0000},
	{2942, 2072.2902, 2046.1706, 10.7098, 0.0000, 0.0000, 0.0000},
	{2942, 2102.2958, 2239.5700, 10.7026, 0.0000, 0.0000, 90.3999},
	{2942, 2187.6965, 2464.3610, 10.8439, 0.0000, 0.0000, 89.3000},
	{2942, 1580.5782, 2217.9934, 10.7060, 0.0000, 0.0000, 0.0000},
	{2942, 2791.2160, 2442.3928, 10.6767, 0.0000, 0.0000, -45.4999},
	{2942, -2420.1733, 983.2249, 44.9044, 0.0000, 0.0000, 89.1000},
	{2942, 1443.4044, 2644.8984, 11.0340, 0.0000, 0.0000, 0.0000},
	{2942, 1135.2883, 2043.7694, 10.4476, 0.0000, 0.0000, 179.2000},
	{2942, 2646.2478, 1129.6943, 10.7755, 0.0000, 0.0000, 0.0000},
	{2942, 2638.5576, 1678.3454, 10.6455, 0.0000, 0.0000, -90.8999},
	{2942, 2539.9543, 1847.2352, 10.6225, 0.0000, 0.0000, 0.0000},
	{2942, 2539.9543, 1797.7027, 10.6225, 0.0000, 0.0000, 179.9999},
	{2942, 2118.0822, 1382.8548, 10.4507, 0.0000, 0.0000, 0.0000},
	{2942, 1858.6237, 969.3432, 10.4221, 0.0000, 0.0000, 90.8999},
	{2942, 1557.5832, 987.2445, 10.4301, 0.0000, 0.0000, 89.9000},
	{2942, -135.2062, 1157.8636, 19.3804, 0.0000, 0.0000, 0.0000},
	{2942, -311.3013, 1299.4381, 53.2731, 0.0000, 0.0000, 89.5000},
	{2942, -89.8232, 1383.4298, 9.9032, 0.0000, 0.0000, 99.1999},
	{2942, -864.0909, 1536.5919, 22.2435, 0.0000, 0.0000, -179.4999},
	{2942, -1215.7551, 1825.5415, 41.3490, 0.0000, 0.0000, 45.5000},
	{2942, -1453.0655, 2592.3315, 55.4440, 0.0000, 0.0000, 179.5999},
	{2942, -1939.3734, 2375.9919, 49.3162, 0.0000, 0.0000, 110.7000},
	{2942, -2019.9095, -101.9899, 34.8026, 0.0000, 0.0000, 178.2000},
	{2942, -1960.1308, 153.5587, 27.3050, 0.0000, 0.0000, 89.6999},
	{2942, -1694.9470, 413.3671, 6.8242, 0.0000, 0.0000, 45.3000},
	{2942, -2683.9221, -283.5526, 6.7930, 0.0000, 0.0000, -134.5000},
	{2942, -2677.7692, 259.9306, 4.2935, 0.0000, 0.0000, -179.6000},
	{2942, -1876.8988, 824.4879, 34.8016, 0.0000, 0.0000, 179.1000},
	{2942, -2431.5390, 754.7960, 34.7489, 0.0000, 0.0000, 0.0000},
	{2942, -2491.6191, -33.6728, 25.3861, 0.0000, 0.0000, -90.3999},
	{2942, -2237.9602, 577.9385, 34.7804, 0.0000, 0.0000, 0.0000},
	{2942, -1927.5317, 719.1495, 45.0831, 0.0000, 0.0000, -179.6000},
	{2942, -1529.3118, 1015.6362, 6.7715, 0.0000, 0.0000, 0.0000},
	{2942, -1718.2503, 1355.0715, 6.8231, 0.0000, 0.0000, -46.3000},
	{2942, -1917.7750, 558.0651, 34.7785, 0.0000, 0.0000, 91.0000},
	{19324, 1146.10986, -2068.84424, 68.59467, 0.00000, 0.00000, 179.49406}
};

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

CheckBlackMarket(playerid)
{
    if (IsPlayerInRangeOfPoint(playerid, 1.5, 2164.021484, -1164.398925, -16.871662) || IsPlayerInRangeOfPoint(playerid, 1.5, -190.378494, -2254.421386, 25.593534))
    {
	    if (PLAYER_WORKS[playerid][WORK_POLICE]) return ShowPlayerMessage(playerid, "No puedes comprar aquí siendo policía.", 3);
	    if (ACCOUNT_INFO[playerid][ac_LEVEL] < 2) return ShowPlayerMessage(playerid, "~r~Tienes que ser nivel 2.", 3);
	    ShowDialog(playerid, DIALOG_BLACK_MARKET_SELECT);
	}
    return 1;
}

CheckRodShop(playerid)
{
	if (!IsPlayerInRangeOfPoint(playerid, 1.5, 2125.901123, -65.776679, 1.585963)) return 1;
	ShowDialog(playerid, DIALOG_BUY_ROD);
	return 1;
}

CheckFixKitShop(playerid)
{
	if (IsPlayerInRangeOfPoint(playerid, 1.0, 1060.838256, -917.609741, 43.124679))
	{
		ShowDialog(playerid, DIALOG_BUY_FIXKIT);
	}
	return 1;
}

CheckMinerShop(playerid)
{
	if (!IsPlayerInRangeOfPoint(playerid, 1.5, 509.910125, -708.205383, 19.242210)) return 1;
	ShowDialog(playerid, DIALOG_MINER_STORE);
	return 1;
}

CheckFishSell(playerid)
{
	if (IsPlayerInRangeOfPoint(playerid, 1.5, 2157.049560, -92.550987, 2.798943))
	{
		if (PLAYER_MISC[playerid][MISC_FISH])
		{
			ShowDialog(playerid, DIALOG_SELL_FISH);
		}
		else ShowPlayerMessage(playerid, "~r~No tienes peces que vender.", 3);
	}
	return 1;
}

CheckDrugBlackMarket(playerid)
{
    if (!IsPlayerInRangeOfPoint(playerid, 1.5, 2310.057128, -1789.786865, 1600.751953)) return 1;
    ShowDialog(playerid, DIALOG_DRUG_MARKET);
    return 1;
}

ShowRangeUser(playerid)
{
	new 
		target_player = GetPlayerCameraTargetPlayer(playerid),
		Float:x, Float:y, Float:z;
	
	PLAYER_TEMP[playerid][py_LAST_TARGET_PLAYER] = target_player;
	GetPlayerPos(target_player, x, y, z);

	if (IsPlayerInRangeOfPoint(playerid, 1.2, x, y, z))
	{
		ShowDialog(playerid, DIALOG_RANGE_USER);
	}
	return 1;
}

ExitCrack(playerid)
{
	if (CHARACTER_INFO[playerid][ch_STATE] != ROLEPLAY_STATE_CRACK) return 0;
	if (PLAYER_TEMP[playerid][py_CUFFED]) return 0;
	if (PLAYER_MISC[playerid][MISC_SEARCH_LEVEL] > 0) return 0;

	new str_text[144];
	format(str_text, sizeof(str_text), "[KILL] %s (%d) ha aceptado muerte.", PLAYER_TEMP[playerid][py_NAME], playerid);
	SendMessageToAdmins(COLOR_ANTICHEAT, str_text, 1);

	SetPlayerHealthEx(playerid, 0.0);
	SetPlayerChatBubble(playerid, "\n\n\n\n* Ha muerto.\n\n\n", 0xffcb90FF, 20.0, 5000);
	TogglePlayerControllableEx(playerid, true);
	return 1;
}

CheckPlayerHouseDoor(playerid)
{
	if (CHARACTER_INFO[playerid][ch_STATE] != ROLEPLAY_STATE_OWN_PROPERTY) return 0;
	if (PLAYER_TEMP[playerid][py_LAST_PICKUP_ID] == 0) return 0;

	new info[3];
	Streamer_GetArrayData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_EXTRA_ID, info);
	if (info[0] != PICKUP_TYPE_PROPERTY) return 0;

	new Float:x, Float:y, Float:z;
	Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_X, x);
	Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Y, y);
	Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Z, z);

	if (!IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) return 0;

	if (info[2] == 1) // Está en el Pickup Interior
	{
		if (PROPERTY_INFO[info[1]][property_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID])
		{
			if (PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID] == INVALID_PLAYER_ID) return ShowPlayerMessage(playerid, "~r~Nadie tocó la puerta", 3);
			if (!IsPlayerConnected(PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID])) return ShowPlayerMessage(playerid, "~r~Nadie tocó la puerta o ya se fue.", 3);
			if (!IsPlayerInRangeOfPoint(PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID], 3.0, PROPERTY_INFO[info[1]][property_EXT_X], PROPERTY_INFO[info[1]][property_EXT_Y], PROPERTY_INFO[info[1]][property_EXT_Z])) return ShowPlayerMessage(playerid, "~r~Nadie tocó la puerta o ya se fue.", 3);
			if (PLAYER_TEMP[playerid][py_GAME_STATE] != GAME_STATE_NORMAL) return ShowPlayerMessage(playerid, "~r~Este jugador no puede entrar ahora.", 3);

			PLAYER_TEMP[PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID]][py_HOSPITAL] = GetNearestHospitalForPlayer(PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID]);
			if (PLAYER_TEMP[PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID]][py_HOSPITAL] == -1) PLAYER_TEMP[PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID]][py_HOSPITAL] = 1;

			CHARACTER_INFO[PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID]][ch_STATE] = ROLEPLAY_STATE_GUEST_PROPERTY;
			CHARACTER_INFO[PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID]][ch_INTERIOR_EXTRA] = PROPERTY_INFO[info[1]][property_ID];
			PLAYER_TEMP[PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID]][py_PROPERTY_INDEX] = info[1];
			SetPlayerPosEx(PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_X], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_Y], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_Z], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_ANGLE], PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_INTERIOR], PROPERTY_INFO[info[1]][property_ID], false /*PROPERTY_INTERIORS[ PROPERTY_INFO[info[1]][property_ID_INTERIOR] ][property_INT_FREEZE]*/, true);
			FreezePlayer(PLAYER_TEMP[playerid][py_KNOCK_PLAYER_ID]);
		}
		else return 0;
	}
	else return 0;
	return 1;
}

CheckHeliPort(playerid)
{
	if (IsPlayerInRangeOfPoint(playerid, 5.0, 1876.87915, -2286.58911, 1.16550 + 10))
	{
		ShowDialog(playerid, DIALOG_HELI_OPTIONS);
		return 1;
	}

	if (IsPlayerInRangeOfPoint(playerid, 5.0, 1037.1727, -911.3947, 49.1911))
	{
		ShowDialog(playerid, DIALOG_HELI_OPTIONS);
		return 1;
	}

	if (IsPlayerInRangeOfPoint(playerid, 5.0, 1055.9615, -910.1790, 49.1911))
	{
		ShowDialog(playerid, DIALOG_HELI_OPTIONS);
		return 1;
	}

	if (IsPlayerInRangeOfPoint(playerid, 20.0, 729.8204, -1512.3397, -0.5818))
	{
		ShowDialog(playerid, DIALOG_HELI_OPTIONS);
		return 1;
	}
	return 1;
}

CheckMechanicMenu(playerid)
{
	for(new i = 0; i != sizeof(MECHANIC_POSITIONS); i++ )
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.2, MECHANIC_POSITIONS[i][0], MECHANIC_POSITIONS[i][1], MECHANIC_POSITIONS[i][2]))
		{
			new vehicleid = GetPlayerVehicleID(playerid);
			if (vehicleid == INVALID_VEHICLE_ID) return 1;

			if (GLOBAL_VEHICLES[vehicleid][gb_vehicle_PARAMS_ENGINE]) return ShowPlayerMessage(playerid, "~r~El motor debe estar apagado.", 3);

			ShowTuningMenu(playerid);
			break;
		}
	}
	return 1;
}

forward UpdateBotPing(playerid);
public UpdateBotPing(playerid)
{
	#if DEBUG_MODE == 1
		printf("UpdateBotPing"); // debug juju
	#endif

	SetPlayerColorEx(playerid, PLAYER_COLOR);
	SetPlayerFakePing(playerid, minrand(170, 345));

	if (GetPlayerScore(playerid) == 0) SetPlayerScore(playerid, minrand(1, 7));
	return 1;
}

forward UpdateBotName(playerid);
public UpdateBotName(playerid)
{
	#if DEBUG_MODE == 1
		printf("UpdateBotName"); // debug juju
	#endif

	new name[MAX_PLAYER_NAME];
	format(name, sizeof(name), "%s_%s", names[random(sizeof(names))], surnames[random(sizeof(surnames))]);
	SetPlayerName(playerid, name);
	PLAYER_TEMP[playerid][py_NAME] = name;
	return 1;
}

Bot(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][37]);

	SetPlayerColorEx(playerid, PLAYER_COLOR);
	SetPlayerScore(playerid, minrand(1, 7));

	TogglePlayerFakePing(playerid, true);
    SetPlayerFakePing(playerid, minrand(170, 345));

	new name[MAX_PLAYER_NAME];
	format(name, sizeof(name), "%s_%s", names[random(sizeof(names))], surnames[random(sizeof(surnames))]);
	SetPlayerName(playerid, name);
	PLAYER_TEMP[playerid][py_NAME] = name;

	PLAYER_TEMP[playerid][py_TIMERS][37] = SetTimerEx("UpdateBotPing", 30000, true, "i", playerid);
	PLAYER_TEMP[playerid][py_TIMERS][38] = SetTimerEx("UpdateBotName", 900000 + minrand(60000, 420000), true, "i", playerid);
	return 1;
}

CheckAndExecuteGasoline(playerid)
{
	if (GetPlayerInterior(playerid) == 0)
	{
		new fuel_station = -1;
		for(new i = 0; i < sizeof Fuel_Stations; i++)
		{
			if (IsPlayerInRangeOfPoint(playerid, 5.0, Fuel_Stations[i][0], Fuel_Stations[i][1], Fuel_Stations[i][2]))
			{
				fuel_station = i;
				break;
			}
		}
		if (fuel_station != -1)
		{
			ShowDialog(playerid, DIALOG_GASOLINE);
		}
	}
	return 1;
}

HideBankMenu(playerid)
{
    CancelSelectTextDrawEx(playerid);
    TextDrawHideForPlayer(playerid, Textdraws[textdraw_BANK_MENU][0]);
    TextDrawHideForPlayer(playerid, Textdraws[textdraw_BANK_MENU][1]);
    TextDrawHideForPlayer(playerid, Textdraws[textdraw_BANK_MENU][2]);
    TextDrawHideForPlayer(playerid, Textdraws[textdraw_BANK_MENU][3]);
    TextDrawHideForPlayer(playerid, Textdraws[textdraw_BANK_MENU][4]);
    TextDrawHideForPlayer(playerid, Textdraws[textdraw_BANK_MENU][5]);
    TextDrawHideForPlayer(playerid, Textdraws[textdraw_BANK_MENU][6]);
    PLAYER_TEMP[playerid][py_PLAYER_IN_ATM] = false;
    return 1;
}

ShowBankMenu(playerid)
{
    SelectTextDrawEx(playerid, 0x618448FF);
    TextDrawShowForPlayer(playerid, Textdraws[textdraw_BANK_MENU][0]);
    TextDrawShowForPlayer(playerid, Textdraws[textdraw_BANK_MENU][1]);
    TextDrawShowForPlayer(playerid, Textdraws[textdraw_BANK_MENU][2]);
    TextDrawShowForPlayer(playerid, Textdraws[textdraw_BANK_MENU][3]);
    TextDrawShowForPlayer(playerid, Textdraws[textdraw_BANK_MENU][4]);
    TextDrawShowForPlayer(playerid, Textdraws[textdraw_BANK_MENU][5]);
    TextDrawShowForPlayer(playerid, Textdraws[textdraw_BANK_MENU][6]);
    PLAYER_TEMP[playerid][py_PLAYER_IN_ATM] = true;
    return 1;
}

CheckAtmPlayerAndExecute(playerid)
{
    if (PLAYER_TEMP[playerid][py_LAST_PICKUP_ID] == 0) return 0;
        
    new info[3];
    Streamer_GetArrayData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_EXTRA_ID, info);
    if (info[0] != PICKUP_TYPE_ATM) return 0;
    
    new Float:x, Float:y, Float:z; 
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_X, x);
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Y, y);
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Z, z);
    
    if (!IsPlayerInRangeOfPoint(playerid, 2.0, x, y, z)) return 0;

    if (BANK_ACCOUNT[playerid][bank_account_ID] == 0)
    {
        ShowDialog(playerid, DIALOG_CREATE_BANK_ACCOUNT);
        return 1;
    }
    ShowBankMenu(playerid);
    return 1;
}

SavePlayerNotification(playerid, const message[])
{
	new DB_Query[160];
	format
	(
		DB_Query, sizeof DB_Query,
		"\
			INSERT INTO `PLAYER_NOTIFICATIONS`\
			(\
				`ID_USER`, `MESSAGE`, `DATE`\
			)\
			VALUES\
			(\
				'%d', '%q', '%i'\
			);\
		",
		ACCOUNT_INFO[playerid][ac_ID],
		message,
		gettime()
	);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

SendPlayerAction(playerid, action[])
{
	new str_text[190];
	format(str_text, sizeof str_text, "* %s %s *", PLAYER_TEMP[playerid][py_RP_NAME], action);
	ProxDetector(playerid, 15.0, str_text, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 0xffcb90FF, 85);
	return 1;
}

CheckCraneSiteRequest(playerid)
{
    if (IsPlayerInRangeOfPoint(playerid, 1.0, 1795.293823, -1407.773681, 2770.660156)) 
    {
        ShowDialog(playerid, DIALOG_CRANE_SELECT_VEHICLE);
    }
    return 1;
}

ShellingThings(playerid)
{
    if (IsPlayerInRangeOfPoint(playerid, 1.0, 1796.071655, -1414.565307, 2770.660156)) 
    {
        if (BANK_ACCOUNT[playerid][bank_account_ID] == 0) return ShowPlayerMessage(playerid, "~r~Necesitas tener una cuenta bancaria para poder realizar estas operaciones.", 3);
        {
            ShowDialog(playerid, DIALOG_NOTARY);
        }
    }
    return 1;
}

CheckFoodShop(playerid)
{
	if (PLAYER_TEMP[playerid][py_INTERIOR_INDEX] == -1) return 0;
	if (ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE] == INTERIOR_NO_INFO) return 0;


	new index = GetFastFoodLocalIndexByIntType(ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE]);
	if (index == -1) return 0;

	if (!IsPlayerInRangeOfPoint(playerid, 1.0, Fast_Food_Positions[index][fast_food_X], Fast_Food_Positions[index][fast_food_Y], Fast_Food_Positions[index][fast_food_Z])) return 0;

	switch(Fast_Food_Positions[index][fast_food_INTERIOR_TYPE])
	{
		case INTERIOR_BURGER_SHOT: ShowDialog(playerid, DIALOG_FOOD_BURGER);
		case INTERIOR_PIZZA: ShowDialog(playerid, DIALOG_FOOD_PIZZA);
		case INTERIOR_CLUCKIN_BELL: ShowDialog(playerid, DIALOG_FOOD_CLUCKIN);
	}
	return 1;
}

CheckClothShop(playerid)
{
	if (PLAYER_TEMP[playerid][py_INTERIOR_INDEX] == -1) return 0;
	if (ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE] == INTERIOR_NO_INFO) return 0;

	new shop = GetClothingShopIndexByIntType(ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE]);
	if (shop == -1) return 0;

	if (!IsPlayerInRangeOfPoint(playerid, 2.0, Clothing_Shop_Positions[shop][clothing_shop_X], Clothing_Shop_Positions[shop][clothing_shop_Y], Clothing_Shop_Positions[shop][clothing_shop_Z])) return 0;

	ShowDialog(playerid, DIALOG_CLOTH_STORE);
	return 1;
}

CheckAndExecuteHospitalShop(playerid)
{
	if (GetPlayerInterior(playerid) > 0)
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.0, -198.002197, -1762.759643, 675.768737))
		{
			ShowDialog(playerid, DIALOG_HOSPITAL_SHOP);
		}
	}
	return 1;
}

CheckShopAndExecute(playerid)
{
	if (GetPlayerInterior(playerid) > 0)
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.0, -27.964675, -89.948631, 1003.546875))
		{
			ShowDialog(playerid, DIALOG_247_LIST);
		}
	}
	return 0;
}

CheckRegister(playerid)
{
	if (IsPlayerInRangeOfPoint(playerid, 2.0, 1879.2662, -1701.0118, 5216.7100))
	{
		ShowDialog(playerid, DIALOG_REGISTER_CIVIL);
	}
	return 1;
}

#if defined HALLOWEEN_MODE
	CheckPumpkinWitch(playerid)
	{
		if (IsPlayerInRangeOfPoint(playerid, 2.0, 817.2799, -1103.3270, 25.7921))
		{
			if (PLAYER_MISC[playerid][MISC_PUMPKIN] <= 0) return ShowPlayerMessage(playerid, "~r~No tienes calabazas.", 3);
			ShowDialog(playerid, DIALOG_SELL_PUMPKIN);
		}
		return 1;
	}
#endif

#if defined CHRISTMAS_MODE
	CheckRocketStore(playerid)
	{
		if (IsPlayerInRangeOfPoint(playerid, 2.0, 1537.7760, -1658.0721, 13.5469))
		{
			ShowDialog(playerid, DIALOG_BUY_ROCKET);
		}
		return 1;
	}
#endif

CheckClubMenu(playerid)
{
	if (PLAYER_TEMP[playerid][py_CLUB_INDEX] != -1)
	{
		new 
			club = PLAYER_TEMP[playerid][py_CLUB_INDEX],
			interior = CLUBS_INFO[club][club_INTERIOR]
		;

		if (IsPlayerInRangeOfPoint(playerid, 1.0, CLUBS_INTERIORS[interior][interior_BUY_X], CLUBS_INTERIORS[interior][interior_BUY_Y], CLUBS_INTERIORS[interior][interior_BUY_Z]))
		{
			ShowDialog(playerid, DIALOG_CLUB);
		}
	}
	return 1;
}

CheckClubOptions(playerid)
{
	if (PLAYER_TEMP[playerid][py_CLUB_INDEX] != -1)
	{
		new club = PLAYER_TEMP[playerid][py_CLUB_INDEX];

		if (GetPlayerInterior(playerid) != 0)
		{
			if (CLUBS_INFO[club][club_USER_ID] == ACCOUNT_INFO[playerid][ac_ID])
			{
				new caption[40];
				format(caption, sizeof caption, "%s", CLUBS_INFO[club][club_NAME]);

				ShowPlayerMenu(playerid, CLUB_MENU, TextToSpanish(caption));

				AddPlayerMenuItem(playerid, "Cambiar nombre");
				AddPlayerMenuItem(playerid, "Cambiar bienvenida");
				AddPlayerMenuItem(playerid, "Modificar productos");
				AddPlayerMenuItem(playerid, sprintf("Puerta (%s)", (CLUBS_INFO[club][club_STATE] ? "Abierta" : "Cerrada")));
				AddPlayerMenuItem(playerid, "Echar a todos");
				AddPlayerMenuItem(playerid, "Retirar fondos", sprintf("Fondos: %d$", CLUBS_INFO[club][club_BALANCE]));
				AddPlayerMenuItem(playerid, "Cambiar radio");
				AddPlayerMenuItem(playerid, "Precio de entrada");
				AddPlayerMenuItem(playerid, "Vender");

				PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
			}
		}
	}
	return 1;
}

CheckPoliceEquipeSite(playerid)
{
	if (PLAYER_WORKS[playerid][WORK_POLICE])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.0, 1867.665283, -1712.853515, 5216.709960))
		{
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
		}
	}
	return 1;
}

CheckMafiaEquipeSite(playerid)
{
	if (PLAYER_WORKS[playerid][WORK_MAFIA])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.3, 1475.4032, 2773.5891, 10.8203))
		{
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
		}
	}

	if (PLAYER_WORKS[playerid][WORK_MAFIA])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.3, -1387.1334, 492.8735, 2.1851))
		{
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
		}
	}

	if (PLAYER_WORKS[playerid][WORK_ENEMY_MAFIA])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.3, 3855.066162, -1290.975585, 7547.983398))
		{
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
		}
	}

	if (PLAYER_WORKS[playerid][WORK_OSBORN])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.3, 882.789611, 1896.002319, -93.898712))
		{
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
		}
	}

	if (PLAYER_WORKS[playerid][WORK_OSBORN])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.3, 1298.5734, -799.0347, 84.1406))
		{
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
		}
	}

	if (PLAYER_WORKS[playerid][WORK_CONNOR])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.3, 419.4871, -1001.7376, 92.8918))
		{
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
		}
	}

	if (PLAYER_WORKS[playerid][WORK_DIVISO])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.3, 1141.0912, -2064.0176, 69.0259))
		{
			ShowDialog(playerid, DIALOG_POLICE_SHOP);
		}
	}
	return 1;
}

/*SpaceFix(text[])
{
	new str[100 + 1];
	format(str, sizeof str, "%s", text);

    for(new i = 0; i < strlen(str); i++)
	{
		if (str[i] == ' ') str[i] = '%20';
	}
	return str;
}*/

GivePlayerDrunkLevel(playerid, ammount)
{
	return SetPlayerDrunkLevel(playerid, GetPlayerDrunkLevel(playerid) + ammount);
}

number_format_thousand(e_number)
{
	new f_string[24], bool:negative;
	format(f_string, sizeof f_string, "%d", e_number);
	if (e_number < 0)
	{
		negative = true;
		strdel(f_string, 0, 1);
	}

	new numbers = strlen(f_string);
	while(numbers > 3)
	{
		numbers -= 3;
		strins(f_string, ".", numbers);
	}

	if (negative) strins(f_string, "Cerrar", 0);
	return f_string;
}

/*number_format_dash(e_number)
{
	new f_string[24], bool:negative;
	format(f_string, sizeof f_string, "%d", e_number);
	if (e_number < 0)
	{
		negative = true;
		strdel(f_string, 0, 1);
	}

	new numbers = strlen(f_string);
	while(numbers > 3)
	{
		numbers -= 3;
		strins(f_string, "Cerrar", numbers);
	}

	if (negative) strins(f_string, "- ", 0);
	return f_string;
}*/

SelectTextDrawEx(playerid, color)
{
	PLAYER_TEMP[playerid][py_SELECT_TEXTDRAW] = true;
	return SelectTextDraw(playerid, color);
}

CancelSelectTextDrawEx(playerid)
{
	PLAYER_TEMP[playerid][py_SELECT_TEXTDRAW] = false;
	return CancelSelectTextDraw(playerid);
}

UpdatePlayerHud(playerid)
{
	if (!PLAYER_TEMP[playerid][py_HUD_TEXTDRAWS]) return 0;

	//barrahambre 1...vacia 12, llena 54
	//barrased 2...vacia 74, llena 120

	new Float:size;

	size = 12.0 + (CHARACTER_INFO[playerid][ch_HUNGRY] * 0.4);
	PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][1], size, 0.000000);

	size = 74.5 + (CHARACTER_INFO[playerid][ch_THIRST] * 0.4);
	PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][3], size, 0.000000);

	if (PLAYER_MISC[playerid][MISC_CONFIG_HUD])
	{
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][1]);
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][3]);
	}
	return 1;
}

SetPlayerHud(playerid)
{
	PLAYER_TEMP[playerid][py_HUD_TEXTDRAWS] = true;
	UpdatePlayerHud(playerid);
	//UpdateReputationTextDraws(playerid);

	if (PLAYER_MISC[playerid][MISC_CONFIG_HUD])
	{
		TextDrawShowForPlayer(playerid, Textdraws[textdraw_HUD][0]);
		TextDrawShowForPlayer(playerid, Textdraws[textdraw_HUD][1]);

		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][0]);
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][1]);
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][2]);
		PlayerTextDrawShow(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][3]);
	}

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][5]);
	PLAYER_TEMP[playerid][py_TIMERS][5] = SetTimerEx("HungryThirstDown", INTERVAL_HUNGRY_THIRST_DOWN * 1000, true, "i", playerid);
	return 1;
}

HidePlayerHud(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][5]);
	PLAYER_TEMP[playerid][py_HUD_TEXTDRAWS] = false;

	TextDrawHideForPlayer(playerid, Textdraws[textdraw_HUD][0]);
	TextDrawHideForPlayer(playerid, Textdraws[textdraw_HUD][1]);

	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][0]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][1]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][2]);
	PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][3]);
	return 1;
}

is_open(hour, open, close)
{
	if (open > close)
	{
		if ( ( (hour >= open) && (hour < 24) ) || ( (hour >= 0) && (hour < close) ) )
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	else if (open < close)
	{
		if ((hour >= open) && (hour < close))
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	return false;
}

Add_Hungry_Thirst(playerid, Float:hungry, Float:thirst)
{
	CHARACTER_INFO[playerid][ch_HUNGRY] += hungry;
	if (CHARACTER_INFO[playerid][ch_HUNGRY] > 30.0) PLAYER_TEMP[playerid][py_HUNGRY_MESSAGE] = false;
	if (CHARACTER_INFO[playerid][ch_HUNGRY] > 100.0) CHARACTER_INFO[playerid][ch_HUNGRY] = 100.0;

	CHARACTER_INFO[playerid][ch_THIRST] += thirst;
	if (CHARACTER_INFO[playerid][ch_THIRST] > 30.0) PLAYER_TEMP[playerid][py_THIRST_MESSAGE] = false;
	if (CHARACTER_INFO[playerid][ch_THIRST] > 100.0) CHARACTER_INFO[playerid][ch_THIRST] = 100.0;

	UpdatePlayerHud(playerid);
	return 1;
}

GetPlayerIdByBankAccountId(account_id)
{
	for(new i = 0; i != sizeof(BANK_ACCOUNT); i ++)
	{
		if (BANK_ACCOUNT[i][bank_account_ID] == 0) continue;
		if (BANK_ACCOUNT[i][bank_account_ID] == account_id) return i;
	}
	return -1;
}

GetPlayerIdFromAccountId(accountid)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (ACCOUNT_INFO[i][ac_ID] == accountid)
			{
				return i;
			}
		}
	}
	return INVALID_PLAYER_ID;
}

#define NECESSARY_TIME_BETWEEN_WORKS 30
CheckWorkSite(playerid)
{
	if (GetPlayerState(playerid) != PLAYER_STATE_ONFOOT) return 0;

	new str_text[128];

	new player_jobs = CountPlayerJobs(playerid);
	if (ACCOUNT_INFO[playerid][ac_SU])
	{
		if (player_jobs >= MAX_SU_WORKS)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, ""COL_WHITE"Actualmente tienes %d trabajos, usa /renunciar para dejar un trabajo.", player_jobs);
			return 1;
		}
	}
	else
	{
		if (player_jobs >= MAX_NU_WORKS)
		{
			SendClientMessageEx(playerid, COLOR_WHITE, ""COL_WHITE"Actualmente tienes %d trabajos, usa /renunciar para dejar un trabajo.", player_jobs);
			ShowPlayerMessage(playerid, "Necesitas ser ~p~VIP~w~ para tener más trabajos.", 4);
			return 1;
		}
	}

	for(new i = 0; i != sizeof obtain_work_coords; i ++)
	{
		if (work_info[i][work_info_TYPE] == WORK_TYPE_FAMILY) continue;

		if (GetPlayerInterior(playerid) == obtain_work_coords[i][obtain_work_INTERIOR])
		{
			if (IsPlayerInRangeOfPoint(playerid, 1.0, obtain_work_coords[i][obtain_work_X], obtain_work_coords[i][obtain_work_Y], obtain_work_coords[i][obtain_work_Z]))
			{
				if (work_info[i][work_info_LEVEL] > ACCOUNT_INFO[playerid][ac_LEVEL])
				{
					format(str_text, sizeof(str_text), "~s~Tienes que ser nivel %d para este trabajo.", work_info[i][work_info_LEVEL]);
					ShowPlayerMessage(playerid, str_text, 4);
					return 1;
				}

				if (PLAYER_WORKS[playerid][i])
				{
					format(str_text, sizeof(str_text), "~s~Ya eres %s", work_info[i][work_info_NAME]);
					return ShowPlayerMessage(playerid, str_text, 3);
				}

				DeletePlayerJobs(playerid);

				new DB_Query[256];
				format(DB_Query, sizeof DB_Query, "UPDATE `PLAYER_WORKS` SET `SET` = '1' WHERE `ID_USER` = '%d' AND `ID_WORK` = '%d';", ACCOUNT_INFO[playerid][ac_ID], i);
				db_free_result(db_query(Database, DB_Query));

				PLAYER_WORKS[playerid][i] = true;
				PLAYER_TEMP[playerid][py_LAST_GOT_WORK_TIME] = gettime();
				format(str_text, sizeof(str_text), "Felicidades, ahora eres %s.", work_info[i][work_info_NAME]);
				ShowPlayerNotification(playerid, str_text, 3);
			    SavePlayerWorks(playerid);

			    switch(i)
				{
					case WORK_TRUCK:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de camionero", ""COL_WHITE"\
							Ante todo, bienvenido a la empresa.\n\n\
							Tu trabajo será transportar productos entre diferentes\n\
							puntos de la ciudad y los pueblos que la rodean.\n\n\
							Trabajamos con todo tipo de productos. Desde pequeños comercios de\n\
							comida o tiendas de ropa o hasta productos industriales.", "Cerrar", "");
						return 1;
					}
					case WORK_MECHANIC:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de mecánico", ""COL_WHITE"Bienvenido\n\
							Aquí nos encargamos de arreglar los vehículos de la gente y modificarlos, para eso necesitas\n\
							tener piezas, puedes comprarlas en el almacén de atrás.\n\n\
							Para ponerte en servicio presiona H en este mismo lugar.", "Cerrar", "");
						return 1;
					}
					case WORK_HARVESTER:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de cosechador", ""COL_WHITE"\
							Bienvenido al mundo agrícola.\n\n\
							Aquí nos encargamos de recolectar todos los cultivos de la\n\
							temporada, usando nuestras cosechadoras, súbete a alguna\n\
							para comenzar a trabajar.", "Cerrar", "");
						return 1;
					}
					case WORK_TRASH:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de basurero", ""COL_WHITE"\
							En este trabajo deberás andar en un camión de basura\n\
							para limpiar la ciudad. Puedes ser tanto el conductor\n\
							del camión, o como un recolector de basura.", "Cerrar", "");
						return 1;
					}
					case WORK_FARMER:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de granjero", ""COL_WHITE"Bienvenido al campo, compadre.\nNosotros no encargamos de cultivar, solamente plantas y ya\n\
							Puedes hacerlo en cualquier lugar, donde quieras pero que no se te vaya el tiempo o\n\
							tu planta se va a expirar.", "Cerrar", "");
						return 1;
					}
					case WORK_MINER:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de minero", ""COL_WHITE"\
							Ante todo, bienvenido a la empresa.\n\n\
							Tu principal función será la búsqueda y extracción de minerales.\n\n\
							Encontramos todo tipo de minerales. Desde diamantes, hasta un simple carbón.\n\
							Comenzarás buscando unos dos minerales, el carbón y el hierro.\n\
							Una vez te hayas familiarizado con el labor, te asignarán una mina\n\
							más rica en minerales. Eso quieres decir, un mejor pago.", "Cerrar", "");
						return 1;
					}
					case WORK_FISHER:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de pescador", ""COL_WHITE"\
							Ante todo, bienvenido a las aguas camarada.\n\n\
							Aquí nos encargamos de administrar los pescados\n\
							mas frescos de todo San Andreas. Súbete a un barco\n\
							y dirígete a una boya, pero recuerda que necesitas\n\
							una caña de pescar.", "Cerrar", "");
						return 1;
					}
					case WORK_MEDIC:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de médico", ""COL_WHITE"\
							Bienvenido al equipo de paramédicos.\n\n\
							Sube a una ambulancia y ve a salvar gente herida\n\
							usando los botiquines que hay atrás de la ambula-\n\
							ncia, para sacarlos presiona la tecla Y. Ponte de\n\
							servicio en la sala de atrás.", "Cerrar", "");
						return 1;
					}
					case WORK_BOX:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de boxeador", ""COL_WHITE"\
							Bienvenido al ring.\n\n\
							Entra al ring y pelea hasta que alguien\n\
							apueste por ti, si matas a alguien con\n\
							apuestas te llevas su dinero.", "Cerrar", "");
						return 1;
					}
					case WORK_SOCCER:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de futbolista", ""COL_WHITE"\
							Bienvenido a la cancha.\n\n\
							Teclas:\n\
							* Agarrar pelota: Click Izq.\n\
							* Patear en globo: ALT\n\
							* Patear derecho: Click Der.", "Cerrar", "");
						return 1;
					}
					case WORK_WOODCUTTER:
					{
						ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Empleo de leñador", ""COL_WHITE"\
							Bienvenido al aserradero.\n\n\
							Ponte en servicio y agarra tu carrito\n\
							para ir a buscar arboles (ALT + CLICK)\n\
							Cuando llenes tu carrito con troncos\n\
							vuelves para procesarlos.", "Cerrar", "");
						return 1;
					}
				}
			}
		}
	}
	return 1;
}

getRandomLetter()
{
    return 65 + random(25);
}

/*RotateDynamicObject(objectid, Float:rotX, Float:rotY, Float:rotZ, Float:Speed)
{

		Rotation Speeds:
		0.01 - Very very slow speed
		1.00 - Normal speed
		5.00 - Fast speed

	new Float:X, Float:Y, Float:Z;
	new Float:SpeedConverted = floatdiv(floatmul(Speed, 0.01), 2);

	if (IsDynamicObjectMoving(objectid)) StopDynamicObject(objectid);
	GetDynamicObjectPos(objectid, X, Y, Z);
	SetDynamicObjectPos(objectid, X, Y, Z + 0.01);
	MoveDynamicObject(objectid, X, Y, Z, SpeedConverted, rotX, rotY, rotZ);
	return 1;
}*/

Float:frandom(Float:max, Float:min, dp)
{
	new
		Float:mul = floatpower(10.0, dp),
		imin = floatround(min * mul),
		imax = floatround(max * mul);
	return float(random(imax - imin) + imin) / mul;
}

SavePlayerWeaponsData(playerid)
{
  	if (!PLAYER_TEMP[playerid][py_USER_EXIT] || !PLAYER_TEMP[playerid][py_USER_LOGGED]) return 0;
  	
  	for(new i = 0; i != 13; i ++)
  	{
    	if (!PLAYER_WEAPONS[playerid][i][player_weapon_DB_ID]) continue;

    	new DB_Query[128];
    	format(DB_Query, sizeof(DB_Query), "UPDATE `PLAYER_WEAPONS` SET `WEAPON_ID` = '%d', `AMMO` = '%d' WHERE `ID_WEAPON` = '%d';", PLAYER_WEAPONS[playerid][i][player_weapon_ID], PLAYER_WEAPONS[playerid][i][player_weapon_AMMO], PLAYER_WEAPONS[playerid][i][player_weapon_DB_ID]);
    	db_free_result(db_query(Database, DB_Query));
  	}
  	return 1;
}

LoadPlayerWeaponsData(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[90];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_WEAPONS` WHERE `ID_USER` = '%d' LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], 13);
	Result = db_query(Database, DB_Query);

	new total;
	for(new i; i < db_num_rows(Result); i++ )
	{
		if (total >= 13)
		{
			printf("[debug]  Límite superado en array 'PLAYER_WEAPONS' al intentar cargar de la base de datos.");
			break;
		}

		new weapon_id = db_get_field_assoc_int(Result, "WEAPON_ID");

		PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_VALID] = true;
		PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_DB_ID] = db_get_field_assoc_int(Result, "ID_WEAPON");
		PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_ID] = weapon_id;
		PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_AMMO] = db_get_field_assoc_int(Result, "AMMO");
		
		if (PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_AMMO] >= 10000)
			PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_AMMO] = 100;

		total ++;
		db_next_row(Result);
	}
	db_free_result(Result);
	return 1;
}

RemovePlayerSlotWeapon(playerid, slot, bool:db_delete = false)
{
	PLAYER_AC_INFO[playerid][CHEAT_AMMO][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_WEAPON][p_ac_info_IMMUNITY] = gettime() + 3;

	if (db_delete)
	{
		new DB_Query[140];
		format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_WEAPONS` WHERE `ID_USER` = '%d' AND `ID_WEAPON` = '%d';", ACCOUNT_INFO[playerid][ac_ID], PLAYER_WEAPONS[playerid][slot][player_weapon_DB_ID]);
		db_free_result(db_query(Database, DB_Query));
	}

	new current_weapon = GetPlayerWeapon(playerid);
	if (current_weapon == PLAYER_WEAPONS[playerid][slot][player_weapon_ID]) current_weapon = 0;

	PLAYER_WEAPONS[playerid][slot][player_weapon_VALID] = false;
	PLAYER_WEAPONS[playerid][slot][player_weapon_DB_ID] = 0;
	PLAYER_WEAPONS[playerid][slot][player_weapon_ID] = 0;
	PLAYER_WEAPONS[playerid][slot][player_weapon_AMMO] = 0;

	SetPlayerArmedWeapon(playerid, current_weapon);
	SavePlayerWeaponsData(playerid);
	return 1;
}

SetPlayerHealthEx(playerid, Float:health)
{
	PLAYER_AC_INFO[playerid][CHEAT_PLAYER_HEALTH][p_ac_info_IMMUNITY] = gettime() + 3;

	CHARACTER_INFO[playerid][ch_HEALTH] = health;
	Player_SetHealth(playerid, floatround(CHARACTER_INFO[playerid][ch_HEALTH]));
	return 1;
}

SetPlayerArmourEx(playerid, Float:armour)
{
	PLAYER_AC_INFO[playerid][CHEAT_PLAYER_ARMOUR][p_ac_info_IMMUNITY] = gettime() + 3;

	CHARACTER_INFO[playerid][ch_ARMOUR] = armour;
	Player_SetArmour(playerid, floatround(CHARACTER_INFO[playerid][ch_ARMOUR]));
	return 1;
}

GivePlayerHealthEx(playerid, Float:health)
{
	PLAYER_AC_INFO[playerid][CHEAT_PLAYER_HEALTH][p_ac_info_IMMUNITY] = gettime() + 3;

	CHARACTER_INFO[playerid][ch_HEALTH] += health;
	if (CHARACTER_INFO[playerid][ch_HEALTH] > 100.0) CHARACTER_INFO[playerid][ch_HEALTH] = 100.0;
	Player_SetHealth(playerid, floatround(CHARACTER_INFO[playerid][ch_HEALTH]));
	return 1;
}

TransferPlayerWeapon(from_playerid, slot, to_playerid)
{
	new DB_Query[130];
	format(DB_Query, sizeof(DB_Query), "UPDATE `PLAYER_WEAPONS` SET `ID_USER` = '%d' WHERE `ID_WEAPON` = '%d';", ACCOUNT_INFO[to_playerid][ac_ID], PLAYER_WEAPONS[from_playerid][slot][player_weapon_DB_ID]);
	db_free_result(db_query(Database, DB_Query));

	PLAYER_WEAPONS[to_playerid][slot][player_weapon_VALID] = true;
	PLAYER_WEAPONS[to_playerid][slot][player_weapon_DB_ID] = PLAYER_WEAPONS[from_playerid][slot][player_weapon_DB_ID];
	PLAYER_WEAPONS[to_playerid][slot][player_weapon_ID] = PLAYER_WEAPONS[from_playerid][slot][player_weapon_ID];
	PLAYER_WEAPONS[to_playerid][slot][player_weapon_AMMO] = PLAYER_WEAPONS[from_playerid][slot][player_weapon_AMMO];
	//SetWeaponsForPlayer(to_playerid);

	RemovePlayerSlotWeapon(from_playerid, slot);
	return 1;
}

PlayerPayday(playerid)
{
	if (IsPlayerPaused(playerid)) return 0;
	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0) return 0;
	
	//GivePlayerReputation(playerid);

	new 
		str_payday[364],
		str_temp[64],
		total_secures_vehicles,
		total_secures_property,
		money = 300 * ACCOUNT_INFO[playerid][ac_LEVEL];

	if (money > 4500) money = 4500;
	money += minrand(100, 200);


	for(new i = 0; i < MAX_CLUBS; i++)
	{
		if (CLUBS_INFO[i][club_USER_ID] == ACCOUNT_INFO[playerid][ac_ID])
		{
			CLUBS_INFO[i][club_BALANCE] += minrand(2000, 5000);

			new DB_Query[164];
			format(DB_Query, sizeof(DB_Query), "\
				UPDATE `CLUB_INFO` SET\
					`BALANCE` = '%d' \
				WHERE `ID` = '%d';\
			", CLUBS_INFO[i][club_BALANCE], CLUBS_INFO[i][club_ID]);
			db_free_result(db_query(Database, DB_Query));
		}
	}

	format(str_payday, sizeof(str_payday), "~g~Paga de juego~w~~n~General: ~y~%s$~w~", number_format_thousand(money));

	if (ACCOUNT_INFO[playerid][ac_SU] < 2)
	{
		for(new i = 0; i != MAX_VEHICLES; i ++)
		{
			if (!PLAYER_VEHICLES[i][player_vehicle_VALID]) continue;
			if (PLAYER_VEHICLES[i][player_vehicle_OWNER_ID] != ACCOUNT_INFO[playerid][ac_ID]) continue;

			new veh_money = VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_PRICE] / 100;
			money -= veh_money;

			total_secures_vehicles += veh_money;
		}

		for(new i = 0; i != MAX_PROPERTIES; i ++)
		{
			if (!PROPERTY_INFO[i][property_VALID]) continue;
			if (PROPERTY_INFO[i][property_OWNER_ID] != ACCOUNT_INFO[playerid][ac_ID]) continue;

			if (!PROPERTY_INFO[i][property_VIP_LEVEL])
			{
				new property_money = PROPERTY_INFO[i][property_PRICE_BASE] / 200;
				money -= property_money;

				total_secures_property += property_money;
			}
		}
		format(str_temp, sizeof(str_temp), "~n~Vehículos: ~r~-%s$~w~~n~Propiedades: ~r~-%s$~w~", number_format_thousand(total_secures_vehicles), number_format_thousand(total_secures_property));
		strcat(str_payday, str_temp);
	}

	if (PLAYER_WORKS[playerid][WORK_POLICE])
	{
		new work_payment = (5000 * PLAYER_SKILLS[playerid][WORK_POLICE]);
		money += work_payment;

		format(str_temp, sizeof(str_temp), "~n~SAPD: ~g~%s$~w~", number_format_thousand(work_payment));
		strcat(str_payday, str_temp);
	}

	if (PlayerIsInMafia(playerid))
	{
		new mafia = GetPlayerMafia(playerid);

		new work_payment = (4000 * PLAYER_SKILLS[playerid][mafia]);

		money += work_payment;

		for (new i; i < sizeof(DEALER_INFO); i++)
		{
			if (DEALER_INFO[i][dl_MAFIA] == mafia)
				money += minrand(500, 1000);
		}

		format(str_temp, sizeof(str_temp), "~n~Mafia: ~g~%s$~w~", number_format_thousand(work_payment));
		strcat(str_payday, str_temp);
	}

	if (PLAYER_CREW[playerid][player_crew_VALID] && CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITIS_COUNT] > 0)
	{
		new graffiti_payment = 200 * CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITIS_COUNT];

		money += graffiti_payment;

		format(str_temp, sizeof(str_temp), "~n~Graffitis (%d): ~g~%s$~w~", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITIS_COUNT], number_format_thousand(graffiti_payment));
		strcat(str_payday, str_temp);	
	}

	if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_COUNT] > 0)
	{
		new market_payment = 1000 * CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_COUNT];

		money += market_payment;

		format(str_temp, sizeof(str_temp), "~n~Mercados (%d): ~g~%s$~w~", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_COUNT], number_format_thousand(market_payment));
		strcat(str_payday, str_temp);	
	}

	if (money + CHARACTER_INFO[playerid][ch_CASH] <= 0)
	{
		money = 0;
		CHARACTER_INFO[playerid][ch_CASH] = 0;
	}

	if (ACCOUNT_INFO[playerid][ac_SU] >= 2)
	{
		money += minrand(8000, 15000);
	}

	if (money > 0) format(str_temp, sizeof(str_temp), "~n~RESUMEN: ~g~%s$~w~", number_format_thousand(money));
	else format(str_temp, sizeof(str_temp), "~n~RESUMEN: ~g~%s$~w~", number_format_thousand(money));

	strcat(str_payday, str_temp);

	ShowPlayerNotification(playerid, str_payday, 6, false);
	GivePlayerCash(playerid, money);
	return 1;
}

/*GetIconTextdraw(iconid)
{
	new td_icon[24];

	switch(iconid)
	{
		case 2: td_icon = "hud:radar_centre";
		case 3: td_icon = "hud:arrow";
		case 4: td_icon = "hud:radar_north";
		case 5: td_icon = "hud:radar_airyard";
		case 6: td_icon = "hud:radar_ammugun";
		case 7: td_icon = "hud:radar_barbers";
		case 8: td_icon = "hud:radar_bigsmoke";
		case 9: td_icon = "hud:radar_boatyard";
		case 10: td_icon = "hud:radar_burgershot";
		case 11: td_icon = "hud:radar_bulldozer";
		case 12: td_icon = "hud:radar_catalinapink";
		case 13: td_icon = "hud:radar_cesarviapando";
		case 14: td_icon = "hud:radar_chicken";
		case 15: td_icon = "hud:radar_cj";
		case 16: td_icon = "hud:radar_crash1";
		case 17: td_icon = "hud:radar_diner";
		case 18: td_icon = "hud:radar_emmetgun";
		case 19: td_icon = "hud:radar_enemyattack";
		case 20: td_icon = "hud:radar_fire";
		case 21: td_icon = "hud:radar_girlfriend";
		case 22: td_icon = "hud:radar_hostpital";
		case 23: td_icon = "hud:radar_locosyndicate";
		case 24: td_icon = "hud:radar_maddog";
		case 25: td_icon = "hud:radar_mafiacasino";
		case 26: td_icon = "hud:radar_mcstrap";
		case 27: td_icon = "hud:radar_modgarage";
		case 28: td_icon = "hud:radar_ogloc";
		case 29: td_icon = "hud:radar_pizza";
		case 30: td_icon = "hud:radar_police";
		case 31: td_icon = "hud:radar_propertyg";
		case 32: td_icon = "hud:radar_propertyr";
		case 33: td_icon = "hud:radar_race";
		case 34: td_icon = "hud:radar_ryder";
		case 35: td_icon = "hud:radar_savegame";
		case 36: td_icon = "hud:radar_school";
		case 37: td_icon = "hud:radar_qmark";
		case 38: td_icon = "hud:radar_sweet";
		case 39: td_icon = "hud:radar_tattoo";
		case 40: td_icon = "hud:radar_thetruth";
		case 41: td_icon = "hud:radar_waypoint";
		case 42: td_icon = "hud:radar_toreno";
		case 43: td_icon = "hud:radar_triads";
		case 44: td_icon = "hud:radar_triadscasino";
		case 45: td_icon = "hud:radar_tshirt";
		case 46: td_icon = "hud:radar_woozie";
		case 47: td_icon = "hud:radar_zero";
		case 48: td_icon = "hud:radar_datedisco";
		case 49: td_icon = "hud:radar_datedrink";
		case 50: td_icon = "hud:radar_datefood";
		case 51: td_icon = "hud:radar_truck";
		case 52: td_icon = "hud:radar_cash";
		case 53: td_icon = "hud:radar_flag";
		case 54: td_icon = "hud:radar_gym";
		case 55: td_icon = "hud:radar_impound";
		case 56: td_icon = "hud:radar_light";
		case 57: td_icon = "hud:radar_runway";
		case 58: td_icon = "hud:radar_gangb";
		case 59: td_icon = "hud:radar_gangp";
		case 60: td_icon = "hud:radar_gangy";
		case 61: td_icon = "hud:radar_gangn";
		case 62: td_icon = "hud:radar_gangg";
		case 63: td_icon = "hud:radar_spray";
	}

	return td_icon;
}*/

RegisterNewPlayerWeapon(playerid, weapon_slot)
{
	new DBResult:Result, DB_Query[380];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PLAYER_WEAPONS` (`ID_USER`, `WEAPON_ID`, `AMMO`) VALUES ('%d', '%d', '%d');\
		SELECT MAX(`ID_WEAPON`) FROM `PLAYER_WEAPONS`;\
	",
		ACCOUNT_INFO[playerid][ac_ID], PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_ID], PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_AMMO]
	);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result)) PLAYER_WEAPONS[playerid][weapon_slot][player_weapon_DB_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);
	return 1;
}

GivePlayerWeaponEx(playerid, weapon_id, ammo, color = 0x00F7F7F7, bool:equip = false)
{
	if (PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_ID] == weapon_id) PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_AMMO] += ammo;
	else PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_AMMO] = ammo;

	PLAYER_AC_INFO[playerid][CHEAT_AMMO][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_WEAPON][p_ac_info_IMMUNITY] = gettime() + 3;

	PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_VALID] = true;
	PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_ID] = weapon_id;
	PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_COLOR] = color;

	if (equip)
	{
		ResetPlayerWeapons(playerid);
		GivePlayerWeapon(playerid, weapon_id, ammo);
		SetPlayerArmedWeapon(playerid, weapon_id);
	}

	SavePlayerWeaponsData(playerid);
	return 1;
}

ResetPlayerWeaponsEx(playerid)
{
	new tmp_PLAYER_WEAPONS[enum_PLAYER_WEAPONS];
	for(new i = 0; i != 13; i ++) PLAYER_WEAPONS[playerid][i] = tmp_PLAYER_WEAPONS;

	ResetPlayerWeapons(playerid);
	ResetItemBody(playerid);
	return 1;
}

ShowPlayerInventory(playerid, pid)
{
	if (!IsPlayerConnected(pid)) return 0;
	if (ACCOUNT_INFO[pid][ac_ID] == 0) return 0;

	new caption[48];
	format(caption, sizeof caption, ""COL_RED"%s", PLAYER_TEMP[pid][py_RP_NAME]);

	new dialog[364], line_str[128];

	format(line_str, sizeof line_str, ""COL_WHITE"Dinero: "COL_GREEN"%s$"COL_WHITE"\n", number_format_thousand(CHARACTER_INFO[pid][ch_CASH]));
	strcat(dialog, line_str);

	if (PLAYER_PHONE[pid][player_phone_VALID])
	{
		format(line_str, sizeof line_str, "Teléfono: %d"COL_WHITE"\n", PLAYER_PHONE[pid][player_phone_NUMBER]);
		strcat(dialog, line_str);
	}

	new player_weapons = CountPlayerWeapons(pid);
	if (player_weapons > 0)
	{
		for(new i; i != 13; i ++)
		{
			if (!PLAYER_WEAPONS[pid][i][player_weapon_VALID]) continue;

			format(line_str, sizeof line_str, ""COL_WHITE"%s | Slot "COL_RED"%d"COL_WHITE"\n", WEAPON_INFO[ PLAYER_WEAPONS[pid][i][player_weapon_ID] ][weapon_info_NAME], i);
			strcat(dialog, line_str);
		}
	}

	if (PLAYER_MISC[pid][MISC_SEED_CANNABIS] > 0)
	{
		format(line_str, sizeof line_str, "Semillas Marihuana: "COL_YELLOW"%d"COL_WHITE"\n", PLAYER_MISC[pid][MISC_SEED_CANNABIS]);
		strcat(dialog, line_str);
	}

	if (PLAYER_MISC[pid][MISC_SEED_CRACK] > 0)
	{
		format(line_str, sizeof line_str, "Semillas Coca: "COL_YELLOW"%d"COL_WHITE"\n", PLAYER_MISC[pid][MISC_SEED_CRACK]);
		strcat(dialog, line_str);
	}

	if (PLAYER_MISC[pid][MISC_CANNABIS] > 0)
	{
		format(line_str, sizeof line_str, "Marihuana: "COL_YELLOW"%d"COL_WHITE"\n", PLAYER_MISC[pid][MISC_CANNABIS]);
		strcat(dialog, line_str);
	}

	if (PLAYER_MISC[pid][MISC_CRACK] > 0)
	{
		format(line_str, sizeof line_str, "Crack: "COL_YELLOW"%d"COL_WHITE"\n", PLAYER_MISC[pid][MISC_CRACK]);
		strcat(dialog, line_str);
	}

	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, caption, dialog, "Cerrar", "");
	return 1;
}

/*CountPlayerToys(playerid)
{
	new toys;

	for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++)
	{
		if (PLAYER_TOYS[playerid][i][player_toy_VALID])
		{
			toys ++;
		}
	}
	return toys;
}

CountPlayerPocketObjects(playerid)
{
	new objects;

	for(new i = 0; i != MAX_PLAYER_POCKET_OBJECTS; i ++)
	{
		if (PLAYER_POCKET[playerid][i][player_pocket_VALID])
		{
			objects ++;
		}
	}
	return objects;
}*/

CountPlayerWeapons(playerid)
{
	new weapons;

	for(new i = 0; i != 13; i ++)
	{
		if (PLAYER_WEAPONS[playerid][i][player_weapon_VALID])
		{
			weapons ++;
		}
	}
	return weapons;
}

ShowPlayerSkills(playerid, pid)
{
	if (!IsPlayerConnected(pid)) return 0;
	if (ACCOUNT_INFO[pid][ac_ID] == 0) return 0;

	new caption[48], line_str[80], dialog[sizeof line_str * (sizeof(work_info) + 5)];
	format(caption, sizeof caption, ""COL_RED"%s", PLAYER_TEMP[pid][py_RP_NAME]);

	for(new i = 1; i != sizeof work_info; i ++)
	{
		if (i == WORK_POLICE)
		{
			if (PLAYER_WORKS[playerid][WORK_POLICE])
			{
				format(line_str, sizeof line_str, ""COL_WHITE"%c%s: "COL_GREEN"%s\n", toupper(work_info[i][work_info_NAME][0]), work_info[i][work_info_NAME][1], POLICE_RANKS[PLAYER_SKILLS[pid][i]]);
				strcat(dialog, line_str);
			}
		}
		else
		{
			format(line_str, sizeof line_str, ""COL_WHITE"%c%s: "COL_GREEN"%s\n", toupper(work_info[i][work_info_NAME][0]), work_info[i][work_info_NAME][1], number_format_thousand(PLAYER_SKILLS[pid][i]));
			strcat(dialog, line_str);
		}
	}

	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, caption, dialog, "Cerrar", "");
	return 1;
}

ConvertTime_SecondsToHoursFloat(sec, &Float:hours)
{
	hours = floatdiv(float(sec), 3600);
	return 1;
}

ActiveGeolocation(playerid)
{
	if (PLAYER_MISC[playerid][MISC_GEO])
	{
		if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_JAIL || CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_ARRESTED) return ShowPlayerMessage(playerid, "~r~Ahora no puedes usar el geolocalizador.", 3);
		if ((gettime() - PLAYER_TEMP[playerid][py_LAST_GEO_USE]) < 60 * 5) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 5 minutos para volver a hacer eso.", 4);
		
		if (PLAYER_CREW[playerid][player_crew_VALID])
		{
			new 
				city[45],
				zone[45],
				message[144]
			;

			GetPlayerZones(playerid, city, zone);
			format(message, sizeof message, "~r~%s~w~: refuerzos en %s.", PLAYER_TEMP[playerid][py_RP_NAME], zone);

		 	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
			{
				if (IsPlayerConnected(i))
				{
					if (PLAYER_CREW[i][player_crew_VALID])
					{
						if (PLAYER_CREW[i][player_crew_ID] == PLAYER_CREW[playerid][player_crew_ID])
						{
							SetPlayerMarkerForPlayer(i, playerid, CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_COLOR]);
							ShowPlayerNotification(i, message, 4);
						}
					}
				}
			}

		 	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][38]);
			PLAYER_TEMP[playerid][py_TIMERS][38] = SetTimerEx("DisableGangRefMark", 120000, false, "i", playerid);
			PLAYER_TEMP[playerid][py_LAST_GEO_USE] = gettime();
			return 1;
		}

		if (PlayerIsInMafia(playerid))
		{
			new 
				city[45],
				zone[45],
				message[144],
				mafia = GetPlayerMafia(playerid)
			;

			GetPlayerZones(playerid, city, zone);
			format(message, sizeof message, "~r~%s~w~: refuerzos en %s.", PLAYER_TEMP[playerid][py_RP_NAME], zone);

		 	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
			{
				if (IsPlayerConnected(i))
				{
					if (PLAYER_WORKS[i][mafia])
					{
						SetPlayerMarkerForPlayer(i, playerid, GetMafiaColor(mafia));
						ShowPlayerNotification(i, message, 4);
					}
				}
			}

		 	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][38]);
			PLAYER_TEMP[playerid][py_TIMERS][38] = SetTimerEx("DisableMafiaRefMark", 120000, false, "i", playerid);
			PLAYER_TEMP[playerid][py_LAST_GEO_USE] = gettime();
			return 1;
		}
	}
	else ShowPlayerMessage(playerid, "~r~No tienes un geolocalizador.", 4);
	return 1;
}

SetMechanicPlayerMarkers(playerid)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
			{
				if (PLAYER_TEMP[i][py_WANT_MECHANIC])
				{
					SetPlayerMarkerForPlayer(playerid, i, 0xf4c242FF);
				}
			}
		}
	}
	return 1;
}

SetMedicPlayerMarkers(playerid)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_WANT_MEDIC])
			{
				SetPlayerMarkerForPlayer(playerid, i, COLOR_GREEN);
			}
		}
	}
	return 1;
}

SendAlertToMedics(playerid)
{
	if ((gettime() - PLAYER_TEMP[playerid][py_LIMIT_AMBULANCE]) < 60) return ShowPlayerMessage(playerid, "~r~Tienes que esperar 60 segundos para volver a hacer esto.", 3);

	new
		Float:x, Float:y, Float:z,
		str_text[128],
		total_medics = 0
	;

	GetPlayerPos(playerid, x, y, z);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (i == playerid) continue;
			if (!PLAYER_WORKS[i][WORK_MEDIC]) continue;
			if (PLAYER_TEMP[i][py_WORKING_IN] != WORK_MEDIC) continue;

			SetPlayerMarkerForPlayer(i, playerid, COLOR_GREEN);
			format(str_text, sizeof(str_text), "~g~%s~w~ esta solicitando ayuda (%.2f Km).", PLAYER_TEMP[playerid][py_NAME], (GetPlayerDistanceFromPoint(i, x, y, z) * 0.01));
			ShowPlayerNotification(i, str_text, 4);

			total_medics ++;
		}
	}

	format(str_text, sizeof(str_text), "Has solicitado una ambulancia~n~Médicos activos: ~y~%d", total_medics);
	ShowPlayerMessage(playerid, str_text, 5);
	PLAYER_TEMP[playerid][py_WANT_MEDIC] = true;
	PLAYER_TEMP[playerid][py_LIMIT_AMBULANCE] = gettime();
	return 1;
}

SendAlertToMechanic(playerid)
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
			{
				if (i == playerid) continue;
				if (!PLAYER_WORKS[i][WORK_MECHANIC]) continue;
				if (PLAYER_TEMP[i][py_WORKING_IN] != WORK_MECHANIC) continue;

				SetPlayerMarkerForPlayer(i, playerid, 0xf4c242FF);
				ShowPlayerMessage(i, "~y~Hay un nuevo cliente solicitando un mecánico.", 2);
				SendClientMessageEx(i, COLOR_WHITE, "Hay un nuevo cliente solicitando un mecánico, distancia: "COL_RED"%.2f Km.", (GetPlayerDistanceFromPoint(i, x, y, z) * 0.01));
			}
		}
	}
	return 1;
}

DisablePlayerMechanicMark(playerid)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
			{
				if (i == playerid) continue;
				if (!PLAYER_WORKS[i][WORK_MECHANIC]) continue;
				if (PLAYER_TEMP[i][py_WORKING_IN] != WORK_MECHANIC) continue;

				SetPlayerMarkerForPlayer(i, playerid, PLAYER_COLOR);
			}
		}
	}
	return 1;
}

DisablePlayerMedicMark(playerid)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (i == playerid) continue;
			if (!PLAYER_WORKS[i][WORK_MEDIC]) continue;
			if (PLAYER_TEMP[i][py_WORKING_IN] != WORK_MEDIC) continue;

			SetPlayerMarkerForPlayer(i, playerid, PLAYER_COLOR);
		}
	}

	PLAYER_TEMP[playerid][py_WANT_MEDIC] = false;
	return 1;
}

SetNormalPlayerMarkers(playerid)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			SetPlayerMarkerForPlayer(playerid, i, PLAYER_TEMP[i][py_PLAYER_COLOR]);
		}
	}
	return 1;
}

SavePlayerWorks(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DB_Query[150];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_WORKS` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	for(new i = 1; i != sizeof(PLAYER_WORKS[]); i ++)
	{
		DB_Query[0] = EOS;
		format(DB_Query, sizeof DB_Query, "INSERT INTO `PLAYER_WORKS` (`ID_USER`, `ID_WORK`, `SET`) VALUES ('%d', '%d', '%d');", ACCOUNT_INFO[playerid][ac_ID], i, PLAYER_WORKS[playerid][i]);
		db_free_result(db_query(Database, DB_Query));
	}
	return 1;
}

LoadPlayerCrewInfo(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[90], bool:found;
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_CREW` WHERE `ID_USER` = '%d' LIMIT 1;", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		PLAYER_CREW[playerid][player_crew_VALID] = true;
		PLAYER_CREW[playerid][player_crew_ID] = db_get_field_assoc_int(Result, "ID_CREW");
		PLAYER_CREW[playerid][player_crew_RANK] = db_get_field_assoc_int(Result, "RANK");

		for(new i = 0; i != MAX_CREWS; i ++)
		{
			if (!CREW_INFO[i][crew_VALID]) continue;

			if (CREW_INFO[i][crew_ID] == PLAYER_CREW[playerid][player_crew_ID])
			{
				PLAYER_CREW[playerid][player_crew_INDEX] = i;
				CREW_INFO[i][crew_ONLINE_MEMBERS] ++;
				found = true;
				break;
			}
		}

		if (!found)
		{
			PLAYER_CREW[playerid][player_crew_VALID] = false;
			PLAYER_CREW[playerid][player_crew_ID] = 0;
			PLAYER_CREW[playerid][player_crew_RANK] = 0;
			PLAYER_CREW[playerid][player_crew_INDEX] = 0;
			ShowPlayerMessage(playerid, "~r~La banda a la que pertenecías ya no existe.", 3);

			format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_CREW` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
			db_free_result(db_query(Database, DB_Query));
		}
	}
	else PLAYER_CREW[playerid][player_crew_VALID] = false;
	db_free_result(Result);
	return 1;
}

LoadPlayerWorks(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[90], player_works, bool:affected;
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_WORKS` WHERE `ID_USER` = '%d' LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], sizeof(PLAYER_WORKS[]));
	Result = db_query(Database, DB_Query);

	for(new i; i < db_num_rows(Result); i++ )
	{
		new work = db_get_field_assoc_int(Result, "ID_WORK");
		PLAYER_WORKS[playerid][work] = db_get_field_assoc_int(Result, "SET");
		if (PLAYER_WORKS[playerid][work])
		{
			if (!ACCOUNT_INFO[playerid][ac_SU])
			{
				if (player_works >= MAX_NU_WORKS)
				{
					affected = true;
					PLAYER_WORKS[playerid][work] = false;
					break;
				}
			}
			player_works ++;
		}

		db_next_row(Result);
	}
	db_free_result(Result);

	if (affected) SavePlayerWorks(playerid);
	return 1;
}

SavePlayerSkills(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DB_Query[150];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_SKILLS` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	for(new i = 1; i != sizeof(PLAYER_SKILLS[]); i ++)
	{
		DB_Query[0] = EOS;
		format(DB_Query, sizeof DB_Query, "INSERT INTO `PLAYER_SKILLS` (`ID_USER`, `ID_WORK`, `TOTAL`) VALUES ('%d', '%d', '%d');", ACCOUNT_INFO[playerid][ac_ID], i, PLAYER_SKILLS[playerid][i]);
		db_free_result(db_query(Database, DB_Query));
	}
	return 1;
}

LoadPlayerSkills(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[90];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_SKILLS` WHERE `ID_USER` = '%d' LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], sizeof(PLAYER_SKILLS[]));
	Result = db_query(Database, DB_Query);

	for(new i; i < db_num_rows(Result); i++ )
	{
		new work = db_get_field_assoc_int(Result, "ID_WORK");
		PLAYER_SKILLS[playerid][work] = db_get_field_assoc_int(Result, "TOTAL");
		db_next_row(Result);
	}
	db_free_result(Result);
	return 1;
}

SavePlayerMisc(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DB_Query[150];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_MISC` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	safe_db_query("BEGIN TRANSACTION");
	for(new i = 0; i != sizeof(PLAYER_MISC[]); i ++)
	{
		DB_Query[0] = EOS;
		format(DB_Query, sizeof DB_Query, "INSERT INTO `PLAYER_MISC` (`ID_USER`, `ID`, `EXTRA`) VALUES ('%d', '%d', '%d');", ACCOUNT_INFO[playerid][ac_ID], i, PLAYER_MISC[playerid][E_MISC_DATA:i]);
		db_free_result(db_query(Database, DB_Query));
	}
	safe_db_query("END TRANSACTION");
	return 1;
}

LoadPlayerMisc(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[90];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_MISC` WHERE `ID_USER` = '%d' LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], sizeof(PLAYER_MISC[]));
	Result = db_query(Database, DB_Query);

	for(new i; i < db_num_rows(Result); i++ )
	{
		new index = db_get_field_assoc_int(Result, "ID");
		PLAYER_MISC[playerid][E_MISC_DATA:index] = db_get_field_assoc_int(Result, "EXTRA");
		db_next_row(Result);
	}
	db_free_result(Result);
	return 1;
}

/*ConvertTime_SecondsToHours(sec, &hours, &minutes, &seconds)
{
	hours = floatround(sec / 3600);
	minutes = floatround((sec - (hours * 3600)) / 60);
	seconds = sec % 60;
	return 1;
}*/

GivePlayerReputation(playerid, ammount = 1, bool:message = true)
{
	new neccessary_rep = ACCOUNT_INFO[playerid][ac_LEVEL] * REP_MULTIPLIER;
	if (ACCOUNT_INFO[playerid][ac_REP] < neccessary_rep)
	{
		ACCOUNT_INFO[playerid][ac_REP] += ammount;
		
		if (message)
		{
			new str_text[64];
			format(str_text, sizeof(str_text), "EXP~n~~w~+%d", ammount);
			ShowPlayerAlert(playerid, str_text, 0xdf23f9FF, 4);
		}

		if (ACCOUNT_INFO[playerid][ac_REP] >= neccessary_rep) NextLevel(playerid);
		return 1;
	}
	return 0;
}

ResetGraffitiTextdraw()
{
	TextDrawDestroy(Textdraws[textdraw_GRAFFITI_PLUS][1]);
	TextDrawDestroy(Textdraws[textdraw_GRAFFITI_PLUS][3]);
	TextDrawDestroy(Textdraws[textdraw_GRAFFITI_PLUS][4]);

	Textdraws[textdraw_GRAFFITI_PLUS][1] = TextDrawCreate(501.500000, 140.766708, "_");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][1], 0.206498, 1.211886);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][1], 610.000000, 0.409999);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][1], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][1], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][1], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][1], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][1], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][1], 0);

	Textdraws[textdraw_GRAFFITI_PLUS][3] = TextDrawCreate(501.500000, 156.322280, "_");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][3], 0.206497, 1.211886);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][3], 610.000000, 0.409999);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][3], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][3], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][3], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][3], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][3], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][3], 0);

	Textdraws[textdraw_GRAFFITI_PLUS][4] = TextDrawCreate(501.500000, 171.877853, "_");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][4], 0.206497, 1.211886);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][4], 610.000000, 0.409999);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][4], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][4], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][4], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][4], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][4], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][4], 0);
	return 1;
}

SetMarketTextdraw()
{
	TextDrawDestroy(Textdraws[textdraw_GRAFFITI_PLUS][1]);
	TextDrawDestroy(Textdraws[textdraw_GRAFFITI_PLUS][3]);
	TextDrawDestroy(Textdraws[textdraw_GRAFFITI_PLUS][4]);

	Textdraws[textdraw_GRAFFITI_PLUS][1] = TextDrawCreate(501.500000, 140.766708, "_");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][1], 0.206498, 1.211886);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][1], 610.000000, 0.409999);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][1], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][1], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][1], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][1], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][1], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][1], 0);

	Textdraws[textdraw_GRAFFITI_PLUS][3] = TextDrawCreate(501.500000, 167.522293, "_");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][3], 0.206497, 1.211886);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][3], 610.000000, 0.409999);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][3], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][3], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][3], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][3], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][3], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][3], 0);

	Textdraws[textdraw_GRAFFITI_PLUS][4] = TextDrawCreate(501.500000, 194.277877, "_");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][4], 0.206497, 1.211886);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][4], 610.000000, 0.409999);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][4], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][4], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][4], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][4], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][4], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][4], 0);
	return 1;
}

NextLevel(playerid)
{
	new neccessary_rep = ACCOUNT_INFO[playerid][ac_LEVEL] * REP_MULTIPLIER;
	if (ACCOUNT_INFO[playerid][ac_REP] < neccessary_rep) return 0;
	GivePlayerCash(playerid, (ACCOUNT_INFO[playerid][ac_LEVEL] * 150));

	ACCOUNT_INFO[playerid][ac_REP] = 1;
	ACCOUNT_INFO[playerid][ac_LEVEL] ++;
	//UpdateReputationTextDraws(playerid);
	SetPlayerSkillLevels(playerid);

	ShowPlayerNotification(playerid, sprintf("~r~SUBISTE DE NIVEL~w~~n~Felicidades, has subido al nivel %d.", ACCOUNT_INFO[playerid][ac_LEVEL]), 5);
	SetPlayerScore(playerid, ACCOUNT_INFO[playerid][ac_LEVEL]);

	new str_text[64];
	format(str_text, sizeof(str_text), "LVL~n~~w~%d", ACCOUNT_INFO[playerid][ac_LEVEL]);
	ShowPlayerAlert(playerid, str_text, 0xF7AF30FF, 4);

	ACCOUNT_INFO[playerid][ac_TIME_FOR_REP] = TIME_FOR_REP;
	PLAYER_TEMP[playerid][py_TIME_PASSED_LAST_REP] = gettime() * 1000;


	ACCOUNT_INFO[playerid][ac_TIME_PLAYING] += gettime() - PLAYER_TEMP[playerid][py_TIME_PLAYING];
	PLAYER_TEMP[playerid][py_TIME_PLAYING] = gettime();
	new DB_Query[256];
	format(DB_Query, sizeof DB_Query,

		"\
			UPDATE `CUENTA` SET `TIME-PLAYING` = '%d', `LEVEL` = '%d', `REP` = '%d', `TIME_FOR_REP` = '%d', `PAYDAY_REP` = '%d' WHERE `ID` = '%d';\
		",
			ACCOUNT_INFO[playerid][ac_TIME_PLAYING], ACCOUNT_INFO[playerid][ac_LEVEL], ACCOUNT_INFO[playerid][ac_REP], TIME_FOR_REP, ACCOUNT_INFO[playerid][ac_PAYDAY_REP], ACCOUNT_INFO[playerid][ac_ID]
	);
	db_free_result(db_query(Database, DB_Query));

	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][2]);
	PLAYER_TEMP[playerid][py_TIMERS][2] = SetTimerEx("AddPlayerReputation", ACCOUNT_INFO[playerid][ac_TIME_FOR_REP], false, "i", playerid);
	return 1;
}

SetPlayerCash(playerid, ammount, bool:update = true)
{
	CHARACTER_INFO[playerid][ch_CASH] = ammount;
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, CHARACTER_INFO[playerid][ch_CASH]);

	if (update)
	{
		new DB_Query[160];
		format(DB_Query, sizeof DB_Query, "UPDATE `PERSONAJE` SET `CASH` = '%d' WHERE `ID_USER` = '%d';", CHARACTER_INFO[playerid][ch_CASH], ACCOUNT_INFO[playerid][ac_ID]);
		db_free_result(db_query(Database, DB_Query));
	}
	return 1;
}

GivePlayerCash(playerid, ammount, bool:update = true, bool:game_text = true)
{
	if (game_text)
	{
		new str_text[128];

		format(str_text, sizeof(str_text), "~w~=%d$", ammount);

		if (ammount >= 0)
			format(str_text, sizeof(str_text), "~g~+%d$", ammount);

		if (ammount < 0)
			format(str_text, sizeof(str_text), "~r~%d$", ammount);
		
		GameTextForPlayer(playerid, str_text, 4000, 1);
	}

	CHARACTER_INFO[playerid][ch_CASH] += ammount;
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, CHARACTER_INFO[playerid][ch_CASH]);

	if (update)
	{
		new DB_Query[160];
		format(DB_Query, sizeof DB_Query, "UPDATE `PERSONAJE` SET `CASH` = '%d' WHERE `ID_USER` = '%d';", CHARACTER_INFO[playerid][ch_CASH], ACCOUNT_INFO[playerid][ac_ID]);
		db_free_result(db_query(Database, DB_Query));
	}
	return 1;
}

minrand(min, max)
{
	return random(max - min) + min;
}

SetIntroCamera(playerid)
{
	new RandomSelectCamera = random(16);
    switch (RandomSelectCamera)
    {
		case 0:
		{
			InterpolateCameraPos(playerid, 1274.256958, -311.781494, 21.153951, 1240.965087, -484.300476, 39.420730, 60000);
			InterpolateCameraLookAt(playerid, 1273.389160, -316.641235, 20.360445, 1239.888183, -489.105590, 40.287422, 60000);
		}
		case 1: 
		{
			InterpolateCameraPos(playerid, 1287.876098, -1423.913696, 31.946989, 1258.807373, -1320.270751, 27.389789, 60000);
			InterpolateCameraLookAt(playerid, 1284.815307, -1420.031127, 31.200996, 1253.876220, -1320.266479, 26.562788, 60000);
		}
		case 2: 
		{
			InterpolateCameraPos(playerid, 1769.471069, -249.647293, 109.279930, 1691.584350, -260.034790, 106.816886, 60000);
			InterpolateCameraLookAt(playerid, 1769.510375, -254.111862, 107.029129, 1692.093261, -264.530670, 104.688995, 60000);
		}
		case 3: 
		{
			InterpolateCameraPos(playerid, 1720.385375, -408.378967, 48.505195, 1692.704833, -507.576904, 45.646732, 60000);
			InterpolateCameraLookAt(playerid, 1718.715576, -413.081634, 48.194107, 1693.375732, -512.531250, 45.581539, 60000);
		}
		case 4: 
		{
			InterpolateCameraPos(playerid, -2148.998291, 554.091186, 41.781066, -2080.489501, 576.044128, 42.103866, 60000);
			InterpolateCameraLookAt(playerid, -2144.032714, 554.676452, 41.749816, -2075.490234, 576.056579, 42.181987, 60000);
		}
		case 5: 
		{
			InterpolateCameraPos(playerid, 2366.046875, 2169.605712, 14.282853, 2299.226318, 2147.148437, 24.365032, 60000);
			InterpolateCameraLookAt(playerid, 2361.632080, 2167.424316, 15.149547, 2294.227783, 2147.205322, 24.470493, 60000);
		}
		case 6: 
		{
			InterpolateCameraPos(playerid, -2547.232666, -55.746692, 30.905969, -2530.718505, -4.454901, 29.586551, 60000);
			InterpolateCameraLookAt(playerid, -2543.840820, -52.088130, 30.574182, -2526.174316, -6.474372, 29.064069, 60000);
		}
		case 7:
		{
			InterpolateCameraPos(playerid, 2098.958496, 15.110654, 28.771690, 2024.581176, -109.930915, 31.089904, 60000);
			InterpolateCameraLookAt(playerid, 2100.868896, 10.701032, 27.391414, 2029.278564, -108.953018, 29.683368, 60000);
		}
		case 8:
		{
			InterpolateCameraPos(playerid, -1734.929931, 902.305664, 31.427259, -1778.646118, 942.846984, 33.246734, 60000);
			InterpolateCameraLookAt(playerid, -1738.319702, 905.981201, 31.416751, -1783.565307, 943.661560, 33.618694, 60000);
		}
		case 9:
		{
			InterpolateCameraPos(playerid, 2343.193359, -1389.369506, 34.948970, 2402.278320, -1293.767578, 33.055675, 60000);
			InterpolateCameraLookAt(playerid, 2347.229248, -1386.616943, 33.883308, 2403.856933, -1289.026489, 32.884151, 60000);
		}
		case 10:
		{
			InterpolateCameraPos(playerid, 2146.722656, -1321.355224, 30.315546, 2248.476318, -1280.461425, 36.017330, 60000);
			InterpolateCameraLookAt(playerid, 2151.317871, -1319.432739, 30.748596, 2252.710693, -1277.804931, 35.904056, 60000);
		}
		case 11:
		{
			InterpolateCameraPos(playerid, 655.701904, -743.479614, 44.184524, 615.779602, -687.716979, 31.585304, 60000);
			InterpolateCameraLookAt(playerid, 652.221130, -740.344055, 42.437351, 610.971923, -688.673645, 30.599927, 60000);
		}
		case 12:
		{
			InterpolateCameraPos(playerid, 872.725097, -999.728759, 57.511142, 857.525329, -914.929321, 72.688385, 60000);
			InterpolateCameraLookAt(playerid, 873.292175, -994.777343, 57.913368, 858.913513, -910.260925, 73.819450, 60000);
		}
		case 13:
		{
			InterpolateCameraPos(playerid, 2507.652343, 2129.115478, 14.842836, 2459.415771, 2137.726318, 18.873964, 60000);
			InterpolateCameraLookAt(playerid, 2503.152832, 2131.282958, 15.081345, 2456.733642, 2141.915039, 19.385107, 60000);
		}
		case 14:
		{
			InterpolateCameraPos(playerid, -2233.041015, 552.320617, 38.984733, -2172.366699, 558.488952, 42.372241, 5000);
			InterpolateCameraLookAt(playerid, -2228.212402, 553.598388, 38.755554, -2169.340576, 562.466491, 42.225036, 5000);
		}
		case 15:
		{
			InterpolateCameraPos(playerid, 1828.665893, -1103.566162, 24.149976, 1781.768066, -1075.379638, 26.545591, 60000);
			InterpolateCameraLookAt(playerid, 1824.796386, -1100.408447, 24.385477, 1776.871459, -1074.370727, 26.617115, 60000);
		}
    }

    SetPlayerTime(playerid, SERVER_TIME[0], SERVER_TIME[1]);
	SetPlayerWeather(playerid, SERVER_WEATHER);
    return 1;
}

/*CheckBlockedWeapon(playerid, weapon_ip)
{
	if (ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL] < ADMIN_LEVEL_AC_IMMUNITY)
	{
		if (!PLAYER_WORKS[playerid][WORK_POLICE] && !PlayerIsInMafia(playerid) && !ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL])
	  	{
			new bool:blocked = false;
			switch(weapon_ip)
			{
				case 31, 29, 23, 34, 24, 27, 30: blocked = true;
			}

			if (blocked)
			{
				ResetPlayerWeaponsEx(playerid);

		    	AddPlayerBadHistory(ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_ID], TYPE_KICK, "Armas del PD sin serlo");

		    	new str[144];
		    	format(str, 144, "[ANTI-CHEAT] Kick sobre %s (%d): Armas del PD sin serlo", ACCOUNT_INFO[playerid][ac_NAME], playerid);
		    	SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);
		    	SendDiscordWebhook(str, 1);
		    
		    	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Razón: Tener armas prohibidas");
		    	KickEx(playerid, 500);
		  	}
		}
	}
 	return 1;
}*/

RegisterBankAccountTransaction(account_id, transaction_type, ammount, extra = -1)
{
	new DB_Query[215];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `BANK_TRANSACTIONS` \
		(\
			`ID_ACCOUNT`, `TRANSACTION_TYPE`, `AMMOUNT`, `EXTRA`\
		) \
		VALUES \
		(\
			%d, %d, %d, %d\
		);\
	", account_id, transaction_type, ammount, extra);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

RegisterNewPlayer(playerid)
{
	if (PLAYER_TEMP[playerid][py_USER_EXIT]) return 0;

	new DBResult:Result, DB_Query[900];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `CUENTA` \
		(\
			`IP`, `NAME`, `EMAIL`, `GPCI`, `SALT`, `PASS`, `CONNECTED`, `PLAYERID`, `TIME_FOR_REP`\
		) \
		VALUES \
		(\
			'%q', '%q', '%q', '%q', '%q', '%q', 1, %d, %d\
		);\
		SELECT `ID`, `LAST_CONNECTION` FROM `CUENTA` WHERE `NAME` = '%q';\
	", ACCOUNT_INFO[playerid][ac_IP], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_EMAIL], ACCOUNT_INFO[playerid][ac_SERIAL], ACCOUNT_INFO[playerid][ac_SALT], ACCOUNT_INFO[playerid][ac_PASS], playerid, TIME_FOR_REP, ACCOUNT_INFO[playerid][ac_NAME]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		ACCOUNT_INFO[playerid][ac_ID] = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "LAST_CONNECTION", ACCOUNT_INFO[playerid][ac_LAST_CONNECTION], 24);
		ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL] = true;
	}
	db_free_result(Result);

	DB_Query[0] = EOS;
	new DBResult:Result_reg;
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `REGISTRO`\
		(\
			`ID_USER`, `IP`, `NAME`, `EMAIL`, `SALT`, `PASS`\
		)\
		VALUES\
		(\
			'%d', '%q', '%q', '%q', '%q', '%q'\
		);\
		SELECT `DATE` FROM `REGISTRO` WHERE `ID_USER` = '%d';\
	", ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_IP], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_EMAIL], ACCOUNT_INFO[playerid][ac_SALT], ACCOUNT_INFO[playerid][ac_PASS], ACCOUNT_INFO[playerid][ac_ID]);
	Result_reg = db_query(Database, DB_Query);

	if (db_num_rows(Result_reg)) db_get_field_assoc(Result, "DATE", ACCOUNT_INFO[playerid][reg_DATE], 24);
	db_free_result(Result_reg);


	DB_Query[0] = EOS;
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PERSONAJE`\
		(\
			`ID_USER`, `SKIN`, `CASH`, `POS_X`, `POS_Y`, `POS_Z`, `ANGLE`, `SEX`\
		)\
		VALUES\
		(\
			'%d', '%d', '%d', '%f', '%f', '%f', '%f', '%d'\
		);\
	", ACCOUNT_INFO[playerid][ac_ID], CHARACTER_INFO[playerid][ch_SKIN], CHARACTER_INFO[playerid][ch_CASH], CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], CHARACTER_INFO[playerid][ch_SEX]);
	db_free_result(db_query(Database, DB_Query));

	DB_Query[0] = EOS;
	format(DB_Query, sizeof DB_Query, "INSERT INTO `PLAYER_OBJECT` (`ID_USER`) VALUES ('%d');", ACCOUNT_INFO[playerid][ac_ID]);
	db_free_result(db_query(Database, DB_Query));


	new DBResult:Result_pnumber, phone_number;
	Result_pnumber = db_query(Database, "SELECT ABS(RANDOM() % 10000000) AS `NUM` WHERE `NUM` NOT IN (SELECT `PHONE_NUMBER` FROM `PHONE`) LIMIT 1;");
	if (db_num_rows(Result_pnumber)) phone_number = db_get_field_int(Result_pnumber, 0);
	db_free_result(Result_pnumber);

	if (phone_number)
	{
		PLAYER_PHONE[playerid][player_phone_VALID] = true;
		PLAYER_PHONE[playerid][player_phone_NUMBER] = phone_number;
		PLAYER_PHONE[playerid][player_phone_STATE] = PHONE_STATE_ON;
		PLAYER_PHONE[playerid][player_phone_VISIBLE_NUMBER] = true;
		RegisterNewPlayerPhone(playerid);
	}

	new slot;

	PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_VALID] = true;
	format(PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_NAME], 24, "Policia");
	PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_PHONE_NUMBER] = 911;
	RegisterNewPlayerPhoneBook(playerid, slot);
	slot ++;

	PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_VALID] = true;
	format(PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_NAME], 24, "Banco");
	PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_PHONE_NUMBER] = 6740;
	RegisterNewPlayerPhoneBook(playerid, slot);
	slot ++;

	PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_VALID] = true;
	format(PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_NAME], 24, "Aseguradora");
	PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_PHONE_NUMBER] = 38350;
	RegisterNewPlayerPhoneBook(playerid, slot);
	slot ++;

	PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_VALID] = true;
	format(PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_NAME], 24, "Mecanico");
	PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_PHONE_NUMBER] = 570;
	RegisterNewPlayerPhoneBook(playerid, slot);
	slot ++;

	PLAYER_TEMP[playerid][py_USER_EXIT] = true;
	return 1;
}

SaveUserData(playerid)
{
	if (!PLAYER_TEMP[playerid][py_USER_EXIT] || !PLAYER_TEMP[playerid][py_USER_LOGGED]) return 0;

	new DB_Query[1950];
	format(DB_Query, sizeof(DB_Query), "\
		UPDATE `CUENTA` SET \
		`IP` = '%q',\
		`NAME` = '%q',\
		`EMAIL` = '%q',\
		`GPCI` = '%q',\
		`SALT` = '%q',\
		`PASS` = '%q',\
		`LAST_CONNECTION` = CURRENT_TIMESTAMP,\
		`TIME-PLAYING` = '%d',\
		`LEVEL` = '%d',\
		`REP` = '%d',\
		`STATE` = '%d',\
		`DOUBT_CHANNEL` = '%d',\
		`TIME_FOR_REP` = '%d',\
		`ADMIN_LEVEL` = '%d',\
		`PAYDAY_REP` = '%d' \
		WHERE `ID` = '%d';\
		\
		UPDATE `PERSONAJE` SET \
		`SKIN` = '%d',\
		`CASH` = '%d',\
		`POS_X` = '%f',\
		`POS_Y` = '%f',\
		`POS_Z` = '%f',\
		`ANGLE` = '%f',\
		`STATE` = '%d',\
		`INTERIOR` = '%d',\
		`LOCAL_INTERIOR` = '%d',\
		`FIGHT_STYLE` = '%d',\
		`HEALTH` = '%f',\
		`ARMOUR` = '%f',\
		`SEX` = '%d',\
		`HUNGRY` = '%f',\
		`THIRST` = '%f',\
		`BLACK_MARKET_LEVEL` = '%d',\
		`POLICE_JAIL_TIME` = '%d', \
		`POLICE_JAIL_ID` = '%d', \
		`JAIL_REASON` = '%q', \
		`JAILED_BY` = %d \
		WHERE `ID_USER` = '%d';\
		\
		UPDATE `BANK_ACCOUNTS` SET\
		`BALANCE` = '%d' \
		WHERE `ID_ACCOUNT` = '%d';\
		\
		UPDATE `PHONE` SET\
		`PHONE_NUMBER` = '%d',\
		`PHONE_STATE` = '%d',\
		`VISIBLE_NUMBER` = '%d' \
		WHERE `ID_USER` = '%d';\
		\
		UPDATE `PLAYER_OBJECT` SET\
		`GPS` = '%d',\
		`MP3` = '%d',\
		`PHONE_RESOLVER` = '%d', \
		`BOOMBOX` = %d \
		WHERE `ID_USER` = '%d';\
		",
		ACCOUNT_INFO[playerid][ac_IP], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_EMAIL], ACCOUNT_INFO[playerid][ac_SERIAL], ACCOUNT_INFO[playerid][ac_SALT], ACCOUNT_INFO[playerid][ac_PASS], ACCOUNT_INFO[playerid][ac_TIME_PLAYING], ACCOUNT_INFO[playerid][ac_LEVEL], ACCOUNT_INFO[playerid][ac_REP], ACCOUNT_INFO[playerid][ac_STATE], ACCOUNT_INFO[playerid][ac_DOUBT_CHANNEL], ACCOUNT_INFO[playerid][ac_TIME_FOR_REP], ACCOUNT_INFO[playerid][ac_ADMIN_LEVEL], ACCOUNT_INFO[playerid][ac_PAYDAY_REP], ACCOUNT_INFO[playerid][ac_ID],
		CHARACTER_INFO[playerid][ch_SKIN], CHARACTER_INFO[playerid][ch_CASH], CHARACTER_INFO[playerid][ch_POS][0], CHARACTER_INFO[playerid][ch_POS][1], CHARACTER_INFO[playerid][ch_POS][2], CHARACTER_INFO[playerid][ch_ANGLE], CHARACTER_INFO[playerid][ch_STATE], CHARACTER_INFO[playerid][ch_INTERIOR], CHARACTER_INFO[playerid][ch_INTERIOR_EXTRA], CHARACTER_INFO[playerid][ch_FIGHT_STYLE], CHARACTER_INFO[playerid][ch_HEALTH], CHARACTER_INFO[playerid][ch_ARMOUR],  CHARACTER_INFO[playerid][ch_SEX], CHARACTER_INFO[playerid][ch_HUNGRY], CHARACTER_INFO[playerid][ch_THIRST], CHARACTER_INFO[playerid][ch_BLACK_MARKET_LEVEL], CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME], CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID], CHARACTER_INFO[playerid][ch_JAIL_REASON], CHARACTER_INFO[playerid][ch_JAILED_BY], ACCOUNT_INFO[playerid][ac_ID],
		BANK_ACCOUNT[playerid][bank_account_BALANCE], BANK_ACCOUNT[playerid][bank_account_ID],
		PLAYER_PHONE[playerid][player_phone_NUMBER], PLAYER_PHONE[playerid][player_phone_STATE], PLAYER_PHONE[playerid][player_phone_VISIBLE_NUMBER], ACCOUNT_INFO[playerid][ac_ID],
		PLAYER_OBJECT[playerid][po_GPS], PLAYER_OBJECT[playerid][po_MP3], PLAYER_OBJECT[playerid][po_PHONE_RESOLVER], PLAYER_OBJECT[playerid][po_BOOMBOX], ACCOUNT_INFO[playerid][ac_ID]
	);
	db_free_result(db_query(Database, DB_Query));

	if (PLAYER_MISC[playerid][MISC_GAMEMODE] != 0)
	{
		if (BANK_ACCOUNT[playerid][bank_account_ID] != 0)
		{
			new DBResult:Result;
			format(DB_Query, sizeof(DB_Query),
				"DELETE FROM `BANK_TRANSACTIONS` WHERE `ID_ACCOUNT` = '%d' AND `ID_TRANSACTION` NOT IN (SELECT `ID_TRANSACTION` FROM `BANK_TRANSACTIONS` WHERE `ID_ACCOUNT` = '%d' ORDER BY `DATE` DESC LIMIT %d);",
				BANK_ACCOUNT[playerid][bank_account_ID], BANK_ACCOUNT[playerid][bank_account_ID], MAX_BANK_TRANSACTIONS_DIALOG
			);

			Result = db_query(Database, DB_Query);
			db_free_result(Result);
		}

		if (PLAYER_PHONE[playerid][player_phone_VALID])
		{
			new DBResult:Result;
			format(DB_Query, sizeof(DB_Query),
				"DELETE FROM `PHONE_MESSAGES` WHERE `FROM` = '%d' AND `ID_MESSAGE` NOT IN (SELECT `ID_MESSAGE` FROM `PHONE_MESSAGES` WHERE `FROM` = '%d' ORDER BY `DATE` DESC LIMIT 10);\
				DELETE FROM `PHONE_MESSAGES` WHERE `TO` = '%d' AND `ID_MESSAGE` NOT IN (SELECT `ID_MESSAGE` FROM `PHONE_MESSAGES` WHERE `TO` = '%d' ORDER BY `DATE` DESC LIMIT 10);",
				PLAYER_PHONE[playerid][player_phone_NUMBER], PLAYER_PHONE[playerid][player_phone_NUMBER],
				PLAYER_PHONE[playerid][player_phone_NUMBER], PLAYER_PHONE[playerid][player_phone_NUMBER]
			);
			printf("%s", DB_Query);

			Result = db_query(Database, DB_Query); // crash aca
			db_free_result(Result);
		}
	}
	return 1;
}

SendClientMessageEx(playerid, color, const form[], {Float, _}: ...)
{
    #pragma unused form

    static
	   tmp[144]
    ;
    new
	   t1 = playerid,
	   t2 = color
    ;
    const
	   n4 = -4,
	   n16 = -16,
	   size = sizeof tmp
    ;
    #emit stack 28
    #emit push.c size
    #emit push.c tmp
    #emit stack n4
    #emit sysreq.c format
    #emit stack n16

    return (t1 == -1 ? (SendClientMessageToAll(t2, tmp)) : (SendClientMessage(t1, t2, tmp)) );
}

TimeConvert(seconds)
{
	new tmp[16];
	new minutes = floatround(seconds/60);
	seconds -= minutes*60;
	format(tmp, sizeof(tmp), "%d:%02d", minutes, seconds);
	return tmp;
}

/*TimeConvertEx(sec, &days, &hours, &minutes, &seconds)
{
	days = floatround(sec / 86400);
	hours = floatround((sec - (days * 86400)) / 3600);
	minutes = floatround((sec - (days * 86400) - (hours * 3600)) / 60);
	seconds = sec % 60;
	return 1;
}*/

ProxDetector(playerid, Float:radi, string[], col1, col2, col3, col4, col5, div = 0)
{
	new line1_str[165], line2_str[165], bool:line2_used;

	if (div)
	{
		format(line1_str, div + 1, "%s", string);
		if (strlen(string) > div)
		{
			format(line2_str, sizeof line2_str, "— %s", string[div]);
			line2_used = true;
		}
	}
	else format(line1_str, sizeof line1_str, "%s", string);

	new Float:oldposx, Float:oldposy, Float:oldposz, current_vw = GetPlayerVirtualWorld(playerid), current_int = GetPlayerInterior(playerid);
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (!IsPlayerConnected(i)) continue;
		if (!PLAYER_TEMP[i][py_USER_LOGGED]) continue;
		if (GetPlayerVirtualWorld(i) != current_vw) continue;
		if (GetPlayerInterior(i) != current_int) continue;

		if (IsPlayerInRangeOfPoint(i, radi/16, oldposx, oldposy, oldposz))
		{
			SendClientMessage(i, col1, line1_str);
			if (div && line2_used) SendClientMessage(i, col1, line2_str);
		}
		else if (IsPlayerInRangeOfPoint(i, radi/8, oldposx, oldposy, oldposz))
		{
			SendClientMessage(i, col2, line1_str);
			if (div && line2_used) SendClientMessage(i, col2, line2_str);
		}
		else if (IsPlayerInRangeOfPoint(i, radi/4, oldposx, oldposy, oldposz))
		{
			SendClientMessage(i, col3, line1_str);
			if (div && line2_used) SendClientMessage(i, col3, line2_str);
		}
		else if (IsPlayerInRangeOfPoint(i, radi/2, oldposx, oldposy, oldposz))
		{
			SendClientMessage(i, col4, line1_str);
			if (div && line2_used) SendClientMessage(i, col4, line2_str);
		}
		else if (IsPlayerInRangeOfPoint(i, radi, oldposx, oldposy, oldposz))
		{
			SendClientMessage(i, col5, line1_str);
			if (div && line2_used) SendClientMessage(i, col5, line2_str);
		}
	}
	return 1;
}

SendResponsiveMessage(playerid, color, const string[], div = 0)
{
	new line1_str[144], line2_str[144], bool:line2_used;

	if (div)
	{
		format(line1_str, div + 1, "%s", string);
		if (strlen(string) > div)
		{
			format(line2_str, sizeof line2_str, "— %s", string[div]);
			line2_used = true;
		}
	}
	else format(line1_str, sizeof line1_str, "%s", string);

	SendClientMessage(playerid, color, line1_str);
	if (div && line2_used) SendClientMessage(playerid, -1, line2_str);
	return 1;
}

NearbyMessage(Float:pos_x, Float:pos_y, Float:pos_z, current_int, current_vw, Float:radi, col, const string[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (!IsPlayerConnected(i)) continue;
		if (!PLAYER_TEMP[i][py_USER_LOGGED]) continue;
		if (GetPlayerVirtualWorld(i) != current_vw) continue;
		if (GetPlayerInterior(i) != current_int) continue;

		if (IsPlayerInRangeOfPoint(i, radi, pos_x, pos_y, pos_z)) SendClientMessage(i, col, string);
	}
	return 1;
}

IsValidRPName(const string[])
{
    new Regex:reg_exp = Regex_New("[A-Z][a-z]+_[A-Z][a-z]{1,3}[A-Z]?[a-z]*"); 
    new result = Regex_Check(string, reg_exp); 
    Regex_Delete(reg_exp); 
    return result; 
}

StringContainsIP(const string[])
{
	if (strfind(string, "51.161.31.157", true) != -1) return false;

    new Regex:reg_exp = Regex_New("([0-9]{1,3}[\\.]){3}[0-9]{1,3}"), RegexMatch:results, pos;
    new result = Regex_Search(string, reg_exp, results, pos);
    Regex_Delete(reg_exp); 
    return result; 
}

SetRolePlayNames(playerid)
{
	if (isnull(PLAYER_TEMP[playerid][py_NAME])) return 0;

	new name[24], bool:underscore;
	format(name, 24, "%s", PLAYER_TEMP[playerid][py_NAME]);
	format(PLAYER_TEMP[playerid][py_RP_NAME], 24, "%s", name);
	for(new i = 0; i < 24; i++)
	{
		if (name[i] == '_')
		{
			PLAYER_TEMP[playerid][py_RP_NAME][i] = ' ';
			if (!underscore)
			{
				strmid(PLAYER_TEMP[playerid][py_FIRST_NAME], name, 0, i);
				strmid(PLAYER_TEMP[playerid][py_SUB_NAME], name, i + 1, 24);
				underscore = true;
			}
		}
	}
	return 1;
}

LoadCharacterData(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[164];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PERSONAJE` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		CHARACTER_INFO[playerid][ch_SKIN] = db_get_field_assoc_int(Result, "SKIN");
		CHARACTER_INFO[playerid][ch_CASH] = db_get_field_assoc_int(Result, "CASH");
		CHARACTER_INFO[playerid][ch_FIGHT_STYLE] = db_get_field_assoc_int(Result, "FIGHT_STYLE");
		CHARACTER_INFO[playerid][ch_HEALTH] = db_get_field_assoc_float(Result, "HEALTH");
		CHARACTER_INFO[playerid][ch_ARMOUR] = db_get_field_assoc_float(Result, "ARMOUR");
		CHARACTER_INFO[playerid][ch_SEX] = db_get_field_assoc_int(Result, "SEX");
		CHARACTER_INFO[playerid][ch_HUNGRY] = db_get_field_assoc_float(Result, "HUNGRY");
		CHARACTER_INFO[playerid][ch_THIRST] = db_get_field_assoc_float(Result, "THIRST");
		CHARACTER_INFO[playerid][ch_BLACK_MARKET_LEVEL] = db_get_field_assoc_int(Result, "BLACK_MARKET_LEVEL");
		CHARACTER_INFO[playerid][ch_POLICE_JAIL_TIME] = db_get_field_assoc_int(Result, "POLICE_JAIL_TIME");
		CHARACTER_INFO[playerid][ch_POLICE_JAIL_ID] = db_get_field_assoc_int(Result, "POLICE_JAIL_ID");
		db_get_field_assoc(Result, "JAIL_REASON", CHARACTER_INFO[playerid][ch_JAIL_REASON]);
		CHARACTER_INFO[playerid][ch_JAILED_BY] = db_get_field_assoc_int(Result, "JAILED_BY");
	}
	db_free_result(Result);

	// Security question
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `SECURITY_QUESTIONS` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		PLAYER_TEMP[playerid][py_ANSWER_INDEX] = db_get_field_assoc_int(Result, "QUESTION");
		db_get_field_assoc(Result, "RESPONSE", PLAYER_TEMP[playerid][py_ANSWER_RESPONSE], 32);
	}
	else PLAYER_TEMP[playerid][py_ANSWER_INDEX] = 1337;

	db_free_result(Result);
	return 1;
}

LoadPlayerBankAccountData(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[85];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `BANK_ACCOUNTS` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		BANK_ACCOUNT[playerid][bank_account_ID] = db_get_field_assoc_int(Result, "ID_ACCOUNT");
		BANK_ACCOUNT[playerid][bank_account_BALANCE] = db_get_field_assoc_int(Result, "BALANCE");
	}
	db_free_result(Result);
	return 1;
}

LoadPlayerObjectsData(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[85];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_OBJECT` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		PLAYER_OBJECT[playerid][po_GPS] = db_get_field_assoc_int(Result, "GPS");
		PLAYER_OBJECT[playerid][po_MP3] = db_get_field_assoc_int(Result, "MP3");
		PLAYER_OBJECT[playerid][po_PHONE_RESOLVER] = db_get_field_assoc_int(Result, "PHONE_RESOLVER");
		PLAYER_OBJECT[playerid][po_BOOMBOX] = db_get_field_assoc_int(Result, "BOOMBOX");
	}
	db_free_result(Result);
	return 1;
}

LoadPlayerPhoneData(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[100];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PHONE` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		PLAYER_PHONE[playerid][player_phone_VALID] = true;
		PLAYER_PHONE[playerid][player_phone_NUMBER] = db_get_field_assoc_int(Result, "PHONE_NUMBER");
		PLAYER_PHONE[playerid][player_phone_STATE] = db_get_field_assoc_int(Result, "PHONE_STATE");
		PLAYER_PHONE[playerid][player_phone_VISIBLE_NUMBER] = db_get_field_assoc_int(Result, "VISIBLE_NUMBER");
	}
	db_free_result(Result);


	DB_Query[0] = EOS;
	new DBResult:Result_phonebook;
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PHONE_BOOK` WHERE `PHONE_ID` = '%d' LIMIT %d;", PLAYER_PHONE[playerid][player_phone_NUMBER], MAX_PHONE_CONTACTS);
	Result_phonebook = db_query(Database, DB_Query);

	new index;
	for(new i; i < db_num_rows(Result_phonebook); i++ )
	{
		if (index >= MAX_PHONE_CONTACTS)
		{
			printf("[debug]  Límite superado en array 'PB' al intentar cargar de la base de datos.");
			break;
		}

		PLAYER_PHONE_BOOK[playerid][index][phone_book_contact_VALID] = true;

		PLAYER_PHONE_BOOK[playerid][index][phone_book_contact_ID] = db_get_field_assoc_int(Result_phonebook, "CONTACT_ID");
		db_get_field_assoc(Result_phonebook, "NAME", PLAYER_PHONE_BOOK[playerid][index][phone_book_contact_NAME], 24);
		PLAYER_PHONE_BOOK[playerid][index][phone_book_contact_PHONE_NUMBER] = db_get_field_assoc_int(Result_phonebook, "PHONE_NUMBER");

		index ++;
		db_next_row(Result_phonebook);
	}
	db_free_result(Result_phonebook);
	return 1;
}

Float:GetDistanceBetweenPoints3D(Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2)
{
    return VectorSize(x1 - x2, y1 - y2, z1 - z2);
}

GetDatabasePages(const query_[], limit)
{
    new DBResult:pages;
	pages = db_query(Database, query_);

	new Float:tpages = floatdiv(floatround(db_get_field_int(pages, 0)), limit);
	db_free_result(pages);
	return floatround(tpages, floatround_ceil);
}

UpdateUnnocupiedPropertyLabel(index)
{
	if (!PROPERTY_INFO[index][property_VALID]) return 0;
	if (PROPERTY_INFO[index][property_SOLD]) return 0;

	new label_str[256], city[45], zone[45];
	GetPointZone(PROPERTY_INFO[index][property_EXT_X], PROPERTY_INFO[index][property_EXT_Y], city, zone);
	format(label_str, sizeof label_str, ""COL_WHITE"Propiedad en %s (%d)\n"COL_GREEN"En venta", zone, PROPERTY_INFO[index][property_ID]);
	UpdateDynamic3DTextLabelText(PROPERTY_INFO[index][property_EXT_LABEL_ID], 0xF7F7F700, label_str);
	return 1;
}

NeuroJail(playerid, time, const reason[])
{
    StopAudioStreamForPlayer(playerid);
    CancelEdit(playerid);
    EndPlayerJob(playerid);

    PLAYER_MISC[playerid][MISC_JAILS] ++;
    SavePlayerMisc(playerid);

    if (PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) EndPhoneCall(playerid);
    if (PLAYER_TEMP[playerid][py_GPS_MAP]) HidePlayerGpsMap(playerid);

    JailPlayer(playerid, time * 60);
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);

    new str[144];
    format(str, 144, "[ADMIN] NeuroAdmin jaileó a %s (%d) por %s minutos: %s.", ACCOUNT_INFO[playerid][ac_NAME], playerid, TimeConvert(time * 60), reason);
    SendMessageToAdmins(COLOR_ANTICHEAT, str);

    new webhook[144];
    format(webhook, sizeof(webhook), ":page_with_curl: %s", str);
	SendDiscordWebhook(webhook, 1);

	new dialog[250];
	format(dialog, sizeof dialog, ""COL_WHITE"NeuroAdmin te jaileó, razón: %s.\nRecuerde que a los 50 jails sera baneado permanentemente.", reason);
	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, ""COL_RED"Aviso", dialog, "Entiendo", "");
	return 1;
}

ReturnTimelapse(start, till)
{
    new ret[32];
	new seconds = till - start;

	const
		MINUTE = 60,
		HOUR = 60 * MINUTE,
		DAY = 24 * HOUR,
		MONTH = 30 * DAY;

	if (seconds == 1)
		format(ret, sizeof(ret), "hace un segundo");
	if (seconds < (1 * MINUTE))
		format(ret, sizeof(ret), "hace %i segundos", seconds);
	else if (seconds < (2 * MINUTE))
		format(ret, sizeof(ret), "hace un minuto");
	else if (seconds < (45 * MINUTE))
		format(ret, sizeof(ret), "hace %i minutos", (seconds / MINUTE));
	else if (seconds < (90 * MINUTE))
		format(ret, sizeof(ret), "hace una hora");
	else if (seconds < (24 * HOUR))
		format(ret, sizeof(ret), "hace %i horas", (seconds / HOUR));
	else if (seconds < (48 * HOUR))
		format(ret, sizeof(ret), "hace un día");
	else if (seconds < (30 * DAY))
		format(ret, sizeof(ret), "hace %i días", (seconds / DAY));
	else if (seconds < (12 * MONTH))
    {
		new months = floatround(seconds / DAY / 30);
      	if (months <= 1)
			format(ret, sizeof(ret), "hace un mes");
      	else
			format(ret, sizeof(ret), "%i meses", months);
	}
    else
    {
      	new years = floatround(seconds / DAY / 365);
      	if (years <= 1)
			format(ret, sizeof(ret), "hace un año");
      	else
			format(ret, sizeof(ret), "%i años", years);
	}
	return ret;
}


GetPropertyIndexByID(id)
{
	for(new i = 0; i != MAX_PROPERTIES; i ++)
	{
		if (!PROPERTY_INFO[i][property_VALID]) continue;
		if (PROPERTY_INFO[i][property_ID] == id) return i;
	}
	return -1;
}

SetPlayerToys(playerid)
{
	for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++) RemovePlayerAttachedObject(playerid, i);

	for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++)
	{
		if (i >= MAX_NU_TOYS && !ACCOUNT_INFO[playerid][ac_SU]) break;

		if (PLAYER_TOYS[playerid][i][player_toy_VALID])
		{
			if (PLAYER_TOYS[playerid][i][player_toy_ATTACHED])
			{
				SetPlayerAttachedObject
				(
					playerid,
					i,
					PLAYER_TOYS[playerid][ i ][player_toy_MODELID],
					PLAYER_TOYS[playerid][ i ][player_toy_BONE],
					PLAYER_TOYS[playerid][ i ][player_toy_OFFSET_X],
					PLAYER_TOYS[playerid][ i ][player_toy_OFFSET_Y],
					PLAYER_TOYS[playerid][ i ][player_toy_OFFSET_Z],
					PLAYER_TOYS[playerid][ i ][player_toy_ROT_X],
					PLAYER_TOYS[playerid][ i ][player_toy_ROT_Y],
					PLAYER_TOYS[playerid][ i ][player_toy_ROT_Z],
					PLAYER_TOYS[playerid][ i ][player_toy_SCALE_X],
					PLAYER_TOYS[playerid][ i ][player_toy_SCALE_Y],
					PLAYER_TOYS[playerid][ i ][player_toy_SCALE_Z],
					PLAYER_TOYS[playerid][ i ][player_toy_COLOR_1],
					PLAYER_TOYS[playerid][ i ][player_toy_COLOR_2]
				);
			}
		}
	}

	return 1;
}

UpdatePlayerToy(playerid, index)
{
	RemovePlayerAttachedObject(playerid, index);
	SetPlayerAttachedObject
	(
		playerid,
		index,
		PLAYER_TOYS[playerid][ index ][player_toy_MODELID],
		PLAYER_TOYS[playerid][ index ][player_toy_BONE],
		PLAYER_TOYS[playerid][ index ][player_toy_OFFSET_X],
		PLAYER_TOYS[playerid][ index ][player_toy_OFFSET_Y],
		PLAYER_TOYS[playerid][ index ][player_toy_OFFSET_Z],
		PLAYER_TOYS[playerid][ index ][player_toy_ROT_X],
		PLAYER_TOYS[playerid][ index ][player_toy_ROT_Y],
		PLAYER_TOYS[playerid][ index ][player_toy_ROT_Z],
		PLAYER_TOYS[playerid][ index ][player_toy_SCALE_X],
		PLAYER_TOYS[playerid][ index ][player_toy_SCALE_Y],
		PLAYER_TOYS[playerid][ index ][player_toy_SCALE_Z],
		PLAYER_TOYS[playerid][ index ][player_toy_COLOR_1],
		PLAYER_TOYS[playerid][ index ][player_toy_COLOR_2]
	);
	SavePlayerToysData(playerid);
	return 1;
}

EditPlayerToy(playerid)
{
	if (PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ATTACHED]) RemovePlayerAttachedObject(playerid, PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT]);

	SetPlayerAttachedObject
	(
		playerid,
		PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT],
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_MODELID],
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_BONE],
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_X],
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_Y],
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_OFFSET_Z],
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_X],
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_Y],
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_ROT_Z],
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_X],
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_Y],
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_SCALE_Z],
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_COLOR_1],
		PLAYER_TOYS[playerid][ PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT] ][player_toy_COLOR_2]
	);

	EditAttachedObject(playerid, PLAYER_TEMP[playerid][py_SELECTED_TOY_SLOT]);
	return 1;
}

RegisterNewPlayerPhone(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DB_Query[200];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PHONE`\
		(\
			`PHONE_NUMBER`, `ID_USER`\
		)\
		VALUES\
		(\
			'%d', '%d'\
		);\
	",
		PLAYER_PHONE[playerid][player_phone_NUMBER], ACCOUNT_INFO[playerid][ac_ID]
	);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

RegisterNewPlayerPhoneBook(playerid, slot)
{
	new DBResult:Result, DB_Query[300];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PHONE_BOOK`\
		(\
			`PHONE_ID`, `NAME`, `PHONE_NUMBER`\
		)\
		VALUES\
		(\
			'%d', '%q', '%d'\
		);\
		SELECT MAX(`CONTACT_ID`) FROM `PHONE_BOOK`;\
	",
		PLAYER_PHONE[playerid][player_phone_NUMBER], PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_NAME], PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_PHONE_NUMBER]
	);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result)) PLAYER_PHONE_BOOK[playerid][slot][phone_book_contact_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);
	return 1;
}

RegisterPhoneMessage(from, to, const message[], offline = 0)
{
	new DB_Query[300];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PHONE_MESSAGES`\
		(\
			`FROM`, `TO`, `MESSAGE`, `OFFLINE`\
		)\
		VALUES\
		(\
			'%d', '%d', '%q', '%d'\
		);\
	", from, to, message, offline);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}

forward NoCallResponse(playerid);
public NoCallResponse(playerid)
{
	#if DEBUG_MODE == 1
		printf("NoCallResponse"); // debug juju
	#endif

	if (!PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) return 0;
	if (PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID] == INVALID_PLAYER_ID) return 0;
	if (PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE] != CALL_STATE_WAITING_RESPONSE) return 0;

	EndPhoneCall(playerid);
	return 1;
}

EndPhoneCall(playerid)
{
	if (!PLAYER_TEMP[playerid][py_PLAYER_IN_CALL]) return 0;

	if (PLAYER_TEMP[playerid][py_POLICE_CALL_NAME] || PLAYER_TEMP[playerid][py_POLICE_CALL_DESCRIPTION])
	{
		PLAYER_TEMP[playerid][py_PLAYER_IN_CALL] = false;
		PLAYER_TEMP[playerid][py_POLICE_CALL_NAME] = false;
		PLAYER_TEMP[playerid][py_POLICE_CALL_DESCRIPTION] = false;
		return 1;
	}

	if (PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID] == INVALID_PLAYER_ID) return 0;
	if (PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE] == CALL_GAME_STATE_NONE) return 0;

	new to_playerid = PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID];
	switch(PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE])
	{
		case CALL_STATE_WAITING_RESPONSE:
		{
			KillTimer(PLAYER_TEMP[playerid][py_TIMERS][6]);

			PLAYER_TEMP[to_playerid][py_PLAYER_IN_CALL] = false;
			PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_STATE] = CALL_GAME_STATE_NONE;
			PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_PLAYERID] = INVALID_PLAYER_ID;
		}
		case CALL_STATE_INCOMING_CALL:
		{
		    ShowPlayerMessage(playerid, "~r~No respondieron el teléfono.", 2);
			KillTimer(PLAYER_TEMP[to_playerid][py_TIMERS][6]);

			PLAYER_TEMP[to_playerid][py_PLAYER_IN_CALL] = false;
			PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_STATE] = CALL_GAME_STATE_NONE;
			PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_PLAYERID] = INVALID_PLAYER_ID;
		}
		case CALL_STATE_ESTABLISHED:
		{
		    ShowPlayerMessage(to_playerid, "Llamada finalizada.", 2);
			PLAYER_TEMP[to_playerid][py_PLAYER_IN_CALL] = false;
			PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_STATE] = CALL_GAME_STATE_NONE;
			PLAYER_TEMP[to_playerid][py_PLAYER_PHONE_CALL_PLAYERID] = INVALID_PLAYER_ID;

			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
			SetPlayerSpecialAction(to_playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		}
	}

	PLAYER_TEMP[playerid][py_PLAYER_IN_CALL] = false;
	PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_STATE] = CALL_GAME_STATE_NONE;
	PLAYER_TEMP[playerid][py_PLAYER_PHONE_CALL_PLAYERID] = INVALID_PLAYER_ID;
	return 1;
}

convertPhoneNumber(playerid, number)
{
	new f_string[24], bool:exists;
	for(new i = 0; i != MAX_PHONE_CONTACTS; i ++)
	{
		if (!PLAYER_PHONE_BOOK[playerid][i][phone_book_contact_VALID]) continue;
		if (number == PLAYER_PHONE_BOOK[playerid][i][phone_book_contact_PHONE_NUMBER])
		{
			exists = true;
			format(f_string, sizeof f_string, "%s", PLAYER_PHONE_BOOK[playerid][i][phone_book_contact_NAME]);
			break;
		}
	}

	if (!exists) format(f_string, sizeof f_string, "%d", number);
	return f_string;
}

GetEmptyPlayerPhoneBookSlot(playerid)
{
	for(new i = 0; i != MAX_PHONE_CONTACTS; i ++)
	{
		if (!PLAYER_PHONE_BOOK[playerid][i][phone_book_contact_VALID]) return i;
	}
	return -1;
}

/*RegisterNewPlayerPocketObject(playerid, slot)
{
	new DBResult:Result, DB_Query[350];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PLAYER_POCKET`\
		(\
			`ID_USER`, `NAME`, `HUNGRY`, `THIRST`, `DRUNK`\
		)\
		VALUES\
		(\
			'%d', '%q', '%f', '%f', '%d'\
		);\
		SELECT MAX(`ID_OBJECT`) FROM `PLAYER_POCKET`;\
	",
		ACCOUNT_INFO[playerid][ac_ID], PLAYER_POCKET[playerid][slot][player_pocket_object_NAME], PLAYER_POCKET[playerid][slot][player_pocket_object_HUNGRY], PLAYER_POCKET[playerid][slot][player_pocket_object_THIRST], PLAYER_POCKET[playerid][slot][player_pocket_object_DRUNK]
	);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result)) PLAYER_POCKET[playerid][slot][player_pocket_object_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);
	return 1;
}*/

LoadPlayerPocketData(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[90];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_POCKET` WHERE `ID_USER` = '%d' LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], MAX_PLAYER_POCKET_OBJECTS);
	Result = db_query(Database, DB_Query);

	new index;
	for(new i; i < db_num_rows(Result); i++ )
	{
		if (index >= MAX_PLAYER_POCKET_OBJECTS)
		{
			printf("[debug]  Límite superado en array 'PP' al intentar cargar de la base de datos.");
			break;
		}

		PLAYER_POCKET[playerid][index][player_pocket_VALID] = true;

		PLAYER_POCKET[playerid][index][player_pocket_object_ID] = db_get_field_assoc_int(Result, "ID_OBJECT");
		db_get_field_assoc(Result, "NAME", PLAYER_POCKET[playerid][index][player_pocket_object_NAME], 24);
		PLAYER_POCKET[playerid][index][player_pocket_object_HUNGRY] = db_get_field_assoc_float(Result, "HUNGRY");
		PLAYER_POCKET[playerid][index][player_pocket_object_THIRST] = db_get_field_assoc_float(Result, "THIRST");
		PLAYER_POCKET[playerid][index][player_pocket_object_DRUNK] = db_get_field_assoc_int(Result, "DRUNK");

		index ++;
		db_next_row(Result);
	}
	db_free_result(Result);
	return 1;
}

TransferPlayerPocketObject(from_playerid, from_slot, to_playerid, to_slot)
{
	new DB_Query[130];
	format(DB_Query, sizeof(DB_Query), "UPDATE `PLAYER_POCKET` SET `ID_USER` = '%d' WHERE `ID_OBJECT` = '%d';", ACCOUNT_INFO[to_playerid][ac_ID], PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_ID]);
	db_free_result(db_query(Database, DB_Query));

	PLAYER_POCKET[to_playerid][to_slot][player_pocket_VALID] = true;
	PLAYER_POCKET[to_playerid][to_slot][player_pocket_object_ID] = PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_ID];
	format(PLAYER_POCKET[to_playerid][to_slot][player_pocket_object_NAME], 24, "%s", PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_NAME]);
	PLAYER_POCKET[to_playerid][to_slot][player_pocket_object_HUNGRY] = PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_HUNGRY];
	PLAYER_POCKET[to_playerid][to_slot][player_pocket_object_THIRST] = PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_THIRST];
	PLAYER_POCKET[to_playerid][to_slot][player_pocket_object_DRUNK] = PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_DRUNK];

	PLAYER_POCKET[from_playerid][from_slot][player_pocket_VALID] = false;
	PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_ID] = 0;
	format(PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_NAME], 24, "");
	PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_HUNGRY] = 0.0;
	PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_THIRST] = 0.0;
	PLAYER_POCKET[from_playerid][from_slot][player_pocket_object_DRUNK] = 0;
	return 1;
}

DeletePlayerPocketObject(playerid, slot)
{
	new DB_Query[140];
	format(DB_Query, sizeof DB_Query, "DELETE FROM `PLAYER_POCKET` WHERE `ID_OBJECT` = '%d' AND `ID_USER` = '%d';", PLAYER_POCKET[playerid][slot][player_pocket_object_ID], ACCOUNT_INFO[playerid][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	PLAYER_POCKET[playerid][slot][player_pocket_VALID] = false;
	PLAYER_POCKET[playerid][slot][player_pocket_object_ID] = 0;
	format(PLAYER_POCKET[playerid][slot][player_pocket_object_NAME], 24, "");
	PLAYER_POCKET[playerid][slot][player_pocket_object_HUNGRY] = 0.0;
	PLAYER_POCKET[playerid][slot][player_pocket_object_THIRST] = 0.0;
	PLAYER_POCKET[playerid][slot][player_pocket_object_DRUNK] = 0;
	return 1;
}

GetEmptyPlayerPocketSlot(playerid)
{
	for(new i = 0; i != MAX_PLAYER_POCKET_OBJECTS; i ++)
	{
		if (!PLAYER_POCKET[playerid][i][player_pocket_VALID]) return i;
	}
	return -1;
}

LoadPlayerGPSData(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[90];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_GPS` WHERE `ID_USER` = '%d' LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], MAX_PLAYER_GPS_SAVES);
	Result = db_query(Database, DB_Query);

	new index;
	for(new i; i < db_num_rows(Result); i++ )
	{
		if (index >= MAX_PLAYER_GPS_SAVES)
		{
			printf("[debug]  Límite superado en array 'P_GPS' al intentar cargar de la base de datos.");
			break;
		}

		PLAYER_GPS[playerid][index][player_gps_VALID] = true;

		PLAYER_GPS[playerid][index][player_gps_ID] = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "NAME", PLAYER_GPS[playerid][index][player_gps_NAME], 24);
		PLAYER_GPS[playerid][index][player_gps_X] = db_get_field_assoc_float(Result, "Cerrar");
		PLAYER_GPS[playerid][index][player_gps_Y] = db_get_field_assoc_float(Result, "Y");
		PLAYER_GPS[playerid][index][player_gps_Z] = db_get_field_assoc_float(Result, "Z");
		PLAYER_GPS[playerid][index][player_gps_WORLD] = db_get_field_assoc_int(Result, "WORLD");
		PLAYER_GPS[playerid][index][player_gps_INTERIOR] = db_get_field_assoc_int(Result, "INTERIOR");

		index ++;
		db_next_row(Result);
	}
	db_free_result(Result);
	return 1;
}

LoadPlayerToysData(playerid)
{
	if (ACCOUNT_INFO[playerid][ac_ID] == 0) return 0;

	new DBResult:Result, DB_Query[90];
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `PLAYER_TOYS` WHERE `ID_USER` = '%d' LIMIT %d;", ACCOUNT_INFO[playerid][ac_ID], MAX_PLAYER_ATTACHED_OBJECTS);
	Result = db_query(Database, DB_Query);

	new index;
	for(new i; i < db_num_rows(Result); i++ )
	{
		if (index >= MAX_PLAYER_ATTACHED_OBJECTS)
		{
			printf("[debug]  Límite superado en array 'PTOYS' al intentar cargar de la base de datos.");
			break;
		}

		PLAYER_TOYS[playerid][index][player_toy_VALID] = true;

		PLAYER_TOYS[playerid][index][player_toy_ID] = db_get_field_assoc_int(Result, "ID_TOY");
		db_get_field_assoc(Result, "NAME", PLAYER_TOYS[playerid][index][player_toy_NAME], 24);
		PLAYER_TOYS[playerid][index][player_toy_ATTACHED] = db_get_field_assoc_int(Result, "ATTACHED");
		PLAYER_TOYS[playerid][index][player_toy_MODELID] = db_get_field_assoc_int(Result, "MODELID");
		PLAYER_TOYS[playerid][index][player_toy_BONE] = db_get_field_assoc_int(Result, "BONE");
		PLAYER_TOYS[playerid][index][player_toy_OFFSET_X] = db_get_field_assoc_float(Result, "OFFSET_X");
		PLAYER_TOYS[playerid][index][player_toy_OFFSET_Y] = db_get_field_assoc_float(Result, "OFFSET_Y");
		PLAYER_TOYS[playerid][index][player_toy_OFFSET_Z] = db_get_field_assoc_float(Result, "OFFSET_Z");
		PLAYER_TOYS[playerid][index][player_toy_ROT_X] = db_get_field_assoc_float(Result, "ROT_X");
		PLAYER_TOYS[playerid][index][player_toy_ROT_Y] = db_get_field_assoc_float(Result, "ROT_Y");
		PLAYER_TOYS[playerid][index][player_toy_ROT_Z] = db_get_field_assoc_float(Result, "ROT_Z");
		PLAYER_TOYS[playerid][index][player_toy_SCALE_X] = db_get_field_assoc_float(Result, "SCALE_X");
		PLAYER_TOYS[playerid][index][player_toy_SCALE_Y] = db_get_field_assoc_float(Result, "SCALE_Y");
		PLAYER_TOYS[playerid][index][player_toy_SCALE_Z] = db_get_field_assoc_float(Result, "SCALE_Z");
		PLAYER_TOYS[playerid][index][player_toy_COLOR_1] = db_get_field_assoc_int(Result, "COLOR_1");
		PLAYER_TOYS[playerid][index][player_toy_COLOR_2] = db_get_field_assoc_int(Result, "COLOR_2");

		index ++;
		db_next_row(Result);
	}
	db_free_result(Result);
	return 1;
}

SavePlayerToysData(playerid)
{
  	if (!PLAYER_TEMP[playerid][py_USER_EXIT] || !PLAYER_TEMP[playerid][py_USER_LOGGED]) return 0;

  	for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++)
  	{
    	if (!PLAYER_TOYS[playerid][i][player_toy_VALID]) continue;

    	new DB_Query[900];
    	format(DB_Query, sizeof(DB_Query), "\
			UPDATE `PLAYER_TOYS` SET \
	   			`NAME` = '%q',\
	   			`ATTACHED` = '%d',\
	   			`MODELID` = '%d',\
			   	`BONE` = '%d',\
			   	`OFFSET_X` = '%f',\
			   	`OFFSET_Y` = '%f',\
			   	`OFFSET_Z` = '%f',\
			   	`ROT_X` = '%f',\
			   	`ROT_Y` = '%f',\
			   	`ROT_Z` = '%f',\
			   	`SCALE_X` = '%f',\
			   	`SCALE_Y` = '%f',\
			   	`SCALE_Z` = '%f',\
			   	`COLOR_1` = '%d',\
			   	`COLOR_2` = '%d' \
	 		WHERE `ID_TOY` = '%d';\
    	",
	 		PLAYER_TOYS[playerid][i][player_toy_NAME], PLAYER_TOYS[playerid][i][player_toy_ATTACHED],
	 		PLAYER_TOYS[playerid][i][player_toy_MODELID], PLAYER_TOYS[playerid][i][player_toy_BONE],
	 		PLAYER_TOYS[playerid][i][player_toy_OFFSET_X], PLAYER_TOYS[playerid][i][player_toy_OFFSET_Y], PLAYER_TOYS[playerid][i][player_toy_OFFSET_Z],
	 		PLAYER_TOYS[playerid][i][player_toy_ROT_X], PLAYER_TOYS[playerid][i][player_toy_ROT_Y], PLAYER_TOYS[playerid][i][player_toy_ROT_Z],
	 		PLAYER_TOYS[playerid][i][player_toy_SCALE_X], PLAYER_TOYS[playerid][i][player_toy_SCALE_Y], PLAYER_TOYS[playerid][i][player_toy_SCALE_Z],
	 		PLAYER_TOYS[playerid][i][player_toy_COLOR_1], PLAYER_TOYS[playerid][i][player_toy_COLOR_2],
	 		PLAYER_TOYS[playerid][i][player_toy_ID]
    	);
    	db_free_result(db_query(Database, DB_Query));
  	}
  	return 1;
}

GetEmptyPlayerToySlot(playerid)
{
	for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; ++i)
	{
		if (!PLAYER_TOYS[playerid][i][player_toy_VALID]) return i;
	}
	return -1;
}

GetOwnerIntProperty(id_house)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (CHARACTER_INFO[i][ch_STATE] == ROLEPLAY_STATE_OWN_PROPERTY)
			{
				if (CHARACTER_INFO[i][ch_INTERIOR_EXTRA] == id_house)
				{
					return i;
				}
			}
		}
	}
	return -1;
}

RegisterNewPlayerToy(playerid, slot)
{
	new DBResult:Result, DB_Query[800];
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `PLAYER_TOYS`\
		(\
			`ID_USER`, `NAME`, `ATTACHED`, `MODELID`, `BONE`, `OFFSET_X`, `OFFSET_Y`, `OFFSET_Z`, `ROT_X`, `ROT_Y`, `ROT_Z`, `SCALE_X`, `SCALE_Y`, `SCALE_Z`, `COLOR_1`, `COLOR_2`\
		)\
		VALUES\
		(\
			'%d', '%q', '%d', '%d', '%d', '%f', '%f', '%f', '%f', '%f', '%f', '%f', '%f', '%f', '%d', '%d'\
		);\
		SELECT MAX(`ID_TOY`) FROM `PLAYER_TOYS`;\
	",
		ACCOUNT_INFO[playerid][ac_ID],
		PLAYER_TOYS[playerid][slot][player_toy_NAME], PLAYER_TOYS[playerid][slot][player_toy_ATTACHED], PLAYER_TOYS[playerid][slot][player_toy_MODELID], PLAYER_TOYS[playerid][slot][player_toy_BONE],
		PLAYER_TOYS[playerid][slot][player_toy_OFFSET_X], PLAYER_TOYS[playerid][slot][player_toy_OFFSET_Y], PLAYER_TOYS[playerid][slot][player_toy_OFFSET_Z],
		PLAYER_TOYS[playerid][slot][player_toy_ROT_X], PLAYER_TOYS[playerid][slot][player_toy_ROT_Y], PLAYER_TOYS[playerid][slot][player_toy_ROT_Z],
		PLAYER_TOYS[playerid][slot][player_toy_SCALE_X], PLAYER_TOYS[playerid][slot][player_toy_SCALE_Y], PLAYER_TOYS[playerid][slot][player_toy_SCALE_Z],
		PLAYER_TOYS[playerid][slot][player_toy_COLOR_1], PLAYER_TOYS[playerid][slot][player_toy_COLOR_2]
	);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result)) PLAYER_TOYS[playerid][slot][player_toy_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);
	return 1;
}

ShowTuningMenu(playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if (vehicleid == INVALID_VEHICLE_ID) return 1;

	HidePlayerMenu(playerid);

	ShowPlayerMenu(playerid, MECHANICTUNING, "Tuning");
	AddPlayerMenuItem(playerid, TextToSpanish("Reparación"), "Precio: 350$");
	AddPlayerMenuItem(playerid, "Colores");
	AddPlayerMenuItem(playerid, "Paintjob");
	AddPlayerMenuItem(playerid, "Objetos");
	AddPlayerMenuItem(playerid, "Eliminar componentes");

	new DBResult:Result, DB_Query[255];
	format(DB_Query, sizeof DB_Query, "SELECT `COMPONENTS_INFO`.`PART`, `COMPONENTS_INFO`.`PIECES` FROM `COMPONENTS_INFO`, `VEHICLE_COMPONENTS` WHERE `VEHICLE_COMPONENTS`.`MODELID` = '%d' AND `VEHICLE_COMPONENTS`.`COMPONENT_ID` = `COMPONENTS_INFO`.`ID` GROUP BY `COMPONENTS_INFO`.`PART`;", GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result) == 0)
	{
		printf("[ERROR] No hay componentes asignados en la base de datos");
	}
	else
	{
		new line_str[80];

		for(new i; i < db_num_rows(Result); i++ )
		{
			if (i >= TOTAL_TUNING_PARTS)
			{
				printf("[debug]  Límite superado en array 'PLAYER_TUNING_MENU, dialog Parts' al intentar cargar de la base de datos.");
				break;
			}

			db_get_field_assoc(Result, "PART", PLAYER_TUNING_MENU[playerid][i][tuning_menu_NAME], 24);
			format(line_str, sizeof line_str, "%s", PLAYER_TUNING_MENU[playerid][i][tuning_menu_NAME]);
			
			AddPlayerMenuItem(playerid, TextToSpanish(line_str), "Precio: 50$");

			db_next_row(Result);
		}
	}
	db_free_result(Result);
	return 1;
}

ShowObjTuning(playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if (vehicleid == INVALID_VEHICLE_ID) return 1;
			
    if (!PLAYER_VEHICLES[vehicleid][player_vehicle_VALID]) return ShowPlayerMessage(playerid, "~r~Solo puedes tunear tus vehículos personales.", 3);
	if (!VEHICLE_INFO[GLOBAL_VEHICLES[vehicleid][gb_vehicle_MODELID] - 400][vehicle_info_VALID]) return ShowPlayerMessage(playerid, "~r~Este vehículo no se puede tunear.", 3);

	HidePlayerMenu(playerid);

	PLAYER_TEMP[playerid][py_IN_TUNING_GARAGE] = true;
	PLAYER_TEMP[playerid][py_TUNING_GARAGE_VEHICLEID] = vehicleid;

	ShowPlayerMenu(playerid, OBJTUNINGMENU, "Objetos");
	AddPlayerMenuItem(playerid, "Mis objetos");
	AddPlayerMenuItem(playerid, "Comprar objetos");
	AddPlayerMenuItem(playerid, "Bandera", "Precio: 2.000$");
	return 1;
}

BuyProperty(playerid, id)
{
	if (BANK_ACCOUNT[playerid][bank_account_ID] == 0) return ShowPlayerMessage(playerid, "~r~No puedes comprar una propiedad sin cuenta bancaria.", 3);

	new DBResult:Result, DB_Query[120], player_properties;
	format(DB_Query, sizeof(DB_Query), "SELECT COUNT(`ID_USER`) AS `PROPERTIES` FROM `PROPERTY_OWNER` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);
	if (db_num_rows(Result)) player_properties = db_get_field_assoc_int(Result, "PROPERTIES");
	db_free_result(Result);

	if (ACCOUNT_INFO[playerid][ac_SU])
	{
		if (player_properties >= MAX_SU_PROPERTIES) return ShowPlayerMessage(playerid, "~r~No puedes comprar más propiedades.", 3);
	}
	else if (player_properties >= MAX_NU_PROPERTIES) return ShowPlayerMessage(playerid, "~r~No puedes comprar más propiedades.", 3);

	new index = GetPropertyIndexByID(id);
	if (index == -1) return ShowPlayerMessage(playerid, "~r~Error al intentar comprar la propiedad, intenta luego.", 3);

	if (PROPERTY_INFO[index][property_SOLD]) return 1;
	if (PROPERTY_INFO[index][property_LEVEL] > ACCOUNT_INFO[playerid][ac_LEVEL]) return ShowPlayerMessage(playerid, "~r~No tienes el nivel suficiente.", 3);
	if (PROPERTY_INFO[index][property_VIP_LEVEL] > ACCOUNT_INFO[playerid][ac_SU]) return ShowPlayerMessage(playerid, "~r~No tienes VIP.", 3);
	if (PROPERTY_INFO[index][property_EXTRA] > ACCOUNT_INFO[playerid][ac_SD]) return ShowPlayerMessage(playerid, "~r~No tienes las hycoins suficientes.", 3);
	if (BANK_ACCOUNT[playerid][bank_account_BALANCE] >= PROPERTY_INFO[index][property_PRICE])
	{
		PLAYER_TEMP[playerid][py_BUY_HOUSE_INDEX] = index;
		ShowDialog(playerid, DIALOG_CONFIRM_BUY_PROPERTY);
	}
	else ShowPlayerMessage(playerid, "~r~No tienes el dinero suficiente.", 3);
	return 1;
}

CheckAndBuyProperty(playerid)
{
	if (PLAYER_TEMP[playerid][py_ACTUAL_PROPERTY] > 0) BuyProperty(playerid, PLAYER_TEMP[playerid][py_ACTUAL_PROPERTY]);
}

ShowPropertyMenu(playerid)
{
	new caption[40];
	format(caption, sizeof caption, "%s", PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_NAME]);

	ShowPlayerMenu(playerid, PROPERTY_MENU, TextToSpanish(caption));

	AddPlayerMenuItem(playerid, "Cambiar nombre");
	AddPlayerMenuItem(playerid, "Echar a todos");
	AddPlayerMenuItem(playerid, "Personalizar");
	AddPlayerMenuItem(playerid, "Sacar items");
	AddPlayerMenuItem(playerid, "Meter items");

	PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	return 1;
}

ShowFurnitureMenu(playerid)
{
	ShowPlayerMenu(playerid, PROPERTY_FURNITURE, "Personalizar");

	AddPlayerMenuItem(playerid, "Mis muebles");
	AddPlayerMenuItem(playerid, "Camas");
	AddPlayerMenuItem(playerid, "Cuadros");
	AddPlayerMenuItem(playerid, TextToSpanish("Decoración"));
	AddPlayerMenuItem(playerid, TextToSpanish("Electrodomésticos"));
	AddPlayerMenuItem(playerid, TextToSpanish("Iluminación"));
	AddPlayerMenuItem(playerid, "Mesas");
	AddPlayerMenuItem(playerid, "Sillas");

	PlayerPlaySound(playerid, 17803, 0.0, 0.0, 0.0);
	return 1;
}

ShowPropertyOptions(playerid)
{
    if (PLAYER_TEMP[playerid][py_LAST_PICKUP_ID] == 0) return 0;

    new info[3];
    Streamer_GetArrayData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_EXTRA_ID, info);
    if (info[0] != PICKUP_TYPE_PROPERTY) return 0;

    new Float:x, Float:y, Float:z;
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_X, x);
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Y, y);
    Streamer_GetFloatData(STREAMER_TYPE_PICKUP, PLAYER_TEMP[playerid][py_LAST_PICKUP_ID], E_STREAMER_Z, z);

    if (!IsPlayerInRangeOfPoint(playerid, 80.0, x, y, z)) return 0;

    if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_OWN_PROPERTY)
    {
        if (info[2] == 1) // Está en el Pickup Interior
        {
            if (PROPERTY_INFO[info[1]][property_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID])
            {
            	if (!PLAYER_TEMP[playerid][py_EDITING_MODE])
            	{
                	PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] = info[1];
                	ShowPropertyMenu(playerid);
                }
            }
            else return 0;
        }
        else return 0;
    }
    else if (CHARACTER_INFO[playerid][ch_STATE] == ROLEPLAY_STATE_GUEST_PROPERTY)
    {
        if (info[2] == 1) // Está en el Pickup Interior
        {
            if (PROPERTY_INFO[info[1]][property_CREW])
            {
                if (PROPERTY_INFO[info[1]][property_CREW_ID] != PLAYER_CREW[playerid][player_crew_ID]) return ShowPlayerMessage(playerid, "~r~Esta no es una propiedad de tu crew.", 3);
                if (!CREW_RANK_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][ PLAYER_CREW[playerid][player_crew_RANK] ][crew_rank_PERMISSION][CREW_RANK_DELETE_PROPERTIES]) return ShowPlayerMessage(playerid, "~r~No tienes permisos.", 2);
                if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_FIGHTING]) return ShowPlayerMessage(playerid, "~r~No puedes liberar esta propiedad mientras tu crew está en combate.", 3);

                PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] = info[1];
                ShowDialog(playerid, DIALOG_CREW_LEAVE_PROPERTY);
            }
            else return 0;
        }
        else return 0;
    }
    else return 0;
    return 1;
}