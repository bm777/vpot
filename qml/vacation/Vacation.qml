import QtQuick 2.0

Item {
    id: root
    width: parent.width * 0.85
    height: parent.height * (1 - 0.055)

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
        selected: true
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
}