GetFreePrinterSlot()
{
    new i = MAX_PRINTERS;
    while (--i != 0)
    {
        if (!MONEY_PRINTERS[i][mp_VALID]) return i;
    }
    return -1;
}

UpdateMoneyPrinter(index)
{
    new str_text[232];
    format(str_text, sizeof(str_text), ""COL_GREEN"Impresora de dinero"COL_WHITE"\n\
        Estado: "COL_RED"%.2f HP"COL_WHITE"\n\
        Dinero generado: "COL_GREEN"$%d"COL_WHITE"\n\
        Dueño: %s (ID: %d)",
        MONEY_PRINTERS[index][mp_HEALTH],
        MONEY_PRINTERS[index][mp_CASH],
        PLAYER_TEMP[ MONEY_PRINTERS[index][mp_OWNER] ][py_NAME],
        MONEY_PRINTERS[index][mp_OWNER]
    );
    UpdateDynamic3DTextLabelText(MONEY_PRINTERS[index][mp_LABEL], COLOR_WHITE, str_text);
    return 1;
}

DestroyMoneyPrinter(index, boom = true)
{
    DestroyDynamicObject(MONEY_PRINTERS[index][mp_OBJECT]);
    DestroyDynamic3DTextLabel(MONEY_PRINTERS[index][mp_LABEL]);

    if (boom) CreateExplosion(MONEY_PRINTERS[index][mp_X], MONEY_PRINTERS[index][mp_Y], MONEY_PRINTERS[index][mp_Z], 12, 1.0);

    MONEY_PRINTERS[index][mp_CASH] = 0;
    MONEY_PRINTERS[index][mp_VALID] = false;
    MONEY_PRINTERS[index][mp_OWNER] = INVALID_PLAYER_ID;
    return 1;
}

DestroyPlayerPrinters(playerid)
{
    for(new i = 0; i != MAX_PRINTERS; i ++)
    {
        if (MONEY_PRINTERS[i][mp_VALID] && MONEY_PRINTERS[i][mp_OWNER] == playerid)
            DestroyMoneyPrinter(i, false);
    }
    return 1;
}

CreateMoneyPrinter(playerid)
{
    new index = GetFreePrinterSlot();
    if (index == -1) return false;

    ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 900, true);

    MONEY_PRINTERS[index][mp_VALID] = true;
    MONEY_PRINTERS[index][mp_OWNER] = playerid;
    MONEY_PRINTERS[index][mp_WORLD] = GetPlayerVirtualWorld(playerid);
    MONEY_PRINTERS[index][mp_INTERIOR] = GetPlayerInterior(playerid);

    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);

    if (!MONEY_PRINTERS[index][mp_INTERIOR])
        CA_FindZ_For2DCoord(x, y, z);

    MONEY_PRINTERS[index][mp_OBJECT] = CreateDynamicObject(
        2201,
        x, y, z,
        0.0, 0.0, 0.0,
        MONEY_PRINTERS[index][mp_WORLD], MONEY_PRINTERS[index][mp_INTERIOR]
    );

    MONEY_PRINTERS[index][mp_X] = x;
    MONEY_PRINTERS[index][mp_Y] = y;
    MONEY_PRINTERS[index][mp_Z] = z;

    MONEY_PRINTERS[index][mp_HEALTH] = 1000.0;

    new str_text[232];
    format(str_text, sizeof(str_text), ""COL_GREEN"Impresora de dinero"COL_WHITE"\n\
        Estado: "COL_RED"%.2f HP"COL_WHITE"\n\
        Dinero generado: "COL_GREEN"$%d"COL_WHITE"\n\
        Dueño: %s (ID: %d)",
        MONEY_PRINTERS[index][mp_HEALTH],
        MONEY_PRINTERS[index][mp_CASH],
        PLAYER_TEMP[playerid][py_NAME],
        playerid
    );

    MONEY_PRINTERS[index][mp_LABEL] = CreateDynamic3DTextLabel(
        str_text,
        COLOR_WHITE,
        x, y, z + 0.6,
        5.0,
        .testlos = true,
        .worldid = MONEY_PRINTERS[index][mp_WORLD],
        .interiorid = MONEY_PRINTERS[index][mp_INTERIOR]
    );

    new info[3];
    info[0] = OBJECT_TYPE_PRINTER;
	info[1] = index; // Index
	info[2] = 0; // Nada
	Streamer_SetArrayData(STREAMER_TYPE_OBJECT, MONEY_PRINTERS[index][mp_OBJECT], E_STREAMER_EXTRA_ID, info);

    ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 1, 1, 0, 900, true);
    return true;
}