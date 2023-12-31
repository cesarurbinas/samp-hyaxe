/* Rangos Policias */
enum enum_POLICE_SHOP_WEAPONS
{
	police_shop_RANK,
	police_shop_WEAPON_ID,
	police_shop_WEAPON_PRICE
};
new POLICE_SHOP_WEAPONS[][enum_POLICE_SHOP_WEAPONS] =
{
	{1, 3, 0},//porra
	{1, 22, 0},//9mm
	{1, 23, 0},//tazer
	{2, 17, 0}, //gas
	{2, 24, 0}, //deagle
	{2, 25, 0}, //escopeta
	{2, 28, 0}, //uzi
	{2, 32, 0}, // Tec 9
	{2, 26, 0}, // recortada
	{2, 29, 0}, //mp5
	{2, 30, 0}, //ak 47
	{2, 31, 0}, //m4
	{2, 33, 0}, //rifle
	{2, 46, 0}, //paracaidas
	{2, 4, 0}
};

enum enum_POLICE_SKINS
{
	police_skin_TYPE,
	police_skin_SKIN,
	police_skin_RANK
};
new POLICE_SKINS[][enum_POLICE_SKINS] =
{
	{SEX_MALE, 71, 1}, // Cadete
	{SEX_MALE, 280, 2}, // Oficial 1
	{SEX_MALE, 284, 4}, // Oficial 3
	{SEX_MALE, 281, 6}, // Detective 1
	{SEX_MALE, 285, 9}, // Sargento 1
	{SEX_MALE, 282, 10}, // Sargento 2
	{SEX_MALE, 286, 11}, // Soldado
	{SEX_MALE, 287, 13}, // Teniente
	{SEX_MALE, 288, 15}, // Jefe

	{SEX_FEMALE, 306, 1},
	{SEX_FEMALE, 307, 1},
	{SEX_FEMALE, 309, 1}
};

#define MAX_POLICE_OBJECTS 300
enum enum_POLICE_OBJECTS
{
	bool:police_object_VALID,
	police_object_USER[24],
	police_object_OBJECT_ID
};
new POLICE_OBJECTS[MAX_POLICE_OBJECTS][enum_POLICE_OBJECTS];

enum enum_POLICE_GARAGE_DOORS
{
	police_gdoor_MODELID,
	Float:police_gdoor_CLOSED_X,
	Float:police_gdoor_CLOSED_Y,
	Float:police_gdoor_CLOSED_Z,
	Float:police_gdoor_CLOSED_RX,
	Float:police_gdoor_CLOSED_RY,
	Float:police_gdoor_CLOSED_RZ,
	Float:police_gdoor_OPENED_X,
	Float:police_gdoor_OPENED_Y,
	Float:police_gdoor_OPENED_Z,
	Float:police_gdoor_OPENED_RX,
	Float:police_gdoor_OPENED_RY,
	Float:police_gdoor_OPENED_RZ,
	Float:police_gdoor_MOVE_SPEED,
	bool:police_gdoor_CLOSING,
	police_gdoor_OBJECT_ID,
	police_gdoor_TIMER
};
new POLICE_GARAGE_DOORS[][enum_POLICE_GARAGE_DOORS] =
{
	{3055, 1588.48853, -1637.85852, 14.57500, 0.0, 0.0, 0.0, 1588.48853, -1637.85852, 16.45880, 90.0, 0.0, 0.0, 1.3, false, INVALID_STREAMER_ID, -1},
	{3055, 2294.04102, 2498.81396, 4.47113,   0.00000, 0.00000, 90.00000, 2294.0410, 2498.8140, 9.0059, 0.0, 0.0, 90.0, 1.6, false, INVALID_STREAMER_ID, -1},
	{3055, 2335.13086, 2443.66895, 6.97370,   0.00000, 0.00000, 60.00000, 2335.1309, 2443.6689, 11.6876, 0.0, 0.0, 60.0, 1.6, false, INVALID_STREAMER_ID, -1},
	{10184, -1631.69556, 688.56641, 8.70960,   0.00000, 0.00000, 90.00000, -1631.6956, 688.5664, 13.2064, 0.0, 0.0, 90.0, 1.6, false, INVALID_STREAMER_ID, -1}
};

