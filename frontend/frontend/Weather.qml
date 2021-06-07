import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.15

Rectangle {
    id: weather
    width: parent.width / 2
    height: parent.height
    color: "#252525"

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
                        temperature: "25°C"
                        time: "Teraz"
                        label: "Pochmurno"
                    }

                    WeatherOption {
                        temperature: "25°C"
                        time: "12:00"
                        label: "Deszczowo"
                    }

                    WeatherOption {
                        temperature: "22°C"
                        time: "13:00"
                        label: "Słonecznie"
                    }

                    WeatherOption {
                        temperature: "21°C"
                        time: "14:00"
                        label: "Mgliście"
                    }

                    WeatherOption {
                        temperature: "18°C"
                        time: "15:00"
                        label: "Burzliwie"
                    }
                }

            }

            Rectangle {}
        }
    }
}
