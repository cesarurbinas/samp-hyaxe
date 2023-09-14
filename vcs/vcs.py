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

# Get credits
@app.route('/<key>/get_credit/<identificator>')
def get_credit(key, identificator):
	if key == auth_key:
		try:
			f = open(f'data/{identificator}', 'r')
			return f.read()
		
		except Exception as e:
			print(f'[Error - get_credit]: {e}')
			pass

	return '0'

# Update credits
@app.route('/<key>/update_credit/<identificator>/<credit>')
def update_credit(key, identificator, credit):
	if key == auth_key:
		try:
			f = open(f'data/{identificator}', 'w')
			f.write(credit)
			return credit
		
		except Exception as e:
			print(f'[Error - update_credit]: {e}')
			pass

	return '0'

if __name__ == '__main__':
	app.run(host = '0.0.0.0', port = 54777, debug = False)