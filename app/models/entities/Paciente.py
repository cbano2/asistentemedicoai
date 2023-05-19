from datetime import datetime


class Paciente():

    def __init__(self, id, apellidos, nombres, genero, cedula, correo, caracteristicas, fechanacimiento=None):
        self.id = id
        self.apellidos = apellidos
        self.nombres = nombres
        self.fechanacimiento = fechanacimiento
        self.genero = genero
        self.cedula = cedula
        self.correo = correo
        self.caracteristicas = caracteristicas

    def nombre_completo(self):
        return "{0}, {1}".format(self.apellidos, self.nombres)
