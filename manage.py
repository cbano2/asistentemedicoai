from flask_script import Manager, Server


from app import initialize_app
from config import config

setting = config['development']

app = initialize_app(setting)

manager = Manager(app)
manager.add_command('runserver', Server(host='0.0.0.0', port=5000))

if __name__ == '__main__':
    manager.run()
