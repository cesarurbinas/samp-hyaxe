enum
{
	WORK_TYPE_NONE,
	WORK_TYPE_NORMAL,
	WORK_TYPE_FAMILY
};
enum
{
	WORK_NONE,
	WORK_TRUCK,
	WORK_MECHANIC,
	WORK_HARVESTER,
	WORK_TRASH,
	WORK_FARMER,
	WORK_MINER,
	WORK_POLICE,
	WORK_FISHER,
	WORK_CLEANER,
	WORK_MAFIA,
	WORK_ENEMY_MAFIA,
	WORK_OSBORN,
	WORK_MEDIC,
	WORK_BOX
};
enum work_info_info
{
	work_info_TYPE,
	work_info_LEVEL,
	work_info_NAME[64],
	bool:work_info_NEED_DUTY,     //si este trabajo es normal y tiene vehiculos indica si es necesario que el jugador este de servicio para subirse
	work_info_EXTRA_PAY,          //dejar en 0 para no paga extra.......Paga extra de 'work_info_EXTRA_PAY' cada 'work_info_EXTRA_PAY_EXP' con un limite de 'work_info_EXTRA_PAY_LIMIT'
	work_info_EXTRA_PAY_EXP,
	work_info_EXTRA_PAY_LIMIT     // dejar en 0 para sin limites
};
new work_info[][work_info_info] =
{
	{WORK_TYPE_NONE, 0, "ninguno",                         	false, 0, 0, 0},
	{WORK_TYPE_NORMAL, 1, "camionero",                     	false, 0, 50, 1300},
	{WORK_TYPE_FAMILY, 1, "mecánico",                      	true, 0, 0, 0},
	{WORK_TYPE_NORMAL, 1, "cosechador",                    	false, 180, 30, 800},
	{WORK_TYPE_NORMAL, 1, "basurero",                      	true, 200, 50, 2000},
	{WORK_TYPE_FAMILY, 3, "granjero",                      	false, 0, 0, 0},
	{WORK_TYPE_NORMAL, 1, "minero",		   					false, 0, 0, 0},
	{WORK_TYPE_FAMILY, 0, "policía",                       	true, 1000, 1, 0},
	{WORK_TYPE_NORMAL, 1, "pescador",                     	false, 500, 50, 1300},
	{WORK_TYPE_FAMILY, 1, "barredor",						false, 500, 50, 1300},
	{WORK_TYPE_FAMILY, 0, "mafioso",		                false, 1000, 1, 0},
	{WORK_TYPE_FAMILY, 0, "mafioso enemigo",		        false, 1000, 1, 0},
	{WORK_TYPE_FAMILY, 0, "familia osborn",		        	false, 1000, 1, 0},
	{WORK_TYPE_NORMAL, 1, "médico",                      	true, 200, 50, 2000},
	{WORK_TYPE_NORMAL, 1, "boxeador",                      	false, 200, 50, 2000}
};

new PLAYER_WORKS[MAX_PLAYERS][sizeof(work_info)];
new PLAYER_SKILLS[MAX_PLAYERS][sizeof(work_info)];

enum obtain_work_coords_info
{
	Float:obtain_work_X,
	Float:obtain_work_Y,
	Float:obtain_work_Z,
	obtain_work_INTERIOR,
	bool:obtain_work_MAP_ICON,
	obtain_work_MAP_ICON_ID,
	Float:obtain_work_MAP_ICON_X,
	Float:obtain_work_MAP_ICON_Y,
	Float:obtain_work_MAP_ICON_Z,
};
new Float:obtain_work_coords[][obtain_work_coords_info] =
{
	{0.0, 0.0, 0.0, 0, false, 0, 0.0, 0.0, 0.0},
	{1297.107543, -65.027748, 1002.498046, 18, true, 61, 2509.533935, -2637.530761, 13.645265}, //camionero
	{-69.941520, -1181.400634, 1.750000, 0, true, 27, -69.941520, -1181.400634, 1.750000}, //mecanico
	{-372.126922, -1435.706298, 25.726562, 0, true, 61, -372.126922, -1435.706298, 25.726562}, //Cosechador
	{1490.845581, 1305.730102, 1093.296386, 3, true, 61, 1664.634033, -2185.537353, 13.546875}, //Basurero
	{1564.864257, 23.255302, 84.164062, 0, true, 61, 1564.864257, 23.255302, 24.164062}, //granjero
	{572.808532, -703.072082, 13.075838, 0, true, 61, 572.808532, -703.072082, 13.075838}, //minero
	{-510.972015, 324.242736, 2004.585937, 20, false, 0, 1480.966918, -1772.065673, 18.795755}, //policia
	{2158.550048, -97.376449, 2.844641, 0, true, 61, 2158.550048, -97.376449, 2.844641}, //pescador
	{1623.531616, -1894.376831, 13.550236, 0, true, 61, 1623.531616, -1894.376831, 13.550236}, //barredor
	{-510.972015, 324.242736, 2004.585937, 20, false, 0, 1480.966918, -1772.065673, 18.795755}, //mafia
	{-510.972015, 324.242736, 2004.585937, 20, false, 0, 1480.966918, -1772.065673, 18.795755}, //mafia enemiga
	{-510.972015, 324.242736, 2004.585937, 20, false, 0, 1480.966918, -1772.065673, 18.795755}, //osborn
	{-201.724212, -1742.832641, 675.768737, 3, false, 0, 1172.832763, -1323.269531, 15.400051}, //medico
	{-20.062799, 99.009475, 1098.068603, 16, false, 0, 950.341247, -987.135864, 38.743835} //boxeador
};