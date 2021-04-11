import redis
from flask_apscheduler import APScheduler
#from backend_application.open_weather.daemon import OpenWeather 
#import instagram_post.services as dinsta 

cache = redis.Redis(host='redis_dev', port=6379)
scheduler = APScheduler()

# open_weather = OpenWeather()
#intagram = dinsta.InstaScraper()


