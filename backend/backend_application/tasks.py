import datetime
from .extensions import scheduler
from backend_application.open_weather.daemon import OpenWeather
from backend_application.instagram_post.services import InstaScraper
from backend_application.events.services import Events

open_weather = OpenWeather()
instagram_posts = InstaScraper()
events_handler = Events()

@scheduler.task("cron", id="weekly_weather", week="*/5")
def weekly_weather():
    """
        Cache weekly weather to Redis
    """ 
    print("Caching weekly weather to redis")
    
    with scheduler.app.app_context():
        open_weather.cache_forecast()

@scheduler.task("cron", id="current_weather", week="*", next_run_time=datetime.datetime.now()) #????
def current_weather():
    """
        Cache current weather to Redis
    """
    with scheduler.app.app_context():
        open_weather.cache_current()

@scheduler.task("interval", id="long_forecast_weather", minutes=14440, next_run_time=datetime.datetime.now()) #1day interval
def long_forecast_weather():
    with scheduler.app.app_context():
        open_weather.cache_long_forecast()

@scheduler.task("interval", id="forecast_weather", minutes=180, next_run_time=datetime.datetime.now()) #3hours interval
def forecast_weather():
    with scheduler.app.app_context():
        open_weather.cache_forecast()
@scheduler.task("interval", id="instagram",  seconds=15, next_run_time=datetime.datetime.now())
def instagram():
    """
        Cache instagram posts to Redis
    """
    with scheduler.app.app_context():
        instagram_posts.getInstagramData()

@scheduler.task("interval", id="events", minutes=14440, next_run_time=datetime.datetime.now())
def events():
    """
        Cache events from UMCS site to Redis
    """
    with scheduler.app.app_context():
        events_handler.events()