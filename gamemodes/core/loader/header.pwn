SanAndreas()
{
	CreateTextDraws();
	LoadEnterExits();
	LoadProperties();
	LoadCrews();
	LoadGangZones();
	LoadBlackMarkets();
	LoadClubs();

	SERVER_TIME[0] = 7;
	SERVER_TIME[1] = 1;
	WorldCycleTimer = SetTimer("UpdateWorldTime", 5000, true);

	#if defined FINAL_BUILD
		//ptas
		Club_Strippers_Actor[0] = CreateDynamicActor(246, 1209.416503, -36.272216, 1001.484375, 17.0, .worldid = 0, .interiorid = 3);
		Club_Strippers_Actor[1] = CreateDynamicActor(87, 1215.355712, -33.439422, 1001.382812, 85.3, .worldid = 0, .interiorid = 3);
		//ptas2
		Club_Strippers_Actor[2] = CreateDynamicActor(64, 1209.416503, -36.272216, 1001.484375, 17.0, .worldid = 1, .interiorid = 3);
		Club_Strippers_Actor[3] = CreateDynamicActor(63, 1215.355712, -33.439422, 1001.382812, 85.3, .worldid = 1, .interiorid = 3);
		//ptas3
		Club_Strippers_Actor[4] = CreateDynamicActor(75, 1209.416503, -36.272216, 1001.484375, 17.0, .worldid = 2, .interiorid = 3);
		Club_Strippers_Actor[5] = CreateDynamicActor(238, 1215.355712, -33.439422, 1001.382812, 85.3, .worldid = 2, .interiorid = 3);

		//cantina
		Club_Bar_Actor[0] = CreateDynamicActor(194, 1206.232788, -29.325387, 1000.953125, 270.0, .worldid = 0, .interiorid = 3);
		//cantina2
		Club_Bar_Actor[1] = CreateDynamicActor(171, 1206.232788, -29.325387, 1000.953125, 270.0, .worldid = 1, .interiorid = 3);
		//cantina3
		Club_Bar_Actor[2] = CreateDynamicActor(172, 1206.232788, -29.325387, 1000.953125, 270.0, .worldid = 2, .interiorid = 3);
		//cantina3
		Club_Bar_Actor[3] = CreateDynamicActor(172, 496.554840,-77.601684,998.765075,0.000000, .worldid = 2, .interiorid = 11);

		//carneros
		Club_Actors[0] = CreateDynamicActor(2, 1209.846191, -33.879096, 1000.953125, 180.626205, .worldid = 0, .interiorid = 3);
		Club_Actors[1] = CreateDynamicActor(15, 1207.873535, -34.441837, 1000.953125, 213.213790, .worldid = 0, .interiorid = 3);
		Club_Actors[2] = CreateDynamicActor(3, 1215.694702, -31.700962, 1000.953125, 158.379913, .worldid = 0, .interiorid = 3);
		Club_Actors[3] = CreateDynamicActor(19, 1214.740356, -35.461227, 1000.953125, 337.608306, .worldid = 0, .interiorid = 3);
		Club_Actors[4] = CreateDynamicActor(78, 1213.713012, -34.496170, 1000.953125, 293.427886, .worldid = 0, .interiorid = 3);
		Club_Actors[5] = CreateDynamicActor(20, 1211.037963, -36.378440, 1000.960571, 74.092475, .worldid = 0, .interiorid = 3);
		Club_Actors[6] = CreateDynamicActor(40, 1207.190307, -36.132881, 1000.953125, 277.761077, .worldid = 0, .interiorid = 3);
		//carneros
		Club_Actors[7] = CreateDynamicActor(45, 1209.846191, -33.879096, 1000.953125, 180.626205, .worldid = 1, .interiorid = 3);
		Club_Actors[8] = CreateDynamicActor(37, 1207.873535, -34.441837, 1000.953125, 213.213790, .worldid = 1, .interiorid = 3);
		Club_Actors[9] = CreateDynamicActor(28, 1215.694702, -31.700962, 1000.953125, 158.379913, .worldid = 1, .interiorid = 3);
		Club_Actors[10] = CreateDynamicActor(66, 1214.740356, -35.461227, 1000.953125, 337.608306, .worldid = 1, .interiorid = 3);
		Club_Actors[11] = CreateDynamicActor(67, 1213.713012, -34.496170, 1000.953125, 293.427886, .worldid = 1, .interiorid = 3);
		Club_Actors[12] = CreateDynamicActor(68, 1211.037963, -36.378440, 1000.960571, 74.092475, .worldid = 1, .interiorid = 3);
		Club_Actors[13] = CreateDynamicActor(69, 1207.190307, -36.132881, 1000.953125, 277.761077, .worldid = 1, .interiorid = 3);
		//carneros
		Club_Actors[14] = CreateDynamicActor(100, 1209.846191, -33.879096, 1000.953125, 180.626205, .worldid = 2, .interiorid = 3);
		Club_Actors[15] = CreateDynamicActor(101, 1207.873535, -34.441837, 1000.953125, 213.213790, .worldid = 2, .interiorid = 3);
		Club_Actors[16] = CreateDynamicActor(120, 1215.694702, -31.700962, 1000.953125, 158.379913, .worldid = 2, .interiorid = 3);
		Club_Actors[17] = CreateDynamicActor(112, 1214.740356, -35.461227, 1000.953125, 337.608306, .worldid = 2, .interiorid = 3);
		Club_Actors[18] = CreateDynamicActor(140, 1213.713012, -34.496170, 1000.953125, 293.427886, .worldid = 2, .interiorid = 3);
		Club_Actors[19] = CreateDynamicActor(142, 1211.037963, -36.378440, 1000.960571, 74.092475, .worldid = 2, .interiorid = 3);
		Club_Actors[20] = CreateDynamicActor(139, 1207.190307, -36.132881, 1000.953125, 277.761077, .worldid = 2, .interiorid = 3);

		UpdateThePutis();
		SetTimer("UpdateThePutis", 3000, true);
	#endif

	// 3D Texts Ropas
	for(new i = 0; i < sizeof Clothing_Shop_Positions; i++)
	{
		new label_str[128];
		format(label_str, sizeof label_str, ""COL_WHITE"%s", Clothing_Shop_Positions[i][clothing_shop_NAME]);
		CreateDynamic3DTextLabel(label_str, 0xF7F7F700, Clothing_Shop_Positions[i][clothing_shop_X], Clothing_Shop_Positions[i][clothing_shop_Y], Clothing_Shop_Positions[i][clothing_shop_Z] + 0.25, 10.0, .testlos = true, .interiorid = Clothing_Shop_Positions[i][clothing_shop_INTERIOR]);
		AddKeyArea(Clothing_Shop_Positions[i][clothing_shop_X], Clothing_Shop_Positions[i][clothing_shop_Y], 0.8, KEY_TYPE_Y);
	}

	// 3D Texts Pedir comida
	for(new i = 0; i < sizeof Fast_Food_Positions; i++)
	{
		new label_str[128];
		format(label_str, sizeof label_str, ""COL_RED"%s\n"COL_WHITE"7 productos disponibles", Fast_Food_Positions[i][fast_food_NAME]);
		CreateDynamic3DTextLabel(label_str, 0xF7F7F7FF, Fast_Food_Positions[i][fast_food_X], Fast_Food_Positions[i][fast_food_Y], Fast_Food_Positions[i][fast_food_Z] + 0.25, 10.0, .testlos = true, .interiorid = Fast_Food_Positions[i][fast_food_INTERIOR]);
		AddKeyArea(Fast_Food_Positions[i][fast_food_X], Fast_Food_Positions[i][fast_food_Y], 0.8, KEY_TYPE_Y);
	}

	//Cajeros
	for(new i = 0; i < sizeof ATM_BANK; i ++)
	{
		CreateDynamicObject(19324, ATM_BANK[i][atm_X], ATM_BANK[i][atm_Y], ATM_BANK[i][atm_Z], ATM_BANK[i][atm_RX], ATM_BANK[i][atm_RY], ATM_BANK[i][atm_RZ], ATM_BANK[i][atm_WORLD], ATM_BANK[i][atm_INTERIOR]);
		AddKeyArea(ATM_BANK[i][atm_X], ATM_BANK[i][atm_Y], 0.8, KEY_TYPE_Y);

		ATM_BANK[i][atm_X] += (-0.5 * floatsin(-(ATM_BANK[i][atm_RZ] - 90.0), degrees));
		ATM_BANK[i][atm_Y] += (-0.5 * floatcos(-(ATM_BANK[i][atm_RZ] - 90.0), degrees));
		CreateDynamicMapIcon(ATM_BANK[i][atm_X], ATM_BANK[i][atm_Y], ATM_BANK[i][atm_Z], 52, COLOR_WHITE, ATM_BANK[i][atm_WORLD], ATM_BANK[i][atm_INTERIOR]);

		new atm_pickup_id = CreateDynamicPickup(0, 1, ATM_BANK[i][atm_X], ATM_BANK[i][atm_Y], ATM_BANK[i][atm_Z], ATM_BANK[i][atm_WORLD], ATM_BANK[i][atm_INTERIOR]), info[3];
		info[0] = PICKUP_TYPE_ATM;
		info[1] = i; // Index
		info[2] = 0; // Nada
		Streamer_SetArrayData(STREAMER_TYPE_PICKUP, atm_pickup_id, E_STREAMER_EXTRA_ID, info);
	}

	// 3D Texts Gasolinera
	for(new i = 0; i < sizeof Fuel_Stations; i++)
	{
		CreateDynamic3DTextLabel(""COL_RED"Gasolinera\n"COL_WHITE"3 productos disponibles", 0xF7F7F7FF, Fuel_Stations[i][0], Fuel_Stations[i][1], Fuel_Stations[i][2] + 0.25, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
		AddKeyArea(Fuel_Stations[i][0], Fuel_Stations[i][1], 1.5, KEY_TYPE_Y);
	}

	//Mercado negro
	CreateDynamic3DTextLabel(""COL_RED"Mercado negro\n"COL_WHITE"2 productos disponibles", 0xF7F7F7FF, 2164.021484, -1164.398925, -16.871662, 10.0, .testlos = true, .interiorid = -1, .worldid = -1);
	CreateDynamic3DTextLabel(""COL_RED"Mercado negro\n"COL_WHITE"2 productos disponibles", 0xF7F7F7FF, 2164.021484, -1164.398925, -16.871662, 10.0, .testlos = true, .interiorid = -1, .worldid = -1);
	CreateDynamic3DTextLabel(""COL_RED"Mercado negro (Drogas)\n"COL_WHITE"2 productos disponibles", 0xF7F7F7FF, 2310.057128, -1789.786865, 1600.751953, 10.0, .testlos = true, .interiorid = -1, .worldid = -1);

	//24/7
	CreateDynamic3DTextLabel(""COL_RED"Tienda 24/7\n"COL_WHITE"12 productos disponibles", 0xF7F7F7FF, -27.964675, -89.948631, 1003.546875, 10.0, .testlos = true, .interiorid = 18);

	// Electrónica
	CreateDynamic3DTextLabel(""COL_RED"Tienda Electrónica\n"COL_WHITE"4 productos disponibles", 0xF7F7F7FF, 1722.2310, -1253.8021, 471.1665, 10.0, .testlos = true, .interiorid = 17);
	
	// Farmacia
	CreateDynamic3DTextLabel(""COL_RED"Farmacia\n"COL_WHITE"3 productos disponibles", 0xF7F7F7FF, -198.002197, -1762.759643, 675.768737, 10.0, .testlos = true, .interiorid = 3);

	// club de la pelea
	CreateDynamic3DTextLabel(""COL_YELLOW"Club de la pelea\n"COL_WHITE"3 opciones disponibles", 0xF7F7F7FF, -11.283934, 88.862136, 1101.522705, 5.0, .testlos = true, .interiorid = 16, .worldid = 0);

	//Vehs venta
	for(new i = 0; i != sizeof SELL_INFO_VEHICLES; i ++)
	{
		if (SELL_INFO_VEHICLES[i][sell_info_COLOR_1] == -1) SELL_INFO_VEHICLES[i][sell_info_COLOR_1] = valid_work_vehicle_colors[random(sizeof(valid_work_vehicle_colors))];
		if (SELL_INFO_VEHICLES[i][sell_info_COLOR_2] == -1) SELL_INFO_VEHICLES[i][sell_info_COLOR_2] = valid_work_vehicle_colors[random(sizeof(valid_work_vehicle_colors))];

		new vehicle_id = INVALID_VEHICLE_ID;
		vehicle_id = CreateVehicle(SELL_INFO_VEHICLES[i][sel_info_vehicle_MODELID], SELL_INFO_VEHICLES[i][sell_info_SPAWN_X], SELL_INFO_VEHICLES[i][sell_info_SPAWN_Y], SELL_INFO_VEHICLES[i][sell_info_SPAWN_Z], SELL_INFO_VEHICLES[i][sell_info_SPAWN_ANGLE], SELL_INFO_VEHICLES[i][sell_info_COLOR_1], SELL_INFO_VEHICLES[i][sell_info_COLOR_2], COLOR_WHITE, false);

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_VALID] = true;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_TYPE] = VEHICLE_TYPE_SELL;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] = SELL_INFO_VEHICLES[i][sel_info_vehicle_MODELID];
		format(GLOBAL_VEHICLES[vehicle_id][gb_vehicle_NUMBER_PLATE], 32, "EN VENTA");
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X] = SELL_INFO_VEHICLES[i][sell_info_SPAWN_X];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y] = SELL_INFO_VEHICLES[i][sell_info_SPAWN_Y];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z] = SELL_INFO_VEHICLES[i][sell_info_SPAWN_Z];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_ANGLE] = SELL_INFO_VEHICLES[i][sell_info_SPAWN_ANGLE];

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][0] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][1] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][2] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z];

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_HEALTH] = 1000.0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_PANELS] = 0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_DOORS] = 0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_LIGHTS] = 0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_TIRES] = 0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_1] = SELL_INFO_VEHICLES[i][sell_info_COLOR_1];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_2] = SELL_INFO_VEHICLES[i][sell_info_COLOR_2];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PAINTJOB] = 3; // No paintjob
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MAX_GAS] = 0.0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_GAS] = 0.0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;

		SELL_VEHICLES[vehicle_id][sell_vehicle_VALID] = true;
		SELL_VEHICLES[vehicle_id][sell_vehicle_SHOP] = SELL_INFO_VEHICLES[i][sell_info_SHOP];
		SELL_VEHICLES[vehicle_id][sell_vehicle_PRICE] = VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_PRICE];
		SELL_VEHICLES[vehicle_id][sell_vehicle_LEVEL] = 1;
		SELL_VEHICLES[vehicle_id][sell_vehicle_EXTRA] = VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_COINS];
		SELL_VEHICLES[vehicle_id][sell_vehicle_VIP_LEVEL] = VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_VIP_LEVEL];

		if (SELL_VEHICLES[vehicle_id][sell_vehicle_VIP_LEVEL]) SELL_VEHICLES[vehicle_id][sell_vehicle_LEVEL] = 1;
		if (SELL_VEHICLES[vehicle_id][sell_vehicle_EXTRA]) SELL_VEHICLES[vehicle_id][sell_vehicle_PRICE] = 0;

		SetVehicleToRespawnEx(vehicle_id);


		new label_str[256];

		if (SELL_VEHICLES[vehicle_id][sell_vehicle_VIP_LEVEL])
		{
			if (SELL_VEHICLES[vehicle_id][sell_vehicle_EXTRA])
			{
				format
				(
					label_str,
						sizeof label_str,
						"\
							{F4DC42}Se requiere VIP (%d)\n\
							\n\
							"COL_RED"%s\n\n\
							"COL_WHITE"Coste: "COL_RED"%d "SERVER_COIN"\n\
							"COL_WHITE"Nivel: "COL_RED"%d\
						", SELL_VEHICLES[vehicle_id][sell_vehicle_VIP_LEVEL], VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_NAME], SELL_VEHICLES[vehicle_id][sell_vehicle_EXTRA], SELL_VEHICLES[vehicle_id][sell_vehicle_LEVEL]
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
							"COL_RED"%s\n\n\
							"COL_WHITE"Precio: "COL_RED"%s$\n\
							"COL_WHITE"Nivel: "COL_RED"%d\
						", SELL_VEHICLES[vehicle_id][sell_vehicle_VIP_LEVEL], VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_NAME], number_format_thousand(SELL_VEHICLES[vehicle_id][sell_vehicle_PRICE]), SELL_VEHICLES[vehicle_id][sell_vehicle_LEVEL]
				);
			}
		}
		else
		{
			if (SELL_VEHICLES[vehicle_id][sell_vehicle_EXTRA])
			{
				format
				(
					label_str,
						sizeof label_str,
						"\
							"COL_RED"%s\n\n\
							"COL_WHITE"Coste: "COL_RED"%d "SERVER_COIN"\n\
							"COL_WHITE"Nivel: "COL_RED"%d\
						", VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_NAME], SELL_VEHICLES[vehicle_id][sell_vehicle_EXTRA], SELL_VEHICLES[vehicle_id][sell_vehicle_LEVEL]
				);
			}
			else
			{
				format
				(
					label_str,
						sizeof label_str,
						"\
							"COL_RED"%s\n\n\
							"COL_WHITE"Precio: "COL_RED"%s$\n\
							"COL_WHITE"Nivel: "COL_RED"%d\
						", VEHICLE_INFO[GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_NAME], number_format_thousand(SELL_VEHICLES[vehicle_id][sell_vehicle_PRICE]), SELL_VEHICLES[vehicle_id][sell_vehicle_LEVEL]
				);
			}
		}


		SELL_VEHICLES[vehicle_id][sell_vehicle_LABEL_ID] = CreateDynamic3DTextLabel(label_str, 0xF7F7F700, 0.0, 0.0, 1.5, 10.0, .attachedvehicle = vehicle_id, .testlos = true, .worldid = 0, .interiorid = 0);
	}

	//Concesionarios
	for(new i = 0; i < sizeof SELL_VEHICLES_SHOPS_SPAWN; i++)
	{
		CreateDynamicMapIcon(SELL_VEHICLES_SHOPS_SPAWN[i][0], SELL_VEHICLES_SHOPS_SPAWN[i][1], SELL_VEHICLES_SHOPS_SPAWN[i][2], 55, COLOR_WHITE, 0, 0);
	}

	//Notario
	CreateDynamic3DTextLabel(""COL_WHITE"Vender una propiedad o vehículo", 0xF7F7F700, 1796.071655, -1414.565307, 2770.660156, 10.0, .testlos = true, .worldid = 20, .interiorid = 20);
	
	//Grua
	CreateDynamic3DTextLabel(""COL_WHITE"Servicio de grúa", 0xF7F7F700,  1795.293823,-1407.773681,2770.660156, 10.0, .testlos = true, .worldid = 20, .interiorid = 20);
	
	//San Andreas Vehicles
	for(new i = 0; i != sizeof San_Andreas_Vehicles; i ++)
	{

		if (San_Andreas_Vehicles[i][san_andreas_vehicle_COLOR_1] == -1) San_Andreas_Vehicles[i][san_andreas_vehicle_COLOR_1] = valid_work_vehicle_colors[random(sizeof(valid_work_vehicle_colors))];
		if (San_Andreas_Vehicles[i][san_andreas_vehicle_COLOR_2] == -1) San_Andreas_Vehicles[i][san_andreas_vehicle_COLOR_2] = valid_work_vehicle_colors[random(sizeof(valid_work_vehicle_colors))];

		new vehicle_id = INVALID_VEHICLE_ID, respawn_time = 300;

		if (San_Andreas_Vehicles[i][san_andreas_vehicle_TYPE] == VEHICLE_TYPE_WORK)
		{
			if (work_info[ San_Andreas_Vehicles[i][san_andreas_vehicle_TYPE_IN] ][work_info_TYPE] == WORK_TYPE_FAMILY)
			{
				respawn_time = 900;
			}
		}

		vehicle_id = CreateVehicle(San_Andreas_Vehicles[i][san_andreas_vehicle_MODELID], San_Andreas_Vehicles[i][san_andreas_vehicle_SPAWN_X], San_Andreas_Vehicles[i][san_andreas_vehicle_SPAWN_Y], San_Andreas_Vehicles[i][san_andreas_vehicle_SPAWN_Z], San_Andreas_Vehicles[i][san_andreas_vehicle_SPAWN_ANGLE], San_Andreas_Vehicles[i][san_andreas_vehicle_COLOR_1], San_Andreas_Vehicles[i][san_andreas_vehicle_COLOR_2], respawn_time, false);
		if (vehicle_id == INVALID_VEHICLE_ID) continue;

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_VALID] = true;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_TYPE] = San_Andreas_Vehicles[i][san_andreas_vehicle_TYPE];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] = San_Andreas_Vehicles[i][san_andreas_vehicle_MODELID];
		format(GLOBAL_VEHICLES[vehicle_id][gb_vehicle_NUMBER_PLATE], 32, "%c%c%c-%04d", getRandomLetter(), getRandomLetter(), getRandomLetter(), random(9999));
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X] = San_Andreas_Vehicles[i][san_andreas_vehicle_SPAWN_X];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y] = San_Andreas_Vehicles[i][san_andreas_vehicle_SPAWN_Y];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z] = San_Andreas_Vehicles[i][san_andreas_vehicle_SPAWN_Z];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_ANGLE] = San_Andreas_Vehicles[i][san_andreas_vehicle_SPAWN_ANGLE];

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][0] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_X];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][1] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Y];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_POS][2] = GLOBAL_VEHICLES[vehicle_id][gb_vehicle_SPAWN_Z];

		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_HEALTH] = 1000.0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_PANELS] = 0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_DOORS] = 0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_LIGHTS] = 0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_DAMAGE_TIRES] = 0;
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_1] = San_Andreas_Vehicles[i][san_andreas_vehicle_COLOR_1];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_COLOR_2] = San_Andreas_Vehicles[i][san_andreas_vehicle_COLOR_2];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_PAINTJOB] = 3; // No paintjob
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MAX_GAS] = VEHICLE_INFO[ GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MODELID] - 400][vehicle_info_MAX_GAS];
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_GAS] = frandom(GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MAX_GAS], GLOBAL_VEHICLES[vehicle_id][gb_vehicle_MAX_GAS] / 3, 2);
		GLOBAL_VEHICLES[vehicle_id][gb_vehicle_STATE] = VEHICLE_STATE_NORMAL;
		GLOBAL_VEHICLES[vehicle_id][gp_vehicle_vip] = San_Andreas_Vehicles[i][san_andreas_vehicle_vip];

		if (GLOBAL_VEHICLES[vehicle_id][gb_vehicle_TYPE] == VEHICLE_TYPE_WORK)
		{
			WORK_VEHICLES[vehicle_id][work_vehicle_VALID] = true;
			WORK_VEHICLES[vehicle_id][work_vehicle_WORK] = San_Andreas_Vehicles[i][san_andreas_vehicle_TYPE_IN];
			WORK_VEHICLES[vehicle_id][work_vehicle_EXP] = San_Andreas_Vehicles[i][san_andreas_vehicle_TYPE_IN_EXP];
			WORK_VEHICLES[vehicle_id][work_vehicle_NEED_DUTY] = work_info[ WORK_VEHICLES[vehicle_id][work_vehicle_WORK] ][work_info_NEED_DUTY];
		}

		SetVehicleToRespawnEx(vehicle_id);
	}

	//polcias
	for(new i = 0; i != sizeof POLICE_GARAGE_DOORS; i ++)
	{
		POLICE_GARAGE_DOORS[i][police_gdoor_OBJECT_ID] = CreateDynamicObject(POLICE_GARAGE_DOORS[i][police_gdoor_MODELID], POLICE_GARAGE_DOORS[i][police_gdoor_CLOSED_X], POLICE_GARAGE_DOORS[i][police_gdoor_CLOSED_Y], POLICE_GARAGE_DOORS[i][police_gdoor_CLOSED_Z], POLICE_GARAGE_DOORS[i][police_gdoor_CLOSED_RX], POLICE_GARAGE_DOORS[i][police_gdoor_CLOSED_RY], POLICE_GARAGE_DOORS[i][police_gdoor_CLOSED_RZ], 0, 0);
	}

	for(new i = 0; i != sizeof POLICE_DOORS; i ++)
	{
		POLICE_DOORS[i][police_door_OBJECT_ID] = CreateDynamicObject(POLICE_DOORS[i][police_door_MODELID], POLICE_DOORS[i][police_door_X], POLICE_DOORS[i][police_door_Y], POLICE_DOORS[i][police_door_Z], 0.0, 0.0, POLICE_DOORS[i][police_door_RZ], POLICE_DOORS[i][police_door_WORLD], POLICE_DOORS[i][police_door_INTERIOR]);
	}

	for(new i = 0; i != sizeof JAIL_DOORS; i ++)
	{
		JAIL_DOORS[i][jail_door_OBJECT_ID] = CreateDynamicObject(JAIL_DOORS[i][jail_door_MODELID], JAIL_DOORS[i][jail_door_X], JAIL_DOORS[i][jail_door_Y], JAIL_DOORS[i][jail_door_Z], 0.0, 0.0, JAIL_DOORS[i][jail_door_RZ], JAIL_DOORS[i][jail_door_WORLD], JAIL_DOORS[i][jail_door_INTERIOR]);
	}

	for(new i = 0; i != sizeof MAFIA_DOORS; i ++)
	{
		MAFIA_DOORS[i][mafia_door_OBJECT_ID] = CreateDynamicObject(MAFIA_DOORS[i][mafia_door_MODELID], MAFIA_DOORS[i][mafia_door_X], MAFIA_DOORS[i][mafia_door_Y], MAFIA_DOORS[i][mafia_door_Z], 0.0, 0.0, MAFIA_DOORS[i][mafia_door_RZ], MAFIA_DOORS[i][mafia_door_WORLD], MAFIA_DOORS[i][mafia_door_INTERIOR]);
	}

	for(new i = 0; i != sizeof TELE_MIRRORS; i ++)
	{
		TELE_MIRRORS[i][teleview_OBJECT_ID] = CreateDynamicObject(TELE_MIRRORS[i][teleview_MODELID], TELE_MIRRORS[i][teleview_X], TELE_MIRRORS[i][teleview_Y], TELE_MIRRORS[i][teleview_Z], 0.0, 0.0, TELE_MIRRORS[i][teleview_RZ], TELE_MIRRORS[i][teleview_WORLD], TELE_MIRRORS[i][teleview_INTERIOR]);
		AddKeyArea(TELE_MIRRORS[i][teleview_X], TELE_MIRRORS[i][teleview_Y], 0.8, KEY_TYPE_Y);
	}

	for(new i = 0; i != sizeof HOTAIR_BALLOONS; i ++)
	{
		HOTAIR_BALLOONS[i][balloon_OBJECT_ID] = CreateDynamicObject(HOTAIR_BALLOONS[i][balloon_MODELID], HOTAIR_BALLOONS[i][balloon_X], HOTAIR_BALLOONS[i][balloon_Y], HOTAIR_BALLOONS[i][balloon_Z], 0.0, 0.0, HOTAIR_BALLOONS[i][balloon_RZ], HOTAIR_BALLOONS[i][balloon_WORLD], HOTAIR_BALLOONS[i][balloon_INTERIOR]);
		AddKeyArea(HOTAIR_BALLOONS[i][balloon_X], HOTAIR_BALLOONS[i][balloon_Y], 0.8, KEY_TYPE_Y);
	}

	CreateDynamic3DTextLabel(""COL_RED"Balloon Express\n"COL_WHITE"Viaje en globo aerostático (200$)", 0xF7F7F7FF, -370.339721, -1634.205932, 25.057666, 5.0, .testlos = true, .worldid = 0, .interiorid = 0);

	CreateDynamic3DTextLabel(""COL_WHITE"Armamento para policías", 0xF7F7F700, 1867.665283, -1712.853515, 5216.709960, 5.0, .testlos = true, .worldid = 0, .interiorid = 6);

	//Safe Zones
	for(new i = 0; i != sizeof SAFE_ZONES; i ++)
	{
		SAFE_ZONES[i][safe_zone_AREA_ID] = CreateDynamicRectangle(SAFE_ZONES[i][safe_zone_MIN_X], SAFE_ZONES[i][safe_zone_MIN_Y], SAFE_ZONES[i][safe_zone_MAX_X], SAFE_ZONES[i][safe_zone_MAX_Y], SAFE_ZONES[i][safe_zone_WORLD], SAFE_ZONES[i][safe_zone_INTERIOR]);
	}

	//Trabajos
	for(new i = 1; i != sizeof obtain_work_coords; i ++)
	{
		new label_str[256];

		switch(work_info[i][work_info_TYPE])
		{
			case WORK_TYPE_NORMAL:
			{
				format(label_str, sizeof label_str, ""COL_WHITE"Trabajo %s", work_info[i][work_info_NAME]);
				CreateDynamic3DTextLabel(label_str, 0xF7F7F700, obtain_work_coords[i][obtain_work_X], obtain_work_coords[i][obtain_work_Y], obtain_work_coords[i][obtain_work_Z], 10.0, .testlos = true, .interiorid = obtain_work_coords[i][obtain_work_INTERIOR]);
				CreateDynamicPickup(1314, 1, obtain_work_coords[i][obtain_work_X], obtain_work_coords[i][obtain_work_Y], obtain_work_coords[i][obtain_work_Z], COLOR_WHITE, obtain_work_coords[i][obtain_work_INTERIOR]);
				if (obtain_work_coords[i][obtain_work_MAP_ICON]) CreateDynamicMapIcon(obtain_work_coords[i][obtain_work_MAP_ICON_X], obtain_work_coords[i][obtain_work_MAP_ICON_Y], obtain_work_coords[i][obtain_work_MAP_ICON_Z], obtain_work_coords[i][obtain_work_MAP_ICON_ID], COLOR_WHITE, 0, 0);
				
				AddKeyArea(obtain_work_coords[i][obtain_work_X], obtain_work_coords[i][obtain_work_Y], 0.8, KEY_TYPE_Y);
			}
		}
	}

	//Carga camioneros
	for(new i = 0; i != sizeof LoadTrucksPoints; i ++)
	{
		CreateDynamic3DTextLabel(""COL_WHITE"Punto de carga", 0xF7F7F700, LoadTrucksPoints[i][0], LoadTrucksPoints[i][1], LoadTrucksPoints[i][2], 15.0, .testlos = true, .worldid = 0, .interiorid = 0);
		CreateDynamicPickup(19607, 1, LoadTrucksPoints[i][0], LoadTrucksPoints[i][1], LoadTrucksPoints[i][2], 0, 0);
		AddKeyArea(LoadTrucksPoints[i][0], LoadTrucksPoints[i][1], 1.8, KEY_TYPE_H);
	}

	//Mecánico
	//Mechanic_Area = CreateDynamicRectangle(-915.255050, -1911.812377, -500.539089, -1979.635253, 0, 0);
	Mechanic_Area = CreateDynamicCircle(-89.0, -1170.0, 50,0);

	//Trash
	CreateDynamicPickup(1239, 1, 1626.089355, -2174.786132, 13.554687, 0, 0);
	CreateDynamic3DTextLabel(""COL_WHITE"Punto de control", 0xF7F7F700, 1626.089355, -2174.786132, 13.554687, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	
	//medico
	CreateDynamicPickup(1239, 1, -212.521926, -1739.015014, 675.768737, 2, 3);
	CreateDynamic3DTextLabel(""COL_WHITE"Punto de control", 0xF7F7F700, -212.521926, -1739.015014, 675.768737, 20.0, .testlos = true, .worldid = 2, .interiorid = 3);

	//registro civil
	CreateDynamic3DTextLabel(""COL_RED"Registro"COL_WHITE"\nAdquiere un documento o licencia de conducir", 0xF7F7F7FF, 1879.2662, -1701.0118, 5216.7100, 20.0, .testlos = true, .worldid = 0, .interiorid = 6);
	AddKeyArea(1879.2662, -1701.0118, 1.5, KEY_TYPE_Y);

	//base mafia
	CreateDynamic3DTextLabel("{a912e2}Family SaintBlood'S\n"COL_WHITE"Equipamiento", 0xF7F7F700, 1475.4032, 2773.5891, 10.8203, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel("{a912e2}Family SaintBlood'S\n"COL_WHITE"Equipamiento", 0xF7F7F700, -1387.1334, 492.8735, 2.1851, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel("{f5e30a}Triade di San Andreas\n"COL_WHITE"Equipamiento", 0xF7F7F700, 3855.066162, -1290.975585, 7547.983398, 20.0, .testlos = true, .worldid = 0, .interiorid = 28);
	CreateDynamic3DTextLabel("{3a3eab}Familia Osborn\n"COL_WHITE"Equipamiento", 0xF7F7F700, 882.789611, 1896.002319, -93.898712, 20.0, .testlos = true, .worldid = 0, .interiorid = 29);
	CreateDynamic3DTextLabel("{FFFFFF}The Family Connor\n"COL_WHITE"Equipamiento", 0xF7F7F700, 419.4871, -1001.7376, 92.8918, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel("{a9ee70}Diviso Per Tutti\n"COL_WHITE"Equipamiento", 0xF7F7F700, 1141.0912, -2064.0176, 69.0259, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel("{3a3eab}Familia Osborn\n"COL_WHITE"Equipamiento", 0xF7F7F700, 1298.5734, -799.0347, 84.1406, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel("{FFFFFF}The Family Sindacco\n"COL_WHITE"Equipamiento", 0xF7F7F700, 1298.5734, -799.0347, 84.1406, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_WHITE"Comprar armas", 0xF7F7F700, -190.378494, -2254.421386, 25.593534, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_WHITE"Comprar balas", 0xF7F7F700, 727.9929, -1276.1163, 13.6484, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);

	//meca
	for(new i = 0; i != sizeof(MECHANIC_POSITIONS); i++ )
	{
		new str_text[128];
		format(str_text, sizeof(str_text), ""COL_RED"Levantador nº %d\n"COL_WHITE"Acércate para usar", i + 1);
		CreateDynamic3DTextLabel(str_text, 0xF7F7F700, MECHANIC_POSITIONS[i][0], MECHANIC_POSITIONS[i][1], MECHANIC_POSITIONS[i][2] + 1.8, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
		AddKeyArea(MECHANIC_POSITIONS[i][0], MECHANIC_POSITIONS[i][1], 1.5, KEY_TYPE_H);
	}

	CreateDynamic3DTextLabel(""COL_RED"Taller mecánico\n"COL_WHITE"1 producto disponible", 0xF7F7F7FF, 1060.838256, -917.609741, 43.124679, 10.0, .testlos = true, .worldid = 0, .interiorid = 0);

	//pescador
	CreateDynamic3DTextLabel(""COL_RED"Boya\n"COL_WHITE"nº 1", 0xF7F7F7FF, 1955.022094, -189.402023, -2.332746 + 1.3, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Boya\n"COL_WHITE"nº 2", 0xF7F7F7FF, 2209.482421, -231.312026, -2.332746 + 1.3, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Boya\n"COL_WHITE"nº 3", 0xF7F7F7FF, 2209.482421, -231.312026, -2.332746 + 1.3, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Boya\n"COL_WHITE"nº 4", 0xF7F7F7FF, 1858.291503, -69.229499, -2.332746 + 1.3, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Comprar caña de pescar\n"COL_WHITE"1 producto disponible", 0xF7F7F7FF, 2125.901123, -65.776679, 1.585963, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Vender pescados\n"COL_WHITE"Venga aquí para vender sus peces", 0xF7F7F7FF, 2157.049560, -92.550987, 2.798943, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);

	// Minero
	CreateDynamic3DTextLabel(""COL_RED"Puesto para mineros\n"COL_WHITE"1 producto disponible", 0xF7F7F7FF, 509.910125, -708.205383, 19.242210, 20.0, .testlos = true, .worldid = 0, .interiorid = 0);
	
	//heliport
	CreateDynamic3DTextLabel(""COL_RED"Helipuerto nº 1\n"COL_WHITE"Acércate para usar", 0xF7F7F700, 1876.87915, -2286.58911, 1.16550 + 15, 30.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Helipuerto nº 2\n"COL_WHITE"Acércate para usar", 0xF7F7F700, 1055.9615, -910.1790, 49.1911 + 1, 30.0, .testlos = true, .worldid = 0, .interiorid = 0);
	CreateDynamic3DTextLabel(""COL_RED"Helipuerto nº 3\n"COL_WHITE"Acércate para usar", 0xF7F7F700, 1037.1727, -911.3947, 49.1911 + 1, 30.0, .testlos = true, .worldid = 0, .interiorid = 0);
	
	CreateDynamic3DTextLabel(""COL_RED"Muelle nº 1\n"COL_WHITE"Acércate para usar", 0xF7F7F700, 729.8204, -1512.3397, -0.5818 + 1, 40.0, .testlos = true, .worldid = 0, .interiorid = 0);
	
	//Ruta 0
	CreateTrashCheckpoint(0, 1440, 1576.18823, -1881.10181, 13.07472, 0.00000, 0.00000, 34.68000);
	CreateTrashCheckpoint(0, 1440, 1917.53015, -1759.69678, 13.03518, 0.00000, 0.00000, 55.38003);
	CreateTrashCheckpoint(0, 1440, 2257.18701, -1757.93884, 13.05839, 0.00000, 0.00000, -32.57999);
	CreateTrashCheckpoint(0, 1440, 2321.62183, -1652.59631, 13.58731, 0.00000, 1.50000, 0.00000);
	CreateTrashCheckpoint(0, 1440, 2136.64185, -1614.34924, 13.07250, 0.00000, 0.00000, 0.00000);
	CreateTrashCheckpoint(0, 1440, 1812.95654, -1583.28308, 13.05158, 0.00000, 0.00000, 108.30004);
	CreateTrashCheckpoint(0, 1440, 1835.05884, -1405.09631, 12.84951, 0.00000, 0.00000, -169.31958);
	CreateTrashCheckpoint(0, 1440, 2111.39307, -1374.47253, 23.48777, 0.00000, 0.00000, 43.80002);
	CreateTrashCheckpoint(0, 1440, 2340.17896, -1375.07373, 23.49526, 0.00000, 0.00000, -45.78000);
	CreateTrashCheckpoint(0, 1440, 2423.18457, -1247.28931, 23.32495, 0.00000, 0.00000, 0.00000);
	CreateTrashCheckpoint(0, 1440, 2408.37939, -1435.10327, 23.49789, 0.00000, 0.00000, 0.00000);
	CreateTrashCheckpoint(0, 1440, 2404.54272, -1883.71716, 13.07741, 0.00000, 0.00000, 49.98003);
	CreateTrashCheckpoint(0, 1440, 2303.04858, -1905.20337, 13.10007, 0.00000, 0.00000, -224.27972);
	CreateTrashCheckpoint(0, 1440, 1947.93640, -1981.96899, 13.04134, 0.00000, 0.00000, -182.69981);
	CreateTrashCheckpoint(0, 1440, 1760.00012, -1704.64282, 13.02292, 0.00000, 0.00000, -89.88001);

	//Ruta 1
	CreateTrashCheckpoint(1, 1440, 266.72211, -1433.95056, 13.22365, 0.00000, 0.00000, -131.94023);
	CreateTrashCheckpoint(1, 1440, 481.41916, -1316.46606, 15.24868, 0.00000, 0.00000, -233.09927);
	CreateTrashCheckpoint(1, 1440, 609.48804, -1414.38892, 13.16528, 0.00000, 0.00000, -177.59927);
	CreateTrashCheckpoint(1, 1440, 673.05725, -1312.57593, 13.06484, 0.00000, 0.00000, -0.12000);
	CreateTrashCheckpoint(1, 1440, 876.93158, -1337.84985, 13.03618, 0.00000, 0.00000, -94.02001);
	CreateTrashCheckpoint(1, 1440, 1014.79724, -1307.83337, 13.04088, 0.00000, 0.00000, -91.02003);
	CreateTrashCheckpoint(1, 1440, 928.27362, -1231.07397, 16.43071, 0.00000, 0.00000, -2.76000);
	CreateTrashCheckpoint(1, 1440, 974.32703, -1098.90576, 23.33282, 0.00000, 0.00000, 0.00000);
	CreateTrashCheckpoint(1, 1440, 1011.96045, -1029.09534, 31.61896, 0.00000, 0.00000, 0.00000);
	CreateTrashCheckpoint(1, 1440, 1130.96423, -1026.88684, 31.37872, 0.00000, 0.00000, 88.50000);
	CreateTrashCheckpoint(1, 1440, 1227.52466, -923.29681, 42.38168, 0.00000, 0.00000, 0.00000);
	CreateTrashCheckpoint(1, 1440, 1149.20667, -1292.30310, 13.14513, 0.00000, 0.00000, -90.83996);
	CreateTrashCheckpoint(1, 1440, 1324.76135, -913.80219, 36.60719, 0.00000, 5.00000, -12.18000);
	CreateTrashCheckpoint(1, 1440, 1438.44971, -1046.58569, 23.30455, 0.00000, 0.00000, 0.00000);
	CreateTrashCheckpoint(1, 1440, 1426.72534, -1150.02637, 23.32583, 0.00000, 0.00000, -57.60005);

	//Ruta 2
	CreateTrashCheckpoint(2, 1440, 177.89861, -1411.52124, 44.86136, 0.00000, 5.50000, -123.00010);
	CreateTrashCheckpoint(2, 1440, 347.04025, -1281.00696, 53.47940, 0.00000, 0.00000, -153.95987);
	CreateTrashCheckpoint(2, 1440, 504.53271, -1217.64954, 44.80725, 0.00000, -4.00000, -117.00010);
	CreateTrashCheckpoint(2, 1440, 626.74414, -1097.86841, 46.27120, 0.00000, -0.66000, 34.20001);
	CreateTrashCheckpoint(2, 1440, 690.64514, -1019.74518, 50.91731, 0.00000, 0.00000, 65.88000);
	CreateTrashCheckpoint(2, 1440, 876.47632, -865.94324, 76.99551, 0.00000, 0.00000, 0.00000);
	CreateTrashCheckpoint(2, 1440, 1029.65454, -791.63422, 102.38500, 0.00000, 3.50000, -128.39977);
	CreateTrashCheckpoint(2, 1440, 996.50922, -642.60034, 120.79243, 0.00000, 1.50000, -175.01944);
	CreateTrashCheckpoint(2, 1440, 1402.91345, -585.05438, 77.69649, 0.00000, -4.50000, -66.54000);
	CreateTrashCheckpoint(2, 1440, 1234.19727, -626.23657, 103.50398, 0.00000, 0.00000, -170.57962);
	CreateTrashCheckpoint(2, 1440, 1065.22083, -623.77979, 115.07451, 0.00000, 11.00000, 0.00000);
	CreateTrashCheckpoint(2, 1440, 898.74420, -708.74591, 109.96632, 0.00000, -12.50000, 67.08000);
	CreateTrashCheckpoint(2, 1440, 832.35669, -797.90161, 72.50480, 0.00000, -13.50000, 7.86000);
	CreateTrashCheckpoint(2, 1440, 677.09070, -878.62482, 67.03890, 0.00000, 11.50000, -121.20003);
	CreateTrashCheckpoint(2, 1440, 125.15490, -1289.90332, 46.98190, 0.00000, 1.50000, 86.94010);

	// Granjero
	Farmer_Area = CreateDynamicCircle(1461.8894, -83.2621, 65.0, 0, 0);
	CreateDynamicMapIcon(1461.8894, -83.2621, 65.0, 53, COLOR_WHITE, 0, 0);
	CreateDynamic3DTextLabel(""COL_WHITE"Tienda de semillas", 0xF7F7F700, -382.580657, -1426.404296, 26.219505, 5.0, .testlos = true, .worldid = 0, .interiorid = 0);

	// Cosechador
	Harvest_Area = CreateDynamicRectangle(-428.336059, -1667.658569, -116.565414, -1220.122070, 0, 0);

	// Key areas
	AddKeyArea(-27.964675, -89.948631, 0.8, KEY_TYPE_Y);
	AddKeyArea(2125.901123, -65.776679, 0.8, KEY_TYPE_Y);
	AddKeyArea(1060.838256, -917.609741, 0.8, KEY_TYPE_Y);
	AddKeyArea(509.910125, -708.205383, 0.8, KEY_TYPE_Y);
	AddKeyArea(2157.049560, -92.550987, 0.8, KEY_TYPE_Y);
	AddKeyArea(-198.002197, -1762.759643, 0.8, KEY_TYPE_Y);
	AddKeyArea(2164.021484, -1164.398925, 0.8, KEY_TYPE_Y);
	AddKeyArea(2162.462158, -1169.053222, 0.8, KEY_TYPE_Y);
	AddKeyArea(2310.057128, -1789.786865, 0.8, KEY_TYPE_Y);
	AddKeyArea(219.244018, 69.982215, 0.8, KEY_TYPE_Y);
	AddKeyArea(262.945587, 109.785270, 0.8, KEY_TYPE_Y);
	AddKeyArea(222.683914, 186.956054, 0.8, KEY_TYPE_Y);
	AddKeyArea(407.302886, 2531.673095, 0.8, KEY_TYPE_Y);
	AddKeyArea(219.244018, 69.982215, 0.8, KEY_TYPE_Y);
	AddKeyArea(-382.580657, -1426.404296, 0.8, KEY_TYPE_Y);
	AddKeyArea(1796.071655, -1414.565307, 1.5, KEY_TYPE_H);
	AddKeyArea(1207.234375, -29.231435, 1.5, KEY_TYPE_H);
	AddKeyArea(496.589172, -76.033905, 1.5, KEY_TYPE_H);
	AddKeyArea(1795.293823, -1407.773681, 1.5, KEY_TYPE_H);
	AddKeyArea(-370.339721, -1634.205932, 0.8, KEY_TYPE_Y);
	AddKeyArea(1722.2310, -1253.8021, 0.8, KEY_TYPE_Y);
	AddKeyArea(726.2478, -1276.3830, 0.8, KEY_TYPE_Y);
	AddKeyArea(976.715881, -1442.519775, 0.8, KEY_TYPE_Y);
	AddKeyArea(3855.066162, -1290.975585, 0.8, KEY_TYPE_Y);
	AddKeyArea(1626.089355, -2174.786132, 0.8, KEY_TYPE_H);
	AddKeyArea(-212.521926, -1739.015014, 0.8, KEY_TYPE_H);
	AddKeyArea(-11.283934, 88.862136, 0.8, KEY_TYPE_Y);

	// Stall
	CreateStalls();

	// Dealers
	CreateDealers();

	// Soccer
	CreateBall();
	Soccer_LoadCollisions();
	Soccer_LoadMap();
	return 1;
}