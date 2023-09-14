forward UpdateMoneyPrinters();
public UpdateMoneyPrinters()
{
    for(new i = 0; i != MAX_PRINTERS; i ++)
    {
        if (MONEY_PRINTERS[i][mp_VALID] && MONEY_PRINTERS[i][mp_OWNER] != INVALID_PLAYER_ID)
        {
            if (!IsPlayerConnected(MONEY_PRINTERS[i][mp_OWNER])) continue;

            MONEY_PRINTERS[i][mp_HEALTH] -= mathfrandom(1.0, 3.0);
            if (MONEY_PRINTERS[i][mp_HEALTH] <= 0.0)
            {
                MONEY_PRINTERS[i][mp_HEALTH] = 0.0;
                ShowPlayerNotification(MONEY_PRINTERS[i][mp_OWNER], "Se te ha explotado una impresora de dinero por sobrecarga.", 4);
                DestroyMoneyPrinter(i);
                continue;
            }

            new prize = minrand(100, 500);
            MONEY_PRINTERS[i][mp_CASH] += prize;
            GivePlayerCash(MONEY_PRINTERS[i][mp_OWNER], prize);
            UpdateMoneyPrinter(i);

            new str_text[164];
            format(str_text, sizeof(str_text), "Has generado ~g~$%d~w~ con la impresora N%d.", prize, i);
            ShowPlayerNotification(MONEY_PRINTERS[i][mp_OWNER], str_text, 3);
        }
    }
    return 1;
}