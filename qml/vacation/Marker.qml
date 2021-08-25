import QtQuick 2.0
import QtLocation 5.12

MapQuickItem{
    id: marker
    anchorPoint.x: marker.width / 4
    anchorPoint.y: marker.height
    sourceItem: Rectangle {
        width: 50
        height: width
        radius: height/2
        color: "#403ba55d"

        Rectangle {
            anchors.centerIn: parent
            width: parent.width * 0.6
            height: width
            radius: height/2
            color: "#3ba55d"
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: parent.width = 24 - 5
                onExited: parent.width = 24 + 10
            }
            Behavior on width {
                NumberAnimation {duration: 300}
            }
        }
    }
}
