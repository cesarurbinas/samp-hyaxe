new g_iInvLastTick[MAX_PLAYERS];

enum Inventory_Types
{
	PLAYER_INVENTORY,
	PROPERTY_INVENTORY_TAKE,
	PROPERTY_INVENTORY_PUT,
	VEHICLE_INVENTORY_TAKE,
	VEHICLE_INVENTORY_PUT
}

enum Visual_Inventory
{
	bool:slot_VALID[13],
	slot_TYPE[13],
	PlayerText:slot_TD_ID[13],
	slot_AMMOUNT[13],
	slot_COLOR[13],
	slot_DB_ID[13]
}
new 
	PLAYER_VISUAL_INV[MAX_PLAYERS][Visual_Inventory],
	PROPERTY_VISUAL_INV[MAX_PLAYERS][Visual_Inventory]
;