import datetime
import json

from flask import Blueprint

from . import services

from ..extensions import cache

blueprint = Blueprint("events", __name__, url_prefix="/events")


def check_cache_events(func):
    def wrapper_events():
        last_events_fetch = cache.get("last_events_fetch")
        if (
            not last_events_fetch
            or datetime.datetime.now()
            - datetime.datetime.strptime(
                last_events_fetch.decode(), "%Y-%m-%d %H:%M:%S"
            )
            > datetime.timedelta(hours=2)
        ):
            events = services.Events(cache_module=cache)
            events.get_events()
            cache.set(
                "last_events_fetch",
                datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            )

        return func()
    return wrapper_events


@blueprint.route("/get_events", methods=["GET"])
@check_cache_events
def get_events():
    data = cache.get("events")
    return json.dumps(data.decode()).replace("'", '"')[1:-1]
