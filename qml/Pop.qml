import QtQuick 2.0

Rectangle {
    id: content
    width: content_label.width * 1.3
    height: content_label.height * 1.5
    property string infos: ""
    radius: 3
    visible: false
    color: "#000000"
    Text {id: content_label
        text: infos
        anchors.centerIn: parent
        font{family: "Comfortaa"; pointSize: 10}
        color: "#ffffff"
    }
    Behavior on visible {
        PropertyAnimation {duration: 100; }
    }
}
