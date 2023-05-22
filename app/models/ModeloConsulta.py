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
            nombre_paciente = consulta.diagnostico_isbn.paciente_id.nombre_completo()
            edad = consulta.diagnostico_isbn.paciente_id.edad()
            caracteristicas = consulta.diagnostico_isbn.paciente_id.caracteristicas
            print(f"{nombre_paciente}, {edad}")
            context = """ You are IA TRIAGE, an automated medical assistance service for the \preparation of detailed medical pre diagnosis and be detailed with each answer\ you give \
They take into account the First thing you say hello. \
You will consider all the data delimited with <> which are the symptoms, vital signs and characteristics of the subject, this information will be enough to make a pre-diagnosis and you will not ask any more questions.\
Patient data: \
Patient Name: <{0}> \
Age: <{1}>  
Characteristics: <{2}> \
Symptoms: <{3}> \
Vital signs: <{4}> \
Tests: <{5}>  
You will perform the following steps: \
1.- <Greetings> : You are going to greet and say patient information starting with their name, age, gender, vital signs and relevant information \
2.- <Emergency_Color>: The hexadecimal color of the emergency color according to the 5 triage classification levels using the data delimited by <>. \
3.- <Emergency>: The level of urgency of the patient to be treated will be based on the 5 levels of triage classification using the data delimited by <> accompanied by a short description of the level of urgency \
3.- <Diagnoses_1>: Make a diagnosis 1 taking into account the information delimited by <> this being the most probable diagnosis. \ 
4.- <Description_1>: describe the <Diagnoses_1> in detail.  
5.- <Diagnoses_2>: Make a diagnosis 2 taking into account the information 
delimited by <> and describe the diagnosis in detail. \
6.- <Description_1>: describe the <Diagnoses_2> in detail.  
7.- <Diagnoses_3>: Make a diagnosis 3 taking into account the information delimited by <> and describe the diagnosis in detail. \
8.- <Description_1>: describe the <Diagnoses_3> in detail.  
9.- <Test_1>: Determine extra test to verify the possible condition in the same order as the <Diagnoses_1> \  
10.- <Test_2>: Determine extra test to verify the possible condition in the same order as the <Diagnoses_2>\
11.-<Test_3>: Determine extra test to verify the possible condition in the same order as the <Diagnoses_3>\
12.- <Treatment_1> : Determine possible treatments for <Diagnoses_1> of the previous step and and give\  
13.- <Treatment_2> : Determine possible treatments for <Diagnoses_2> of the previous step\
14.- <Treatment_3> : Determine possible treatments for <Diagnoses_3> of the previous step \
15.- <Conclusion>:  At the end, he makes a conclusion of the most probable diagnosis explained in detail 
16.- All text generated in Spanish
17.- Your entire response is delivered in a single JSON with the following tags: <json with tags <Greetings>,<Emergency_Color>, <Emergency>, <Diagnoses_ 1>, <Diagnoses_2>, <Diagnoses_3>, <Description_1>, <Description_2>, <Description_3>,
<Test_1>, <Test_2>, <Test_3>, <Treatment_1>, <Treatment_2>, <Treatment_3>, <Conclusion> > \
 """.format(nombre_paciente, edad, caracteristicas,
                consulta.diagnostico_isbn.sintomas,
                consulta.diagnostico_isbn.signos_vitales,
                consulta.diagnostico_isbn.examenes_extra)
            triaige = Triaige(context)
            open_ai = triaige.get_completion()  # API bloqueada

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
                consulta.diagnostico_isbn.isbn
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
            PAC.apellidos, PAC.nombres, PAC.fechanacimiento, PAC.genero, PAC.caracteristicas, PAC.cedula, DIG.openai
            FROM consulta CON JOIN diagnostico DIG ON CON.diagnostico_isbn = DIG.isbn
            JOIN paciente PAC ON DIG.paciente_id = PAC.id
            WHERE CON.user_id = {0}""".format(usuario.id)
            cursor.execute(sql)
            data = cursor.fetchall()
            consultas = []
            for row in data:
                pac = Paciente(id=row[2], apellidos=row[3], nombres=row[4], fechanacimiento=row[5],
                               genero=row[6], caracteristicas=row[7], cedula=row[8], correo=None)
                dig = Diagnostico(isbn=row[1], paciente_id=pac, openai=row[9], signos_vitales=None,
                                  sintomas=None, examenes_extra=None)
                con = Consulta(None, dig, usuario, row[0])
                consultas.append(con)
            return consultas
        except Exception as ex:
            print(format(ex))
            raise Exception(ex)
