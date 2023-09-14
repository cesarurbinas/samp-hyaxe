import os
import os.path

valid_string = [
	'SendClientMessage',
	'ShowPlayerDialog',
	'PlayerTextDraw',
	'SendResponsiveMessage'
]

for dirpath, dirnames, filenames in os.walk("./gamemodes"):
	for filename in [f for f in filenames if f.endswith(".pwn")]:
		with open( os.path.join(dirpath, filename) , 'r') as fi:
			pawnoo = [line.strip() for line in fi]
			for line in pawnoo:
				if 'COLOR_WHITE' in line:
					wawa = True
					for x in valid_string:
						if x in line:
							wawa = False
							break
					
					if wawa:
						print(line)
						print(os.path.join(dirpath, filename))
						print('\n')