#define MAX_CLUBS 100
enum club_obj_enum
{
	bool:club_VALID,
	club_ID,
	club_DB_ID,
	club_USER_ID,
	club_NAME[32],
	club_WELCOME[64],
	club_INTERIOR,
	club_BALANCE,
	CLUB_ENTER_PRICE,
	club_PRICE
};
new CLUBS[MAX_CLUBS][club_obj_enum];