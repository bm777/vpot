import QtQuick 2.13
import QtQuick.Window 2.13
import QtGraphicalEffects 1.12
import "vacation"

Window {
    title: qsTr("vpot")
    width: 1400
    height: 800
    visible: true

    Rectangle {
        anchors.fill: parent
        color: "#191d23"
    }
    Rectangle {
        id: top
        width: parent.width
        height: parent.height * 0.055
        color: "#191d23"
        //// [1] logo
        Image {
            id: logo
            source: "../img/dclimate.png"
            height: 314 * 0.13
            width: height
            x: 10
            anchors.verticalCenter: parent.verticalCenter
        }

        //// [2] text
        Text {
            text: qsTr("DCLIMATE")
            font{family: "Comfortaa"; pointSize: 13}
            x: logo.x + logo.width + 10
            y: parent.height * 0.15
            color: "#ffffff"
        }
        Text {
            text: qsTr("SPOT FINDER")
            font{family: "Comfortaa"; pointSize: 8}
            x: logo.x + logo.width + 10
            y: parent.height * 0.58
            color: "#80ffffff"
        }

        //// [3] thema
        RectangularGlow{
            anchors.fill: thema_frame
            glowRadius: 10
            spread: 0.2
            color: "#10ffffff"
            cornerRadius: thema_frame.radius + glowRadius
        }
        Rectangle{
            anchors.verticalCenter: parent.verticalCenter
            width: 1
            height: parent.height * 0.6
            x: thema_frame.x - thema_frame.width * 0.4
            color: "#292c3b"
        }
        Rectangle {
            id: thema_frame
            height: parent.height * 0.7
            width: height
            anchors.verticalCenter: parent.verticalCenter
            radius: height/2
            x: parent.width - width * 1.5
            color: "#292c3b"
            Text {
                text: "D"
                anchors.centerIn: parent
                color: "#80ffffff"
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    th.visible = true
                    thema_frame.border.color = "#80000000"
                }

                onExited: {
                    th.visible = false
                    thema_frame.border.color = "transparent"
                }
            }
            Pop {
                id: th;
                infos: "Dark";
                x: -width - 5
                anchors.verticalCenter: parent.verticalCenter
            }
        }

    }
    DropShadow {
            anchors.fill: top
            horizontalOffset: 0
            verticalOffset: 1
            radius: 4
            samples: 5
            color: "#80000000"
            source: top
    }


    /// [4] left menu
    Rectangle{
        width: 1
        height: parent.height - top.height * 2
        x: parent.width * 0.15
        y: top.height * 2
        color: "#40272D3B"
    }
    Item {
        id: menu
        width: parent.width * 0.15
        height: parent.height - top.height
        y: parent.height * 0.1

        Text {id: memu_text
            text: "MENU"
            font{family: "Comfortaa"; pointSize: 8}
            color: "#47505B"
            x: parent.width * 0.15
            y: 5
        }

        Selection {
            id: vacation_menu
            y: memu_text.y + memu_text.height * 1.5
            info: "Vacation"
            src: "../img/umbrella.png"
            text_color: "#F3F3F3"
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    vacation_menu.back_color = "#80000000"
                }
                onExited: {
                    vacation_menu.back_color = "transparent"
                }
                onClicked: {
                    me_menu.text_color = "#f0797F8D"
                    vacation_menu.text_color = "#f3f3f3"

                    me_menu.src = "../img/person-grey.png"
                    vacation_menu.src = "../img/umbrella.png"
                }
            }
        }
        Selection {
            id: me_menu
            y: vacation_menu.y + vacation_menu.height
            info: "Me"
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    me_menu.back_color = "#80000000"
                }
                onExited: {
                    me_menu.back_color = "transparent"
                }
                onClicked: {
                    vacation_menu.text_color = "#f0797F8D"
                    me_menu.text_color = "#F3F3F3"

                    vacation_menu.src = "../img/umbrella-grey.png"
                    me_menu.src = "../img/person.png"
                }
            }
        }
    }

    ////
    Vacation {
        id: vacation
        x: menu.width
        y: top.height
        visible: vacation_menu.text_color == "#f3f3f3"
    }




}
