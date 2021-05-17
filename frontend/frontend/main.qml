import QtQuick 2.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.15

Window {
    id: root
    width: 1920
    height: 1080
    visible: true
    title: qsTr("Kiosk app")
    FontLoader
    {
        id: roboto
        source: "Roboto.ttf"
    }

    LeftPanel   {
        id: leftPanelRoot
    }
    RightPanel {
        id: rightPanelRoot
        x: 960
        y: 0

    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}
}
##^##*/
