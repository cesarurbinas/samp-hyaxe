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
	{-1, "GNR", INTERIOR_CLUB, -1, false, 264, 5, 1267.663208, -781.323242, 1091.906250, 180.0, -1, false, 0, 0, 1132.5565, -2034.1417, 69.1477, 180.0, 0, 0, -1, -1, Text3D:INVALID_3DTEXT_ID, Text3D:INVALID_3DTEXT_ID, -1, -1},
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
                    if (PROPERTY_INFO[info[1]][property_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID] || IsPlayerInPropertyKeys(PROPERTY_INFO[info[1]][property_ID], ACCOUNT_INFO[playerid][ac_ID]))
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

ResetPlayerWeaponsEx(playerid)
{
	new tmp_PLAYER_WEAPONS[enum_PLAYER_WEAPONS];
	for(new i = 0; i != 13; i ++) PLAYER_WEAPONS[playerid][i] = tmp_PLAYER_WEAPONS;

	ResetPlayerWeapons(playerid);
	ResetItemBody(playerid);
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

    // RESETIAR ARMAS AKI
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
    TogglePlayerControllableEx(playerid, false);
    SetPlayerPoliceSearchLevel(playerid, 0);
    SendPoliceMark(playerid, PLAYER_COLOR);
    SetPlayerColorEx(playerid, PLAYER_COLOR);
    return 1;
}

IsPlayerPaused(playerid)
{
	if (playerid == 65535)
	{
		print("Paused");
		return false;
	}
	if (IsPlayerNPC(playerid)) return false;
	return (GetTickCount() - g_iPlayerLastUpdate[playerid] > 2000);
}

stock GetWeaponSlot(weaponid) 
{ 
    switch(weaponid) 
    { 
        case 0..1:   return 0;
        case 2..9:   return 1;
        case 22..24: return 2;
        case 25..27: return 3;
        case 28..29: return 4;
        case 32:     return 4;
        case 30..31: return 5;
        case 33..34: return 6;
        case 35..38: return 7;
        case 16..18: return 8;
        case 39:     return 8;
        case 41..43: return 9;
        case 10..15: return 10;
        case 44..46: return 11;
        case 40:     return 12;
    } 
    return 0; //Prevent problems
}

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

			PLAYER_TEMP[playerid][py_FISHS] ++;

			format(str_text, sizeof(str_text), "Bien hecho, has tomado %s~w~. Ahora~n~tienes ~r~%d~w~ peces.", RandomFishName(), PLAYER_TEMP[playerid][py_FISHS]);

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

		if (tele) AttachObjectToPlayer(PLAYER_TEMP[playerid][py_FP_OBJ], playerid, 0.0, 0.100, 0.3, 0.0, 0.0, 0.0);
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
	format(str_text, sizeof(str_text), "51.222.21.190:9991/proxycheck/%s,%s", PLAYER_TEMP[playerid][py_IP], PLAYER_TEMP[playerid][py_NAME]);
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
			Anticheat_Kick(index, "Proxy/VPN");
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
	
	new
		temp_id[80],
		temp_number
	;  
	gpci(playerid, temp_id, sizeof(temp_id));  
	
	for(new i = 0; i < strlen(temp_id); i++)  
	{  
		if (temp_id[i] >= '0' && temp_id[i] <= '9')
			temp_number ++;  
	}  
	return (temp_number >= 30 || strlen(temp_id) <= 30) ? true : false;
}

GetDatabaseUserName(db_id)
{
	new
		DBResult:Result,
		DB_Query[128],
		name[25]
	;

	format(DB_Query, sizeof(DB_Query), "SELECT `NAME` FROM `ACCOUNTS` WHERE `ID` = %d LIMIT 1;", db_id);
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
	HTTP(0, HTTP_POST, "51.222.21.190:9991/send_email", payload, "response_SendEmail");
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
	if (PLAYER_WORKS[playerid][WORK_SINDACCO]) return true;
	return false;
}

GetPlayerMafia(playerid)
{
	if (PLAYER_WORKS[playerid][WORK_MAFIA]) return WORK_MAFIA;
	if (PLAYER_WORKS[playerid][WORK_ENEMY_MAFIA]) return WORK_ENEMY_MAFIA;
	if (PLAYER_WORKS[playerid][WORK_OSBORN]) return WORK_OSBORN;
	if (PLAYER_WORKS[playerid][WORK_CONNOR]) return WORK_CONNOR;
	if (PLAYER_WORKS[playerid][WORK_DIVISO]) return WORK_DIVISO;
	if (PLAYER_WORKS[playerid][WORK_SINDACCO]) return WORK_SINDACCO;
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
		case WORK_DIVISO: color = 0xE55B5BFF;
		case WORK_SINDACCO: color = 0xFFFFFFFF;
	}
	return color;
}

/*ValidSurfingVehicle(modelid)
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
}*/

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
	format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `SD` = '%d', `SU` = '%d', `SU_EXPIRE_DATE` = DATETIME('NOW', '+%d day') WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_SD], ACCOUNT_INFO[playerid][ac_SU], days, ACCOUNT_INFO[playerid][ac_ID]);
	db_free_result(db_query(Database, DB_Query));

	format(DB_Query, sizeof DB_Query, "SELECT `SU_EXPIRE_DATE` FROM `ACCOUNTS` WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
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
	format(str_text, sizeof(str_text), "Pulsa la tecla ~r~%s~w~ para interactuar.", key);

	DestroyNotification(playerid, PLAYER_TEMP[playerid][py_KEY_NOT]);
	PLAYER_TEMP[playerid][py_KEY_NOT] = ShowPlayerNotification(playerid, str_text, 2);
	return 1;
}

GetMentalState(playerid)
{

	new 
		name[128],
		value = PLAYER_MISC[playerid][MISC_MENTAL_STATE]
	;

	if (value < 10)
		format(name, sizeof(name), ""COL_GREEN"Saludable"COL_WHITE"");

	if (value >= 10)
		format(name, sizeof(name), ""COL_GREEN"Casi saludable"COL_WHITE"");
	
	if (value >= 20)
		format(name, sizeof(name), ""COL_GREEN"Poco saludable"COL_WHITE"");

	if (value >= 30)
		format(name, sizeof(name), ""COL_GREEN"Fuera de casillas"COL_WHITE"");

	if (value >= 50)
		format(name, sizeof(name), ""COL_GREEN"Sin tornillos"COL_WHITE"");

	if (value >= 80)
		format(name, sizeof(name), ""COL_GREEN"Sin remate"COL_WHITE"");

	if (value >= 100)
		format(name, sizeof(name), ""COL_GREEN"Inestable"COL_WHITE"");

	if (value >= 150)
		format(name, sizeof(name), ""COL_GREEN"Sin control"COL_WHITE"");

	if (value >= 200)
		format(name, sizeof(name), ""COL_GREEN"Psicópata"COL_WHITE"");
	
	return name;
}

AddMentalState(playerid, points)
{
	PLAYER_MISC[playerid][MISC_MENTAL_STATE] += points;
	SavePlayerMisc(playerid);

	// Check state
	switch(PLAYER_MISC[playerid][MISC_MENTAL_STATE])
	{
		case 10: ShowPlayerNotification(playerid, "Tu salud mental ahora es: ~r~Casi saludable", 8);
		case 20: ShowPlayerNotification(playerid, "Tu salud mental ahora es: ~r~Poco saludable", 8);
		case 30: ShowPlayerNotification(playerid, "Tu salud mental ahora es: ~r~Fuera de casillas", 8);
		case 50: ShowPlayerNotification(playerid, "Tu salud mental ahora es: ~r~Sin tornillos", 8);
		case 80: ShowPlayerNotification(playerid, "Tu salud mental ahora es: ~r~Sin remate", 8);
		case 100: ShowPlayerNotification(playerid, "Tu salud mental ahora es: ~r~Inestable", 8);
		case 150: ShowPlayerNotification(playerid, "Tu salud mental ahora es: ~r~Sin control", 8);
		case 200: ShowPlayerNotification(playerid, "Tu salud mental ahora es: ~r~Psicópata", 8);
	}
	return 1;
}

ReduceMentalState(playerid, points)
{
	PLAYER_MISC[playerid][MISC_MENTAL_STATE] -= points;
	if (PLAYER_MISC[playerid][MISC_MENTAL_STATE] < 0)
		PLAYER_MISC[playerid][MISC_MENTAL_STATE] = 0;
	
	SavePlayerMisc(playerid);
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
	format(DB_Query, sizeof DB_Query, "SELECT `ID` FROM `ACCOUNTS` WHERE `ID` = '%d' AND DATETIME('NOW') >= `SU_EXPIRE_DATE`;", ACCOUNT_INFO[playerid][ac_ID]);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result))
	{
		expired = true;
		format(DB_Query, sizeof DB_Query, "UPDATE `ACCOUNTS` SET `SU` = 0, `SU_EXPIRE_DATE` = '0' WHERE `ID` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
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

	SendClientMessageEx(playerid, 0xE55B5BFF, "[GNR] "COL_WHITE" %s ahora es de la mafia.", PLAYER_TEMP[to_player][py_RP_NAME]);
	ShowPlayerMessage(to_player, "~y~Ahora eres mafioso.", 3);
	return 1;
}

InviteToSindacco(playerid, to_player)
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

	PLAYER_WORKS[to_player][WORK_SINDACCO] = true;
	PLAYER_SKILLS[to_player][WORK_SINDACCO] = 1;
	SavePlayerWorks(to_player);
	SavePlayerSkills(to_player);

	SendClientMessageEx(playerid, 0xE55B5BFF, "[SNC] "COL_WHITE" %s ahora es de la mafia.", PLAYER_TEMP[to_player][py_RP_NAME]);
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

	SubtractItem(medic, 0);
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

SendSindaccoMafiaMessage(color, const message[])
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_WORKS[i][WORK_SINDACCO])
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
	printf("[kick] playerid: %d, time: %d", playerid, time);
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
	PLAYER_AC_INFO[playerid][CHEAT_HIGH_POS][p_ac_info_IMMUNITY] = gettime() + 3;
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
		"COL_WHITE"  Estado social: %s\n\
		"COL_WHITE"  Salud mental: %s",

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
			GetAccountStatusName(playerid),
			GetMentalState(playerid)
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
	    //if (ACCOUNT_INFO[playerid][ac_LEVEL] < 2) return ShowPlayerMessage(playerid, "~r~Tienes que ser nivel 2.", 3);
	    if (ACCOUNT_INFO[playerid][ac_LEVEL] < 1) return ShowPlayerMessage(playerid, "~r~Tienes que ser nivel 1.", 3);
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
		if (PLAYER_TEMP[playerid][py_FISHS])
		{
			ShowDialog(playerid, DIALOG_SELL_FISH);
		}
		else ShowPlayerMessage(playerid, "~r~No tienes peces que vender.", 3);
	}
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
	//SetPlayerFakePing(playerid, minrand(170, 345));

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

/*Bot(playerid)
{
	KillTimer(PLAYER_TEMP[playerid][py_TIMERS][37]);

	SetPlayerColorEx(playerid, PLAYER_COLOR);
	SetPlayerScore(playerid, minrand(1, 7));

	//TogglePlayerFakePing(playerid, true);
    //SetPlayerFakePing(playerid, minrand(170, 345));

	new name[MAX_PLAYER_NAME];
	format(name, sizeof(name), "%s_%s", names[random(sizeof(names))], surnames[random(sizeof(surnames))]);
	SetPlayerName(playerid, name);
	PLAYER_TEMP[playerid][py_NAME] = name;

	PLAYER_TEMP[playerid][py_TIMERS][37] = SetTimerEx("UpdateBotPing", 30000, true, "i", playerid);
	PLAYER_TEMP[playerid][py_TIMERS][38] = SetTimerEx("UpdateBotName", 900000 + minrand(60000, 420000), true, "i", playerid);
	return 1;
}*/

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

ShowBurgerMenu(playerid)
{
	HidePlayerMenu(playerid);

	ShowPlayerMenu(playerid, MENU_BURGER, "Burger Shot");
	AddPlayerMenuItem(playerid, TextToSpanish("Hamburguesa"), "Precio: ~g~300$");
	AddPlayerMenuItem(playerid, TextToSpanish("Jamon"), "Precio: ~g~200$");
	AddPlayerMenuItem(playerid, TextToSpanish("Jugo de naranja"), "Precio: ~g~70$");
	AddPlayerMenuItem(playerid, TextToSpanish("Jugo de manzana"), "Precio: ~g~70$");
	AddPlayerMenuItem(playerid, TextToSpanish("Wisky"), "Precio: ~g~500$");
	AddPlayerMenuItem(playerid, TextToSpanish("Cerveza artesanal"), "Precio: ~g~100$");
	AddPlayerMenuItem(playerid, TextToSpanish("Helado de chocolate"), "Precio: ~g~100$");
	AddPlayerMenuItem(playerid, TextToSpanish("Helado de frutilla"), "Precio: ~g~100$");
	return 1;
}

Menu:MENU_BURGER(playerid, response, listitem)
{
    if (response == MENU_RESPONSE_SELECT)
    {
		if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno", 4);

		switch(listitem)
		{
			case 0:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 300)
				{
					GivePlayerCash(playerid, -300);
					AddPlayerItem(playerid, 49);
					ShowPlayerNotification(playerid, "Compraste una hamburguesa.", 3);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 1:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 200)
				{
					GivePlayerCash(playerid, -200);
					AddPlayerItem(playerid, 52);
					ShowPlayerNotification(playerid, "Compraste un jamon.", 3);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 2:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 70)
				{
					AddPlayerItem(playerid, 56);
					ShowPlayerNotification(playerid, "Compraste un jugo de naranja.", 3);
					GivePlayerCash(playerid, -70);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 3:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 70)
				{
					AddPlayerItem(playerid, 57);
					ShowPlayerNotification(playerid, "Compraste un jugo de manzana.", 3);
					GivePlayerCash(playerid, -70);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 4:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 500)
				{
					AddPlayerItem(playerid, 64);
					ShowPlayerNotification(playerid, "Compraste un wisky.", 3);
					GivePlayerCash(playerid, -500);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 5:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 100)
				{
					AddPlayerItem(playerid, 66);
					ShowPlayerNotification(playerid, "Compraste una cerveza artesanal.", 3);
					GivePlayerCash(playerid, -100);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 6:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 100)
				{
					AddPlayerItem(playerid, 59);
					ShowPlayerNotification(playerid, "Compraste un helado de chocolate.", 3);
					GivePlayerCash(playerid, -100);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 7:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 100)
				{
					AddPlayerItem(playerid, 60);
					ShowPlayerNotification(playerid, "Compraste un helado de chocolate.", 3);
					GivePlayerCash(playerid, -100);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
		}
	}
	return 1;
}

ShowPizzaMenu(playerid)
{
	HidePlayerMenu(playerid);

	ShowPlayerMenu(playerid, MENU_PIZZA, "Stacked pizza");
	AddPlayerMenuItem(playerid, TextToSpanish("Pizza"), "Precio: ~g~300$");
	AddPlayerMenuItem(playerid, TextToSpanish("Jamon"), "Precio: ~g~200$");
	AddPlayerMenuItem(playerid, TextToSpanish("Jugo de naranja"), "Precio: ~g~70$");
	AddPlayerMenuItem(playerid, TextToSpanish("Jugo de manzana"), "Precio: ~g~70$");
	AddPlayerMenuItem(playerid, TextToSpanish("Champagne"), "Precio: ~g~500$");
	AddPlayerMenuItem(playerid, TextToSpanish("Cerveza artesanal"), "Precio: ~g~100$");
	AddPlayerMenuItem(playerid, TextToSpanish("Helado de chocolate"), "Precio: ~g~100$");
	AddPlayerMenuItem(playerid, TextToSpanish("Helado de frutilla"), "Precio: ~g~100$");
	return 1;
}

