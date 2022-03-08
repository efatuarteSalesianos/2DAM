class Vehiculo:
    def __init__(self, color, ruedas):
        self.color = color
        self.ruedas = ruedas


class Coche(Vehiculo):
    def __init__(self, color, ruedas, velocidad, cilindrada):
        super().__init__(color, ruedas)
        self.velocidad = velocidad
        self.cilindrada = cilindrada


class Bicicleta(Vehiculo):
    def __init__(self, color, ruedas, tipo):
        super().__init__(color, ruedas)
        self.tipo = tipo


class Camioneta(Coche):
    def __init__(self, color, ruedas, velocidad, cilindrada, carga):
        super().__init__(color, ruedas, velocidad, cilindrada)
        self.carga = carga


class Motocicleta(Bicicleta):
    def __init__(self, color, ruedas, tipo, velocidad, cilindrada):
        super().__init__(color, ruedas, tipo)
        self.velocidad = velocidad
        self.cilindrada = cilindrada


def catalogar(lista):
    for vehiculo in lista:
        print(type(vehiculo).__name__, vehiculo.__dict__)


def catalogar2(lista, ruedas):
    contador = 0
    for vehiculo in lista:
        if vehiculo.ruedas == ruedas:
            contador += 1
    print(f"Se han encontrado {contador} vehículos con {ruedas} ruedas")


coche = Coche("negro", 4, 180, 800)
bici = Bicicleta("roja", 2, "deportiva")
camioneta = Camioneta("blanca", 8, 100, 400, 800)
moto = Motocicleta("verde", 2, "urbana", 150, 200)

lista_vehiculos = [coche, bici, camioneta, moto]
catalogar(lista_vehiculos)
catalogar2(lista_vehiculos, 2)
