import sqlite3
from sqlite3 import Error

db_path = '../scriptfiles/DATABASE/server.db'

def sql_connection():
	try:
		con = sqlite3.connect(db_path)
		return con

	except Error:
		pass


class hyDatabase():
	def __init__(self):
		print("[DATABASE] Class called")

	def connect():
		self.con = sql_connection()
		print("[DATABASE] DB Connected")

	def execute(content):
		sql_cursor = self.con.cursor()
		sql_cursor.execute(content)
		return sql_cursor.fetchall()		