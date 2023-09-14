import sqlite3
import json
from sqlite3 import Error
from flask import Flask, jsonify
from datetime import datetime

app_url = 'http://www.hyaxe.com/'
db_path = './scriptfiles/DATABASE/server.db'

# Funcs
def sql_connection():
	try:
		con = sqlite3.connect(db_path)
		return con

	except Error:
		pass


def IsValidKey(key):
	if key == 'I88B7B7F7Es6bKkNS9SB77svJA':
		return True

	return False


# Init
app = Flask(__name__)


@app.route('/<key>/GetUser=<id>')
def GetUser(key, id):
	if IsValidKey(key) == True:
		con = sql_connection()
		sql_cursor = con.cursor()
		sql_cursor.execute(f"SELECT `ID`, `NAME`, `EMAIL`, `PASS`, `SALT`, `IP`, `LAST_CONNECTION`, `ADMIN_LEVEL`, `LEVEL`, `SU`, `SU_EXPIRE_DATE`, `SD`, `CONNECTED`, `PLAYERID`, `REP` FROM `CUENTA` WHERE `ID` = '{id}';")
		rows = sql_cursor.fetchall()

		if not len(rows) == 0:
			return jsonify(
					db_id = rows[0][0],
					name = rows[0][1],
					email = rows[0][2],
					password = rows[0][3],
					salt = rows[0][4],
					ip = rows[0][5],
					last_connection = rows[0][6],
					admin_level = rows[0][7],
					level = rows[0][8],
					vip = rows[0][9],
					vip_expire = rows[0][10],
					hycoins = rows[0][11],
					connected = rows[0][12],
					playerid = rows[0][13],
					reputation = rows[0][14]
				)

		return 'Not found'
	else:
		return '403'


@app.route('/<key>/GetNameId=<name>')
def GetNameId(key, name):
	if IsValidKey(key) == True:
		con = sql_connection()
		sql_cursor = con.cursor()
		sql_cursor.execute(f"SELECT `ID`, `NAME` FROM `CUENTA` WHERE `NAME` = '{name}';")
		rows = sql_cursor.fetchall()

		if not len(rows) == 0:
			return jsonify(
					db_id = rows[0][0],
					name = rows[0][1]
				)

		return 'Not found'
	else:
		return '403'


@app.route('/<key>/GetUserNotifications=<id>,<limit>')
def GetUserNotifications(key, id, limit):
	if IsValidKey(key) == True:
		con = sql_connection()
		con.text_factory = bytes
		sql_cursor = con.cursor()
		sql_cursor.execute(f"SELECT `ID_USER`, `MESSAGE`, `DATE` FROM `PLAYER_NOTIFICATIONS` WHERE `ID_USER` = '{id}' ORDER BY `DATE` DESC LIMIT {limit};")
		rows = sql_cursor.fetchall()

		if not len(rows) == 0:
			final_json = []

			for row in rows:
				final_json.append({"db_id": row[0], "message": row[1].decode('latin-1'), "date": datetime.fromtimestamp(row[2])})

			return jsonify(final_json)

		return 'Not found'
	else:
		return '403'


@app.route('/<key>/GetBank=<id>')
def GetBank(key, id):
	if IsValidKey(key) == True:
		con = sql_connection()
		sql_cursor = con.cursor()
		sql_cursor.execute(f"SELECT `ID_ACCOUNT`, `ID_USER`, `BALANCE` FROM `BANK_ACCOUNTS` WHERE `ID_USER` = '{id}';")
		rows = sql_cursor.fetchall()

		if not len(rows) == 0:
			return jsonify(
					account = rows[0][0],
					db_id = rows[0][1],
					balance = rows[0][2]
				)

		return 'Not found'
	else:
		return '403'


@app.route('/<key>/GetCharacter=<id>')
def GetCharacter(key, id):
	if IsValidKey(key) == True:
		con = sql_connection()
		sql_cursor = con.cursor()
		sql_cursor.execute(f"SELECT `ID_USER`, `SKIN`, `CASH`, `HEALTH`, `ARMOUR`, `SEX`, `HUNGRY`, `THIRST`, `POLICE_JAIL_TIME` FROM `PERSONAJE` WHERE `ID_USER` = '{id}';")
		rows = sql_cursor.fetchall()

		if not len(rows) == 0:
			return jsonify(
					id = rows[0][0],
					skin = rows[0][1],
					cash = rows[0][2],
					health = rows[0][3],
					armour = rows[0][4],
					sex = rows[0][5],
					hungry = rows[0][6],
					thrist = rows[0][7],
					jail_time = rows[0][8]
				)

		return 'Not found'
	else:
		return '403'


