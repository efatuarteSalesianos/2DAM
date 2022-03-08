fd = open('contactos.sql', 'r')
sqlFile = fd.read()
fd.close()

querys = sqlFile.split(';')

#for q in querys: