#define MAX_PRINTERS 1000

enum Printers_Enum
{
	bool:mp_VALID,
	mp_OBJECT,
	Text3D:mp_LABEL,
    Float:mp_HEALTH,
    Float:mp_X,
    Float:mp_Y,
    Float:mp_Z,
	mp_OWNER = INVALID_PLAYER_ID,
	mp_INTERIOR,
	mp_WORLD,
    mp_CASH
};
new MONEY_PRINTERS[MAX_PRINTERS][Printers_Enum];