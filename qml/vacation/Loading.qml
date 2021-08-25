import QtQuick 2.0

Rectangle {
    id: root
    width: 300
    height: width
    color: "transparent"


//    Rectangle {
//        anchors.fill: parent
//    }
    Rectangle {id: green
        width: 50
        height: width
        color: "#3ba55d"
        x: parent.width / 2 - width - 3
        y: parent.height / 2 - height - 3
    }
    Rectangle {id: yellow
        width: 50
        height: width
        color: "#faa81a"
        x: parent.width / 2 + 3
        y: parent.height / 2 - height - 3
    }
    Rectangle {id: blue
        width: 50
        height: width
        color: "#05a3e3"
        x: parent.width / 2 + 3
        y: parent.height / 2 + 3
    }
    Rectangle {id: violet
        width: 50
        height: width
        color: "#6a379d"
        x: parent.width / 2 - width - 3
        y: parent.height / 2 + 3
    }

    property int begin: 50
    property int end: 70
    property int delay: 1000

    SequentialAnimation {
        running: root.visible
        loops: Animation.Infinite

        //// first
        ParallelAnimation {
            NumberAnimation {
                target: green
                property: "width"
                from: begin
                to: end
                duration: delay
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: blue
                property: "width"
                from: begin
                to: end
                duration: delay
                easing.type: Easing.InOutQuad
            }
        }
        ParallelAnimation {
            NumberAnimation {
                target: green
                property: "width"
                from: end
                to: begin
                duration: delay
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: blue
                property: "width"
                from: end
                to: begin
                duration: delay
                easing.type: Easing.InOutQuad
            }
        }

        //// second
        ParallelAnimation {
            NumberAnimation {
                target: yellow
                property: "width"
                from: begin
                to: end
                duration: delay
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: violet
                property: "width"
                from: begin
                to: end
                duration: delay
                easing.type: Easing.InOutQuad
            }
        }
        ParallelAnimation {
            NumberAnimation {
                target: yellow
                property: "width"
                from: end
                to: begin
                duration: delay
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: violet
                property: "width"
                from: end
                to: begin
                duration: 1000
                easing.type: Easing.InOutQuad
            }
        }
    }
}
