new FAILED_MSGS[][] =
{
	"El objetivo no era tragar balas!",
	"Tenas que esquivar las balas, no atraparlas!",
	"El plomo no se come!",
	"Tus armas no son adornos!",
	"Habia que disparar, no repartir abrazos!"
};

new BALLAS_SKINS[] =
{
	102, 103, 104, 102
};

enum {
	SWEET_MISSION,
	RYDER_MISSION,
	BIGSMOKE_MISSION,
	CASH_MISSION
}

enum e_start_mission
{
    bool:ems_ENABLED,
    ems_NAME[64],
    ems_MAPICON,
	Float:ems_X,
	Float:ems_Y,
	Float:ems_Z,
	ems_MAX_MISSIONS,
	bool:ems_STARTED,
	ems_TYPE,
	bool:ems_COME_BACK,
	ems_COME_BACK_AREA,
	ems_SPECIAL_INDEX
};

new START_MISSION[][e_start_mission] =
{
	{true, "Sweet", 38, 2516.7451, -1675.5376, 14.0275, 2},
	{false, "Ryder", 34, 2459.3867, -1688.2607, 13.5354, 1},
	{false, "Big Smoke", 8, 2073.6650, -1703.2490, 13.5547, 1},
	{false, "C.R.A.S.H", 16, 1044.3706, -1337.5874, 13.5530, 1}
};

enum npc_info_enum
{
	ni_MISSION,
	ni_INDEX,
	bool:ni_STATIC_FIRE
};
new NPC_INFO[MAX_PLAYERS][npc_info_enum];

enum sweet_dealers_enum
{
	Float:sd_X,
	Float:sd_Y,
	Float:sd_Z,
	Float:sd_ANGLE,
	sd_ID
};

new SWEET_DEALERS[][sweet_dealers_enum] =
{
	{2465.7241, -1671.6196, 13.4820, 283.5535}, 
	{2472.0037, -1649.9283, 13.4724, 236.1771}, 
	{2419.8877, -1667.1708, 13.5440, 286.7262}, 
	{2355.1411, -1650.0740, 13.5805, 162.2690}, 
	{2372.6577, -1696.7510, 13.5592, 62.6280}, 
	{2365.1228, -1724.7148, 13.5469, 187.8372}, 
	{2293.4602, -1723.7979, 13.5469, 160.3889}, 
	{2287.1865, -1645.5430, 15.0857, 112.4252}, 
	{2251.9868, -1644.7024, 15.4999, 211.1029}, 
	{2186.2498, -1648.9302, 15.4766, 285.3402}, 
	{2165.9485, -1673.9899, 15.0798, 252.4166}, 
	{2177.2427, -1737.7109, 13.5469, 321.0140}, 
	{2224.9675, -1758.6638, 13.5625, 40.5153}, 
	{2268.7800, -1765.6445, 13.5546, 30.9040}, 
	{2371.6680, -1762.0027, 13.5469, 23.1726}
};

new Float:INIT_DRUG_STEAL[][] =
{
	{2242.8044, -1260.8309, 23.9468},
	{2167.4219, -1512.5464, 23.8977},
	{1997.9342, -1308.5748, 20.9090},
	{2356.0225, -1913.5276, 13.4993},
	{2731.8257, -1910.3391, 13.5469}
};