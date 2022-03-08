from io import open

# Ruta donde leeremos el fichero, a indica extensión (puntero al final)
fichero = open('fichero.txt','a')

fichero.write('\nOtra línea más abajo del todo')

fichero.close()