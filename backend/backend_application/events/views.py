import json

from flask import Blueprint

from ..extensions import cache

blueprint = Blueprint("events", __name__, url_prefix="/events")


@blueprint.route("/get_events", methods=["GET"])
def get_events():
    data = cache.get("events")
    return json.dumps(data.decode()).replace("'", '"')[1:-1]
