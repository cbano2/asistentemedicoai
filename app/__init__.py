from flask import Flask, render_template, request, url_for, redirect, flash, jsonify
from flask_mysqldb import MySQL
from .models.ModeloDiagnostico import ModeloDiagnostico
from .models.ModeloUsuario import ModeloUsuario
from .models.entities.Usuario import Usuario
from .models.entities.Diagnostico import Diagnostico
from .models.entities.Consulta import Consulta
from .models.ModeloConsulta import ModeloConsulta
from flask_login import LoginManager, login_user, logout_user, login_required, current_user
from .consts import *

from .models.entities.Paciente import Paciente

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


@app.route('/diagnosticos')
@login_required
def diagnostico():
    try:
        diagnosticos = ModeloDiagnostico.listar_diagnosticos(db)
        data = {
            'titulo': 'Listado de pacientes',
            'diagnosticos': diagnosticos
        }
        return render_template('diagnosticos.html', data=data)
    except Exception as ex:
        return render_template('bugs/error.html', mensaje=format(ex))


@app.route('/consultarPaciente', methods=['POST'])
@login_required
def consultar_paciente():
    data_request = request.get_json()
    data = {}
    try:
        paciente_id = Paciente(id=data_request['paciente_id'], apellidos=None, nombres=None, caracteristicas=None,
                               correo=None, cedula=None, fechanacimiento=None, genero=None)
        diagnostico = Diagnostico(isbn=data_request['isbn'], paciente_id=paciente_id, signos_vitales=data_request['signos_vitales'],
                                  sintomas=data_request['sintomas'], examenes_extra=data_request['examenes_extra'], openai=None)
        consulta = Consulta(uuid=None, user_id=current_user,
                            diagnostico_isbn=diagnostico)
        open_ai_response = ModeloConsulta.registrar_consulta(db, consulta)
        data['exito'] = True
        data['openai_response'] = open_ai_response
    except Exception as ex:
        data['mensaje'] = str(ex)
        data['exito'] = False
    return jsonify(data)


def page_not_found(error):
    return render_template('bugs/404.html'), 404


def pagina_no_autorizada(error):
    return redirect(url_for('login'))


def initialize_app(config):
    app.config.from_object(config)
    app.register_error_handler(401, pagina_no_autorizada)
    app.register_error_handler(404, page_not_found)
    return app
