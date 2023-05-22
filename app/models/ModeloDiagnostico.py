from .entities.Paciente import Paciente
from .entities.Diagnostico import Diagnostico
from .entities.Consulta import Consulta


class ModeloDiagnostico():
    @classmethod
    def listar_diagnosticos(self, db):
        try:
            cursor = db.connection.cursor()
            sql = """SELECT DIAG.isbn, DIAG.signos_vitales, DIAG.sintomas,
            DIAG.openai, DIAG.examenes_extra, PAC.apellidos, PAC.nombres,
            PAC.genero, PAC.cedula, PAC.correo, PAC.caracteristicas, PAC.id
            FROM diagnostico DIAG JOIN paciente PAC ON DIAG.paciente_id = PAC.id"""
            cursor.execute(sql)
            data = cursor.fetchall()
            diagnosticos = []
            for row in data:
                pac = Paciente(row[11], row[5], row[6], row[7],
                               row[8], row[9], row[10])
                diag = Diagnostico(isbn=row[0], signos_vitales=row[1],
                                   sintomas=row[2], paciente_id=pac,
                                   openai=row[3], examenes_extra=row[4])
                diagnosticos.append(diag)
            return diagnosticos

        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def listar_diagnosticos_realizados(self, db):
        try:
            cursor = db.connection.cursor()
            sql = """SELECT CON.diagnostico_isbn, DIG.paciente_id, CON.fecha, 
            PAC.apellidos, PAC.nombres, PAC.fechanacimiento, PAC.genero, PAC.caracteristicas, PAC.cedula, DIG.openai,
            COUNT(CON.diagnostico_isbn) AS Consultas_Realizadas
            FROM consulta CON JOIN diagnostico DIG ON CON.diagnostico_isbn = DIG.isbn
            JOIN paciente PAC ON DIG.paciente_id = PAC.id
            GROUP BY CON.diagnostico_isbn ORDER BY 2 ASC"""
            cursor.execute(sql)
            data = cursor.fetchall()
            diagnosticos = []
            for row in data:
                pac = Paciente(id=row[1], apellidos=row[3], nombres=row[4], fechanacimiento=row[5],
                               genero=row[6], caracteristicas=row[7], cedula=row[8], correo=None)
                diag = Diagnostico(isbn=row[0], signos_vitales=None,
                                   sintomas=None, paciente_id=pac,
                                   openai=row[9], examenes_extra=None)
                con = Consulta(uuid=None,
                               fecha=row[2], diagnostico_isbn=diag, user_id=None)
                diag.consultas_realizadas = int(row[10])
                diagnosticos.append(con)
            return diagnosticos

        except Exception as ex:
            print(format(ex))
            raise Exception(ex)
# Insertar los datos obtenidos de diagnosticos:
