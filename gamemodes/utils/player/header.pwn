new NAME_WHITELIST[][24] =
{
	"Yahir_Kozel",
	"Atom_Palomita",
	"Pepe_Garcia",
	"Radric_Dresta",
	"Alex_Flores",
	"Travis Dalkowa",
	"Atom"
};

new QUIT_KEYWORDS[][16] =
{
	"7q",
	"(q",
	"9/q",
	"(/q",
	"*/q",
	")q",
	"8q",
	"9q"
};

new INVALID_WORDS[][] =
{
	"zoor",
	"zo0r",
	"samphub",
	"chanpu",
	"champu",
	"fenixzone",
	"pene",
	"vagina",
	"mierda",
	"goldenstate",
	"unplayer",
	"spell",
	"ecuazone",
	"pelotudo",
	"boludo",
	"omegazone",
	"starrp",
	"fabiking",
	"kreisel",
	"pingote",
	"kanox",
	"lexerzone",
	"puta",
	"sampdroid",
	"samp droid",
	"samp_droid",
	"puto",
	"put0",
	"chupas",
	"adobe",
	"chitero",
	"bots",
	".ga",
	"b0ts",
	".net",
	".xyz",
	".ml",
	".tk",
	"samptab",
	"heix",
	"aver no",
	"aber no",
	"- mong",
	"aver sido",
	"aber sido",
	"blade",
	"yarmak",
	"scythekill",
	"exterminio total",
	"BOTNET",
	"botnet",
	"betazone",
	"imgui",
	"adri1",
	"superroleplay",
	"sampvoice",
	"daniel mor",
	"github",
	"b0tnet",
	"botn3t",
	"b o t n e t",
	"botonet",
	"bot n3t",
	"b0t net",
	"b0t n3t",
	"pawncode",
	"pawnes",
	"hispawno",
	"world champion pawno scripta",
	"bigmommymilkers"
};

new INVALID_NAMES[][100] =
{
	"Capija",
	"Mierda",
	"Caverga",
	"Melano",
	"Yahir_Kozel",
	"Apellido",
	"Sech",
	"Nombre",
	"Pija",
	"Conazo",
	"Misco_Jonnes",
	"Portuano",
	"Chorizo",
	"Turbado",
	"Nanero",
	"Pene",
	"Vagina",
	"Pompas",
	"Gaming",
	"Polainas",
	"Pingote",
	"Yarmak",
	"BetaZone",
	"Pearce",
	"Kanox",
	"Pingo",
	"Heix",
	"Avant",
	"Come_",
	"_Tela",
	"Morgan_Skulls",
	"Imgui",
	"ImGui",
	"Sampvoice",
	"Diablo",
	"Pito_Corto",
	"Empanada",
	"Hamburguesa",
	"Willyrex",
	"Telapone",
	"Tedoma",
	"Hambre",
	"Trabuco",
	"Mirry",
	"Mirri",
	"Verdesin",
	"Verdoso",
	"Verde",
	"Cheat",
	"Cheater",
	"Cheto",
	"Maricon",
	"Chitero",
	"Neptunia",
	"Pito",
	"Corto",
	"Fizio",
	"Peruano",
	"Boliviano",
	"Narizon",
	"Culon",
	"Gordo",
	"Teton",
	"Rubius",
	"Goku",
	"Vegeta",
	"Vegetta",
	"Puto",
	"Negro",
	"Fraca",
	"Heladero",
	"Panadero",
	"Whatsapp",
	"Facebook",
	"Instagram",
	"Lil_",
	"Gamer",
	"Chupador",
	"Play",
	"El_Vaginon",
	"El_",
	"Vaginon",
	"Elva_",
	"_Ginon",
	"Kreisel",
	"Ryan_West",
	"Entanga",
	"tanga",
	"Tanga",
	"abuela",
	"Abuela",
	"abuelo",
	"Abuelo"
};

new BAN_KEYWORDS[][100] =
{
	"fenixzone",
	"goldenstate",
	"golden state",
	"golden states",
	"unplayer",
	"z0ne",
	"zon3",
	"z0n3",
	"linox",
	"ZONE",
	"Z0NE",
	"LINOX",
	"z.o.n.e",
	"f.e.n.i.x",
	"samphub",
	"s4mp hub",
	"samp hub",
	"github",
	"b0tnet",
	"botn3t",
	"b o t n e t",
	"botonet",
	"bot n3t",
	"b0t net",
	"b0t n3t",
	"world champion pawno scripta",
	"sampvoice",
	"adobe",
	"ad0be",
	"ad0b3",
	"a.d.o.b.e",
	"b0ts",
	".net",
	".xyz",
	".ml",
	".tk",
	"bots",
	"omegazone",
	"ecuazone",
	"lexerzone",
	"sampdroid",
	"samp droid",
	"samp_droid",
	"B-O-T-S",
	"H-U-B",
	"b-o-t-s",
	"V0TS",
	"B0TS",
	"B-0-T-S",
	"VOTS",
	"V-O-T-S",
	"V-0-T-S",
	"B.O.T.S",
	"B.0.T.S",
	"V.O.T.S",
	"V.0.T.S",
	"B O T S",
	"B 0 T S",
	"V 0 T S",
	"V O T S",
	"H.U.B",
	"170.83.221.2",
	"BREÑAS",
	"cable color",
	"CABLE COLOR",
	"170.83.220.0/22",
	"doxbin",
	"wearelegal",
	"bit.ly",
	"dox",
	"server de mierda",
	"sampfive",
	"samp5",
	"sampfaiv",
	"samp five",
	"SAMPFIVE",
	"kreisel",
	"KREISEL",
	"SAMP FIVE"
};

new g_iPlayerLastUpdate[MAX_PLAYERS];

new const Float:NewUserPos[][] =
{
	{1090.567138, -1805.910156, 16.593750, 1.044739},
	{1098.168090, -1805.921508, 16.593750, 358.225128},
	{1109.456787, -1802.678344, 16.593750, 88.465942},
	{1109.102416, -1799.647583, 16.593750, 88.465942},
	{1108.857299, -1796.502441, 16.593750, 89.092605},
	{1108.432617, -1793.480102, 16.593750, 89.092605},
	{1108.954711, -1790.486816, 16.593750, 89.092605},
	{1108.645629, -1785.879882, 16.593750, 89.092559},
	{1109.832763, -1783.515502, 16.593750, 1.358403},
	{1097.333251, -1800.550903, 13.604625, 33.295372},
	{1096.499511, -1788.365478, 13.624750, 88.755897},
	{1084.961181, -1795.690673, 13.670027, 359.768463}
};

enum radio_enum
{
	r_NAME[64],
	r_TYPE[64],
	r_URL[264]
};
new RADIO_STATIONS[][radio_enum] =
{
	{"Loca FM", "Reggeton", "http://audio-online.net:2300/live"},
	{"Gozadera", "Variadas", "https://sonic.globalstream.pro:10961/1"},
	{"Rock FM", "Rock", "https://flucast-m01-01.flumotion.com/cope/rockfm.mp3"},
	{"UniversalRap", "HipHop", "http://streaming5.elitecomunicacion.es:8244/stream"},
	{"Soma FM", "Techno", "http://somafm.com/tags.pls"},
	{"Dubatek", "Drum'N'Bass", "http://web.zionsound.fr:8010/stream/1/"},
	{"Country NY", "Country", "https://streaming.radiostreamlive.com/radiocountrylive_devices"},
	{"BadRadio", "Phonk", "https://s2.radio.co/s2b2b68744/listen"},
	{"Hyaxe Radio", "Variadas", "http://boombox.hyaxe.com:8000/;?type=http&nocache=1"}
};

/*enum
{
	ACCOUNT_STATE_NORMAL,
	ACCOUNT_STATE_BANNED,
	ACCOUNT_STATE_TEMPBAN
};*/

#define MAX_PLAYER_POCKET_OBJECTS 10
enum Player_Pocket_Enum
{
	bool:player_pocket_VALID,
	player_pocket_object_ID,
	player_pocket_object_NAME[24],
	Float:player_pocket_object_HUNGRY,
	Float:player_pocket_object_THIRST,
	player_pocket_object_DRUNK
};
new PLAYER_POCKET[MAX_PLAYERS][MAX_PLAYER_POCKET_OBJECTS][Player_Pocket_Enum]; // PP (PlayerPocket)

