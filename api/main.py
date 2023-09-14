import os
import json
import requests
from datetime import date
from flask import Flask, request, url_for, render_template, jsonify
from flask_mail import Mail, Message
from discord_webhooks import DiscordWebhook, DiscordEmbed


# Config
app = Flask(__name__)


# Email
app.config['MAIL_SERVER'] = 'mail.privateemail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USERNAME'] = 'contact@hyaxe.com'
app.config['MAIL_PASSWORD'] = 'RUSSIAN09082004'
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True


# Intialize Mail
mail = Mail(app)


# Utils
def IsValidKey(key):
	if key == 'I88B7B7F7Es6bKkNS9SB77svJA':
		return True

	return False


# Webhooks
def SendWebhookMessage(message, msg_type):
	if msg_type == 1:
		try:
			webhook = DiscordWebhook(url = 'https://discordapp.com/api/webhooks/692451774098833450/qQBLpESmkAguVvPWOaf1ZwD_t8zK2TpwPe_rNImUiIP7jKrT3zVb37vYJSPFu9noygrr')
			embed = DiscordEmbed(description = message)
			webhook.add_embed(embed)
			response = webhook.execute()

		except Exception as e:
			pass

	elif msg_type == 2:
		with open('crews.txt', 'r') as f:
			crews = [line.strip() for line in f]

		for x in range(len(crews)):
			try:
				webhook = DiscordWebhook(url = crews[x])
				embed = DiscordEmbed(description = message, color = 0x289058)
				embed.set_author(name = 'Graffitis', url = 'https://www.hyaxe.com/static/files/mxdzdqdpqooafkxricon63.gif', icon_url = 'https://www.hyaxe.com/static/files/mxdzdqdpqooafkxricon63.gif')
				webhook.add_embed(embed)
				response = webhook.execute()

			except Exception as e:
				pass

	elif msg_type == 3:
		with open('crews.txt', 'r') as f:
			crews = [line.strip() for line in f]

		for x in range(len(crews)):
			try:
				webhook = DiscordWebhook(url = crews[x])
				embed = DiscordEmbed(description = message, color = 0x40bcb8)
				embed.set_author(name = 'Mercados', url = 'https://www.hyaxe.com/static/files/zmkqublzeoapzmiiicon23.gif', icon_url = 'https://www.hyaxe.com/static/files/zmkqublzeoapzmiiicon23.gif')
				webhook.add_embed(embed)
				response = webhook.execute()

			except Exception as e:
				pass

	elif msg_type == 4:
		with open('crews.txt', 'r') as f:
			crews = [line.strip() for line in f]

		for x in range(len(crews)):
			try:
				webhook = DiscordWebhook(url = crews[x])
				embed = DiscordEmbed(description = message, color = 0xd08820)
				embed.set_author(name = 'Territorios', url = 'https://www.hyaxe.com/static/files/rxvuhabadibhptpjicon60.gif', icon_url = 'https://www.hyaxe.com/static/files/rxvuhabadibhptpjicon60.gif')
				webhook.add_embed(embed)
				response = webhook.execute()

			except Exception as e:
				pass

	print(f'[{msg_type}] {message}')


@app.route('/webhook')
def webhook():
	if request.remote_addr == '51.161.31.157':
		message = request.args.get('content', default = '*', type = str)
		message = message.replace("ª", " ")

		if message[:3] == '[1]':
			content = message[3:]
			SendWebhookMessage(content, 1)

		elif message[:3] == '[2]':
			content = message[3:]
			SendWebhookMessage(content, 2)

		elif message[:3] == '[3]':
			content = message[3:]
			SendWebhookMessage(content, 3)

		elif message[:3] == '[4]':
			content = message[3:]
			SendWebhookMessage(content, 4)

		return 'very yas'

	else:
		return 'Access denied'
		
	return 'yas'


@app.route('/add_webhook', methods = ['GET', 'POST'])
def add_webhook():
	content = request.get_json(silent = True)
	if IsValidKey(content.get('key')):
		f = open('crews.txt', 'a')
		f.write(f'{content.get("url")}\n')
		f.close()

		webhook = DiscordWebhook(url = content.get('url'))
		embed = DiscordEmbed(title = 'hyNotification', description = 'Felicidades, ha registrado correctamente un webhook para hyNotification, ya puede comenzar a recibir notificaciones especiales de Hyaxe (SA:MP).', color = 0xec4134)
		embed.set_footer(text = 'Hyaxe.com')
		embed.set_timestamp()

		today = date.today()
		d1 = today.strftime("%d/%m/%Y")

		with open('crews.txt', 'r') as f:
			crews = [line.strip() for line in f]

		embed.add_embed_field(name = 'Fecha de registro', value = d1)
		embed.add_embed_field(name = 'Num. identificativo', value = f'Webhook Nº {len(crews)}')

		webhook.add_embed(embed)
		response = webhook.execute()
		
	return 'yas'


# Proxy check
@app.route('/proxycheck/<ip>')
def proxy_check(ip):
	whitelist = ['138.204.13.179', '31.214.141.206']
	if ip in whitelist:
		return 'N'
		
	address_info = requests.get(f"http://ip-api.com/json/{ip}?fields=proxy,hosting,countryCode").json()
	whitelist = [
		'AD',
		'AR',
		'BO',
		'CL',
		'CO',
		'CR',
		'DO',
		'EC',
		'ES',
		'GT',
		'HT',
		'MA',
		'MX',
		'PE',
		'PR',
		'PY',
		'SV',
		'UY',
		'VE',
		'HN',
		'AW'
	]

	if not address_info.get('countryCode') in whitelist:
		return 'Y'

	if address_info.get('hosting') == True:
		return 'Y'

	if address_info.get('proxy') == True:
		return 'Y'

	return 'N'


# Email
@app.route('/send_email', methods = ['GET', 'POST'])
def send_emil():
	try:
		if not request.data:
			request_data = request.form.to_dict()
			for item in request_data:
				final_data = item
				break

		else:
			final_data = request.data.decode('latin1')

		final_data = json.loads(final_data)
		print(f'[EMAIL] Data: {final_data}')
		
		email_info = Message(final_data['title'], sender = 'contact@hyaxe.com', recipients = [ final_data['email'] ])
		email_info.body = render_template('email.html', title = final_data['title'], content = final_data['content'])
		email_info.html = email_info.body
		mail.send(email_info)

		return 'sent'

	except Exception as e:
		print(f'[DEBUG] Internal error (send_emil): {e}')
		return 'INTERNAL_SERVER_ERROR', 1

	return 'very yas'


if __name__ == '__main__':
	app.run(host = '0.0.0.0', port = 9991, debug = True)