Menu:MENU_PIZZA(playerid, response, listitem)
{
    if (response == MENU_RESPONSE_SELECT)
    {
		if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno", 4);

		switch(listitem)
		{
			case 0:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 300)
				{
					GivePlayerCash(playerid, -300);
					AddPlayerItem(playerid, 61);
					ShowPlayerNotification(playerid, "Compraste una pizza.", 3);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 1:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 200)
				{
					GivePlayerCash(playerid, -200);
					AddPlayerItem(playerid, 52);
					ShowPlayerNotification(playerid, "Compraste un jamon.", 3);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 2:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 70)
				{
					AddPlayerItem(playerid, 56);
					ShowPlayerNotification(playerid, "Compraste un jugo de naranja.", 3);
					GivePlayerCash(playerid, -70);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 3:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 70)
				{
					AddPlayerItem(playerid, 57);
					ShowPlayerNotification(playerid, "Compraste un jugo de manzana.", 3);
					GivePlayerCash(playerid, -70);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 4:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 500)
				{
					AddPlayerItem(playerid, 65);
					ShowPlayerNotification(playerid, "Compraste un champagne.", 3);
					GivePlayerCash(playerid, -500);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 5:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 100)
				{
					AddPlayerItem(playerid, 66);
					ShowPlayerNotification(playerid, "Compraste una cerveza artesanal.", 3);
					GivePlayerCash(playerid, -100);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 6:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 100)
				{
					AddPlayerItem(playerid, 59);
					ShowPlayerNotification(playerid, "Compraste un helado de chocolate.", 3);
					GivePlayerCash(playerid, -100);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 7:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 100)
				{
					AddPlayerItem(playerid, 60);
					ShowPlayerNotification(playerid, "Compraste un helado de chocolate.", 3);
					GivePlayerCash(playerid, -100);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
		}
	}
	return 1;
}

ShowClukinMenu(playerid)
{
	HidePlayerMenu(playerid);

	ShowPlayerMenu(playerid, MENU_CLUKIN, "Clukin Bell");
	AddPlayerMenuItem(playerid, TextToSpanish("Pollo"), "Precio: ~g~300$");
	AddPlayerMenuItem(playerid, TextToSpanish("Burrito"), "Precio: ~g~200$");
	AddPlayerMenuItem(playerid, TextToSpanish("Jugo de naranja"), "Precio: ~g~70$");
	AddPlayerMenuItem(playerid, TextToSpanish("Jugo de manzana"), "Precio: ~g~70$");
	AddPlayerMenuItem(playerid, TextToSpanish("Jugo cepita"), "Precio: ~g~70$");
	AddPlayerMenuItem(playerid, TextToSpanish("Cerveza"), "Precio: ~g~80$");
	AddPlayerMenuItem(playerid, TextToSpanish("Helado de chocolate"), "Precio: ~g~100$");
	AddPlayerMenuItem(playerid, TextToSpanish("Helado de frutilla"), "Precio: ~g~100$");
	return 1;
}

Menu:MENU_CLUKIN(playerid, response, listitem)
{
    if (response == MENU_RESPONSE_SELECT)
    {
		if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno", 4);

		switch(listitem)
		{
			case 0:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 300)
				{
					GivePlayerCash(playerid, -300);
					AddPlayerItem(playerid, 67);
					ShowPlayerNotification(playerid, "Compraste un sanguche de pollo.", 3);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 1:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 200)
				{
					GivePlayerCash(playerid, -200);
					AddPlayerItem(playerid, 50);
					ShowPlayerNotification(playerid, "Compraste un burrito.", 3);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 2:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 70)
				{
					AddPlayerItem(playerid, 56);
					ShowPlayerNotification(playerid, "Compraste un jugo de naranja.", 3);
					GivePlayerCash(playerid, -70);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 3:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 70)
				{
					AddPlayerItem(playerid, 57);
					ShowPlayerNotification(playerid, "Compraste un jugo de manzana.", 3);
					GivePlayerCash(playerid, -70);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 4:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 70)
				{
					AddPlayerItem(playerid, 62);
					ShowPlayerNotification(playerid, "Compraste un jugo cepita.", 3);
					GivePlayerCash(playerid, -70);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 5:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 80)
				{
					AddPlayerItem(playerid, 63);
					ShowPlayerNotification(playerid, "Compraste una cerveza.", 3);
					GivePlayerCash(playerid, -80);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 6:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 100)
				{
					AddPlayerItem(playerid, 59);
					ShowPlayerNotification(playerid, "Compraste un helado de chocolate.", 3);
					GivePlayerCash(playerid, -100);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			case 7:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 100)
				{
					AddPlayerItem(playerid, 60);
					ShowPlayerNotification(playerid, "Compraste un helado de chocolate.", 3);
					GivePlayerCash(playerid, -100);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
		}
	}
	return 1;
}

Show247Menu(playerid)
{
	HidePlayerMenu(playerid);

	ShowPlayerMenu(playerid, MENU_247, "24/7");
	AddPlayerMenuItem(playerid, TextToSpanish("Guía telefónica"), "Precio: ~g~500$");
	AddPlayerMenuItem(playerid, TextToSpanish("GPS"), "Precio: ~g~500$");
	AddPlayerMenuItem(playerid, TextToSpanish("Tostada"), "Precio: ~g~10$");
	AddPlayerMenuItem(playerid, TextToSpanish("Jugo de naranja"), "Precio: ~g~70$");
	AddPlayerMenuItem(playerid, TextToSpanish("Jugo de manzana"), "Precio: ~g~70$");
	AddPlayerMenuItem(playerid, TextToSpanish("Leche"), "Precio: ~g~70$");
	AddPlayerMenuItem(playerid, TextToSpanish("Naranja"), "Precio: ~g~10$");
	AddPlayerMenuItem(playerid, TextToSpanish("Café"), "Precio: ~g~20$");
	return 1;
}

Menu:MENU_247(playerid, response, listitem)
{
    if (response == MENU_RESPONSE_SELECT)
    {
		if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno", 4);

		switch(listitem)
		{
			case 0:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 500)
				{
					if (PLAYER_OBJECT[playerid][po_PHONE_RESOLVER])
					{
						ShowPlayerMessage(playerid, "~r~Ya tienes una guía telefónica.", 2);
						PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
						return 1;
					}

					GivePlayerCash(playerid, -500);

					PLAYER_OBJECT[playerid][po_PHONE_RESOLVER] = true;
					ShowPlayerNotification(playerid, "Compraste una guía telefónica.", 3);
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}

			case 1:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 500)
				{
					if (PLAYER_OBJECT[playerid][po_GPS])
					{
						ShowPlayerMessage(playerid, "~r~Ya tienes un GPS", 2);
						PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
						return 1;
					}

					GivePlayerCash(playerid, -500);

					PLAYER_OBJECT[playerid][po_GPS] = true;
					ShowPlayerNotification(playerid, "Compraste un GPS.", 3);
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}

			case 2:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 10)
				{
					AddPlayerItem(playerid, 54);
					ShowPlayerNotification(playerid, "Compraste una tostada.", 3);
					GivePlayerCash(playerid, -10);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}

			case 3:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 70)
				{
					AddPlayerItem(playerid, 56);
					ShowPlayerNotification(playerid, "Compraste un jugo de naranja.", 3);
					GivePlayerCash(playerid, -70);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}

			case 4:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 70)
				{
					AddPlayerItem(playerid, 57);
					ShowPlayerNotification(playerid, "Compraste un jugo de manzana.", 3);
					GivePlayerCash(playerid, -70);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}

			case 5:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 70)
				{
					AddPlayerItem(playerid, 55);
					ShowPlayerNotification(playerid, "Compraste una caja de leche.", 3);
					GivePlayerCash(playerid, -70);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}

			case 6:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 10)
				{
					AddPlayerItem(playerid, 53);
					ShowPlayerNotification(playerid, "Compraste una naranja.", 3);
					GivePlayerCash(playerid, -10);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}

			case 7:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 20)
				{
					AddPlayerItem(playerid, 68);
					ShowPlayerNotification(playerid, "Compraste un café.", 3);
					GivePlayerCash(playerid, -20);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
			
		}
	}
    return 1; 
}

ShowBurdelMenu(playerid)
{
	HidePlayerMenu(playerid);

	ShowPlayerMenu(playerid, MENU_BURDEL, "Burdel");
	AddPlayerMenuItem(playerid, TextToSpanish("Hamburguesa"), "Precio: ~g~300$");
	AddPlayerMenuItem(playerid, TextToSpanish("Wisky"), "Precio: ~g~500$");
	AddPlayerMenuItem(playerid, TextToSpanish("Cerveza normal"), "Precio: ~g~80$");
	AddPlayerMenuItem(playerid, TextToSpanish("Cerveza artesanal"), "Precio: ~g~100$");
	AddPlayerMenuItem(playerid, TextToSpanish("Champagne"), "Precio: ~g~150$");
	return 1;
}

Menu:MENU_BURDEL(playerid, response, listitem)
{
    if (response == MENU_RESPONSE_SELECT)
    {
		if (IsFullInventory(playerid)) return ShowPlayerMessage(playerid, "~r~Tienes el inventario lleno", 4);

		switch(listitem)
		{
			case 0:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 300)
				{
					GivePlayerCash(playerid, -300);
					AddPlayerItem(playerid, 49);
					ShowPlayerNotification(playerid, "Compraste una hamburguesa.", 3);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}

			case 1:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 500)
				{
					GivePlayerCash(playerid, -500);
					AddPlayerItem(playerid, 64);
					ShowPlayerNotification(playerid, "Compraste un wisky.", 3);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}

			case 2:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 80)
				{
					GivePlayerCash(playerid, -80);
					AddPlayerItem(playerid, 63);
					ShowPlayerNotification(playerid, "Compraste una cerveza normal.", 3);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}

			case 3:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 100)
				{
					GivePlayerCash(playerid, -100);
					AddPlayerItem(playerid, 66);
					ShowPlayerNotification(playerid, "Compraste una cerveza artesanal.", 3);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}

			case 4:
			{
				if (CHARACTER_INFO[playerid][ch_CASH] >= 150)
				{
					GivePlayerCash(playerid, -150);
					AddPlayerItem(playerid, 65);
					ShowPlayerNotification(playerid, "Compraste un champagne.", 3);
					
					ApplyAnimation(playerid, "DEALER", "SHOP_PAY", 4.1, false, false, false, false, 0, false); // pagar
					PlayerPlaySoundEx(playerid, 1058, 0.0, 0.0, 0.0);
				}
				else
				{
					PlayerPlaySoundEx(playerid, 1085, 0.0, 0.0, 0.0);
					ShowPlayerMessage(playerid, "~r~Dinero insuficiente.", 2);
				}
			}
		}
	}
	return 1;
}

CheckBurdelShop(playerid)
{
	if (IsPlayerInRangeOfPoint(playerid, 1.8, 1207.3176, -29.0368, 1000.9531))
	{
		ShowBurdelMenu(playerid);
	}

	return 1;
}

CheckFoodShop(playerid)
{
	if (PLAYER_TEMP[playerid][py_INTERIOR_INDEX] == -1) return 0;
	if (ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE] == INTERIOR_NO_INFO) return 0;

	new index = GetFastFoodLocalIndexByIntType(ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE]);
	if (index == -1) return 0;

	if (!IsPlayerInRangeOfPoint(playerid, 1.3, Fast_Food_Positions[index][fast_food_X], Fast_Food_Positions[index][fast_food_Y], Fast_Food_Positions[index][fast_food_Z])) return 0;

	switch(Fast_Food_Positions[index][fast_food_INTERIOR_TYPE])
	{
		case INTERIOR_BURGER_SHOT: ShowBurgerMenu(playerid);
		case INTERIOR_PIZZA: ShowPizzaMenu(playerid);
		case INTERIOR_CLUCKIN_BELL: ShowClukinMenu(playerid);
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
			Show247Menu(playerid);
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

	if (PLAYER_WORKS[playerid][WORK_SINDACCO])
	{
		if (IsPlayerInRangeOfPoint(playerid, 1.3, 727.9929, -1276.1163, 13.6484))
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

	size = 17.0 + (CHARACTER_INFO[playerid][ch_HUNGRY] * 0.4); // 12.0
	if (size >= 54.0) size = 54.0;
	PlayerTextDrawTextSize(playerid, PlayerTextdraws[playerid][ptextdraw_HUD][1], size, 0.000000);

	size = 79.0 + (CHARACTER_INFO[playerid][ch_THIRST] * 0.4); // 74.5
	if (size >= 120.0) size = 120.5;
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

				ReduceMentalState(playerid, 1);

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
		new work_payment = (5500 * PLAYER_SKILLS[playerid][WORK_POLICE]);
		money += work_payment;

		format(str_temp, sizeof(str_temp), "~n~SAPD: ~g~%s$~w~", number_format_thousand(work_payment));
		strcat(str_payday, str_temp);
	}

	if (PlayerIsInMafia(playerid))
	{
		new mafia = GetPlayerMafia(playerid);

		new work_payment = (4000 * PLAYER_SKILLS[playerid][mafia]);

		money += work_payment;

		format(str_temp, sizeof(str_temp), "~n~Mafia: ~g~%s$~w~", number_format_thousand(work_payment));
		strcat(str_payday, str_temp);
	}

	if (PLAYER_CREW[playerid][player_crew_VALID] && CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITIS_COUNT] > 0)
	{
		new graffiti_payment = 600 * CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITIS_COUNT];

		money += graffiti_payment;

		format(str_temp, sizeof(str_temp), "~n~Graffitis (%d): ~g~%s$~w~", CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_GRAFFITIS_COUNT], number_format_thousand(graffiti_payment));
		strcat(str_payday, str_temp);	
	}

	if (CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_COUNT] > 0)
	{
		new market_payment = 5000 * CREW_INFO[ PLAYER_CREW[playerid][player_crew_INDEX] ][crew_MARKET_COUNT];

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
		money += minrand(8000, 12000);
	}

	if (money > 0) format(str_temp, sizeof(str_temp), "~n~RESUMEN: ~g~%s$~w~", number_format_thousand(money));
	else format(str_temp, sizeof(str_temp), "~n~RESUMEN: ~g~%s$~w~", number_format_thousand(money));

	strcat(str_payday, str_temp);

	ShowPlayerNotification(playerid, str_payday, 6);
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

