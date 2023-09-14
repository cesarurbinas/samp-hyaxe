static Float:PUMPKIN_POSITIONS[][] =
{
	{1201.5510, -1381.8387, 13.2459, 169.8299},
	{1201.1536, -1345.4445, 13.4003, 359.3750},
	{1201.3386, -1295.0685, 13.3826, 358.7483},
	{1231.9214, -1290.2782, 13.4994, 269.1342},
	{1253.2238, -1303.1219, 13.2013, 198.9468},
	{1251.3732, -1327.8323, 13.1837, 175.7599},
	{1252.0665, -1369.7852, 13.2064, 188.9201},
	{1233.0996, -1371.1244, 13.3824, 76.1190},
	{1585.7820, -1732.8544, 13.3828, 79.0645},
	{1531.5203, -1715.6608, 13.3828, 357.5971},
	{1539.3940, -1676.0413, 13.5469, 345.6903},
	{1534.7567, -1628.6151, 13.3828, 4.4905},
	{1534.7119, -1598.7633, 13.3906, 276.1297},
	{1005.7455, -967.3745, 41.4781, 306.7956},
	{1039.3651, -964.3748, 42.5378, 272.3286},
	{1091.5908, -959.5134, 42.3346, 276.0887},
	{2217.4075, -1165.0704, 25.7266, 155.0458},
	{2487.6836, -1668.3090, 13.3438, 240.2331},
	{2464.8323, -2653.7141, 13.6791, 239.2884},
	{2511.6985, -2631.0115, 13.6442, 286.2888},
	{1822.5807, -1859.3899, 13.4141, 245.8295},
	{327.9432, -1795.7627, 4.2838, 343.2136},
	{223.5688, -1843.6570, 2.9181, 110.6678},
	{-373.6399, -1470.2950, 25.2283, 68.7713},
	{-377.5725, -1421.2704, 25.2651, 358.5337},
	{674.9318, -1237.6261, 14.5530, 297.1113},
	{731.6790, -1192.9286, 19.2068, 317.1225},
	{2356.3120, -1042.9607, 54.1484, 9.0887},
	{2225.9824, -1339.0789, 23.5173, 64.4879},
	{2455.1943, -1465.2347, 29.5316, 331.3669},
	{2809.9270, -1546.9089, 10.9272, 201.5999},
	{2786.3774, -1613.1483, 10.9219, 335.3711},
	{2889.3281, -1165.3051, 11.3707, 352.7437},
	{1793.0708, -1066.9917, 24.2438, 88.3436},
	{1674.1914, -1081.6759, 24.8879, 276.4435},
	{1580.2517, -1027.7449, 25.0031, 233.7436}
};

