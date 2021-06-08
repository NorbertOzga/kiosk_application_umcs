import QtQuick 2.0
import QtQuick.Layouts 1.3


ColumnLayout {
    id: weatherOption
    width: parent.width
    height: parent.height
    property alias icon: weatherIcon.source
    property alias temperature: temperatureText.text
    property alias time: timeText.text
    property alias label: labelText.text
    anchors.horizontalCenter: parent.horizontalCenter

    Rectangle {
        id: weatherOptionIcon
        width: 460
        height: 200
        color: "#303030"
        anchors.horizontalCenter: parent.horizontalCenter

        Image {
            id: weatherIcon
            width: 150
            height: 150
            fillMode: Image.PreserveAspectFit
            opacity: 1
            smooth: false
            anchors.fill: parent
            anchors.horizontalCenter: parent.horizontalCenter
            source: weatherIcon

        }

    }


    ColumnLayout {
        id: weatherOptionContent
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter

        Text{
            color: "white"
            id: temperatureText
            text: temperature
            font.pixelSize: 50
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text{
            color: "white"
            id: timeText
            text: time
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text{
            color: "white"
            id: labelText
            text: label
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }


}
