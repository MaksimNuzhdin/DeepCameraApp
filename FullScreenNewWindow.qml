import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
Window {
    id: screenWindow
    width: 300
    height: 300
    property alias color: newScreen.color
    Rectangle
    {
        id: newScreen
        anchors.fill: parent
        color: "transparent"
    }
}
