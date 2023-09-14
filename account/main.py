from flask import Flask

# Config
app = Flask(__name__)
auth_key = 'B987Tbt97BTb9SAF9B8Ttasbfdf6'

# Error catch
@app.errorhandler(404)
@app.errorhandler(500)
def app_error(e):
	print(f'[Error handler]: {e}')
	return '0'

# Get account
@app.route('/<key>/login/<acc_id>')
def login(key, acc_id):
	if key == auth_key:
		try:
			f = open(f'data/{acc_id}', 'r')
			return f.read()
		
		except Exception as e:
			print(f'[Error - login]: {e}')
			pass

	return '0'

# Register
@app.route('/<key>/register/<acc_data>')
def register(key, acc_data):
	if key == auth_key:
		try:
			acc_id = acc_data.split(':')[1]
			f = open(f'data/{acc_id}', 'w')
			f.write(acc_data)
			return 'Y'
		
		except Exception as e:
			print(f'[Error - register]: {e}')
			pass

	return '0'


if __name__ == '__main__':
	app.run(host = '0.0.0.0', port = 10500, debug = False)