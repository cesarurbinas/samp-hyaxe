enum Item_Info_Enum
{
	item_NAME[64],
	item_MODELID,
	bool:item_SINGLE_SLOT
};
new ITEM_INFO[100][Item_Info_Enum] = {
    {"Botiquí­n",                11738,     true},  // 0
    {"Medicamento",             11736,     false}, // 1
    {"Venda",                   11747,     false}, // 2
    {"Marihuana",               1578,      false}, // 3
    {"Crack",                   1575,      false}, // 4
    {"Bidón de gasolina",       1650,      true},  // 5
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
    {"Cámara",                  367,       true},  // 32
    {"Paracaí­das",              371,       true},  // 33
    {"Celular",                 18866,     true},  // 34
    {"Caña de pescar",          18632,     true},  // 35
    {"Mazo",                    19631,     true},  // 36
    {"Kit de reparación",       19921,     true},  // 37
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
    {"Regalo",                  19057,     false}  // 48
};

#define MAX_DROP_ITEMS 600
#define DELETE_ITEM_TIME 600000 // 5 minutos

enum Droped_Items_Enum
{
	bool:itm_VALID,
	itm_ID,
	itm_MODELID,
	Text3D:itm_LABEL,
	itm_NAME[64],
	itm_OWNER[24],
	itm_TYPE,
	itm_AMMOUNT,
	itm_COLOR,
	itm_INTERIOR,
	itm_WORLD
};
new DROP_ITEMS[MAX_DROP_ITEMS][Droped_Items_Enum];