from flask import Flask, request, jsonify

app = Flask(__name__)

# Error
@app.errorhandler(404)
def page_not_found(e):
	return 'account_server'

@app.errorhandler(500)
def internal_error(e):
	return 'account_server'

# Account
@app.route('/account', methods = ['GET', 'POST'])
def account():
	print(request.form.to_dict())

	return 'account_server'

# Intialize Flask App
if __name__ == '__main__':
	app.run(host = '0.0.0.0', port = 10000, debug = False)