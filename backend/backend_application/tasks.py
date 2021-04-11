
from .extensions import scheduler
from backend_application.open_weather.daemon import OpenWeather
from backend_application.instagram_post.services import InstaScraper


open_weather = OpenWeather()
instagram_posts = InstaScraper()

@scheduler.task("interval", id="weekly_weather", seconds=15)
def weekly_weather():
    """
        Cache weekly weather to Redis
    """ 
    print("Caching weekly weather to redis")
    
    with scheduler.app.app_context():
        open_weather.cache_current()
#0 0 */5 * *  midnight every 5 days.

@scheduler.task("interval", id="instagram", seconds=15)
def instagram():
    """
        Cache instagram posts to Redis
    """
    with scheduler.app.app_context():
        instagram_posts.getInstagramData()