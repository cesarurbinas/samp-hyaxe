enum Visual_Inventory
{
	bool:slot_VALID[13],
	slot_TYPE[13],
	PlayerText:slot_TD_ID[13],
	slot_AMMOUNT[13],
	bool:slot_WEAPON[13],
	slot_WEAPON_SLOT[13],
	slot_COLOR[13],
	slot_DB_ID[13]
}
new 
	PLAYER_VISUAL_INV[MAX_PLAYERS][Visual_Inventory],
	PROPERTY_VISUAL_INV[MAX_PLAYERS][Visual_Inventory]
;