GivePlayerWeaponEx(playerid, weapon_id, ammo, bool:equip = false, bool:save = false)
{
	if (PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_ID] == weapon_id)
		PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_AMMO] += ammo;
	else PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_AMMO] = ammo;

	PLAYER_AC_INFO[playerid][CHEAT_AMMO][p_ac_info_IMMUNITY] = gettime() + 3;
	PLAYER_AC_INFO[playerid][CHEAT_WEAPON][p_ac_info_IMMUNITY] = gettime() + 3;

	PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_VALID] = true;
	PLAYER_WEAPONS[playerid][ WEAPON_INFO[weapon_id][weapon_info_SLOT] ][player_weapon_ID] = weapon_id;

	if (equip)
	{
		ResetPlayerWeapons(playerid);
		GivePlayerWeapon(playerid, weapon_id, ammo);
		SetPlayerArmedWeapon(playerid, weapon_id);
	}

	if (save)
	{
		SaveActualWeapon(playerid, true);
		ResetItemBody(playerid);
	}
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

	ShowPlayerDialog(playerid, DIALOG_INFO, DIALOG_STYLE_MSGBOX, caption, dialog, "Cerrar", "");
	return 1;
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
	if (PlayerAlreadyHasItem(playerid, 40))
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
			UPDATE `ACCOUNTS` SET `TIME-PLAYING` = '%d', `LEVEL` = '%d', `REP` = '%d', `TIME_FOR_REP` = '%d', `PAYDAY_REP` = '%d' WHERE `ID` = '%d';\
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
		format(DB_Query, sizeof DB_Query, "UPDATE `CHARACTER` SET `CASH` = '%d' WHERE `ID_USER` = '%d';", CHARACTER_INFO[playerid][ch_CASH], ACCOUNT_INFO[playerid][ac_ID]);
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
		format(DB_Query, sizeof DB_Query, "UPDATE `CHARACTER` SET `CASH` = '%d' WHERE `ID_USER` = '%d';", CHARACTER_INFO[playerid][ch_CASH], ACCOUNT_INFO[playerid][ac_ID]);
		db_free_result(db_query(Database, DB_Query));
	}
	return 1;
}

minrand(min, max)
{
	return random(max - min) + min;
}

EquipItemByType(playerid, type)
{
	new target_slot;
	for(new i = 0; i < 13; i ++)
	{
		if (PLAYER_VISUAL_INV[playerid][slot_VALID][i] && PLAYER_VISUAL_INV[playerid][slot_TYPE][i] == type)
		{
			target_slot = i;
			break;
		}
	}

	if (target_slot)
	{
		PLAYER_TEMP[playerid][py_INVENTORY_TYPE] = 0;
		ClickInventorySlot(playerid, target_slot, true);
		return 1;
	}
	return 0;
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
		    	SendMessageToAdmins(COLOR_ANTICHEAT, str, 2);
		    	SendDiscordWebhook(str, 1);
		    
		    	SendClientMessageEx(playerid, COLOR_ORANGE, "[ANTI-CHEAT]"COL_WHITE" Fuiste expulsado - Razón: Tener armas prohibidas");
		    	KickEx (playerid, 500);
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
		INSERT INTO `ACCOUNTS` \
		(\
			`IP`, `NAME`, `EMAIL`, `GPCI`, `SALT`, `PASS`, `CONNECTED`, `PLAYERID`, `TIME_FOR_REP`\
		) \
		VALUES \
		(\
			'%q', '%q', '%q', '%q', '%q', '%q', 1, %d, %d\
		);\
		SELECT `ID`, `LAST_CONNECTION` FROM `ACCOUNTS` WHERE `NAME` = '%q';\
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
		INSERT INTO `REGISTER_LOG`\
		(\
			`ID_USER`, `IP`, `NAME`, `EMAIL`, `SALT`, `PASS`\
		)\
		VALUES\
		(\
			'%d', '%q', '%q', '%q', '%q', '%q'\
		);\
		SELECT `DATE` FROM `REGISTER_LOG` WHERE `ID_USER` = '%d';\
	", ACCOUNT_INFO[playerid][ac_ID], ACCOUNT_INFO[playerid][ac_IP], ACCOUNT_INFO[playerid][ac_NAME], ACCOUNT_INFO[playerid][ac_EMAIL], ACCOUNT_INFO[playerid][ac_SALT], ACCOUNT_INFO[playerid][ac_PASS], ACCOUNT_INFO[playerid][ac_ID]);
	Result_reg = db_query(Database, DB_Query);

	if (db_num_rows(Result_reg)) db_get_field_assoc(Result, "DATE", ACCOUNT_INFO[playerid][reg_DATE], 24);
	db_free_result(Result_reg);


	DB_Query[0] = EOS;
	format(DB_Query, sizeof DB_Query,
	"\
		INSERT INTO `CHARACTER`\
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
		UPDATE `ACCOUNTS` SET \
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
		UPDATE `CHARACTER` SET \
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

stock ShowPlayerMessageToRange(playerid, Float:range, const message[], seconds)
{
	new
		Float:oldposx, Float:oldposy, Float:oldposz,
		current_vw = GetPlayerVirtualWorld(playerid),
		current_int = GetPlayerInterior(playerid)
	;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (!IsPlayerConnected(i)) continue;
		if (!PLAYER_TEMP[i][py_USER_LOGGED]) continue;
		if (GetPlayerVirtualWorld(i) != current_vw) continue;
		if (GetPlayerInterior(i) != current_int) continue;

		if (IsPlayerInRangeOfPoint(i, range, oldposx, oldposy, oldposz))
			ShowPlayerMessage(i, message, seconds);
	}
	return 1;
}

ShowPlayerNotificationToRange(playerid, Float:range, const message[], seconds)
{
	new
		Float:oldposx, Float:oldposy, Float:oldposz,
		current_vw = GetPlayerVirtualWorld(playerid),
		current_int = GetPlayerInterior(playerid)
	;
	GetPlayerPos(playerid, oldposx, oldposy, oldposz);

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (!IsPlayerConnected(i)) continue;
		if (!PLAYER_TEMP[i][py_USER_LOGGED]) continue;
		if (GetPlayerVirtualWorld(i) != current_vw) continue;
		if (GetPlayerInterior(i) != current_int) continue;

		if (IsPlayerInRangeOfPoint(i, range, oldposx, oldposy, oldposz))
			ShowPlayerNotification(i, message, seconds);
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

ReplaceStringByRegex(const str[], const regexp[], const fmt[], dest[], size = sizeof dest)
{
    new Regex:r = Regex_New(regexp);

    if (r)
    {
        Regex_Replace(str, r, fmt, dest, MATCH_DEFAULT, size);
        Regex_Delete(r);
    }
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
	if (strfind(string, "51.222.21.190", true) != -1) return false;

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
	format(DB_Query, sizeof(DB_Query), "SELECT * FROM `CHARACTER` WHERE `ID_USER` = '%d';", ACCOUNT_INFO[playerid][ac_ID]);
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
	UpdateDynamic3DTextLabelText(PROPERTY_INFO[index][property_EXT_LABEL_ID], 0xF0F0F000, label_str);
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
	else ShowPlayerMessage(playerid, "~r~No tienes el dinero suficiente.", 3, 1150);
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
	if (PROPERTY_INFO[ PLAYER_TEMP[playerid][py_PLAYER_PROPERTY_SELECTED] ][property_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID])
	{
		AddPlayerMenuItem(playerid, "Gestionar llaves");
	}

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
            if (PROPERTY_INFO[info[1]][property_OWNER_ID] == ACCOUNT_INFO[playerid][ac_ID] || IsPlayerInPropertyKeys(PROPERTY_INFO[info[1]][property_ID], ACCOUNT_INFO[playerid][ac_ID]))
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

Log(const nombre[], const texto[])
{
    new dir[32], File:arc, txt[256];
    new log_D, log_M, log_A;
    new log_Seg, log_Min, log_Hor;

    getdate(log_A, log_M, log_D);
    gettime(log_Hor, log_Min, log_Seg);

    format(dir, sizeof(dir), "/LOGS_FILES/%s.log", nombre);
    format(txt, sizeof(txt), "[%02d/%02d/%d|%02d:%02d:%02d] %s\r\n", log_D, log_M, log_A,
    log_Hor, log_Min, log_Seg, texto);

    if (!fexist(dir))
    arc = fopen(dir, io_write);
    else
    arc = fopen(dir, io_append);
    fwrite(arc, txt);
    fclose(arc);
    return 1;
}

forward InitRandomGangEvent();
public InitRandomGangEvent()
{
	#if DEBUG_MODE == 1
		printf("InitRandomGangEvent"); // debug juju
	#endif

	/*new event = minrand(0, 6);
	switch(event)
	{
		case 3:
		{
			new market_id = minrand(0, sizeof(BLACK_MARKET_OBJ));
			InitBlackMarket(market_id);
		}
		default:
		{
			new graff_id = minrand(0, sizeof(GRAFFITIS_OBJ));
			InitGraffiti(graff_id);
		}
	}*/
	new graff_id = minrand(0, sizeof(GRAFFITIS_OBJ));
	InitGraffiti(graff_id);
	return 1;
}

/*GenString(strDest[], strLen = 10)
{
    while(strLen --)
        strDest[strLen] = random(2) ? (random(26) + (random(2) ? 'a' : 'A')) : (random(10) + '0');
}

AddGiftCode(code[], type, extra)
{
	new DB_Query[160];
	format
	(
		DB_Query, sizeof DB_Query,
		"\
			INSERT INTO `GIFTS_CODES`\
			(\
				`CODE`, `TYPE`, `EXTRA`, `USED`\
			)\
			VALUES\
			(\
				'%q', '%d', '%d', '0'\
			);\
		",
		code,
		type,
		extra
	);
	db_free_result(db_query(Database, DB_Query));
	return 1;
}*/

/*forward SendGift();
public SendGift()
{
	#if DEBUG_MODE == 1
		printf("SendGift"); // debug juju
	#endif

	for(new i = 0, j = 10; i <= j; i++)
	{
		new
			code[10],
			type = minrand(0, 5),
			extra
		;

		switch(type)
		{
			case 0, 1, 2, 3, 5: type = 0;
			case 4: type = 3;
		}

		if (type == 0) extra = minrand(300, 1000);
		else extra = minrand(1, 2);

		GenString(code, 8);

		AddGiftCode(code, type, extra);
		HTTP(0, HTTP_HEAD, sprintf("51.222.21.190:1337/add_gift_from_server/%s", code), "", "");
	}
	return 1;
}*/

forward GiveAutoGift();
public GiveAutoGift()
{
	#if DEBUG_MODE == 1
		printf("GiveAutoGift"); // debug juju
	#endif

	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (PLAYER_TEMP[i][py_GAME_STATE] == GAME_STATE_NORMAL)
			{
				GivePlayerCash(i, 10000, false);
				ShowPlayerMessage(i, "~r~[REGALO]~w~ Te han dado 10.000$", 4);
			}
		}
	}
	return 1;
}

StartPlayerJob(playerid, work, vehicleid = INVALID_VEHICLE_ID)
{
	switch(work)
	{
		case WORK_TRUCK:
		{
			if (TRUCK_VEHICLE[vehicleid][truck_vehicle_LOADED])
			{
				if (TRUCK_VEHICLE[vehicleid][truck_vehicle_DELIVERED]) ShowPlayerMessage(playerid, "Vuelve a la ~y~estación", 7);
				else ShowPlayerMessage(playerid, "Ve a entregar la mercancía", 7);

				new Float:val = 70.0;
				if (val + GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] > GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS]) val = GLOBAL_VEHICLES[vehicleid][gb_vehicle_MAX_GAS];
				GLOBAL_VEHICLES[vehicleid][gb_vehicle_GAS] = val;

				SetPlayerTruckCheckpoint(playerid, vehicleid);
			}
			else ShowPlayerMessage(playerid, "Ve a los ~b~puntos de carga", 7);

			DisableRemoteVehicleCollisions(playerid, 1);
		}
		case WORK_HARVESTER:
		{
			PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] = 0;
			ShowPlayerMessage(playerid, "Ve hasta los ~y~puntos de control~w~.", 3);
			Set_HARVEST_Checkpoint(playerid);
			DisableRemoteVehicleCollisions(playerid, 1);
		}
		case WORK_TRASH:
		{
			if (CHARACTER_INFO[playerid][ch_SEX] == SEX_MALE)
			{
				DisableRemoteVehicleCollisions(playerid, 1);
				SetPlayerSkin(playerid, 16);
				PLAYER_TEMP[playerid][py_SKIN] = 16;
				for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++) RemovePlayerAttachedObject(playerid, i);
			}
		}
		case WORK_MECHANIC:
		{
			if (CHARACTER_INFO[playerid][ch_SEX] == SEX_MALE)
			{
				SetPlayerSkin(playerid, 50);
				PLAYER_TEMP[playerid][py_SKIN] = 50;
				for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++) RemovePlayerAttachedObject(playerid, i);
			}
			SetMechanicPlayerMarkers(playerid);
		}
		case WORK_POLICE:
		{
			new label_str[128];
			format(label_str, sizeof label_str, "%s | Nº%d | %c. %s", POLICE_RANKS[ PLAYER_SKILLS[playerid][WORK_POLICE] ], PLAYER_MISC[playerid][MISC_PLACA_PD], PLAYER_TEMP[playerid][py_FIRST_NAME][0], PLAYER_TEMP[playerid][py_SUB_NAME]);

			if (IsValidDynamic3DTextLabel(PLAYER_TEMP[playerid][py_POLICE_LABEL]))
			{
				DestroyDynamic3DTextLabel(PLAYER_TEMP[playerid][py_POLICE_LABEL]);
				PLAYER_TEMP[playerid][py_POLICE_LABEL] = Text3D:INVALID_STREAMER_ID;
			}
			PLAYER_TEMP[playerid][py_POLICE_LABEL] = CreateDynamic3DTextLabel(label_str, 0xF0F0F000, 0.0, 0.0, 0.3, 20.0, playerid, .testlos = true);

			//for(new i = 0; i != MAX_PLAYER_ATTACHED_OBJECTS; i ++) RemovePlayerAttachedObject(playerid, i);
		}
		case WORK_MEDIC:
		{
			if (CHARACTER_INFO[playerid][ch_SEX] == SEX_MALE) SetPlayerSkin(playerid, minrand(274, 276));
			else SetPlayerSkin(playerid, 308);

			SetMedicPlayerMarkers(playerid);
			ShowPlayerMessage(playerid, "Ve hasta los puntos marcados en el mapa.", 3);
		}
		case WORK_WOODCUTTER:
		{
			for(new i = 0; i != 10; ++i) RemovePlayerAttachedObject(playerid, i);
			SetPlayerAttachedObject(playerid, 0, 18638, 2, 0.152999, 0.007999, -0.005000, 0.0, 0.0, -16.199993, 1.0, 1.0, 1.0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
			SetPlayerAttachedObject(playerid, 1, 1458, 6, 1.840000, -0.546001, 0.419000, 62.100097, -158.799804, 78.600196, 0.474999, 1.000000, 1.000000);
			// SetPlayerAttachedObject(playerid, 2, 341, 6, 0.026999, -0.015000, -0.096999, 0.000000, -35.600006, 0.000000, 1.000000, 1.000000, 1.000000);

			LogCarts[playerid][cart_VALID] = true;
			LogCarts[playerid][cart_AMOUNT] = 0;
			LogCarts[playerid][cart_OBJECT] = INVALID_OBJECT_ID;
			PLAYER_TEMP[playerid][py_HOLDING_CART] = true;

			ShowPlayerNotification(playerid, "Ahora estas de servicio como leñador, ve al bosque y tala algunos arboles. Usa ~r~ALT ~w~+ ~r~CLICK ~w~para soltar tu carro.", 5);
		}
	}

	PLAYER_TEMP[playerid][py_WORKING_IN] = work;
	return 1;
}

