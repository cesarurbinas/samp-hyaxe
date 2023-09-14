stock SendDiscordWebhook(const message[], type)
{
	new str_text[364];

	format(str_text, sizeof(str_text), "51.161.31.157:9991/webhook?content=[%d]%s", type, message);
	strreplace(str_text, " ", "ª");
	HTTP(0, HTTP_GET, str_text, "", "MyHttpResponse");
	return 1;
}

forward MyHttpResponse(index, response_code, data[]);
public MyHttpResponse(index, response_code, data[])
{
	return 1;
}