import openai
openai.api_key = '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'


class Triaige():
    def __init__(self, context):
        self.context = context
        self.triaige = ""
        self.signos_vitales = ""
        self.sintomas = ""
        self.temperature = 0
        self.model = "gpt-3.5-turbo"
        self.messages = []

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

    def get_completion_2(self, prompt):
        self.messages.append({
            'role': "system",
            'content': 'top notch medical assistant, friendly'
        })
        self.messages.append({
            'role': 'user',
            'content': self.context
        })
        self.messages.append({
            'role': 'user',
            'content': prompt
        })
        question = {}
        question['role'] = 'user'
        question['content'] = prompt
        self.messages.append(question)
        response = openai.ChatCompletion.create(
            model=self.model,
            messages=self.messages,
            temperature=self.temperature
        )
        try:
            answer = response.choices[0].message["content"].replace(
                '\n', '<br>')
        except:
            answer = 'Upss, estoy teniendo problemas. Intenta con otra pregunta, si el problema persiste, llama al administrador'
        return answer
