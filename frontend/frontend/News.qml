import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.15

ColumnLayout {
    width: parent.width
    height: parent.height

    Rectangle {
        id: newsLabel
        width: parent.width
        height: 58
        color: "#17ff96"
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
                GradientStop { position: 0.0; color: "#17ff96" }
                GradientStop { position: 1.0; color: "#2b7fce" }
            }
        }

        Text {
            anchors.centerIn: parent
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 40
            font.family: "Roboto"
            text: "AKTUALNOŚCI"
            color: "white"
        }
    }

    Rectangle {
        id: newsWrapper
        width: parent.width
        height: parent.height - 60
        color: "#303030"

        RowLayout {
            width: parent.width
            height: parent.height
            spacing: 0
            Rectangle {
                id: newsImageWrapper
                width: 300
                height: 250
                radius: 5
                anchors.top: parent.top

                Image {
                    id: newsImage
                    opacity: 1
                    smooth: false
                    anchors.fill: parent
                    source: "umcs_news_sample_image.jpg"
                    fillMode: Image.Pad
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                }
            }

            Rectangle {
                width: parent.width - 300
                height: parent.height
                anchors.top: parent.top
                color: "#303030"

                ColumnLayout {
                    width: parent.width

                    Text {
                        text: "Analiza stopnia zainteresowania "
                        color: "#bbb"
//                        font.weight: 800
//                        font.pixelSize: 30
                    }

                    Text {
                        text: "Szanowni Studenci i Doktoranci "
                        color: "#bbb"
                    }
                }


            }

        }


    }

}