//armas mercado negro
enum enum_BLACK_MARKT_WEAPONS
{
	black_market_WEAPON_ID,
	black_market_WEAPON_PRICE_BASE,
	black_market_WEAPON_PRICE
};
new BLACK_MARKT_WEAPONS[][enum_BLACK_MARKT_WEAPONS] =
{
	{41, 300, 0}, // Spray
	//{5, 250, 0}, Bate
	{22, 2500, 0}, // 9MM
	{28, 3500, 0}, // Micro UZI
	{32, 3600, 0}, // Tec 9
	{25, 4000, 0}, // Escopeta
	{26, 4500, 0}, // recortada
	{33, 5200, 0} // Rifle 
};

new Float:Fuel_Stations[][] =
{
	{1942.679443, -1771.374511, 13.390598},
	{654.678710, -570.627807, 16.335937},
	{1384.011962, 457.825012, 19.995258},
	{-1669.027221, 411.541076, 7.179687},
	{-2409.644042, 976.147644, 45.307708},
	{-1328.633666, 2675.913818, 50.062500},
	{612.890563, 1692.938720, 6.992187},
	{-1607.715820, -2717.499023, 48.539062},
	{2146.831542, 2743.855224, 10.820312},
	{2197.993408, 2475.015625, 10.820312},
	{2115.124267, 926.094909, 10.960937},
	{1595.974731, 2193.016845, 10.820312},
	{-1477.559326, 1858.962524, 32.639846},
	{-94.558959, -1160.146484, 1.735942},
	{2639.2466, 1098.9160, 10.8203},
	{2638.9070, 1109.4956, 10.8203},
	{2209.7957, 2476.2173, 10.8203}
};

new Float:Hp_Spawn_Interior_Pos[][] =
{
	{-201.967666,-1791.546630,675.785949,356.824615},
	{-201.944671,-1788.838867,675.785949,355.571289},
	{-207.176589,-1791.538818,675.785949,358.414764},
	{-207.400466,-1788.838867,675.785949,357.474700},
	{-211.549102,-1791.553588,675.785949,359.064758},
	{-211.472366,-1788.838867,675.785949,354.678070},
	{-211.854370,-1776.783935,675.786926,85.232192},
	{-209.154373,-1776.755981,675.786926,86.822257},
	{-209.161682,-1771.806030,675.786926,86.822265},
	{-211.861679,-1771.882324,675.786926,84.942245},
	{-209.161254,-1766.937133,675.785949,90.919052},
	{-211.853134,-1767.000244,675.785949,88.412361}
};

new 
Binco_Shop_Male_Skins[][] =
{
	/* BINCO - HOMBRE */
	{4, 75      , 0},
	{5, 75      , 0},
	{6, 90      , 0},
	{7, 80      , 0},
	{21, 121    , 0},
	{44, 65     , 0},
	{47, 119    , 0},
	{101, 149   , 0},
	{127, 89    , 0},
	{128, 25    , 0},
	{270, 200   , 0},
	{271, 200   , 0},
	{269, 200   , 0},
	{292, 200   , 0},
	{293, 200   , 0},
	{134, 25    , 0},
	{135, 25    , 0},
	{137, 19    , 0},
	{160, 55    , 0},
	{161, 68    , 0},
	{168, 39    , 0},
	{176, 79    , 0},
	{177, 65    , 0},
	{179, 110   , 0},
	{184, 150   , 0},
	{188, 160   , 0},
	{200, 15    , 0},
	{212, 30    , 0},
	{230, 10    , 0},
	{258, 69    , 0},
	{259, 69    , 0},
	{262, 50    , 0},
	{86, 70		, 0},
	{102, 100 , 0},
	{103, 100 , 0},
	{104, 100 , 0},
	{105, 100 , 0},
	{106, 100 , 0},
	{107, 100 , 0},
	{108, 100 , 0},
	{109, 100 , 0},
	{110, 100 , 0},
	{111, 100 , 0},
	{112, 100 , 0},
	{113, 100 , 0},
	{114, 100 , 0},
	{115, 100 , 0},
	{116, 100 , 0},
	{117, 100 , 0},
	{118, 100 , 0},
	{119, 100 , 0},
	{120, 100 , 0},
	{121, 100 , 0},
	{122, 100 , 0},
	{123, 100 , 0},
	{124, 100 , 0},
	{125, 100 , 0},
	{126, 100 , 0}
},

