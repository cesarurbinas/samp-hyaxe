import json
import requests
import random
import string
import threading
import sqlite3
from sqlite3 import Error
from discord_webhooks import DiscordWebhooks
from flask import Flask, request, jsonify, g

db_path = '../scriptfiles/DATABASE/server.db'

def sql_connection():
    try:
        con = sqlite3.connect(db_path)
        return con

    except Error:
        pass
        

class hyDatabase(threading.Thread):
    def __init__(self):
        super(hyDatabase, self).__init__()

    def run(self):
        self.connection = sql_connection()
        print("[DATABASE] DB Connected")
        return self.connection

    def execute(self, content):
        sql_cursor = self.connection.cursor()
        sql_cursor.execute(content)
        return sql_cursor.fetchall()        


app = Flask(__name__)
#database = hyDatabase().start()

def IsValidKey(key):
    if key == 'I88B7B7F7Es6bKkNS9SB77svJA':
        return True

    return False


def get_random_string(length):
    letters = string.ascii_letters + string.digits
    result_str = ''.join(random.choice(letters) for i in range(length))
    return result_str


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


@app.route('/gift/<key>/')
def gift(key):
    if IsValidKey(key):
        gift_code = get_random_string(8)
        database.execute(f"INSERT INTO `GIFTS_CODES` (`CODE`, `TYPE`, `EXTRA`, `USED`) VALUES ('{gift_code}', '0', '10', '0');")
        return gift_code

    return 'yas'


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
    whitelist = ['138.204.13.179']
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
        'HN'
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