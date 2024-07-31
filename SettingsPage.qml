import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls

Rectangle {
    color: mainWindow.color
    MyLabel{
        id: settingsMenuHeader
        width: parent.width/1.5
        height: parent.height/10
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        text: 'Settings'
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
            Buttons{
                id: cameraSetting
                width: settingsHolder.width*0.7
                height: mainWindow.height/10
                anchors.leftMargin: settingsHolder.width*0.7*0.2
                text: "Choose Camera"
                }
            Buttons{
                id: fileSetting
                width: settingsHolder.width*0.7
                height: mainWindow.height/10
                text: "Choose File"
                }
            Buttons{
                id: urlSetting
                width: settingsHolder.width*0.7
                height: mainWindow.height/10
                text: "Choose URL"
                }
            Buttons{
                id: databaseSetting
                width: settingsHolder.width*0.7
                height: mainWindow.height/10
                text: "Open DataBase"
                }
            Switcher{
                id: reportSetting
                text: "Make Report"
                width: settingsHolder.width*0.7
                height: mainWindow.height/10
                status: false
                onClicked: {
                    reportSetting.status ? reportSetting.status=false : reportSetting.status = true;
                }
            }
            Switcher{
                id: recordVideo
                text: "Record Video"
                width: settingsHolder.width*0.7
                height: mainWindow.height/10
                status: false
                onClicked: {
                    recordVideo.status ? recordVideo.status=false : recordVideo.status = true;
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
