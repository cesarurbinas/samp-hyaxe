import requests
import discord
from discord.ext import commands

client = commands.Bot(command_prefix = 'neuroadmin')

@client.event
async def on_ready():
	print(f"[discord_test.debug] Discord bot started")


@client.event
async def on_message(message):
	if message.channel.id == 766049689077547039:
		if not message.author.id == 756694470547734529:
			try:
				response = requests.post('http://51.161.31.157:6666/get_response', '{"author": "Yahir_Kozel", "playerid": 23, "question": "' + message.content + '"}').text
				await message.channel.send(f'<@{message.author.id}> {response}')

			except Exception as e:
				try:
					response = requests.post('http://51.161.31.157:6666/check_bad_use', '{"author": "Yahir_Kozel", "playerid": 23, "message": "' + message.content + '"}').text
					if response == 'Y':
						await message.channel.send(f'<@{message.author.id}> ha mal usado el canal')

				except Exception as e:
					pass
		


client.run('NzU2Njk0NDcwNTQ3NzM0NTI5.X2VkpA.EXTBIK5U8gH31PYoEYpo2-Lyayo')