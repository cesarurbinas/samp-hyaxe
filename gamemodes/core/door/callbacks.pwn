forward ClosePoliceDoor(i);
public ClosePoliceDoor(i)
{
	Logger_Debug("ClosePoliceDoor"); // This is a debug line!

	POLICE_DOORS[i][police_door_CLOSED] = true;
	MoveDynamicObject(POLICE_DOORS[i][police_door_OBJECT_ID], POLICE_DOORS[i][police_door_X], POLICE_DOORS[i][police_door_Y], POLICE_DOORS[i][police_door_Z], 2.0, 0.0, 0.0, POLICE_DOORS[i][police_door_RZ]);
	return 1;
}

forward CloseJailDoor(i);
public CloseJailDoor(i)
{
	Logger_Debug("CloseJailDoor"); // This is a debug line!

	JAIL_DOORS[i][jail_door_CLOSED] = true;
	MoveDynamicObject(JAIL_DOORS[i][jail_door_OBJECT_ID], JAIL_DOORS[i][jail_door_X], JAIL_DOORS[i][jail_door_Y], JAIL_DOORS[i][jail_door_Z], 1.0, 0.0, 0.0, JAIL_DOORS[i][jail_door_RZ]);
	return 1;
}

forward CloseMafiaDoor(i);
public CloseMafiaDoor(i)
{
	Logger_Debug("CloseMafiaDoor"); // This is a debug line!

	MAFIA_DOORS[i][mafia_door_CLOSED] = true;
	MoveDynamicObject(MAFIA_DOORS[i][mafia_door_OBJECT_ID], MAFIA_DOORS[i][mafia_door_X], MAFIA_DOORS[i][mafia_door_Y], MAFIA_DOORS[i][mafia_door_Z], 2.0, 0.0, 0.0, MAFIA_DOORS[i][mafia_door_RZ]);
	return 1;
}

forward ClosePoliceGarageDoor(index);
public ClosePoliceGarageDoor(index)
{
	Logger_Debug("ClosePoliceGarageDoor"); // This is a debug line!

	POLICE_GARAGE_DOORS[index][police_gdoor_CLOSING] = true;
	MoveDynamicObject(POLICE_GARAGE_DOORS[index][police_gdoor_OBJECT_ID], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_X], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_Y], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_Z], POLICE_GARAGE_DOORS[index][police_gdoor_MOVE_SPEED], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_RX], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_RY], POLICE_GARAGE_DOORS[index][police_gdoor_CLOSED_RZ]);
	return 1;
}

forward CloseBarrier(i);
public CloseBarrier(i)
{
	Logger_Debug("CloseBarrier"); // This is a debug line!

	San_Andreas_Barriers[i][barrier_CLOSING] = true;
	MoveDynamicObject(San_Andreas_Barriers[i][barrier_OBJECT_ID], San_Andreas_Barriers[i][barrier_X], San_Andreas_Barriers[i][barrier_Y], San_Andreas_Barriers[i][barrier_Z] + 0.72967, 0.0065, 0.0, -90.0, San_Andreas_Barriers[i][barrier_ROTATION]);
	return 1;
}