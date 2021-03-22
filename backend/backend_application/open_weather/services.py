
import requests

class OpenWeather:
    def __init__(self, location: str = "lublin,pl"):
        self.api_url = "https://community-open-weather-map.p.rapidapi.com"
        self.location = "lublin"
        self.headers = {
            'x-rapidapi-key': "12d9bbbae2msh153e3f9e78cdb3ep1854b9jsn1fb1ff8e3ab2",
            'x-rapidapi-host': "community-open-weather-map.p.rapidapi.com"
        }

    # Aktualna pogoda
    # Zwraca obiekt typu WeatherInfo
    def getCurrent(self):
        querystring = {"q":self.location, "lang": "pl"}
        response = requests.request("GET", self.api_url + "/weather", headers=self.headers, params=querystring)
        return response.text

    # Historia pogody na poprzednie 5 dni (nowe dane co 1 godzinę)
    def getHistory(self):
        querystring = {"q":self.location, "lang": "pl", "dt":"1590094153"}
        response = requests.request("GET", self.api_url + "/onecall/timemachine", headers=self.headers, params=querystring)
        return response.text

    # Pogoda na następne 5 dni (nowe dane co 3 godziny)
    def getForecast(self):
        querystring = {"q":self.location, "lang": "pl"}
        response = requests.request("GET", self.api_url + "/forecast", headers=self.headers, params=querystring)
        return response.text

    # Pogoda na następne 16 dni (nowe dane co 1 dzień)
    def getLongerForecast(self, day_count = 16):
        querystring = {"q":self.location, "lang":"pl", "cnt": day_count}
        response = requests.request("GET", self.api_url + "/forecast/daily", headers=self.headers, params=querystring)
        return response.text
