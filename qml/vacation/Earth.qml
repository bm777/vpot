import QtQuick 2.0
import QtLocation 5.6
import QtPositioning 5.6


Rectangle {
    id: root
    width: parent.width * 0.8
    height: parent.height * 0.7
    property string fullscreen: "neutral"



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
        zoomLevel: 8 // 14



    }





}
