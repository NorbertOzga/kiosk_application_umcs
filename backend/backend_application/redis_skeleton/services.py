from ..extensions import cache


def get_value():
    return cache.get('example').decode()


def post_example(json_data):
    cache.set('example', json_data["example"])


