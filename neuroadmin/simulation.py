import requests
print('[Dudas] Simulacion iniciada')
while True:
	message = input('[Dudas] Input > ')
	print(f'[Dudas] Jugador Yahir_Kozel [23]: (( {message} ))')

	try:
		response = requests.post('http://127.0.0.1:6666/get_response', '{"author": "Yahir_Kozel", "playerid": 23, "question": "' + message + '"}').text
		print(f'[Dudas] Jugador Pepito_Pepe [23]: (( @23 {response} ))')

	except Exception as e:
		try:
			response = requests.post('http://127.0.0.1:6666/check_bad_use', '{"author": "Yahir_Kozel", "playerid": 23, "message": "' + message + '"}').text
			if response == 'Y':
				print(f'[Dudas] Posible mal uso de Yahir_Kozel [23]')

		except Exception as e:
			pass