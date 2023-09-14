enum store_product_enum
{
	st_NAME[32],
	st_PRICE,
	st_TYPE,
	st_EXTRA
};

new STORE_PRODUCTS[][store_product_enum] =
{
	{"VIP Turbo de un mes", 3, 3, 31},
	{"20 HyCoins", 5, 0, 20},
	{"50 HYCoins", 10, 3, 50},
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