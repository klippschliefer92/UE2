import QtQuick 2.6
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.4
import QtMultimedia 5.8

Window {
    visible: true
    visibility: Window.FullScreen
    width: 980  //1280
    height: 700 // 800
    title: qsTr("Kombiinstrument")
    color: "#282828"

    property bool trigger: false
    property bool trigger2: false
    property bool velocitytrigger: false
    property bool soundtrigger: false
    property bool kwtrigger: false

    Image {
        id: background
        source: "kombi_hintergrund.png"
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
    }


Dial{
    id: dial
    width: parent.width * 0.5
    height: parent.width * 0.5
    anchors.centerIn: parent
}


Rectangle {
    id: warningBorder
    anchors.fill: parent
    color: "transparent"
    border.width: 15
    border.color: "white"
    opacity: 0

}



Image {
    id: handsOnWheelImage
    anchors.right: parent.right
    anchors.rightMargin: 50
    anchors.verticalCenter: parent.verticalCenter
    width: 400
    height: 300
    source: "Manuell2.png"
    opacity: 0
}


Image {
    id: autopilotOn
    width: 400
    height: 400
    anchors.verticalCenter: parent.verticalCenter
    anchors.left: parent.left
    anchors.leftMargin: 50
    source: "autopilot.png"
    opacity: 1
}




// Animation 1 Blink
SequentialAnimation{
        id: animation1
        loops: Animation.Infinite
        running: trigger
        ParallelAnimation{
            loops: 1
            PropertyAnimation{target: handsOnWheelImage; properties: "opacity"; to:"1"; duration: 3}
            PropertyAnimation{target: autopilotOn; properties: "opacity"; to:"0"; duration: 3}
        }
        SequentialAnimation{
            loops: 15
            PropertyAnimation{target: warningBorder; properties: "opacity"; to:"1"; duration: 100}
            PropertyAnimation{target: warningBorder; properties: "opacity"; to:"1"; duration: 500}
            PropertyAnimation{target: warningBorder; properties: "opacity"; to:"0"; duration: 100}
            PropertyAnimation{target: warningBorder; properties: "opacity"; to:"0"; duration: 500}
        }
        SequentialAnimation{
            loops: 1
            PropertyAnimation{target: warningBorder; properties: "border.color"; to:"red"; duration: 3}
        }
        SequentialAnimation{
            loops: Animation.Infinite
            PropertyAnimation{target: warningBorder; properties: "opacity"; to:"1"; duration: 100}
            PropertyAnimation{target: warningBorder; properties: "opacity"; to:"1"; duration: 200}
            PropertyAnimation{target: warningBorder; properties: "opacity"; to:"0"; duration: 100}
            PropertyAnimation{target: warningBorder; properties: "opacity"; to:"0"; duration: 200}
        }

}





// Animation 2
SequentialAnimation{
    id: animation2
    loops: Animation.Infinite
    running: trigger2
    ParallelAnimation{
        loops: 1
        PropertyAnimation{target: autopilotOn; properties: "opacity"; to:"0"; duration: 3}
    }
    PropertyAnimation{target: handsOnWheelImage; properties: "opacity"; to:"1"; duration: 100}
    PropertyAnimation{target: handsOnWheelImage; properties: "opacity"; to:"1"; duration: 500}
    PropertyAnimation{target: handsOnWheelImage; properties: "opacity"; to:"0"; duration: 100}
    PropertyAnimation{target: handsOnWheelImage; properties: "opacity"; to:"0"; duration: 500}
}






SoundEffect {
        id: playSoundInfinte
        source: "warning.wav"
        loops: SoundEffect.Infinite
    }


SoundEffect {
    id: playSoundOnce
    source: "warning.wav"
    loops: 1
}



SequentialAnimation{
        id: velocityAnimation
        loops: 1
        running: velocitytrigger
        ParallelAnimation{
            PropertyAnimation{target: dial; properties: "valuespeed"; to:"20"; duration: 6000}
            PropertyAnimation{target: dial; properties: "speedangle"; to:"223"; duration: 6000}
        }
        ParallelAnimation{
            PropertyAnimation{target: dial; properties: "valuespeed"; to:"10"; duration: 4000}
            PropertyAnimation{target: dial; properties: "speedangle"; to:"217"; duration: 4000}
        }
        ParallelAnimation{
            PropertyAnimation{target: dial; properties: "valuespeed"; to:"60"; duration: 8000}
            PropertyAnimation{target: dial; properties: "speedangle"; to:"250"; duration: 8000}
        }
        ParallelAnimation{
            PropertyAnimation{target: dial; properties: "valuespeed"; to:"65"; duration: 3000}
            PropertyAnimation{target: dial; properties: "speedangle"; to:"253"; duration: 3000}
        }
        ParallelAnimation{
            PropertyAnimation{target: dial; properties: "valuespeed"; to:"90"; duration: 5000}
            PropertyAnimation{target: dial; properties: "speedangle"; to:"270"; duration: 5000}
        }
        ParallelAnimation{
            PropertyAnimation{target: dial; properties: "valuespeed"; to:"100"; duration: 5000}
            PropertyAnimation{target: dial; properties: "speedangle"; to:"277"; duration: 5000}
        }
        ParallelAnimation{
            PropertyAnimation{target: dial; properties: "valuespeed"; to:"115"; duration: 4000}
            PropertyAnimation{target: dial; properties: "speedangle"; to:"287"; duration: 4000}
        }
        ParallelAnimation{
            PropertyAnimation{target: dial; properties: "valuespeed"; to:"120"; duration: 6000}
            PropertyAnimation{target: dial; properties: "speedangle"; to:"290"; duration: 6000}
        }

}



SequentialAnimation{
    id: kwAnimation
    loops: 1
    running: kwtrigger

        PropertyAnimation{target: dial; properties: "kwAngle"; to:"65"; duration: 2000}
        PropertyAnimation{target: dial; properties: "kwAngle"; to:"60"; duration: 3700}
        PropertyAnimation{target: dial; properties: "kwAngle"; to:"90"; duration: 300}
        PropertyAnimation{target: dial; properties: "kwAngle2"; to:"120"; duration: 2000}
        PropertyAnimation{target: dial; properties: "kwAngle2"; to:"115"; duration: 1700}
        PropertyAnimation{target: dial; properties: "kwAngle2"; to:"90"; duration: 300}
        PropertyAnimation{target: dial; properties: "kwAngle"; to: "50"; duration: 2000}
        PropertyAnimation{target: dial; properties: "kwAngle"; to:"45"; duration: 4000}
        PropertyAnimation{target: dial; properties: "kwAngle"; to:"60"; duration: 3000}
        PropertyAnimation{target: dial; properties: "kwAngle"; to:"50"; duration: 3500}
        PropertyAnimation{target: dial; properties: "kwAngle"; to:"45"; duration: 1500}
        PropertyAnimation{target: dial; properties: "kwAngle"; to:"65"; duration: 3000}
        PropertyAnimation{target: dial; properties: "kwAngle"; to:"70"; duration: 2000}
        PropertyAnimation{target: dial; properties: "kwAngle"; to:"60"; duration: 3500}
        PropertyAnimation{target: dial; properties: "kwAngle"; to:"65"; duration: 3000}



}





Item {
    focus: true
    Keys.onPressed: {
        if (event.key == Qt.Key_1){
            trigger2 = true
            playSoundOnce.play()
        }
        if (event.key == Qt.Key_2){
            trigger = true
            playSoundInfinte.play()
        }
        if (event.key == Qt.Key_D){
            velocitytrigger = true
            kwtrigger = true
        }

    }
}





/*
DialControl{
    x: 30
    y: 40
}
*/

}


