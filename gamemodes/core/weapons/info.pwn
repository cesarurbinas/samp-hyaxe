// PLAYER WEAPONS
#define NO_WEAPON 0
enum enum_WEAPON_INFO
{
	bool:weapon_info_ANTI_CHEAT,
	bool:weapon_info_AMMO,
	weapon_info_TYPE,
	weapon_info_NAME[32],
	weapon_info_SLOT,
	weapon_info_SHOT_TIME
};
new WEAPON_INFO[][enum_WEAPON_INFO] =
{
	{false, false, NO_WEAPON, "Pu�o", 0, 250},
	{true, false, WEAPON_BRASSKNUCKLE, "Manopla", 0, 250},
	{true, false, WEAPON_GOLFCLUB, "Palo de golf", 1, 250},
	{true, false, WEAPON_NITESTICK, "Porra", 1, 250},
	{true, false, WEAPON_KNIFE, "Cuchillo", 1, 250},
	{true, false, WEAPON_BAT, "Bate", 1, 250},
	{true, false, WEAPON_SHOVEL, "Pala", 1, 250},
	{true, false, WEAPON_POOLSTICK, "Taco", 1, 250},
	{true, false, WEAPON_KATANA, "Katana", 1, 250},
	{true, false, WEAPON_CHAINSAW, "Motosierra", 1, 30},
	{true, false, WEAPON_DILDO, "Dildo poderoso", 10, 250},
	{true, false, WEAPON_DILDO2, "Dildo", 10, 250},
	{true, false, WEAPON_VIBRATOR, "Vibrador", 10, 250},
	{true, false, WEAPON_VIBRATOR2, "Vibrador plateado", 10, 250},
	{true, false, WEAPON_FLOWER, "Flores", 10, 250},
	{true, false, WEAPON_CANE, "Bast�n", 10, 250},
	{true, true, WEAPON_GRENADE, "Granada", 8, 500},
	{true, true, WEAPON_TEARGAS, "Gas lacrim�geno", 8, 500},
	{true, true, WEAPON_MOLTOV, "Cocktail Molotov", 8, 500},
	{false, false, NO_WEAPON, "", 0, 0},
	{false, false, NO_WEAPON, "", 0, 0},
	{false, false, NO_WEAPON, "", 0, 0},
	{true, true, WEAPON_COLT45, "9mm", 2, 300},
	{true, true, WEAPON_SILENCED, "Tazer", 2, 400},
	{true, true, WEAPON_DEAGLE, "Desert Eagle", 2, 800},
	{true, true, WEAPON_SHOTGUN, "Escopeta", 3, 1060},
	{true, true, WEAPON_SAWEDOFF, "Escopeta recortada", 3, 300},
	{true, true, WEAPON_SHOTGSPA, "Escopeta de combate", 3, 320},
	{true, true, WEAPON_UZI, "Uzi", 4, 120},
	{true, true, WEAPON_MP5, "MP5", 4, 100},
	{true, true, WEAPON_AK47, "Ak-47", 5, 120},
	{true, true, WEAPON_M4, "M4", 5, 120},
	{true, true, WEAPON_TEC9, "Tec-9", 4, 120},
	{true, true, WEAPON_RIFLE, "Rifle", 6, 1060},
	{true, true, WEAPON_SNIPER, "Sniper", 6, 1060},
	{true, true, WEAPON_ROCKETLAUNCHER, "Lanzacohetes RPG", 7, 1000},
	{true, true, WEAPON_HEATSEEKER, "Lanzacohetes HS", 7, 1000},
	{true, true, WEAPON_FLAMETHROWER, "Lanzallamas", 7, 500},
	{true, true, WEAPON_MINIGUN, "Minigun", 7, 0},
	{true, true, WEAPON_SATCHEL, "Bomba detonadora", 8, 500},
	{false, false, WEAPON_BOMB, "Detonador", 12, 500},
	{false, true, WEAPON_SPRAYCAN, "Bote de spray", 9, 10},
	{true, true, WEAPON_FIREEXTINGUISHER, "Extintor", 9, 10},
	{true, false, WEAPON_CAMERA, "C�mara", 9, 500},
	{true, false, NO_WEAPON, "Gafas de visi�n nocturna", 11, 0},
	{true, false, NO_WEAPON, "Gafas t�rmicas", 11, 0},
	{true, false, WEAPON_PARACHUTE, "Paraca��das", 11, 0}
};