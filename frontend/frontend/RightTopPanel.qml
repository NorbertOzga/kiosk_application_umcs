import QtQuick 2.0
import QtQuick.Layouts 1.3

RowLayout {
    id: topPanel
    width: parent.width
    height: parent.height / 2
    spacing: 0

    Weather {}

    BusScheduler {}
}
