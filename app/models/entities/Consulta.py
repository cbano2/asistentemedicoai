import datetime


class Consulta():
    def __init__(self, uuid, diagnostico_isbn, user_id, fecha=None):
        self.uuid = uuid
        self.diagnostico_isbn = diagnostico_isbn
        self.user_id = user_id
        self.fecha = fecha

    def formatted_date(self):
        return datetime.datetime.strftime(self.fecha, '%d/%m/%Y - %H:%M:%S')
