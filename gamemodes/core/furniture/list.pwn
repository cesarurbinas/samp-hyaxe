enum enum_furtniture_objects
{
	furniture_object_MODELID,
	furniture_object_NAME[32],
	furniture_object_PRICE,
	furniture_object_TYPE
};
new FURNITURE_OBJECTS[][enum_furtniture_objects] =
{
	// Camas
	{2603, "Blanca", 1000, 0},
	{1771, "Sucia", 1000, 0},
	{2308, "Petiza", 1000, 0},
	{1794, "Petizona", 1000, 0},
	{14866, "Bobbie", 1000, 0},
	{11720, "Sweet", 1000, 0},
	{2301, "Med", 1000, 0},
	{14446, "Smokes", 1000, 0},
	{2298, "Swank", 1000, 0},
	{2299, "Swank 2", 1000, 0},
	{1803, "Med 1", 1000, 0},
	{1797, "Future", 1000, 0},
	{1793, "Low", 1000, 0},
	{1795, "Swank 3", 1000, 0},
	// Cuadros
	{2277, "Frame fab", 300, 1},
	{19172, "Maria", 300, 1},
	{2282, "Thick", 300, 1},
	{2258, "Frame clip", 300, 1},
	{2263, "Slim", 300, 1},
	{2260, "Slim 1", 300, 1},
	{2272, "Fab 5", 300, 1},
	{2276, "Fab 3", 300, 1},
	{2284, "Rusky", 300, 1},
	{2281, "Thick 5", 300, 1},
	{2268, "Wood", 300, 1},
	{2267, "Barquito", 300, 1},
	{2266, "Torre", 300, 1},
	{2261, "Puente", 300, 1},
	{19173, "SanFierro", 300, 1},
	{19174, "Nose", 300, 1},
	{19175, "Lmao", 300, 1},
	{2273, "Parati", 300, 1},
	// Decoracion
	{11725, "Fogata", 700, 2},
	{2114, "Pelota", 700, 2},
	{2901, "Paja", 700, 2},
	{2737, "Piazarra", 700, 2},
	{11724, "Fog", 700, 2},
	{1657, "Ventilador", 700, 2},
	{3031, "Antena", 700, 2},
	{946, "Bsklax", 700, 2},
	{2176, "CasinoLight", 700, 2},
	{2241, "Plant", 700, 2},
	{2001, "Plant ofc", 700, 2},
	{2245, "Flores", 700, 2},
	{2240, "Pot", 700, 2},
	{2244, "Pot2", 700, 2},
	{2345, "Pot3", 700, 2},
	{2251, "Pot20", 700, 2},
	{2252, "Pot21", 700, 2},
	{2253, "Pot22", 700, 2},
	{2194, "Cactus", 700, 2},
	{2195, "Pot3", 700, 2},
	{950, "Pot12", 700, 2},
	{949, "Pot3", 700, 2},
	{948, "Plantika", 700, 2},
	{14804, "Palmerita", 700, 2},
	{1361, "Bush", 700, 2},
	{2811, "Roman", 700, 2},
	{638, "Planter", 700, 2},
	{3810, "Colgante", 700, 2},
	// Electrodomesticos
	{1429, "Tele 1", 900, 3},
	{2139, "Mesada", 900, 3},
	{2303, "Mesada 2", 900, 3},
	{2133, "Gabinete", 900, 3},
	{2134, "Gabinete simple", 900, 3},
	{2067, "Fileing", 900, 3},
	{2609, "Fileing 2", 900, 3},
	{2335, "Mesada 3", 900, 3},
	{19930, "Mesada 4", 900, 3},
	{2338, "Esquinero", 900, 3},
	{2341, "Esquinero 2", 900, 3},
	{19787, "LCD TV", 900, 3},
	{19915, "Cooker", 900, 3},
	{2606, "Teles", 900, 3},
	{19927, "Pileta", 900, 3},
	{19926, "Mesada 3", 900, 3},
	{2137, "Gabinete 4", 900, 3},
	{2129, "Gabinete 5", 900, 3},
	// Iluminacion
	{19152, "SpotVerde", 200, 4},
	{19150, "SpotBlanco", 200, 4},
	{19147, "SpotYellow", 200, 4},
	{19149, "SpotTurka", 200, 4},
	{19144, "SpotNranja", 200, 4},
	{19153, "Spot777", 200, 4},
	{2239, "3luce", 200, 4},
	{2107, "Lam", 200, 4},
	{2106, "Lam1", 200, 4},
	{2070, "Lam3", 200, 4},
	{1734, "TechoLu", 200, 4},
	{2069, "PisoLu", 200, 4},
	{2073, "TechoLu2", 200, 4},
	{2074, "Pobre", 200, 4},
	{2075, "Rojin", 200, 4},
	{2076, "Trepalo", 200, 4},
	{11726, "Rikaso", 200, 4},
	{16779, "Ufo", 200, 4},
	{19128, "Dance", 200, 4},
	{3801, "Lite", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	{1000, "", 200, 4},
	
};