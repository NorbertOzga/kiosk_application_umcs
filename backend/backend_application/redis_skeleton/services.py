from flask import request
from extensions import cache

def get_value():
    return cache.get('example')

def post_example():
    jsonData = request.json
    cache.set('example',jsonData)