@app.route('/<key>/GetUserCrew=<id>')
def GetUserCrew(key, id):
	if IsValidKey(key) == True:
		con = sql_connection()
		sql_cursor = con.cursor()
		sql_cursor.execute(f"SELECT `ID_USER`, `ID_CREW`, `RANK` FROM `PLAYER_CREW` WHERE `ID_USER` = '{id}';")
		rows = sql_cursor.fetchall()

		if not len(rows) == 0:
			return jsonify(
					id = rows[0][0],
					id_crew = rows[0][1],
					rank = rows[0][2]
				)

		return 'Not found'
	else:
		return '403'


@app.route('/<key>/GetCrew=<id>')
def GetCrew(key, id):
	if IsValidKey(key) == True:
		con = sql_connection()
		sql_cursor = con.cursor()
		sql_cursor.execute(f"SELECT `ID`, `NAME`, `COLOR`, `GRAFFITIS_COUNT`, `MARKETS_COUNT`, `DESC` FROM `CREW` WHERE `ID` = '{id}';")
		rows = sql_cursor.fetchall()

		markets = rows[0][4]
		if rows[0][4] == None:
			markets = 0

		graffitis = rows[0][3]
		if rows[0][3] == None:
			graffitis = 0

		if not len(rows) == 0:
			return jsonify(
					id_crew = rows[0][0],
					name = rows[0][1],
					color = rows[0][2],
					graffitis = graffitis,
					markets = markets,
					description = rows[0][5]
				)

		return 'Not found'
	else:
		return '403'


@app.route('/<key>/GetCrewMembers=<id>')
def GetCrewMembers(key, id):
	if IsValidKey(key) == True:
		con = sql_connection()
		sql_cursor = con.cursor()
		sql_cursor.execute(f"SELECT `CUENTA`.`NAME`, `CUENTA`.`LAST_CONNECTION`, `CUENTA`.`ID`, `CUENTA`.`CONNECTED`, `PLAYER_CREW`.`RANK` FROM `CUENTA`, `PLAYER_CREW` WHERE `PLAYER_CREW`.`ID_USER` = `CUENTA`.`ID` AND `PLAYER_CREW`.`ID_CREW` = '{id}' ORDER BY `CUENTA`.`CONNECTED` DESC, `PLAYER_CREW`.`RANK`;")
		rows = sql_cursor.fetchall()

		if not len(rows) == 0:
			final_json = []

			for row in rows:
				rank_id = intern_GetCrewRank(id, row[3])
				ch_user = intern_GetCharacter(row[2])
				final_json.append({
									"name": row[0], 
									"last_connection": row[1],
									"connected": row[3],
									"rank_id": row[4],
									"rank_name": rank_id['name'],
									"db_id": row[2],
									"skin_url": f'{app_url}static/skins/{ch_user["skin"]}.png'})

			return jsonify(final_json)

		return 'Not found'
	else:
		return '403'


@app.route('/<key>/GetCrewRank=<id>,<pos>')
def GetCrewRank(key, id, pos):
	if IsValidKey(key) == True:
		con = sql_connection()
		sql_cursor = con.cursor()
		sql_cursor.execute(f"SELECT `ID`, `RANK_NAME`, `RANK_POS`, `ID_CREW` FROM `CREW_RANKS` WHERE `ID_CREW` = '{id}' AND `RANK_POS` = '{pos}';")
		rows = sql_cursor.fetchall()

		if not len(rows) == 0:
			return jsonify(
					id = rows[0][0],
					name = rows[0][1],
					pos = rows[0][2],
					id_crew = rows[0][3]
				)

		return 'Not found'
	else:
		return '403'


def intern_GetCrewRank(id, pos):
	con = sql_connection()
	sql_cursor = con.cursor()
	sql_cursor.execute(f"SELECT `ID`, `RANK_NAME`, `RANK_POS`, `ID_CREW` FROM `CREW_RANKS` WHERE `ID_CREW` = '{id}' AND `RANK_POS` = '{pos}';")
	rows = sql_cursor.fetchall()

	if not len(rows) == 0:
		return {
			"id": rows[0][0],
			"name": rows[0][1],
			"pos": rows[0][2],
			"id_crew": rows[0][3]
		}

	return 'Not found'


def intern_GetCharacter(id):
	con = sql_connection()
	sql_cursor = con.cursor()
	sql_cursor.execute(f"SELECT `ID_USER`, `SKIN`, `CASH`, `HEALTH`, `ARMOUR`, `SEX`, `HUNGRY`, `THIRST`, `POLICE_JAIL_TIME` FROM `PERSONAJE` WHERE `ID_USER` = '{id}';")
	rows = sql_cursor.fetchall()

	if not len(rows) == 0:
		return {
				"id": rows[0][0],
				"skin": rows[0][1],
				"cash": rows[0][2],
				"health": rows[0][3],
				"armour": rows[0][4],
				"sex": rows[0][5],
				"hungry": rows[0][6],
				"thrist": rows[0][7],
				"jail_time": rows[0][8]
			}

	return 'Not found'


if __name__ == '__main__':
    app.run(host = '0.0.0.0', port = 8092, debug = True)