EndPlayerJob(playerid, changeskin = true)
{
	switch(PLAYER_TEMP[playerid][py_WORKING_IN])
	{
		case WORK_TRUCK:
		{
			if (PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] != INVALID_VEHICLE_ID)
			{
				if (TRUCK_VEHICLE[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][truck_vehicle_DRIVER_USER_ID] == ACCOUNT_INFO[playerid][ac_ID])
				{
					if (TRUCK_VEHICLE[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][truck_vehicle_LOADING])
					{
						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][9]);
						SetVehicleToRespawnEx(PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID]);
					}
					if (TRUCK_VEHICLE[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][truck_vehicle_UNLOADING])
					{
						TRUCK_VEHICLE[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][truck_vehicle_UNLOADING] = false;
						KillTimer(PLAYER_TEMP[playerid][py_TIMERS][9]);
					}
				}
			}
			if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]))
			{
				DestroyDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]);
	   			CancelTracing(playerid);
				PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT] = INVALID_STREAMER_ID;
			}
		}
		case WORK_HARVESTER:
		{
			if (IsValidDynamicRaceCP(PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT]))
			{
				DestroyDynamicRaceCP(PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT]);
				PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT] = INVALID_STREAMER_ID;
			}
			if (PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] != INVALID_VEHICLE_ID)
			{
				if (WORK_VEHICLES[ PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID] ][work_vehicle_WORK] == WORK_HARVESTER) SetVehicleToRespawnEx(PLAYER_TEMP[playerid][py_LAST_VEHICLE_ID]);
			}
		}
		case WORK_FARMER: CancelPlayerPlanting(playerid);
		case WORK_TRASH:
		{
			if (changeskin)
			{
				SetPlayerSkin(playerid, CHARACTER_INFO[playerid][ch_SKIN]);
				PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];
				SetPlayerToys(playerid);
			}

			if (PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] != INVALID_VEHICLE_ID)
			{
				if (TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_JOB_STARTED])
				{
					if (PLAYER_TEMP[playerid][py_TRASH_DRIVER])
					{
						ShowPlayerMessage(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], "~r~El trabajo se ha cancelado porque tu compañero ha dejado de trabajar.", 3);
						CancelTrashWork(playerid, TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_PASSENGER_ID], PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);
					}
					if (PLAYER_TEMP[playerid][py_TRASH_PASSENGER])
					{
						ShowPlayerMessage(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], "~r~El trabajo se ha cancelado porque tu compañero ha dejado de trabajar.", 3);
						CancelTrashWork(TRASH_VEHICLES[ PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID] ][trash_vehicle_DRIVER_ID], playerid, PLAYER_TEMP[playerid][py_TRASH_VEHICLE_ID]);
					}
				}
			}
		}
		case WORK_POLICE:
		{
			PLAYER_TEMP[playerid][py_POLICE_RADIO] = 0;
			if (IsValidDynamic3DTextLabel(PLAYER_TEMP[playerid][py_POLICE_LABEL]))
			{
				DestroyDynamic3DTextLabel(PLAYER_TEMP[playerid][py_POLICE_LABEL]);
				PLAYER_TEMP[playerid][py_POLICE_LABEL] = Text3D:INVALID_STREAMER_ID;
			}

			if (changeskin)
			{
				SetPlayerSkin(playerid, CHARACTER_INFO[playerid][ch_SKIN]);
				PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];
				//SetPlayerToys(playerid);
			}

			SetPlayerColorEx(playerid, PLAYER_COLOR);
			SetNormalPlayerMarkers(playerid);
		}
		case WORK_MECHANIC:
		{
			if (changeskin)
			{
				SetPlayerSkin(playerid, CHARACTER_INFO[playerid][ch_SKIN]);
				PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];
				SetPlayerToys(playerid);
			}
			SetNormalPlayerMarkers(playerid);
		}
		case WORK_MEDIC:
		{
			SetPlayerSkin(playerid, CHARACTER_INFO[playerid][ch_SKIN]);
			PLAYER_TEMP[playerid][py_SKIN] = CHARACTER_INFO[playerid][ch_SKIN];
			SetNormalPlayerMarkers(playerid);
		}
		case WORK_WOODCUTTER:
		{
			RemovePlayerAttachedObject(playerid, 0);
			RemovePlayerAttachedObject(playerid, 1);
			RemovePlayerAttachedObject(playerid, 2);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			ClearAnimations(playerid);
			
			SetPlayerToys(playerid);

			if (IsValidDynamicObject(LogCarts[playerid][cart_OBJECT]))
				DestroyDynamicObject(LogCarts[playerid][cart_OBJECT]);

			if (IsValidDynamic3DTextLabel(LogCarts[playerid][cart_LABEL]))
				DestroyDynamic3DTextLabel(LogCarts[playerid][cart_LABEL]);

			if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT]))
			{
				TogglePlayerDynamicCP(playerid, PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT], false);
				DestroyDynamicCP(PLAYER_TEMP[playerid][py_CUTTING_CHECKPOINT]);
			}
			
			LogCarts[playerid][cart_VALID] = false;
		}
	}

	PLAYER_TEMP[playerid][py_WORKING_IN] = WORK_NONE;

	SavePlayerSkills(playerid);
	return 1;
}

new
	DIALOG_PLAYER_GPS_SITE_0_String[90 * (sizeof(Hospital_Spawn_Positions) + 1)],
	DIALOG_PLAYER_GPS_SITE_7_String[90 * (sizeof(SELL_VEHICLES_SHOPS_SPAWN) + 1)],
	DIALOG_CREATE_CREW_COLOR_String[164];

stock RemoveObjectCollisions()
{
	//taller temple
    CA_RemoveBuilding(5849, 1046.6797, -935.1953, 46.9922, 0.25);
    CA_RemoveBuilding(5854, 992.5313, -962.7344, 60.7813, 0.25);
    CA_RemoveBuilding(1266, 1029.1797, -939.5156, 52.7500, 0.25);
    CA_RemoveBuilding(1260, 1029.1797, -939.5156, 52.7500, 0.25);
    CA_RemoveBuilding(1294, 1034.7891, -950.3750, 46.4297, 0.25);
    CA_RemoveBuilding(5848, 1046.6797, -935.1953, 46.9922, 0.25);

    // base mc maik
    CA_RemoveBuilding(3276, -300.9375, -2148.4219, 28.3203, 0.25);
    CA_RemoveBuilding(3276, -297.1875, -2141.5703, 28.3203, 0.25);
    CA_RemoveBuilding(705, -220.5391, -2281.0156, 27.3906, 0.25);
    CA_RemoveBuilding(705, -208.9766, -2306.9531, 27.8906, 0.25);
    CA_RemoveBuilding(3276, -257.5625, -2241.5234, 28.3203, 0.25);
    CA_RemoveBuilding(3276, -263.8672, -2231.5781, 28.3203, 0.25);
    CA_RemoveBuilding(3276, -245.3984, -2225.9922, 28.6875, 0.25);
    CA_RemoveBuilding(3276, -245.4375, -2236.6875, 28.4141, 0.25);
    CA_RemoveBuilding(3276, -249.2031, -2244.3984, 28.4141, 0.25);
    CA_RemoveBuilding(703, -234.4453, -2259.2188, 28.0781, 0.25);
    CA_RemoveBuilding(17038, -280.1875, -2167.7031, 27.7891, 0.25);
    CA_RemoveBuilding(17037, -288.2734, -2163.5000, 30.0938, 0.25);
    CA_RemoveBuilding(17036, -285.3984, -2151.0469, 27.3828, 0.25);
    CA_RemoveBuilding(3276, -285.9297, -2139.2734, 28.3203, 0.25);
    CA_RemoveBuilding(3276, -274.5781, -2138.6328, 28.4922, 0.25);
    CA_RemoveBuilding(17039, -260.5391, -2182.6094, 26.6875, 0.25);
    CA_RemoveBuilding(17040, -257.5313, -2202.8359, 27.5781, 0.25);
    CA_RemoveBuilding(3276, -254.1406, -2170.7969, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -263.3906, -2140.5938, 28.8281, 0.25);
    CA_RemoveBuilding(3276, -258.0000, -2148.1094, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -256.2500, -2159.3203, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -251.3047, -2181.8047, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -248.0391, -2192.8125, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -244.8594, -2203.8672, 29.0234, 0.25);
    CA_RemoveBuilding(3276, -243.7266, -2214.7266, 28.8984, 0.25);

	//Objetos removidos de LCN HQ
    CA_RemoveBuilding(726, 743.2422, -1151.4766, 20.8750, 0.25);
    CA_RemoveBuilding(733, 778.2109, -1207.2031, 13.5391, 0.25);
    CA_RemoveBuilding(729, 731.3906, -1223.1641, 12.5078, 0.25);
    CA_RemoveBuilding(733, 717.1172, -1236.2266, 12.0625, 0.25);
    CA_RemoveBuilding(726, 680.8594, -1293.3984, 12.3984, 0.25);
    CA_RemoveBuilding(732, 782.7969, -1304.0781, 12.3906, 0.25);
    CA_RemoveBuilding(620, 651.1094, -1305.9766, 12.5859, 0.25);
    CA_RemoveBuilding(620, 678.4844, -1251.7891, 12.0313, 0.25);
    CA_RemoveBuilding(620, 746.4922, -1303.4141, 11.6719, 0.25);
    CA_RemoveBuilding(620, 760.4531, -1304.1328, 12.2813, 0.25);
    CA_RemoveBuilding(620, 782.3438, -1277.8359, 12.2031, 0.25);
    CA_RemoveBuilding(620, 783.0625, -1245.7969, 12.5938, 0.25);

	// heix
	CA_RemoveBuilding(3578, 2526.4297, -2561.3047, 13.1719, 0.25);

	// plaza
	CA_RemoveBuilding(4057, 1479.5547, -1693.1406, 19.5781, 0.25);
	CA_RemoveBuilding(4210, 1479.5625, -1631.4531, 12.0781, 0.25);
	CA_RemoveBuilding(713, 1457.9375, -1620.6953, 13.4531, 0.25);
	CA_RemoveBuilding(713, 1496.8672, -1707.8203, 13.4063, 0.25);
	CA_RemoveBuilding(1283, 1430.1719, -1719.4688, 15.6250, 0.25);
	CA_RemoveBuilding(1226, 1451.6250, -1727.6719, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1467.9844, -1727.6719, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1485.1719, -1727.6719, 16.4219, 0.25);
	CA_RemoveBuilding(1280, 1468.9844, -1713.5078, 13.4531, 0.25);
	CA_RemoveBuilding(1231, 1479.6953, -1716.7031, 15.6250, 0.25);
	CA_RemoveBuilding(1226, 1505.1797, -1727.6719, 16.4219, 0.25);
	CA_RemoveBuilding(1280, 1488.7656, -1713.7031, 13.4531, 0.25);
	CA_RemoveBuilding(1289, 1504.7500, -1711.8828, 13.5938, 0.25);
	CA_RemoveBuilding(1258, 1445.0078, -1704.7656, 13.6953, 0.25);
	CA_RemoveBuilding(1226, 1433.7109, -1702.3594, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1433.7109, -1676.6875, 16.4219, 0.25);
	CA_RemoveBuilding(1258, 1445.0078, -1692.2344, 13.6953, 0.25);
	CA_RemoveBuilding(1226, 1433.7109, -1656.2500, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1433.7109, -1636.2344, 16.4219, 0.25);
	CA_RemoveBuilding(712, 1445.8125, -1650.0234, 22.2578, 0.25);
	CA_RemoveBuilding(1226, 1433.7109, -1619.0547, 16.4219, 0.25);
	CA_RemoveBuilding(1283, 1443.2031, -1592.9453, 15.6250, 0.25);
	CA_RemoveBuilding(673, 1457.7266, -1710.0625, 12.3984, 0.25);
	CA_RemoveBuilding(620, 1461.6563, -1707.6875, 11.8359, 0.25);
	CA_RemoveBuilding(1280, 1468.9844, -1704.6406, 13.4531, 0.25);
	CA_RemoveBuilding(700, 1463.0625, -1701.5703, 13.7266, 0.25);
	CA_RemoveBuilding(1231, 1479.6953, -1702.5313, 15.6250, 0.25);
	CA_RemoveBuilding(673, 1457.5547, -1697.2891, 12.3984, 0.25);
	CA_RemoveBuilding(1280, 1468.9844, -1694.0469, 13.4531, 0.25);
	CA_RemoveBuilding(1231, 1479.3828, -1692.3906, 15.6328, 0.25);
	CA_RemoveBuilding(4186, 1479.5547, -1693.1406, 19.5781, 0.25);
	CA_RemoveBuilding(620, 1461.1250, -1687.5625, 11.8359, 0.25);
	CA_RemoveBuilding(700, 1463.0625, -1690.6484, 13.7266, 0.25);
	CA_RemoveBuilding(641, 1458.6172, -1684.1328, 11.1016, 0.25);
	CA_RemoveBuilding(625, 1457.2734, -1666.2969, 13.6953, 0.25);
	CA_RemoveBuilding(1280, 1468.9844, -1682.7188, 13.4531, 0.25);
	CA_RemoveBuilding(712, 1471.4063, -1666.1797, 22.2578, 0.25);
	CA_RemoveBuilding(1231, 1479.3828, -1682.3125, 15.6328, 0.25);
	CA_RemoveBuilding(625, 1458.2578, -1659.2578, 13.6953, 0.25);
	CA_RemoveBuilding(712, 1449.8516, -1655.9375, 22.2578, 0.25);
	CA_RemoveBuilding(1231, 1477.9375, -1652.7266, 15.6328, 0.25);
	CA_RemoveBuilding(1280, 1479.6094, -1653.2500, 13.4531, 0.25);
	CA_RemoveBuilding(625, 1457.3516, -1650.5703, 13.6953, 0.25);
	CA_RemoveBuilding(625, 1454.4219, -1642.4922, 13.6953, 0.25);
	CA_RemoveBuilding(1280, 1467.8516, -1646.5938, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1472.8984, -1651.5078, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1465.9375, -1639.8203, 13.4531, 0.25);
	CA_RemoveBuilding(1231, 1466.4688, -1637.9609, 15.6328, 0.25);
	CA_RemoveBuilding(625, 1449.5938, -1635.0469, 13.6953, 0.25);
	CA_RemoveBuilding(1280, 1467.7109, -1632.8906, 13.4531, 0.25);
	CA_RemoveBuilding(1232, 1465.8906, -1629.9766, 15.5313, 0.25);
	CA_RemoveBuilding(1280, 1472.6641, -1627.8828, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1479.4688, -1626.0234, 13.4531, 0.25);
	CA_RemoveBuilding(3985, 1479.5625, -1631.4531, 12.0781, 0.25);
	CA_RemoveBuilding(4206, 1479.5547, -1639.6094, 13.6484, 0.25);
	CA_RemoveBuilding(1232, 1465.8359, -1608.3750, 15.3750, 0.25);
	CA_RemoveBuilding(1229, 1466.4844, -1598.0938, 14.1094, 0.25);
	CA_RemoveBuilding(1226, 1451.3359, -1596.7031, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1471.3516, -1596.7031, 16.4219, 0.25);
	CA_RemoveBuilding(1280, 1488.7656, -1704.5938, 13.4531, 0.25);
	CA_RemoveBuilding(700, 1494.2109, -1694.4375, 13.7266, 0.25);
	CA_RemoveBuilding(1280, 1488.7656, -1693.7344, 13.4531, 0.25);
	CA_RemoveBuilding(620, 1496.9766, -1686.8516, 11.8359, 0.25);
	CA_RemoveBuilding(641, 1494.1406, -1689.2344, 11.1016, 0.25);
	CA_RemoveBuilding(1280, 1488.7656, -1682.6719, 13.4531, 0.25);
	CA_RemoveBuilding(712, 1480.6094, -1666.1797, 22.2578, 0.25);
	CA_RemoveBuilding(712, 1488.2266, -1666.1797, 22.2578, 0.25);
	CA_RemoveBuilding(1280, 1486.4063, -1651.3906, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1491.3672, -1646.3828, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1493.1328, -1639.4531, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1486.1797, -1627.7656, 13.4531, 0.25);
	CA_RemoveBuilding(1280, 1491.2188, -1632.6797, 13.4531, 0.25);
	CA_RemoveBuilding(1232, 1494.4141, -1629.9766, 15.5313, 0.25);
	CA_RemoveBuilding(1232, 1494.3594, -1608.3750, 15.3750, 0.25);
	CA_RemoveBuilding(1226, 1488.5313, -1596.7031, 16.4219, 0.25);
	CA_RemoveBuilding(1229, 1498.0547, -1598.0938, 14.1094, 0.25);
	CA_RemoveBuilding(1288, 1504.7500, -1705.4063, 13.5938, 0.25);
	CA_RemoveBuilding(1287, 1504.7500, -1704.4688, 13.5938, 0.25);
	CA_RemoveBuilding(1286, 1504.7500, -1695.0547, 13.5938, 0.25);
	CA_RemoveBuilding(1285, 1504.7500, -1694.0391, 13.5938, 0.25);
	CA_RemoveBuilding(673, 1498.9609, -1684.6094, 12.3984, 0.25);
	CA_RemoveBuilding(625, 1504.1641, -1662.0156, 13.6953, 0.25);
	CA_RemoveBuilding(625, 1504.7188, -1670.9219, 13.6953, 0.25);
	CA_RemoveBuilding(620, 1503.1875, -1621.1250, 11.8359, 0.25);
	CA_RemoveBuilding(673, 1501.2813, -1624.5781, 12.3984, 0.25);
	CA_RemoveBuilding(673, 1498.3594, -1616.9688, 12.3984, 0.25);
	CA_RemoveBuilding(1226, 1504.8906, -1596.7031, 16.4219, 0.25);
	CA_RemoveBuilding(712, 1508.4453, -1668.7422, 22.2578, 0.25);
	CA_RemoveBuilding(625, 1505.6953, -1654.8359, 13.6953, 0.25);
	CA_RemoveBuilding(625, 1508.5156, -1647.8594, 13.6953, 0.25);
	CA_RemoveBuilding(625, 1513.2734, -1642.4922, 13.6953, 0.25);
	CA_RemoveBuilding(1258, 1510.8906, -1607.3125, 13.6953, 0.25);
	CA_RemoveBuilding(1226, 1524.8281, -1721.6328, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1524.8281, -1705.2734, 16.4219, 0.25);
	CA_RemoveBuilding(1229, 1524.2188, -1693.9688, 14.1094, 0.25);
	CA_RemoveBuilding(1226, 1524.8281, -1688.0859, 16.4219, 0.25);
	CA_RemoveBuilding(1229, 1524.2188, -1673.7109, 14.1094, 0.25);
	CA_RemoveBuilding(1226, 1524.8281, -1668.0781, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1524.8281, -1621.9609, 16.4219, 0.25);
	CA_RemoveBuilding(1226, 1525.3828, -1611.1563, 16.4219, 0.25);
	CA_RemoveBuilding(1283, 1528.9531, -1605.8594, 15.6250, 0.25);

	// minero
	CA_RemoveBuilding(791, 495.3439, -677.4840, 15.5468, 0.10); // vbg_fir_copse
	CA_RemoveBuilding(785, 495.3439, -677.4840, 15.5468, 0.10); // LOD Model of vbg_fir_copse
	CA_RemoveBuilding(791, 552.7189, -724.0310, 12.0546, 0.10); // vbg_fir_copse
	CA_RemoveBuilding(785, 552.7189, -724.0310, 12.0546, 0.10); // LOD Model of vbg_fir_copse
	CA_RemoveBuilding(791, 438.1409, -628.6480, 26.8593, 0.10); // vbg_fir_copse
	CA_RemoveBuilding(785, 438.1409, -628.6480, 26.8593, 0.10); // LOD Model of vbg_fir_copse

	// conce
	CA_RemoveBuilding(6409, 607.695, -1768.851, 15.234, 0.250);
	CA_RemoveBuilding(6406, 607.695, -1768.851, 15.234, 0.250);
	CA_RemoveBuilding(1308, 592.695, -1753.062, 13.750, 0.250);
	// Pescador
	CA_RemoveBuilding(933, 2159.409, -93.921, 1.804, 0.250);
	CA_RemoveBuilding(933, 2158.110, -94.140, 2.296, 0.250);
	CA_RemoveBuilding(923, 2160.350, -100.859, 2.609, 0.250);
	CA_RemoveBuilding(12991, 2161.629, -102.476, 1.750, 0.250);
	CA_RemoveBuilding(935, 2122.379, -83.382, 0.460, 0.250);
	CA_RemoveBuilding(935, 2119.820, -84.406, -0.070, 0.250);
	CA_RemoveBuilding(935, 2119.530, -82.890, -0.164, 0.250);
	CA_RemoveBuilding(935, 2120.520, -79.085, 0.218, 0.250);
	CA_RemoveBuilding(935, 2119.489, -73.617, 0.125, 0.250);
	CA_RemoveBuilding(935, 2117.840, -67.835, 0.132, 0.250);
	CA_RemoveBuilding(935, 2119.469, -69.734, 0.226, 0.250);
	CA_RemoveBuilding(1369, 2104.020, -105.265, 1.703, 0.250);
	
	//garaje tunin
	CA_RemoveBuilding(13062, 266.3594, 20.1328, 5.4844, 0.25);
	CA_RemoveBuilding(1440, 243.9531, 24.6172, 2.0156, 0.25);
	CA_RemoveBuilding(1684, 276.8438, -2.4297, 2.8828, 0.25);
	CA_RemoveBuilding(13059, 266.3594, 20.1328, 5.4844, 0.25);
	CA_RemoveBuilding(1440, 255.2734, 22.7734, 1.8984, 0.25);
	
	//Cosechador
	CA_RemoveBuilding(3276, -378.7734, -1459.0234, 25.4766, 0.25);

	//Camionero productos limpieza
	CA_RemoveBuilding(985, 2497.4063, 2777.0703, 11.5313, 0.25);
	CA_RemoveBuilding(986, 2497.4063, 2769.1094, 11.5313, 0.25);
	
	//Grua
	CA_RemoveBuilding(17350, -54.9922, -1130.7266, 4.5781, 0.25);
	CA_RemoveBuilding(1447, -89.9297, -1133.7500, 1.3906, 0.25);
	CA_RemoveBuilding(1438, -87.0547, -1132.6797, 0.0469, 0.25);
	CA_RemoveBuilding(1462, -79.2500, -1137.7188, 0.0547, 0.25);
	CA_RemoveBuilding(3285, -73.8047, -1141.4219, 1.9844, 0.25);
	CA_RemoveBuilding(17072, -54.9922, -1130.7266, 4.5781, 0.25);
	CA_RemoveBuilding(17073, -56.1250, -1130.1719, 4.4922, 0.25);
	CA_RemoveBuilding(1462, -84.3750, -1116.0938, 0.2578, 0.25);
	CA_RemoveBuilding(1447, -84.0547, -1117.2188, 1.3906, 0.25);
	CA_RemoveBuilding(1415, -68.3516, -1104.9922, 0.2188, 0.25);
	CA_RemoveBuilding(1462, -60.3594, -1116.9375, 0.2578, 0.25);
	CA_RemoveBuilding(1438, -63.6719, -1125.6953, 0.0469, 0.25);
	CA_RemoveBuilding(1438, -63.4141, -1115.4141, 0.0469, 0.25);
	CA_RemoveBuilding(1415, -63.8125, -1106.4219, 0.2188, 0.25);
	
	// Leñador
	CA_RemoveBuilding(785, -1878.7813, -2299.4531, 36.7578, 0.25);
    CA_RemoveBuilding(785, -1851.1719, -2419.8906, 28.8672, 0.25);
    CA_RemoveBuilding(785, -1916.5703, -2352.8203, 27.8984, 0.25);
    CA_RemoveBuilding(785, -1921.7813, -2233.5547, 64.0625, 0.25);
    CA_RemoveBuilding(785, -1868.4609, -2470.2734, 26.2813, 0.25);
    CA_RemoveBuilding(785, -1934.3438, -2401.9297, 26.5000, 0.25);
    CA_RemoveBuilding(791, -1868.4609, -2470.2734, 26.2813, 0.25);
    CA_RemoveBuilding(790, -1979.7188, -2371.9063, 34.7578, 0.25);
    CA_RemoveBuilding(791, -1934.3438, -2401.9297, 26.5000, 0.25);
    CA_RemoveBuilding(791, -1916.5703, -2352.8203, 27.8984, 0.25);
    CA_RemoveBuilding(790, -1891.0703, -2381.6875, 34.7578, 0.25);
    CA_RemoveBuilding(791, -1878.7813, -2299.4531, 36.7578, 0.25);
    CA_RemoveBuilding(18228, -1856.6875, -2321.2891, 38.1484, 0.25);
    CA_RemoveBuilding(791, -1851.1719, -2419.8906, 28.8672, 0.25);
    CA_RemoveBuilding(791, -1921.7813, -2233.5547, 64.0625, 0.25);

	return 1;
}

FormatDialogStrings()
{
	new Dialog_Lines_String[256];

	//GPS
	new city[45], zone[45];

	//GPS Hospitales
	format(DIALOG_PLAYER_GPS_SITE_0_String, sizeof DIALOG_PLAYER_GPS_SITE_0_String, ""COL_WHITE"Lugar\t"COL_WHITE"Zona\n");
	for(new i = 0; i != sizeof(Hospital_Spawn_Positions); i++ )
	{
		GetPointZone(Hospital_Spawn_Positions[i][0], Hospital_Spawn_Positions[i][1], city, zone);
		format(Dialog_Lines_String, sizeof Dialog_Lines_String, ""COL_WHITE"Hospital %d\t"COL_WHITE"%s, %s\n", i + 1, city, zone);
		strcat(DIALOG_PLAYER_GPS_SITE_0_String, Dialog_Lines_String);
	}

	//GPS CONCES
	format(DIALOG_PLAYER_GPS_SITE_7_String, sizeof DIALOG_PLAYER_GPS_SITE_7_String, ""COL_WHITE"Lugar\t"COL_WHITE"Zona\n");
	for(new i = 0; i != sizeof(SELL_VEHICLES_SHOPS_SPAWN); i++ )
	{
		GetPointZone(SELL_VEHICLES_SHOPS_SPAWN[i][0], SELL_VEHICLES_SHOPS_SPAWN[i][1], city, zone);
		format(Dialog_Lines_String, sizeof Dialog_Lines_String, ""COL_WHITE"Concesionario %d\t"COL_WHITE"%s, %s\n", i + 1, city, zone);
		strcat(DIALOG_PLAYER_GPS_SITE_7_String, Dialog_Lines_String);
	}

	//Colores CREWS
	format(DIALOG_CREATE_CREW_COLOR_String, sizeof DIALOG_CREATE_CREW_COLOR_String, "");
	for(new i = 0; i != sizeof(CrewColors); i++)
	{
		format(Dialog_Lines_String, sizeof(Dialog_Lines_String), "{%06x}%s\n", CrewColors[i] >>> 8, CrewNameColors[i]);
		strcat(DIALOG_CREATE_CREW_COLOR_String, Dialog_Lines_String);
	}
	return 1;
}

