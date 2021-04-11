from flask import Flask

from .open_weather.views import blueprint as owbp
from .instagram_post.views import blueprint as ipbp
from .settings import ConfigType, ConfigFactory
from .extensions import scheduler
from . import tasks

def create_app(config_type=ConfigType.DEV) -> Flask:
    app = Flask(__name__)
    
    config_obj = ConfigFactory.create(config_type)
    app.config.from_object(config_obj)

    register_blueprints(app)
    register_extensions(app)
    return app


def register_blueprints(app: Flask) -> None:
    app.register_blueprint(owbp)
    app.register_blueprint(ipbp)


def register_extensions(app: Flask) -> None:
    scheduler.init_app(app)
    scheduler.start()

