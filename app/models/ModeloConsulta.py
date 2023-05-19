from .entities.Consulta import Consulta
from .entities.Diagnostico import Diagnostico
from .entities.Paciente import Paciente
from .entities.Triaige import Triaige


diagnostico_1 = Diagnostico(None, None, None, None, None, None)


class ModeloConsulta():

    @classmethod
    def registrar_consulta(cls, db, consulta):
        try:

            cursor = db.connection.cursor()

            # Verificar si el paciente existe en la tabla paciente
            sql_verificar_paciente = "SELECT id FROM paciente WHERE id= %s"
            valores_verificar_paciente = (
                consulta.diagnostico_isbn.paciente_id.id)
            cursor.execute(sql_verificar_paciente, valores_verificar_paciente)
            paciente_existente = cursor.fetchone()
            context = """ You are IA TRIAGE, an automated medical assistance service for the preparation of detailed medical prediagnoses. \
They take into account the First thing you say hello. \
You will consider all the data delimited with <> which are the symptoms, vital signs and characteristics of the subject, this information will be enough to make a pre-diagnosis and you will not ask any more questions.\
Patient data: \
Symptoms: <{0}> \
Vital signs: <{1}> \ 
Tests: <{2}>  
You will perform the following steps: \
1.- You are going to greet and say patient information starting with their name, age, gender, vital signs and relevant information \
2.- Classify the emergency by color and the level of urgency of the pre-diagnosis according to the data delimited by <> \
3.- Determine the 3 pre-diagnoses and put them in order of priority and briefly describe each diagnosis \
4.- Determine possible treatments for each pre-diagnosis of the previous step, in the same order. \
5.- Determine extra tests to verify the possible condition in the same order as the pre-diagnosis \
6.- At the end, he makes a conclusion of the most probable diagnosis explained in detail \

All your output will be written in Spanish. """.format(consulta.diagnostico_isbn.sintomas,
                                                       consulta.diagnostico_isbn.signos_vitales,
                                                       consulta.diagnostico_isbn.examenes_extra)
            triaige = Triaige(context)
            open_ai = triaige.get_completion()
            print(open_ai)
            if not paciente_existente:
                raise Exception(
                    f"El paciente con el id: {consulta.diagnostico_isbn.paciente_id.id} especificado no existe")

            # Insertar datos en la tabla diagnostico
            sql_diagnostico = """
                INSERT INTO diagnostico (openai, signos_vitales, sintomas, examenes_extra, paciente_id, isbn)
                VALUES (%s, %s, %s, %s, %s, %s)
            """
            valores_diagnostico = (
                open_ai,
                consulta.diagnostico_isbn.signos_vitales,
                consulta.diagnostico_isbn.sintomas,
                consulta.diagnostico_isbn.examenes_extra,
                consulta.diagnostico_isbn.paciente_id.id,
                diagnostico_1.isbn_generator()
            )
            cursor.execute(sql_diagnostico, valores_diagnostico)

            # Insertar datos en la tabla consulta
            sql_consulta = """
                INSERT INTO consulta (uuid, diagnostico_isbn, user_id)
                VALUES (UUID(), %s, %s)
            """
            valores_consulta = (
                consulta.diagnostico_isbn.isbn,
                consulta.user_id.id,
            )
            cursor.execute(sql_consulta, valores_consulta)

            db.connection.commit()
            return open_ai
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def listar_consultas_usuario(self, db, usuario):
        try:
            cursor = db.connection.cursor()
            sql = """SELECT CON.fecha, DIG.isbn, DIG.paciente_id,
            PAC.apellidos, PAC.nombres, PAC.fechanacimiento, PAC.genero, PAC.caracteristicas, PAC.cedula
            FROM consulta CON JOIN diagnostico DIG ON CON.diagnostico_isbn = DIG.isbn
            JOIN paciente PAC ON DIG.paciente_id = PAC.id
            WHERE CON.user_id = {0}""".format(usuario.id)
            cursor.execute(sql)
            data = cursor.fetchall()
            consultas = []
            for row in data:
                pac = Paciente(id=row[2], apellidos=row[3], nombres=row[4], fechanacimiento=row[5],
                               genero=row[6], caracteristicas=row[7], cedula=row[8], correo=None)
                dig = Diagnostico(isbn=row[1], paciente_id=pac, openai=None, signos_vitales=None,
                                  sintomas=None, examenes_extra=None)
                con = Consulta(None, dig, usuario, row[0])
                consultas.append(con)
            return consultas
        except Exception as ex:
            print(format(ex))
            raise Exception(ex)