Binco_Shop_Female_Skins[][] =
{
	/* BINCO - MUJER */
	{13, 120   , 0},
	{41, 59    , 0},
	{56, 190   , 0},
	{65, 110   , 0},
	{69, 100   , 0},
	{75, 50    , 0},
	{89, 69    , 0},
	{151, 89   , 0},
	{152, 3000 , 0},
	{207, 500  , 0},
	{226, 120  , 0},
	{298, 900  , 0}
},

Suburban_Shop_Male_Skins[][] =
{
	/* SUBURBAN - HOMBRE */
	{2, 100   , 0},
	{3, 140   , 0},
	{20, 190  , 0},
	{23, 190  , 0},
	{24, 190  , 0},
	{25, 190  , 0},
	{43, 180  , 0},
	{48, 145  , 0},
	{60, 250  , 0},
	{100, 300 , 0},
	{112, 200 , 0},
	{119, 49  , 0},
	{143, 199 , 0},
	{180, 150 , 0},
	{183, 100 , 0},
	{184, 140 , 0},
	{241, 200 , 0},
	{242, 190 , 0},
	{247, 450 , 0},
	{248, 499 , 0},
	{249, 650 , 0},
	{264, 5   , 0}
},

Suburban_Shop_Female_Skins[][] =
{
	/* SUBURBAN - MUJER */
	{39, 109  , 0},
	{56, 100  , 0},
	{88, 140  , 0},
	{131, 200 , 0},
	{195, 199 , 0}
},

Prolaps_Shop_Male_Skins[][] =
{
	/* PROLAPS - HOMBRE */
	{29, 129  , 0},
	{36, 140  , 0},
	{37, 150  , 0},
	{51, 160  , 0},
	{293, 170  , 0},
	{52, 170  , 0},
	{96, 200  , 0},
	{99, 700  , 0},
	{206, 499 , 0},
	{22, 150 , 0},
	{154, 199 , 0}
},

Prolaps_Shop_Female_Skins[][] =
{
	/* PROLAPS - MUJER */
	{41, 199 , 0},
	{90, 250 , 0},
	{92, 860 , 0},
	{138, 150, 0},
	{139, 150, 0},
	{140, 159, 0},
	{190, 150, 0},
	{192, 180, 0},
	{193, 195, 0}
},

Didier_Shop_Male_Skins[][] =
{
	/* DIDIER - HOMBRE */
	{17, 2500  , 0},
	{46, 2900  , 0},
	{57, 2220  , 0},
	{82, 3400  , 0},
	{83, 3400  , 0},
	{84, 3400  , 0},
	{124, 4500 , 0},
	{147, 6000 , 0},
	{163, 4000 , 0},
	{166, 4000 , 0},
	{171, 4000 , 0},
	{187, 4500 , 0},
	{223, 3100 , 0},
	{240, 1500 , 0},
	{295, 3000 , 0},
	{294, 5000 , 0},
	{290, 5000 , 0}
},

Didier_Shop_Female_Skins[][] =
{
	/* DIDIER - MUJER */
	{11, 1500  , 0},
	{12, 3000  , 0},
	{40, 2500  , 0},
	{91, 8000  , 0},
	{141, 3500 , 0},
	{169, 4000 , 0},
	{172, 2100 , 0},
	{194, 2000 , 0},
	{214, 25000, 0},
	{215, 3200 , 0},
	{216, 10500, 0},
	{219, 9500 , 0}
},

Victim_Shop_Male_Skins[][] =
{
	/* VICTIM - HOMBRE */
	{19, 400   , 0},
	{46, 1200  , 0},
	{59, 900   , 0},
	{72, 599   , 0},
	{73, 699   , 0},
	{98, 339   , 0},
	{121, 200  , 0},
	{170, 500  , 0},
	{185, 400  , 0},
	{186, 900  , 0},
	{188, 350  , 0},
	{221, 700  , 0},
	{223, 1200 , 0},
	{250, 50000, 0},
	{289, 699  , 0},
	{299, 700  , 0},
	{303, 500  , 0},
	{304, 700  , 0}
},

Victim_Shop_Female_Skins[][] =
{
	/* VICTIM - MUJER */
	{12, 2900  , 0},
	{40, 3000  , 0},
	{55, 1010  , 0},
	{56, 400   , 0},
	{192, 3000 , 0},
	{211, 3500 , 0},
	{226, 600  , 0},
	{233, 900  , 0}
},

Zip_Shop_Male_Skins[][] =
{
	/* ZIP - HOMBRE */
	{121, 190  , 0},
	{170, 500  , 0},
	{185, 400  , 0},
	{186, 900  , 0},
	{19, 400   , 0},
	{46, 1200  , 0},
	{59, 905   , 0},
	{72, 400   , 0},
	{73, 650   , 0},
	{98, 320   , 0},
	{250, 49999, 0},
	{289, 622  , 0},
	{299, 730  , 0},
	{303, 550  , 0},
	{188, 350  , 0},
	{221, 700  , 0},
	{223, 1200 , 0},
	{304, 700  , 0}
},

Zip_Shop_Female_Skins[][] =
{
	/* ZIP - MUJER */
	{56, 405    , 0},
	{192, 3010  , 0},
	{211, 3520  , 0},
	{226, 620   , 0},
	{233, 950   , 0},
	{12, 2904   , 0},
	{40, 3002   , 0},
	{55, 1011   , 0}
};

enum Food_Info
{
	food_NAME[24],
	food_PRICE,
	Float:food_HUNGRY,
	Float:food_THIRST,
};
new PIZZA_FOOD[][Food_Info] =
{
	{"Pizza de verduras", 25, 10.0, -0.1},
	{"Pizza de jamón y queso", 60, 16.0, -0.1},
	{"Pizza barbacoa", 40, 15.0, -0.1},
	{"Pizza 4 quesos", 55, 14.0, -0.1},
	{"Ensalada", 20, 10.0, 5.0},
	{"Sprunk", 30, 0.0, 12.0},
	{"Agua", 30, 0.0, 19.0}
};
new BURGER_SHOT_FOOD[][Food_Info] =
{
	{"Hamburguesa normal", 60, 16.0, -0.1},
	{"Hamburguesa con pollo", 80, 10.0, -0.1},
	{"Hamburguesa vegana", 80, 10.0, -0.1},
	{"Hamburguesa especial", 60, 12.0, -3.0},
	{"Ensalada", 20, 10.0, 5.0},
	{"Sprunk", 30, 0.0, 12.0},
	{"Agua", 30, 0.0, 19.0}
};
new CLUCKIN_BELL_FOOD[][Food_Info] =
{
	{"Alitas de pollo", 60, 16.0, -0.1},
	{"Papas fritas", 80, 18.0, -2.0},
	{"Pato asado", 80, 18.0, -2.0},
	{"Pollo al horno", 80, 18.0, -2.0},
	{"Ensalada", 20, 10.0, 5.0},
	{"Sprunk", 30, 0.0, 12.0},
	{"Agua", 30, 0.0, 19.0}
};

new Toys_Bones[][24] =
{
	{"Espalda"},
	{"Cabeza"},
	{"Brazo izquierdo"},
	{"Brazo derecho"},
	{"Mano izquierda"},
	{"Mano derecha"},
	{"Muslo izquierdo"},
	{"Muslo derecho"},
	{"Pie izquierdo"},
	{"Pie derecho"},
	{"Pantorrilla derecha"},
	{"Pantorrilla izquierda"},
	{"Antebrazo izquierdo"},
	{"Antebrazo derecho"},
	{"Hombro izquierdo"},
	{"Hombro derecho"},
	{"Cuello"},
	{"Boca"}
};

enum Toys_Info
{
	shop_toy_model[24],
	shop_toy_modelid,
	shop_toy_price_base,
	shop_toy_price,
}
new Toys_Shop[][Toys_Info] =
{
	// Halloween
	#if defined HALLOWEEN_MODE
		{"Caldera", 19527, 3000, 0},
		{"Bruja", 19528, 3000, 0},
		{"Diablo", 11704, 3000, 0},
		{"Calabaza", 19320, 3000, 0},
	#endif
	#if defined CHRISTMAS_MODE
		{"Gorro JOJO", 19064, 3000, 0},
		{"HappyXmas", 19066, 3000, 0},
		{"Arbol", 19076, 10000, 0},
		{"XmaxBox1", 19054, 3500, 0},
		{"XmaxBox2", 19055, 3500, 0},
		{"XmaxBox3", 19056, 3500, 0},
		{"XmaxBox4", 19058, 3500, 0},
		{"XmaxBox5", 19057, 3500, 0},
	#endif
	// Normal
	{"motorcyclehelmet2", 18976, 2000, 0},
	{"motorcyclehelmet3", 18977, 500, 0},
	{"motorcyclehelmet4", 18978, 500, 0},
	{"motorcyclehelmet5", 18979, 500, 0},
	{"sillyhelmet2", 19114, 100, 0},
	{"sillyhelmet3", 19115, 200, 0},
	{"plainhelmet1", 19116, 75, 0},
	{"plainhelmet2", 19117, 75, 0},
	{"plainhelmet3", 19118, 75, 0},
	{"plainhelmet4", 19119, 75, 0},
	{"plainhelmet5", 19120, 75, 0},
	{"glassestype1", 19006, 2000, 0},
	{"glassestype2", 19007, 2000, 0},
	{"glassestype3", 19008, 2000, 0},
	{"glassestype4", 19009, 2000, 0},
	{"glassestype5", 19010, 2000, 0},
	{"glassestype6", 19011, 2000, 0},
	{"glassestype7", 19012, 2000, 0},
	{"glassestype8", 19013, 2000, 0},
	{"glassestype9", 19014, 2000, 0},
	{"glassestype10", 19015, 2000, 0},
	{"glassestype11", 19016, 2000, 0},
	{"glassestype12", 19017, 2000, 0},
	{"glassestype13", 19018, 2000, 0},
	{"glassestype14", 19019, 2000, 0},
	{"glassestype15", 19020, 2000, 0},
	{"glassestype16", 19021, 2000, 0},
	{"glassestype17", 19022, 2000, 0},
	{"glassestype18", 19023, 2000, 0},
	{"glassestype19", 19024, 2000, 0},
	{"glassestype20", 19025, 2000, 0},
	{"glassestype21", 19026, 2000, 0},
	{"glassestype22", 19027, 2000, 0},
	{"glassestype23", 19028, 2000, 0},
	{"glassestype24", 19029, 2000, 0},
	{"glassestype25", 19030, 2000, 0},
	{"glassestype26", 19031, 2000, 0},
	{"glassestype27", 19032, 2000, 0},
	{"glassestype28", 19033, 2000, 0},
	{"glassestype29", 19034, 2000, 0},
	{"glassestype30", 19035, 2000, 0},
	{"policeglasses1", 19138, 2300, 0},
	{"policeglasses2", 19139, 2300, 0},
	{"policeglasses3", 19140, 2300, 0},
	{"crewna1", 18891, 600, 0},
	{"crewna2", 18892, 600, 0},
	{"crewna3", 18893, 600, 0},
	{"crewna4", 18894, 600, 0},
	{"crewna5", 18895, 600, 0},
	{"crewna6", 18896, 600, 0},
	{"crewna7", 18897, 600, 0},
	{"crewna8", 18898, 600, 0},
	{"crewna9", 18899, 600, 0},
	{"crewna10", 18900, 600, 0},
	{"crewna11", 18901, 600, 0},
	{"crewna12", 18902, 600, 0},
	{"crewna13", 18903, 600, 0},
	{"crewna14", 18904, 600, 0},
	{"crewna15", 18905, 600, 0},
	{"crewna16", 18906, 600, 0},
	{"crewna17", 18907, 600, 0},
	{"crewna18", 18908, 600, 0},
	{"crewna19", 18909, 600, 0},
	{"crewna20", 18910, 600, 0},
	{"mask1", 18911, 500, 0},
	{"mask2", 18912, 500, 0},
	{"mask3", 18913, 500, 0},
	{"mask4", 18914, 500, 0},
	{"mask5", 18915, 500, 0},
	{"mask6", 18916, 500, 0},
	{"mask7", 18917, 500, 0},
	{"mask8", 18918, 500, 0},
	{"mask9", 18919, 500, 0},
	{"mask10", 18920, 500, 0},
	{"watchtype1", 19039, 3000, 0},
	{"watchtype2", 19040, 3000, 0},
	{"watchtype3", 19041, 3000, 0},
	{"watchtype4", 19042, 3000, 0},
	{"watchtype5", 19043, 3000, 0},
	{"watchtype6", 19044, 3000, 0},
	{"watchtype7", 19045, 3000, 0},
	{"watchtype8", 19046, 3000, 0},
	{"watchtype9", 19047, 3000, 0},
	{"watchtype10", 19048, 3000, 0},
	{"watchtype11", 19049, 3000, 0},
	{"watchtype12", 19050, 3000, 0},
	{"watchtype13", 19051, 3000, 0},
	{"watchtype14", 19052, 3000, 0},
	{"watchtype15", 19053, 3000, 0},
	{"beret1", 18921, 1150, 0},
	{"beret2", 18922, 1150, 0},
	{"beret3", 18923, 1150, 0},
	{"beret4", 18924, 1150, 0},
	{"beret5", 18925, 1150, 0},
	{"cj_tommy_hat", 2052, 200, 0},
	{"cj_jerry_hat", 2053, 200, 0},
	{"cj_capy_hat", 2054, 2000, 0},
	{"hardhat1", 18638, 300, 0},
	{"hardhat2", 19093, 450, 0},
	{"hardhat3", 19160, 450, 0},
	{"blackhat1", 18639, 600, 0},
	{"hat1", 18926, 650, 0},
	{"hat2", 18927, 650, 0},
	{"hat3", 18928, 650, 0},
	{"hat4", 18929, 650, 0},
	{"hat5", 18930, 650, 0},
	{"hat6", 18931, 650, 0},
	{"hat7", 18932, 650, 0},
	{"hat8", 18933, 650, 0},
	{"hat9", 18934, 650, 0},
	{"hat10", 18935, 650, 0},
	{"hatboater1", 18944, 800, 0},
	{"hatboater2", 18945, 800, 0},
	{"hatboater3", 18946, 800, 0},
	{"hatbowler1", 18947, 1200, 0},
	{"hatbowler2", 18948, 1200, 0},
	{"hatbowler3", 18949, 1200, 0},
	{"hatbowler4", 18950, 1200, 0},
	{"hatbowler5", 18951, 1200, 0},
	{"hatbowler6", 19488, 1200, 0},
	{"cowboyhat1", 19095, 1150, 0},
	{"cowboyhat2", 18962, 1150, 0},
	{"cowboyhat3", 19096, 1150, 0},
	{"cowboyhat4", 19097, 1150, 0},
	{"cowboyhat5", 19098, 1150, 0},
	{"hatman1", 18967, 650, 0},
	{"hatman2", 18968, 650, 0},
	{"hatman3", 18969, 650, 0},
	{"hatman3", 18969, 650, 0},
	{"hattiger1", 18970, 1500, 0},
	{"hatcool1", 18971, 1500, 0},
	{"hatcool2", 18972, 1500, 0},
	{"hatcool3", 18973, 1500, 0},
	{"hoodyhat1", 19067, 500, 0},
	{"hoodyhat2", 19068, 500, 0},
	{"hoodyhat3", 19069, 500, 0},
	{"policehat1", 19161, 2500, 0},
	{"policehat2", 19162, 2500, 0},
	{"tophat01", 19352, 700, 0},
	{"tophat02", 19487, 700, 0},
	{"pilothat01", 19520, 3000, 0},
	{"policehat01", 19521, 3000, 0},
	{"strawhat1", 19553, 450, 0},
	{"pizzahat1", 19558, 100, 0},
	{"hikerbackpack1", 19559, 600, 0},
	{"hair1", 19517, 1000, 0},
    {"hair2", 19516, 1000, 0},
    {"hair3", 19077, 1000, 0},
    {"hair4", 18975, 1000, 0},
    {"cluckinbellhat", 19137, 2500, 0},
    {"firehat01", 19330, 3000, 0},
    {"firehat02", 19331, 3000, 0},
    {"burgershothat1", 19094, 2000, 0},
    {"captruker1", 18961, 1000, 0},
    {"bassguitar01", 19317, 2100, 0},
    {"bassguitar02", 19318, 2100, 0},
    {"boxinghelmet01", 18952, 1500, 0},
    {"hockeymas1", 19036, 1700, 0},
    {"theparrot1", 19078, 7500, 0},
    {"armour", 19515, 7000, 0},
    {"glimpmask1", 19163, 2500, 0},
    {"headphones02", 19422, 1500, 0},
    {"Disfraz de Arbusto", 805, 40000, 0},
    {"Disfraz de Caja", 1271, 40000, 0},
    {"Disfraz de Correo", 1291, 40000, 0},
    {"Disfraz de Basura", 1328, 40000, 0},
    {"Hamburguesita en hd", 2703, 6000, 0},
    {"parachute", 371, 2200, 0}
};

