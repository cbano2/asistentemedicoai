from .entities.Paciente import Paciente
from .entities.Diagnostico import Diagnostico
from .entities.Consulta import Consulta


class ModeloPaciente():
    @classmethod
    def listar_pacientes(self, db):
        try:
            cursor = db.connection.cursor()
            sql = """SELECT id, apellidos, nombres, fechanacimiento, genero, cedula, correo, caracteristicas
            FROM paciente"""
            cursor.execute(sql)
            data = cursor.fetchall()
            pacientes = []
            for row in data:
                pac = Paciente(id=row[0], apellidos=row[1], nombres=row[2],
                               fechanacimiento=row[3], genero=row[4], cedula=row[5],
                               correo=row[6], caracteristicas=row[7])
                pacientes.append(pac)
            return pacientes

        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def obtener_paciente(self, db, paciente_id):
        try:
            cursor = db.connection.cursor()
            sql = """SELECT id, apellidos, nombres, fechanacimiento, genero, cedula, correo, caracteristicas 
            FROM paciente WHERE id=%s"""
            cursor.execute(sql, paciente_id)
            data = cursor.fetchall()
            paciente = None
            for row in data:
                paciente = Paciente(id=row[0], apellidos=row[1], nombres=row[2],
                                    fechanacimiento=row[3], genero=row[4], cedula=row[5],
                                    correo=row[6], caracteristicas=row[7])
            return paciente

        except Exception as ex:
            raise Exception(ex)
