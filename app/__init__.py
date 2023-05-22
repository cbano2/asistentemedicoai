from flask import Flask, g, render_template, request, url_for, redirect, flash, jsonify
from flask_mysqldb import MySQL
from .models.ModeloDiagnostico import ModeloDiagnostico
from .models.ModeloUsuario import ModeloUsuario
from .models.entities.Usuario import Usuario
from .models.entities.Diagnostico import Diagnostico
from .models.entities.Consulta import Consulta
from .models.ModeloConsulta import ModeloConsulta
from .models.ModeloPaciente import ModeloPaciente
from flask_login import LoginManager, login_user, logout_user, login_required, current_user
from .consts import *
import json
from .models.entities.Paciente import Paciente
from .models.entities.Triaige import Triaige
from datetime import datetime
from dateutil.relativedelta import relativedelta

app = Flask(__name__)

db = MySQL(app)
login_manager_app = LoginManager(app)


@login_manager_app.user_loader
def load_user(id):
    return ModeloUsuario.obtener_id(db, id)


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        usuario = Usuario(
            None, request.form['user'], request.form['password'], None)
        usuario_logeado = ModeloUsuario.login(db, usuario)
        if usuario_logeado != None:
            login_user(usuario_logeado)
            flash(MENSAJE_BIENVENIDA, 'success')
            return redirect(url_for('index'))
        else:
            flash(LOGIN_CREDENCIALESINVALIDAS, 'warning')
            return render_template('auth/login.html')
    else:
        return render_template('auth/login.html')


@app.route('/logout')
def logout():
    logout_user()
    flash(LOGOUT, 'success')
    return redirect(url_for('login'))


@app.route('/')
@login_required
def index():
    if current_user.is_authenticated:
        if current_user.tipousuario.id == 1:
            try:
                diagnosticos_realizados = ModeloDiagnostico.listar_diagnosticos_realizados(
                    db)
                data = {
                    'titulo': 'Diagnósticos realizados',
                    'diagnosticos_realizados': diagnosticos_realizados
                }
                return render_template('index.html', data=data)
            except Exception as ex:
                print(format(ex))
                return render_template('bugs/error.html', mensaje=format(ex))
        else:
            try:
                consultas = ModeloConsulta.listar_consultas_usuario(
                    db, current_user)
                data = {
                    'titulo': 'Mis diagnósticos',
                    'consultas': consultas
                }
                return render_template('index.html', data=data)
            except Exception as ex:
                return render_template('bugs/error.html', mensaje=format(ex))
    else:
        return redirect(url_for('login'))


@app.route('/obtener_informacion_paciente')
def obtener_informacion_paciente():
    isbn = request.args.get('isbn')
    paciente = ModeloPaciente.obtener_paciente(db, isbn.paciente_id.id)
    paciente = {
        'nombre_completo': paciente.nombre_completo(),
        'cedula': paciente.cedula,
        'genero': paciente.genero,
        'edad': paciente.edad(),
    }

    # Devuelve los datos del paciente en formato JSON
    return jsonify({'success': True, 'paciente': paciente})


@app.route('/diagnosticos')
@login_required
def diagnostico():
    try:
        diagnosticos = ModeloDiagnostico.listar_diagnosticos(db)
        pacientes = ModeloPaciente.listar_pacientes(db)
        pacientes[0].edad()
        data = {
            'titulo': 'Listado de pacientes',
            'diagnosticos': diagnosticos,
            'pacientes': pacientes,
            'triaige': None
        }
        return render_template('diagnosticos.html', data=data)
    except Exception as ex:
        print(format(ex))
        return render_template('bugs/error.html', mensaje=format(ex))


@app.route('/consultarPaciente', methods=['POST'])
@login_required
def consultar_paciente():
    data_request = request.get_json()
    data_paciente = ModeloPaciente().obtener_paciente(
        db, data_request['paciente_id'])
    data = {}
    try:
        paciente_id = Paciente(id=data_request['paciente_id'], apellidos=data_paciente.apellidos, nombres=data_paciente.nombres, caracteristicas=data_paciente.caracteristicas,
                               correo=data_paciente.correo, cedula=data_paciente.cedula, fechanacimiento=data_paciente.fechanacimiento, genero=data_paciente.genero)
        diagnostico = Diagnostico(isbn=None, paciente_id=paciente_id, signos_vitales=data_request['signos_vitales'],
                                  sintomas=data_request['sintomas'], examenes_extra=data_request['examenes_extra'], openai=None)
        consulta = Consulta(uuid=None, user_id=current_user,
                            diagnostico_isbn=diagnostico)
        open_ai_response = ModeloConsulta.registrar_consulta(db, consulta)
        data['exito'] = True
        data['openai_response'] = open_ai_response
        data['triaige'] = json.loads(open_ai_response)
    except Exception as ex:
        data['mensaje'] = str(ex)
        data['exito'] = False
    return jsonify(data)


@app.route('/consultarTriaige', methods=['POST'])
@login_required
def consultar_ia():
    try:
        consultas = ModeloConsulta.listar_consultas_usuario(
            db, current_user)
        factual = datetime.now()
        context = "Eres el mejor asistente médico, te llamas TriaIAge y solo te vas a limitar a responder sobre asuntos médicos  y tienes toda esta información:\ "
        for i in consultas:
            if float(relativedelta(factual, i.fecha).seconds) < 120:
                context += i.diagnostico_isbn.openai
                break
        triaige = Triaige(context)
        if request.method == 'POST':
            prompt = request.form['prompt']
            answer = triaige.get_completion_2(prompt)
            res = {}
            res['answer'] = answer
            return jsonify(res), 200
    except Exception as ex:
        res['mensaje'] = str(ex)
        print(res['mensaje'])
        res['exito'] = False
    return jsonify(res)


def page_not_found(error):
    return render_template('bugs/404.html'), 404


def pagina_no_autorizada(error):
    return redirect(url_for('login'))


def initialize_app(config):
    app.config.from_object(config)
    app.register_error_handler(401, pagina_no_autorizada)
    app.register_error_handler(404, page_not_found)
    return app
