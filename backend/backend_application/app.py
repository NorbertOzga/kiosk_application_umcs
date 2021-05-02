import logging

from flask import Flask

from .open_weather.views import blueprint as owbp
from .instagram_post.views import blueprint as ipbp
from .events.views import blueprint as esbp
from .settings import ConfigType, ConfigFactory
from .extensions import scheduler


def create_app(config_type=ConfigType.DEV) -> Flask:
    app = Flask(__name__)
    
    config_obj = ConfigFactory.create(config_type)
    app.config.from_object(config_obj)

    register_blueprints(app)
    register_extensions(app)

    logging.basicConfig(
        filename='/app/backend_application/logfile.log'
    )

    return app


def register_blueprints(app: Flask) -> None:
    app.register_blueprint(owbp)
    app.register_blueprint(ipbp)
    app.register_blueprint(esbp)


def register_extensions(app: Flask) -> None:
    scheduler.init_app(app)

    scheduler.start()

