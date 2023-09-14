#include <sscanf2>
#include <discord-connector>

#define DISCORD:%0(%1,%2)          \
			forward discord_cmd_%0(%1[],%2[]); \
			public discord_cmd_%0(%1[],%2[])
			
forward OnDiscordCommand(args[], success);	


/*forward SendDC(channel[], const fmat[], va_args<>);
public SendDC(channel[], const fmat[], va_args<>)
{
	new
        str[145];
    va_format(str, sizeof (str), fmat, va_start<2>);
	BotChannel = DCC_FindChannelById(channel);
    return DCC_SendChannelMessage(BotChannel, str);
}*/

stock DiscordReply(channel[], const message[])
{
	new DCC_Channel:dest = DCC_FindChannelById(channel);
    return DCC_SendChannelMessage(dest, message);
}

forward DCC_OnMessageCreate(DCC_Message:message);
public DCC_OnMessageCreate(DCC_Message:message)
{
	new 
		real_message[164],
		user_name[144],
		DCC_Channel:channel,
		DCC_Channel:channel_command,
		DCC_User:author,
		bool:bot
	;

    DCC_GetMessageContent(message, real_message, 100);
    DCC_GetMessageChannel(message, channel);
    DCC_GetMessageAuthor(message, author);
	DCC_GetUserName(author, user_name);
    DCC_IsUserBot(author, bot);

    channel_command = DCC_FindChannelById("756714765920763925");

    if (channel == channel_command && !bot)
    {
        new dmsg[10][128];
		explode(dmsg, real_message, " ", 2);
		new command[10], args[50];
		sscanf(real_message, "s[10]s[50]", command, args);

		if (strfind(command, "!", true) != -1)
		{
			new funcdc[128];
			strdel(command, 0, 1);
			format(funcdc, sizeof(funcdc), "discord_cmd_%s", command);
			
			if ( isnull( dmsg[1] ) )
			{
				CallLocalFunction("OnDiscordCommand", "si", real_message, CallLocalFunction(funcdc, "ss", user_name, " "));
			}
			else CallLocalFunction("OnDiscordCommand", "si", real_message, CallLocalFunction(funcdc, "ss", user_name, args));
		}
    }
    return 1;
}

stock explode(explode[][], const source[], const del[] = " ", vertices = sizeof explode, iLength = sizeof explode[])
{
	new
		node,
		pointer,
		previous = -1,
		delimiter = strlen(del);

	while(node < vertices)
	{
		pointer = strfind(source, del, false, pointer);

		if (pointer == -1)
		{
			strmid(explode[node], source, previous, strlen(source), iLength);
			break;
		}
		else
		{
			strmid(explode[node], source, previous, pointer, iLength);
		}

		previous = (pointer += delimiter);
		++node;
	}
	return previous;
}