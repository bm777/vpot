import QtQuick 2.0
import QtLocation 5.6
import QtPositioning 5.6


Rectangle {
    id: root

    property double from_long: 51.508867
    property double from_lat: -0.136301

    property double inter_long: 51.508867
    property double inter_lat: -0.136301

    property bool change: false

//    onFrom_latChanged: move.running = true
//    onFrom_longChanged: move.running = true



    Plugin {
        id: plug
        name: "esri" // esri, mapboxgl, osm
    }

    ///////////////////////////////////////////////////////////////
    function addMarker(latitude, longitude)
        {
            var Component = Qt.createComponent("Marker.qml")
            var item = Component.createObject(root, {
                    coordinate: QtPositioning.coordinate(latitude, longitude)
                                              })
            map.addMapItem(item)
        }
    ///////////////////////////////////////////////////////////////////////
    Map {
        id: map
        height: parent.height
        width: parent.width
        anchors.centerIn: parent
        plugin: plug
        zoomLevel: 0 // 14

        center: {
            print(inter_long, inter_lat, zoomLevel)
            return QtPositioning.coordinate(inter_long, inter_lat)
        }


    }


    Timer {
        running: root.visible
//        repeat: true
        interval: 1000
        onTriggered: {
            addMarker(51.508867, -0.136301)
            addMarker(51.512927, -0.093446)
        }
    }

//    PropertyAnimation {
//        id: inter
//        target: map
//        property: "zoomLevel"
//        to: 0
//        duration: 3000
//        easing.type: Easing.InOutQuad
//    }

    SequentialAnimation {
        id: move
        running: change

        ///// zoom up
        NumberAnimation {
            target: map
            property: "zoomLevel"
            to: 0
            duration: 1500
            easing.type: Easing.InOutQuad
        }

        ///// change center
        ParallelAnimation {
            NumberAnimation {
                target: root
                property: "inter_long"
                to: from_long
                duration: 3000
                easing.type: Easing.InOutQuad
            }
            NumberAnimation {
                target: root
                property: "inter_lat"
                to: from_lat
                duration: 3000
                easing.type: Easing.InOutQuad
            }
            NumberAnimation { ///// zoom down
                target: map
                property: "zoomLevel"
                to: 4.2
                duration: 3000
                easing.type: Easing.InOutQuad
            }
        }

        ///// property change to false
        PropertyAnimation {
            target: root
            property: "change"
            to: false
            duration: 3

        }
    }

}
