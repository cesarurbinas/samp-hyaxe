#define map_td_X 3.0
#define map_td_Y 134.0
#define map_td_SIZE_X 175.0
#define map_td_SIZE_Y 190.0

CreateTextDraws()
{
	for(new i; i < sizeof(Textdraws); i++) Textdraws[Textdraws_Enum:i] = INVALID_TEXT_DRAW;

	Textdraws[textdraw_GPS_MAP][0] = TextDrawCreate(-5.000000, 132.000000, "box");
	TextDrawLetterSize(Textdraws[textdraw_GPS_MAP][0], 0.000000, 22.498472);
	TextDrawTextSize(Textdraws[textdraw_GPS_MAP][0], 180.130477, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_GPS_MAP][0], 1);
	TextDrawColor(Textdraws[textdraw_GPS_MAP][0], -1);
	TextDrawUseBox(Textdraws[textdraw_GPS_MAP][0], 1);
	TextDrawBoxColor(Textdraws[textdraw_GPS_MAP][0], 120);
	TextDrawSetShadow(Textdraws[textdraw_GPS_MAP][0], 0);
	TextDrawSetOutline(Textdraws[textdraw_GPS_MAP][0], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GPS_MAP][0], 255);
	TextDrawFont(Textdraws[textdraw_GPS_MAP][0], 1);
	TextDrawSetProportional(Textdraws[textdraw_GPS_MAP][0], 1);
	TextDrawSetShadow(Textdraws[textdraw_GPS_MAP][0], 0);

	Textdraws[textdraw_GPS_MAP][1] = TextDrawCreate(map_td_X, map_td_Y, "samaps:map");
	TextDrawLetterSize(Textdraws[textdraw_GPS_MAP][1], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_GPS_MAP][1], map_td_SIZE_X, map_td_SIZE_Y);
	TextDrawAlignment(Textdraws[textdraw_GPS_MAP][1], 1);
	TextDrawColor(Textdraws[textdraw_GPS_MAP][1], -1);
	TextDrawSetShadow(Textdraws[textdraw_GPS_MAP][1], 0);
	TextDrawSetOutline(Textdraws[textdraw_GPS_MAP][1], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GPS_MAP][1], 255);
	TextDrawFont(Textdraws[textdraw_GPS_MAP][1], 4);
	TextDrawSetProportional(Textdraws[textdraw_GPS_MAP][1], 0);
	TextDrawSetShadow(Textdraws[textdraw_GPS_MAP][1], 0);

	Textdraws[textdraw_GPS_MAP][2] = TextDrawCreate(90.000000, 324.000000, "Viendo el mapa en tiempo real");
	TextDrawLetterSize(Textdraws[textdraw_GPS_MAP][2], 0.197330, 1.027553);
	TextDrawAlignment(Textdraws[textdraw_GPS_MAP][2], 2);
	TextDrawColor(Textdraws[textdraw_GPS_MAP][2], -186);
	TextDrawSetShadow(Textdraws[textdraw_GPS_MAP][2], 0);
	TextDrawSetOutline(Textdraws[textdraw_GPS_MAP][2], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GPS_MAP][2], 255);
	TextDrawFont(Textdraws[textdraw_GPS_MAP][2], 1);
	TextDrawSetProportional(Textdraws[textdraw_GPS_MAP][2], 1);
	TextDrawSetShadow(Textdraws[textdraw_GPS_MAP][2], 0);

	Textdraws[textdraw_INV_BG] = TextDrawCreate(153.500000, 97.288856, "box");
	TextDrawLetterSize(Textdraws[textdraw_INV_BG], 0.000000, 26.950023);
	TextDrawTextSize(Textdraws[textdraw_INV_BG], 481.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_INV_BG], 1);
	TextDrawColor(Textdraws[textdraw_INV_BG], -1);
	TextDrawUseBox(Textdraws[textdraw_INV_BG], 1);
	TextDrawBoxColor(Textdraws[textdraw_INV_BG], 238);
	TextDrawSetShadow(Textdraws[textdraw_INV_BG], 0);
	TextDrawSetOutline(Textdraws[textdraw_INV_BG], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_INV_BG], 255);
	TextDrawFont(Textdraws[textdraw_INV_BG], 1);
	TextDrawSetProportional(Textdraws[textdraw_INV_BG], 1);
	TextDrawSetShadow(Textdraws[textdraw_INV_BG], 0);

	Textdraws[textdraw_PLAYER_REP_BACK][0] = TextDrawCreate(500.000000, 13.000000, " ");
	TextDrawLetterSize(Textdraws[textdraw_PLAYER_REP_BACK][0], 0.000000, 0.633333);
	TextDrawTextSize(Textdraws[textdraw_PLAYER_REP_BACK][0], 605.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_PLAYER_REP_BACK][0], 1);
	TextDrawColor(Textdraws[textdraw_PLAYER_REP_BACK][0], -1);
	TextDrawUseBox(Textdraws[textdraw_PLAYER_REP_BACK][0], 1);
	TextDrawBoxColor(Textdraws[textdraw_PLAYER_REP_BACK][0], 255);
	TextDrawSetShadow(Textdraws[textdraw_PLAYER_REP_BACK][0], 0);
	TextDrawSetOutline(Textdraws[textdraw_PLAYER_REP_BACK][0], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PLAYER_REP_BACK][0], 255);
	TextDrawFont(Textdraws[textdraw_PLAYER_REP_BACK][0], 1);
	TextDrawSetProportional(Textdraws[textdraw_PLAYER_REP_BACK][0], 1);
	TextDrawSetShadow(Textdraws[textdraw_PLAYER_REP_BACK][0], 0);

	Textdraws[textdraw_PLAYER_REP_BACK][1] = TextDrawCreate(502.000000, 15.000000, " ");
	TextDrawLetterSize(Textdraws[textdraw_PLAYER_REP_BACK][1], 0.000000, 0.200000);
	TextDrawTextSize(Textdraws[textdraw_PLAYER_REP_BACK][1], 603.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_PLAYER_REP_BACK][1], 1);
	TextDrawColor(Textdraws[textdraw_PLAYER_REP_BACK][1], -1);
	TextDrawUseBox(Textdraws[textdraw_PLAYER_REP_BACK][1], 1);
	TextDrawBoxColor(Textdraws[textdraw_PLAYER_REP_BACK][1], 5787296);
	TextDrawSetShadow(Textdraws[textdraw_PLAYER_REP_BACK][1], 0);
	TextDrawSetOutline(Textdraws[textdraw_PLAYER_REP_BACK][1], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PLAYER_REP_BACK][1], 255);
	TextDrawFont(Textdraws[textdraw_PLAYER_REP_BACK][1], 1);
	TextDrawSetProportional(Textdraws[textdraw_PLAYER_REP_BACK][1], 1);
	TextDrawSetShadow(Textdraws[textdraw_PLAYER_REP_BACK][1], 0);

	Textdraws[textdraw_SHOP][0] = TextDrawCreate(320.000000, 120.000000, "box");
	TextDrawLetterSize(Textdraws[textdraw_SHOP][0], 0.000000, 24.936986);
	TextDrawTextSize(Textdraws[textdraw_SHOP][0], 0.000000, 254.000000);
	TextDrawAlignment(Textdraws[textdraw_SHOP][0], 2);
	TextDrawColor(Textdraws[textdraw_SHOP][0], -1);
	TextDrawUseBox(Textdraws[textdraw_SHOP][0], 1);
	TextDrawBoxColor(Textdraws[textdraw_SHOP][0], -1);
	TextDrawSetShadow(Textdraws[textdraw_SHOP][0], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP][0], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP][0], 255);
	TextDrawFont(Textdraws[textdraw_SHOP][0], 1);
	TextDrawSetProportional(Textdraws[textdraw_SHOP][0], 1);
	TextDrawSetShadow(Textdraws[textdraw_SHOP][0], 0);

	Textdraws[textdraw_SHOP][1] = TextDrawCreate(320.000000, 125.000000, "box");
	TextDrawLetterSize(Textdraws[textdraw_SHOP][1], 0.000000, 23.766672);
	TextDrawTextSize(Textdraws[textdraw_SHOP][1], 0.000000, 254.000000);
	TextDrawAlignment(Textdraws[textdraw_SHOP][1], 2);
	TextDrawColor(Textdraws[textdraw_SHOP][1], -1);
	TextDrawUseBox(Textdraws[textdraw_SHOP][1], 1);
	TextDrawBoxColor(Textdraws[textdraw_SHOP][1], 0x4F4F4FFF);
	TextDrawSetShadow(Textdraws[textdraw_SHOP][1], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP][1], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP][1], 255);
	TextDrawFont(Textdraws[textdraw_SHOP][1], 1);
	TextDrawSetProportional(Textdraws[textdraw_SHOP][1], 1);
	TextDrawSetShadow(Textdraws[textdraw_SHOP][1], 0);

	Textdraws[textdraw_SHOP][2] = TextDrawCreate(207.000000, 128.000000, "Compra_y_venta");
	TextDrawLetterSize(Textdraws[textdraw_SHOP][2], 0.295333, 1.388446);
	TextDrawAlignment(Textdraws[textdraw_SHOP][2], 1);
	TextDrawColor(Textdraws[textdraw_SHOP][2], -1);
	TextDrawSetShadow(Textdraws[textdraw_SHOP][2], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP][2], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP][2], 255);
	TextDrawFont(Textdraws[textdraw_SHOP][2], 2);
	TextDrawSetProportional(Textdraws[textdraw_SHOP][2], 1);
	TextDrawSetShadow(Textdraws[textdraw_SHOP][2], 0);

	Textdraws[textdraw_SHOP][3] = TextDrawCreate(320.000000, 145.000000, "box");
	TextDrawLetterSize(Textdraws[textdraw_SHOP][3], 0.000000, -0.266666);
	TextDrawTextSize(Textdraws[textdraw_SHOP][3], 0.000000, 222.000000);
	TextDrawAlignment(Textdraws[textdraw_SHOP][3], 2);
	TextDrawColor(Textdraws[textdraw_SHOP][3], -1);
	TextDrawUseBox(Textdraws[textdraw_SHOP][3], 1);
	TextDrawBoxColor(Textdraws[textdraw_SHOP][3], -1);
	TextDrawSetShadow(Textdraws[textdraw_SHOP][3], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP][3], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP][3], 255);
	TextDrawFont(Textdraws[textdraw_SHOP][3], 1);
	TextDrawSetProportional(Textdraws[textdraw_SHOP][3], 1);
	TextDrawSetShadow(Textdraws[textdraw_SHOP][3], 0);

	Textdraws[textdraw_SHOP][4] = TextDrawCreate(320.000000, 301.000000, "box");
	TextDrawLetterSize(Textdraws[textdraw_SHOP][4], 0.000000, -0.266666);
	TextDrawTextSize(Textdraws[textdraw_SHOP][4], 0.000000, 222.000000);
	TextDrawAlignment(Textdraws[textdraw_SHOP][4], 2);
	TextDrawColor(Textdraws[textdraw_SHOP][4], -1);
	TextDrawUseBox(Textdraws[textdraw_SHOP][4], 1);
	TextDrawBoxColor(Textdraws[textdraw_SHOP][4], -1);
	TextDrawSetShadow(Textdraws[textdraw_SHOP][4], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP][4], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP][4], 255);
	TextDrawFont(Textdraws[textdraw_SHOP][4], 1);
	TextDrawSetProportional(Textdraws[textdraw_SHOP][4], 1);
	TextDrawSetShadow(Textdraws[textdraw_SHOP][4], 0);


	Textdraws[textdraw_SHOP_ARTICLES_BOX][0] = TextDrawCreate(208.000000, 148.000000, "LD_SPAC:white");
	TextDrawLetterSize(Textdraws[textdraw_SHOP_ARTICLES_BOX][0], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_SHOP_ARTICLES_BOX][0], 70.000000, 70.000000);
	TextDrawAlignment(Textdraws[textdraw_SHOP_ARTICLES_BOX][0], 1);
	TextDrawColor(Textdraws[textdraw_SHOP_ARTICLES_BOX][0], 255);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_ARTICLES_BOX][0], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP_ARTICLES_BOX][0], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP_ARTICLES_BOX][0], 255);
	TextDrawFont(Textdraws[textdraw_SHOP_ARTICLES_BOX][0], 4);
	TextDrawSetProportional(Textdraws[textdraw_SHOP_ARTICLES_BOX][0], 0);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_ARTICLES_BOX][0], 0);
	TextDrawSetSelectable(Textdraws[textdraw_SHOP_ARTICLES_BOX][0], true);

	Textdraws[textdraw_SHOP_ARTICLES_BOX][1] = TextDrawCreate(285.000000, 148.000000, "LD_SPAC:white");
	TextDrawLetterSize(Textdraws[textdraw_SHOP_ARTICLES_BOX][1], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_SHOP_ARTICLES_BOX][1], 70.000000, 70.000000);
	TextDrawAlignment(Textdraws[textdraw_SHOP_ARTICLES_BOX][1], 1);
	TextDrawColor(Textdraws[textdraw_SHOP_ARTICLES_BOX][1], 255);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_ARTICLES_BOX][1], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP_ARTICLES_BOX][1], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP_ARTICLES_BOX][1], 255);
	TextDrawFont(Textdraws[textdraw_SHOP_ARTICLES_BOX][1], 4);
	TextDrawSetProportional(Textdraws[textdraw_SHOP_ARTICLES_BOX][1], 0);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_ARTICLES_BOX][1], 0);
	TextDrawSetSelectable(Textdraws[textdraw_SHOP_ARTICLES_BOX][1], true);

	Textdraws[textdraw_SHOP_ARTICLES_BOX][2] = TextDrawCreate(362.000000, 148.000000, "LD_SPAC:white");
	TextDrawLetterSize(Textdraws[textdraw_SHOP_ARTICLES_BOX][2], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_SHOP_ARTICLES_BOX][2], 70.000000, 70.000000);
	TextDrawAlignment(Textdraws[textdraw_SHOP_ARTICLES_BOX][2], 1);
	TextDrawColor(Textdraws[textdraw_SHOP_ARTICLES_BOX][2], 255);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_ARTICLES_BOX][2], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP_ARTICLES_BOX][2], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP_ARTICLES_BOX][2], 255);
	TextDrawFont(Textdraws[textdraw_SHOP_ARTICLES_BOX][2], 4);
	TextDrawSetProportional(Textdraws[textdraw_SHOP_ARTICLES_BOX][2], 0);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_ARTICLES_BOX][2], 0);
	TextDrawSetSelectable(Textdraws[textdraw_SHOP_ARTICLES_BOX][2], true);

	Textdraws[textdraw_SHOP_ARTICLES_BOX][3] = TextDrawCreate(208.000000, 225.000000, "LD_SPAC:white");
	TextDrawLetterSize(Textdraws[textdraw_SHOP_ARTICLES_BOX][3], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_SHOP_ARTICLES_BOX][3], 70.000000, 70.000000);
	TextDrawAlignment(Textdraws[textdraw_SHOP_ARTICLES_BOX][3], 1);
	TextDrawColor(Textdraws[textdraw_SHOP_ARTICLES_BOX][3], 255);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_ARTICLES_BOX][3], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP_ARTICLES_BOX][3], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP_ARTICLES_BOX][3], 255);
	TextDrawFont(Textdraws[textdraw_SHOP_ARTICLES_BOX][3], 4);
	TextDrawSetProportional(Textdraws[textdraw_SHOP_ARTICLES_BOX][3], 0);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_ARTICLES_BOX][3], 0);
	TextDrawSetSelectable(Textdraws[textdraw_SHOP_ARTICLES_BOX][3], true);

	Textdraws[textdraw_SHOP_ARTICLES_BOX][4] = TextDrawCreate(285.000000, 225.000000, "LD_SPAC:white");
	TextDrawLetterSize(Textdraws[textdraw_SHOP_ARTICLES_BOX][4], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_SHOP_ARTICLES_BOX][4], 70.000000, 70.000000);
	TextDrawAlignment(Textdraws[textdraw_SHOP_ARTICLES_BOX][4], 1);
	TextDrawColor(Textdraws[textdraw_SHOP_ARTICLES_BOX][4], 255);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_ARTICLES_BOX][4], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP_ARTICLES_BOX][4], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP_ARTICLES_BOX][4], 255);
	TextDrawFont(Textdraws[textdraw_SHOP_ARTICLES_BOX][4], 4);
	TextDrawSetProportional(Textdraws[textdraw_SHOP_ARTICLES_BOX][4], 0);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_ARTICLES_BOX][4], 0);
	TextDrawSetSelectable(Textdraws[textdraw_SHOP_ARTICLES_BOX][4], true);

	Textdraws[textdraw_SHOP_ARTICLES_BOX][5] = TextDrawCreate(362.000000, 225.000000, "LD_SPAC:white");
	TextDrawLetterSize(Textdraws[textdraw_SHOP_ARTICLES_BOX][5], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_SHOP_ARTICLES_BOX][5], 70.000000, 70.000000);
	TextDrawAlignment(Textdraws[textdraw_SHOP_ARTICLES_BOX][5], 1);
	TextDrawColor(Textdraws[textdraw_SHOP_ARTICLES_BOX][5], 255);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_ARTICLES_BOX][5], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP_ARTICLES_BOX][5], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP_ARTICLES_BOX][5], 255);
	TextDrawFont(Textdraws[textdraw_SHOP_ARTICLES_BOX][5], 4);
	TextDrawSetProportional(Textdraws[textdraw_SHOP_ARTICLES_BOX][5], 0);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_ARTICLES_BOX][5], 0);
	TextDrawSetSelectable(Textdraws[textdraw_SHOP_ARTICLES_BOX][5], true);

	Textdraws[textdraw_SHOP_ARTICLE_BOX] = TextDrawCreate(208.000000, 175.000000, "LD_SPAC:white");
	TextDrawLetterSize(Textdraws[textdraw_SHOP_ARTICLE_BOX], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_SHOP_ARTICLE_BOX], 100.000000, 100.000000);
	TextDrawAlignment(Textdraws[textdraw_SHOP_ARTICLE_BOX], 1);
	TextDrawColor(Textdraws[textdraw_SHOP_ARTICLE_BOX], 255);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_ARTICLE_BOX], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP_ARTICLE_BOX], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP_ARTICLE_BOX], 255);
	TextDrawFont(Textdraws[textdraw_SHOP_ARTICLE_BOX], 4);
	TextDrawSetProportional(Textdraws[textdraw_SHOP_ARTICLE_BOX], 0);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_ARTICLE_BOX], 0);

	Textdraws[textdraw_TERRITORY_BOX] = TextDrawCreate(320.000000, 355.000000, "-");
	TextDrawLetterSize(Textdraws[textdraw_TERRITORY_BOX], 12.321674, 9.937778);
	TextDrawAlignment(Textdraws[textdraw_TERRITORY_BOX], 2);
	TextDrawColor(Textdraws[textdraw_TERRITORY_BOX], 167);
	TextDrawSetShadow(Textdraws[textdraw_TERRITORY_BOX], 0);
	TextDrawSetOutline(Textdraws[textdraw_TERRITORY_BOX], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_TERRITORY_BOX], 255);
	TextDrawFont(Textdraws[textdraw_TERRITORY_BOX], 1);
	TextDrawSetProportional(Textdraws[textdraw_TERRITORY_BOX], 1);
	TextDrawSetShadow(Textdraws[textdraw_TERRITORY_BOX], 0);

	Textdraws[textdraw_SHOP_TUNING][0] = TextDrawCreate(320.000000, 330.000000, "box");
	TextDrawLetterSize(Textdraws[textdraw_SHOP_TUNING][0], 0.000000, 6.966667);
	TextDrawTextSize(Textdraws[textdraw_SHOP_TUNING][0], 0.000000, 152.000000);
	TextDrawAlignment(Textdraws[textdraw_SHOP_TUNING][0], 2);
	TextDrawColor(Textdraws[textdraw_SHOP_TUNING][0], -1);
	TextDrawUseBox(Textdraws[textdraw_SHOP_TUNING][0], 1);
	TextDrawBoxColor(Textdraws[textdraw_SHOP_TUNING][0], 95);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_TUNING][0], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP_TUNING][0], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP_TUNING][0], 255);
	TextDrawFont(Textdraws[textdraw_SHOP_TUNING][0], 1);
	TextDrawSetProportional(Textdraws[textdraw_SHOP_TUNING][0], 1);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_TUNING][0], 0);

	Textdraws[textdraw_SHOP_TUNING][1] = TextDrawCreate(320.000000, 330.000000, "Los Santos Customs");
	TextDrawLetterSize(Textdraws[textdraw_SHOP_TUNING][1], 0.354000, 1.533629);
	TextDrawTextSize(Textdraws[textdraw_SHOP_TUNING][1], 0.000000, 152.000000);
	TextDrawAlignment(Textdraws[textdraw_SHOP_TUNING][1], 2);
	TextDrawColor(Textdraws[textdraw_SHOP_TUNING][1], -1);
	TextDrawUseBox(Textdraws[textdraw_SHOP_TUNING][1], 1);
	TextDrawBoxColor(Textdraws[textdraw_SHOP_TUNING][1], 0xC02929FF);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_TUNING][1], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP_TUNING][1], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP_TUNING][1], 255);
	TextDrawFont(Textdraws[textdraw_SHOP_TUNING][1], 0);
	TextDrawSetProportional(Textdraws[textdraw_SHOP_TUNING][1], 1);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_TUNING][1], 0);//0xEA0000FF

	Textdraws[textdraw_SHOP_TUNING][2] = TextDrawCreate(320.000000, 376.000000, "COMPRAR");
	TextDrawLetterSize(Textdraws[textdraw_SHOP_TUNING][2], 0.219666, 1.031703);
	TextDrawTextSize(Textdraws[textdraw_SHOP_TUNING][2], 10.000000, 43.000000);
	TextDrawAlignment(Textdraws[textdraw_SHOP_TUNING][2], 2);
	TextDrawColor(Textdraws[textdraw_SHOP_TUNING][2], -1);
	TextDrawUseBox(Textdraws[textdraw_SHOP_TUNING][2], 1);
	TextDrawBoxColor(Textdraws[textdraw_SHOP_TUNING][2], 0xC02929FF);//-1936945921
	TextDrawSetShadow(Textdraws[textdraw_SHOP_TUNING][2], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP_TUNING][2], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP_TUNING][2], 255);
	TextDrawFont(Textdraws[textdraw_SHOP_TUNING][2], 1);
	TextDrawSetProportional(Textdraws[textdraw_SHOP_TUNING][2], 1);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_TUNING][2], 0);
	TextDrawSetSelectable(Textdraws[textdraw_SHOP_TUNING][2], true);

	Textdraws[textdraw_SHOP_TUNING][3] = TextDrawCreate(370.000000, 376.000000, "SIGUIENTE");
	TextDrawLetterSize(Textdraws[textdraw_SHOP_TUNING][3], 0.219666, 1.031703);
	TextDrawTextSize(Textdraws[textdraw_SHOP_TUNING][3], 10.000000, 43.000000);
	TextDrawAlignment(Textdraws[textdraw_SHOP_TUNING][3], 2);
	TextDrawColor(Textdraws[textdraw_SHOP_TUNING][3], -1);
	TextDrawUseBox(Textdraws[textdraw_SHOP_TUNING][3], 1);
	TextDrawBoxColor(Textdraws[textdraw_SHOP_TUNING][3], -1936945921);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_TUNING][3], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP_TUNING][3], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP_TUNING][3], 255);
	TextDrawFont(Textdraws[textdraw_SHOP_TUNING][3], 1);
	TextDrawSetProportional(Textdraws[textdraw_SHOP_TUNING][3], 1);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_TUNING][3], 0);
	TextDrawSetSelectable(Textdraws[textdraw_SHOP_TUNING][3], true);

	Textdraws[textdraw_SHOP_TUNING][4] = TextDrawCreate(270.000000, 376.000000, "ANTERIOR");
	TextDrawLetterSize(Textdraws[textdraw_SHOP_TUNING][4], 0.219666, 1.031703);
	TextDrawTextSize(Textdraws[textdraw_SHOP_TUNING][4], 10.000000, 43.000000);
	TextDrawAlignment(Textdraws[textdraw_SHOP_TUNING][4], 2);
	TextDrawColor(Textdraws[textdraw_SHOP_TUNING][4], -1);
	TextDrawUseBox(Textdraws[textdraw_SHOP_TUNING][4], 1);
	TextDrawBoxColor(Textdraws[textdraw_SHOP_TUNING][4], -1936945921);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_TUNING][4], 0);
	TextDrawSetOutline(Textdraws[textdraw_SHOP_TUNING][4], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_SHOP_TUNING][4], 255);
	TextDrawFont(Textdraws[textdraw_SHOP_TUNING][4], 1);
	TextDrawSetProportional(Textdraws[textdraw_SHOP_TUNING][4], 1);
	TextDrawSetShadow(Textdraws[textdraw_SHOP_TUNING][4], 0);
	TextDrawSetSelectable(Textdraws[textdraw_SHOP_TUNING][4], true);

	Textdraws[textdraw_GRAFFITI_PLUS][0] = TextDrawCreate(501.500000, 125.833366, "    Graffiti en East Los Santos");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][0], 0.214499, 1.143442);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][0], 610.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][0], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][0], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][0], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][0], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][0], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][0], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][0], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][0], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][0], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][0], 0);

	Textdraws[textdraw_GRAFFITI_PLUS][1] = TextDrawCreate(501.500000, 140.766708, "_");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][1], 0.206498, 1.211886);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][1], 610.000000, 0.409999);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][1], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][1], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][1], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][1], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][1], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][1], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][1], 0);

	Textdraws[textdraw_GRAFFITI_PLUS][2] = TextDrawCreate(502.000000, 126.377815, "hud:radar_spray");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][2], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][2], 7.000000, 9.000000);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][2], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][2], -1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][2], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][2], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][2], 255);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][2], 4);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][2], 0);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][2], 0);

	Textdraws[textdraw_GRAFFITI_PLUS][3] = TextDrawCreate(501.500000, 156.322280, "_");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][3], 0.206497, 1.211886);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][3], 610.000000, 0.409999);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][3], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][3], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][3], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][3], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][3], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][3], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][3], 0);

	Textdraws[textdraw_GRAFFITI_PLUS][4] = TextDrawCreate(501.500000, 171.877853, "_");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][4], 0.206497, 1.211886);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][4], 610.000000, 0.409999);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][4], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][4], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][4], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][4], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][4], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][4], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][4], 0);

	Textdraws[textdraw_GRAFFITI_PLUS][5] = TextDrawCreate(504.000000, 156.399963, "box");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][5], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][5], 606.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][5], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][5], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][5], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][5], -1048321);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][5], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][5], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][5], 255);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][5], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][5], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][5], 0);

	Textdraws[textdraw_GRAFFITI_PLUS][6] = TextDrawCreate(504.000000, 156.399963, "box");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][6], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][6], 606.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][6], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][6], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][6], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][6], -1048321);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][6], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][6], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][6], 255);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][6], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][6], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][6], 0);



	Textdraws[textdraw_GRAFFITI_PLUS][7] = TextDrawCreate(504.000000, 182.533325, "box");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][7], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][7], 606.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][7], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][7], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][7], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][7], -1048321);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][7], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][7], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][7], 255);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][7], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][7], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][7], 0);

	Textdraws[textdraw_GRAFFITI_PLUS][8] = TextDrawCreate(504.000000, 182.533325, "box");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][8], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][8], 606.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][8], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][8], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][8], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][8], -1048321);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][8], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][8], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][8], 255);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][8], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][8], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][8], 0);



	Textdraws[textdraw_GRAFFITI_PLUS][9] = TextDrawCreate(504.000000, 209.288909, "box");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][9], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][9], 606.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][9], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][9], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][9], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][9], -1048321);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][9], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][9], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][9], 255);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][9], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][9], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][9], 0);

	Textdraws[textdraw_GRAFFITI_PLUS][10] = TextDrawCreate(504.000000, 209.288909, "box");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI_PLUS][10], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI_PLUS][10], 606.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI_PLUS][10], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI_PLUS][10], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI_PLUS][10], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI_PLUS][10], -1048321);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][10], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI_PLUS][10], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI_PLUS][10], 255);
	TextDrawFont(Textdraws[textdraw_GRAFFITI_PLUS][10], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI_PLUS][10], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI_PLUS][10], 0);

	Textdraws[textdraw_GRAFFITI][0] = TextDrawCreate(501.500000, 125.833366, "____Un_graffiti_en_East~n~Los_Santos_ha_iniciado.");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI][0], 0.280000, 1.168332);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI][0], 610.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI][0], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI][0], -1);
	TextDrawUseBox(Textdraws[textdraw_GRAFFITI][0], 1);
	TextDrawBoxColor(Textdraws[textdraw_GRAFFITI][0], 0x000000EE);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI][0], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI][0], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI][0], 0x000000EE);
	TextDrawFont(Textdraws[textdraw_GRAFFITI][0], 1);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI][0], 1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI][0], 0);

	Textdraws[textdraw_GRAFFITI][1] = TextDrawCreate(500.000000, 127.000030, "hud:radar_spray");
	TextDrawLetterSize(Textdraws[textdraw_GRAFFITI][1], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_GRAFFITI][1], 7.000000, 9.000000);
	TextDrawAlignment(Textdraws[textdraw_GRAFFITI][1], 1);
	TextDrawColor(Textdraws[textdraw_GRAFFITI][1], -1);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI][1], 0);
	TextDrawSetOutline(Textdraws[textdraw_GRAFFITI][1], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_GRAFFITI][1], 255);
	TextDrawFont(Textdraws[textdraw_GRAFFITI][1], 4);
	TextDrawSetProportional(Textdraws[textdraw_GRAFFITI][1], 0);
	TextDrawSetShadow(Textdraws[textdraw_GRAFFITI][1], 0);


	Textdraws[textdraw_PHONE_MENU][0] = TextDrawCreate(494.500000, 282.088897, "box");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][0], 0.000000, 18.649988);
	TextDrawTextSize(Textdraws[textdraw_PHONE_MENU][0], 610.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][0], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][0], -1);
	TextDrawUseBox(Textdraws[textdraw_PHONE_MENU][0], 1);
	TextDrawBoxColor(Textdraws[textdraw_PHONE_MENU][0], 255);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][0], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][0], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][0], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][0], 1);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][0], 1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][0], 0);

	Textdraws[textdraw_PHONE_MENU][1] = TextDrawCreate(490.500000, 267.622283, "ld_pool:ball");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][1], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_PHONE_MENU][1], 122.000000, 26.000000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][1], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][1], 255);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][1], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][1], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][1], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][1], 4);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][1], 0);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][1], 0);

	Textdraws[textdraw_PHONE_MENU][2] = TextDrawCreate(491.000000, 269.488952, "ld_pool:ball");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][2], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_PHONE_MENU][2], 122.000000, 26.000000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][2], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][2], 1863521279);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][2], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][2], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][2], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][2], 4);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][2], 0);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][2], 0);

	Textdraws[textdraw_PHONE_MENU][3] = TextDrawCreate(496.000000, 282.711120, "box");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][3], 0.000000, 19.499984);
	TextDrawTextSize(Textdraws[textdraw_PHONE_MENU][3], 609.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][3], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][3], -1);
	TextDrawUseBox(Textdraws[textdraw_PHONE_MENU][3], 1);
	TextDrawBoxColor(Textdraws[textdraw_PHONE_MENU][3], 1863521279);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][3], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][3], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][3], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][3], 1);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][3], 1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][3], 0);

	Textdraws[textdraw_PHONE_MENU][4] = TextDrawCreate(502.000000, 289.555633, "box");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][4], 0.000000, 15.550004);
	TextDrawTextSize(Textdraws[textdraw_PHONE_MENU][4], 603.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][4], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][4], -1);
	TextDrawUseBox(Textdraws[textdraw_PHONE_MENU][4], 1);
	TextDrawBoxColor(Textdraws[textdraw_PHONE_MENU][4], 255);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][4], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][4], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][4], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][4], 1);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][4], 1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][4], 0);

	Textdraws[textdraw_PHONE_MENU][5] = TextDrawCreate(542.000000, 280.222290, "box");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][5], 0.000000, -0.100001);
	TextDrawTextSize(Textdraws[textdraw_PHONE_MENU][5], 563.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][5], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][5], -1);
	TextDrawUseBox(Textdraws[textdraw_PHONE_MENU][5], 1);
	TextDrawBoxColor(Textdraws[textdraw_PHONE_MENU][5], 606348543);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][5], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][5], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][5], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][5], 1);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][5], 1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][5], 0);

	Textdraws[textdraw_PHONE_MENU][6] = TextDrawCreate(590.000000, 278.200073, "ld_pool:ball");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][6], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_PHONE_MENU][6], 6.000000, 5.000000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][6], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][6], 255);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][6], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][6], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][6], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][6], 4);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][6], 0);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][6], 0);

	Textdraws[textdraw_PHONE_MENU][7] = TextDrawCreate(507.500000, 311.333374, "box");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][7], 0.000000, 3.949999);
	TextDrawTextSize(Textdraws[textdraw_PHONE_MENU][7], 540.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][7], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][7], -1);
	TextDrawUseBox(Textdraws[textdraw_PHONE_MENU][7], 1);
	TextDrawBoxColor(Textdraws[textdraw_PHONE_MENU][7], 168439039);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][7], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][7], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][7], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][7], 1);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][7], 1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][7], 0);

	Textdraws[textdraw_PHONE_MENU][8] = TextDrawCreate(562.500000, 311.333374, "box");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][8], 0.000000, 3.949999);
	TextDrawTextSize(Textdraws[textdraw_PHONE_MENU][8], 596.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][8], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][8], -1);
	TextDrawUseBox(Textdraws[textdraw_PHONE_MENU][8], 1);
	TextDrawBoxColor(Textdraws[textdraw_PHONE_MENU][8], 168439039);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][8], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][8], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][8], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][8], 1);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][8], 1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][8], 0);

	Textdraws[textdraw_PHONE_MENU][9] = TextDrawCreate(507.000000, 361.111206, "box");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][9], 0.000000, 4.149999);
	TextDrawTextSize(Textdraws[textdraw_PHONE_MENU][9], 540.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][9], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][9], -1);
	TextDrawUseBox(Textdraws[textdraw_PHONE_MENU][9], 1);
	TextDrawBoxColor(Textdraws[textdraw_PHONE_MENU][9], 168439039);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][9], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][9], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][9], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][9], 1);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][9], 1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][9], 0);

	Textdraws[textdraw_PHONE_MENU][10] = TextDrawCreate(562.000000, 361.111206, "box");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][10], 0.000000, 4.149999);
	TextDrawTextSize(Textdraws[textdraw_PHONE_MENU][10], 596.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][10], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][10], -1);
	TextDrawUseBox(Textdraws[textdraw_PHONE_MENU][10], 1);
	TextDrawBoxColor(Textdraws[textdraw_PHONE_MENU][10], 168439039);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][10], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][10], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][10], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][10], 1);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][10], 1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][10], 0);

	Textdraws[textdraw_PHONE_MENU][11] = TextDrawCreate(504.500000, 409.644500, "box");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][11], 0.000000, -0.450000);
	TextDrawTextSize(Textdraws[textdraw_PHONE_MENU][11], 600.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][11], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][11], -1);
	TextDrawUseBox(Textdraws[textdraw_PHONE_MENU][11], 1);
	TextDrawBoxColor(Textdraws[textdraw_PHONE_MENU][11], -101058561);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][11], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][11], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][11], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][11], 1);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][11], 1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][11], 0);

	Textdraws[textdraw_PHONE_MENU][12] = TextDrawCreate(510.000000, 311.177825, "hud:radar_torenoranch");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][12], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_PHONE_MENU][12], 25.000000, 24.000000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][12], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][12], -1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][12], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][12], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][12], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][12], 4);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][12], 0);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][12], 0);
	TextDrawSetSelectable(Textdraws[textdraw_PHONE_MENU][12], true);

	Textdraws[textdraw_PHONE_MENU][13] = TextDrawCreate(566.500000, 311.177825, "ld_chat:badchat");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][13], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_PHONE_MENU][13], 25.000000, 24.000000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][13], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][13], -1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][13], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][13], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][13], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][13], 4);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][13], 0);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][13], 0);
	TextDrawSetSelectable(Textdraws[textdraw_PHONE_MENU][13], true);

	Textdraws[textdraw_PHONE_MENU][14] = TextDrawCreate(510.500000, 361.577880, "hud:radar_gangy");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][14], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_PHONE_MENU][14], 25.000000, 24.000000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][14], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][14], -1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][14], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][14], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][14], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][14], 4);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][14], 0);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][14], 0);
	TextDrawSetSelectable(Textdraws[textdraw_PHONE_MENU][14], true);

	Textdraws[textdraw_PHONE_MENU][15] = TextDrawCreate(566.500000, 362.200103, "hud:radar_savegame");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][15], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_PHONE_MENU][15], 25.000000, 24.000000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][15], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][15], -1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][15], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][15], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][15], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][15], 4);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][15], 0);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][15], 0);
	TextDrawSetSelectable(Textdraws[textdraw_PHONE_MENU][15], true);

	Textdraws[textdraw_PHONE_MENU][16] = TextDrawCreate(507.000000, 338.088989, "telefono");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][16], 0.183499, 0.990222);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][16], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][16], -1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][16], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][16], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][16], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][16], 1);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][16], 1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][16], 0);

	Textdraws[textdraw_PHONE_MENU][17] = TextDrawCreate(562.500000, 337.466766, "mensajes");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][17], 0.183499, 0.990222);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][17], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][17], -1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][17], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][17], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][17], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][17], 1);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][17], 1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][17], 0);

	Textdraws[textdraw_PHONE_MENU][18] = TextDrawCreate(507.500000, 389.733459, "contactos");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][18], 0.183499, 0.990222);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][18], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][18], -1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][18], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][18], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][18], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][18], 1);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][18], 1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][18], 0);

	Textdraws[textdraw_PHONE_MENU][19] = TextDrawCreate(562.000000, 389.111236, "camara");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][19], 0.183499, 0.990222);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][19], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][19], -1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][19], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][19], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][19], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][19], 1);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][19], 1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][19], 0);

	Textdraws[textdraw_PHONE_MENU][20] = TextDrawCreate(506.000000, 412.755706, "<");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][20], 0.400000, 1.600000);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][20], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][20], -1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][20], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][20], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][20], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][20], 1);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][20], 1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][20], 0);
	TextDrawSetSelectable(Textdraws[textdraw_PHONE_MENU][20], true);

	Textdraws[textdraw_PHONE_MENU][21] = TextDrawCreate(584.500000, 288.311157, "17:23");
	TextDrawLetterSize(Textdraws[textdraw_PHONE_MENU][21], 0.189500, 0.828444);
	TextDrawAlignment(Textdraws[textdraw_PHONE_MENU][21], 1);
	TextDrawColor(Textdraws[textdraw_PHONE_MENU][21], -1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][21], 0);
	TextDrawSetOutline(Textdraws[textdraw_PHONE_MENU][21], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PHONE_MENU][21], 255);
	TextDrawFont(Textdraws[textdraw_PHONE_MENU][21], 1);
	TextDrawSetProportional(Textdraws[textdraw_PHONE_MENU][21], 1);
	TextDrawSetShadow(Textdraws[textdraw_PHONE_MENU][21], 0);

	Textdraws[textdraw_PROGRESS_BG] = TextDrawCreate(239.000000, 288.311218, "box");
	TextDrawLetterSize(Textdraws[textdraw_PROGRESS_BG], 0.000000, 6.449996);
	TextDrawTextSize(Textdraws[textdraw_PROGRESS_BG], 386.000000, 0.000000);
	TextDrawAlignment(Textdraws[textdraw_PROGRESS_BG], 1);
	TextDrawColor(Textdraws[textdraw_PROGRESS_BG], -1);
	TextDrawUseBox(Textdraws[textdraw_PROGRESS_BG], 1);
	TextDrawBoxColor(Textdraws[textdraw_PROGRESS_BG], 187);
	TextDrawSetShadow(Textdraws[textdraw_PROGRESS_BG], 0);
	TextDrawSetOutline(Textdraws[textdraw_PROGRESS_BG], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_PROGRESS_BG], 255);
	TextDrawFont(Textdraws[textdraw_PROGRESS_BG], 1);
	TextDrawSetProportional(Textdraws[textdraw_PROGRESS_BG], 1);
	TextDrawSetShadow(Textdraws[textdraw_PROGRESS_BG], 0);

	Textdraws[textdraw_HUD][0] = TextDrawCreate(6.000000, 431.889038, "hud:radar_pizza");
	TextDrawLetterSize(Textdraws[textdraw_HUD][0], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_HUD][0], 7.000000, 8.000000);
	TextDrawAlignment(Textdraws[textdraw_HUD][0], 1);
	TextDrawColor(Textdraws[textdraw_HUD][0], -1);
	TextDrawSetShadow(Textdraws[textdraw_HUD][0], 0);
	TextDrawSetOutline(Textdraws[textdraw_HUD][0], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_HUD][0], 255);
	TextDrawFont(Textdraws[textdraw_HUD][0], 4);
	TextDrawSetProportional(Textdraws[textdraw_HUD][0], 0);
	TextDrawSetShadow(Textdraws[textdraw_HUD][0], 0);

	Textdraws[textdraw_HUD][1] = TextDrawCreate(67.000000, 431.889038, "hud:radar_diner");
	TextDrawLetterSize(Textdraws[textdraw_HUD][1], 0.000000, 0.000000);
	TextDrawTextSize(Textdraws[textdraw_HUD][1], 7.000000, 8.000000);
	TextDrawAlignment(Textdraws[textdraw_HUD][1], 1);
	TextDrawColor(Textdraws[textdraw_HUD][1], -1);
	TextDrawSetShadow(Textdraws[textdraw_HUD][1], 0);
	TextDrawSetOutline(Textdraws[textdraw_HUD][1], 0);
	TextDrawBackgroundColor(Textdraws[textdraw_HUD][1], 255);
	TextDrawFont(Textdraws[textdraw_HUD][1], 4);
	TextDrawSetProportional(Textdraws[textdraw_HUD][1], 0);
	TextDrawSetShadow(Textdraws[textdraw_HUD][1], 0);
	return 1;
}

/*DestroyTextDraws()
{
	for(new i; i < sizeof(Textdraws); i++)
	{
		if(Textdraws[Textdraws_Enum:i] == INVALID_TEXT_DRAW) continue;
		TextDrawDestroy(Text:Textdraws[Textdraws_Enum:i]);
		Textdraws[Textdraws_Enum:i] = INVALID_TEXT_DRAW;
	}
	return 1;
}*/