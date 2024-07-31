import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls

Rectangle
{
    color: mainWindow.color
    MyLabel{
        id: settingsMenuHeader
        width: parent.width/1.5
        height: parent.height/10
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        text: 'AI Controller'
    }
    Rectangle{
    id: settingsHolder
    width: settingsMenuHeader.width*0.8
    height: mainWindow.height * 0.45
    anchors.right: settingsMenuHeader.right
    y: mainWindow.height*0.2
    color: "transparent"
    ScrollView{
        id: settingsHolderScroll
        anchors.fill: settingsHolder
        Column{
            id: settingsMenuColumn
            spacing: 10
            Switcher{
                id: faceAnalyseSwither
                text: "Face analyse"
                width: settingsHolder.width*0.7
                height: mainWindow.height/10
                status: false
                onClicked: {
                    faceAnalyseSwither.status ? faceAnalyseSwither.status=false : faceAnalyseSwither.status = true;
                }
            }
            Switcher{
                id: faceDetectionSwither
                text: "Face detection"
                width: settingsHolder.width*0.7
                height: mainWindow.height/10
                status: false
                onClicked: {
                    faceDetectionSwither.status ? faceDetectionSwither.status=false : faceDetectionSwither.status = true;
                }
                }
            Switcher{
                id: objectDetectionSwither
                text: "Object detection"
                width: settingsHolder.width*0.7
                height: mainWindow.height/10
                status: false
                onClicked: {
                    objectDetectionSwither.status ? objectDetectionSwither.status=false : objectDetectionSwither.status = true;
                }
                }
            Switcher{
                id: handsControlSwitcher
                text: "Hands controller"
                width: settingsHolder.width*0.7
                height: mainWindow.height/10
                status: false
                onClicked: {
                    handsControlSwitcher.status ? handsControlSwitcher.status=false : handsControlSwitcher.status = true;
                }
                }
            Switcher{
                id: hightmareSwitcher
                text: "Hightmare"
                width: settingsHolder.width*0.7
                height: mainWindow.height/10
                status: false
                onClicked: {
                    hightmareSwitcher.status ? hightmareSwitcher.status=false : hightmareSwitcher.status = true;
                }
                }
            Switcher{
                id: rnnSwichter
                text: "Text generation"
                width: settingsHolder.width*0.7
                height: mainWindow.height/10
                status: false
                onClicked: {
                    rnnSwichter.status ? rnnSwichter.status=false : rnnSwichter.status = true;
                }
                }
            }
        }
    }
    Buttons{
    id: settingsBackBtn
    text: "Back"
    width:settingsHolder.width
    height: mainWindow.height/10
    anchors.top: settingsHolder.bottom
    anchors.topMargin: settingsBackBtn.height
    anchors.horizontalCenter: parent.horizontalCenter
    onClicked: {
        stack.pop()
        }
    }
}
