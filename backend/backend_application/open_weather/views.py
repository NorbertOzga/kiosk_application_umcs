from flask import Blueprint

from ..extensions import cache
from . import daemon as dow

blueprint = Blueprint("open_weather", __name__, url_prefix="/open-weather")


@blueprint.route("/get-current", methods=["GET"])
def get_current():
    # open_weather = dow.OpenWeather()
    # open_weather.cache_current()

    return cache.get("current").decode()


@blueprint.route("/get-forecast", methods=["GET"])
def get_forecast():
    return cache.get("forecast").decode()

@blueprint.route("/get-long-forecast", methods=["GET"])
def get_long_forecast():
    return cache.get("forecast_long").decode()