HalloweenMap()
{
	new
		g_Object[259],
		g_Actor[7]
	;

	g_Object[1] = CreateObject(19464, 945.0391, -1103.3094, 28.6473, 0.0000, 0.0000, -179.9998); //wall104
	SetObjectMaterialText(g_Object[1], "HALLOWEEN", 0, OBJECT_MATERIAL_SIZE_256x128, "Arial Black", 50, 1, 0xFFFF4500, 0x00000000, 0);

	g_Object[5] = CreateObject(19862, 944.9077, -1102.3990, 32.9808, 0.0000, 0.0000, 90.0998); //MIHouse1GarageDoor2
	SetObjectMaterialText(g_Object[5], "FELIZ", 0, OBJECT_MATERIAL_SIZE_256x64, "Arial Black", 68, 1, 0xFFFFA500, 0x00000000, 0);

	g_Object[0] = CreateDynamicObject(18647, 817.7503, -1110.0754, 27.4468, 0.0000, 0.0000, -90.5998); //RedNeonTube1
	g_Object[2] = CreateDynamicObject(3092, 822.8123, -1103.0003, 29.9550, 0.0000, 0.0000, -88.0000); //dead_tied_cop
	g_Object[3] = CreateDynamicObject(3499, 944.9188, -1103.0672, 33.1940, 89.8999, 0.0000, 0.0000); //wdpillar02_lvs
	SetDynamicObjectMaterial(g_Object[3], 0, 5108, "docks2_las2", "sjmndukwal2", 0xFFDC143C);
	g_Object[4] = CreateDynamicObject(19864, 944.8378, -1103.4831, 31.3784, 0.0000, 0.0000, 90.0000); //MIHouse1GarageDoor4
	SetDynamicObjectMaterial(g_Object[4], 0, -1, "none", "none", 0xFF000000);
	g_Object[6] = CreateDynamicObject(19528, 814.5880, -1103.2961, 26.4461, 154.3997, 96.0998, 90.1997); //WitchesHat1
	g_Object[7] = CreateDynamicObject(19864, 944.8978, -1102.8928, 31.3784, 0.0000, 0.0000, 90.0000); //MIHouse1GarageDoor4
	SetDynamicObjectMaterial(g_Object[7], 0, -1, "none", "none", 0xFF000000);
	g_Object[8] = CreateDynamicObject(19864, 944.8978, -1103.9532, 31.3784, 0.0000, 0.0000, 90.0000); //MIHouse1GarageDoor4
	SetDynamicObjectMaterial(g_Object[8], 0, -1, "none", "none", 0xFF000000);
	g_Object[9] = CreateDynamicObject(6865, 822.6328, -1115.4333, 27.3455, 11.5999, -12.0000, 139.3000); //steerskull
	g_Object[10] = CreateDynamicObject(18647, 817.9901, -1110.0782, 27.4468, 0.0000, 0.0000, -90.5998); //RedNeonTube1
	g_Object[11] = CreateDynamicObject(18647, 815.9904, -1110.0581, 27.4468, 0.0000, 0.0000, -90.5998); //RedNeonTube1
	g_Object[12] = CreateDynamicObject(18647, 813.9008, -1110.0366, 27.4468, 0.0000, 0.0000, -90.5998); //RedNeonTube1
	g_Object[13] = CreateDynamicObject(18647, 811.8010, -1110.0152, 27.4468, 0.0000, 0.0000, -90.5998); //RedNeonTube1
	g_Object[14] = CreateDynamicObject(18647, 810.4622, -1110.0019, 27.4468, 0.0000, 0.0000, -90.5998); //RedNeonTube1
	g_Object[15] = CreateDynamicObject(18647, 809.6469, -1108.9034, 27.4468, 0.0000, 0.0000, 179.5001); //RedNeonTube1
	g_Object[16] = CreateDynamicObject(18647, 809.6676, -1106.5428, 27.4468, 0.0000, 0.0000, 179.5001); //RedNeonTube1
	g_Object[17] = CreateDynamicObject(18647, 809.6875, -1104.2727, 27.4468, 0.0000, 0.0000, 179.5001); //RedNeonTube1
	g_Object[18] = CreateDynamicObject(18647, 809.7081, -1101.9228, 27.4468, 0.0000, 0.0000, 179.5001); //RedNeonTube1
	g_Object[19] = CreateDynamicObject(18647, 809.6787, -1097.6523, 27.4468, 0.0000, 0.0000, -179.9996); //RedNeonTube1
	g_Object[20] = CreateDynamicObject(18647, 809.6787, -1095.3829, 27.4468, 0.0000, 0.0000, -179.9996); //RedNeonTube1
	g_Object[21] = CreateDynamicObject(18647, 809.6787, -1093.1131, 27.4468, 0.0000, 0.0000, -179.9996); //RedNeonTube1
	g_Object[22] = CreateDynamicObject(18647, 809.6787, -1092.0024, 27.4468, 0.0000, 0.0000, -179.9996); //RedNeonTube1
	g_Object[23] = CreateDynamicObject(18647, 811.3328, -1091.1029, 27.4468, 0.0000, 0.0000, 90.0000); //RedNeonTube1
	g_Object[24] = CreateDynamicObject(18647, 813.6030, -1091.1029, 27.4468, 0.0000, 0.0000, 90.0000); //RedNeonTube1
	g_Object[25] = CreateDynamicObject(18647, 811.0125, -1091.1029, 27.4468, 0.0000, 0.0000, 90.0000); //RedNeonTube1
	g_Object[26] = CreateDynamicObject(18647, 815.8024, -1091.0727, 27.4468, 0.0000, 0.0000, 90.0000); //RedNeonTube1
	g_Object[27] = CreateDynamicObject(18647, 817.9921, -1091.0727, 27.4468, 0.0000, 0.0000, 90.0000); //RedNeonTube1
	g_Object[28] = CreateDynamicObject(18647, 820.3020, -1091.0727, 27.4468, 0.0000, 0.0000, 90.0000); //RedNeonTube1
	g_Object[29] = CreateDynamicObject(18647, 821.3394, -1092.5288, 27.4468, 0.0000, 0.0000, 0.1001); //RedNeonTube1
	g_Object[30] = CreateDynamicObject(18647, 821.3477, -1097.0091, 27.4468, 0.0000, 0.0000, 0.1001); //RedNeonTube1
	g_Object[31] = CreateDynamicObject(19274, 816.4686, -1106.0831, 26.5951, -32.7999, -88.5000, -35.9999); //Hair5
	g_Object[32] = CreateDynamicObject(3528, 823.7694, -1107.5603, 27.8481, 0.0000, 0.0000, 12.8999); //vgsEdragon
	g_Object[33] = CreateDynamicObject(895, 881.9837, -1097.5952, 23.2402, 0.0000, 0.0000, 0.0000); //Elmweesm_PO
	g_Object[34] = CreateDynamicObject(19320, 810.8771, -1102.2647, 26.1864, 0.0000, 0.0000, -153.5999); //pumpkin01
	g_Object[35] = CreateDynamicObject(19320, 818.5678, -1108.6717, 26.1864, 0.0000, 0.0000, 140.2000); //pumpkin01
	g_Object[36] = CreateDynamicObject(894, 842.8206, -1108.6411, 23.1746, 0.0000, 0.0000, 0.0000); //Elmsparsesm_PO
	g_Object[37] = CreateDynamicObject(894, 867.4843, -1090.7364, 23.1947, 0.0000, 0.0000, 1.6999); //Elmsparsesm_PO
	g_Object[38] = CreateDynamicObject(894, 886.4439, -1080.6595, 23.1947, 0.0000, 0.0000, 1.6999); //Elmsparsesm_PO
	g_Object[39] = CreateDynamicObject(894, 877.0039, -1106.7318, 23.1947, 0.0000, 0.0000, 1.6999); //Elmsparsesm_PO
	g_Object[40] = CreateDynamicObject(894, 884.9702, -1094.0810, 23.1947, 0.0000, 0.0000, -32.2000); //Elmsparsesm_PO
	g_Object[41] = CreateDynamicObject(894, 866.4981, -1107.0312, 23.1431, 0.0000, 0.0000, -76.4000); //Elmsparsesm_PO
	g_Object[42] = CreateDynamicObject(895, 876.7545, -1089.9355, 23.2402, 0.0000, 0.0000, -107.5998); //Elmweesm_PO
	g_Object[43] = CreateDynamicObject(895, 916.3726, -1091.1739, 23.2402, 0.0000, 0.0000, -51.1999); //Elmweesm_PO
	g_Object[44] = CreateDynamicObject(894, 832.4829, -1113.8717, 23.1431, 0.0000, 0.0000, -76.4000); //Elmsparsesm_PO
	g_Object[45] = CreateDynamicObject(19320, 873.0874, -1116.5992, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[46] = CreateDynamicObject(19320, 850.4973, -1125.2995, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[47] = CreateDynamicObject(19320, 846.2172, -1113.1682, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[48] = CreateDynamicObject(19320, 827.9666, -1093.7174, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[49] = CreateDynamicObject(19320, 864.1165, -1088.5782, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[50] = CreateDynamicObject(19320, 859.8566, -1088.5782, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[51] = CreateDynamicObject(19320, 854.1563, -1090.6484, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[52] = CreateDynamicObject(19320, 830.9868, -1098.8381, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[53] = CreateDynamicObject(19320, 875.3065, -1096.8282, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[54] = CreateDynamicObject(19320, 874.1563, -1091.5687, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[55] = CreateDynamicObject(19320, 871.1663, -1084.0483, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[56] = CreateDynamicObject(19320, 862.7066, -1082.6385, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[57] = CreateDynamicObject(19320, 883.4365, -1083.5792, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[58] = CreateDynamicObject(19320, 883.4365, -1076.7181, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[59] = CreateDynamicObject(19320, 875.3068, -1076.7181, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[60] = CreateDynamicObject(19320, 899.0767, -1089.0382, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[61] = CreateDynamicObject(19320, 913.3867, -1091.8684, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[62] = CreateDynamicObject(19320, 907.3966, -1096.9482, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[63] = CreateDynamicObject(19320, 920.2166, -1099.3789, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[64] = CreateDynamicObject(19320, 921.4166, -1091.5688, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[65] = CreateDynamicObject(19320, 938.1964, -1113.1892, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[66] = CreateDynamicObject(19320, 938.1964, -1107.6793, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[67] = CreateDynamicObject(19320, 944.5764, -1121.1794, 23.2266, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[68] = CreateDynamicObject(19320, 947.0064, -1117.0793, 23.2066, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[69] = CreateDynamicObject(19320, 918.9462, -1117.0793, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[70] = CreateDynamicObject(19320, 911.0961, -1108.7193, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[71] = CreateDynamicObject(19320, 898.0565, -1126.8393, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[72] = CreateDynamicObject(19320, 884.0363, -1104.6993, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[73] = CreateDynamicObject(19320, 886.8364, -1088.9593, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[74] = CreateDynamicObject(19320, 896.7459, -1061.1097, 24.2166, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[75] = CreateDynamicObject(19320, 875.3256, -1066.8392, 23.9867, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[76] = CreateDynamicObject(19527, 925.0175, -1093.4387, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[77] = CreateDynamicObject(19527, 913.8175, -1097.6488, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[78] = CreateDynamicObject(19527, 903.6171, -1091.8686, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[79] = CreateDynamicObject(19527, 883.9464, -1091.3188, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[80] = CreateDynamicObject(19527, 882.4464, -1080.9991, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[81] = CreateDynamicObject(19527, 869.0665, -1090.5399, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[82] = CreateDynamicObject(19527, 883.9968, -1098.9300, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[83] = CreateDynamicObject(19527, 837.6364, -1089.9189, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[84] = CreateDynamicObject(19527, 844.5761, -1116.4189, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[85] = CreateDynamicObject(19527, 860.0360, -1121.9394, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[86] = CreateDynamicObject(19527, 881.1359, -1107.3979, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[87] = CreateDynamicObject(19079, 818.7841, -1107.2392, 26.0060, -5.2999, -89.3000, 0.8999); //TheParrot2
	g_Object[88] = CreateDynamicObject(3524, 907.3853, -1105.5782, 25.8917, 0.0000, 0.0000, 107.2997); //skullpillar01_lvs
	g_Object[89] = CreateDynamicObject(3524, 907.2174, -1098.2468, 25.8917, 0.0000, 0.0000, 62.4999); //skullpillar01_lvs
	g_Object[90] = CreateDynamicObject(3524, 878.3098, -1091.1457, 25.8917, 0.0000, 0.0000, 4.8997); //skullpillar01_lvs
	g_Object[91] = CreateDynamicObject(3524, 861.0869, -1117.0124, 25.8917, 0.0000, 0.0000, -128.3000); //skullpillar01_lvs
	g_Object[92] = CreateDynamicObject(3524, 843.5059, -1091.1124, 25.8917, 0.0000, 0.0000, -13.5000); //skullpillar01_lvs
	g_Object[93] = CreateDynamicObject(3524, 837.2036, -1118.9895, 25.8917, 0.0000, 0.0000, 118.4999); //skullpillar01_lvs
	g_Object[94] = CreateDynamicObject(890, 935.1220, -1109.6975, 23.3369, 0.0000, 0.0000, 109.6997); //Elmred_PO
	g_Object[95] = CreateDynamicObject(3533, 944.9133, -1107.1910, 27.5188, 0.0000, 0.0000, 0.0000); //trdpillar01
	g_Object[96] = CreateDynamicObject(3533, 944.9133, -1099.4704, 27.5188, 0.0000, 0.0000, 0.0000); //trdpillar01
	g_Object[97] = CreateDynamicObject(19864, 944.8878, -1103.4033, 32.6384, 0.0000, 0.0000, 90.0000); //MIHouse1GarageDoor4
	SetDynamicObjectMaterial(g_Object[97], 0, -1, "none", "none", 0xFF000000);
	g_Object[98] = CreateDynamicObject(18647, 821.8685, -1102.8303, 27.4468, 0.0000, 0.0000, 0.0000); //RedNeonTube1
	g_Object[99] = CreateDynamicObject(19864, 944.8378, -1103.4831, 31.3784, 0.0000, 0.0000, 90.0000); //MIHouse1GarageDoor4
	SetDynamicObjectMaterial(g_Object[99], 0, -1, "none", "none", 0xFF000000);
	
	g_Object[100] = CreateObject(19862, 944.9077, -1102.3990, 32.9808, 0.0000, 0.0000, 90.0998); //MIHouse1GarageDoor2
	SetObjectMaterialText(g_Object[100], "FELIZ", 0, OBJECT_MATERIAL_SIZE_256x64, "Arial Black", 68, 1, 0xFFFFA500, 0x00000000, 0);
	
	g_Object[101] = CreateDynamicObject(19864, 944.8978, -1102.8928, 31.3784, 0.0000, 0.0000, 90.0000); //MIHouse1GarageDoor4
	SetDynamicObjectMaterial(g_Object[101], 0, -1, "none", "none", 0xFF000000);
	g_Object[102] = CreateDynamicObject(19864, 944.8978, -1103.9532, 31.3784, 0.0000, 0.0000, 90.0000); //MIHouse1GarageDoor4
	SetDynamicObjectMaterial(g_Object[102], 0, -1, "none", "none", 0xFF000000);
	g_Object[103] = CreateDynamicObject(11704, 822.0311, -1103.0135, 27.9482, 0.0000, 0.0000, 91.0000); //BDupsMask1
	g_Object[104] = CreateDynamicObject(19527, 815.9694, -1103.2954, 24.7756, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[105] = CreateDynamicObject(19626, 822.6420, -1101.0915, 25.5816, -14.0999, 0.0000, 93.8000); //Spade1
	g_Object[106] = CreateDynamicObject(19079, 813.1035, -1107.3286, 25.9953, -5.4998, -89.0000, -50.7000); //TheParrot2
	g_Object[107] = CreateDynamicObject(6865, 822.6328, -1115.4333, 27.3455, 11.5999, -12.0000, 139.3000); //steerskull
	g_Object[108] = CreateDynamicObject(2589, 816.0169, -1108.0782, 30.9715, 0.0000, 0.0000, 0.0000); //ab_carcass
	g_Object[109] = CreateDynamicObject(18647, 821.8685, -1105.1612, 27.4468, 0.0000, 0.0000, 0.0000); //RedNeonTube1
	g_Object[110] = CreateDynamicObject(18647, 821.8685, -1107.4525, 27.4468, 0.0000, 0.0000, 0.0000); //RedNeonTube1
	g_Object[111] = CreateDynamicObject(18647, 821.8685, -1109.4929, 27.4468, 0.0000, 0.0000, 0.0000); //RedNeonTube1
	g_Object[112] = CreateDynamicObject(18647, 820.2199, -1110.1013, 27.4468, 0.0000, 0.0000, -90.5998); //RedNeonTube1
	g_Object[113] = CreateDynamicObject(18647, 815.9904, -1110.0581, 27.4468, 0.0000, 0.0000, -90.5998); //RedNeonTube1
	g_Object[114] = CreateDynamicObject(18647, 813.9008, -1110.0366, 27.4468, 0.0000, 0.0000, -90.5998); //RedNeonTube1
	g_Object[115] = CreateDynamicObject(18647, 811.8010, -1110.0152, 27.4468, 0.0000, 0.0000, -90.5998); //RedNeonTube1
	g_Object[116] = CreateDynamicObject(18647, 810.4622, -1110.0019, 27.4468, 0.0000, 0.0000, -90.5998); //RedNeonTube1
	g_Object[117] = CreateDynamicObject(18647, 809.6469, -1108.9034, 27.4468, 0.0000, 0.0000, 179.5001); //RedNeonTube1
	g_Object[118] = CreateDynamicObject(18647, 809.6875, -1104.2727, 27.4468, 0.0000, 0.0000, 179.5001); //RedNeonTube1
	g_Object[119] = CreateDynamicObject(18647, 809.7081, -1101.9228, 27.4468, 0.0000, 0.0000, 179.5001); //RedNeonTube1
	g_Object[120] = CreateDynamicObject(18647, 809.6967, -1099.8635, 27.4468, 0.0000, 0.0000, 179.7001); //RedNeonTube1
	g_Object[121] = CreateDynamicObject(18647, 809.6787, -1097.6523, 27.4468, 0.0000, 0.0000, -179.9996); //RedNeonTube1
	g_Object[122] = CreateDynamicObject(18647, 809.6787, -1095.3829, 27.4468, 0.0000, 0.0000, -179.9996); //RedNeonTube1
	g_Object[123] = CreateDynamicObject(18647, 809.6787, -1093.1131, 27.4468, 0.0000, 0.0000, -179.9996); //RedNeonTube1
	g_Object[124] = CreateDynamicObject(18647, 809.6787, -1092.0024, 27.4468, 0.0000, 0.0000, -179.9996); //RedNeonTube1
	g_Object[125] = CreateDynamicObject(18647, 811.3328, -1091.1029, 27.4468, 0.0000, 0.0000, 90.0000); //RedNeonTube1
	g_Object[126] = CreateDynamicObject(18647, 813.6030, -1091.1029, 27.4468, 0.0000, 0.0000, 90.0000); //RedNeonTube1
	g_Object[127] = CreateDynamicObject(18647, 811.0125, -1091.1029, 27.4468, 0.0000, 0.0000, 90.0000); //RedNeonTube1
	g_Object[128] = CreateDynamicObject(18647, 815.8024, -1091.0727, 27.4468, 0.0000, 0.0000, 90.0000); //RedNeonTube1
	g_Object[129] = CreateDynamicObject(18647, 817.9921, -1091.0727, 27.4468, 0.0000, 0.0000, 90.0000); //RedNeonTube1
	g_Object[130] = CreateDynamicObject(18647, 820.3020, -1091.0727, 27.4468, 0.0000, 0.0000, 90.0000); //RedNeonTube1
	g_Object[131] = CreateDynamicObject(18647, 821.3394, -1092.5288, 27.4468, 0.0000, 0.0000, 0.1001); //RedNeonTube1
	g_Object[132] = CreateDynamicObject(18647, 821.3438, -1094.8586, 27.4468, 0.0000, 0.0000, 0.1001); //RedNeonTube1
	g_Object[133] = CreateDynamicObject(18647, 821.3519, -1099.2590, 27.4468, 0.0000, 0.0000, 0.1001); //RedNeonTube1
	g_Object[134] = CreateDynamicObject(18647, 821.3527, -1099.8990, 27.4468, 0.0000, 0.0000, 0.1001); //RedNeonTube1
	g_Object[135] = CreateDynamicObject(3525, 822.6621, -1104.8656, 26.8638, 0.0000, 0.0000, 99.5000); //exbrtorch01
	g_Object[136] = CreateDynamicObject(6865, 822.7589, -1090.4277, 26.9622, 11.5999, -12.0000, 131.9001); //steerskull
	g_Object[137] = CreateDynamicObject(19274, 816.4686, -1106.0831, 26.5951, -32.7999, -88.5000, -35.9999); //Hair5
	g_Object[138] = CreateDynamicObject(3525, 822.6483, -1101.2832, 26.8638, 0.0000, 0.0000, 83.1997); //exbrtorch01
	g_Object[139] = CreateDynamicObject(3528, 823.7847, -1099.2508, 27.6082, 0.0000, 0.0000, -17.7999); //vgsEdragon
	g_Object[140] = CreateDynamicObject(18963, 815.5991, -1099.9863, 26.4137, -6.1999, 0.0000, -52.4000); //CJElvisHead
	g_Object[141] = CreateDynamicObject(18963, 815.3610, -1100.1694, 26.4137, 11.3000, 0.0000, -52.4000); //CJElvisHead
	g_Object[142] = CreateDynamicObject(895, 881.9837, -1097.5952, 23.2402, 0.0000, 0.0000, 0.0000); //Elmweesm_PO
	g_Object[143] = CreateDynamicObject(19086, 814.6621, -1093.2159, 25.7194, 0.0000, -7.1999, -177.7998); //ChainsawDildo1
	g_Object[144] = CreateDynamicObject(19137, 819.2562, -1094.6136, 26.6184, 172.2001, 90.9000, -1.9996); //CluckinBellHat1
	g_Object[145] = CreateDynamicObject(894, 842.8206, -1108.6411, 23.1746, 0.0000, 0.0000, 0.0000); //Elmsparsesm_PO
	g_Object[146] = CreateDynamicObject(894, 852.0805, -1097.7827, 23.1947, 0.0000, 0.0000, -128.6999); //Elmsparsesm_PO
	g_Object[147] = CreateDynamicObject(894, 857.8203, -1107.2602, 23.1947, 0.0000, 0.0000, 121.1996); //Elmsparsesm_PO
	g_Object[148] = CreateDynamicObject(894, 867.6840, -1097.4641, 23.1947, 0.0000, 0.0000, 1.6999); //Elmsparsesm_PO
	g_Object[149] = CreateDynamicObject(894, 867.4843, -1090.7364, 23.1947, 0.0000, 0.0000, 1.6999); //Elmsparsesm_PO
	g_Object[150] = CreateDynamicObject(894, 886.4439, -1080.6595, 23.1947, 0.0000, 0.0000, 1.6999); //Elmsparsesm_PO
	g_Object[151] = CreateDynamicObject(894, 877.0039, -1106.7318, 23.1947, 0.0000, 0.0000, 1.6999); //Elmsparsesm_PO
	g_Object[152] = CreateDynamicObject(894, 884.9702, -1094.0810, 23.1947, 0.0000, 0.0000, -32.2000); //Elmsparsesm_PO
	g_Object[153] = CreateDynamicObject(894, 866.4981, -1107.0312, 23.1431, 0.0000, 0.0000, -76.4000); //Elmsparsesm_PO
	g_Object[154] = CreateDynamicObject(895, 876.7545, -1089.9355, 23.2402, 0.0000, 0.0000, -107.5998); //Elmweesm_PO
	g_Object[155] = CreateDynamicObject(895, 916.3726, -1091.1739, 23.2402, 0.0000, 0.0000, -51.1999); //Elmweesm_PO
	g_Object[156] = CreateDynamicObject(895, 939.3828, -1109.4359, 23.2402, 0.0000, 0.0000, -51.1999); //Elmweesm_PO
	g_Object[157] = CreateDynamicObject(895, 930.2514, -1096.3050, 23.2402, 0.0000, 0.0000, 156.5000); //Elmweesm_PO
	g_Object[158] = CreateDynamicObject(708, 873.6198, -1091.5107, 23.2541, 0.0000, 0.0000, 0.0000); //sm_veg_tree4_vbig
	g_Object[159] = CreateDynamicObject(894, 832.4829, -1113.8717, 23.1431, 0.0000, 0.0000, -76.4000); //Elmsparsesm_PO
	g_Object[160] = CreateDynamicObject(19527, 811.1295, -1095.9056, 24.7756, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[161] = CreateDynamicObject(19320, 873.0874, -1107.4897, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[162] = CreateDynamicObject(19320, 856.1574, -1116.5992, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[163] = CreateDynamicObject(19320, 861.6975, -1118.4897, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[164] = CreateDynamicObject(19320, 850.4973, -1125.2995, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[165] = CreateDynamicObject(19320, 846.2172, -1113.1682, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[166] = CreateDynamicObject(19320, 834.3872, -1116.1982, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[167] = CreateDynamicObject(19320, 834.3872, -1123.7878, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[168] = CreateDynamicObject(19320, 834.3872, -1106.5273, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[169] = CreateDynamicObject(19320, 847.7974, -1106.5273, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[170] = CreateDynamicObject(19320, 853.6574, -1109.5672, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[171] = CreateDynamicObject(19320, 858.7069, -1107.4874, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[172] = CreateDynamicObject(19320, 857.8670, -1096.9471, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[173] = CreateDynamicObject(19320, 845.9569, -1099.0976, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[174] = CreateDynamicObject(19320, 839.8867, -1093.8175, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[175] = CreateDynamicObject(19320, 846.5368, -1090.9072, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[176] = CreateDynamicObject(19320, 825.3767, -1086.3275, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[177] = CreateDynamicObject(19320, 864.1165, -1088.5782, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[178] = CreateDynamicObject(19320, 859.8566, -1088.5782, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[179] = CreateDynamicObject(19320, 854.1563, -1098.8381, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[180] = CreateDynamicObject(19320, 830.9868, -1098.8381, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[181] = CreateDynamicObject(19320, 867.6267, -1098.8381, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[182] = CreateDynamicObject(19320, 875.3065, -1096.8282, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[183] = CreateDynamicObject(19320, 874.1563, -1091.5687, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[184] = CreateDynamicObject(19320, 866.8665, -1079.6583, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[185] = CreateDynamicObject(19320, 875.7365, -1081.3686, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[186] = CreateDynamicObject(19320, 875.3068, -1076.7181, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[187] = CreateDynamicObject(19320, 901.7968, -1081.4182, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[188] = CreateDynamicObject(19320, 899.0767, -1089.0382, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[189] = CreateDynamicObject(19320, 913.3867, -1091.8684, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[190] = CreateDynamicObject(19320, 907.3966, -1080.9681, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[191] = CreateDynamicObject(19320, 907.3966, -1096.9482, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[192] = CreateDynamicObject(19320, 928.6867, -1092.3780, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[193] = CreateDynamicObject(19320, 920.2166, -1099.3789, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[194] = CreateDynamicObject(19320, 921.4166, -1091.5688, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[195] = CreateDynamicObject(19320, 923.6267, -1110.2888, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[196] = CreateDynamicObject(19320, 921.0667, -1113.1892, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[197] = CreateDynamicObject(19320, 946.6666, -1112.1998, 23.2866, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[198] = CreateDynamicObject(19320, 909.4362, -1115.8487, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[199] = CreateDynamicObject(19320, 918.3162, -1127.2795, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[200] = CreateDynamicObject(19320, 904.0263, -1127.2795, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[201] = CreateDynamicObject(19320, 909.1862, -1127.2795, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[202] = CreateDynamicObject(19320, 893.6364, -1128.3198, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[203] = CreateDynamicObject(19320, 898.0565, -1126.8393, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[204] = CreateDynamicObject(19320, 898.0565, -1114.9393, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[205] = CreateDynamicObject(19320, 904.2365, -1113.6385, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[206] = CreateDynamicObject(19320, 890.4962, -1116.0190, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[207] = CreateDynamicObject(19320, 881.1362, -1114.6590, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[208] = CreateDynamicObject(19320, 886.8364, -1088.9593, 23.5967, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[209] = CreateDynamicObject(19320, 904.4462, -1058.9698, 24.2166, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[210] = CreateDynamicObject(19320, 885.5061, -1058.7397, 24.2166, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[211] = CreateDynamicObject(19320, 885.1057, -1068.5793, 23.9867, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[212] = CreateDynamicObject(19320, 875.3256, -1066.8392, 23.9867, 0.0000, 0.0000, 0.0000); //pumpkin01
	g_Object[213] = CreateDynamicObject(19320, 812.6981, -1109.0405, 26.2667, 0.0000, 0.0000, -89.3000); //pumpkin01
	g_Object[214] = CreateDynamicObject(19320, 811.2058, -1098.1882, 25.0867, 0.0000, 0.0000, -89.3000); //pumpkin01
	g_Object[215] = CreateDynamicObject(19320, 812.2573, -1091.7447, 26.1965, 0.0000, 0.0000, -89.3000); //pumpkin01
	g_Object[216] = CreateDynamicObject(19320, 818.4724, -1092.9300, 26.1965, 0.0000, 0.0000, 107.3000); //pumpkin01
	g_Object[217] = CreateDynamicObject(19527, 931.6875, -1098.5882, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[218] = CreateDynamicObject(19527, 925.0175, -1093.4387, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[219] = CreateDynamicObject(19527, 913.8175, -1097.6488, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[220] = CreateDynamicObject(19527, 903.6171, -1091.8686, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[221] = CreateDynamicObject(19527, 906.5667, -1083.0085, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[222] = CreateDynamicObject(19527, 942.6370, -1091.3188, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[223] = CreateDynamicObject(19527, 883.9464, -1091.3188, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[224] = CreateDynamicObject(19527, 866.5866, -1082.8297, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[225] = CreateDynamicObject(19527, 869.0665, -1090.5399, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[226] = CreateDynamicObject(19527, 868.4968, -1098.9300, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[227] = CreateDynamicObject(19527, 883.9968, -1098.9300, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[228] = CreateDynamicObject(19527, 833.5263, -1110.5885, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[229] = CreateDynamicObject(19527, 844.5761, -1116.4189, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[230] = CreateDynamicObject(19527, 851.8859, -1105.3188, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[231] = CreateDynamicObject(19527, 868.3759, -1115.6490, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[232] = CreateDynamicObject(19527, 884.7661, -1124.9582, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[233] = CreateDynamicObject(19527, 893.5056, -1114.8280, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[234] = CreateDynamicObject(19527, 911.8858, -1117.8978, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[235] = CreateDynamicObject(19527, 926.3156, -1111.7076, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[236] = CreateDynamicObject(19527, 942.6458, -1108.3856, 23.3295, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[237] = CreateDynamicObject(19527, 810.6494, -1100.9062, 24.7756, 0.0000, 0.0000, 0.0000); //Cauldron1
	g_Object[238] = CreateDynamicObject(3524, 837.2036, -1118.9895, 25.8917, 0.0000, 0.0000, 118.4999); //skullpillar01_lvs
	g_Object[239] = CreateDynamicObject(890, 933.4434, -1094.0174, 23.3369, 0.0000, 0.0000, -45.3997); //Elmred_PO
	g_Object[240] = CreateDynamicObject(890, 909.7119, -1093.0394, 23.3369, 0.0000, 0.0000, -45.3997); //Elmred_PO
	g_Object[241] = CreateDynamicObject(890, 892.0181, -1089.1800, 23.3369, 0.0000, 0.0000, -144.9998); //Elmred_PO
	g_Object[242] = CreateDynamicObject(890, 852.3220, -1116.9759, 23.3369, 0.0000, 0.0000, 99.6997); //Elmred_PO
	g_Object[243] = CreateDynamicObject(890, 828.1170, -1089.5024, 23.3369, 0.0000, 0.0000, -94.8999); //Elmred_PO
	g_Object[244] = CreateDynamicObject(892, 920.8958, -1095.1887, 23.2679, 0.0000, 0.0000, -99.3999); //Hazelweetree_PO
	g_Object[245] = CreateDynamicObject(890, 937.8526, -1098.4893, 23.3369, 0.0000, 0.0000, -171.4996); //Elmred_PO
	g_Object[246] = CreateDynamicObject(2670, 817.2525, -1101.0668, 24.8925, 0.0000, 0.0000, 0.0000); //PROC_RUBBISH_1
	g_Object[247] = CreateDynamicObject(14520, 817.5765, -1101.4520, 25.1101, 0.0000, 0.0000, 6.6999); //immy_clothes
	g_Object[248] = CreateDynamicObject(14863, 818.4432, -1104.5700, 25.4101, 0.0000, 0.0000, -124.2999); //clothes
	g_Object[249] = CreateDynamicObject(14520, 818.6306, -1103.0637, 25.1325, 0.0000, 0.0000, 102.5000); //immy_clothes
	g_Object[250] = CreateDynamicObject(19144, 810.7356, -1109.1446, 29.7192, 0.0000, 0.0000, -49.0000); //PinSpotLight2
	g_Object[251] = CreateDynamicObject(19144, 810.7808, -1091.9881, 29.7692, 0.0000, 0.0000, -131.2999); //PinSpotLight2
	g_Object[252] = CreateDynamicObject(894, 906.8997, -1070.4482, 23.2846, 0.0000, 0.0000, 1.6999); //Elmsparsesm_PO
	g_Object[253] = CreateDynamicObject(894, 889.0313, -1064.6959, 23.2846, 0.0000, 0.0000, 1.6999); //Elmsparsesm_PO
	g_Object[254] = CreateDynamicObject(890, 925.8710, -1107.4974, 23.3369, 0.0000, 0.0000, 16.8997); //Elmred_PO
	g_Object[255] = CreateDynamicObject(890, 908.5552, -1114.0949, 23.1168, 0.0000, 0.0000, -75.6002); //Elmred_PO
	g_Object[256] = CreateDynamicObject(11733, 816.4041, -1092.9891, 24.7922, 0.0000, 0.0000, 0.0000); //WRockingHorse1
	g_Object[257] = CreateDynamicObject(1712, 820.7225, -1098.3498, 24.7811, 0.0000, 0.0000, -90.0000); //kb_couch05
	g_Object[258] = CreateDynamicObject(11712, 816.4440, -1103.3115, 25.3131, 0.0000, -10.3000, 0.0000); //Cross1

	g_Actor[0] = CreateActor(0, 815.4608, -1100.0388, 25.7884, -145.6999); //Carl "CJ" Johnson (M
	g_Actor[1] = CreateActor(130, 814.6951, -1103.2867, 26.4762, -87.2001); //Farm Inhabitant
	g_Actor[2] = CreateActor(80, 819.2561, -1094.6157, 25.7957, 179.4998); //Boxer
	g_Actor[3] = CreateActor(1, 816.4967, -1106.0788, 25.7917, -48.9999); //The Truth
	g_Actor[4] = CreateActor(264, 814.6436, -1092.9514, 25.7936, 89.4999); //Clown (Ice-cream Van
	g_Actor[5] = CreateActor(246, 813.6090, -1093.2789, 25.7903, 87.0998); //Stripper
	ApplyActorAnimation(g_Actor[5], "BD_FIRE", "BD_PANIC_03", 4.0998, 1, 0, 0, 0, 0);
	g_Actor[6] = CreateActor(82, 816.4625, -1097.3935, 25.7933, 100.8999); //Black Elvis
	ApplyActorAnimation(g_Actor[6], "CLOTHES", "CLO_POSE_SHOES", 4.0998, 1, 0, 0, 0, 0);

	CreateDynamic3DTextLabel(""COL_RED"Bruja perazoli"COL_WHITE"\nHabla con ella si quieres vender calabazas", 0xF0F0F0FF, 817.2799, -1103.3270, 25.7921, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	AddKeyArea(817.2799, -1103.3270, 1.5, KEY_TYPE_Y);

	SetTimer("SpawnPumpkin", 600000, true);
	SpawnPumpkin();
	return 1;
}

forward SpawnPumpkin();
public SpawnPumpkin()
{
	for(new i = 0, j = 100; i <= j; i++)
	{
		new 
			index = random(sizeof(PUMPKIN_POSITIONS)),
			Float:x,
			Float:y
		;

		x = PUMPKIN_POSITIONS[index][0];
		y = PUMPKIN_POSITIONS[index][1];
		
		RandomCordFromPoint(minrand(10, 50), minrand(3, 5), x, y);

		CreateDropItem(
			19320,
			x,
			y,
			100.0,
			0.0,
			0.0,
			0.0,
			0,
			0,
			"Calabaza",
			"Null",
			57,
			1
		);
	}
	return 1;
}