enum enum_POLICE_DOORS
{
	police_door_MODELID,
	Float:police_door_X,
	Float:police_door_Y,
	Float:police_door_Z,
	Float:police_door_RZ,
	police_door_INTERIOR,
	police_door_WORLD,
	bool:police_door_CLOSED,
	police_door_OBJECT_ID,
	police_door_TIMER
};
new POLICE_DOORS[][enum_POLICE_DOORS] =
{
	{1495, 245.62910, 72.53300, 1002.54999, 0.0, 6, 0, true, INVALID_STREAMER_ID, -1},//lspd
	{1495, 250.65849, 62.58540, 1002.54999, 90.0, 6, 0, true, INVALID_STREAMER_ID, -1},//lspd
	{1495, 226.16409, 71.01760, 1003.95050, 90.0, 6, 0, true, INVALID_STREAMER_ID, -1},//lspd
	{1497, 222.14630, 70.52970, 1003.95050, -90.0, 6, 0, true, INVALID_STREAMER_ID, -1},//lspd
	{1495, -1619.70764, 688.41058, 6.17220, 180.00000, 0, 0, true, INVALID_STREAMER_ID, -1},//sfpd
	{1495, 239.58211, 116.84430, 1002.20319, 90.00000, 10, 0, true, INVALID_STREAMER_ID, -1},//sfpd
	{1495, 253.19209, 108.35700, 1002.20319, 90.00000, 10, 0, true, INVALID_STREAMER_ID, -1},//sfpd
	{1497, 266.59210, 112.56570, 1003.60992, 180.0, 10, 0, true, INVALID_STREAMER_ID, -1},//sfpd
	{1495, 228.27240, 150.46510, 1002.01813, 90.0, 3, 0, true, INVALID_STREAMER_ID, -1},//lvpd
	{1495, 228.27240, 160.45010, 1002.01813, 90.0, 3, 0, true, INVALID_STREAMER_ID, -1},//lvpd
	{1495, 232.21030, 169.83350, 1002.01813, 180.0, 3, 0, true, INVALID_STREAMER_ID, -1},//lvpd
	{1495, 2294.03516, 2492.91528, 2.26740, 90.0, 0, 0, true, INVALID_STREAMER_ID, -1},//lvpd
	{1497, 221.95570, 181.21680, 1002.02142, 0.0, 3, 0, true, INVALID_STREAMER_ID, -1},//lvpd
	{19302, 1881.9488500, -1728.0080600, 5216.9443400, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1881.9488500, -1726.2583000, 5216.9443400, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	//{19302, 1873.9609400, -1701.8895300, 5216.9233400, 180.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	//{19302, 1870.5865500, -1701.8895300, 5216.9233400, 0.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1869.0052500, -1706.7932100, 5216.9233400, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1865.9495800, -1710.0686000, 5216.9233400, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1865.9642300, -1716.4146700, 5216.9233400, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1872.3482700, -1716.4731400, 5216.9233400, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	//{19302, 1870.5643300, -1714.6610100, 5216.9233400, 0.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	//{19302, 1870.7441400, -1718.0427200, 5216.9233400, 0.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	//{19302, 1870.8906300, -1725.5587200, 5216.9233400, 180.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	//{19302, 1877.0349100, -1725.5587200, 5216.9233400, 0.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	//{19302, 1870.5822800, -1736.3883100, 5216.9233400, 180.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1874.6868900, -1734.9820600, 5216.9233400, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1874.6868900, -1727.2934600, 5216.9233400, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1869.6705300, -1741.3382600, 5216.9233400, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	//{19302, 1866.2760000, -1738.0972900, 5216.9233400, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1872.3695100, -1700.4267600, 5216.9233400, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1866.2426800, -1731.6855500, 5216.9233400, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1866.2426800, -1728.4549600, 5216.9233400, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1866.2426800, -1725.2485400, 5216.9233400, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	//{19302, 1863.0655500, -1736.5716600, 5216.9233400, 0.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1853.5118400, -1719.1693100, 5216.9233400, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1850.3166500, -1754.2231400, 5216.9233400, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1863.7713600, -1754.2331500, 5216.9233400, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	//{19302, 1864.6912800, -1742.8278800, 5216.9233400, 0.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	//{19302, 1867.3038300, -1751.7044700, 5216.9233400, 180.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1874.7647700, -1750.9698500, 5216.9233400, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19302, 1874.7647700, -1746.9626500, 5216.9233400, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1}
};

enum enum_JAIL_DOORS
{
	jail_door_MODELID,
	Float:jail_door_X,
	Float:jail_door_Y,
	Float:jail_door_Z,
	Float:jail_door_RZ,
	jail_door_INTERIOR,
	jail_door_WORLD,
	bool:jail_door_CLOSED,
	jail_door_OBJECT_ID,
	jail_door_TIMER
};
new JAIL_DOORS[][enum_JAIL_DOORS] =
{
	{19303, 1896.3712200, -1756.8221400, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1760.0351600, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1763.2403600, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1766.4504400, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1769.6499000, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1772.8501000, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1776.0500500, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1779.2530500, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1782.4561800, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1741.0606700, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1737.8496100, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1734.6408700, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1731.4304200, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1728.2275400, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1725.0201400, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1721.8118900, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1718.6042500, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1896.3712200, -1715.3877000, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1901.8182400, -1757.0009800, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1901.8182400, -1760.1987300, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1901.8182400, -1763.4057600, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1901.8182400, -1766.6284200, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1901.8182400, -1769.8177500, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1901.8177500, -1773.0269800, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1901.8182400, -1776.2351100, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1901.8182400, -1779.4392100, 5219.2373000, 90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1901.8182400, -1740.8912400, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1901.8182400, -1737.6812700, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1901.8182400, -1734.4605700, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1901.8182400, -1731.2605000, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1901.8182400, -1728.0505400, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1901.8182400, -1724.8404500, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1901.8182400, -1721.6368400, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1},
	{19303, 1901.8182400, -1718.4254200, 5219.2373000, -90.0000000, 6, 0, true, INVALID_STREAMER_ID, -1}
};