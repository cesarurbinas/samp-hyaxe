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

# Give credits
@app.route('/<key>/give_credit/<identificator>/<credit>')
def give_credit(key, identificator, credit):
	if key == auth_key:
		try:
			try:
				f = open(f'data/{identificator}', 'r')

			except Exception as e:
				update_credit(auth_key, identificator, '0')
				f = open(f'data/{identificator}', 'r')
				pass
			
			actual_credit = int(f.read())
			positive_credit = int(credit)

			new_credit = (actual_credit + positive_credit)
			if new_credit < 0:
				new_credit = 0

			update_credit(auth_key, identificator, str(new_credit))
			return new_credit
		
		except Exception as e:
			print(f'[Error - update_credit]: {e}')
			pass

	return '0'

# Buy product
@app.route('/<key>/product_buy/<identificator>/<credit>')
def product_buy(key, identificator, credit):
	if key == auth_key:
		try:
			f = open(f'data/{identificator}', 'r')
			actual_credit = int(f.read())
			negative_credit = int(credit)

			if actual_credit > negative_credit:
				new_credit = (actual_credit - negative_credit)
				if new_credit < 0:
					new_credit = 0

				update_credit(auth_key, identificator, str(new_credit))
				return 'Y'
		
		except Exception as e:
			print(f'[Error - product_buy]: {e}')
			pass

	return 'N'

if __name__ == '__main__':
	app.run(host = '0.0.0.0', port = 54777, debug = False)