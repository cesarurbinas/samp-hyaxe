filename = input('Input > ')
with open(filename, 'r') as f:
    list_for_export = [line.strip() for line in f]
    print(f'{len(list_for_export)} items loaded')


f = open('dataset/output.nad', 'w')
for item in list_for_export:
	item = item.lower()

	item = item.replace('**', '')
	item = item.replace('?', '')
	item = item.replace('¿', '')
	item = item.replace('"', '')

	item = item.replace('á', 'a')
	item = item.replace('ó', 'o')
	item = item.replace('í', 'i')
	item = item.replace('é', 'e')
	item = item.replace('ú', 'u')
	item = item.replace(',', '')
	item = item.replace('  ', ' ')

	f.write(f'{item}\n')

