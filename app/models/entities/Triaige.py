import openai
openai.api_key = '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'


class Triaige():
    def __init__(self, context):
        self.context = context
        self.openai = ""
        self.signos_vitales = ""
        self.sintomas = ""
        self.temperature = 0
        self.model = "gpt-3.5-turbo"
        self.messages = []

    def datos_completos(self):
        data = {
            'usuario': self.nombre_usuario,
            'paciente': self.nombre_paciente,
            'edad_pactiente': self.edad_paciente,
            'caracteristicas': self.caracteristicas,
            'genero': self.genero,
            'identificacion': self.cedula,
            'signos_vitales': self.signos_vitales,
            'sintomas': self.sintomas
        }
        return data

    def get_completion(self):
        self.messages = [{
            'role': "system",
            'content': 'top notch medical assistant, friendly'
        },
            {
            'role': 'user',
            'content': self.context
        }]
        response = openai.ChatCompletion.create(
            model=self.model,
            messages=self.messages,
            temperature=self.temperature
        )
        return response.choices[0].message["content"]
