#define MAX_VEHICLE_OBJECTS_INDEXS 5
enum
{
	VOBJECT_TYPE_OBJECT,
	VOBJECT_TYPE_TEXT,
	VOBJECT_TYPE_COUNTRY_FLAG,
	VOBJECT_TYPE_COUNTRY_PANEL
};

enum e_VEHICLE_OBJECTS
{
	bool:vobject_VALID,
	vobject_TYPE,
	vobject_NAME[32],
	vobject_ID,
	vobject_OBJECT_ID,
	vobject_MODELID,
	Float:vobject_OFFSET[3],
	Float:vobject_ROT[3],
	vobject_ATTACHED,
	vobject_COLORS[MAX_VEHICLE_OBJECTS_INDEXS],

	vobject_text_TEXT[32],
	vobject_text_FONT[24],
	vobject_text_FONT_SIZE,
	vobject_text_BOLD,
	vobject_text_FONT_COLOR
};
new VEHICLE_OBJECTS[MAX_VEHICLES][MAX_SU_VOBJECTS][e_VEHICLE_OBJECTS];

/* Tuning Object System */
enum e_Tuning_Shop_Objects
{
	tuning_object_MODELID,
	tuning_object_NAME[24],
	tuning_object_PRICE
};
new Tuning_Shop_Objects[][e_Tuning_Shop_Objects] =
{
	{1000, "spl_b_mar_m", 1000},
    {1001, "spl_b_bab_m", 1000},
    {1002, "spl_b_bar_m", 1000},
    {1003, "spl_b_mab_m", 1000},
    {1004, "bnt_b_sc_m", 2000},
    {1005, "bnt_b_sc_l", 1000},
    {1007, "wg_l_b_ssk", 1000},
    {1018, "exh_b_ts", 1200},
    {1019, "exh_b_t", 2000},
    {1021, "exh_b_m", 2500},
    {1024, "lgt_b_sspt", 2000},
    {1029, "exh_c_s", 2000},
    {1043, "exh_lr_br2", 3500},
    {1044, "exh_lr_br1", 3000},
    {1047, "wg_l_a_f", 2500},
    {1048, "wg_l_c_f", 2500},
    {1049, "spl_a_f_r", 3000},
    {1050, "spl_c_f_r", 3000},
    {1056, "wg_l_a_st", 2500},
    {1090, "wg_l_a_u", 2500},
    {19306, "kmb_goflag2", 1000},
    {19307, "kmb_goflag3", 1000},
    {18647, "RedNeonTube1", 1000},
    {18648, "BlueNeonTube1", 1000},
    {18649, "GreenNeonTube1", 1000},
    {18650, "YellowNeonTube1", 1000},
    {18651, "PinkNeonTube1", 1000},
    {18652, "WhiteNeonTube1", 1000},
    {18749, "SAMPLogoSmall", 500},
    {19133, "ArrowType4", 1000},
    {19471, "forsale02", 500},
    {19878, "Skateboard1", 800},
    {19314, "bullhorns01", 1000},
    {19078, "TheParrot1", 4000},
    {19917, "CutsceneEngine1", 3000},
    {19893, "LaptopSAMP1", 1000},
    {2768, "CJ_CB_BURG", 1000},
    {19838, "CoffeeCup1", 1000},
    {11736, "MedicCase1", 1000},
    {1247, "bribe", 800},
    {19147, "PinSpotLight5", 1000},
    {19148, "PinSpotLight6", 1000},
    {19149, "PinSpotLight7", 1000},
    {19151, "PinSpotLight9", 1000},
    {19153, "PinSpotLight11", 1000},
    {19580, "Pizza1", 500},
    {2690, "CJ_FIRE_EXT", 1000},
    {19308, "taxi01", 1000},
    {1550, "CJ_MONEY_BAG", 1000},
	{19894, "laptop", 500},
	{19873, "toiletpaperroll1", 300},
	{19874, "soapbar1", 200},
	{19624, "case1", 600},
	{19621, "obj1", 150},
	{19833, "Cow1", 600},
    {19317, "bassguitar01", 1000},
    {19318, "flyingv01", 1000},
    {2232, "MED_SPEAKER_4", 2000},
    {1840, "speaker_2", 2000},
    {2229, "SWANK_SPEAKER", 2000},
	{1025, "wheel_or1", 1000},
	{1073, "wheel_sr6", 1000},
	{1074, "wheel_sr3", 1000},
	{1075, "wheel_sr2", 1000},
	{1076, "wheel_lr4", 1000},
	{1077, "wheel_lr1", 1000},
	{1078, "wheel_lr3", 1000},
	{1079, "wheel_sr1", 1000},
	{1080, "wheel_sr5", 1000},
	{1081, "wheel_sr4", 1000},
	{1082, "wheel_gn1", 1000},
	{1083, "wheel_lr2", 1000},
	{1084, "wheel_lr5", 1000},
	{1085, "wheel_gn2", 1000},
	{1096, "wheel_gn3", 1000},
	{1097, "wheel_gn4", 1000},
	{1098, "wheel_gn5", 1000},
	{19620, "police", 50000}
};

