enum store_product_enum
{
	store_NAME[64],
	store_PRICE,
	store_TYPE,
	store_EXTRA
};

new STORE_PRODUCTS[][store_product_enum] =
{
	{"VIP Turbo de un mes", 3, 3, 31},
	{"20 HyCoins", 5, 0, 20},
	{"50 HyCoins", 10, 3, 50},
	{"1.000.000 Cash", 8, 1, 1000000},
	{"10 Niveles", 10, 4, 10},
	{"HotDog Móvil", 3, 5, 588},
	{"Dodo (Avión)", 5, 5, 593},
	{"Shamal (Avión)", 5, 5, 519},
	{"Maverick (Helicóptero)", 10, 5, 487},
	{"Squalo (Barco)", 5, 5, 446},
	{"Tropic (Barco)", 10, 5, 454},
	{"Dinghy (Lancha)", 3, 5, 473},
	{"Marquis (Barco)", 5, 5, 484},
	{"Jetmax (Barco)", 5, 5, 493},
	{"Skin de CJ", 3, 6, 0}
};

/*
0 = HyCoins
1 = Dinero
2 = VIP Classic
3 = VIP Turbo
4 = Nivel
5 = Vehiculo
6 = Skin
*/