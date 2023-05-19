import random


class Diagnostico():

    def __init__(self, isbn, paciente_id, openai, signos_vitales, sintomas, examenes_extra):
        self.isbn = isbn
        self.paciente_id = paciente_id
        self.openai = openai
        self.signos_vitales = signos_vitales
        self.sintomas = sintomas
        self.examenes_extra = examenes_extra
        self.consultas_realizadas = 0
# Este método se va a usar para generar isbn para los nuevos paciente ingresados

    def isbn_generator(self):
        isbn_random = ""
        numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
        for j in range(1, 13):
            isbn_random += random.choice(numbers)
        return isbn_random
