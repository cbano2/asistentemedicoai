class Config:
    SECRET_KEY = '##89YDGh30e&*0+'
    KEY_OPENAI = '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'


class DevelopmentConfig(Config):
    DEBUG = True
    MYSQL_HOST = 'sql10.freemysqlhosting.net'
    MYSQL_USER = 'sql10619479'
    MYSQL_PASSWORD = 'H2JUTBYIwP'
    MYSQL_DB = 'sql10619479'


config = {
    'development': DevelopmentConfig,
    'default': DevelopmentConfig
}
