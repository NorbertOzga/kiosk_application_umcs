from flask import Blueprint
from . import services as rss

blueprint = Blueprint(
    "redis_skeleton", __name__, url_prefix="/api/redis-skeleton"
)


@blueprint.route("/get_example", methods=["GET"])
def get_example():
    return {"value": rss.get_value()}
