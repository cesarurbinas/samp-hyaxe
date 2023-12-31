// Defines
#define MAX_TIMERS_PER_PLAYER 50
#define MAX_LISTITEMS 35

// States
enum
{
	ROLEPLAY_STATE_NORMAL,
	ROLEPLAY_STATE_HOSPITAL,
	ROLEPLAY_STATE_INTERIOR,
	ROLEPLAY_STATE_OWN_PROPERTY,
	ROLEPLAY_STATE_GUEST_PROPERTY,
	ROLEPLAY_STATE_ARRESTED,
	ROLEPLAY_STATE_JAIL,
	ROLEPLAY_STATE_CRACK,
	ROLEPLAY_STATE_BOX,
	ROLEPLAY_STATE_OWN_CLUB
};

enum
{
	GAME_STATE_NONE,
	GAME_STATE_CONNECTED,
	GAME_STATE_OCCUPIED,
	GAME_STATE_DEAD,
	GAME_STATE_NORMAL
};

// Variables
enum Temp_Enum
{
	py_GAME_STATE,
	py_NAME[24],
	py_IP[16],
	py_SERIAL[51],
	py_SKIN,
	bool:py_USER_EXIT, // Esta registrado?
	bool:py_USER_LOGGED, // 1 = ha cargado todos los datos del user
	py_TIME_PLAYING, // tiempo jugando en segundos sesion actual
	py_ANTIFLOOD_COMMANDS,
	py_ANTIFLOOD_TALK,
	py_TIMERS[MAX_TIMERS_PER_PLAYER],
	bool:py_USER_VALID_NAME,
	py_RP_NAME[24],
	py_BAD_LOGIN_ATTEMP,
	py_DOUBT_CHANNEL_TIME,
	py_LAST_PICKUP_ID,
	py_HOSPITAL,
	py_HOSPITAL_LIFE,
	py_TIME_PASSED_LAST_REP,
	py_INTERIOR_INDEX,
	bool:py_SELECT_TEXTDRAW,
	bool:py_HUD_TEXTDRAWS,
	bool:py_THIRST_MESSAGE,
	bool:py_HUNGRY_MESSAGE,
	py_SELECTED_TOY_SLOT,
	py_SELECT_BANK_TRANSFER_ACCOUNT,
	bool:py_PLAYER_IN_ATM,
	bool:py_PLAYER_IN_INV,
	bool:py_PLAYER_IN_SINV,
	bool:py_PLAYER_IN_PHONE,
	bool:py_PHONE_COMMANDS_MESSAGE,
	bool:py_PLAYER_IN_CALL,
	py_PLAYER_PHONE_CALL_STATE,
	py_PLAYER_PHONE_CALL_PLAYERID,
	py_PLAYER_LISTITEM[MAX_LISTITEMS],
	py_PLAYER_PHONE_BOOK_ADD_NUMBER,
	py_PLAYER_PHONE_BOOK_SELECTED,
	py_PLAYER_PHONE_NUMBER_SELECTED,
	py_BUY_HOUSE_INDEX,
	bool:py_PLAYER_FINISH_HOSPITAL,
	py_ANTIFLOOD_KNOCK_PROPERTY,
	py_KNOCK_PLAYER_ID,
	py_GPS_CHECKPOINT,
	py_GPS_PLAYER_SELECTED,
	py_PLAYER_GPS_SELECTED_PROPERTY[4],
	py_PLAYER_PROPERTY_SELECTED,
	bool:py_PLAYER_WAITING_MP3_HTTP,
	py_FUEL_DOWN_TIME,
	py_SELECTED_BUY_VEHICLE_ID,
	py_LAST_VEHICLE_ID,
	py_NOTARY_OPTION, //0 al banco, 1 a persona
	py_NOTARY_PRICE,
	py_NOTARY_TO_PLAYER,
	py_PLAYER_VEHICLE_SELECTED,
	py_TRUCK_LOADING_VALUE,
	py_TRUCK_CHECKPOINT,
	py_TUNING_SELECTED_PART[24],
	py_TUNING_SELECTED_COMPONENT[24],
	py_TUNING_SELECTED_COMPONENT_ID,
	py_TUNING_SELECTED_PIECES,
	py_PAINTJOB_SELECTED_ID,
	py_WORKING_IN,
	py_SELECTED_MECHANIC_VEHICLE_ID,
	py_MECHANIC_COLOR_SLOT,
	py_HARVERT_CHECKPOINT,
	py_HARVERT_PROCCESS,
	bool:py_TRASH_DRIVER,
	bool:py_TRASH_PASSENGER,
	py_TRASH_VEHICLE_ID,
	py_TRASH_CHECKPOINT,
	py_RECYCLE_BIN_VALUE,
	bool:py_PLAYER_CARRYING_TREE,
	py_LAST_GOT_WORK_TIME,
	py_LAST_GIVE_MONEY_TIME,
	py_SELECTED_BUY_SEED_ID,
	py_PLANTING_PROGRESS,
	bool:py_PLANTING,
	py_PLANTING_PLANT_SELECTED,
	bool:py_GPS_MAP,
	py_PROPERTY_INDEX,
	bool:py_KICKED,
	bool:py_IN_INJURED_ANIMATION,
	py_SELECTED_DIALOG_WEAPON_SLOT,
	py_TRICK_SELLER_PID,
	py_TRICK_SELLER_AID,
	py_TRICK_SELLER_EXTRA,
	py_ROB_PROGRESS,
	bool:py_INITIAL_ROB,
	py_TRICK_PRICE,
	py_TRICK_TIME,
	py_DIALOG_BOT_VEHICLE,
	py_DIALOG_BOT_VEHICLE_BOOT_SLOT,
	py_POLICE_RADIO,
	bool:py_CUFFING,
	bool:py_CUFFED,
	py_ENTER_JAIL_TIME,
	py_DIALOG_DB_LIMIT,
	py_DIALOG_DB_PAGE,
	py_SELECTED_DB_AC_ID,
	bool:py_POLICE_CALL_NAME,
	bool:py_POLICE_CALL_DESCRIPTION,
	py_POLICE_CALL_NAME_STR[24],
	py_SAVE_ACCOUNT_TIME,
	py_ANTIFLOOD_REPORT,
	bool:py_SEE_ACMD_LOG,
	py_LAST_CHEAT_DETECTED_TIME,
	bool:py_SEE_AC_LOG,
	py_LAST_SHOT_TIME,
	py_SHOT_DETECTIONS,
	py_ANTIFLOOD_DEATH,
	py_ANTIFLOOD_STATE,
	py_ANTIFLOOD_ENTER_VEHICLE,
	py_SELECTED_AC_LISTITEM,
	py_ADMIN_PM_PID,
	py_ADMIN_PM_AID,
	py_ADMIN_PM_TIME,
	py_MECHANIC_PID,
	py_MECHANIC_AID,
	py_MECHANIC_PRICE,
	py_MECHANIC_TEXT[64],
	py_MECHANIC_TYPE,
	py_MECHANIC_EXTRA,
	py_MECHANIC_VEHICLE_ID,
	py_MECHANIC_PIECES,
	py_MECHANIC_TIME,
	py_MECHANIC_SELECTED_COLOR,
	bool:py_SHOP,
	py_SHOP_STATE,
	py_SHOP_ARTICLE_ID[6],
	py_SHOP_SELECTED_ARTICLE_ID,
	bool:py_SHOP_COME_FROM_MY_ADS,
	py_ANTIFLOOD_SHOP,
	py_SHOP_ADD_TYPE,
	py_SHOP_ADD_TEXT[24],
	py_SHOP_ADD_MODELID,
	py_SHOP_ADD_VCOL1,
	py_SHOP_ADD_VCOL2,
	py_VIRTUAL_WORLD,
	bool:py_PLAYER_SPECTATE,
	py_LAST_BM_BUY,
	py_LAST_PLANT_TIME,
	Float:py_INJURED_POS[4],
	py_CREATE_CREW_NAME[32],
	py_CREATE_CREW_COLOR,
	py_CREW_INVITE_PID,
	py_CREW_INVITE_AID,
	py_CREW_INVITE_INFO[4],
	py_CREW_SELECTED_RANK,
	py_CREW_SELECTED_NEW_RANK,
	py_LAST_TERRITORY,
	py_PLAYER_TERRITORY_PRO,
	py_PLAYER_COLOR,
	py_LAST_GOT_CREW,
	py_POLICE_PEN_PID,
	py_POLICE_PEN_AID,
	py_POLICE_PEN_IM,
	py_POLICE_PEN_TIME,
	py_DIALOG_ECO_SELECTED,
	py_LAST_SU_CHECK,
	py_PIVOT_OBJECT,
	py_SELECT_TUNING_OBJECT,
	py_TUNING_PICKUP,
	bool:py_IN_TUNING_GARAGE,
	bool:py_TUNING_GARAGE_SHOP,
	py_TUNING_GARAGE_VEHICLEID,
	py_TUNING_EDIT_SLOT,
	Float:py_OLD_EDIT_VOBJECT_POS[6],
	py_TUNING_EDIT_COLOR_SLOT,
	py_COUNTRY_TYPE,
	py_PASSWD[24],
	bool:py_CONTROL,
	bool:py_NEW_USER,
	py_SELECTING_STYLE,
	py_SELECTED_STYLE,
	py_PROPERTY_CINFO[4],
	py_CJ_WARNINGS,
	py_FIRST_NAME[24],
	py_SUB_NAME[24],
	Text3D:py_POLICE_LABEL,
	bool:py_ADMIN_SERVICE,
	Text3D:py_ADMIN_LABEL,
	Float:py_OLD_HEALTH,
	Float:py_OLD_ARMOUR,
	py_LAST_SAFE_ZONE_WARNING,
	py_SELECTED_POLICE_OBJECT_INDEX,
	py_SELECTED_BYC_ID,
	py_SELECTED_BYC_USER_ID,
	py_LIMIT_REMEDY,
	py_LIMIT_BAND,
	py_LIMIT_CRACK,
	py_LIMIT_JOINT,
	py_LIMIT_MEDIC,
	py_LIMIT_SHIT,
	py_SILENT_AIM_COUNT,
	py_PRO_AIM_COUNT,
	py_AIM_DATA,
	py_NEW_USER_VEH,
	py_LAST_TARGET_PLAYER,
	Float:py_HP_POS_DATA[4],
	bool:py_DIALOG_RESPONDED,
	bool:py_SPEEDOMETER,
	py_ACTUAL_PROPERTY,
	py_INV_OCC_SLOTS,
	bool:py_INV_ITEM_USED[12],
	bool:py_EXPLOSION_BULLET,
	bool:py_SELFIE,
	bool:py_IN_MARKET,
	py_INV_SELECTED_SLOT,
	bool:py_FISHING,
	bool:py_FISH,
	py_FISHING_PROGRESS,
	py_CLEANER_CHECKPOINT,
	py_CLEANER_FINAL,
	py_CLEANER_INDEX,
	py_VEHICLEID,
	py_ANN_CHANNEL_TIME,
	py_MINING_PROGRESS,
	bool:py_MINING,
	py_ACTUAL_ROCK,
	bool:py_ROCK,
	py_TOTAL_REPORTS,
	py_FP_OBJ,
	py_AIMBOT_COUNT,
	bool:py_DEBUG,
	bool:py_EDITING_MODE,
	py_EDITING_MODE_TYPE,
	py_EDITING_OBJ,
	bool:py_IN_TELE,
	py_POLICE_REASON[32],
	bool:py_WANT_MEDIC,
	py_LIMIT_AMBULANCE,
	py_FIX_VALUE,
	py_JOINT_USES,
	bool:py_BOXING,
	py_BOX_BET,
	py_BOX_PLAYER,
	py_BOX_PAY,
	bool:py_BOX_BETTING,
	py_RESULT_INDEX,
	py_LAST_SEARCH,
	Float:py_CHECK_VEHICLE_HEALTH,
	py_CHECK_OBJECT,
	py_CHECK_DAMAGES[4],
	py_MUSIC_BOOMBOX,
	bool:py_ROBBERY,
	py_ROBBERY_LEADER,
	Text3D:py_DL_LABEL,
	py_DL_TIMER,
	py_ADMIN_DELAY,
	py_FURNITURE_SELECTED,
	py_PASSWORD[18],
	bool:py_GODMODE,
	py_CUTTING,
	py_CUTTING_PROGRESS,
	py_CUTTING_CHECKPOINT,
	bool:py_HOLDING_CART,
	py_ANSWER_INDEX,
	py_ANSWER_RESPONSE[32],
	bool:py_STEAL_SUSPICION,
	bool:py_COMBAT_MODE,
	py_CRANE_VEHICLE,
	py_LAST_GEO_USE,
	py_CLUB_INDEX,
	py_PRODUCT_NAME[32],
	py_PRODUCT_TYPE,
	py_PRODUCT_EXTRA,
	py_PRODUCT_PRICE,
	Float:py_MAP_X,
	Float:py_MAP_Y,
	Float:py_MAP_Z,
	py_LAST_DOUBT[144],
	py_INVENTORY_TYPE,
	py_SURFING_VEHICLE,
	py_BIG_PUNCH,
	py_CREDIT[64],
	py_CREDIT_PRODUCT,
	py_DEALER,
	bool:py_NOCHE_DE_SEXO,
	py_LIMIT_FIREWORK,
	py_SPAWNED,
	bool:py_MENU,
	py_TAZER_DELAY,
	bool:py_TUTORIAL,
	py_TUTORIAL_STEP,
	py_GLOBAL_CHANNEL_TIME,
	py_TOTAL_SHOT,
	py_TOTAL_SAVE_SHOT,
	bool:py_PACIFIC,
	py_TEMP_CP,
	bool:py_IN_MISSION,
	py_MISSION,
	py_LAST_AREA,
	py_MISSION_POINTS,
	py_MISSION_TYPE,
	py_KEY_NOT,
	bool:py_BOT,
	py_NOFUEL_ALERTS,
	py_WALLSHOT_ALERTS,
	bool:py_ANDROID,
	py_LAST_DAMAGE,
	py_DAMAGER_ALERTS,
	py_TRUSTED_AIM,
	py_SING_AIM,
	py_FISHS,
	py_EATING,
	py_ACTUAL_SLOT,
	py_AMMO
};
new PLAYER_TEMP[MAX_PLAYERS][Temp_Enum]; // PT (PlayerTemp), variables que no van a ser guardadas en base de datos.