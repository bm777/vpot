import QtQuick 2.13
import QtGraphicalEffects 1.12

Item {
    id: root
    width: parent.width * 0.85
    height: parent.height * (1 - 0.055)
    property double from_long: 51.508867
    property double from_lat: -0.136301

    Text {id: menu_text
        text: "VACATION SPOTS FINDER"
        font{family: "Comfortaa"; pointSize: 8}
        color: "#47505B"
        x: parent.width * 0.07
        y: parent.height * 0.05
    }
    /////

    Choice {
        id: mosaic
        x: menu_text.x
        y: menu_text.y + menu_text.height * 2
        info: "mosaic view"
        selected: false
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                mosaic.color = "#10faa81a"
            }
            onExited: {
                mosaic.color = "transparent"
            }
            onClicked: {
                map.selected = false
                mosaic.selected = true
            }
        }
    }
    Choice {
        id: map
        x: mosaic.x + mosaic.width * 2
        y: menu_text.y + menu_text.height * 2
        info: "map view"
        selected: {
            return true
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                map.color = "#10faa81a"
            }
            onExited: {
                map.color = "transparent"
            }
            onClicked: {
                mosaic.selected = false
                map.selected = true

            }
        }
    }

    ///
    Text {id: cont
        text: "CONTINENT AND SUB-CONTINENTS"
        font{family: "Comfortaa"; pointSize: 8}
        color: "#47505B"
        x: parent.width * 0.07
        y: map.y + map.height * 2
    }
    //////
    Row {
        id: row
        spacing: 30
        height: 40
        y: cont.y + cont.height * 2.5
        x: parent.width >1500 ? mosaic.x : parent.width /2 - width/2

        Continent {
            id: oceania
            info: "Oceania"
            total: "15"
            selected: true
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: oceania.color = "#10faa81a"
                onExited: oceania.color = "#80292c3b"
                onClicked: {
                    oceania.selected = true
                    africa.selected = false
                    nord_america.selected = false
                    south_america.selected = false
                    europe.selected = false
                    asia.selected = false
                    earth.from_long = -24.122414
                    earth.from_lat = 137.683512
                    earth.change = true
                }
            }
        }
        Continent {
            id: africa
            info: "Africa"
            total: "11"
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: africa.color = "#10faa81a"
                onExited: africa.color = "#80292c3b"
                onClicked: {
                    oceania.selected = false
                    africa.selected = true
                    nord_america.selected = false
                    south_america.selected = false
                    europe.selected = false
                    asia.selected = false
                    earth.from_long = 6.02681
                    earth.from_lat = 23.443081
                    earth.change = true
                }
            }
        }
        Continent {
            id: nord_america
            info: "Nord America"
            total: "275"
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: nord_america.color = "#10faa81a"
                onExited: nord_america.color = "#80292c3b"
                onClicked: {
                    oceania.selected = false
                    africa.selected = false
                    nord_america.selected = true
                    south_america.selected = false
                    europe.selected = false
                    asia.selected = false
                    earth.from_long = 53.325337
                    earth.from_lat = -96.495953
                    earth.change = true
                }
            }
        }
        Continent {
            id: south_america
            info: "South America"
            total: "9"
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: south_america.color = "#10faa81a"
                onExited: south_america.color = "#80292c3b"
                onClicked: {
                    oceania.selected = false
                    africa.selected = false
                    nord_america.selected = false
                    south_america.selected = true
                    europe.selected = false
                    asia.selected = false
                    earth.from_long = 14.752769
                    earth.from_lat = -59.496291
                    earth.change = true
                }
            }
        }
        Continent {
            id: europe
            info: "Eurpe"
            total: "185"
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: europe.color = "#10faa81a"
                onExited: europe.color = "#80292c3b"
                onClicked: {
                    oceania.selected = false
                    africa.selected = false
                    nord_america.selected = false
                    south_america.selected = false
                    europe.selected = true
                    asia.selected = false
                    earth.from_long = 53.206043
                    earth.from_lat = 25.800119
                    earth.change = true
                }
            }
        }
        Continent {
            id: asia
            info: "Asia"
            total: "52"
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: asia.color = "#10faa81a"
                onExited: asia.color = "#80292c3b"
                onClicked: {
                    oceania.selected = false
                    africa.selected = false
                    nord_america.selected = false
                    south_america.selected = false
                    europe.selected = false
                    asia.selected = true
                    earth.from_long = 34.844050
                    earth.from_lat = 88.437397
                    earth.change = true
                }
            }
        }
    }

    ///// map
    Earth {
        id: earth
        y: row.y + row.height + 40
        x: mosaic.x
        width: parent.width * 0.8
        height: parent.height * 0.7
        visible: map.selected
//        from_long: -24.122414
//        from_lat: 137.683512
    }


    Loading {
        id: loading
        anchors.centerIn: earth
        visible: !earth.visible

    }

//292c3b


    SequentialAnimation {
        running: loading.visible
        loops: Animation.Infinite

        NumberAnimation {
            target: loading
            property: "rotation"
            to: 180
            duration: 2000
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            target: loading
            property: "rotation"
            to: 0
            duration: 2000
            easing.type: Easing.InOutQuad
        }
    }
}

