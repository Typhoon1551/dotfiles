import Quickshell
import QtQuick

Item {
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    readonly property string date: Qt.formatDateTime(clock.date, "MM/dd/yy")
    id: root

    Module {
        Text {
            anchors.centerIn: parent
            text: root.date
        }
    }
}
