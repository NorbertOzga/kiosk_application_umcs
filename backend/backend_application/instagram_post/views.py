import json
import datetime

from flask import Blueprint

from . import services
from ..extensions import cache

blueprint = Blueprint("instagram_post", __name__, url_prefix="/instagram_post")


def check_cache(func):
    def wrapper_instagram():
        last_instagram_fetch = cache.get("last_instagram_fetch")
        if (
            not last_instagram_fetch
            or datetime.datetime.now()
            - datetime.datetime.strptime(
                last_instagram_fetch.decode(), "%Y-%m-%d %H:%M:%S"
            )
            > datetime.timedelta(minutes=45)
        ):
            insta_scraper = services.InstaScraper(cache_module=cache)
            insta_scraper.get_instagram_data()
            cache.set(
                "last_instagram_fetch",
                datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            )

        return func()

    return wrapper_instagram


@blueprint.route("/get_post", methods=["GET"])
@check_cache
def get_posts():
    data = cache.get("instagram_posts")
    data = data.decode('utf-8','ignore').encode("utf-8")
    return json.dumps(data.decode()).replace("'", '"')[1:-1]
