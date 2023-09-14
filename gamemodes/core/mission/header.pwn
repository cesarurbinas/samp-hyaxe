enum e_start_mission
{
    ems_ENABLED,
    ems_NAME[64],
    ems_MAPICON,
	Float:ems_X,
	Float:ems_Y,
	Float:ems_Z
};

new START_MISSION[][e_start_mission] =
{
	{true, "Sweet", 38, 2516.7451, -1675.5376, 14.0275},
	{true, "Ryder", 34, 2459.3867, -1688.2607, 13.5354},
	{true, "Big Smoke", 8, 2073.6650, -1703.2490, 13.5547},
	{true, "C.R.A.S.H", 16, 1044.3706, -1337.5874, 13.5530}
};