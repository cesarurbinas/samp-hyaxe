import utils

filename = input('Input > ')
with open(filename, 'r') as f:
    list_for_export = [line.strip() for line in f]
    print(f'{len(list_for_export)} items loaded')

f = open('dataset/output.nad', 'w')
for item in list_for_export:
	item = utils.clean_text(item)

	f.write(f'{item}\n')

