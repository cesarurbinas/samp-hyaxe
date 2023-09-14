#define MAX_CLUBS 100
enum club_obj_enum
{
	bool:club_VALID,
	club_ID,
	club_USER_ID,
	club_NAME[32],
	club_WELCOME[64],
	club_INTERIOR,
	club_BALANCE,
	CLUB_ENTER_PRICE,
	club_PRICE
};
new CLUBS[MAX_CLUBS][club_obj_enum];

#define MAX_CLUBS_PRODUCTS 1000
enum club_products_enum
{
	bool:product_VALID,
	product_ID,
	product_CLUB_ID,
	product_NAME[32],
	product_TYPE,
	product_EXTRA,
	product_PRICE
};
new CLUBS_PRODUCTS[MAX_CLUBS_PRODUCTS][club_products_enum];