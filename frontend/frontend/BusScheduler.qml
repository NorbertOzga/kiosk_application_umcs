import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.15

Rectangle {
    id: busScheduler
    width: parent.width / 2
    height: parent.height
    color: "#252525"
    property var busses811: []
    property var busses478: []
    property int currentPage: 0
    property int maxBusPerPage: 5
    property int currentHour: 0
    property int currentMinute: 0
    property int currentSecond: 0

    Timer {
       interval: 1000
       running: true
       repeat: true
       triggeredOnStart: true
       id: newsSlide
       onTriggered: {
           var date = new Date()
           currentHour = date.getHours()
           currentMinute = date.getMinutes()
           currentSecond = date.getSeconds()
       }
    }

    Rectangle {
        id: busSchedulerInner
        width: parent.width - 20
        height: parent.height - 20
        color: "#303030"
        anchors.centerIn: parent

        ColumnLayout {
            id: busColumnLayout
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
                    id: busOptionLayout
                    width: parent.width
                    height: parent.height
                    spacing: 0

                    Text {
                        color: "#aaa"
                        text: qsTr(
                            "Aktualna godzina: " +
                            (currentHour  < 10 ? "0" : "") + currentHour + ":" +
                            (currentMinute < 10 ? "0" : "") + currentMinute + ":" +
                            (currentSecond < 10 ? "0" : "") + currentSecond
                        )
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: 25

                    }
                    BusOption { id: bus478_1; option: busses478[currentPage * maxBusPerPage + 0] }
                    BusOption { id: bus478_2; option: busses478[currentPage * maxBusPerPage + 1] }
                    BusOption { id: bus478_3; option: busses478[currentPage * maxBusPerPage + 2] }
                    BusOption { id: bus478_4; option: busses478[currentPage * maxBusPerPage + 3] }
                    BusOption { id: bus478_5; option: busses478[currentPage * maxBusPerPage + 4] }

                    Rectangle {width: parent.width; height: 20; color: "#303030"}

                    BusOption { id: bus811_1; option: busses811[currentPage * maxBusPerPage + 0] }
                    BusOption { id: bus811_2; option: busses811[currentPage * maxBusPerPage + 1] }
                    BusOption { id: bus811_3; option: busses811[currentPage * maxBusPerPage + 2] }
                    BusOption { id: bus811_4; option: busses811[currentPage * maxBusPerPage + 3] }
                    BusOption { id: bus811_5; option: busses811[currentPage * maxBusPerPage + 4] }
                }

            }

        }
    }

    Timer {
        id: cycleThroughViewTimer
        interval: 5000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            updateView()
        }
    }
    Timer {
        id: mainTimer
        interval: 6000
        running: true
        repeat: false
        triggeredOnStart: true
        onTriggered: {
            downloadData();
        }
    }
    function downloadData() {
        request('http://localhost:5001/buses/get_buses/811', function (o) {
            busses811 = JSON.parse(o.responseText).payload || [];
        });
        request('http://localhost:5001/buses/get_buses/478', function (o) {
            busses478 = JSON.parse(o.responseText).payload || [];
        });
    }

    function updateView() {
        if(!busses811.length || !busses478.length) {currentPage = 0; return;}
        var pagesCount811 = Math.ceil(busses811.length / maxBusPerPage);
        var pagesCount478 = Math.ceil(busses478.length / maxBusPerPage);
        var smallesPagesCount = pagesCount478 < pagesCount811 ? pagesCount478 : pagesCount811
        currentPage = currentPage + 1 < smallesPagesCount ? currentPage + 1 : 0
    }

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
}
