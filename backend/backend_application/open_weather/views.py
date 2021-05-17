import datetime

from flask import Blueprint

from . import daemon
from ..extensions import cache

import json

blueprint = Blueprint("open_weather", __name__, url_prefix="/open_weather")


def check_cache_current(func):
    def wrapper_current():
        last_weather_current = cache.get("last_weather_current")
        if (
                not last_weather_current
                or datetime.datetime.now()
                - datetime.datetime.strptime(
            last_weather_current.decode(), "%Y-%m-%d %H:%M:%S"
        ) > datetime.timedelta(seconds=5)  # time to adjust
        ):
            open_weather = daemon.OpenWeather()
            open_weather.cache_current()
            cache.set(
                "last_weather_current",
                datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            )

        return func()

    return wrapper_current


def check_cache_forecast(func):
    def wrapper_forecast():
        last_weather_forecast = cache.get("last_weather_forecast")
        if (
                not last_weather_forecast
                or datetime.datetime.now()
                - datetime.datetime.strptime(
            last_weather_forecast.decode(), "%Y-%m-%d %H:%M:%S"
        ) > datetime.timedelta(hours=3)  # time to adjust
        ):
            open_weather = daemon.OpenWeather()
            open_weather.cache_forecast()
            cache.set(
                "last_weather_forecast",
                datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            )

        return func()

    return wrapper_forecast


def check_cache_long_forecast(func):
    def wrapper_long_forecast():
        last_weather_long_forecast = cache.get("last_weather_long_forecast")
        if (
                not last_weather_long_forecast
                or datetime.datetime.now()
                - datetime.datetime.strptime(
            last_weather_long_forecast.decode(), "%Y-%m-%d %H:%M:%S"
        ) > datetime.timedelta(days=1)  # time to adjust
        ):
            open_weather = daemon.OpenWeather()
            open_weather.cache_long_forecast()
            cache.set(
                "last_weather_long_forecast",
                datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            )

        return func()

    return wrapper_long_forecast


@blueprint.route("/get_current", methods=["GET"])
@check_cache_current
def get_current():
    data = cache.get("current")
    return json.dumps(data.decode()).replace('\\"', '"')[1:-1]


@blueprint.route("/get_forecast", methods=["GET"])
@check_cache_forecast
def get_forecast():
    data = cache.get("forecast")
    return json.dumps(data.decode()).replace("'", '"')[1:-1]


@blueprint.route("/get_long_forecast", methods=["GET"])
@check_cache_long_forecast
def get_long_forecast():
    data = cache.get("forecast_long")
    return json.dumps(data.decode()).replace("'", '"')[1:-1]
