from flask import Flask

from .redis_skeleton.views import blueprint as rsbp
from .settings import ConfigType, ConfigFactory
from .extensions import scheduler


def create_app(config_type=ConfigType.DEV) -> Flask:
    app = Flask(__name__)

    config_obj = ConfigFactory.create(config_type)
    app.config.from_object(config_obj)

    register_blueprints(app)
    register_extensions(app)

    return app


def register_blueprints(app: Flask) -> None:
    app.register_blueprint(rsbp)


def register_extensions(app: Flask) -> None:
    scheduler.init_app(app)
    scheduler.start()
