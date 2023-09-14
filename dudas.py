import json
import requests

output = input("Output > ")

discord_bot = 'NTg3NjQ3NjQyNTYyMDY4NTEz.XP5ngw.2WhJW_QXPkxVShqscaW20zo9qFM'

req = requests.get(
	f'https://discord.com/api/v8/channels/765371393927020584/messages?limit=100',
	headers = {'Content-Type': 'application/json', 'Authorization': f'Bot {discord_bot}'}
).json()

f = open(output, 'a')

for message in req:
	try:
		content = message['content']
		content = content.replace('Duda: ', '')
		content = content.replace('duda: ', '')
		content = content.replace('Duda:', '')
		content = content.replace('duda:', '')

		content = content.replace('Respuesta: ', '')
		content = content.replace('respuesta: ', '')
		content = content.replace('Respuesta:', '')
		content = content.replace('respuesta:', '')

		content = content.replace('**', '')
		content = content.replace('?', '')
		content = content.replace('¿', '')
		content = content.replace('"', '')

		content = content.split('\n')

		if len(content[0]) > 143:
			print(f'Pregunta skipeadad: {content[0]}')
			continue

		if len(content[1]) > 143:
			print(f'Respuesta skipeadad: {content[1]}')
			continue

		print(f'Pregunta: {content[0]}\nRespuesta: {content[1]}')

		separator_1 = '{'
		separator_2 = '}'
		f.write(f'{separator_1}"{content[0]}", "{content[1]}"{separator_2},\n')

	except Exception as e:
		print(f'Error: {e}')

f.close()