import QtQuick 2.6
import QtQuick.Window 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4

Rectangle{

    property int valuespeed: 0
    property string gear: "D"
    property string batteryColorTop: "lightgreen"
    property string batteryColorMidTop: "green"
    property string batteryColorMidBottom: "green"
    property string batteryColorBottom: "lightgreen"
    property int batteryValue: 100
    property int range: 500
    property int speedangle: 210
    property int kwAngle: 90
    property int kwAngle2: 90

    function changeBatteryPower(value){
        batteryValue = value;

        if(value <15){
            batteryColorTop = "#ff4d4d"
            batteryColorMidTop = "#b30000"
            batteryColorMidBottom = "#b30000"
            batteryColorBottom = "#ff4d4d"

        }
        else if(value >= 15 && value <30){
            batteryColorTop = "#ffb84d"
            batteryColorMidTop = "#cc7a00"
            batteryColorMidBottom = "#cc7a00"
            batteryColorBottom = "#ffb84d"
        }
        else if(value >= 30 && value <50){
            batteryColorTop = "#ffff1a"
            batteryColorMidTop = "#cccc00"
            batteryColorMidBottom = "#cccc00"
            batteryColorBottom = "#ffff1a"
        }
        else if(value >= 50){
            batteryColorTop = "lightgreen"
            batteryColorMidTop = "green"
            batteryColorMidBottom = "green"
            batteryColorBottom = "lightgreen"
        }
    }




    id:outerRing
    anchors.centerIn: parent
    width: parent.width * 0.35
    height: parent.width * 0.35
    visible: true
    radius: width * 0.5
    gradient: Gradient {
                  GradientStop { position: 0.0; color: "white" }
                  GradientStop { position: 1.0; color: "black" }
              }

    Rectangle{
        id: innerRing
        anchors.centerIn: parent
        width: parent.width * 0.96
        height: parent.width * 0.96
        visible: true
        radius: width * 0.5
        gradient: Gradient{
                     GradientStop{ position: 0.0; color: "#727272" }
                     GradientStop{ position: 1.0; color: "white" }
        }


        Rectangle{
            id: outercircle
            anchors.centerIn: parent
            width: parent.width * 0.98
            height: parent.width * 0.98
            visible: true
            radius: width * 0.5
            color: "black"

            Text {
                id: gearText
                text: gear
                color: "white"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: parent.width * 0.05
                font.pointSize: outerRing.width * 0.08
            }



            RectangularGlow {
                    id: effect
                    anchors.fill: innerCircle
                    glowRadius: 30
                    spread: 0.1
                    color: "#7F82AA"
                    cornerRadius: innerCircle.radius
                }









            // speedneedle
            ProgressCircle {
                    anchors.centerIn: effect
                    size: outerRing.width * 0.9
                    colorCircle: "#2974bf"
                    colorBackground: "#ea1f2a"
                    arcBegin: speedangle-1
                    arcEnd: speedangle
                    lineWidth: outerRing.width * 0.15
                }



            //speedprogressbar
            ProgressCircle {
                    anchors.centerIn: effect
                    size: outerRing.width * 0.9
                    colorCircle: "#2974bf"
                    colorBackground: "#ea1f2a"
                    arcBegin: 210
                    arcEnd: speedangle
                    lineWidth: outerRing.width * 0.03
                }


/*

            //kwNeedleOrange
            ProgressCircle {
                    anchors.centerIn: effect
                    size: outerRing.width * 0.9
                    colorCircle: "#f06d00"
                    colorBackground: "#ea1f2a"
                    arcBegin: kwAngle
                    arcEnd: kwAngle+1
                    lineWidth: outerRing.width * 0.10
                }


*/


            //kwProgressbarOrange
            ProgressCircle {
                    anchors.centerIn: effect
                    size: outerRing.width * 0.9
                    colorCircle: "#f06d00"
                    colorBackground: "#ea1f2a"
                    arcBegin: kwAngle
                    arcEnd: 90
                    lineWidth: outerRing.width * 0.03
                }



/*
            ProgressCircle {
                    anchors.centerIn: effect
                    size: outerRing.width * 0.9
                    colorCircle: "green"
                    colorBackground: "#ea1f2a"
                    arcBegin: kwAngle2-1
                    arcEnd: kwAngle2
                    lineWidth: outerRing.width * 0.10
                }
*/



            ProgressCircle {
                    anchors.centerIn: effect
                    size: outerRing.width * 0.9
                    colorCircle: "green"
                    colorBackground: "#ea1f2a"
                    arcBegin: 90
                    arcEnd: kwAngle2
                    lineWidth: outerRing.width * 0.03
                }



            Image {
                id: tachoimage
                anchors.centerIn: parent
                width: parent.width * 0.96
                height: parent.height * 0.96
                source: "tacho.png"
            }










            Rectangle{
                id: innerCircle
                anchors.centerIn: parent
                width: parent.width * 0.5
                height: parent.width * 0.5
                visible: true
                radius: width * 0.5
                color: "#4B4C4B"
                gradient: Gradient{
                    GradientStop{ position: 0.0; color: "#686A7E" }
                    GradientStop{ position: 1.0; color: "#434558" }
                }
                border.color: "#D0D0D0"


                Text {
                    id: speedText
                    text: valuespeed
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.topMargin: parent.width * 0.02
                    color: "white"
                    font.pointSize: outerRing.width * 0.07
                }

                Text {
                    id: kmhText
                    text: "km/h"
                    anchors.top: speedText.bottom
                    anchors.topMargin: parent.height *-0.02
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "white"
                    font.pointSize: outerRing.width * 0.02
                }


                Rectangle{
                        id: batteryDisplay
                        width: outerRing.width * 0.35
                        height: outerRing.width * 0.07
                        color: "lightgray"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: kmhText.bottom
                        anchors.topMargin: parent.width*0.05
                        radius: 3

                        Text {
                            id: name
                            visible: false
                            text: batteryValue
                            anchors.centerIn: parent
                            z:2
                            color: "white"
                            font.pointSize: 7
                        }

                        ProgressBar {
                            id: batteryProgressbar
                            anchors.centerIn: parent
                            width: outerRing.width * 0.34
                            height: outerRing.width * 0.055
                            minimumValue: 0
                            maximumValue: 100
                            value:batteryValue
                            style: ProgressBarStyle {
                                    background: Rectangle {
                                        color: "#333333"
                                    }
                                    progress: Rectangle {
                                        height: outerRing.height * 0.06
                                        anchors.centerIn: parent
                                        gradient: Gradient {
                                            GradientStop { position: 0.0; color: batteryColorTop }
                                            GradientStop { position: 0.25; color: batteryColorMidTop }
                                            GradientStop { position: 0.75; color: batteryColorMidBottom }
                                            GradientStop { position: 1.00; color: batteryColorBottom }

                                        }
                                    }
                           }

                    }

                }


                Text {
                    id: rangeText
                    text: range
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: parent.height * 0.22
                    color: "white"
                    font.pointSize: outerRing.height * 0.02
                }

                Text {
                    id: kmText
                    color: "white"
                    font.pointSize: outerRing.height * 0.01
                    text: "Reichweite in km"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: rangeText.bottom

                }



            }




        }


    }

}
