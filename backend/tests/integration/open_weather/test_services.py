import fakeredis

from backend_application.open_weather.daemon import OpenWeather
from tests.integration.test_case import BaseTestCase


class TestWeatherServices(BaseTestCase):
    def setUp(self):  # noqa
        super().setUp()

    def test_get_current_weather(self):
        weather = OpenWeather(self.cache)
        weather.cache_current()

        self.assertTrue("weather" in self.cache.get("current").decode())

    def test_get_forecast_weather(self):
        weather = OpenWeather(self.cache)
        weather.cache_forecast()

        self.assertTrue("weather" in self.cache.get("forecast").decode())
