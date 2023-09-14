enum {
	NOT_A_TREE,
	TREE_TYPE_NORMAL,
	TREE_TYPE_UNCOMMON,
	TREE_TYPE_RARE,
};

enum E_TREE_DATA {
	Float:tree_X,
	Float:tree_Y,
	Float:tree_Z,
	tree_TYPE,

	tree_OBJECT,
	tree_CHOPPED_OBJECT,
	Text3D:tree_LABEL,
	bool:tree_CHOPPED,
	bool:tree_CHOPPING
}
new Trees[][E_TREE_DATA] = {
	{-1903.78674, -2372.92432, 34.48676, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1911.02161, -2349.64136, 36.44771, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1930.91370, -2369.03418, 34.48676, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1920.99524, -2323.30884, 40.41199, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1940.93555, -2349.93018, 32.07809, TREE_TYPE_UNCOMMON, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1910.20972, -2296.24170, 48.88259, TREE_TYPE_UNCOMMON, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1924.62524, -2306.93530, 47.58664, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1938.21008, -2313.29370, 44.61149, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1891.10242, -2311.30884, 43.18143, TREE_TYPE_UNCOMMON, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1879.10303, -2360.76978, 37.51529, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1881.66687, -2328.66724, 41.65625, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1853.34607, -2340.22070, 39.43839, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1902.56970, -2330.43921, 39.38415, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1920.99524, -2323.30884, 40.41199, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1953.54724, -2330.74072, 39.65728, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1920.42517, -2280.71582, 58.94735, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1885.93286, -2277.68848, 62.30148, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1908.99768, -2263.35962, 64.72935, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1891.29712, -2247.59009, 72.67875, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1919.38391, -2242.71753, 71.97849, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1874.08618, -2240.48730, 74.04034, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1894.60242, -2218.50635, 80.40373, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1878.85596, -2298.54590, 54.41194, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1860.31750, -2321.97388, 41.65625, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1846.65845, -2297.93994, 54.15133, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1837.53406, -2313.97925, 47.89605, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1858.52820, -2307.59375, 51.48631, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1872.20044, -2266.14453, 66.49744, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1830.09070, -2281.34155, 59.53296, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1817.01599, -2304.43457, 49.98243, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1850.78442, -2272.29248, 64.14309, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1848.79309, -2251.41528, 71.21494, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1856.46277, -2228.42822, 78.39266, TREE_TYPE_NORMAL, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1868.14417, -2291.93823, 51.73443, TREE_TYPE_RARE, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false},
	{-1894.72815, -2282.34839, 54.74613, TREE_TYPE_RARE, INVALID_OBJECT_ID, INVALID_OBJECT_ID, INVALID_3DTEXT_ID, false, false}
};

enum E_CART_DATA {
	bool:cart_VALID,
	cart_AMOUNT,

	cart_OBJECT,
	Text3D:cart_LABEL
}
new LogCarts[MAX_PLAYERS][E_CART_DATA];

new g_WoodcutterArea,
	g_iSawmillStock = 0;

forward RegenerateTree(treeid);
forward StartCutting(playerid, treeid);
forward UpdateTreeCutting(playerid, treeid);
forward FinishTreeCutting(playerid, treeid);
forward GenerateLogs(amount);
forward DestroyLogs(object);