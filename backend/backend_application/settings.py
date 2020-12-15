from enum import Enum


class ConfigType(Enum):
    PROD = 'prod'
    DEV = 'dev'
    TEST = 'test'


class Config:
    def __init__(self, env_type=None):
        self.DEBUG = None
        self.ENV = env_type


class ConfigFactory:
    @staticmethod
    def create(config: ConfigType):
        config_object = Config(config.value)

        config_object.DEBUG = True

        return config_object
