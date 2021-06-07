import QtQuick 2.0
import QtQuick.Layouts 1.3

RowLayout {
    id: busOption
    property alias number: numberText.text
    property alias label: labelText.text
    property alias time: timeText.text

    FontLoader { id: fixedFont; source: "Courier" }


    Rectangle {
        width: 20
        height: 30
        color: "#303030"
    }

    Rectangle {
        width: 40
        height: 25
        color: "#ff5555"
        radius: 2

        Text {
            anchors.centerIn: parent
            id: numberText
            text: number
            color: "white"
            font: {family: "Courier New"; weight: 800}
        }
    }


    Rectangle {
        width: 330
        height: 25
        color: "#303030"


        Text {
            id: labelText
            text: label
            color: "#bbb"
            font: {family: "Courier"; weight: 800}
            anchors { verticalCenter: parent.verticalCenter;  }
        }
    }



    Text {
        id: timeText
        text: time
        color: "#bbb"
        font: {family: fixedFont.name; weight: 800}
    }

}
