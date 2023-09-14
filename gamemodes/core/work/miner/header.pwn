enum miner_pos_enum
{
	Float:mp_X,
	Float:mp_Y,
	Float:mp_Z,
	Float:mp_ANGLE
};
new DROP_ROCK_POS[][miner_pos_enum] =
{
	{1183.601684, 1001.653564, -96.642456, 87.734138},
	{1179.949096, 1001.716064, -96.489898, 275.109252},
	{1221.640258, 1003.837707, -96.608581, 270.409332},
	{1225.510375, 1003.908508, -96.514228, 93.711090},
	{2009.977050, 1201.383422, -60.864933, 277.737640},
	{2013.776123, 1201.699340, -60.797340, 94.459281},
	{2042.192626, 1201.630493, -60.730998, 264.264129},
	{2045.783203, 1201.439086, -60.804790, 87.879188},
	{2572.459716, 1923.836547, -56.040641, 268.024017},
	{2576.220214, 1923.824584, -55.920875, 90.048980},
	{2608.666259, 1923.559326, -55.981605, 264.867279},
	{2612.326416, 1923.223022, -55.924434, 87.832206}
};

enum rock_processor_enum
{
	Float:rp_X,
	Float:rp_Y,
	Float:rp_Z,
	Float:rp_FUEL,
	Float:rp_HEALTH
};
new ROCK_PROCESSOR[][rock_processor_enum] =
{
	{1181.356933, 1001.713623, -98.562065, 100.0, 100.0},
	{1223.648315, 1003.786926, -98.512069, 100.0, 100.0},
	{2044.536132, 1201.623291, -62.680553, 100.0, 100.0},
	{2012.188598, 1201.527343, -62.699279, 100.0, 100.0},
	{2610.536865, 1923.574340, -58.042785, 100.0, 100.0},
	{2574.360595, 1923.904663, -58.042785, 100.0, 100.0}
};

/* Miner System */
enum miner_rocks_info
{
	r_MODELID,
	Float:r_X,
	Float:r_Y,
	Float:r_Z,
	Float:r_RX,
	Float:r_RY,
	Float:r_RZ,
	r_TYPE,
	r_WORLD,
	r_INTERIOR,
	bool:r_ACTIVATED,
	r_OBJECT_ID
};

