#define MAX_VEHICLE_OBJECTS_INDEXS 5
enum
{
	VOBJECT_TYPE_OBJECT,
	VOBJECT_TYPE_TEXT,
	VOBJECT_TYPE_COUNTRY_FLAG,
	VOBJECT_TYPE_COUNTRY_PANEL
};

enum e_VEHICLE_OBJECTS
{
	bool:vobject_VALID,
	vobject_TYPE,
	vobject_NAME[32],
	vobject_ID,
	vobject_OBJECT_ID,
	vobject_MODELID,
	Float:vobject_OFFSET[3],
	Float:vobject_ROT[3],
	vobject_ATTACHED,
	vobject_COLORS[MAX_VEHICLE_OBJECTS_INDEXS],

	vobject_text_TEXT[32],
	vobject_text_FONT[24],
	vobject_text_FONT_SIZE,
	vobject_text_BOLD,
	vobject_text_FONT_COLOR
};
new VEHICLE_OBJECTS[MAX_VEHICLES][MAX_SU_VOBJECTS][e_VEHICLE_OBJECTS];

/* Tuning Object System */
enum e_Tuning_Shop_Objects
{
	tuning_object_MODELID,
	tuning_object_NAME[24],
	tuning_object_PRICE
};
new Tuning_Shop_Objects[][e_Tuning_Shop_Objects] =
{
	{1000, "spl_b_mar_m", 1000},
    {1001, "spl_b_bab_m", 1000},
    {1002, "spl_b_bar_m", 1000},
    {1003, "spl_b_mab_m", 1000},
    {1004, "bnt_b_sc_m", 2000},
    {1005, "bnt_b_sc_l", 1000},
    {1007, "wg_l_b_ssk", 1000},
    {1018, "exh_b_ts", 1200},
    {1019, "exh_b_t", 2000},
    {1021, "exh_b_m", 2500},
    {1024, "lgt_b_sspt", 2000},
    {1029, "exh_c_s", 2000},
    {1043, "exh_lr_br2", 3500},
    {1044, "exh_lr_br1", 3000},
    {1047, "wg_l_a_f", 2500},
    {1048, "wg_l_c_f", 2500},
    {1049, "spl_a_f_r", 3000},
    {1050, "spl_c_f_r", 3000},
    {1056, "wg_l_a_st", 2500},
    {1090, "wg_l_a_u", 2500},
    {19306, "kmb_goflag2", 1000},
    {19307, "kmb_goflag3", 1000},
    {18647, "RedNeonTube1", 1000},
    {18648, "BlueNeonTube1", 1000},
    {18649, "GreenNeonTube1", 1000},
    {18650, "YellowNeonTube1", 1000},
    {18651, "PinkNeonTube1", 1000},
    {18652, "WhiteNeonTube1", 1000},
    {18749, "SAMPLogoSmall", 500},
    {19133, "ArrowType4", 1000},
    {19471, "forsale02", 500},
    {19878, "Skateboard1", 800},
    {19314, "bullhorns01", 1000},
    {19078, "TheParrot1", 4000},
    {19917, "CutsceneEngine1", 3000},
    {19893, "LaptopSAMP1", 1000},
    {2768, "CJ_CB_BURG", 1000},
    {19838, "CoffeeCup1", 1000},
    {11736, "MedicCase1", 1000},
    {1247, "bribe", 800},
    {19147, "PinSpotLight5", 1000},
    {19148, "PinSpotLight6", 1000},
    {19149, "PinSpotLight7", 1000},
    {19151, "PinSpotLight9", 1000},
    {19153, "PinSpotLight11", 1000},
    {19580, "Pizza1", 500},
    {2690, "CJ_FIRE_EXT", 1000},
    {19308, "taxi01", 1000},
    {1550, "CJ_MONEY_BAG", 1000},
	{19894, "laptop", 500},
	{19873, "toiletpaperroll1", 300},
	{19874, "soapbar1", 200},
	{19624, "case1", 600},
	{19621, "obj1", 150},
	{19833, "Cow1", 600},
    {19317, "bassguitar01", 1000},
    {19318, "flyingv01", 1000},
    {2232, "MED_SPEAKER_4", 2000},
    {1840, "speaker_2", 2000},
    {2229, "SWANK_SPEAKER", 2000},
	{1025, "wheel_or1", 1000},
	{1073, "wheel_sr6", 1000},
	{1074, "wheel_sr3", 1000},
	{1075, "wheel_sr2", 1000},
	{1076, "wheel_lr4", 1000},
	{1077, "wheel_lr1", 1000},
	{1078, "wheel_lr3", 1000},
	{1079, "wheel_sr1", 1000},
	{1080, "wheel_sr5", 1000},
	{1081, "wheel_sr4", 1000},
	{1082, "wheel_gn1", 1000},
	{1083, "wheel_lr2", 1000},
	{1084, "wheel_lr5", 1000},
	{1085, "wheel_gn2", 1000},
	{1096, "wheel_gn3", 1000},
	{1097, "wheel_gn4", 1000},
	{1098, "wheel_gn5", 1000},
	{19620, "police", 50000}
};