import Quickshell
import QtQuick

    PanelWindow {
        anchors {
            top: true
            left: true
            right: true
        }
        color: "transparent"

        Row {
            anchors.centerIn: parent
            anchors.top: parent.top
            anchors.verticalCenter: parent.verticalCenter

            spacing: 10

            Rectangle {
                property real pad: 10
                implicitHeight: timedisp.implicitHeight + pad * 2
                implicitWidth: timedisp.implicitWidth + pad * 2
                radius: 5
                Text{
                    id: timedisp
                    anchors.centerIn: parent
                    text: Clock.date
                }
            }
            Rectangle {
                implicitHeight: 40
                color: "red"
                implicitWidth: 200
            }
            Module {
                Text {
                    anchors.centerIn: parent
                    text: Clock.time
                }
            }
            }
            implicitHeight: 50
        }

    

