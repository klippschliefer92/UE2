import QtQuick 2.0
import QtQuick.Window 2.3
import QtQuick.Controls 1.4


Window{
    id: dialControlWindow
    width: 200
    height: 250
    visible: true


    Slider{
        width: 150
        maximumValue: 210
        minimumValue: 0
        stepSize: 1
        onValueChanged: {
            dial.valuespeed = value
            dial.speedangle = 210 + value * 0.6696
        }
    }

    Slider{
        minimumValue: 0
        maximumValue: 100
        y:30
        value: 100
        width: 150
        onValueChanged: dial.changeBatteryPower(value)
    }

    Slider{
        minimumValue: 0
        maximumValue: 500
        value: 500
        stepSize: 1
        y: 60
        width: 150
        onValueChanged: {
            dial.range = value
        }
    }



    Slider{
        minimumValue: 0
        maximumValue: 89
        value: 89
        stepSize: 1
        y: 120
        width: 150
        onValueChanged: {
            dial.kwAngle = value
        }
    }


    Slider{
        minimumValue: 91
        maximumValue: 140
        value: 91
        stepSize: 1
        y: 150
        width: 150
        onValueChanged: {
            dial.kwAngle2 = value
        }
    }

    Rectangle{
        id: onButton
        y:200
        width: 50
        height: 50
        color: "green"
        MouseArea{
            anchors.fill: parent
            onClicked: trigger = true
        }
    }


    Rectangle{
        y:200
        anchors.left: onButton.right
        width: 50
        height: 50
        color: "red"
        MouseArea{
            anchors.fill: parent
            onClicked: trigger = false
        }
    }






}
