import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Window {
    id: emoWindow
    width: 300
    height: 300
    property alias image: newWindowEmotion.image
    property alias progress: newWindowEmotion.progress
    Rectangle{
        width: Math.min(emoWindow.width, emoWindow.height)
        //anchors.fill: parent
        Emotion{
            id: newWindowEmotion
            anchors.fill: parent
            anchors.margins: 10
            image: "qrc:/resources/sad-face.svg"
            progress: 0
            }
        }
    }
