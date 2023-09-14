enum Visual_Inventory
{
	bool:slot_VALID[12],
	slot_TYPE[12],
	PlayerText:slot_TD_ID[12],
	slot_AMMOUNT[12],
	bool:slot_WEAPON[12],
	slot_WEAPON_SLOT[12],
	slot_COLOR[12],
	slot_DB_ID[12]
}
new 
	PLAYER_VISUAL_INV[MAX_PLAYERS][Visual_Inventory],
	PROPERTY_VISUAL_INV[MAX_PLAYERS][Visual_Inventory]
;