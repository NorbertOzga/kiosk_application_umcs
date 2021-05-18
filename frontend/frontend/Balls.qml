import QtQuick 2.0
import QtQuick.Layouts 1.3

RowLayout {
    id: balls
    property alias count: ballRepeater.model
    property int current: 1
    property string currentColor: "red"
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.verticalCenter: parent.verticalCenter


    Repeater {
        id: ballRepeater
        model: count;
        delegate: Rectangle {
            id: ball
            width: 10;
            height: 10;
            color: index == current ? currentColor : "#bbb";
            radius: 5;
        }
    }
}
