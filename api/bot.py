## LIBS ##
import os
import json
import requests
import discord
from discord.ext import commands


## INIT ##
client = commands.Bot(command_prefix = '!', help_command = None)


## EVENTS ##
@client.event
async def on_ready():
	print("hyaxe samp bot started")


## RESTART COMMAND ##
@client.command()
async def reiniciar(ctx):
	try:
		role_names = [role.name for role in ctx.message.author.roles]
		if not 'server_manager' in role_names:
			await ctx.send(f"{ctx.message.author} no tienes permisos para esto.")
			return

	except Exception as e:
		await ctx.send(f"{ctx.message.author} no tienes permisos para esto.")
		return

	os.system('killall -9 samp03svr')

	await ctx.send(f'{ctx.message.author} ha reiniciado el servidor.')


@client.command()
async def server(ctx):
	try:
		role_names = [role.name for role in ctx.message.author.roles]
		if not 'server_manager' in role_names:
			await ctx.send(f"{ctx.message.author} no tienes permisos para esto.")
			return

	except Exception as e:
		await ctx.send(f"{ctx.message.author} no tienes permisos para esto.")
		return

	embed = discord.Embed(title = f"HySamp", color = 0xec4134)

	userip = requests.get('https://api.ipify.org').text
	userlocation = requests.get(f'http://ip-api.com/json/{userip}').json()
	cpu = requests.get('http://51.161.31.157:1338/cpu').text
	ram = requests.get('http://51.161.31.157:1338/ram').text
	net = requests.get('http://51.161.31.157:1338/net').text.split('[')

	embed.add_field(name = "Location",
				value = f'`{userlocation["country"]}, {userlocation["regionName"]}, {userlocation["city"]}`',
				inline = True)

	embed.add_field(name = "CPU",
				value = f'`{cpu}%`',
				inline = True)

	embed.add_field(name = "RAM",
				value = f'`{ram}%`',
				inline = True)

	embed.add_field(name = "Download",
				value = f'`{net[0]}`',
				inline = True)

	embed.add_field(name = "Upload",
				value = f'`{net[1]}`',
				inline = True)

	await ctx.send(embed = embed)


@client.command()
async def cpu(ctx):
	try:
		role_names = [role.name for role in ctx.message.author.roles]
		if not 'server_manager' in role_names:
			await ctx.send(f"{ctx.message.author} no tienes permisos para esto.")
			return

	except Exception as e:
		await ctx.send(f"{ctx.message.author} no tienes permisos para esto.")
		return

	info = requests.get('http://51.161.31.157:1338/core').text

	embed = discord.Embed(
		title = f"CPU Information",
		description = f"```{info}```",
		color = 0xec4134
	)

	await ctx.send(embed = embed)


@client.command()
async def memory(ctx):
	try:
		role_names = [role.name for role in ctx.message.author.roles]
		if not 'server_manager' in role_names:
			await ctx.send(f"{ctx.message.author} no tienes permisos para esto.")
			return

	except Exception as e:
		await ctx.send(f"{ctx.message.author} no tienes permisos para esto.")
		return

	info = requests.get('http://51.161.31.157:1338/memory').text

	embed = discord.Embed(
		title = f"Memory Information",
		description = f"```{info}```",
		color = 0xec4134
	)

	await ctx.send(embed = embed)


@client.command()
async def disk(ctx):
	try:
		role_names = [role.name for role in ctx.message.author.roles]
		if not 'server_manager' in role_names:
			await ctx.send(f"{ctx.message.author} no tienes permisos para esto.")
			return

	except Exception as e:
		await ctx.send(f"{ctx.message.author} no tienes permisos para esto.")
		return

	info = requests.get('http://51.161.31.157:1338/disk').text

	embed = discord.Embed(
		title = f"Disk Information",
		description = f"```{info}```",
		color = 0xec4134
	)

	await ctx.send(embed = embed)


@client.command()
async def network(ctx):
	try:
		role_names = [role.name for role in ctx.message.author.roles]
		if not 'server_manager' in role_names:
			await ctx.send(f"{ctx.message.author} no tienes permisos para esto.")
			return

	except Exception as e:
		await ctx.send(f"{ctx.message.author} no tienes permisos para esto.")
		return

	info = requests.get('http://51.161.31.157:1338/network').text

	embed = discord.Embed(
		title = f"Network Information",
		description = f"```{info}```",
		color = 0xec4134
	)

	await ctx.send(embed = embed)


@client.command()
async def reporte(ctx, email, *, content):
	try:
		role_names = [role.name for role in ctx.message.author.roles]
		if not 'Moderator [SAMP]' in role_names:
			await ctx.send(f"{ctx.message.author} no tienes permisos para esto.")
			return

	except Exception as e:
		await ctx.send(f"{ctx.message.author} no tienes permisos para esto.")
		return

	requests.post('http://51.161.31.157:9991/send_email', data = '{"email": "' + email + '", "title": "Reporte atendido", "content": "' + content +' "}')

	await ctx.send(f'Email enviado a `{email}`: {content}')


@client.command()
async def whitelist(ctx, email, name):
	try:
		role_names = [role.name for role in ctx.message.author.roles]
		if not 'Moderator [SAMP]' in role_names:
			await ctx.send(f"{ctx.message.author} no tienes permisos para esto.")
			return

	except Exception as e:
		await ctx.send(f"{ctx.message.author} no tienes permisos para esto.")
		return

	content = f'Felicidades, la cuenta {name} ha sido verificada.'
	requests.get(f'http://51.161.31.157:9991/add_whitelist/{name}')
	requests.post('http://51.161.31.157:9991/send_email', data = '{"email": "' + email + '", "title": "Cuenta verificada", "content": "' + content +' "}')

	await ctx.send(f'La cuenta `{name}` ha sido verificada y fue notificado al correo `{email}`')

## RUN BOT ##
client.run('NzU2MzY2NDk0ODc4OTI0ODQy.X2QzMA.xyZvNZNNjEk2ZeYBjRKW7dctbx8')