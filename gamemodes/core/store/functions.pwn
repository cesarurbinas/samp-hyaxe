ShowStore(playerid)
{
	new payload[264];
	format(payload, sizeof(payload), "51.161.31.157:54777/B987Tbt97BTb9SAF9B8Ttasbfdf6/get_credit/%d", ACCOUNT_INFO[playerid][ac_ID]);
	HTTP(playerid, HTTP_GET, payload, "", "StoreMenuRecv");
	return 1;
}