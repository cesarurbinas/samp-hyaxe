def clean_text(text):
	text = text.lower()

	text = text.replace('**', '')
	text = text.replace('?', '')
	text = text.replace('¿', '')
	text = text.replace('"', '')

	text = text.replace('á', 'a')
	text = text.replace('ó', 'o')
	text = text.replace('í', 'i')
	text = text.replace('é', 'e')
	text = text.replace('ú', 'u')
	text = text.replace(',', '')
	text = text.replace('  ', ' ')
	return text