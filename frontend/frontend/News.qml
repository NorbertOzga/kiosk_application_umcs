import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.15

ColumnLayout {
    width: parent.width
    height: parent.height
    property var news: []
    property int currentNewsIdx: 0

    function request(url, callback) {
       var xhr = new XMLHttpRequest();
       xhr.onreadystatechange = (function(myxhr) {
           return function() {
               if(myxhr.readyState === 4) callback(myxhr)
           }
       })(xhr);
       xhr.open('GET', url, true);
       xhr.send('');

   }

    Timer {
       interval: 10000
       running: true
       repeat: true
       triggeredOnStart: true
       id: newsSlide
       onTriggered: {
           currentNewsIdx = currentNewsIdx < news.length - 1 ? currentNewsIdx + 1 : 0
       }
    }

    Timer {
        interval: 100
        running: true
        repeat: true
        triggeredOnStart: true
        id: newsTimeApi
        onTriggered: {
            request(
                'http://localhost:5001/events/get_events',
                function (o) {
                    var responseBody = JSON.parse(o.responseText);
                    news = responseBody.payload;
                }
            );
        }
    }


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
        height: parent.height - 60 - 60
        color: "#303030"

        RowLayout {
            width: parent.width - 30
            height: parent.height - 30
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
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
                    source: news[currentNewsIdx] && news[currentNewsIdx].photo_link
                        ? news[currentNewsIdx].photo_link
                        : ""
                    fillMode: Image.Pad
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                }
            }

            Rectangle {
                id: newsContent
                width: parent.width - 300
                height: parent.height
                anchors.top: parent.top
                color: "#303030"

                ColumnLayout {
                    width: parent.width - 30
                    anchors.horizontalCenter: parent.horizontalCenter

                    Rectangle {
                        width: parent.width
                        height: 70
                        color: "#303030"

                        Text {
                            wrapMode: Text.WordWrap
                            width: parent.width
                            anchors.verticalCenter: parent.verticalCenter
                            text: news[currentNewsIdx] && news[currentNewsIdx].name
                                  ? news[currentNewsIdx].name
                                  : ""
                            color: "#c4c4c4"
                            font.pixelSize: 30
                            font.family: "Roboto"
                        }
                    }

                    Rectangle {
                        width: parent.width
                        height: 30
                        color: "#303030"

                        RowLayout {

                            height: parent.height


                            Text {
                                wrapMode: Text.WordWrap
                                width: parent.width
                                anchors.verticalCenter: parent.verticalCenter
                                text: news[currentNewsIdx] && news[currentNewsIdx].date
                                      ? news[currentNewsIdx].date
                                      : ""
                                color: "#a6a6a6"
                                font.pixelSize: 16
                            }

                            Text {
                                wrapMode: Text.WordWrap
                                width: parent.width
                                anchors.verticalCenter: parent.verticalCenter
                                text: news[currentNewsIdx] && news[currentNewsIdx].type
                                      ? "| " + news[currentNewsIdx].type
                                      : ""
                                color: "#a6a6a6"
                                font.pixelSize: 16
                            }
                        }

                    }



                    Rectangle {
                        width: parent.width
                        height: parent.height - 70 - 30

                        Text {
                            wrapMode: Text.WordWrap
                            width: parent.width
                            text: news[currentNewsIdx] && news[currentNewsIdx].text
                                  ? news[currentNewsIdx].text
                                  : ""
                            color: "#a3a3a3"
                            font.pixelSize: 17
                            font.family: "Roboto"
                        }
                    }



                }


            }

        }

    }

    Rectangle {
        width: parent.width
        height: 60
        color: "#303030"

        Balls {
            count: news.length
            current: currentNewsIdx
            currentColor: "#19f097"
        }
    }
}
