#define MAX_KEY_AREAS 10000
enum enum_key_Areas
{
	ka_ID,
	ka_KEY[32]
};
new KEY_AREAS[MAX_KEY_AREAS][enum_key_Areas];

enum
{
	AREA_TYPE_KEY
};

AddKeyArea(Float:x, Float:y, Float:range, key[])
{
	new index = CreateDynamicCircle(x, y, range);
	KEY_AREAS[index][ka_ID] = index;
  	Streamer_SetIntData(STREAMER_TYPE_AREA, KEY_AREAS[index][ka_ID], E_STREAMER_EXTRA_ID, AREA_TYPE_KEY);
	format(KEY_AREAS[index][ka_KEY], 32, "%s", key);
	return 1;
}