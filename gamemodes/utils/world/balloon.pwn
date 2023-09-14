SetBalloonAction(balloon_id, Float:x, Float:y, Float:z, Float:speed)
{
	HOTAIR_BALLOONS[balloon_id][balloon_ACTIVE] = true;
	StopDynamicObject(HOTAIR_BALLOONS[balloon_id][balloon_OBJECT_ID]);
	MoveDynamicObject(HOTAIR_BALLOONS[balloon_id][balloon_OBJECT_ID], x, y, z, speed, 0.0, 0.0, 10.0);
	printf("%f, %f, %f", x, y, z);
	return 1;
}

BackBalloonToStart(balloon_id, Float:speed)
{
	HOTAIR_BALLOONS[balloon_id][balloon_ACTIVE] = false;
	StopDynamicObject(HOTAIR_BALLOONS[balloon_id][balloon_OBJECT_ID]);
	MoveDynamicObject(HOTAIR_BALLOONS[balloon_id][balloon_OBJECT_ID], HOTAIR_BALLOONS[balloon_id][balloon_X], HOTAIR_BALLOONS[balloon_id][balloon_Y], HOTAIR_BALLOONS[balloon_id][balloon_Z], speed, 0.0, 0.0, HOTAIR_BALLOONS[balloon_id][balloon_RZ]);
	return 1;
}