new ROCKS_OBJ[][miner_rocks_info] =
{
	{3930, 1177.872436, 992.813354, -96.845115, 24.399999, 2.599997, 0.000000, 0, 36, 25}, // Mina A
	{3930, 1196.177978, 994.048706, -94.680076, 24.399999, 2.599997, 0.000000, 1, 36, 25},
	{3930, 1224.658569, 997.169494, -94.684623, 24.399999, 2.599997, 0.000000, 2, 36, 25},
	{3930, 1236.418090, 998.993347, -97.543411, 24.399999, 2.599997, 0.000000, 3, 36, 25},
	{3930, 1230.120605, 1019.671325, -99.555900, 24.399999, 2.599997, 0.000000, 0, 36, 25},
	{3930, 1207.183593, 1008.262329, -100.254249, 24.399995, 2.600013, -0.000006, 1, 36, 25},
	{3930, 1190.385620, 1009.850646, -98.333389, 24.399995, 2.600013, -0.000006, 2, 36, 25},
	{3930, 1179.665405, 1010.131530, -97.875244, 24.399988, 2.599982, -150.399932, 0, 36, 25},
	{3930, 1163.240478, 1005.786499, -98.784423, 24.399999, 2.599997, -85.299995, 1, 36, 25},
	{3930, 1209.523315, 998.607238, -99.839881, 24.399999, 2.599997, 0.000000, 2, 36, 25},
	{3931, 1223.792236, 1000.901733, -100.214630, 0.000000, 0.000000, 0.000000, 0, 36, 25},
	{3931, 1260.426757, 998.186218, -97.661567, 0.000000, -122.299987, 64.099983, 1, 36, 25},
	{3931, 1212.011962, 1013.100524, -96.754631, 0.000000, 0.000014, 0.000000, 2, 36, 25},
	{3931, 1193.982055, 1012.242187, -95.744636, 0.000000, 0.000000, 0.000000, 3, 36, 25},
	{3931, 1167.231689, 992.691772, -97.244628, 0.000000, 0.000000, 0.000000, 0, 36, 25},
	{3931, 1239.842163, 1020.351379, -100.454666, 0.000000, 0.000000, 0.000000, 1, 36, 25},
	{3930, 1233.481445, 1009.266235, -96.487350, 0.000000, 0.000014, 0.000000, 2, 36, 25},
	{3930, 1251.631835, 1005.076660, -99.247344, 0.000000, 0.000014, 0.000000, 3, 36, 25},
	{3930, 1189.956054, 994.439636, -96.924644, 0.000000, 0.000000, 0.000000, 0, 36, 25},
	{3930, 1198.553466, 1010.266357, -97.348808, 0.000009, 58.900024, 40.100006, 1, 36, 25},
	{3930, 1240.416381, 1008.318664, -95.574661, 0.000000, 0.000014, 0.000000, 2, 36, 25},
	{3930, 1180.246215, 994.873962, -99.361381, 36.599998, 0.000000, -55.200004, 3, 36, 25},
	{3930, 1222.842529, 1010.886718, -98.624633, 0.000007, 0.000012, 35.799980, 0, 36, 25},
	{3930, 1241.798706, 1006.211547, -98.624633, 0.000007, 0.000012, 35.799980, 1, 36, 25},
	{3930, 1253.789062, 999.310974, -98.874641, 0.000000, 0.000000, 8.599998, 2, 36, 25},
	{3930, 1187.321655, 996.277465, -99.797363, 0.000000, 0.000000, 0.000000, 0, 36, 25},
	{3930, 1205.381713, 995.057006, -94.697357, 0.000000, 0.000000, 0.000000, 1, 36, 25},
	{3930, 2006.621704, 1210.249877, -58.051799, 0.000000, 0.000000, 0.000000, 4, 37, 26}, // Mina B
	{3930, 2002.191528, 1211.020141, -56.831802, 0.000000, 0.000000, 0.000000, 5, 37, 26},
	{3930, 2003.431396, 1195.300048, -60.031810, 48.600002, 0.000000, 0.000000, 6, 37, 26},
	{3930, 1995.754516, 1209.251831, -60.907882, 0.000000, 45.999988, 47.099998, 5, 37, 26},
	{3930, 2013.841308, 1195.473999, -62.344772, 48.600002, 0.000000, 0.000000, 7, 37, 26},
	{3930, 2027.621337, 1200.035766, -62.886730, 48.600002, 0.000000, 0.000000, 4, 37, 26},
	{3930, 2029.621337, 1209.721923, -62.348133, 48.600002, 0.000000, 0.000000, 5, 37, 26},
	{3930, 2004.174682, 1197.629150, -63.108753, 0.000000, 45.999988, -56.800014, 6, 37, 26},
	{3930, 1996.451782, 1198.851684, -62.162265, 0.000000, 45.999988, 47.099998, 7, 37, 26},
	{3930, 2041.770141, 1192.692016, -62.289901, 0.000000, 19.599983, 47.099998, 4, 37, 26},
	{3930, 2047.992919, 1190.046508, -58.458881, 92.699989, 19.599983, 47.099998, 5, 37, 26},
	{3931, 2037.137329, 1210.305297, -61.818855, -30.500000, -1.099998, 0.000000, 6, 37, 26},
	{3931, 2055.554687, 1208.279418, -60.214843, -30.500000, -1.099998, 0.000000, 7, 37, 26},
	{3931, 2015.895751, 1206.989379, -62.404953, -30.500000, -1.099998, 0.000000, 4, 37, 26},
	{3931, 2016.377807, 1193.260375, -59.310298, -30.500000, -1.099998, 0.000000, 5, 37, 26},
	{3931, 1990.917358, 1199.671264, -63.990932, -30.500000, -1.099998, 0.000000, 6, 37, 26},
	{3931, 1991.524414, 1209.075195, -62.747913, -30.500000, -1.099998, 0.000000, 7, 37, 26},
	{3931, 2047.370483, 1207.462036, -63.966873, -30.500000, -1.099998, 0.000000, 4, 37, 26},
	{3929, 2022.074096, 1208.842407, -58.054317, 0.000000, 0.000000, 0.000000, 5, 37, 26},
	{3929, 2019.653442, 1209.882446, -55.744316, 0.000000, 0.000000, 0.000000, 6, 37, 26},
	{3929, 2029.603393, 1211.433227, -58.594314, 0.000000, 0.000000, 0.000000, 7, 37, 26},
	{3929, 2045.704223, 1210.327514, -59.544311, 0.000000, 0.000000, 171.200012, 4, 37, 26},
	{3929, 2042.604492, 1190.296386, -58.284328, 0.000000, 0.000000, 171.200012, 5, 37, 26},
	{3931, 2061.907470, 1205.823608, -62.572795, -30.500000, -1.099998, 0.000000, 6, 37, 26},
	{3931, 2062.033935, 1191.420166, -61.724494, -30.500000, -1.099998, 0.000000, 7, 37, 26},
	{3931, 2049.864746, 1193.782592, -63.920982, -30.500000, -1.099998, 0.000000, 4, 37, 26},
	{3931, 2034.317993, 1197.020507, -63.191623, -30.500000, -1.099998, 0.000000, 5, 37, 26},
	{3931, 2020.915527, 1197.401611, -59.825992, -30.500000, -1.099998, 0.000000, 6, 37, 26},
	{3931, 1997.382812, 1196.342041, -58.728122, -30.500000, -1.099998, 0.000000, 7, 37, 26},
	{3930, 2054.089111, 1190.715209, -60.811580, 0.000000, 19.599983, 47.099998, 4, 37, 26},
	{3930, 2057.579833, 1204.269042, -63.813278, 0.000000, 19.599983, 47.099998, 5, 37, 26},
	{3930, 2051.272949, 1207.219116, -62.947536, 0.000000, 19.599983, 47.099998, 6, 37, 26},
	{3930, 2043.150756, 1213.020019, -58.107460, 0.000000, 19.599983, 47.099998, 7, 37, 26},
	{3930, 2040.889526, 1211.909179, -59.710617, 5.999997, 31.999990, -49.800010, 4, 37, 26},
	{3930, 2009.627685, 1195.286132, -61.320980, 0.000000, 45.999988, -56.800014, 5, 37, 26},
	{3930, 2000.716430, 1200.245849, -62.464614, 0.000000, 45.999988, -56.800014, 6, 37, 26},
	{3930, 2003.081665, 1207.042358, -60.393619, 0.000000, 45.999988, -56.800014, 7, 37, 26},
	{3930, 2007.940429, 1205.770874, -62.219581, 0.000000, 45.999988, -56.800014, 4, 37, 26},
	{3930, 2003.615356, 1203.413085, -62.601642, 0.000000, 45.999988, -56.800014, 5, 37, 26},
	{3930, 2558.547119, 1920.175537, -56.770034, 0.000000, -23.799999, 103.499992, 8, 38, 27}, // Mina C
	{3930, 2568.526367, 1929.490844, -56.750083, 81.999977, -23.799999, 103.499992, 9, 38, 27},
	{3930, 2556.510986, 1925.515625, -55.503135, 81.999977, -23.799999, 103.499992, 10, 38, 27},
	{3930, 2575.620117, 1928.317382, -58.313629, 81.999977, -23.799999, 103.499992, 11, 38, 27},
	{3930, 2582.657714, 1923.599975, -57.506542, 81.999977, -23.799999, 103.499992, 8, 38, 27},
	{3930, 2591.072021, 1930.458007, -56.131759, 81.999977, -23.799999, 103.499992, 9, 38, 27},
	{3930, 2598.102539, 1921.015869, -58.439590, 81.999977, -23.799999, 167.199966, 10, 38, 27},
	{3930, 2605.449707, 1931.463500, -58.859226, 81.999977, -23.799999, 167.199966, 11, 38, 27},
	{3930, 2599.343017, 1931.116943, -58.198123, 81.999977, -23.799999, 167.199966, 8, 38, 27},
	{3930, 2605.106933, 1921.937500, -57.921848, 19.499980, -23.799999, 167.199966, 9, 38, 27},
	{3930, 2614.835937, 1919.864135, -57.544937, 19.499980, -23.799999, 167.199966, 10, 38, 27},
	{3930, 2622.473388, 1926.415893, -56.893245, 19.499980, -23.799999, 167.199966, 11, 38, 27},
	{3930, 2623.638183, 1930.964111, -53.048309, 19.499980, -23.799999, 167.199966, 8, 38, 27},
	{3930, 2629.750244, 1924.946044, -57.796928, 19.499980, -23.799999, 167.199966, 9, 38, 27},
	{3930, 2631.227050, 1914.339721, -55.732841, 19.499980, -23.799999, 167.199966, 10, 38, 27},
	{3930, 2577.853515, 1931.992675, -53.565452, 81.999977, -23.799999, 103.499992, 11, 38, 27},
	{3930, 2581.912109, 1927.186157, -57.944911, 81.999977, -23.799999, 103.499992, 8, 38, 27},
	{3930, 2596.468505, 1922.699584, -56.103130, 81.999977, -23.799999, 103.499992, 9, 38, 27},
	{3930, 2595.459716, 1928.450927, -57.102424, 81.999977, -23.799999, 103.499992, 10, 38, 27},
	{3930, 2613.909179, 1927.228271, -58.297199, 81.999977, -23.799999, 103.499992, 11, 38, 27},
	{3930, 2625.735839, 1928.402343, -55.299907, 81.999977, -23.799999, 103.499992, 8, 38, 27},
	{3930, 2599.343017, 1931.116943, -58.198123, 81.999977, -23.799999, 167.199966, 9, 38, 27},
	{3930, 2587.522705, 1932.371459, -53.971248, 81.999977, -23.799999, 167.199966, 10, 38, 27},
	{3930, 2589.001220, 1922.533447, -53.152873, 81.999977, -23.799999, 167.199966, 11, 38, 27},
	{3930, 2572.721191, 1919.130615, -58.246109, 81.999977, -77.299995, 167.199966, 8, 38, 27},
	{3930, 2572.663574, 1930.959838, -54.859481, 81.999977, -77.299995, 167.199966, 9, 38, 27},
	{3930, 2582.617431, 1931.652954, -54.070865, 81.999977, -77.299995, 167.199966, 10, 38, 27},
	{3930, 2625.432373, 1923.397094, -58.817531, 81.999977, -77.299995, 167.199966, 11, 38, 27},
	{3930, 2627.374511, 1915.446044, -58.241146, 81.999977, -77.299995, 167.199966, 8, 38, 27},
	{3930, 1163.240478, 1005.786499, -98.784423, 24.399999, 2.599997, -85.299995, 10, 38, 27},
	{3930, 1209.523315, 998.607238, -99.839881, 24.399999, 2.599997, 0.000000, 11, 38, 27},
	{3931, 1223.792236, 1000.901733, -100.214630, 0.000000, 0.000000, 0.000000, 8, 38, 27},
	{3931, 1260.426757, 998.186218, -97.661567, 0.000000, -122.299987, 64.099983, 9, 38, 27},
	{3931, 1212.011962, 1013.100524, -96.754631, 0.000000, 0.000014, 0.000000, 10, 38, 27},
	{3931, 1193.982055, 1012.242187, -95.744636, 0.000000, 0.000000, 0.000000, 11, 38, 27},
	{3931, 1167.231689, 992.691772, -97.244628, 0.000000, 0.000000, 0.000000, 8, 38, 27},
	{3931, 1239.842163, 1020.351379, -100.454666, 0.000000, 0.000000, 0.000000, 9, 38, 27},
	{3930, 1245.157104, 998.390869, -96.821304, 0.000000, 0.000000, 0.000000, 10, 38, 27},
	{3930, 1261.037231, 1006.549682, -96.821304, -68.299987, 179.999954, 179.999908, 11, 38, 27},
	{3930, 1163.794799, 1011.816040, -96.488059, -111.699996, 0.000000, -55.200004, 8, 36, 25}
};