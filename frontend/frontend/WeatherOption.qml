import QtQuick 2.0
import QtQuick.Layouts 1.3


RowLayout {
    id: weatherOption
    property alias temperature: temperatureText.text
    property alias time: timeText.text
    property alias label: labelText.text

    Rectangle {
        id: weatherOptionIcon
        width: 80
        height: 80
        color: "#303030"

        FontLoader {
            id: glyphs
            source: "fontello"
        }

        Text {
            font.family: glyphs.name
            text: "\e83a"
        }
    }

    Rectangle {
        id: borderRight
        width: 1
        height: 80
        color: "#666"
    }

    Rectangle {
        id: weatherSpacing
        width: 5
        height: 80
        color: "#303030"
    }

    ColumnLayout {
        id: weatherOptionContent
        Text{
            color: "white"
            id: temperatureText
            text: temperature
            lineHeightMode: Text.FixedHeight
            lineHeight: 6
//            font.weight: 800
//            font.pixelSize: 32
        }

        Text{
            color: "white"
            id: timeText
            text: time
            lineHeightMode: Text.FixedHeight
            lineHeight: 6
        }

        Text{
            color: "white"
            id: labelText
            text: label
            lineHeightMode: Text.FixedHeight
            lineHeight: 6
        }
    }


}
