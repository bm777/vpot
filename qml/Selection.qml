import QtQuick 2.0

Rectangle {
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width
    height: 30
    color: "transparent"
    property string src: "../img/person-grey.png"
    property color back_color: "transparent"
    property color text_color: "#f0797F8D"

    Rectangle {id: back
        width: parent.width * 0.95
        height: parent.height
        color: back_color
        radius: 4
        anchors.horizontalCenter: parent.horizontalCenter
        Behavior on color {
            PropertyAnimation {duration: 200}
        }
    }

    property string info: "Vacation"

    Image {id: img
        source: src
        width: parent.height * 0.5
        height: width
        x: parent.width * 0.17
        anchors.verticalCenter: parent.verticalCenter
        Behavior on source {
            PropertyAnimation {duration: 200}
        }

    }

    Text {id: text_
        text: info
        font{family: "Comfortaa"; pointSize: 9}
        color: text_color
        anchors.verticalCenter: parent.verticalCenter
        x: img.x + img.width + 10

        Behavior on color {
            PropertyAnimation {duration: 500}
        }
    }


//            text_.color = "#F3F3F3"
//            if(info === "Vacation") src = "../img/umbrella.png"
//            if(info === "Me") src = "../img/person.png"

}
