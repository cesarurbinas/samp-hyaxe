enum
{
	DIALOG_REGISTER,
	DIALOG_REGISTER_EMAIL,
    DIALOG_REGISTER_SEX,
	DIALOG_LOGIN,
	DIALOG_INFO,
	DIALOG_FOOD_PIZZA,
	DIALOG_FOOD_CLUCKIN,
	DIALOG_FOOD_BURGER,
	DIALOG_PLAYER_TOYS,
	DIALOG_PLAYER_TOY_MENU,
	DIALOG_PLAYER_TOY_EDIT_NAME,
	DIALOG_PLAYER_TOY_CONFIRMDELETE,
	DIALOG_PLAYER_TOY_EDIT_BONE,
	DIALOG_PLAYER_TOY_SELECT_BONE,
	DIALOG_PLAYER_TOY_COLOR_1,
	DIALOG_PLAYER_TOY_COLOR_2,
	DIALOG_PLAYER_TOY_DELETE_ALL,
	DIALOG_BANK,
	DIALOG_BANK_WITHDRAW,
	DIALOG_BANK_DEPOSIT,
	DIALOG_BANK_TRANSFER,
	DIALOG_BANK_TRANSFER_SEND,
	DIALOG_BANK_TRANSACTIONS,
	DIALOG_CREATE_BANK_ACCOUNT,
	DIALOG_247_LIST,
	DIALOG_HOSPITAL_SHOP,
	DIALOG_PLAYER_POCKET,
	DIALOG_PLAYER_POCKET_OPTIONS,
	DIALOG_PLAYER_POCKET_DELETE_ALL,
	DIALOG_PHONE,
	DIALOG_PHONE_BOOK,
	DIALOG_PHONE_BOOK_ADD_NUMBER,
	DIALOG_PHONE_BOOK_ADD_NAME,
	DIALOG_PHONE_BOOK_OPTIONS,
	DIALOG_PHONE_BOOK_CHANGE_NAME,
	DIALOG_PHONE_BOOK_CONFIRM_DELET,
	DIALOG_PHONE_BOOK_DELETE_ALL,
	DIALOG_PHONE_CALL_NUMBER,
	DIALOG_PHONE_SMS_NUMBER,
	DIALOG_PHONE_SMS_MESSAGE,
	DIALOG_PHONE_BOOK_SEND_MESSAGE,
	DIALOG_PHONE_SENT_MESSAGES,
	DIALOG_PHONE_RECEIVED_MESSAGES,
	DIALOG_PHONE_MESSAGE_LIST,
	DIALOG_CONFIRM_BUY_PROPERTY,
	DIALOG_PLAYER_GPS,
	DIALOG_PLAYER_GPS_PLAYER,
	DIALOG_PLAYER_GPS_PLAYER_ADD,
	DIALOG_PLAYER_GPS_PLAYER_OPTION,
	DIALOG_PLAYER_GPS_CHANGE_NAME,
	DIALOG_PLAYER_GPS_CONFIRM_DELET,
	DIALOG_PLAYER_GPS_SITES,
	DIALOG_PLAYER_GPS_WORKS,
	DIALOG_PLAYER_GPS_DELETE_ALL,
	DIALOG_PLAYER_GPS_SITE_0,
	DIALOG_PLAYER_GPS_SITE_1,
	DIALOG_PLAYER_GPS_SITE_2,
	DIALOG_PLAYER_GPS_SITE_3,
	DIALOG_PLAYER_GPS_SITE_4,
	DIALOG_PLAYER_GPS_SITE_5,
	DIALOG_PLAYER_GPS_SITE_6,
	DIALOG_PLAYER_GPS_SITE_7,
	DIALOG_PLAYER_GPS_SITE_8,
	DIALOG_PLAYER_GPS_PROPERTIES,
	DIALOG_PLAYER_GPS_VEHICLES,
	DIALOG_HELI_OPTIONS,
	DIALOG_GASOLINE,
	DIALOG_LOAD_GASOLINE,
	DIALOG_FUEL_DRUM,
	DIALOG_PROPERTY_OPTIONS,
	DIALOG_PROPERTY_NAME,
	DIALOG_PROPERTY_BANK_SELL,
	DIALOG_PLAYER_MP3,
	DIALOG_PLAYER_MP3_RESULTS,
	DIALOG_BUY_VEHICLE,
	DIALOG_NOTARY,
	DIALOG_NOTARY_SELECT_PROPERTY,
	DIALOG_PROPERTY_SELL_PRICE,
	DIALOG_PROPERTY_SELL_TO_PLAYER,
	DIALOG_SELL_CONFIRM_PROPERTY,
	DIALOG_NOTARY_SELECT_VEHICLE,
	DIALOG_VEHICLE_BANK_SELL,
	DIALOG_VEHICLE_SELL_PRICE,
	DIALOG_VEHICLE_SELL_TO_PLAYER,
	DIALOG_SELL_CONFIRM_VEHICLE,
	DIALOG_TUNING_MENU_PART,
	DIALOG_TUNING_MENU_COMPONENT,
	DIALOG_MECHANIC_MENU,
	DIALOG_MECHANIC_REPAIR_PRICE,
	DIALOG_MECHANIC_COLOR_PRICE,
	DIALOG_MECHANIC_TUNING_PRICE,
	DIALOG_MECHANIC_PAINTJOB_PRICE,
	DIALOG_MECHANIC_ACCEPT,
	DIALOG_TUNING_SELECT_COL_SLOT,
	DIALOG_MECHANIC_SELECT_COL_SLOT,
	DIALOG_TUNING_SELECT_COLOR,
	DIALOG_MECHANIC_SELECT_COLOR,
	DIALOG_TUNING_REMOVE,
	DIALOG_MECHANIC_REMOVE_COMPONEN,
	DIALOG_TUNING_PAINTJOB,
	DIALOG_SEED_LIST,
	DIALOG_SEED_BUY,
	DIALOG_PLANT_PLANTS,
	DIALOG_BLACK_MARKET,
	DIALOG_BLACK_MARKET_WEAPONS,
	DIALOG_BLACK_MARKET_AMMO_STOCK,
	DIALOG_BLACK_MARKET_SELECT_WEA,
	DIALOG_BLACK_MARKET_AMMO,
	DIALOG_PLAYER_WEAPONS,
	DIALOG_PLAYER_WEAPONS_DELETE_A,
	DIALOG_PLAYER_WEAPONS_DELETE,
	DIALOG_TRICKS_FOOD,
	DIALOG_TRICKS_CUETE,
	DIALOG_TRICKS_MEDICINE,
	DIALOG_TRICKS_VENDAS,
	DIALOG_TRICKS_BOTIKIN,
	DIALOG_TRICKS_CANNABIS,
	DIALOG_TRICKS_CRACK,
	DIALOG_TRICKS_SU,
	DIALOG_TRICKS_WEAPON,
	DIALOG_VEHICLE_BOOT,
	DIALOG_VEHICLE_BOOT_DELETE_ALL,
	DIALOG_VEHICLE_BOOT_OPTIONS,
	DIALOG_VEHICLE_BOOT_DELETE,
	DIALOG_SELECT_POLICE_SKIN,
	DIALOG_POLICE_RADIOS,
	DIALOG_POLICE_LIST,
	DIALOG_POLICE_MODIFY,
	DIALOG_MAFIA_LIST,
	DIALOG_MAFIA_MODIFY,
	DIALOG_ENEMY_MAFIA_LIST,
	DIALOG_ENEMY_MAFIA_MODIFY,
	DIALOG_OSBORN_MAFIA_LIST,
	DIALOG_OSBORN_MAFIA_MODIFY,
	DIALOG_POLICE_SHOP,
	DIALOG_POLICE_SELECT_WEAPON,
	DIALOG_POLICE_AMMO,
	DIALOG_POLICE_ARMOUR,
	DIALOG_POLICE_WEAPONS,
	DIALOG_HELP_SU,
	DIALOG_HELP_MOD,
	DIALOG_HELP_SMOD,
	DIALOG_HELP_OPER,
	DIALOG_HELP_ADMIN,
	DIALOG_HELP_HELPER,
	DIALOG_ADMIN_LIST,
	DIALOG_ADMIN_MODIFY,
	DIALOG_CHANGE_PASSWORD,
	DIALOG_CHANGE_PASSWORD_PASS,
	DIALOG_AVISOPASS,
	DIALOG_ANTI_CHEAT,
	DIALOG_ANTI_CHEAT_MODIFY,
	DIALOG_ANTI_CHEAT_MODIFY_DETECT,
	DIALOG_SHOP_TOYS,
	DIALOG_SHOP_SKINS,
	DIALOG_CLOTH_STORE,
	DIALOG_CRANE_SELECT_VEHICLE,
	DIALOG_CRANE_SELECT_PLACE,
	DIALOG_USER_NOTIFICATIONS,
	DIALOG_SEND_MONEY,
	DIALOG_SEND_REPORT,
	DIALOG_RANGE_USER,
	DIALOG_CREATE_CREW,
	DIALOG_CREATE_CREW_NAME,
	DIALOG_CREATE_CREW_COLOR,
	DIALOG_CREATE_CREW_CONFIRM,
	DIALOG_CREW_MENU_ONE,
	DIALOG_CREW_MENU,
	DIALOG_CREW_MEMBER_LIST,
	DIALOG_CREW_CHANGE_NAME,
	DIALOG_CREW_CHANGE_DESC,
	DIALOG_CREW_MEMBER_LIST_DELETE,
	DIALOG_CREW_CAST_MEMBER_CONFIRM,
	DIALOG_CREW_INVITE_RANK,
	DIALOG_CREW_INVITE_ACCEPT,
	DIALOG_CREW_RANKS,
	DIALOG_CREW_RANK_MODIFY,
	DIALOG_CREW_RANK_MODIFY_NAME,
	DIALOG_CREW_RANK_MODIFY_PERMISS,
	DIALOG_CREW_RANK_DELETE,
	DIALOG_CREW_RANK_DELETE_CONFIRM,
	DIALOG_CREW_RANK_CREATE,
	DIALOG_CREW_MODIFY_COLOR,
	DIALOG_CREW_DELETE,
	DIALOG_CREW_LEAVE,
	DIALOG_CREW_MODIFY_MEMBERS,
	DIALOG_CREW_MODIFY_MEMBER,
	DIALOG_CREW_PROPERTY_CONFIRM,
	DIALOG_CREW_LEAVE_TERRITORY,
	DIALOG_CREW_LEAVE_PROPERTY,
	DIALOG_POLICE_PENALTY,
	DIALOG_SERVER_ECO,
	DIALOG_SERVER_ECO_MODIFY,
	DIALOG_SU_BUY,
	DIALOG_SU,
	DIALOG_VOBJECT_MENU,
	DIALOG_VOBJECT_OBJECTS,
	DIALOG_VOBJECT_OBJECT,
	DIALOG_VOBJECT_OBJECT_CNAME,
	DIALOG_VOBJECT_OBJECT_COLORS,
	DIALOG_VOBJECT_OBJECT_COLOR,
	DIALOG_VOBJECT_OBJECT_COLOR_HEX,
	DIALOG_VOBJECT_OBJECT_CDELETE,
	DIALOG_VOBJECT_DELETE_ALL,
	DIALOG_VOBJECT_TEXT_MENU,
	DIALOG_VOBJECT_TEXT_TEXT,
	DIALOG_VOBJECT_TEXT_FONT,
	DIALOG_VOBJECT_TEXT_FONT_SIZE,
	DIALOG_VOBJECT_TEXT_FONT_COLOR,
	DIALOG_VOBJECT_COUNTRY,
	DIALOG_PLAYER_CONFIG,
	DIALOG_TRABAJOS_TELEPORTS,
	DIALOG_POLICE_BYC,
	DIALOG_POLICE_BYC_LAST_ALL,
	DIALOG_POLICE_BYC_NAME_FIND,
	DIALOG_POLICE_DELETE_BYC,
	DIALOG_POLICE_BYC_LAST_PLAYER,
  	DIALOG_GIFT,
  	DIALOG_DRUG_MARKET,
  	DIALOG_BUY_ROD,
  	DIALOG_BUY_FIXKIT,
  	DIALOG_SELL_FISH,
  	DIALOG_CONFIG_VOICE,
  	DIALOG_CHANGE_MHZ,
  	DIALOG_BUY_VOBJECT,
  	DIALOG_VEHICLE_OPTIONS,
  	DIALOG_RADIO_STATIONS,
  	DIALOG_MINER_STORE,
  	DIALOG_SELL_HYCOIN,
  	DIALOG_VOICE_TEST,
  	DIALOG_DEATH,
  	DIALOG_PASSENGER_OPTIONS,
  	DIALOG_BOX_CLUB,
  	DIALOG_BOX_FIGHTERS,
  	DIALOG_BOX_BET,
	DIALOG_ADMIN_COMMANDS,
	DIALOG_BOOMBOX_OPTIONS,
<<<<<<< HEAD
	DIALOG_ROBBERY_PANEL,
<<<<<<< HEAD
	DIALOG_ROBBERY_MEMBERS
=======
	DIALOG_ELECTRONIC_SHOP
>>>>>>> refs/rewritten/Arreglos-varios
=======
	DIALOG_ROBBERY_MEMBERS,
	DIALOG_ELECTRONIC_SHOP,
<<<<<<< HEAD
	DIALOG_FURNITURE_SHOP
>>>>>>> 6f7ef17 (Guardar muebles comprados)
=======
	DIALOG_FURNITURE_SHOP,
	DIALOG_FURNITURE_LIST,
<<<<<<< HEAD
	DIALOG_FURNITURE_OPTIONS
>>>>>>> d3504e5 (Opciones vender, editar, y otras cosas)
=======
	DIALOG_FURNITURE_OPTIONS,
	DIALOG_SELECC_ANSWER,
	DIALOG_QUESTION_CREATE,
<<<<<<< HEAD
	DIALOG_QUESTION_RESPONSE
>>>>>>> c4e0938 (Preguntas de seguridad)
=======
	DIALOG_QUESTION_RESPONSE,
<<<<<<< HEAD
	DIALOG_SELECC_TYPE_AMMO
>>>>>>> d09f9dd (Balas como antes y arreglos)
=======
	DIALOG_SELECC_TYPE_AMMO,
<<<<<<< HEAD
	DIALOG_BLACK_MARKET_SELECT
>>>>>>> d80a8b7 (Las armas y balas se comprar en el mismo lugar)
=======
	DIALOG_BLACK_MARKET_SELECT,
	DIALOG_CLUB,
	DIALOG_CLUB_BUY_FOOD,
<<<<<<< HEAD
	DIALOG_CLUB_BUY_DRINK
>>>>>>> 119039e (oooo chad on da house)
=======
	DIALOG_CLUB_BUY_DRINK,
	DIALOG_CLUB_NAME,
	DIALOG_CLUB_WELCOME,
<<<<<<< HEAD
	DIALOG_CLUB_PRODUCTS
>>>>>>> 2d3b8d1 (Puerta y acciones)
=======
	DIALOG_CLUB_PRODUCTS,
	DIALOG_CLUB_RADIO,
<<<<<<< HEAD
	DIALOG_CLUB_PRICE
>>>>>>> 5164762 (Cambiar emisora)
=======
	DIALOG_CLUB_PRICE,
	DIALOG_PRODUCT_NAME,
	DIALOG_PRODUCT_PRICE,
	DIALOG_PRODUCT_TYPE,
	DIALOG_PRODUCT_EXTRA,
<<<<<<< HEAD
	DIALOG_PRODUCT_DELETE
>>>>>>> 137a817 (Eliminar productos)
=======
	DIALOG_PRODUCT_DELETE,
	DIALOG_VEHICLE_KEYS,
	DIALOG_VEHICLE_KEYS_ADD,
<<<<<<< HEAD
	DIALOG_VEHICLE_KEYS_DEL
>>>>>>> e31d847 (Compartir llaves de vehiculos terminado)
=======
	DIALOG_VEHICLE_KEYS_DEL,
<<<<<<< HEAD
	DIALOG_REGISTER_CIVIL
>>>>>>> a74d6aa (registro civil)
=======
	DIALOG_REGISTER_CIVIL,
<<<<<<< HEAD
	DIALOG_SELL_PUMPKIN
>>>>>>> 2211389 (vender las calabazas)
=======
	DIALOG_SELL_PUMPKIN,
	DIALOG_CONNOR_MAFIA_LIST,
<<<<<<< HEAD
	DIALOG_CONNOR_MAFIA_MODIFY
>>>>>>> 583efcd (the family connor)
=======
	DIALOG_CONNOR_MAFIA_MODIFY,
	DIALOG_CLUB_SELL
>>>>>>> 9cb7ac2 (arreglos en el /r)
};