import datetime
import json

from flask import Blueprint

from . import services

from ..extensions import cache

blueprint = Blueprint("buses", __name__, url_prefix="/buses")


def check_cache_buses(func):
    def wrapper_busses(bus_stop_id):
        last_buses_fetch = cache.get(f"last_bus_stop_{bus_stop_id}")
        if (
            not last_buses_fetch
            or datetime.datetime.now()
            - datetime.datetime.strptime(
                last_buses_fetch.decode(), "%Y-%m-%d %H:%M:%S"
            )
            > datetime.timedelta(hours=2)
        ):
            buses = services.ZTM();
            buses.requestDeparture(bus_stop_id)
            cache.set(
                f"last_bus_stop_{bus_stop_id}",
                datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            )

        return func(bus_stop_id)
    return wrapper_busses


@blueprint.route("/get_buses/<int:bus_stop_id>", methods=["GET"])
@check_cache_buses
def get_bus(bus_stop_id):
    cache_name = f"bus_stop_{bus_stop_id}"
    data = cache.get(cache_name)
    print(data)
    return json.dumps(data.decode()).replace("'", '"')[1:-1]