LoadEnterExits()
{
	new total_enterexits, label_str[256], info[3];

	for(new i = 0; i != sizeof ENTER_EXIT; i ++)
	{
		ENTER_EXIT[total_enterexits][ee_ID] = total_enterexits + 1;

		if (ENTER_EXIT[total_enterexits][ee_INT_MAPICON] != -1) ENTER_EXIT[total_enterexits][ee_INT_MAPICON_ID] = CreateDynamicMapIcon(ENTER_EXIT[total_enterexits][ee_INT_X], ENTER_EXIT[total_enterexits][ee_INT_Y], ENTER_EXIT[total_enterexits][ee_INT_Z], ENTER_EXIT[total_enterexits][ee_INT_MAPICON], COLOR_WHITE, ENTER_EXIT[total_enterexits][ee_INT_WORLD], ENTER_EXIT[total_enterexits][ee_INT_INTERIOR]);
		if (ENTER_EXIT[total_enterexits][ee_EXT_MAPICON] != -1) ENTER_EXIT[total_enterexits][ee_EXT_MAPICON_ID] = CreateDynamicMapIcon(ENTER_EXIT[total_enterexits][ee_EXT_X], ENTER_EXIT[total_enterexits][ee_EXT_Y], ENTER_EXIT[total_enterexits][ee_EXT_Z], ENTER_EXIT[total_enterexits][ee_EXT_MAPICON], COLOR_WHITE, ENTER_EXIT[total_enterexits][ee_EXT_WORLD], ENTER_EXIT[total_enterexits][ee_EXT_INTERIOR]);

		format(label_str, sizeof(label_str), "{ffffff}%s", ENTER_EXIT[total_enterexits][ee_NAME]);
		CreateDynamic3DTextLabel(label_str, 0xEAE9E900, ENTER_EXIT[total_enterexits][ee_EXT_X], ENTER_EXIT[total_enterexits][ee_EXT_Y], ENTER_EXIT[total_enterexits][ee_EXT_Z] + 0.25, 5.0, .testlos = true, .worldid = ENTER_EXIT[total_enterexits][ee_EXT_WORLD], .interiorid = ENTER_EXIT[total_enterexits][ee_EXT_INTERIOR]);
		AddKeyArea(ENTER_EXIT[total_enterexits][ee_EXT_X], ENTER_EXIT[total_enterexits][ee_EXT_Y], 0.8, KEY_TYPE_ENTER);
		AddKeyArea(ENTER_EXIT[total_enterexits][ee_INT_X], ENTER_EXIT[total_enterexits][ee_INT_Y], 0.8, KEY_TYPE_ENTER);

		ENTER_EXIT[total_enterexits][ee_INT_PICKUP_ID] = CreateDynamicPickup(19902, 1, ENTER_EXIT[total_enterexits][ee_INT_X], ENTER_EXIT[total_enterexits][ee_INT_Y], ENTER_EXIT[total_enterexits][ee_INT_Z] - 0.7, .worldid = ENTER_EXIT[total_enterexits][ee_INT_WORLD], .interiorid = ENTER_EXIT[total_enterexits][ee_INT_INTERIOR]);
		ENTER_EXIT[total_enterexits][ee_EXT_PICKUP_ID] = CreateDynamicPickup(19902, 1, ENTER_EXIT[total_enterexits][ee_EXT_X], ENTER_EXIT[total_enterexits][ee_EXT_Y], ENTER_EXIT[total_enterexits][ee_EXT_Z] - 0.7, ENTER_EXIT[total_enterexits][ee_EXT_WORLD], ENTER_EXIT[total_enterexits][ee_EXT_INTERIOR]);
		
		info[0] = PICKUP_TYPE_ENTER_EXIT;
		info[1] = total_enterexits; // Index
		info[2] = 1; // Pickup Interior
		Streamer_SetArrayData(STREAMER_TYPE_PICKUP, ENTER_EXIT[total_enterexits][ee_INT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

		info[0] = PICKUP_TYPE_ENTER_EXIT;
		info[1] = total_enterexits; // Index
		info[2] = 2; // Pickup Exterior
		Streamer_SetArrayData(STREAMER_TYPE_PICKUP, ENTER_EXIT[total_enterexits][ee_EXT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);
		CreateInteriorActor(ENTER_EXIT[total_enterexits][ee_INTERIOR_TYPE], ENTER_EXIT[total_enterexits][ee_INT_WORLD], ENTER_EXIT[total_enterexits][ee_INT_INTERIOR]);

		total_enterexits ++;
	}

	printf("[debug] Lugares cargados: %d", total_enterexits);
	return 1;
}

LoadProperties()//cargado propiedes
{
	new DBResult:Result;
	Result = db_query(Database, "SELECT `PROPERTY`.*, `PROPERTY_INFO`.* FROM `PROPERTY`, `PROPERTY_INFO` WHERE `PROPERTY_INFO`.ID_PROPERTY = `PROPERTY`.ID;");

	new total_houses, total_houses_free, city[45], zone[45];
	for(new i = 0; i < db_num_rows(Result); i ++)
	{
		if (total_houses >= MAX_PROPERTIES)
		{
			printf("[debug]  Límite superado en array 'PROPERTY_INFO' al intentar cargar de la base de datos.");
			break;
		}

		PROPERTY_INFO[total_houses][property_VALID] = true;
		PROPERTY_INFO[total_houses][property_ID] = db_get_field_assoc_int(Result, "ID");

		PROPERTY_INFO[total_houses][property_EXT_X] = db_get_field_assoc_float(Result, "EXT_X");
		PROPERTY_INFO[total_houses][property_EXT_Y] = db_get_field_assoc_float(Result, "EXT_Y");
		PROPERTY_INFO[total_houses][property_EXT_Z] = db_get_field_assoc_float(Result, "EXT_Z");
		PROPERTY_INFO[total_houses][property_EXT_ANGLE] = db_get_field_assoc_float(Result, "EXT_ANGLE");
		PROPERTY_INFO[total_houses][property_EXT_INTERIOR] = db_get_field_assoc_int(Result, "EXT_INTERIOR");
		PROPERTY_INFO[total_houses][property_EXT_FREEZE] = db_get_field_assoc_int(Result, "EXT_FREEZE");
		PROPERTY_INFO[total_houses][property_ID_INTERIOR] = db_get_field_assoc_int(Result, "ID_INTERIOR");

		PROPERTY_INFO[total_houses][property_PRICE] = db_get_field_assoc_int(Result, "PRICE");
		PROPERTY_INFO[total_houses][property_PRICE_BASE] = PROPERTY_INFO[total_houses][property_PRICE];
		PROPERTY_INFO[total_houses][property_LEVEL] = db_get_field_assoc_int(Result, "LEVEL");
		PROPERTY_INFO[total_houses][property_EXTRA] = db_get_field_assoc_int(Result, "EXTRA");
		PROPERTY_INFO[total_houses][property_VIP_LEVEL] = db_get_field_assoc_int(Result, "VIP_LEVEL");

		CreatePropertyObjects(
			PROPERTY_INFO[total_houses][property_ID],
			PROPERTY_INTERIORS[ PROPERTY_INFO[total_houses][property_ID_INTERIOR] ][property_INT_INTERIOR],
			PROPERTY_INFO[total_houses][property_ID]
		);

		if (PROPERTY_INFO[total_houses][property_EXTRA]) PROPERTY_INFO[total_houses][property_PRICE] = 0;
		if (PROPERTY_INFO[total_houses][property_VIP_LEVEL]) PROPERTY_INFO[total_houses][property_LEVEL] = 1;

		new DBResult:Result_info_owner, DB_Query[600], owner[24], info[3], label_str[256], pickup_modelid;
		format(DB_Query, sizeof DB_Query, "SELECT `ACCOUNTS`.`NAME`, `PROPERTY_OWNER`.`ID_USER`, `PROPERTY_OWNER`.`PROPERTY_NAME` FROM `ACCOUNTS`, `PROPERTY_OWNER` WHERE `PROPERTY_OWNER`.`ID_PROPERTY` = '%d' AND `ACCOUNTS`.`ID` = `PROPERTY_OWNER`.`ID_USER`;", PROPERTY_INFO[total_houses][property_ID]);
		Result_info_owner = db_query(Database, DB_Query);

		if (db_num_rows(Result_info_owner))
		{
			pickup_modelid = 1272;
			PROPERTY_INFO[total_houses][property_SOLD] = true;
			PROPERTY_INFO[total_houses][property_CREW] = false;
			db_get_field_assoc(Result_info_owner, "NAME", owner, 24);
			PROPERTY_INFO[total_houses][property_OWNER_ID] = db_get_field_assoc_int(Result_info_owner, "ID_USER");
			PROPERTY_INFO[total_houses][property_CREW_ID] = 0;
			db_get_field_assoc(Result_info_owner, "PROPERTY_NAME", PROPERTY_INFO[total_houses][property_NAME], 24);
			GetPointZone(PROPERTY_INFO[total_houses][property_EXT_X], PROPERTY_INFO[total_houses][property_EXT_Y], city, zone);

			format
			(
				label_str,
				sizeof label_str,
				""COL_WHITE"\
					Propiedad en %s (%d)\n\
					Propietario:{35A7FF} %s\n\
				", zone, PROPERTY_INFO[total_houses][property_ID], owner
			);
		}
		else
		{
			new DBResult:Result_info_crew, crew_name[24];
			format(DB_Query, sizeof DB_Query, "SELECT `CREW`.`ID`, `CREW`.`NAME` FROM `PROPERTY_TERRITORY`, `CREW` WHERE `PROPERTY_TERRITORY`.`ID_PROPERTY` = '%d' AND `CREW`.`ID` = (SELECT `CREW_TERRITORIES`.`ID_CREW` FROM `CREW_TERRITORIES` WHERE `CREW_TERRITORIES`.`ID_TERRITORY` = `PROPERTY_TERRITORY`.`ID_TERRITORY`);", PROPERTY_INFO[total_houses][property_ID]);
			Result_info_crew = db_query(Database, DB_Query);

			if (db_num_rows(Result_info_crew))
			{
				pickup_modelid = 1272;
				PROPERTY_INFO[total_houses][property_SOLD] = true;
				PROPERTY_INFO[total_houses][property_CREW] = true;
				db_get_field_assoc(Result_info_crew, "NAME", crew_name, 24);
				PROPERTY_INFO[total_houses][property_CREW_ID] = db_get_field_assoc_int(Result_info_crew, "ID");
				PROPERTY_INFO[total_houses][property_OWNER_ID] = 0;
				GetPointZone(PROPERTY_INFO[total_houses][property_EXT_X], PROPERTY_INFO[total_houses][property_EXT_Y], city, zone);
				format(PROPERTY_INFO[total_houses][property_NAME], 24, "%s (%d)", zone, PROPERTY_INFO[total_houses][property_ID]);

				format
				(
					label_str,
					sizeof label_str,
					""COL_WHITE"\
						Propiedad en %s (%d)\n\
						Banda: %s\n\
					", zone, PROPERTY_INFO[total_houses][property_ID], crew_name
				);
			}
			else
			{
				pickup_modelid = 1273;
				PROPERTY_INFO[total_houses][property_SOLD] = false;
				PROPERTY_INFO[total_houses][property_OWNER_ID] = 0;
				GetPointZone(PROPERTY_INFO[total_houses][property_EXT_X], PROPERTY_INFO[total_houses][property_EXT_Y], city, zone);
				format(PROPERTY_INFO[total_houses][property_NAME], 24, "%s (%d)", zone, PROPERTY_INFO[total_houses][property_ID]);

				format(label_str, sizeof label_str, ""COL_WHITE"Propiedad en %s (%d)\n"COL_GREEN"En venta", zone, PROPERTY_INFO[total_houses][property_ID]);
				total_houses_free ++;
			}
			db_free_result(Result_info_crew);
		}
		db_free_result(Result_info_owner);


		PROPERTY_INFO[total_houses][property_EXT_LABEL_ID] = CreateDynamic3DTextLabel(label_str, 0xF0F0F000, PROPERTY_INFO[total_houses][property_EXT_X], PROPERTY_INFO[total_houses][property_EXT_Y], PROPERTY_INFO[total_houses][property_EXT_Z] + 0.25, 5.0, .testlos = true, .worldid = 0, .interiorid = PROPERTY_INFO[total_houses][property_EXT_INTERIOR]);
		PROPERTY_INFO[total_houses][property_EXT_PICKUP_ID] = CreateDynamicPickup(pickup_modelid, 1, PROPERTY_INFO[total_houses][property_EXT_X], PROPERTY_INFO[total_houses][property_EXT_Y], PROPERTY_INFO[total_houses][property_EXT_Z], 0, PROPERTY_INFO[total_houses][property_EXT_INTERIOR]);
		PROPERTY_INFO[total_houses][property_INT_PICKUP_ID] = CreateDynamicPickup(19902, 1, PROPERTY_INTERIORS[ PROPERTY_INFO[total_houses][property_ID_INTERIOR] ][property_INT_X], PROPERTY_INTERIORS[ PROPERTY_INFO[total_houses][property_ID_INTERIOR] ][property_INT_Y], PROPERTY_INTERIORS[ PROPERTY_INFO[total_houses][property_ID_INTERIOR] ][property_INT_Z], PROPERTY_INFO[total_houses][property_ID], PROPERTY_INTERIORS[ PROPERTY_INFO[total_houses][property_ID_INTERIOR] ][property_INT_INTERIOR]);

		AddKeyArea(PROPERTY_INFO[total_houses][property_EXT_X], PROPERTY_INFO[total_houses][property_EXT_Y], 0.8, KEY_TYPE_ENTER);
		AddKeyArea(PROPERTY_INTERIORS[ PROPERTY_INFO[total_houses][property_ID_INTERIOR] ][property_INT_X], PROPERTY_INTERIORS[ PROPERTY_INFO[total_houses][property_ID_INTERIOR] ][property_INT_Y], 0.8, KEY_TYPE_ENTER);

		info[0] = PICKUP_TYPE_PROPERTY;
		info[1] = total_houses; // Index
		info[2] = 1; // Pickup Interior
		Streamer_SetArrayData(STREAMER_TYPE_PICKUP, PROPERTY_INFO[total_houses][property_INT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

		info[0] = PICKUP_TYPE_PROPERTY;
		info[1] = total_houses; // Index
		info[2] = 2; // Pickup Exterior
		Streamer_SetArrayData(STREAMER_TYPE_PICKUP, PROPERTY_INFO[total_houses][property_EXT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

		TOTAL_PROPERTIES_LOADED ++;
		total_houses ++;
		db_next_row(Result);
	}
	db_free_result(Result);

    printf("[debug] Propiedades libres: %d.", total_houses_free);
	printf("[debug] Propiedades totales: %d.", total_houses);
	return 1;
}

LoadCrews()
{
	new DBResult:Result, DB_Query[140];
	Result = db_query(Database, "SELECT * FROM `CREW`;");

	new total_crews;
	for(new i = 0; i < db_num_rows(Result); i ++)
	{
		if (total_crews >= MAX_CREWS)
		{
			printf("[debug]  Límite superado en array 'CREW_INFO' al intentar cargar de la base de datos.");
			break;
		}

		CREW_INFO[total_crews][crew_VALID] = true;
		CREW_INFO[total_crews][crew_ID] = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "NAME", CREW_INFO[total_crews][crew_NAME], 32);
		strreplace(CREW_INFO[total_crews][crew_NAME], "~", "");

		db_get_field_assoc(Result, "DESC", CREW_INFO[total_crews][crew_DESCRIPTION], 32);
		CREW_INFO[total_crews][crew_COLOR] = db_get_field_assoc_int(Result, "COLOR");
		CREW_INFO[total_crews][crew_GRAFFITIS_COUNT] = db_get_field_assoc_int(Result, "GRAFFITIS_COUNT");
		CREW_INFO[total_crews][crew_MARKET_COUNT] = db_get_field_assoc_int(Result, "MARKETS_COUNT");
		CREW_INFO[total_crews][crew_ONLINE_MEMBERS] = 0;

		if (CREW_INFO[total_crews][crew_GRAFFITIS_COUNT] < 0)
		{
			CREW_INFO[total_crews][crew_GRAFFITIS_COUNT] = 0;
		}

		if (CREW_INFO[total_crews][crew_GRAFFITIS_COUNT] > 54)
		{
			CREW_INFO[total_crews][crew_GRAFFITIS_COUNT] = 0;
		}

		if (CREW_INFO[total_crews][crew_MARKET_COUNT] < 0)
		{
			CREW_INFO[total_crews][crew_MARKET_COUNT] = 0;
		}

		if (CREW_INFO[total_crews][crew_MARKET_COUNT] > 3)
		{
			CREW_INFO[total_crews][crew_MARKET_COUNT] = 0;
		}

		RecalculeCrewGraffitis(total_crews);
		RecalculeCrewMarkets(total_crews);

		new DBResult:Result_members;
		format(DB_Query, sizeof DB_Query, "SELECT COUNT() FROM `PLAYER_CREW` WHERE `ID_CREW` = '%d';", CREW_INFO[total_crews][crew_ID]);
		Result_members = db_query(Database, DB_Query);

		if (db_num_rows(Result_members)) CREW_INFO[total_crews][crew_MEMBERS] = db_get_field_int(Result_members, 0);
		db_free_result(Result_members);


		new DBResult:Result_ranks;
		format(DB_Query, sizeof DB_Query, "SELECT * FROM `CREW_RANKS` WHERE `ID_CREW` = '%d' LIMIT %d;", CREW_INFO[total_crews][crew_ID], MAX_CREW_RANKS);
		Result_ranks = db_query(Database, DB_Query);
		for(new x = 0; x < db_num_rows(Result_ranks); x ++)
		{
			new pos = db_get_field_assoc_int(Result_ranks, "RANK_POS");
			if (pos < 0 || pos > MAX_CREW_RANKS) continue;

			CREW_RANK_INFO[total_crews][pos][crew_rank_VALID] = true;
			CREW_RANK_INFO[total_crews][pos][crew_rank_ID] = db_get_field_assoc_int(Result_ranks, "ID");
			db_get_field_assoc(Result_ranks, "RANK_NAME", CREW_RANK_INFO[total_crews][pos][crew_rank_NAME], 32);

			new DBResult:Result_ranks_permissions;
			format(DB_Query, sizeof DB_Query, "SELECT * FROM `RANK_PERMISSIONS` WHERE `ID_RANK` = '%d' LIMIT %d;", CREW_RANK_INFO[total_crews][pos][crew_rank_ID], CREW_RANK_SIZE);
			Result_ranks_permissions = db_query(Database, DB_Query);
			for(new z = 0; z < db_num_rows(Result_ranks_permissions); z ++)
			{
				new permission = db_get_field_assoc_int(Result_ranks_permissions, "PERMISSION");
				if (permission < 0 || permission > CREW_RANK_SIZE) continue;

				CREW_RANK_INFO[total_crews][pos][crew_rank_PERMISSION][permission] = db_get_field_assoc_int(Result_ranks_permissions, "SET");
				db_next_row(Result_ranks_permissions);
			}
			db_free_result(Result_ranks_permissions);
			db_next_row(Result_ranks);
		}
		db_free_result(Result_ranks);

		total_crews ++;
		db_next_row(Result);
	}

	printf("[debug] Bandas cargadas: %d", total_crews);
	db_free_result(Result);
	return 1;
}

LoadGangZones()
{
	new DBResult:Result, DB_Query[320];
	format(DB_Query, sizeof DB_Query, "SELECT * FROM `SA_ZONES` WHERE `GANG_ZONE` = '1' LIMIT %d;", MAX_TERRITORIES);
	Result = db_query(Database, DB_Query);

	new total_territories;
	for(new i = 0; i < db_num_rows(Result); i ++)
	{
		if (total_territories >= MAX_TERRITORIES)
		{
			printf("[debug]  Límite superado en array 'TERRITORIES' al intentar cargar de la base de datos.");
			break;
		}

		TERRITORIES[total_territories][territory_VALID] = true;
		TERRITORIES[total_territories][territory_ID] = db_get_field_assoc_int(Result, "ID");
		db_get_field_assoc(Result, "NAME", TERRITORIES[total_territories][territory_NAME], 32);
		TERRITORIES[total_territories][territory_MIN_X] = db_get_field_assoc_float(Result, "MIN_X");
		TERRITORIES[total_territories][territory_MIN_Y] = db_get_field_assoc_float(Result, "MIN_Y");
		TERRITORIES[total_territories][territory_MIN_Z] = db_get_field_assoc_float(Result, "MIN_Z");
		TERRITORIES[total_territories][territory_MAX_X] = db_get_field_assoc_float(Result, "MAX_X");
		TERRITORIES[total_territories][territory_MAX_Y] = db_get_field_assoc_float(Result, "MAX_Y");
		TERRITORIES[total_territories][territory_MAX_Z] = db_get_field_assoc_float(Result, "MAX_Z");
		TERRITORIES[total_territories][territory_WAR] = false;
		TERRITORIES[total_territories][territory_ATTACKER_CREW_INDEX] = 0;

		new DBResult:Result_territory_crew;
		format(DB_Query, sizeof DB_Query, "SELECT `CREW_TERRITORIES`.`ID_CREW`, `CREW`.`COLOR` FROM `CREW_TERRITORIES`, `CREW` WHERE `ID_TERRITORY` = '%d' AND `CREW`.`ID` = `CREW_TERRITORIES`.`ID_CREW`;", TERRITORIES[total_territories][territory_ID]);
		Result_territory_crew = db_query(Database, DB_Query);
		if (db_num_rows(Result_territory_crew))
		{
			TERRITORIES[total_territories][territory_OCCUPIED] = true;
			TERRITORIES[total_territories][territory_CREW_ID] = db_get_field_assoc_int(Result_territory_crew, "ID_CREW");
			new gang_color = db_get_field_assoc_int(Result_territory_crew, "COLOR");

			new r, g, b, a;
			hy_HexToRGBA(gang_color, r, g, b, a);
			TERRITORIES[total_territories][territory_COLOR] = hy_RGBAToHex(r, g, b, 135);

			for(new x = 0; x != MAX_CREWS; x ++)
			{
				if (!CREW_INFO[x][crew_VALID]) continue;

				if (CREW_INFO[x][crew_ID] == TERRITORIES[total_territories][territory_CREW_ID])
				{
					TERRITORIES[total_territories][territory_CREW_INDEX] = x;
					break;
				}
			}
		}
		else
		{
			TERRITORIES[total_territories][territory_OCCUPIED] = false;
			TERRITORIES[total_territories][territory_CREW_ID] = 0;
			TERRITORIES[total_territories][territory_CREW_INDEX] = 0;
			TERRITORIES[total_territories][territory_COLOR] = 0xCCCCCC55;
		}
		db_free_result(Result_territory_crew);


		TERRITORIES[total_territories][territory_AREA] =  CreateDynamicCube
															(
																TERRITORIES[total_territories][territory_MIN_X],
																TERRITORIES[total_territories][territory_MIN_Y],
																TERRITORIES[total_territories][territory_MIN_Z],
																TERRITORIES[total_territories][territory_MAX_X],
																TERRITORIES[total_territories][territory_MAX_Y],
																TERRITORIES[total_territories][territory_MAX_Z],
																0, 0
															);

		new info[2];
		info[0] = AREA_TYPE_GANGZONE;
		info[1] = total_territories;
		Streamer_SetArrayData(STREAMER_TYPE_AREA, TERRITORIES[total_territories][territory_AREA], E_STREAMER_EXTRA_ID, info);


		TERRITORIES[total_territories][territory_GANG_ZONE] =  GangZoneCreate
																(
																	TERRITORIES[total_territories][territory_MIN_X],
																	TERRITORIES[total_territories][territory_MIN_Y],
																	TERRITORIES[total_territories][territory_MAX_X],
																	TERRITORIES[total_territories][territory_MAX_Y]
																);

		TERRITORIES[total_territories][territory_TEXTDRAW] = TextDrawCreate(320.000000, 406.000000, "Progreso de conquista:_0");
		TextDrawLetterSize(TERRITORIES[total_territories][territory_TEXTDRAW], 0.286000, 1.276444);
		TextDrawAlignment(TERRITORIES[total_territories][territory_TEXTDRAW], 2);
		TextDrawColor(TERRITORIES[total_territories][territory_TEXTDRAW], -76);
		TextDrawSetShadow(TERRITORIES[total_territories][territory_TEXTDRAW], 0);
		TextDrawSetOutline(TERRITORIES[total_territories][territory_TEXTDRAW], 0);
		TextDrawBackgroundColor(TERRITORIES[total_territories][territory_TEXTDRAW], 255);
		TextDrawFont(TERRITORIES[total_territories][territory_TEXTDRAW], 1);
		TextDrawSetProportional(TERRITORIES[total_territories][territory_TEXTDRAW], 1);
		TextDrawSetShadow(TERRITORIES[total_territories][territory_TEXTDRAW], 0);

		total_territories ++;
		db_next_row(Result);
	}

	printf("[debug] Territorios totales: %d", total_territories);
	db_free_result(Result);
	return 1;
}

CheckBoxClub(playerid)
{
	if (IsPlayerInRangeOfPoint(playerid, 1.5, -11.283934, 88.862136, 1101.522705)) return ShowDialog(playerid, DIALOG_BOX_CLUB);
	return 1;
}

SendBoxMessage(const message[], time)
{
	for(new i = 0, j = GetPlayerPoolSize(); i <= j; i++)
	{
		if (IsPlayerConnected(i))
		{
			if (IsPlayerInRangeOfPoint(i, 30.0, -17.344648, 99.261329, 1100.822021))
			{
				ShowPlayerNotification(i, message, time);
			}
		}
	}
	return 1;
}

forward RespawnDynamicActor(actorid, type);
public RespawnDynamicActor(actorid, type)
{
	ClearDynamicActorAnimations(actorid);

	switch(type)
	{
		case ACTOR_TYPE_SHOP:
		{
			SetDynamicActorInvulnerable(actorid, false);
			SetDynamicActorHealth(actorid, 50.0);
			return 1;
		}
	}

	SetDynamicActorInvulnerable(actorid, true);
	SetDynamicActorHealth(actorid, 100.0);
	return 1;
}

CheckRobActor(playerid)
{
	if (GetPlayerInterior(playerid) > 0 && PLAYER_TEMP[playerid][py_INTERIOR_INDEX] > 0)
	{
		if (ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_INTERIOR_TYPE] != INTERIOR_CLUB)
		{
			new ActorTarget = GetPlayerCameraTargetActor(playerid);
			new maxprogress = minrand(5, 20);
			if (ActorTarget != INVALID_ACTOR_ID)
			{
				new keys, updown, leftright;
				new randompay = minrand(30, 300);

				GetPlayerKeys(playerid, keys, updown, leftright);

				if (!PLAYER_WORKS[playerid][WORK_POLICE])
				{
					if (IsPlayerInRangeOfPoint(playerid, 50.0, -198.002197, -1762.759643, 675.768737)) return 0;
					if (!a_TMP[ActorTarget][a_IN_ROB] && GetPlayerWeapon(playerid) >= 22 && GetPlayerWeapon(playerid) <= 33 && keys & KEY_HANDBRAKE)
					{
						new Float:health;
						GetDynamicActorHealth(ActorTarget, health);
						if (health > 0.0)
						{
							if ((gettime() - a_TMP[ActorTarget][a_LAST_ROB]) < 60 * 5) return ShowPlayerMessage(playerid, "~r~Este negocio ya fue robado recientemente", 3);
							{
								if ((gettime() - a_TMP[ActorTarget][a_IN_ROB_PROGRESS]) < 2) return 0;
								
								new str_text[128];
								if (PLAYER_TEMP[playerid][py_ROB_PROGRESS] > maxprogress)
								{
									SetActorChatBubble(ActorTarget, "{E6E6E6}¡Ya le he dado todo!", 0xE6E6E600, 5.0, 3000);
									SetActorRespawnTime(ActorTarget, 15000);
									ApplyActorAnimation(ActorTarget, "ped", "handsup", 4.1, 0, 0, 0, 1, 0);
									ShowPlayerNotification(playerid, "La policía viene en camino, es mejor que corras.", 3);
									PLAYER_TEMP[playerid][py_ROB_PROGRESS] = 0;
									a_TMP[ActorTarget][a_LAST_ROB] = gettime() + 5; // Fix delay
									a_TMP[ActorTarget][a_IN_ROB_PROGRESS] = gettime() + 5;
									PLAYER_TEMP[playerid][py_INITIAL_ROB] = false;
									return 1;
								}

								if (!PLAYER_TEMP[playerid][py_INITIAL_ROB])
								{
									PLAYER_TEMP[playerid][py_INITIAL_ROB] = true;
									ShowPlayerNotification(playerid, "Apuntale al vendedor hasta que te de todo el dinero de la caja.", 4);
									SetActorChatBubble(ActorTarget, "{E6E6E6}¡No me lastime por favor!\n¡Le daré el dinero!", 0xE6E6E600, 5.0, 3000);
									ApplyActorAnimation(ActorTarget, "ped", "handsup", 4.1, 0, 0, 0, 1, 0);
									SetPlayerPoliceSearchLevel(playerid, 1);

									new
										city[45],
										zone[45],
										message[144]
									;

								    GetPointZone(ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_EXT_X], ENTER_EXIT[ PLAYER_TEMP[playerid][py_INTERIOR_INDEX] ][ee_EXT_Y], city, zone);
								    format(message, sizeof message, "~r~%s~w~ esta robando un negocio (%s).", PLAYER_TEMP[playerid][py_RP_NAME], zone);
								    format(PLAYER_TEMP[playerid][py_POLICE_REASON], 32, "Robo");
								    ShowPlayerMessage(playerid, "~b~Has cometido un crimen: Robo", 5);
								    SendPoliceNotification(message, 6);

									a_TMP[ActorTarget][a_IN_ROB_PROGRESS] = gettime();
									return 0;
								}
									
								GivePlayerCash(playerid, randompay);
								PLAYER_TEMP[playerid][py_ROB_PROGRESS] ++;

								ApplyActorAnimation(ActorTarget, "INT_SHOP", "shop_cashier", 4.1, 1, 0, 0, 1, 0);
								a_TMP[ActorTarget][a_IN_ROB] = true;

								format(str_text, sizeof(str_text), "{E6E6E6}* Le da a %s {85DA74}%d$", PLAYER_TEMP[playerid][py_NAME], randompay);
								SetActorChatBubble(ActorTarget, str_text, 0xE6E6E600, 5.0, 3000);


								a_TMP[ActorTarget][a_IN_ROB] = false;
								a_TMP[ActorTarget][a_IN_ROB_PROGRESS] = gettime();
							}
						}
					}
				}
			}
		}
	}
	return 1;
}

CreateInteriorActor(interior_type, world, interior)
{
	if (interior_type == INTERIOR_NO_INFO) return 0;

	new skin, Float:x, Float:y, Float:z, Float:angle;

	switch(interior_type)
	{
		case INTERIOR_BINCO:
		{
			skin      = 119;
			x    = 208.376373;
			y    = -98.703956;
			z    = 1005.257812;
			angle    = 180.0;
		}
		case INTERIOR_SUBURBAN:
		{
			skin      = 191;
			x    = 203.826187;
			y    = -41.667518;
			z    = 1001.804687;
			angle    = 180.0;
		}
		case INTERIOR_PROLAPS:
		{
			skin      = 190;
			x    = 207.139907;
			y    = -127.805473;
			z    = 1003.507812;
			angle    = 180.0;
		}
		case INTERIOR_DIDIER_SACHS:
		{
			skin      = 169;
			x    = 204.275909;
			y    = -157.829010;
			z    = 1000.523437;
			angle    = 180.0;
		}
		case INTERIOR_VICTIM:
		{
			skin      = 217;
			x    = 204.853225;
			y    = -8.764448;
			z    = 1001.210937;
			angle    = 270.0;
		}
		case INTERIOR_ZIP:
		{
			skin      = 211;
			x    = 162.226135;
			y    = -81.191978;
			z    = 1001.804687;
			angle    = 180.0;
		}
		case INTERIOR_247:
		{
			skin      = 184;
			x    = -27.483411;
			y    = -91.628837;
			z    = 1003.546875;
			angle    = 0.0;
		}
		case INTERIOR_PIZZA:
		{
			skin      = 155;
			x    = 375.114501;
			y    = -117.272621;
			z    = 1001.492187;
			angle    = 180.0;
		}
		case INTERIOR_CLUCKIN_BELL:
		{
			skin      = 167;
			x    = 368.652679;
			y    = -4.492218;
			z    = 1001.851562;
			angle    = 180.0;
		}
		case INTERIOR_BURGER_SHOT:
		{
			skin      = 205;
			x    = 376.114227;
			y    = -65.848991;
			z    = 1001.507812;
			angle    = 180.0;
		}
		case INTERIOR_BANK_LS:
		{
			skin      = 59;
			x    = 1407.526489;
			y    = 1321.833496;
			z    = 1501.091918;
			angle    = 180.0;
		}
		case INTERIOR_BANK_SF:
		{
			skin      = 59;
			x    = 1104.802001;
			y    = 1531.275634;
			z    = 1452.475097;
			angle    = 180.0;
		}
		case INTERIOR_BANK_LV:
		{
			skin      = 59;
			x    = 2692.497558;
			y    = -610.933593;
			z    = -71.658203;
			angle    = 90.0;
		}
		case INTERIOR_CITY_HALL_LS:
		{
			skin      = 186;
			x    = -474.572387;
			y    = 287.982879;
			z    = 2004.584960;
			angle    = 0.0;
		}
		case INTERIOR_UNITY_STATION:
		{
			skin      = 184;
			x    = 1489.038818;
			y    = 1305.631591;
			z    = 1093.296386;
			angle    = 270.0;
		}
		case INTERIOR_TRUCK:
		{
			skin      = 127;
			x    = 1297.120117;
			y    = -66.351226;
			z    = 1002.497375;
			angle    = 0.0;
		}
	}

	new actor = CreateDynamicActor(skin, x, y, z, angle, false, 50.0, world, interior);
	Streamer_SetIntData(STREAMER_TYPE_ACTOR, actor, E_STREAMER_EXTRA_ID, ACTOR_TYPE_SHOP);
	return 1;
}

GetFastFoodLocalIndexByIntType(interior_type)
{
	for(new i = 0; i != sizeof Fast_Food_Positions; i ++)
	{
		if (Fast_Food_Positions[i][fast_food_INTERIOR_TYPE] == interior_type) return i;
	}
	return -1;
}

GetClothingShopIndexByIntType(interior_type)
{
	for(new i = 0; i != sizeof Clothing_Shop_Positions; i ++)
	{
		if (Clothing_Shop_Positions[i][clothing_shop_INTERIOR_TYPE] == interior_type) return i;
	}
	return -1;
}

UpdatePlayerPropertyContructor(playerid)
{
	SetPlayerPosEx
	(
		playerid,
		PROPERTY_INTERIORS[ PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO] ][property_INT_X],
		PROPERTY_INTERIORS[ PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO] ][property_INT_Y],
		PROPERTY_INTERIORS[ PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO] ][property_INT_Z],
		PROPERTY_INTERIORS[ PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO] ][property_INT_ANGLE],
		PROPERTY_INTERIORS[ PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO] ][property_INT_INTERIOR],
		0, false, true
	);

	new td_str[45]; format(td_str, sizeof td_str, "Interior:_%d/%d", PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO], sizeof PROPERTY_INTERIORS - 1);
	PlayerTextDrawSetString(playerid, PlayerTextdraws[playerid][ptextdraw_PROPERTY_CONSTRUCTOR][1], td_str);
	SelectTextDrawEx(playerid, 0xe8d08fFF);
	return 1;
}

