import QtQuick 2.0

Rectangle {
    id: root
    width: rect.width + 15 + content.width
    height: 20
    property string info: "Mo"
    color: "transparent"
    property bool selected: false
    radius: height / 3

    Behavior on color {
        PropertyAnimation {duration: 100}
    }


    Rectangle{
        id: rect
        height: parent.height
        width: height
        radius: height/2
        color: "transparent"
        border.color: "#47505B"

        Rectangle{
            visible: selected
            height: parent.height * 1.5
            width: height
            radius: height/2
            color: "#803B3F43"
            anchors.centerIn: parent
            Rectangle{
                height: parent.height * 0.25
                width: height
                radius: height/2
                color: "#faa81a"
                anchors.centerIn: parent
            }
            Behavior on visible {
                PropertyAnimation {duration: 100}
            }
        }
    }



    Text {
        id: content
        text: info
        font{family: "Comfortaa"; pointSize: 11}
        color: selected ? "#F3F3F3" : "#80F3F3F3"
        anchors.verticalCenter: parent.verticalCenter
        x: rect.width + 10
    }
}
