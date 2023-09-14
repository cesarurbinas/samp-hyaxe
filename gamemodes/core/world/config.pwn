LoadServerInfo()
{
	new File:ECO = fopen("CONFIG_FILES/ECO.txt", io_read), eco_str[256];
	if (ECO)
	{
		fread(ECO, eco_str);
		sscanf(eco_str, "p<,>fffffd", MULTIPLIER_PROPERITES, MULTIPLIER_VEHICLES, MULTIPLIER_TOYS, MULTIPLIER_SKINS, MULTIPLIER_WEAPONS, SU_SD_PRICE);
		fclose(ECO);
	}


	new File:AC = fopen("CONFIG_FILES/AC.txt", io_read), ac_str[128], ac_num;
	if (AC)
	{
		while(fread(AC, ac_str))
		{
			if (ac_num >= sizeof(ac_Info)) break;
			sscanf(ac_str, "p<,>bbdd", ac_Info[ac_num][ac_Enabled], ac_Info[ac_num][ac_Kick], ac_Info[ac_num][ac_Detections], ac_Info[ac_num][ac_Interval]);
			ac_num ++;
		}
		fclose(AC);
	}
	return 1;
}

WriteAnticheatRules()
{
	new File:AC = fopen("CONFIG_FILES/AC.txt", io_write), ac_str[128];
	if (AC)
	{
		for(new i = 0; i != sizeof(ac_Info); i ++)
		{
			format(ac_str, sizeof ac_str, "%d,%d,%d,%d\r\n", ac_Info[i][ac_Enabled], ac_Info[i][ac_Kick], ac_Info[i][ac_Detections], ac_Info[i][ac_Interval]);
			fwrite(AC, ac_str);
		}
		fclose(AC);
	}
	return 1;
}

WriteEconomyMultipliers()
{
	new File:ECO = fopen("CONFIG_FILES/ECO.txt", io_write), eco_str[256];
	if (ECO)
	{
		format(eco_str, sizeof eco_str, "%f,%f,%f,%f,%f,%d", MULTIPLIER_PROPERITES, MULTIPLIER_VEHICLES, MULTIPLIER_TOYS, MULTIPLIER_SKINS, MULTIPLIER_WEAPONS, SU_SD_PRICE);
		fwrite(ECO, eco_str);
		fclose(ECO);
	}
	return 1;
}