enum Work_Vehicles_Info
{
    bool:work_vehicle_VALID,
    work_vehicle_WORK,
    work_vehicle_EXP,
    bool:work_vehicle_NEED_DUTY
};
new WORK_VEHICLES[MAX_VEHICLES][Work_Vehicles_Info];

new valid_work_vehicle_colors[] = {84, 63, 91, 63, 102, 65, 105, 72, 110, 93, 121, 93, 12, 95, 23, 1};
enum San_Andreas_Vehicles_Info
{
    san_andreas_vehicle_TYPE,
    san_andreas_vehicle_TYPE_IN,
    san_andreas_vehicle_TYPE_IN_EXP,
    san_andreas_vehicle_MODELID,
    Float:san_andreas_vehicle_SPAWN_X,
    Float:san_andreas_vehicle_SPAWN_Y,
    Float:san_andreas_vehicle_SPAWN_Z,
    Float:san_andreas_vehicle_SPAWN_ANGLE,
    san_andreas_vehicle_COLOR_1,
    san_andreas_vehicle_COLOR_2,
    san_andreas_vehicle_vip
};
new San_Andreas_Vehicles[][San_Andreas_Vehicles_Info] =
{
    //Renta
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 436, 1277.651, -1383.604, 13.002, 271.719, -1, -1, 0},
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 436, 1277.534, -1380.565, 13.003, 270.332, -1, -1, 0},
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 436, 1277.523, -1377.541, 13.013, 270.186, -1, -1, 0},
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 436, 1277.562, -1374.903, 13.020, 269.719, -1, -1, 0},
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 436, 1277.572, -1372.109, 13.028, 268.804, -1, -1, 0},
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 436, 1277.637, -1368.964, 13.042, 269.699, -1, -1, 0},
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 436, 1277.657, -1365.789, 13.061, 269.291, -1, -1, 0},
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 436, 1277.617, -1362.276, 13.079, 268.421, -1, -1, 0},
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 527, 1735.3537, -1318.4984, 13.8236, 91.5999, -1, -1, 0}, //Cadrona
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 481, 1738.3095, -1329.1241, 13.2093, 0.0000, -1, -1, 0}, //BMX
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 542, 1735.2344, -1324.0263, 13.8101, 90.1999, -1, -1, 0}, //Clover
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 481, 1734.1485, -1329.1241, 13.2093, 0.0000, -1, -1, 0}, //BMX
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 481, 1736.3491, -1329.1241, 13.2093, 0.0000, -1, -1, 0}, //BMX
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 481, 1731.3981, -1329.1241, 13.2093, 0.0000, -1, -1, 0}, //BMX
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 481, 1729.1182, -1329.1241, 13.2093, 0.0000, -1, -1, 0}, //BMX
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 539, 1542.1032, -1352.4088, 328.7123, 0.0000, -1, -1, 0}, //Vortex
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 481, 1726.6379, -1329.1241, 13.2093, 0.0000, -1, -1, 0}, //BMX
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 527, 1098.8806, -1775.5668, 12.9943, 89.7796, -1, -1, 0}, //Cadrona
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 527, 1098.9241, -1772.5975, 12.9950, 90.2871, -1, -1, 0}, //Cadrona
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 527, 1098.5743, -1766.7537, 12.9988, 91.7078, -1, -1, 0}, //Cadrona
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 527, 1098.9288, -1769.5251, 13.0711, 89.4949, -1, -1, 0}, //Cadrona
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 527, 1098.8194, -1763.5948, 13.0740, 90.3492, -1, -1, 0}, //Cadrona
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 542, 1098.3770, -1757.7982, 12.9892, 89.5291, -1, -1, 0}, //Clover
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 542, 1098.2789, -1751.8315, 13.0714, 92.9002, -1, -1, 0}, //Clover
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 542, 1098.1798, -1760.7475, 13.0637, 92.1603, -1, -1, 0}, //Clover
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 542, 1098.1573, -1754.8460, 13.0560, 89.3085, -1, -1, 0}, //Clover
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 510, 1071.1259, -1775.8271, 12.9393, 358.2413, -1, -1, 0}, //Mountain Bike
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 510, 1070.3161, -1775.8889, 12.9456, 357.1408, -1, -1, 0}, //Mountain Bike
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 510, 1067.4564, -1775.8115, 12.9284, 342.0976, -1, -1, 0}, //Mountain Bike
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 510, 1068.2465, -1775.9460, 12.9255, 357.0927, -1, -1, 0}, //Mountain Bike
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 510, 1069.3990, -1775.9630, 12.9263, 357.5411, -1, -1, 0}, //Mountain Bike
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 510, 1071.8430, -1775.7419, 12.9186, 358.2892, -1, -1, 0}, //Mountain Bike
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 510, 1074.2915, -1775.2633, 12.8711, 358.3530, -1, -1, 0}, //Mountain Bike
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 510, 1072.8282, -1775.4273, 12.9167, 358.3446, -1, -1, 0}, //Mountain Bike
    {VEHICLE_TYPE_RENT, WORK_NONE, 0, 510, 1073.5644, -1775.3420, 12.9274, 358.3515, -1, -1, 0}, //Mountain Bike
    //Camionero
    {VEHICLE_TYPE_WORK, WORK_TRUCK, 0, 498, 2461.737060, -2636.311035, 13.731491, 60.189689, -1, -1, 0},
    {VEHICLE_TYPE_WORK, WORK_TRUCK, 0, 498, 2459.911376, -2627.436767, 13.731758, 60.189689, -1, -1, 0},
    {VEHICLE_TYPE_WORK, WORK_TRUCK, 0, 498, 2460.749267, -2617.059814, 13.727367, 60.189689, -1, -1, 0},
    {VEHICLE_TYPE_WORK, WORK_TRUCK, 0, 498, 2462.090087, -2606.416992, 13.729711, 60.189689, -1, -1, 0},
    {VEHICLE_TYPE_WORK, WORK_TRUCK, 0, 498, 2461.382324, -2596.787109, 13.729124, 60.189689, -1, -1, 0},
    {VEHICLE_TYPE_WORK, WORK_TRUCK, 0, 498, 2498.064941, -2617.590820, 13.718508, 60.189689, -1, -1, 0},
    {VEHICLE_TYPE_WORK, WORK_TRUCK, 0, 498, 2498.016113, -2606.953857, 13.717649, 60.189689, -1, -1, 0},
    {VEHICLE_TYPE_WORK, WORK_TRUCK, 0, 498, 2499.478759, -2599.528320, 13.720164, 60.189689, -1, -1, 0},
    {VEHICLE_TYPE_WORK, WORK_TRUCK, 0, 498, 2498.920410, -2589.597167, 13.719043, 60.189689, -1, -1, 0},
    {VEHICLE_TYPE_WORK, WORK_TRUCK, 0, 498, 2499.0876, -2671.2441, 16.8844, 0.0000, -1, -1, 0},
    {VEHICLE_TYPE_WORK, WORK_TRUCK, 0, 498, 2493.6884, -2671.2441, 16.8844, 0.0000, -1, -1, 0},
    {VEHICLE_TYPE_WORK, WORK_TRUCK, 0, 498, 2488.4882, -2671.2441, 16.8844, 0.0000, -1, -1, 0},
    {VEHICLE_TYPE_WORK, WORK_TRUCK, 0, 498, 2483.3762, -2671.2441, 16.8844, 0.0000, -1, -1, 0},
    //Cosechador
    {VEHICLE_TYPE_WORK, WORK_HARVESTER, 0, 532, -390.604370, -1476.015747, 26.704042, 259.474060, 1, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_HARVESTER, 0, 532, -385.473022, -1464.722900, 26.711814, 227.251434, 1, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_HARVESTER, 0, 532, -372.544342, -1462.451293, 26.736181, 224.972244, 1, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_HARVESTER, 0, 532, -375.785583, -1473.692260, 26.720621, 224.966537, 1, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_HARVESTER, 0, 532, -379.832061, -1484.033203, 26.696950, 223.968917, 1, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_HARVESTER, 0, 532, -389.124328, -1491.877197, 26.187450, 314.527038, 1, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_HARVESTER, 0, 532, -382.092529, -1499.563842, 25.449359, 314.704895, 1, 1, 0},
    //Basurero
    {VEHICLE_TYPE_WORK, WORK_TRASH, 0, 408, 1593.585327, -2171.675292, 14.095251, 271.092346, 26, 26, 0},
    {VEHICLE_TYPE_WORK, WORK_TRASH, 0, 408, 1594.863037, -2165.973144, 14.109066, 264.657806, 26, 26, 0},
    {VEHICLE_TYPE_WORK, WORK_TRASH, 0, 408, 1596.188720, -2159.712158, 14.095103, 267.014160, 26, 26, 0},
    {VEHICLE_TYPE_WORK, WORK_TRASH, 0, 408, 1598.136474, -2152.792236, 14.103152, 262.389495, 26, 26, 0},
    {VEHICLE_TYPE_WORK, WORK_TRASH, 0, 408, 1602.357910, -2143.403808, 14.106391, 213.682922, 26, 26, 0},
    {VEHICLE_TYPE_WORK, WORK_TRASH, 0, 408, 1649.863159, -2169.069335, 14.078960, 89.003150, 26, 26, 0},
    {VEHICLE_TYPE_WORK, WORK_TRASH, 0, 408, 1649.602050, -2161.239746, 14.095094, 86.084152, 26, 26, 0},
    //policia ls
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 497, 1562.0895, -1659.0418, 28.6187, 91.0590, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 497, 1562.7053, -1691.9003, 28.5956, 90.7715, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 596, 1601.9473, -1696.1240, 5.6107, 89.0810, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 596, 1602.1748, -1691.9042, 5.6110, 88.4362, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 596, 1602.0411, -1700.2920, 5.6110, 88.6648, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 596, 1601.8983, -1704.0681, 5.6115, 89.3552, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 596, 1587.3389, -1710.4362, 5.6118, 1.0410, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 596, 1583.4728, -1710.5020, 5.6120, 359.4709, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 6, 402, 1545.2308, -1680.1783, 5.7223, 89.2245, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 11, 411, 1544.4467, -1676.0834, 5.6177, 89.6164, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 1, 599, 1570.1743, -1710.9041, 6.0789, 0.5127, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 1, 599, 1574.3672, -1710.9801, 6.0787, 0.3933, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 1, 523, 1583.7402, -1668.5023, 5.4657, 88.7599, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 1, 523, 1583.7308, -1671.5286, 5.4637, 87.6115, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 1, 523, 1583.8281, -1674.2369, 5.4653, 89.9781, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 9, 427, 1538.5195, -1645.3208, 6.0224, 178.7787, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 9, 427, 1534.8190, -1645.2932, 6.0222, 178.9228, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 11, 601, 1526.7194, -1644.9723, 5.6494, 179.5714, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 596, 1601.9880, -1687.8237, 5.6110, 89.6723, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 596, 1602.2769, -1684.0154, 5.6119, 89.6658, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 596, 1591.4995, -1710.3190, 5.6105, 359.6988, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 596, 1595.5188, -1710.3881, 5.6109, 358.7049, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 11, 528, 1546.5891, -1654.8442, 5.9344, 90.4177, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 11, 528, 1546.4629, -1650.9556, 5.9348, 90.2691, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 11, 601, 1530.5052, -1644.9598, 5.6494, 179.5481, 0, 1, 0},
    //policia sf
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 597, -1588.1722, 749.2943, -5.5779, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 597, -1592.2081, 749.1027, -5.5779, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 597, -1596.2935, 749.4324, -5.5779, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 597, -1600.3527, 749.0949, -5.5779, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 597, -1604.2867, 749.3167, -5.5779, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 597, -1575.0361, 742.6935, -5.5779, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 597, -1574.9946, 738.4707, -5.5779, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 597, -1575.1072, 735.0409, -5.5779, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 597, -1575.0322, 730.9659, -5.5779, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 597, -1575.1212, 722.3821, -5.5779, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 597, -1575.0864, 718.5404, -5.5779, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 599, -1574.7537, 714.1426, -5.1303, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 599, -1574.6227, 710.4202, -5.1303, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 599, -1574.6934, 706.5904, -5.1303, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 597, -1599.5576, 693.3072, -5.5779, 180.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 597, -1608.8636, 693.0085, -5.5779, 180.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 597, -1612.5468, 692.6500, -5.5779, 180.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 11, 411, -1639.4524, 662.1886, -5.5417, -90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 11, 415, -1639.3489, 666.1519, -5.5417, -90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 11, 413, -1639.1108, 669.9014, -5.2635, -90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 11, 601, -1638.7815, 678.3526, -5.4683, -90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 11, 601, -1638.8115, 682.3326, -5.4683, -90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 9, 427, -1628.3209, 691.4453, -5.0293, 180.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 9, 427, -1624.6458, 691.1703, -5.0293, 180.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 9, 427, -1621.0149, 691.4860, -5.0293, 180.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 9, 426, -1639.1274, 658.2158, -5.5682, -90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 1, 523, -1617.3679, 731.1095, -5.6017, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 1, 523, -1615.6661, 731.2083, -5.6017, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 1, 523, -1613.6464, 731.1612, -5.6017, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 1, 523, -1611.4475, 731.4107, -5.6017, 0.0000, 0, 1, 0},
    //Policia lvpd
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 598, 2314.1758, 2475.5225, 3.0620, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 598, 2313.4473, 2480.4548, 3.0620, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 598, 2313.9863, 2470.4392, 3.0620, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 598, 2313.3777, 2466.1509, 3.0620, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 598, 2313.2185, 2460.8066, 3.0620, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 598, 2285.6572, 2474.5803, 3.0066, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 598, 2281.5867, 2475.2078, 3.0066, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 598, 2277.3740, 2475.5874, 3.0066, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 598, 2272.8518, 2475.8105, 3.0066, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 598, 2307.3750, 2431.3274, 2.9947, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 598, 2298.9263, 2431.8225, 2.9947, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 599, 2272.4565, 2431.9678, 3.3194, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 599, 2267.9832, 2431.6877, 3.3194, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 599, 2263.6194, 2431.6626, 3.3194, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 11, 601, 2246.5898, 2431.7930, 3.0092, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 6, 427, 2250.7744, 2431.9976, 3.2946, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 6, 427, 2258.8242, 2431.7910, 3.2946, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 6, 427, 2254.3489, 2432.4753, 3.2946, 0.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 9, 415, 2297.8123, 2451.5508, 3.0484, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 9, 415, 2298.2183, 2455.7683, 3.0484, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 1, 523, 2299.6643, 2459.1206, 2.8170, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 1, 523, 2299.8755, 2460.9136, 2.8170, 90.0000, 0, 1, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 1, 523, 2299.8306, 2463.0632, 2.8170, 90.0000, 0, 1, 0},
    //EJERCITO
    /*{VEHICLE_TYPE_WORK, WORK_POLICE, 5, 563, 407.0349, 2455.8659, 19.6386, 268.3708, 1, 6, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 5, 548, 418.3270, 2536.8161, 18.2189, 359.9979, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 3, 470, 360.7741, 2544.1281, 16.6378, 0.3733, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 3, 470, 356.0309, 2544.5363, 16.7030, 359.2844, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 3, 470, 378.5499, 2544.0383, 16.6009, 359.9999, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 3, 470, 365.2172, 2544.1416, 16.5706, 0.0315, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 3, 470, 369.8030, 2543.9328, 16.6025, 359.9944, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 3, 470, 374.1511, 2543.9294, 16.5565, 359.9999, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 3, 470, 351.3348, 2544.3725, 16.7227, 359.9147, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 3, 470, 382.8216, 2543.8920, 16.5555, 359.9999, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 455, 347.2350, 2532.3708, 17.1620, 359.5530, 61, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 455, 332.8717, 2531.9470, 17.2461, 358.2188, 61, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 455, 338.2587, 2532.4428, 17.2699, 359.4343, 61, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 6, 520, 418.5807, 2480.6047, 17.2129, 86.1988, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 6, 520, 419.1974, 2493.1035, 17.2077, 91.8999, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 6, 432, 323.2878, 2540.7241, 16.8046, 4.1214, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 6, 520, 418.6380, 2505.2890, 17.2051, 91.8998, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 6, 520, 418.3162, 2516.7231, 17.2057, 91.8998, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 511, 290.4755, 2542.2968, 18.2143, 359.9936, 60, 61, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 6, 432, 316.0521, 2540.3840, 16.7888, 5.1738, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 6, 432, 309.0848, 2540.5832, 16.8046, 0.0000, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 568, 255.5951, 2550.1806, 16.6399, 359.9999, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 568, 255.2591, 2537.4445, 16.6353, 0.0000, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 568, 255.7732, 2543.8095, 16.6568, 0.0037, 0, 0, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 424, 274.2642, 2550.1225, 16.4723, 2.8469, 61, 60, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 424, 274.0568, 2544.1689, 16.5148, 355.2498, 61, 60, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 522, 260.7059, 2549.8178, 16.3451, 346.4467, 60, 61, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 424, 273.8152, 2537.0510, 16.5625, 357.7284, 61, 60, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 522, 265.4736, 2550.7290, 16.3836, 357.5233, 60, 61, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 522, 262.9520, 2550.8071, 16.3388, 359.7757, 60, 61, 0},
    {VEHICLE_TYPE_WORK, WORK_POLICE, 4, 522, 268.8313, 2551.4245, 16.3569, 358.3872, 60, 61, 0},*/

    // Pescador
    {VEHICLE_TYPE_WORK, WORK_FISHER, 0, 453, 2112.1623, -84.6228, 0.0383, 22.0205, 1, 7, 0},
    {VEHICLE_TYPE_WORK, WORK_FISHER, 0, 453, 2106.7312, -111.7312, -0.3355, 209.4933, 1, 7, 0},
    {VEHICLE_TYPE_WORK, WORK_FISHER, 0, 453, 2108.3979, -88.5186, -0.2576, 37.4940, 1, 7, 0},
    {VEHICLE_TYPE_WORK, WORK_FISHER, 0, 453, 2104.7770, -91.9776, -0.3716, 37.5332, 1, 7, 0},
    {VEHICLE_TYPE_WORK, WORK_FISHER, 0, 453, 2100.8601, -95.3112, -0.3883, 37.5210, 1, 7, 0},
    {VEHICLE_TYPE_WORK, WORK_FISHER, 0, 453, 2096.0083, -98.9689, -0.3847, 37.5265, 1, 7, 0},
    {VEHICLE_TYPE_WORK, WORK_FISHER, 0, 453, 2112.2666, -108.5957, -0.3203, -144.5012, 1, 7, 0},
    {VEHICLE_TYPE_WORK, WORK_FISHER, 0, 453, 2117.8344, -104.6239, -0.3203, -139.0010, 1, 7, 0},
    {VEHICLE_TYPE_WORK, WORK_FISHER, 0, 453, 2124.2175, -100.6259, -0.3203, -139.0010, 1, 7, 0},
    
    // Family SaintBlood'S
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 457, 1309.3649, 2856.6066, 10.3768, 107.0642, 0, 167, 0}, //Caddy
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 487, 1085.2834, 2796.8344, 15.0859, 269.5137, 0, 167, 0}, //Maverick
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 487, 1085.3878, 2809.4228, 14.9760, 269.5140, 0, 167, 0}, //Maverick
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 457, 1367.7829, 2836.5883, 10.3778, 107.7945, 0, 167, 0}, //Caddy
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 457, 1316.9995, 2833.1354, 10.4181, 104.4197, 0, 167, 0}, //Caddy
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 560, 1530.3963, 2796.2473, 10.5308, 269.0799, 0, 167, 0}, //Sultan
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 560, 1530.5738, 2800.3017, 10.4658, 268.8392, 0, 167, 0}, //Sultan
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 411, 1529.8559, 2822.8405, 10.5033, 272.4335, 0, 167, 0}, //Infernus
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 482, 1529.6152, 2803.9836, 10.8192, 268.2630, 0, 167, 0}, //Burrito
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 482, 1529.7728, 2809.4350, 10.9858, 268.2586, 0, 167, 0}, //Burrito
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 482, 1530.0261, 2818.0288, 10.9915, 268.2581, 0, 167, 0}, //Burrito
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 482, 1529.6575, 2813.6384, 10.8444, 270.7480, 0, 167, 0}, //Burrito
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 411, 1529.7147, 2827.2656, 10.6120, 272.3815, 0, 167, 0}, //Infernus
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 470, 1530.2899, 2831.2770, 10.7037, 268.8200, 0, 167, 0}, //Patriot
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 470, 1528.4799, 2835.9685, 10.8177, 266.4324, 0, 167, 0}, //Patriot
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 461, 1530.8197, 2839.7421, 10.3596, 280.2850, 0, 167, 0}, //PCJ-600
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 461, 1531.4096, 2841.8283, 10.3959, 261.9149, 0, 167, 0}, //PCJ-600
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 428, 1530.2377, 2845.2763, 10.9741, 271.1998, 0, 167, 0}, //Securicar
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 409, 1489.2900, 2843.5915, 10.5647, 0.0653, 0, 167, 0}, //Stretch
    {VEHICLE_TYPE_WORK, WORK_MAFIA, 0, 409, 1494.3277, 2843.5014, 10.6104, 359.9656, 0, 167, 0}, //Stretch
    // Triade di San Andreas
    {VEHICLE_TYPE_WORK, WORK_ENEMY_MAFIA, 0, 579, 2768.649, -1617.026, 10.921, 268.936, 0, 158, 0}, //Huntley
    {VEHICLE_TYPE_WORK, WORK_ENEMY_MAFIA, 0, 579, 2769.019, -1613.867, 10.921, 270.459, 0, 158, 0}, //Huntley
    {VEHICLE_TYPE_WORK, WORK_ENEMY_MAFIA, 0, 579, 2768.706, -1610.527, 10.921, 266.538, 0, 158, 0}, //Huntley
    {VEHICLE_TYPE_WORK, WORK_ENEMY_MAFIA, 0, 405, 2771.095, -1625.986, 10.927, 268.939, 0, 158, 0}, //Sentinel
    {VEHICLE_TYPE_WORK, WORK_ENEMY_MAFIA, 0, 405, 2771.131, -1623.216, 10.927, 270.899, 0, 158, 0}, //Sentinel
    {VEHICLE_TYPE_WORK, WORK_ENEMY_MAFIA, 0, 405, 2771.105, -1620.384, 10.927, 268.939, 0, 158, 0}, //Sentinel
    {VEHICLE_TYPE_WORK, WORK_ENEMY_MAFIA, 0, 521, 2768.000, -1608.008, 10.921, 270.811, 0, 158, 0}, //FCR-900
    {VEHICLE_TYPE_WORK, WORK_ENEMY_MAFIA, 0, 521, 2768.197, -1606.623, 10.921, 270.951, 0, 158, 0}, //FCR-900
    {VEHICLE_TYPE_WORK, WORK_ENEMY_MAFIA, 0, 521, 2768.201, -1605.294, 10.921, 273.471, 0, 158, 0}, //FCR-900
    {VEHICLE_TYPE_WORK, WORK_ENEMY_MAFIA, 0, 521, 2768.131, -1604.183, 10.921, 262.409, 0, 158, 0}, //FCR-900
    {VEHICLE_TYPE_WORK, WORK_ENEMY_MAFIA, 0, 428, 2815.602, -1540.419, 10.921, 178.759, 0, 158, 0}, //Securicar
    {VEHICLE_TYPE_WORK, WORK_ENEMY_MAFIA, 0, 563, 2836.8459, -1526.0520, 23.3332, 268.4948, 0, 158, 0}, //Raindance
    {VEHICLE_TYPE_WORK, WORK_ENEMY_MAFIA, 0, 487, 2834.3073, -1549.4448, 23.4566, 269.0101, 0, 158, 0}, //Maverick
    // Osborn
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 579, -2538.2732, -638.5104, 132.7914, -90.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 579, -2538.2722, -641.6822, 132.7914, -90.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 522, -2539.1340, -644.8869, 132.3923, -90.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 482, -2538.4988, -649.7926, 132.9753, -90.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 428, -2538.3896, -653.4010, 133.0961, -90.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 579, -2538.2935, -635.3489, 132.7914, -90.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 579, -2538.3108, -632.1124, 132.7914, -90.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 560, -2538.9534, -628.1598, 132.4716, -90.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 560, -2530.1001, -643.7878, 132.4717, 0.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 522, -2524.0586, -643.8281, 132.3524, 0.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 522, -2526.9846, -643.7561, 132.3524, 0.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 521, -2535.5217, -602.4193, 132.1022, 180.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 521, -2531.8696, -602.4933, 132.1022, 180.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 560, -2528.0593, -602.1702, 132.2213, 180.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 560, -2524.3132, -602.2142, 132.2213, 180.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 521, -2526.2009, -627.3993, 132.3321, 180.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 521, -2523.9807, -627.4330, 132.3321, 180.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 457, -2505.3975, -659.7274, 138.9362, 0.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 457, -2508.7749, -659.6862, 138.9362, 0.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 457, -2393.1111, -742.6507, 132.7643, 90.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 457, -2416.8835, -588.8335, 132.2879, -145.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 457, -2399.6226, -613.2672, 132.2871, 35.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 493, -2978.6677, -877.2886, 0.0077, 140.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 484, -2959.9651, -890.1926, -0.0190, 140.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 452, -2943.7051, -886.5799, -0.0185, 140.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 454, -2969.0022, -882.8113, -0.0177, 140.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 446, -2953.9661, -898.3783, -0.0108, 140.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 452, -2969.1699, -866.2029, -0.0185, 140.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 487, -2463.6067, -707.4576, 149.5862, -90.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 487, -2462.9429, -671.2291, 149.7262, -90.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 519, -1363.3896, -488.9436, 15.2492, -154.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 593, -1438.7922, -530.8261, 14.7322, -154.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 409, -2510.6765, -619.2047, 132.3098, -90.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 409, -2500.4331, -619.1856, 132.3098, -90.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 593, -1111.7780, -182.0618, 14.6178, 113.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 519, -1113.8134, -200.4334, 15.1298, 48.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 519, -1132.9298, -212.7986, 15.1298, 48.0000, 205, 205, 0},
    {VEHICLE_TYPE_WORK, WORK_OSBORN, 0, 511, -1146.3324, -175.6646, 15.5835, 150.0000, 205, 205, 0},
    //connor
    {VEHICLE_TYPE_WORK, WORK_CONNOR, 0, 579, 397.0081, -1002.4664, 92.2933, 1.9184, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_CONNOR, 0, 579, 392.8450, -1002.5643, 92.2969, 1.5701, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_CONNOR, 0, 579, 388.9948, -1002.5743, 92.2957, 1.1095, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_CONNOR, 0, 521, 387.0183, -996.6669, 91.9242, 272.6028, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_CONNOR, 0, 521, 386.9218, -993.7001, 91.9229, 272.6779, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_CONNOR, 0, 521, 387.1500, -995.2767, 91.9207, 278.2048, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_CONNOR, 0, 521, 386.6924, -992.3752, 91.9075, 272.1091, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_CONNOR, 0, 521, 386.7888, -991.0193, 91.9181, 271.1677, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_CONNOR, 0, 428, 388.1140, -985.3767, 92.4833, 180.7195, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_CONNOR, 0, 482, 392.0581, -984.9958, 92.4803, 178.9301, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_CONNOR, 0, 482, 395.8189, -984.8273, 92.4812, 182.6469, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_CONNOR, 0, 560, 400.2143, -984.4438, 92.0688, 182.7216, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_CONNOR, 0, 560, 404.1344, -984.2847, 92.0601, 179.8677, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_CONNOR, 0, 560, 408.0043, -984.2449, 92.0664, 183.6360, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_CONNOR, 0, 487, 447.9253, -960.5263, 88.7503, 166.9194, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_CONNOR, 0, 487, 423.1604, -954.4913, 88.7512, 165.3443, 0, 1, 0},
    //diviso
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 487, 1187.0557, -2058.9849, 76.7743, 0.0000, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 487, 1186.4268, -2011.4244, 76.7743, 0.0000, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 522, 1253.3352, -2043.9410, 59.3489, 0.0000, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 522, 1251.5930, -2043.8015, 59.3489, 0.0000, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 522, 1249.4722, -2043.8234, 59.3489, 0.0000, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 522, 1247.4406, -2043.7626, 59.3489, 0.0000, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 560, 1275.0579, -2022.7844, 58.6801, 89.8541, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 560, 1274.9276, -2018.4855, 58.6801, 89.8541, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 413, 1256.9177, -2011.8304, 59.4414, 180.3275, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 413, 1250.4512, -2011.1957, 59.7424, 180.3275, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 413, 1246.7472, -2010.2787, 59.7424, 180.3275, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 413, 1261.0398, -2011.6971, 59.4414, 180.3275, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 444, 1275.3461, -2028.3514, 59.1012, 90.7619, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 444, 1275.4916, -2043.8811, 58.9991, 91.1680, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 560, 1271.2743, -2011.2844, 58.6801, 180.0000, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 444, 1275.8252, -2038.9524, 58.9991, 91.1680, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 444, 1275.5260, -2033.9301, 59.1012, 90.7619, 3, 3, 0},
    {VEHICLE_TYPE_WORK, WORK_DIVISO, 0, 560, 1267.1476, -2011.0891, 58.6801, 180.0000, 3, 3, 0},
    // sindacco
    {VEHICLE_TYPE_WORK, WORK_SINDACCO, 0, 409, 661.3567, -1259.9233, 13.1400, 0.0000, 1, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_SINDACCO, 0, 409, 669.0002, -1260.1575, 13.1400, 0.0000, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_SINDACCO, 0, 482, 684.5061, -1234.5444, 15.7017, -61.0000, 1, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_SINDACCO, 0, 482, 680.6313, -1227.6709, 15.6828, -60.0000, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_SINDACCO, 0, 522, 661.9412, -1247.0677, 13.3800, -11.0000, 1, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_SINDACCO, 0, 522, 660.9798, -1251.3203, 13.1000, -11.0000, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_SINDACCO, 0, 522, 670.8344, -1248.6874, 13.4600, -12.0000, 1, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_SINDACCO, 0, 522, 669.9236, -1252.8281, 13.0200, -10.0000, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_SINDACCO, 0, 560, 687.0997, -1223.8762, 15.7630, -60.0000, 1, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_SINDACCO, 0, 560, 691.0170, -1230.5558, 15.7630, -60.0000, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_SINDACCO, 0, 560, 692.8358, -1220.6796, 16.2030, -61.0000, 1, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_SINDACCO, 0, 560, 696.7869, -1227.4058, 16.3773, -60.0000, 0, 1, 0}, 
    {VEHICLE_TYPE_WORK, WORK_SINDACCO, 0, 487, 762.9182, -1180.3394, 28.3112, 0.0000, 1, 1, 0}, 
    // medico
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1178.3592, -1307.1132, 13.9921, 269.3424, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1177.1497, -1340.5240, 14.0583, 267.7389, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1177.3006, -1337.4774, 14.0541, 269.2554, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1178.1733, -1310.3139, 14.0096, 267.6561, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1191.3575, -1295.4772, 13.5318, 1.5553, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1191.9063, -1347.8963, 13.5295, 2.5654, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1191.5485, -1315.9310, 13.5559, 0.7362, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1141.8619, -1294.4260, 13.7328, 1.2849, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1191.7652, -1325.1263, 13.5021, 0.2819, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1146.7989, -1294.7625, 13.7995, 359.1800, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1136.6824, -1310.1545, 13.7511, 358.9764, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1136.7680, -1294.7271, 13.7599, 0.3464, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1147.9570, -1311.5208, 13.7742, 2.2327, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1147.3717, -1347.7252, 13.8199, 179.1260, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1141.9129, -1310.7205, 13.7429, 1.9830, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1140.9035, -1380.3851, 13.9015, 178.2289, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1135.7231, -1339.8988, 13.9399, 357.7536, 1, 198, 0}, //Ambulance
    {VEHICLE_TYPE_WORK, WORK_MEDIC, 0, 416, 1096.2836, -1319.2452, 13.8689, 269.6707, 1, 198, 0} //Ambulance
};