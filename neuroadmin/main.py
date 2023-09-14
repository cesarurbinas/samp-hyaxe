print('[main.debug] Initializing...')

import json
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
		
		final_data['message'] = final_data['message'].lower()

		final_data['message'] = final_data['message'].replace('**', '')
		final_data['message'] = final_data['message'].replace('?', '')
		final_data['message'] = final_data['message'].replace('¿', '')
		final_data['message'] = final_data['message'].replace('"', '')

		final_data['message'] = final_data['message'].replace('á', 'a')
		final_data['message'] = final_data['message'].replace('ó', 'o')
		final_data['message'] = final_data['message'].replace('í', 'i')
		final_data['message'] = final_data['message'].replace('é', 'e')
		final_data['message'] = final_data['message'].replace('ú', 'u')
		final_data['message'] = final_data['message'].replace(',', '')
		final_data['message'] = final_data['message'].replace('  ', ' ')
		
		if final_data['message'] in bad_use.positive_msg:
			print(f'[bad_use.debug] { final_data["message"] }')
			return 'Y'

		words = final_data['message'].split(' ')
		for word in words:
			if word in bad_use.ban_msg:
				print(f'[bad_use.debug] { final_data["message"] } (keyword: {word})')
				return 'Y'
		
		#for keyword in bad_use.ban_msg:
		#	search = final_data['message'].find(keyword)
		#	
		#	if search != -1:
		#		print(f'[bad_use.debug] { final_data["message"] } (keyword: {keyword}, found: {search})')
		#		return 'Y'

		#if bad_use.is_message_bad_use( final_data['message'] ):
		#	return 'Y'

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

		final_data['question'] = final_data['question'].lower()
		final_data['question'] = final_data['question'].replace('**', '')
		final_data['question'] = final_data['question'].replace('?', '')
		final_data['question'] = final_data['question'].replace('¿', '')
		final_data['question'] = final_data['question'].replace('"', '')
		final_data['question'] = final_data['question'].replace('á', 'a')
		final_data['question'] = final_data['question'].replace('ó', 'o')
		final_data['question'] = final_data['question'].replace('í', 'i')
		final_data['question'] = final_data['question'].replace('é', 'e')
		final_data['question'] = final_data['question'].replace('ú', 'u')
		final_data['question'] = final_data['question'].replace(',', '')
		final_data['question'] = final_data['question'].replace('  ', ' ')

		final_data['answer'] = final_data['answer'].lower()
		final_data['answer'] = final_data['answer'].replace('**', '')
		final_data['answer'] = final_data['answer'].replace('?', '')
		final_data['answer'] = final_data['answer'].replace('¿', '')
		final_data['answer'] = final_data['answer'].replace('"', '')
		final_data['answer'] = final_data['answer'].replace('á', 'a')
		final_data['answer'] = final_data['answer'].replace('ó', 'o')
		final_data['answer'] = final_data['answer'].replace('í', 'i')
		final_data['answer'] = final_data['answer'].replace('é', 'e')
		final_data['answer'] = final_data['answer'].replace('ú', 'u')
		final_data['answer'] = final_data['answer'].replace(',', '')
		final_data['answer'] = final_data['answer'].replace('  ', ' ')

		f = open('dataset/learning/questions.lrn', 'a')
		f.write(f'{final_data}\n')
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

		final_data = final_data.lower()

		final_data = final_data.replace('**', '')
		final_data = final_data.replace('?', '')
		final_data = final_data.replace('¿', '')
		final_data = final_data.replace('"', '')

		final_data = final_data.replace('á', 'a')
		final_data = final_data.replace('ó', 'o')
		final_data = final_data.replace('í', 'i')
		final_data = final_data.replace('é', 'e')
		final_data = final_data.replace('ú', 'u')
		final_data = final_data.replace(',', '')
		final_data = final_data.replace('  ', ' ')

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