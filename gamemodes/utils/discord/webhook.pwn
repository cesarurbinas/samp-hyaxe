stock SendDiscordWebhook(const message[], type)
{
	new str_text[145];

	format(str_text, sizeof(str_text), "51.161.31.157:9991/webhook?content=[%d]%s", type, message);
	strreplace(str_text, " ", "ª");
	HTTP(0, HTTP_HEAD, str_text, "", "");
	return 1;
}