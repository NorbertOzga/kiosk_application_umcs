import logging
import json
import requests

from backend_application.extensions import cache


class OpenWeather:
    def __init__(self, location: str = "lublin,pl"):
        self.api_url = "https://community-open-weather-map.p.rapidapi.com"
        self.location = "lublin,pl"
        self.headers = {
            'x-rapidapi-key': "12d9bbbae2msh153e3f9e78cdb3ep1854b9jsn1fb1ff8e3ab2",
            'x-rapidapi-host': "community-open-weather-map.p.rapidapi.com"
        }

    def cache_current(self):
        """Returns current weather."""

        querystring = {"q": self.location, "lang": "pl"}
        response = requests.request(
            "GET",
            self.api_url + "/weather",
            headers=self.headers,
            params=querystring
        )

        cache.set("current", json.dumps(response.json()))

    def cache_history(self):
        """Returns weather from last 5 days (1 hour interval)."""

        querystring = {"q": self.location, "lang": "pl", "dt": "1590094153"}
        response = requests.request(
            "GET",
            self.api_url + "/onecall/timemachine",
            headers=self.headers,
            params=querystring
        )
        cache.set("history", json.dumps(response.json()))

    def cache_forecast(self):
        """Returns weather for next 5 days (3 hours interval)."""

        querystring = {"q": self.location, "lang": "pl"}
        response = requests.request(
            "GET",
            self.api_url + "/forecast",
            headers=self.headers,
            params=querystring
        )

        cache.set("forecast", json.dumps(response.json()))

    def cache_long_forecast(self, day_count=16):
        """Returns weather for next 16 days (1 day interval)."""

        querystring = {"q": self.location, "lang": "pl", "cnt": day_count}
        response = requests.request(
            "GET",
            self.api_url + "/forecast/daily",
            headers=self.headers,
            params=querystring
        )

        cache.set("forecast_long", json.dumps(response.json()))
