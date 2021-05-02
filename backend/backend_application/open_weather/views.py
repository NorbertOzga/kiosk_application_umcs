from flask import Blueprint

from ..extensions import cache

import json

blueprint = Blueprint("open_weather", __name__, url_prefix="/open-weather")


@blueprint.route("/get-current", methods=["GET"])
def get_current():
    data = cache.get("current")
    return json.dumps(data.decode()).replace("'", '"')[1:-1]


@blueprint.route("/get-forecast", methods=["GET"])
def get_forecast():
    data = cache.get("forecast")
    return json.dumps(data.decode()).replace("'", '"')[1:-1]


@blueprint.route("/get-long-forecast", methods=["GET"])
def get_long_forecast():
    data = cache.get("forecast_long")
    return json.dumps(data.decode()).replace("'", '"')[1:-1]
