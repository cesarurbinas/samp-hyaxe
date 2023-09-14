/* SYSTEM - PHONE */
enum
{
	CALL_GAME_STATE_NONE,
	CALL_STATE_WAITING_RESPONSE,
	CALL_STATE_INCOMING_CALL,
	CALL_STATE_ESTABLISHED
};

enum
{
	PHONE_STATE_ON,
	PHONE_STATE_OFF
};
enum Phone_Info_Enum
{
	player_phone_VALID,
	player_phone_NUMBER,
	player_phone_STATE,
	player_phone_VISIBLE_NUMBER // para elegir si quieres aparecer en la guia o no
};
new PLAYER_PHONE[MAX_PLAYERS][Phone_Info_Enum]; //PPI (PlayerPhoneInfo)

#define MAX_PHONE_CONTACTS    20
enum Phone_Book_Enum
{
	phone_book_contact_VALID,

	phone_book_contact_ID,
	phone_book_contact_NAME[24],
	phone_book_contact_PHONE_NUMBER
};
new PLAYER_PHONE_BOOK[MAX_PLAYERS][MAX_PHONE_CONTACTS][Phone_Book_Enum]; //PB = PhoneBook