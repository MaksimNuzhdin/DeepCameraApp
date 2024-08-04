import QtQuick 2.15

Item
{
    id: root

    height: 40
    width: 200

    property alias name: nameLabel.text
    //property alias checked: switcher.checked

    Rectangle
    {
        radius: 12
        color: Qt.lighter("gray", 1.4)

        anchors.fill: parent
    }

    Text
    {
        id: nameLabel

        text: qsTr("Default name")
        color: "white"

        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.verticalCenter: parent.verticalCenter
    }

    // Switcher2
    // {
    //     id: switcher

    //     anchors.right: parent.right
    //     anchors.rightMargin: 20
    //     anchors.verticalCenter: parent.verticalCenter
    // }
}
