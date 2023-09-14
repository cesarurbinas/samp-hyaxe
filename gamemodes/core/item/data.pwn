#define MAX_DROP_ITEMS 8000
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
	itm_COLOR
};
new DROP_ITEMS[MAX_DROP_ITEMS][Droped_Items_Enum];