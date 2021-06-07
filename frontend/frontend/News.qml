import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.15

ColumnLayout {
    width: parent.width
    height: parent.height
    property var news: []
    property int currentNewsIdx: 0

    function request(url, callback) {
        callback(undefined);
        console.log("test")
       /*var xhr = new XMLHttpRequest();
       xhr.onreadystatechange = (function(myxhr) {
           return function() {
               if(myxhr.readyState === 4) callback(myxhr)
           }
       })(xhr);
       xhr.open('GET', url, true);
       xhr.send('');
       */
   }

    Timer {
       interval: 10000
       running: true
       repeat: true
       triggeredOnStart: true
       id: weatherTimeSlide
       onTriggered: {
           currentNewsIdx = currentNewsIdx < news.length - 1 ? currentNewsIdx + 1 : 0
       }
    }

    Timer {
        interval: 60000
        running: true
        repeat: true
        triggeredOnStart: true
        id: weatherTimeApi
        onTriggered: {
            request(
                'http://localhost:5001/news',
                function (res) {
                    var responseBody = JSON.parse("{\"payload\":[{\"name\":\"Wygraj bezpłatne studia - konkurs „Talenty na UMCS” dla obcokrajowców\",\"date\":\"17.05.21\",\"type\":\"OGÓLNY\",\"color\":\"#9399a5\",\"photo_link\":\"https://phavi.umcs.pl/ph/c,270,164,t,c/agicon/c/2021/0517/990574860a26636e360e.png\",\"text\":\"Od maja 2021 roku na UMCS rusza nowa edycja programu skierowanego do obcokrajowców interesujących się Polską oraz pragnących podjąć nieodpłatne studia. Na każdym z 12 wydziałów wybrane zostały kierunki, na których odbywanie kształcenia prowadzone będzie bez odpłatności i świadczeń stypendialnych.\"},{\"name\":\"Podcast \\\"co słychać?\\\"\",\"date\":\"17.05.21\",\"type\":\"WPiD\",\"color\":\"#9399a5\",\"photo_link\":\"https://phavi.umcs.pl/ph/c,270,164,t,c/agicon/c/2021/0517/800498460a262134e789.png\",\"text\":\"Kolejna medioznawcza podróż po świecie dźwięków i fonii w podcaście\\\\xa0z cyklu \\\"Co słychać\\\". Tym razem nasi doktoranci i pracownicy Justyna Kusto, Krystian Nowak i Piotr Celiński próbują przeciskać się pomiędzy szumami i zniekształceniami, starając się zrozumieć\\\\xa0różnicę pomiędzy utopią sygnału, intencjami nadawców i możliwościami mediów. Słyszą światełko w tunelu, ale nie są pewni, czy w natłoku głuchych uliczek i przeszkód uda się tam dojść.\"},{\"name\":\"Wykład: \\\"Sejm Czteroletni i Konstytucja 3 maja...\\\"\",\"date\":\"17.05.21\",\"type\":\"WPiD\",\"color\":\"#9399a5\",\"photo_link\":\"https://phavi.umcs.pl/ph/c,270,164,t,c/agicon/c/2021/0517/388384960a254a2ae383.jpg\",\"text\":\"Zarząd Lubelskiego Oddziału Polskiego Towarzystwa Nauk Politycznych serdecznie zaprasza na wykład prof. dr. hab. Dariusza Kupisza pt. Sejm Czteroletni i Konstytucja 3 maja - łagodna rewolucja czy przewrót?\"},{\"name\":\"Język angielski dla osób z niepełnosprawnością\",\"date\":\"17.05.21\",\"type\":\"STUDENT\",\"color\":\"#4bbe9d\",\"photo_link\":\"https://phavi.umcs.pl/ph/c,270,164,t,c/multimedia/2020/0305/115726-tablica.jpg\",\"text\":\"Uwaga! Zapisy przedłużone do 21 majaZespół ds. Wsparcia Osób z Niepełnosprawnościami serdecznie zaprasza do wzięcia udziału w grupowych zajęciach z języka angielskiego na poziomie B1/B2 dla studentów i doktorantów z niepełnosprawnościami (definicja osoby z niepełnosprawnością). Celem zajęć jest przygotowanie do egzaminu na poziomie B2.\"},{\"name\":\"Listy ze szlaku Magellana\",\"date\":\"17.05.21\",\"type\":\"OGÓLNY\",\"color\":\"#9399a5\",\"photo_link\":\"https://phavi.umcs.pl/ph/c,270,164,t,c/agicon/c/2021/0516/615079860a1847fdeaf1.png\",\"text\":\"„Listy ze szlaku Magellana” to projekt Centrum Języka Portugalskiego/Camões w Lublinie wpisujący się w obchody 500-lecia pierwszej morskiej wyprawy dookoła świata.\"},{\"name\":\"Data Science (studia II stopnia prowadzone w j. angielskim)\",\"date\":\"17.05.21\",\"type\":\"KANDYDAT\",\"color\":\"#ff6600\",\"photo_link\":\"https://phavi.umcs.pl/ph/c,270,164,t,c/agicon/c/2021/0517/323463860a23a3dd3dc1.jpg\",\"text\":\"Serdecznie zapraszamy do studiowania na najnowszym kierunku na Wydziale Ekonomicznym UMCS - DATA SCIENCE.\"},{\"name\":\"Drugi konkurs XVII Lubelskiego Festiwalu Nauki – „Discover the world with Polish scientists!”\",\"date\":\"17.05.21\",\"type\":\"LUBLIN\",\"color\":\"#dc462d\",\"photo_link\":\"https://phavi.umcs.pl/ph/c,270,164,t,c/agicon/c/2021/0517/484594860a23263202d9.png\",\"text\":\"Organizatorzy XVII Lubelskiego Festiwalu Nauki, który odbędzie się w dniach 18–24 września 2021 roku pod hasłem „Nauka bez granic. Enjoy science!”, serdecznie zapraszają do udziału w drugim z cyklu konkursów w ramach całego wydarzenia! „Discover the world with Polish scientists!” to konkurs, który polega na znalezieniu nowego, praktycznego zastosowania dla polskiego wynalazku.\"},{\"name\":\"Wsparcie osób z niepełnosprawnościami\",\"date\":\"17.05.21\",\"type\":\"CENTRUM PRASOWE\",\"color\":\"#9399a5\",\"photo_link\":\"https://phavi.umcs.pl/ph/c,270,164,t,c/agicon/c/2021/0517/724520960a232c8a32f5.png\",\"text\":\"Na UMCS działa Zespół ds. wsparcia osób z niepełnosprawnościami, którego misją jest integracja osób z niepełnosprawnościami ze środowiskiem akademickim, wyrównanie szans edukacyjnych, likwidowanie barier oraz przeciwdziałanie wykluczeniu, a także dostosowanie procesu dydaktycznego do studentów/doktorantów o różnych potrzebach wynikających ze stanu zdrowia.\"},{\"name\":\"Stypendium marszałka województwa lubelskiego\",\"date\":\"17.05.21\",\"type\":\"CENTRUM PRASOWE\",\"color\":\"#9399a5\",\"photo_link\":\"https://phavi.umcs.pl/ph/c,270,164,t,c/agicon/c/2021/0517/313346560a22873ad168.jpg\",\"text\":\"Miło nam poinformować, że studenci z Uniwersytetu Marii Curie-Skłodowskiej znaleźli się w gronie stypendystów marszałka województwa lubelskiego. 13 maja br. odbyła się konferencja z udziałem wybranych studentów, na ręce których marszałek Jarosław Stawiarski przekazał symboliczne czeki.\"},{\"name\":\"Germanistyka - \\\"21 kierunków w 21 dni\\\"\",\"date\":\"17.05.21\",\"type\":\"WH\",\"color\":\"#9399a5\",\"photo_link\":\"https://phavi.umcs.pl/ph/c,270,164,t,c/agicon/c/2021/0513/7960055609d171d44226.jpg\",\"text\":\"Łatwo przychodzi Ci nauka języka obcego, ale niekoniecznie musi to być język angielski? Interesuje Cię kultura, literatura, historia czy język naszych zachodnich sąsiadów? Chcesz mieć zapewniona pracę po studiach? Jeżeli tak, to mamy dla ciebie tylko jedną propozycję… Germanistyka w UMCS!\"},{\"name\":\"MakeLearn & TIIM 2021 Conference - zaproszenie\",\"date\":\"17.05.21\",\"type\":\"OGÓLNY\",\"color\":\"#9399a5\",\"photo_link\":\"https://phavi.umcs.pl/ph/c,270,164,t,c/multimedia/2015/1021/103106-zdjecie-mezczyzny-rysujacego-na-mapie-swiata.jpg\",\"text\":\"Szanowni Państwo, pracownicy, doktoranci i studenci UMCS,\"},{\"name\":\"Zaproszenie na wystawę oraz finisaż „Moje mitologie” Grzegorza Dobiesława Mazurka\",\"date\":\"17.05.21\",\"type\":\"WA\",\"color\":\"#9399a5\",\"photo_link\":\"https://phavi.umcs.pl/ph/c,270,164,t,c/agicon/c/2021/0517/629015960a213da3aac7.jpg\",\"text\":\"Grzegorz Dobiesław Mazurek – uprawia grafikę, malarstwo, fotografię. Studiował na Wydziale Grafiki Akademii Sztuk Pięknych w Warszawie w latach 1975-1980. Dyplom z grafiki obronił z wyróżnieniem pod kierunkiem prof. Haliny Chrostowskiej w 1980 r., zaś aneks z malarstwa –\\\\xa0 w pracowni prof. Eugeniusza Markowskiego.\"}]}");
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
