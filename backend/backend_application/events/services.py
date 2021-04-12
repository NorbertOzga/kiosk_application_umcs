from bs4 import BeautifulSoup
import requests
import json
import datetime
import time 
from flask import Response
from requests import get
from ..extensions import cache



def getColor(string):
    colors = {
        'student': '#4bbe9d',
        'lublin': '#dc462d',
        'tv umcs': '#f38200',
        'biznes': '#6b08ff',
        'pracownik': '#337b93',
        'absolwent': '#60baf6',
        'kandydat': '#ff6600',
    }
    try:
        picked = colors[string.lower()]
        return picked
    except:
        return '#9399a5'



class Events:
    def subscrape(self, url):
        response = get(url)
        soup = BeautifulSoup(response.text, 'html.parser')
        everything = soup.find('div', class_='paginate-content')
        return everything
    def subscrape_fixed(self, url):
        response = get(url)
        soup = BeautifulSoup(response.text, 'html.parser')
        everything = soup.find('div', class_='paginate-content')
        everything_fixed = everything.text.replace('\n', '').strip()
        return everything_fixed
    def events(self):
        url= 'http://www.umcs.pl'
        response = get(url)
        soup = BeautifulSoup(response.text, 'html.parser')
        all_events = []
        all_events = soup.find_all('a', class_='box-event-small')
        i=0
        id = i
        failflag = False
        itemList = []
        for item in all_events:
            event_name = item.find('div', class_='col-xs-7')
            event_name = event_name.text.replace('\n', '').strip()
                    
            date = item.find('em', class_='label-meta')
            date = date.text.replace('\n', '').strip()
            
            type = item.find('em', class_='label-area-A')
            type = type.text.replace('\n', '').strip()

            color = getColor(type)

            #subscrape
            suburl = item['href']
            suburl = url + suburl
            raw = str(self.subscrape(suburl))
            fixed = self.subscrape_fixed(suburl)

            # check for fails in scraping
            if (event_name == "") or (date == "") or (type == "") or (color == ""):
                failflag = True

            # serialize data to JSON format
            if not failflag:	
                itemList.append({
                    'name': event_name,
                    'date': date,
                    'type': type,
                    'color': color,
                    'raw':raw,
                    'fixed': fixed
                })
        request = {
            'success': True,
            'payload': json.dumps(itemList)
        }
        cache.set("events", str(request))


        return Response(
            response=json.dumps(itemList),
            status=200,
            mimetype='application/json'
        )