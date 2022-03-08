import csv
import os

file_path = r"C:\Users\fatuarte.feern21\Desktop\2DAM\SGE\Ejercicios\Python\ficheros\contactos.csv"
filename = os.path.basename(file_path).split(".")[0]

querys = []

openFile = open('contactos.csv', 'r')
csvFile = csv.reader(openFile)
header = next(csvFile)
headers = map((lambda x: '`' + x + '`'), header)
insert = 'INSERT INTO ' + filename + ' (' + ", ".join(headers) + ") VALUES "
for row in csvFile:
    values = map((lambda x: '"' + x + '"'), row)
    querys.append(insert + "(" + ", ".join(values) + "); \n")
openFile.close()
with open('contactos.sql', 'w') as file:
    for q in querys:
        file.write(q)
file.close()
print(querys)
