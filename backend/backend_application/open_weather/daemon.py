import os
import json
import requests

from backend_application.extensions import cache


class OpenWeather:
    def __init__(self, location: str = "lublin,pl"):
        self.api_url = "https://api.openweathermap.org/data/2.5"
        self.location = "Lublin,pl"
        self.api_key = os.environ["OPENWEATHER_API_KEY"]  # noqa

    def cache_current(self):
        """Returns current weather."""

        response = requests.request(
            "GET",
            f"{self.api_url}/weather?q={self.location}&appid={self.api_key}"
        )

        cache.set("current", json.dumps(response.json()))

    def cache_forecast(self):
        """Returns weather for next 5 days (3 hours interval)."""

        response = requests.request(
            "GET",
            f"{self.api_url}/forecast?q={self.location}&appid={self.api_key}",
        )
        cache.set("forecast", json.dumps(response.json()))

    def cache_long_forecast(self, day_count=16):
        """Returns weather for next 16 days (1 day interval)."""

        response = requests.request(
            "GET",
            f"{self.api_url}/forecast/daily?"
            f"q={self.location}&cnt={day_count}&appid={self.api_key}"
        )

        cache.set("forecast_long", json.dumps(response.json()))
