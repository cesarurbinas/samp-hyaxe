import json
import requests
from discord_webhooks import DiscordWebhooks
from flask import Flask, request, jsonify

app = Flask(__name__)

def IsValidKey(key):
    if key == 'I88B7B7F7Es6bKkNS9SB77svJA':
        return True

    return False

def SendWebhookMessage(message, msg_type):
    if msg_type == 1:
        webhook = DiscordWebhooks('https://discordapp.com/api/webhooks/692451774098833450/qQBLpESmkAguVvPWOaf1ZwD_t8zK2TpwPe_rNImUiIP7jKrT3zVb37vYJSPFu9noygrr') 
        webhook.set_content(title = 'Log', description = message)

        webhook.send()

    elif msg_type == 2:
        with open('crews.txt', 'r') as f:
            crews = [line.strip() for line in f]

        for x in range(len(crews)):
            webhook = DiscordWebhooks(crews[x])
            webhook.set_content(title = 'Hyaxe Roleplay', description = message, color = 0x289058)
            webhook.set_footer(text = 'Disputa de graffitis', icon_url = 'https://wiki.sa-mp.com/wroot/images2/d/db/Icon_63.gif')
            webhook.send()

            print(f'[CREW {x} {crews[x]}')

    elif msg_type == 3:
        with open('crews.txt', 'r') as f:
            crews = [line.strip() for line in f]

        for x in range(len(crews)):
            webhook = DiscordWebhooks(crews[x])
            webhook.set_content(title = 'Hyaxe Roleplay', description = message, color = 0x40bcb8)
            webhook.set_footer(text = 'Disputa de mercados', icon_url = 'https://wiki.sa-mp.com/wroot/images2/a/a7/Icon_23.gif')
            webhook.send()

            print(f'[CREW {x} {crews[x]}')

    print(f'[{msg_type}] {message}')


@app.route('/webhook')
def webhook():
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
		
	return 'yas'

@app.route('/proxycheck/<ip>')
def proxy_check(ip):
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
        'VE'
    ]

    if not address_info.get('countryCode') in whitelist:
        return 'Y'

    if address_info.get('hosting') == True:
        return 'Y'

    if address_info.get('proxy') == True:
        return 'Y'

    return 'N'

if __name__ == '__main__':
	app.run(host = '0.0.0.0', port = 9991, debug = True)