print('[main.debug] Initializing...')

import json
import utils
import bad_use
import response
from flask import Flask, request, jsonify

app = Flask(__name__)

# Get output
@app.route('/get_response', methods = ['GET', 'POST'])
def get_response():
	try:
		if not request.data:
			request_data = request.form.to_dict()
			for item in request_data:
				final_data = item
				break

		else:
			final_data = request.data.decode('latin1')

		final_data = json.loads(final_data)
		answer = response.get_response_for_question( final_data['question'] )
		
		if answer == None:
			return 'INTERNAL_SERVER_ERROR', 1

		if len(answer) > 263:
			return 'INTERNAL_SERVER_ERROR', 1
			
		return answer

	except Exception as e:
		print(f'[api.error] Internal error (get_response): {e}')
		return 'INTERNAL_SERVER_ERROR', 1

	return 'RESPOSE_NOT_FOUND', 1

@app.route('/check_bad_use', methods = ['GET', 'POST'])
def check_bad_use():
	try:
		if not request.data:
			request_data = request.form.to_dict()
			for item in request_data:
				final_data = item
				break

		else:
			final_data = request.data.decode('latin1')

		final_data = json.loads(final_data)
		
		final_data['message'] = clean_text(final_data['message'])
		
		if final_data['message'] in bad_use.positive_msg:
			print(f'[bad_use.debug] { final_data["message"] }')
			return 'Y'

		words = final_data['message'].split(' ')
		for word in words:
			if word in bad_use.ban_msg:
				print(f'[bad_use.debug] { final_data["message"] } (keyword: {word})')
				return 'Y'

		return 'N'

	except Exception as e:
		raise
		print(f'[api.error] Internal error (check_bad_use): {e}')
		return 'INTERNAL_SERVER_ERROR', 1

	return 'RESPOSE_NOT_FOUND', 1

# Learning
@app.route('/save_response', methods = ['GET', 'POST'])
def save_response():
	try:
		if not request.data:
			request_data = request.form.to_dict()
			for item in request_data:
				final_data = item
				break

		else:
			final_data = request.data.decode('latin1')

		final_data = json.loads(final_data)

		final_data['question'] = utils.clean_text(final_data['question'])
		final_data['answer'] = utils.clean_text(final_data['answer'])

		f = open('dataset/learning/questions.lrn', 'a')
		
		f.write( f'{final_data}\n'.replace("'", '"').replace('}', '},') )
		f.close()
		return 'Y'

	except Exception as e:
		print(f'[api.error] Internal error (save_response): {e}')
		return 'INTERNAL_SERVER_ERROR', 1

	return 'RESPOSE_NOT_FOUND', 1

@app.route('/save_bad_use', methods = ['GET', 'POST'])
def save_bad_use():
	try:
		if not request.data:
			request_data = request.form.to_dict()
			for item in request_data:
				final_data = item
				break

		else:
			final_data = request.data.decode('latin1')

		final_data = utils.clean_text(final_data)

		f = open('dataset/learning/positive.lrn', 'a')
		f.write(f'{final_data}\n')
		f.close()
		return 'Y'

	except Exception as e:
		print(f'[api.error] Internal error (save_bad_use): {e}')
		return 'INTERNAL_SERVER_ERROR', 1

	return 'RESPOSE_NOT_FOUND', 1


# Intialize Flask App
if __name__ == '__main__':
	print('[api.debug] Initializing API:')
	app.run(host = '0.0.0.0', port = 6666, debug = True)