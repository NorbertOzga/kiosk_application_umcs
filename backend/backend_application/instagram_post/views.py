from flask import Blueprint

from ..extensions import cache

blueprint = Blueprint("instagram_post", __name__, url_prefix="/instagram_post")


@blueprint.route("/get_post", methods=["GET"])
def get_posts():
    return cache.get("instagram_posts")
