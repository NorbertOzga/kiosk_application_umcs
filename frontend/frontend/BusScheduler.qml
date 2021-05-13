import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.15

Rectangle {
    id: busScheduler
    width: parent.width / 2
    height: parent.height
    color: "#252525"

    Rectangle {
        id: busSchedulerInner
        width: parent.width - 20
        height: parent.height - 20
        color: "#303030"
        anchors.centerIn: parent

        ColumnLayout {
            width: parent.width

            Rectangle {
                id: busSchedulerLabel
                width: parent.width
                height: 58
                color: "#ff4949"
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
                        GradientStop { position: 0.0; color: "#ff4949" }
                        GradientStop { position: 1.0; color: "#5d30ffc2" }
                    }
                }

                Text {
                    anchors.centerIn: parent
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 40
                    font.family: "Roboto"
                    text: "ROZKŁAD JAZDY"
                    color: "white"
                }
            }

            Rectangle {
                id: busSchedulerWrapper
                width: parent.width
                height: parent.height - 60
                color: "#303030"

                ColumnLayout {
                    width: parent.width
                    height: parent.height
                    spacing: 0


                    Text {
                        color: "#aaa"
                        text: "Aktualna godzina: 14:50:26"
                        anchors.horizontalCenter: parent.horizontalCenter
//                        font {
//                            weight: 800
//                            pixelSize: 25
//                          }
                    }

                    BusOption {
                        number: "31"
                        label: "Dworzec PKP"
                        time: "<1min"
                    }

                    BusOption {
                        number: "29"
                        label: "Dworzec PKP"
                        time: "<1min"
                    }

                    BusOption {
                        number: "35"
                        label: "Dworzec PKP"
                        time: "<1min"
                    }

                    BusOption {
                        number: "35"
                        label: "Dworzec PKP"
                        time: "<1min"
                    }

                    BusOption {
                        number: "35"
                        label: "Dworzec PKP"
                        time: "<1min"
                    }

                    BusOption {
                        number: "35"
                        label: "Dworzec PKP"
                        time: "<1min"
                    }

                    BusOption {
                        number: "35"
                        label: "Dworzec PKP"
                        time: "<1min"
                    }

                    BusOption {
                        number: "35"
                        label: "Dworzec PKP"
                        time: "<1min"
                    }

                    BusOption {
                        number: "35"
                        label: "Dworzec PKP"
                        time: "<1min"
                    }

                    BusOption {
                        number: "35"
                        label: "Dworzec PKP"
                        time: "<1min"
                    }

                }

            }

        }
    }
}
