from flask import Flask


def create_app(config) -> Flask:
    app = Flask(__name__.split('.')[0])

    app.config.from_object(config)

    return app
