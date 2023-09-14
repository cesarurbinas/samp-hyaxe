stock SendDiscordWebhook(const message[], type)
{
	Logger_Debug("Webhook sent: %s", message);
	
	new str_text[145];
	format(str_text, sizeof(str_text), "server.hyaxe.com:9991/webhook?content=[%d]%s", type, message);
	strreplace(str_text, " ", "ª");

	#if defined FINAL_BUILD
	HTTP(0, HTTP_HEAD, str_text, "", "");
	#endif
	return 1;
}