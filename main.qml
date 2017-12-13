import QtQuick 2.6
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 1000
    height: 400
    title: qsTr("Kombiinstrument")
    color: "#282828"

    property bool trigger: false

    Image {
        id: background
        source: "kombi_hintergrund.png"
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
    }



Dial{
    id: dial
    width: 350
    height: 350
    anchors.centerIn: parent
}


Rectangle {
    id: opacityBox
    width: 400
    height: 300
    opacity: 0
    color: "lightsteelblue"
}


// Animation Blink
SequentialAnimation{
        id: selectanimationNavi
        loops: Animation.Infinite
        running: trigger
        PropertyAnimation{target: opacityBox; properties: "opacity"; to:"0"; duration: 100}
        PropertyAnimation{target: opacityBox; properties: "opacity"; to:"0"; duration: 500}
        PropertyAnimation{target: opacityBox; properties: "opacity"; to:"1"; duration: 100}
        PropertyAnimation{target: opacityBox; properties: "opacity"; to:"1"; duration: 500}
}



DialControl{
    x: 30
    y: 40
}


}


