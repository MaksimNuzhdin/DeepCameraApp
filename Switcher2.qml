import QtQuick

Item
{
    id: root

    width: 40
    height: 20

    property bool checked: false
    property real radius: root.height / 2

    Rectangle
    {
        radius: root.radius
        color: checked ? "green" : "dimgray"

        anchors.fill: parent
    }

    Rectangle
    {
        id: groove

        x: checked ? root.width - width : 0
        height: parent.height
        width: height
        color: "black"
        scale: 0.7
        radius: root.radius

        anchors.verticalCenter: parent

        Behavior on x
        {
            NumberAnimation
            {
                duration: 160
                easing.type: Easing.InOutQuint
            }
        }
    }

    MouseArea
    {
        anchors.fill: parent
        anchors.margins: -5

        onClicked:
        {
            root.checked = !root.checked
        }
    }
}
