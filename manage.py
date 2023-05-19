import os
from flask_script import Manager, Server
from app import initialize_app
from config import config

setting = config['development']

app = initialize_app(setting)

manager = Manager(app)
manager.add_command('runserver', Server(host='0.0.0.0'))

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    manager.run(host='0.0.0.0', port=port)
