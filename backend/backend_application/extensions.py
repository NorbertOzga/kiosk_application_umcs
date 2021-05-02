import redis
from flask_apscheduler import APScheduler


cache = redis.Redis(host='redis_dev', port=6379)
scheduler = APScheduler()
