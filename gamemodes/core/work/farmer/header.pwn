// AGRICULTOR
enum
{
	TYPE_LEGAL,
	TYPE_ILLEGAL
};

enum
{
	PLANT_TYPE_MEDICINE,     // VIDA
	PLANT_TYPE_CANNABIS,     // YOKSETIOXD
	PLANT_TYPE_CRACK         //CHALECO
}

enum seed_info_enum
{
	seed_info_TYPE,
	seed_info_PLANT_TYPE,
	seed_info_EXP,
	seed_info_NAME[24],
	seed_info_PRICE
};
new seed_info[][seed_info_enum] =
{
	{TYPE_LEGAL, PLANT_TYPE_MEDICINE, 0, "Aloe vera", 30},
	{TYPE_ILLEGAL, PLANT_TYPE_CANNABIS, 100, "Marihuana", 50},
	{TYPE_ILLEGAL, PLANT_TYPE_CRACK, 200, "Coca", 100}
};

enum plant_info_enum
{
	plant_info_SEEDS,
	plant_info_NAME[24]
};
new plant_info[][plant_info_enum] =
{
	{2, "Medicamento"},
	{4, "Marihuana"},
	{5, "Crack"}
};

#define MAX_PLANTS 4000
enum PLANTS_ENUM
{
	bool:plant_VALID,
	bool:plant_GROWING,
	bool:plant_INVISIBLE,
	Float:plant_GROWING_PROGRESS,
	plant_TYPE,
	plant_PLANTED_BY_ACCOUNT_ID,
	plant_PLANTED_BY_NAME[24],
	plant_OBJECT_ID,
	Text3D:plant_LABEL_ID,
	plant_EXPIRE_TIME,
	plant_TIMER
};
new PLANTS[MAX_PLANTS][PLANTS_ENUM];

enum
{
	OBJECT_TYPE_NONE,
	OBJECT_TYPE_PLANT
};

GetPlayerPlantedPlants(playerid)
{
	new plants;

	for(new i = 0; i != MAX_PLANTS; i ++)
	{
		if (!PLANTS[i][plant_VALID]) continue;
		if (PLANTS[i][plant_PLANTED_BY_ACCOUNT_ID] == ACCOUNT_INFO[playerid][ac_ID]) plants ++;
	}
	return plants;
}