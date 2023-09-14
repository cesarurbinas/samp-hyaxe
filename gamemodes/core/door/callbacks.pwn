forward ClosePoliceDoor(i);
public ClosePoliceDoor(i)
{
	#if DEBUG_MODE == 1
		printf("ClosePoliceDoor"); // debug juju
	#endif

	POLICE_DOORS[i][police_door_CLOSED] = true;
	MoveDynamicObject(POLICE_DOORS[i][police_door_OBJECT_ID], POLICE_DOORS[i][police_door_X], POLICE_DOORS[i][police_door_Y], POLICE_DOORS[i][police_door_Z], 2.0, 0.0, 0.0, POLICE_DOORS[i][police_door_RZ]);
	return 1;
}

forward CloseJailDoor(i);
public CloseJailDoor(i)
{
	#if DEBUG_MODE == 1
		printf("CloseJailDoor"); // debug juju
	#endif

	JAIL_DOORS[i][jail_door_CLOSED] = true;
	MoveDynamicObject(JAIL_DOORS[i][jail_door_OBJECT_ID], JAIL_DOORS[i][jail_door_X], JAIL_DOORS[i][jail_door_Y], JAIL_DOORS[i][jail_door_Z], 1.0, 0.0, 0.0, JAIL_DOORS[i][jail_door_RZ]);
	return 1;
}

forward CloseMafiaDoor(i);
public CloseMafiaDoor(i)
{
	#if DEBUG_MODE == 1
		printf("CloseMafiaDoor"); // debug juju
	#endif

	MAFIA_DOORS[i][mafia_door_CLOSED] = true;
	MoveDynamicObject(MAFIA_DOORS[i][mafia_door_OBJECT_ID], MAFIA_DOORS[i][mafia_door_X], MAFIA_DOORS[i][mafia_door_Y], MAFIA_DOORS[i][mafia_door_Z], 2.0, 0.0, 0.0, MAFIA_DOORS[i][mafia_door_RZ]);
	return 1;
}

forward ClosePoliceGarageDoor(index);
public ClosePoliceGarageDoor(index)
{
	#if DEBUG_MODE == 1
		printf("ClosePoliceGarageDoor"); // debug juju
	#endif

	POLICE_GARAGE_DOORS[index][police_gdoor_CLOSING] = true;
	MoveDynamicObject(POLICE_GARAGE_DOORS[index][police_gdoor_OBJECT_ID], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_X], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_Y], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_Z], POLICE_GARAGE_DOORS[index][police_gdoor_MOVE_SPEED], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_RX], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_RY], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_RZ]);
	return 1;
}

forward CloseBarrier(i);
public CloseBarrier(i)
{
	#if DEBUG_MODE == 1
		printf("CloseBarrier"); // debug juju
	#endif

	San_Andreas_Barriers[i][barrier_CLOSING] = true;
	MoveDynamicObject(San_Andreas_Barriers[i][barrier_OBJECT_ID], San_Andreas_Barriers[i][barrier_X], San_Andreas_Barriers[i][barrier_Y], San_Andreas_Barriers[i][barrier_Z] + 0.72967, 0.0065, 0.0, -90.0, San_Andreas_Barriers[i][barrier_ROTATION]);
	return 1;
}