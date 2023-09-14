import discord
from discord.ext import commands

client = commands.Bot(command_prefix = 'neuroadmin')

@client.event
async def on_ready():
	print(f"[discord_learning.debug] Discord bot started")


@client.event
async def on_message(message):
	if message.channel.id == 766041055996280834:
		content = message.content

		content = content.lower()

		content = content.replace('**', '')
		content = content.replace('?', '')
		content = content.replace('¿', '')
		content = content.replace('"', '')

		content = content.replace('á', 'a')
		content = content.replace('ó', 'o')
		content = content.replace('í', 'i')
		content = content.replace('é', 'e')
		content = content.replace('ú', 'u')
		content = content.replace(',', '')
		content = content.replace('  ', ' ')

		print(f'[discord_learning.debug] {content}')
		positive = open("dataset/learning/positive.lrn", 'a')
		positive.write(f'{content}\n')
		positive.close()


client.run('NzU2Njk0NDcwNTQ3NzM0NTI5.X2VkpA.EXTBIK5U8gH31PYoEYpo2-Lyayo')