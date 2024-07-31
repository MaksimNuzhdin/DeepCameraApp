import QtQuick 2.15

Rectangle{
    property alias text: labelText.text
    property Gradient grdientDefault: Gradient{
        GradientStop{position: 0.0; color: "#ffffff"}
        GradientStop{position: 0.5; color: "#a4a4a4"}
        GradientStop{position: 1.0; color: "#ffffff"}
        }
    radius: 20
    gradient: Gradient{
        GradientStop{position: 0.0; color: "#ffffff"}
        GradientStop{position: 1.0; color: "#97ABFF"}
        }
    Text {
        id: labelText
        text: qsTr("")
        height: parent.height
        width: parent.width*0.8
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        font.pixelSize: Math.min(parent.height/1.5, parent.width/12)
    }
    Rectangle{
        id: leftCycle
        height: parent.height/2
        width: leftCycle.height
        radius:100
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        gradient: grdientDefault

    }
    Rectangle{
        id: rightCycle
        height: leftCycle.height
        width: leftCycle.width
        radius: 100
        anchors.right:parent.right
        anchors.rightMargin: leftCycle.anchors.leftMargin
        anchors.verticalCenter: parent.verticalCenter
        gradient: grdientDefault
    }
}