enum
{
	BANK_TRANSACTION_WITHDRAW,
	BANK_TRANSACTION_DEPOSIT,
	BANK_TRANSACTION_TRANSFER_SENT,
	BANK_TRANSACTION_TRANSFER_RECE,
	BANK_TRANSACTION_CREATE_ACCOUNT,
	BANK_TRANSACTION_BUY_PROPERTY,
	BANK_TRANSACTION_SOLD_PROPERTY,
	BANK_TRANSACTION_BUY_VEHICLE,
	BANK_TRANSACTION_SOLD_VEHICLE
};
enum Bank_Interior_Info
{
	bank_INTERIOR_TYPE,
	Float:bank_X,
	Float:bank_Y,
	Float:bank_Z,
	bank_WORLD,
	bank_INTERIOR
};
/*new Bank_Interior_Positions[][Bank_Interior_Info] =
{
	{INTERIOR_BANK_LS, 1239.006958,-1426.057983,1992.564575, 5, 5},
	{INTERIOR_BANK_SF, 1239.006958,-1426.057983,1992.564575, 10, 10},
	{INTERIOR_BANK_LV, 1239.006958,-1426.057983,1992.564575, 15, 15}
};*/

new Float:HARVEST_CHECKPOINTS[][] =
{
	{-328.332305, -1546.391357, 16.15409},
	{-250.803207, -1553.425415, 4.534295},
	{-224.260910, -1485.022827, 8.041003},
	{-308.437896, -1476.776977, 11.40934},
	{-283.487731, -1553.320068, 7.445997},
	{-258.756164, -1426.692993, 9.493670},
	{-178.887649, -1406.682250, 3.996473},
	{-177.676818, -1322.970581, 6.885325},
	{-305.899322, -1318.196533, 10.12089},
	{-325.471008, -1412.821777, 15.12606},
	{-191.962982, -1384.020019, 6.075732},
	{-214.637603, -1321.270507, 10.79362},
	{-263.975738, -1375.987426, 11.41642},
	{-308.705474, -1424.302001, 15.52844},
	{-287.710388, -1497.158325, 8.503927},
	{-387.908111, -1532.118774, 23.47214}
};

new Float:MECHANIC_POSITIONS[][] =
{
	{1048.312622, -923.895812, 43.018077},
	{1058.781250, -890.199401, 43.618721},
	{1053.702758, -890.891235, 43.494247},
	{1049.278198, -899.481567, 43.382476},
	{1044.121948, -900.377258, 43.248786},
	{1038.639160, -900.513549, 43.121448},
	{1033.095703, -901.057678, 42.981224}
};

enum actors_info
{
	bool:a_IN_ROB,
	a_LAST_ROB,
	a_IN_ROB_PROGRESS
}
new a_TMP[MAX_ACTORS][actors_info];

/* SYSTEM - PLAYERTEMP */
enum
{
	PED_STOPPED,
	PED_WALKING,
	PED_RUNNING,
	PED_SPRINTING,
	PED_BYCICLING
};

enum
{
	MECHANIC_OPTION_REPAIR,
	MECHANIC_OPTION_COLOR_1,
	MECHANIC_OPTION_COLOR_2,
	MECHANIC_OPTION_TUNING,
	MECHANIC_OPTION_PAINTJOB
};

