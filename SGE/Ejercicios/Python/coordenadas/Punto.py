class Punto:

    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

    def __str__(self):
        coordenada = "(" + str(self.x) + "," + str(self.y) + ")"
        return coordenada

    def cuadrante(self):
        if (self.x > 0) and (self.y > 0):
            return 1
        elif (self.x > 0) and (self.y < 0):
            return 2
        elif (self.x < 0) and (self.y < 0):
            return 3
        elif (self.x < 0) and (self.y > 0):
            return 4
        else:
            return 0

    def vector(self, punto):
        vector = Punto()
        vector.x = punto.x - self.x
        vector.y = punto.y - self.y
        return vector
