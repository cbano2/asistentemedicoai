from datetime import datetime
from dateutil.relativedelta import relativedelta


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

    def edad(self):
        factual = datetime.now()
        edad = relativedelta(factual, self.fechanacimiento)
        return edad.years
# fecha_nacimiento = datetime.strptime("15/4/1988", "%d/%m/%Y")
# print(f"{edad.years} años, {edad.months} meses y {edad.days} días")