ExitPlayerPropertyConstructor(playerid)
{
	CancelSelectTextDrawEx(playerid);
	PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_ENABLED] = false;

	SetPlayerPosEx
	(
		playerid,
		PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_X],
		PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_Y],
		PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_Z],
		PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_ANG],
		PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_INT],
		0, false, true
	);

	for(new i = 0; i != 6; i ++) PlayerTextDrawHide(playerid, PlayerTextdraws[playerid][ptextdraw_PROPERTY_CONSTRUCTOR][i]);
	return 1;
}

Create_PlayerPropertyConstructo(playerid)
{
	new slot = GetEmptyPropertySlot();
	if (slot == -1)
	{
	    ShowPlayerMessage(playerid, "~r~No hay mas slots.", 2);
		ExitPlayerPropertyConstructor(playerid);
		return 1;
	}

	PROPERTY_INFO[slot][property_VALID] = true;
	PROPERTY_INFO[slot][property_EXT_X] = PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_X];
	PROPERTY_INFO[slot][property_EXT_Y] = PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_Y];
	PROPERTY_INFO[slot][property_EXT_Z] = PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_Z];
	PROPERTY_INFO[slot][property_EXT_ANGLE] = PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_ANG];
	PROPERTY_INFO[slot][property_EXT_INTERIOR] = PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_EXT_INT];
	PROPERTY_INFO[slot][property_EXT_FREEZE] = false;
	PROPERTY_INFO[slot][property_ID_INTERIOR] = PLAYER_PROPERTY_CONSTRUCTOR[playerid][player_property_creator_INTERIO];

	PROPERTY_INFO[slot][property_SOLD] = false;
	PROPERTY_INFO[slot][property_OWNER_ID] = 0;
	PROPERTY_INFO[slot][property_PRICE] = PLAYER_TEMP[playerid][py_PROPERTY_CINFO][1];
	PROPERTY_INFO[slot][property_LEVEL] = PLAYER_TEMP[playerid][py_PROPERTY_CINFO][0];
	PROPERTY_INFO[slot][property_EXTRA] = PLAYER_TEMP[playerid][py_PROPERTY_CINFO][3];
	PROPERTY_INFO[slot][property_VIP_LEVEL] = PLAYER_TEMP[playerid][py_PROPERTY_CINFO][2];
	PROPERTY_INFO[slot][property_PRICE_BASE] = floatround(floatdiv(PROPERTY_INFO[slot][property_PRICE], MULTIPLIER_PROPERITES));

	if (PROPERTY_INFO[slot][property_EXTRA]) PROPERTY_INFO[slot][property_PRICE] = 0;
	if (PROPERTY_INFO[slot][property_VIP_LEVEL]) PROPERTY_INFO[slot][property_LEVEL] = 1;

	new DBResult:Result, DB_Query[600];
	format
	(
		DB_Query, sizeof DB_Query,
		"\
			INSERT INTO `PROPERTY`\
			(\
				`EXT_X`, `EXT_Y`, `EXT_Z`, `EXT_ANGLE`, `EXT_INTERIOR`, `EXT_FREEZE`, `ID_INTERIOR`\
			)\
			VALUES\
			(\
				'%f', '%f', '%f', '%f', '%d', '%d', '%d'\
			);\
			SELECT MAX(`ID`) FROM `PROPERTY`;\
		",
		PROPERTY_INFO[slot][property_EXT_X], PROPERTY_INFO[slot][property_EXT_Y], PROPERTY_INFO[slot][property_EXT_Z], PROPERTY_INFO[slot][property_EXT_ANGLE], PROPERTY_INFO[slot][property_EXT_INTERIOR], PROPERTY_INFO[slot][property_EXT_FREEZE],
		PROPERTY_INFO[slot][property_ID_INTERIOR]
	);
	Result = db_query(Database, DB_Query);

	if (db_num_rows(Result)) PROPERTY_INFO[slot][property_ID] = db_get_field_int(Result, 0);
	db_free_result(Result);

	DB_Query[0] = EOS;
	format
	(
		DB_Query, sizeof DB_Query,
		"\
			INSERT INTO `PROPERTY_INFO`\
			(\
				`ID_PROPERTY`, `PRICE`, `LEVEL`, `EXTRA`, `VIP_LEVEL`\
			)\
			VALUES\
			(\
				'%d', '%d', '%d', '%d', '%d'\
			);\
		",
		PROPERTY_INFO[slot][property_ID], PROPERTY_INFO[slot][property_PRICE_BASE], PROPERTY_INFO[slot][property_LEVEL], PROPERTY_INFO[slot][property_EXTRA], PROPERTY_INFO[slot][property_VIP_LEVEL]
	);
	db_free_result(db_query(Database, DB_Query));

	new label_str[256], city[45], zone[45];
	GetPointZone(PROPERTY_INFO[slot][property_EXT_X], PROPERTY_INFO[slot][property_EXT_Y], city, zone);
	format(PROPERTY_INFO[slot][property_NAME], 24, "%s (%d)", zone, PROPERTY_INFO[slot][property_ID]);

	if (PROPERTY_INFO[slot][property_VIP_LEVEL])
	{
		if (PROPERTY_INFO[slot][property_EXTRA])
		{
			format
			(
				label_str,
				sizeof label_str,
				"\
					{F4DC42}Se requiere VIP (%d)\n\
					\n\
					"COL_WHITE"Propiedad {5DE141}#%d "COL_WHITE"está en venta\n\n\
					Interior: {5DE141}%d\n\
					"COL_WHITE"Coste: {5DE141}%d "SERVER_COIN"\n\
					"COL_WHITE"Nivel necesario: {5DE141}%d\n\
					"COL_WHITE"Usa {5DE141}/ayuda "COL_WHITE"para ver como adquirirla.\
				", PROPERTY_INFO[slot][property_VIP_LEVEL], PROPERTY_INFO[slot][property_ID], PROPERTY_INFO[slot][property_ID_INTERIOR], PROPERTY_INFO[slot][property_EXTRA], PROPERTY_INFO[slot][property_LEVEL]
			);
		}
		else
		{
			format
			(
				label_str,
				sizeof label_str,
				"\
					{F4DC42}Se requiere VIP (%d)\n\
					\n\
					"COL_WHITE"Propiedad {5DE141}#%d "COL_WHITE"está en venta\n\n\
					Interior: {5DE141}%d\n\
					"COL_WHITE"Precio: {5DE141}%s$\n\
					"COL_WHITE"Nivel: {5DE141}%d\n\
					"COL_WHITE"Usa {5DE141}/ayuda "COL_WHITE"para ver como adquirirla.\
				", PROPERTY_INFO[slot][property_VIP_LEVEL], PROPERTY_INFO[slot][property_ID], PROPERTY_INFO[slot][property_ID_INTERIOR], number_format_thousand(PROPERTY_INFO[slot][property_PRICE]), PROPERTY_INFO[slot][property_LEVEL]
			);
		}
	}
	else
	{
		if (PROPERTY_INFO[slot][property_EXTRA])
		{
			format
			(
				label_str,
				sizeof label_str,
				"\
					"COL_WHITE"Propiedad {5DE141}#%d "COL_WHITE"está en venta\n\n\
					Interior: {5DE141}%d\n\
					"COL_WHITE"Coste: {5DE141}%d "SERVER_COIN"\n\
					"COL_WHITE"Nivel necesario: {5DE141}%d\n\
					"COL_WHITE"Usa {5DE141}/ayuda "COL_WHITE"para ver como adquirirla.\
				", PROPERTY_INFO[slot][property_ID], PROPERTY_INFO[slot][property_ID_INTERIOR], PROPERTY_INFO[slot][property_EXTRA], PROPERTY_INFO[slot][property_LEVEL]
			);
		}
		else
		{
			format
			(
				label_str,
				sizeof label_str,
				"\
					"COL_WHITE"Propiedad {5DE141}#%d "COL_WHITE"está en venta\n\n\
					Interior: {5DE141}%d\n\
					"COL_WHITE"Precio: {5DE141}%s$\n\
					"COL_WHITE"Nivel necesario: {5DE141}%d\n\
					"COL_WHITE"Usa {5DE141}/ayuda "COL_WHITE"para ver como adquirirla.\
				", PROPERTY_INFO[slot][property_ID], PROPERTY_INFO[slot][property_ID_INTERIOR], number_format_thousand(PROPERTY_INFO[slot][property_PRICE]), PROPERTY_INFO[slot][property_LEVEL]
			);
		}
	}

	PROPERTY_INFO[slot][property_EXT_LABEL_ID] = CreateDynamic3DTextLabel(label_str, 0xF0F0F000, PROPERTY_INFO[slot][property_EXT_X], PROPERTY_INFO[slot][property_EXT_Y], PROPERTY_INFO[slot][property_EXT_Z] + 0.25, 5.0, .testlos = true, .worldid = 0, .interiorid = PROPERTY_INFO[slot][property_EXT_INTERIOR]);
	PROPERTY_INFO[slot][property_EXT_PICKUP_ID] = CreateDynamicPickup(1273, 1, PROPERTY_INFO[slot][property_EXT_X], PROPERTY_INFO[slot][property_EXT_Y], PROPERTY_INFO[slot][property_EXT_Z], 0, PROPERTY_INFO[slot][property_EXT_INTERIOR]);
	PROPERTY_INFO[slot][property_INT_PICKUP_ID] = CreateDynamicPickup(19902, 1, PROPERTY_INTERIORS[ PROPERTY_INFO[slot][property_ID_INTERIOR] ][property_INT_X], PROPERTY_INTERIORS[ PROPERTY_INFO[slot][property_ID_INTERIOR] ][property_INT_Y], PROPERTY_INTERIORS[ PROPERTY_INFO[slot][property_ID_INTERIOR] ][property_INT_Z], PROPERTY_INFO[slot][property_ID], PROPERTY_INTERIORS[ PROPERTY_INFO[slot][property_ID_INTERIOR] ][property_INT_INTERIOR]);

	new info[3];
	info[0] = PICKUP_TYPE_PROPERTY;
	info[1] = slot; // Index
	info[2] = 1; // Pickup Interior
	Streamer_SetArrayData(STREAMER_TYPE_PICKUP, PROPERTY_INFO[slot][property_INT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

	info[0] = PICKUP_TYPE_PROPERTY;
	info[1] = slot; // Index
	info[2] = 2; // Pickup Exterior
	Streamer_SetArrayData(STREAMER_TYPE_PICKUP, PROPERTY_INFO[slot][property_EXT_PICKUP_ID], E_STREAMER_EXTRA_ID, info);

	TOTAL_PROPERTIES_LOADED ++;

	SendClientMessageEx(playerid, COLOR_WHITE, "PROPIEDAD %d AÑADIDA.", PROPERTY_INFO[slot][property_ID]);
	SendClientMessageEx(playerid, COLOR_WHITE, "PROPIEDADES: %d/%d", TOTAL_PROPERTIES_LOADED, MAX_PROPERTIES);
	ExitPlayerPropertyConstructor(playerid);
	return 1;
}

GetEmptyPropertySlot()
{
	for(new i = 0; i != MAX_PROPERTIES; i ++)
	{
		if (!PROPERTY_INFO[i][property_VALID]) return i;
	}
	return -1;
}

Set_HARVEST_Checkpoint(playerid)
{
	if (IsValidDynamicRaceCP(PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT]))
	{
		DestroyDynamicRaceCP(PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT]);
		PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT] = INVALID_STREAMER_ID;
	}

	if (PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] == sizeof(HARVEST_CHECKPOINTS) - 1)
	{
		PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT] =    CreateDynamicRaceCP
														(
															1,
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] ][0],
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] ][1],
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] ][2],
															0.0,
															0.0,
															0.0,
															5.0,
															0,
															0,
															playerid
														);
	}
	else
	{
		PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT] =    CreateDynamicRaceCP
														(
															0,
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] ][0],
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] ][1],
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] ][2],
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] + 1 ][0],
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] + 1 ][1],
															HARVEST_CHECKPOINTS[ PLAYER_TEMP[playerid][py_HARVERT_PROCCESS] + 1 ][2],
															5.0,
															0,
															0,
															playerid
														);
	}

	new info[1];
	info[0] = CHECKPOINT_TYPE_HARVEST;
	Streamer_SetArrayData(STREAMER_TYPE_RACE_CP, PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT], E_STREAMER_EXTRA_ID, info);

	return 1;
}

