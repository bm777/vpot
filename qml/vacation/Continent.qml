import QtQuick 2.0

Rectangle {
    width: 160
    height: 40
    color: "#292c3b"
    border.color: selected ? "#80faa81a" : "transparent"
    property string info: "Oceania"
    property string total: "15"
    property bool selected: false
    radius: 2


    Text {
        text: info
        font{family: "Comfortaa"; pointSize: 12}
        anchors.centerIn: parent
        color: selected ? "#F3F3F3" : "#80F3F3F3"
    }
    Rectangle {
        visible: selected
        x: parent.width - width/2
        y: - height/2
        radius: width/2
        color: "#000000"
        width: parent.height * 0.9
        height: width
        Text {id: content
            text: total
            font{family: "Comfortaa"; pointSize: 11; bold: true}
            anchors.centerIn: parent
            color: "#05a3e3"
        }
    }

}
