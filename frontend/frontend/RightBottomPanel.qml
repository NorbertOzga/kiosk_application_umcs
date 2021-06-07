import QtQuick 2.0

Rectangle {
    id: rightBottomPanel
    width: parent.width
    height: parent.height / 2
    color: "#252525"

    Rectangle {
        id: rightBottomPanelInner
        width: parent.width - 20
        height: parent.height - 20
        color: "#303030"
        anchors.centerIn: parent

        News {
        }
    }
}
