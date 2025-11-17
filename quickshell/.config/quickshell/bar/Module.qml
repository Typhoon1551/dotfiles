import Quickshell
import QtQuick

Item {
    required default property var child

    property real padding: 10
    property real padx: padding
    property real pady: padding

    id: root

    implicitHeight: rect.implicitHeight
    implicitWidth: rect.implicitWidth

    Rectangle {
        implicitHeight: root.child.implicitHeight + root.pady * 2
        implicitWidth: root.child.implicitWidth + root.padx * 2
        radius: 5
        children: [root.child]
        id: rect
        color: ColorPalette.base
    }
}