DestroyPlayerCheckpoints(playerid)
{
	if (IsValidDynamic3DTextLabel(PLAYER_TEMP[playerid][py_POLICE_LABEL]))
	{
		DestroyDynamic3DTextLabel(PLAYER_TEMP[playerid][py_POLICE_LABEL]);
		PLAYER_TEMP[playerid][py_POLICE_LABEL] = Text3D:INVALID_STREAMER_ID;
	}

	if (IsValidDynamic3DTextLabel(PLAYER_TEMP[playerid][py_ADMIN_LABEL]))
	{
		DestroyDynamic3DTextLabel(PLAYER_TEMP[playerid][py_ADMIN_LABEL]);
		PLAYER_TEMP[playerid][py_ADMIN_LABEL] = Text3D:INVALID_STREAMER_ID;
	}

	if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_GPS_CHECKPOINT]))
	{
		DestroyDynamicCP(PLAYER_TEMP[playerid][py_GPS_CHECKPOINT]);
    	CancelTracing(playerid);
		PLAYER_TEMP[playerid][py_GPS_CHECKPOINT] = INVALID_STREAMER_ID;
	}

	if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]))
	{
		DestroyDynamicCP(PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT]);
    	CancelTracing(playerid);
		PLAYER_TEMP[playerid][py_TRUCK_CHECKPOINT] = INVALID_STREAMER_ID;
	}

	if (IsValidDynamicCP(PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT]))
	{
		DestroyDynamicCP(PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT]);
    	CancelTracing(playerid);
		PLAYER_TEMP[playerid][py_TRASH_CHECKPOINT] = INVALID_STREAMER_ID;
	}

	if (IsValidDynamicRaceCP(PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT]))
	{
		DestroyDynamicRaceCP(PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT]);
		PLAYER_TEMP[playerid][py_HARVERT_CHECKPOINT] = INVALID_STREAMER_ID;
	}
	return 1;
}

/*bool:IsShootingAnimation(anim)
{
	switch(anim)
	{
		case 220..225, 360..366, 532, 640, 1331..1335, 1365..1369, 1382..1386, 1431, 1434, 1449..1455, 1468, 1469, 1618..1621, 1643..1647: return true;
	}
	return false;
}*/