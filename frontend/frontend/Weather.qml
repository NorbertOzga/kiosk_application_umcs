import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.15

Rectangle {
    id: weather
    width: parent.width / 2
    height: parent.height
    color: "#252525"
    property int currentTemperature: 0
    property string currentDescription: ""
    property string currentIcon: ""

    function request(url, callback) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = (function(myxhr) {
            return function() {
                if(myxhr.readyState === 4) callback(myxhr)
            }
        })(xhr);
        xhr.open('GET', url, true);
        xhr.send('');
    }

    Timer {
        interval: 300000
        running: true
        repeat: true
        triggeredOnStart: true
        id: weatherTimeApi
        onTriggered: {
            request(
                'http://localhost:5001/open_weather/get_current',
                function (res) {
                    var weatherInfo = {
                      "Clear": {label: "Czyste niebo", icon: "weather-icons/01d@2x.png"},
                      "Thunderstorm": {label: "Burza", icon: "weather-icons/11d@2x.png"},
                      "Drizzle": {label: "Mżawka", icon: "weather-icons/10d@2x.png"},
                      "Rain": {label: "Deszcz", icon: "weather-icons/09d@2x.png"},
                      "Snow": {label: "Śnieg", icon: "weather-icons/13d@2x.png"},
                      "Mist": {label: "Mgła", icon: "weather-icons/50d@2x.png"},
                      "Smoke": {label: "Dymnie", icon: "weather-icons/50d@2x.png"},
                      "Haze": {label: "Mgła", icon: "weather-icons/50d@2x.png"},
                      "Dust": {label: "Kurz", icon: "weather-icons/50d@2x.png"},
                      "Fog": {label: "Mgła", icon: "weather-icons/50d@2x.png"},
                      "Sand": {label: "Piaszczyście", icon: "weather-icons/50d@2x.png"},
                      "Ash": {label: "Popieliście", icon: "weather-icons/50d@2x.png"},
                      "Squall": {label: "Szkwał", icon: "weather-icons/50d@2x.png"},
                      "Tornado": {label: "Tornado", icon: "weather-icons/50d@2x.png"},
                      "Clouds": {label: "Pochmurno", icon: "weather-icons/09d@2x.png"},
                    }
                    var responseBody = JSON.stringify(res.responseText);
                    var firstWeather = responseBody.weather[0];
                    var currentWeatherInfo = firstWeather ? weatherInfo[firstWeather.main] : undefined
                    currentTemperature = responseBody.main.temp - 273;
                    currentDescription = currentWeatherInfo ? currentWeatherInfo.label : responseBody.weather.main
                    currentIcon = currentWeatherInfo ? currentWeatherInfo.icon : ""
                }
            );
        }
    }

    Rectangle {
        id: weatherInner
        width: parent.width - 20
        height: parent.height - 20
        color: "#303030"
        anchors.centerIn: parent

        ColumnLayout {
            width: parent.width
            height: parent.height

            Rectangle {
                id: weatherLabel
                width: parent.width
                height: 58
                color: "#00000000"
                LinearGradient {
                    x: 0
                    y: 10
                    anchors.fill: parent
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    start: Qt.point(0, 0)
                    end: Qt.point(500, 50)
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#496fff" }
                        GradientStop { position: 1.0; color: "#b951a5" }
                    }
                }
                Text {
                    anchors.centerIn: parent
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 40
                    font.family: "Roboto"
                    text: "POGODA"
                    color: "white"
                }



            }

            Rectangle {
                id: weatherWrapper
                width: parent.width
                height: parent.height - 60
                color: "#303030"

                ColumnLayout {
                    id: weatherContent

                    WeatherOption {
                        icon: currentIcon
                        temperature: currentTemperature + "°C"
                        time: "Teraz"
                        label: currentDescription
                    }
                }

            }

            Rectangle {}
        }
    }
}
