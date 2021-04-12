from flask import Blueprint

from ..extensions import cache

blueprint = Blueprint("events", __name__, url_prefix="/events")

@blueprint.route("/get_events", methods=["GET"])
def get_events():
        return cache.get("events")