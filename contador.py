import os

path = input("dir > ")
total_lines = 0

for root, dirs, files in os.walk(path):
	for dir in dirs:
		for file in files:
			if '.pwn' in file:
				f = open(path + "\\" + file, "r", errors = "ignore")
				file_lines = [line.strip() for line in f]
				total_lines += len(file_lines)
				
print("Lines: " + str(total_lines))