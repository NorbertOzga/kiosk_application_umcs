import QtQuick 2.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.15



Rectangle{
    id: instagramSection
    x: 0
    y: 0
    width: 960
    height: 1080
    visible: true
    color: "#303030"

    Rectangle {
        id: rectanglebig
        x: 0
        y: 10
        width: 960
        height: 58
        visible: true
        radius: 8

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
                GradientStop { position: 0.0; color: "#ffc273" }
                GradientStop { position: 1.0; color: "#ff5aaa" }
            }
        }

        Text {
            id: instagramSectionHeader
            x: 351
            anchors.verticalCenter: parent.verticalCenter
            width: 259
            height: 56
            color: "#ffffff"
            text: qsTr("INSTAGRAM")
            font.pixelSize: 40
            anchors.verticalCenterOffset: 3
            font.family: "Roboto"
            textFormat: Text.AutoText
            minimumPixelSize: 27
        }

    }
    Rectangle {
        id: root;
        x: 81
        y: 180

        radius: 8

        width: 799
        height: 475
        visible: true

        // apply rounded corners mask
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                x: root.x; y: root.y
                width: root.width
                height: root.height
                radius: root.radius
            }
        }

        Image {
            id: postImage
            opacity: 1
            smooth: false
            anchors.fill: parent
            source: "sample_umcs_image.jpeg"
            fillMode: Image.Pad
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
        }
    }

    Image {
        id: authorProfilePic
        width: 50
        height: 50
        opacity: 1
        smooth: false
        anchors.fill: parent
        source: "pfpic.png"
        anchors.rightMargin: 827
        anchors.bottomMargin: 327
        anchors.leftMargin: 69
        anchors.topMargin: 689
    }

    Rectangle {
        id: hr
        x: 75
        y: 759
        width: 810
        height: 1
        color: "#666666"
    }

    Text {
        id: username_short
        x: 147
        y: 689
        width: 118
        height: 26
        color: "#c3c3c3"
        text: qsTr("umcs_lublin
")
        font.pixelSize: 21
        font.family: "Roboto"
    }

    Text {
        id: username_long
        x: 147
        y: 721
        width: 402
        height: 25
        color: "#c3c3c3"
        text: qsTr("Uniwersytet Marii-Curie Skłodowskiej w Lublinie")
        font.pixelSize: 18
        font.family: "Tahoma"
    }

    Text {
        id: postDescription
        x: 75
        y: 771
        width: 810
        height: 228
        color: "#c3c3c3"
        text: "UMCS przez różowe \"okulary\" 😍❤️\n💌 Dużo miłości z okazji Walentynek! 💌\n.\n.\n.\n#umcs #umcsLublin #university #uniwersytet #uni #uniinpoland #universityinlublin #architecture #study #student #studentslife #ilovelublin #Lubelskie #lbn #valentines #valentinesday #люблін #люблин"
        font.pixelSize: 18
        wrapMode: Text.WordWrap
        textFormat: Text.PlainText
        font.family: "Verdana"

        Text {
            id: text2
            x: 325
            y: 201
            width: 40
            height: 47
            color: "#c3c3c3"
            text: qsTr("❤️")
            font.pixelSize: 62
        }
    }

    Rectangle {
        id: hr1
        x: 75
        y: 971
        width: 810
        height: 1
        color: "#666666"
    }

    Grid {
        id: grid
        x: 75
        y: 988
        width: 810
        height: 58

    }

    Text {
        id: text1
        x: 438
        y: 988
        width: 86
        height: 48
        color: "#c3c3c3"
        text: qsTr("512")
        font.pixelSize: 42
        font.bold: true
        font.family: "Roboto"
    }

    Text {
        id: text3
        x: 697
        y: 721
        width: 183
        height: 25
        color: "#c3c3c3"
        text: qsTr("14,2 tyś obserwujących")
        font.pixelSize: 17
        font.family: "Roboto"
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/