from flask import Flask

from .settings import ConfigType, ConfigFactory
from .extensions import cache


def create_app(config_type=ConfigType.DEV) -> Flask:
    app = Flask(__name__)

    config_obj = ConfigFactory.create(config_type)
    app.config.from_object(config_obj)

    return app


def register_extensions(app: Flask) -> None:
    cache.init_app(app)