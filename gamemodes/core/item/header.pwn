enum Item_Info_Enum
{
	item_NAME[64],
	item_MODELID,
	bool:item_SINGLE_SLOT
};
new ITEM_INFO[][Item_Info_Enum] = {
    {"Botiquin",                11738,     true},  // 0
    {"Medicamento",             11736,     false}, // 1
    {"Venda",                   11747,     false}, // 2
    {"Marihuana",               1578,      false}, // 3
    {"Crack",                   1575,      false}, // 4
    {"Bid�n de gasolina",       1650,      true},  // 5
    {"Semillas de aloe vera",   11739,     false}, // 6
    {"Semillas de marihuana",   11739,     false}, // 7
    {"Semillas de coca",        11739,     false}, // 8
    {"Balas (Pistola)",         19832,     false}, // 9
    {"Balas (Escopeta)",        19832,     false}, // 10
    {"Balas (Rifle)",           19832,     false}, // 11
    {"Bate",                    336,       true},  // 12
    {"Porra",                   334,       true},  // 13
    {"Cuchillo",                335,       true},  // 14
    {"Pala",                    337,       true},  // 15
    {"Palo de billar",          338,       true},  // 16
    {"Gas",                     343,       true},  // 17
    {"Palo de golf",            333,       true},  // 18
    {"Manopla",                 331,       true},  // 19
    {"9mm",                     346,       true},  // 20
    {"Tazer",                   347,       true},  // 21
    {"Desert Eagle",            348,       true},  // 22
    {"Escopeta",                349,       true},  // 23
    {"Recortada",               350,       true},  // 24
    {"Micro UZI",               352,       true},  // 25
    {"MP5",                     353,       true},  // 26
    {"AK-47",                   355,       true},  // 27
    {"M4",                      356,       true},  // 28
    {"Tec-9",                   372,       true},  // 29
    {"Rifle",                   357,       true},  // 30
    {"Bote de spray",           365,       true},  // 31
    {"C�mara",                  367,       true},  // 32
    {"Paraca�das",              371,       true},  // 33
    {"Celular",                 18866,     true},  // 34
    {"Ca�a de pescar",          18632,     true},  // 35
    {"Mazo",                    19631,     true},  // 36
    {"Kit de reparaci�n",       19921,     true},  // 37
    {"Porro",                   3027,      false}, // 38
    {"Balas (Subfusil)",        19832,     true},  // 39
    {"Geolocalizador",          19942,     true},  // 40
    {"Calabaza",                19320,     false}, // 41
    {"Pepaso Volador",          1636,      false}, // 42
    {"Mortero",                 1636,      false}, // 43
    {"Petardo",                 1636,      false}, // 44
    {"Volcan",                  3013,      false}, // 45
    {"Lavako",                  3013,      false}, // 46
    {"Canita 12 tiros",         3013,      false}, // 47
    {"Regalo",                  19057,     false}, // 48
    {"Hamburguesa",             2703,      false}, // 49
    {"Burrito",                 2769,      false}, // 50
    {"Carne cruda",             2804,      false}, // 51
    {"Jamon",                   19847,     false}, // 52
    {"Naranja",                 19574,     false}, // 53
    {"Tostada",                 19883,     false}, // 54
    {"Leche",                   19569,     false}, // 55
    {"Jugo de naranja",         19563,     false}, // 56
    {"Jugo de manzana",         19564,     false}, // 57
    {"Ketchup",                 11722,     false}, // 58
    {"Helado de chocolate",     19567,     false}, // 59
    {"Helado de manzana",       19568,     false}, // 60
    {"Pizza",                   2814,      false}, // 61
    {"Jugo cepita",             19564,     false}, // 62
    {"Cerveza",                 1484,      false}, // 63
    {"Wisky",                   19823,     false}, // 64
    {"Champagne",               19824,     false}, // 65
    {"Cerveza artesanal",       1544,      false}, // 66
    {"Pollo",                   2768,      false}, // 67
    {"Cafe",                    19835,     false}  // 68
};

#define MAX_DROP_ITEMS 600
#define DELETE_ITEM_TIME 600000 // 5 minutos

enum Droped_Items_Enum
{
	bool:itm_VALID,
	itm_ID,
	Text3D:itm_LABEL,
	itm_OWNER[24],
	itm_TYPE,
	itm_AMMOUNT,
	itm_INTERIOR,
	itm_WORLD
};
new DROP_ITEMS[MAX_DROP_ITEMS][Droped_Items_Enum];