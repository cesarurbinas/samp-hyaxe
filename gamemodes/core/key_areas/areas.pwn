enum
{
	AREA_TYPE_NONE,
	AREA_TYPE_GANGZONE,
	KEY_TYPE_ENTER,
	KEY_TYPE_Y,
	KEY_TYPE_H,
	KEY_TYPE_ALT,
	KEY_TYPE_MISSION
};

AddKeyArea(Float:x, Float:y, Float:range, key)
{
	new area = CreateDynamicCircle(x, y, range);
	Streamer_SetIntData(STREAMER_TYPE_AREA, area, E_STREAMER_EXTRA_ID, key);
	return 1;
}