UpdateEconomy(type = -1)
{
	new label_str[256];

	if (type == -1)
	{
		for(new i = 0; i != MAX_PROPERTIES; i ++)
		{
			if (!PROPERTY_INFO[i][property_VALID]) continue;
			PROPERTY_INFO[i][property_PRICE] = floatround(PROPERTY_INFO[i][property_PRICE_BASE] * MULTIPLIER_PROPERITES, floatround_ceil);

			if (!PROPERTY_INFO[i][property_SOLD])
			{
				UpdateUnnocupiedPropertyLabel(i);
			}
		}

		for(new i = 0; i != MAX_VEHICLES; i ++)
		{
			if (!SELL_VEHICLES[i][sell_vehicle_VALID]) continue;
			SELL_VEHICLES[i][sell_vehicle_PRICE] = floatround(VEHICLE_INFO[ GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400 ][vehicle_info_PRICE] * MULTIPLIER_VEHICLES, floatround_ceil);

			if (SELL_VEHICLES[i][sell_vehicle_VIP_LEVEL]) SELL_VEHICLES[i][sell_vehicle_LEVEL] = 1;
			if (SELL_VEHICLES[i][sell_vehicle_EXTRA]) SELL_VEHICLES[i][sell_vehicle_PRICE] = 0;

			if (SELL_VEHICLES[i][sell_vehicle_VIP_LEVEL])
			{
				if (SELL_VEHICLES[i][sell_vehicle_EXTRA])
				{
					format
					(
						label_str,
							sizeof label_str,
							"\
								{F4DC42}Se requiere VIP (%d)\n\
								\n\
								"COL_YELLOW"%s\n\n\
								"COL_WHITE"Coste: "COL_YELLOW"%d "SERVER_COIN"\n\
								"COL_WHITE"Nivel: "COL_YELLOW"%d\
							", SELL_VEHICLES[i][sell_vehicle_VIP_LEVEL], VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_NAME], SELL_VEHICLES[i][sell_vehicle_EXTRA], SELL_VEHICLES[i][sell_vehicle_LEVEL]
					);
				}
				else
				{
					format
					(
						label_str,
							sizeof label_str,
							"\
								{F4DC42}Se requiere VIP (%d)\n\
								\n\
								"COL_YELLOW"%s\n\n\
								"COL_WHITE"Precio: "COL_YELLOW"%s$\n\
								"COL_WHITE"Nivel: "COL_YELLOW"%d\
							", SELL_VEHICLES[i][sell_vehicle_VIP_LEVEL], VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_NAME], number_format_thousand(SELL_VEHICLES[i][sell_vehicle_PRICE]), SELL_VEHICLES[i][sell_vehicle_LEVEL]
					);
				}
			}
			else
			{
				if (SELL_VEHICLES[i][sell_vehicle_EXTRA])
				{
					format
					(
						label_str,
							sizeof label_str,
							"\
								"COL_YELLOW"%s\n\n\
								"COL_WHITE"Coste: "COL_YELLOW"%d "SERVER_COIN"\n\
								"COL_WHITE"Nivel: "COL_YELLOW"%d\
							", VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_NAME], SELL_VEHICLES[i][sell_vehicle_EXTRA], SELL_VEHICLES[i][sell_vehicle_LEVEL]
					);
				}
				else
				{
					format
					(
						label_str,
							sizeof label_str,
							"\
								"COL_YELLOW"%s\n\n\
								"COL_WHITE"Precio: "COL_YELLOW"%s$\n\
								"COL_WHITE"Nivel: "COL_YELLOW"%d\
							", VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_NAME], number_format_thousand(SELL_VEHICLES[i][sell_vehicle_PRICE]), SELL_VEHICLES[i][sell_vehicle_LEVEL]
					);
				}
			}
			UpdateDynamic3DTextLabelText(SELL_VEHICLES[i][sell_vehicle_LABEL_ID], COLOR_WHITE, label_str);
		}

		for(new i = 0; i != sizeof(Toys_Shop); i ++) Toys_Shop[i][shop_toy_price] = floatround(Toys_Shop[i][shop_toy_price_base] * MULTIPLIER_TOYS, floatround_ceil);
		for(new i = 0; i != sizeof(Binco_Shop_Male_Skins); i ++) Binco_Shop_Male_Skins[i][2] = floatround(Binco_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Binco_Shop_Female_Skins); i ++) Binco_Shop_Female_Skins[i][2] = floatround(Binco_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Suburban_Shop_Male_Skins); i ++) Suburban_Shop_Male_Skins[i][2] = floatround(Suburban_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Suburban_Shop_Female_Skins); i ++) Suburban_Shop_Female_Skins[i][2] = floatround(Suburban_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Prolaps_Shop_Male_Skins); i ++) Prolaps_Shop_Male_Skins[i][2] = floatround(Prolaps_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Prolaps_Shop_Female_Skins); i ++) Prolaps_Shop_Female_Skins[i][2] = floatround(Prolaps_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Didier_Shop_Male_Skins); i ++) Didier_Shop_Male_Skins[i][2] = floatround(Didier_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Didier_Shop_Female_Skins); i ++) Didier_Shop_Female_Skins[i][2] = floatround(Didier_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Victim_Shop_Male_Skins); i ++) Victim_Shop_Male_Skins[i][2] = floatround(Victim_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Victim_Shop_Female_Skins); i ++) Victim_Shop_Female_Skins[i][2] = floatround(Victim_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Zip_Shop_Male_Skins); i ++) Zip_Shop_Male_Skins[i][2] = floatround(Zip_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
		for(new i = 0; i != sizeof(Zip_Shop_Female_Skins); i ++) Zip_Shop_Female_Skins[i][2] = floatround(Zip_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);

		for(new i = 0; i != sizeof(BLACK_MARKT_WEAPONS); i ++) BLACK_MARKT_WEAPONS[i][black_market_WEAPON_PRICE] = floatround(BLACK_MARKT_WEAPONS[i][black_market_WEAPON_PRICE_BASE] * MULTIPLIER_WEAPONS, floatround_ceil);
	}
	else
	{
		switch(type)
		{
			case 0:
			{
				for(new i = 0; i != MAX_PROPERTIES; i ++)
				{
					if (!PROPERTY_INFO[i][property_VALID]) continue;
					PROPERTY_INFO[i][property_PRICE] = floatround(PROPERTY_INFO[i][property_PRICE_BASE] * MULTIPLIER_PROPERITES, floatround_ceil);

					if (!PROPERTY_INFO[i][property_SOLD])
					{
						UpdateUnnocupiedPropertyLabel(i);
					}
				}
			}
			case 1:
			{
				for(new i = 0; i != MAX_VEHICLES; i ++)
				{
					if (!SELL_VEHICLES[i][sell_vehicle_VALID]) continue;
					SELL_VEHICLES[i][sell_vehicle_PRICE] = floatround(VEHICLE_INFO[ GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400 ][vehicle_info_PRICE] * MULTIPLIER_VEHICLES, floatround_ceil);

					if (SELL_VEHICLES[i][sell_vehicle_VIP_LEVEL]) SELL_VEHICLES[i][sell_vehicle_LEVEL] = 1;
					if (SELL_VEHICLES[i][sell_vehicle_EXTRA]) SELL_VEHICLES[i][sell_vehicle_PRICE] = 0;

					if (SELL_VEHICLES[i][sell_vehicle_VIP_LEVEL])
					{
						if (SELL_VEHICLES[i][sell_vehicle_EXTRA])
						{
							format
							(
								label_str,
									sizeof label_str,
									"\
										{F4DC42}Se requiere VIP (%d)\n\
										\n\
										"COL_YELLOW"%s\n\n\
										"COL_WHITE"Coste: "COL_YELLOW"%d "SERVER_COIN"\n\
										"COL_WHITE"Nivel: "COL_YELLOW"%d\
									", SELL_VEHICLES[i][sell_vehicle_VIP_LEVEL], VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_NAME], SELL_VEHICLES[i][sell_vehicle_EXTRA], SELL_VEHICLES[i][sell_vehicle_LEVEL]
							);
						}
						else
						{
							format
							(
								label_str,
									sizeof label_str,
									"\
										{F4DC42}Se requiere VIP (%d)\n\
										\n\
										"COL_YELLOW"%s\n\n\
										"COL_WHITE"Precio: "COL_YELLOW"%s$\n\
										"COL_WHITE"Nivel: "COL_YELLOW"%d\
									", SELL_VEHICLES[i][sell_vehicle_VIP_LEVEL], VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_NAME], number_format_thousand(SELL_VEHICLES[i][sell_vehicle_PRICE]), SELL_VEHICLES[i][sell_vehicle_LEVEL]
							);
						}
					}
					else
					{
						if (SELL_VEHICLES[i][sell_vehicle_EXTRA])
						{
							format
							(
								label_str,
									sizeof label_str,
									"\
										"COL_YELLOW"%s\n\n\
										"COL_WHITE"Coste: "COL_YELLOW"%d "SERVER_COIN"\n\
										"COL_WHITE"Nivel: "COL_YELLOW"%d\
									", VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_NAME], SELL_VEHICLES[i][sell_vehicle_EXTRA], SELL_VEHICLES[i][sell_vehicle_LEVEL]
							);
						}
						else
						{
							format
							(
								label_str,
									sizeof label_str,
									"\
										"COL_YELLOW"%s\n\n\
										"COL_WHITE"Precio: "COL_YELLOW"%s$\n\
										"COL_WHITE"Nivel: "COL_YELLOW"%d\
									", VEHICLE_INFO[GLOBAL_VEHICLES[i][gb_vehicle_MODELID] - 400][vehicle_info_NAME], number_format_thousand(SELL_VEHICLES[i][sell_vehicle_PRICE]), SELL_VEHICLES[i][sell_vehicle_LEVEL]
							);
						}
					}
					UpdateDynamic3DTextLabelText(SELL_VEHICLES[i][sell_vehicle_LABEL_ID], COLOR_WHITE, label_str);
				}
			}
			case 2:
			{
				for(new i = 0; i != sizeof(Toys_Shop); i ++) Toys_Shop[i][shop_toy_price] = floatround(Toys_Shop[i][shop_toy_price_base] * MULTIPLIER_TOYS, floatround_ceil);
			}
			case 3:
			{
				for(new i = 0; i != sizeof(Binco_Shop_Male_Skins); i ++) Binco_Shop_Male_Skins[i][2] = floatround(Binco_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Binco_Shop_Female_Skins); i ++) Binco_Shop_Female_Skins[i][2] = floatround(Binco_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Suburban_Shop_Male_Skins); i ++) Suburban_Shop_Male_Skins[i][2] = floatround(Suburban_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Suburban_Shop_Female_Skins); i ++) Suburban_Shop_Female_Skins[i][2] = floatround(Suburban_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Prolaps_Shop_Male_Skins); i ++) Prolaps_Shop_Male_Skins[i][2] = floatround(Prolaps_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Prolaps_Shop_Female_Skins); i ++) Prolaps_Shop_Female_Skins[i][2] = floatround(Prolaps_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Didier_Shop_Male_Skins); i ++) Didier_Shop_Male_Skins[i][2] = floatround(Didier_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Didier_Shop_Female_Skins); i ++) Didier_Shop_Female_Skins[i][2] = floatround(Didier_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Victim_Shop_Male_Skins); i ++) Victim_Shop_Male_Skins[i][2] = floatround(Victim_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Victim_Shop_Female_Skins); i ++) Victim_Shop_Female_Skins[i][2] = floatround(Victim_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Zip_Shop_Male_Skins); i ++) Zip_Shop_Male_Skins[i][2] = floatround(Zip_Shop_Male_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
				for(new i = 0; i != sizeof(Zip_Shop_Female_Skins); i ++) Zip_Shop_Female_Skins[i][2] = floatround(Zip_Shop_Female_Skins[i][1] * MULTIPLIER_SKINS, floatround_ceil);
			}
			case 4:
			{
				for(new i = 0; i != sizeof(BLACK_MARKT_WEAPONS); i ++) BLACK_MARKT_WEAPONS[i][black_market_WEAPON_PRICE] = floatround(BLACK_MARKT_WEAPONS[i][black_market_WEAPON_PRICE_BASE] * MULTIPLIER_WEAPONS, floatround_ceil);
			}
		}
	}
	return 1;
}