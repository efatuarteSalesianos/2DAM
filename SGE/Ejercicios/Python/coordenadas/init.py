from coordenadas.Punto import Punto

a = Punto(1, 3)
b = Punto(4, 2)

print("El punto está en el cuadrante " + str(a.cuadrante()))
print(a.vector(b))