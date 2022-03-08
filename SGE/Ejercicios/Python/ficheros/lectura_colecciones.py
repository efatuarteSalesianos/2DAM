# Lectura en modo binario
import pickle

fichero = open('lista.pckl','rb')

# Cargamos los datos del fichero
lista_fichero = pickle.load(fichero)
print(lista_fichero)

fichero.close()