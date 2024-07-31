import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    color: "gray"
    title: qsTr("DeepCameraApp")

    StackView
    {
        id: stack
        anchors.fill: parent
        initialItem: mainComponenet
    }
    Component{
        id: srcWin
        SourceWindow{
            id:srcWindow
        }
    }
    Component{
        id: settingsWin
        SettingsPage{
            id:settingsWindow
        }
    }
    Component
    {
        id: aiSettings
        AIWindow
        {
            id: aiwin
        }
    }
    Component{
        id: mainComponenet
        Rectangle{
        //anchors.fill: mainWindow
        color: mainWindow.color

        function onAddTextItem(text){
            var dateTime = new Date().toLocaleString();
            Qt.createQmlObject('import QtQuick 2.15; Text { text: "' + dateTime  +' '+ text + '"; color: "black"; }', logColumn);
            }
        Rectangle{
           id: screen
           property bool isFullScreen: false
           radius: 10
           width: parent.width*0.7
           height: parent.height*0.7
           color: "#2a2a2a"
           x: 5
           y: 5

           MouseArea
           {
               id: screenArea
               anchors.fill: parent
               hoverEnabled: true
               onEntered:
               {
                    screenSettings.height = screen.height/10
               }
               onExited:
               {
                   if (!newScreenWindowBtn.containsMouse)
                   {
                       screenSettings.height = 0;
                   }
               }
           }
           Rectangle{
           id: screenSettings
           width:screen.width
           //height: screen.height/10
           //height: 0
           color:Qt.rgba(0,0,0,0.3)
           anchors.bottom: screen.bottom
           anchors.left: screen.left
           Behavior on width{
               NumberAnimation{
               duration: 300
               }
           }
           Behavior on height{
               NumberAnimation{
               duration: 300
               }
           }
           Rectangle{
            id: full_collapseScreen
            property bool isFullScreen: false
            property int widthDefault: full_collapseScreen.width
            property int heightDefault: full_collapseScreen.height
            width: parent.height
            height: parent.height

            color: "transparent"
            anchors.right: parent.right
            FullScreenNewWindow{
                id: screenWindow
                width: screen.width
                height: screen.height
                color: screen.color
            }
            Image{
                id: full_collapseScreenImage
                anchors.fill: parent
                sourceSize.width: parent.width
                sourceSize.height: parent.height
                source: "qrc:/resources/fullScreen.svg"
                }
            MouseArea{
                id: newScreenWindowBtn
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    screenSettings.height = screen.height/10
                    full_collapseScreen.widthDefault = full_collapseScreen.width
                    full_collapseScreen.heightDefault = full_collapseScreen.height
                    full_collapseScreen.width *= 1.1
                    full_collapseScreen.height *= 1.1

                    }
                onExited: {
                    if (!screenArea.containsMouse)
                    {
                        screenSettings.height = 0;
                    }

                    full_collapseScreen.width = full_collapseScreen.widthDefault
                    full_collapseScreen.height = full_collapseScreen.heightDefault
                    }
                onClicked: {
                    screenWindow.show()
                }
            }
            Behavior on width{
                NumberAnimation{
                duration: 300
                }
            }
            Behavior on height{
                NumberAnimation{
                duration: 300
                }
            }

        }
            }

        }


        Rectangle{
        id: cameraMenu
        anchors.left: screen.right
        anchors.margins: 5
        width: parent.width*0.27
        height: screen.height/2
        border.color: 'white'
        color: "transparent"
        //color: "red"
        radius: 20
        border.width: 1
        y:5

        Column
        {
            id: columnMenu
            y: parent.y+3
            height: parent.height
            width: parent.width
            spacing: 7
            Buttons{
            id: startBtn
            text: "Start"
            width:parent.width*0.8
            height:  parent.height/5
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                console.log("StartBtn")
                }
            }
            Buttons{
            id: stopBtn
            text: "Stop"
            width:parent.width*0.8
            height:  parent.height/5
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                console.log("StopBtn")
                }
            }
            Buttons{
            id: changeSurceBtn
            text: "Source"
            width:parent.width*0.8
            height:  parent.height/5
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                console.log("Source")
                stack.push(srcWin)
                }
            }
            Buttons{
            id: settingsBtn
            text: "Settings"
            width:parent.width*0.8
            height:  parent.height/5
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                onAddTextItem("Settings")
                stack.push(settingsWin)
                }
            }
        }
    }
        Buttons{
    id: aiController
    width: cameraMenu.width*0.8
    height:  cameraMenu.width*0.5
    anchors.top: cameraMenu.bottom
    anchors.horizontalCenter: cameraMenu.horizontalCenter
    anchors.topMargin: 10
    text: "AI"
    onClicked: {
        onAddTextItem("AI");
        stack.push(aiSettings)
        }
    }


        Rectangle{
        id: logholder
        width: screen.width
        height: parent.height*0.25
        anchors.top: screen.bottom
        anchors.margins: 5
        color: "#DDDDDD"
        x: screen.x
        radius: 10
        ScrollView{
            id:logScroll
            anchors.fill: parent
            Column{
                id: logColumn
                width: parent.width
                spacing: 3
                }
            }
        }
        Rectangle{
        id: emotionHolder
        width: cameraMenu.width
        height: parent.height*0.3
        anchors.bottom: logholder.bottom
        anchors.left: screen.right
        anchors.margins: 5
        radius: 10
        border.color: "white"
        border.width: 1
        color: "transparent"
        Emotion{
            id: sadBar
            width:parent.width/5
            height: parent.width/4.5
            anchors.top: parent.top
            anchors.right: parent.horizontalCenter
            anchors.margins: 5
            progress: 0
            image: "qrc:/resources/sad-face.svg"
            text: "Sad"
                EmotionNewWindow{
                id: sadWindow
                color: mainWindow.color
                width: mainWindow.width/4
                height: sadWindow.width
                image: sadBar.image
                progress: sadBar.progress
                }
                onClick: {
                    sadWindow.show();
                }
        }
        Emotion{
            id:happyBar
            width:parent.width/5
            height: parent.width/4.5
            anchors.top: parent.top
            anchors.right: sadBar.left
            progress: 0
            image: "qrc:/resources/happy-face.svg"
            anchors.margins: 5
            text: "Happy"
                EmotionNewWindow{
                id: happyWindow
                color: mainWindow.color
                width: mainWindow.width/4
                height: happyWindow.width
                image: happyBar.image
                progress: happyBar.progress
                }
                onClick: {
                    happyWindow.show();
                }
        }
        Emotion{
            id: angryBar
            width:parent.width/5
            height: parent.width/4.5
            anchors.top: parent.top
            anchors.left: parent.horizontalCenter
            anchors.margins: 5
            progress: 0
            image: "qrc:/resources/angry-face.svg"
            text: "Angry"
                EmotionNewWindow{
                id: angryWindow
                color: mainWindow.color
                width: mainWindow.width/4
                height: angryWindow.width
                image: angryBar.image
                progress: angryBar.progress
                }
                onClick: {
                    angryWindow.show();
                }
        }
        Emotion{
            id: disgustBar
            width:parent.width/5
            height: parent.width/4.5
            anchors.top: parent.top
            anchors.left: angryBar.right
            anchors.margins: 5
            progress: 0
            image: "qrc:/resources/disgust-face.svg"
            text: "Disgust"
                EmotionNewWindow{
                id: disgustWindow
                color: mainWindow.color
                width: mainWindow.width/4
                height: disgustWindow.width
                image: disgustBar.image
                progress: disgustBar.progress
                }
                onClick: {
                    disgustWindow.show();
                }
        }
        Emotion{
            id: fearBar
            width:parent.width/5
            height: parent.width/4.5
            anchors.top: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 5
            progress: 0
            image: "qrc:/resources/fear-face.svg"
            text: "Fear"
                EmotionNewWindow{
                id: fearWindow
                color: mainWindow.color
                width: mainWindow.width/4
                height: fearWindow.width
                image: fearBar.image
                progress: fearBar.progress
                }
                onClick: {
                    fearWindow.show();
                }
        }
        Emotion{
            id: neutralBar
            width:parent.width/5
            height: parent.width/4.5
            anchors.right: fearBar.left
            anchors.top: parent.verticalCenter
            anchors.margins: 5
            progress: 0
            image: "qrc:/resources/neutral-face.svg"
            text: "Neutral"
                EmotionNewWindow{
                id: neutralWindow
                color: mainWindow.color
                width: mainWindow.width/4
                height: neutralWindow.width
                image: neutralBar.image
                progress: neutralBar.progress
                }
                onClick: {
                    neutralWindow.show();
                }
        }
        Emotion{
            id: surprizeBar
            width:parent.width/5
            height: parent.width/4.5
            anchors.left: fearBar.right
            anchors.top: parent.verticalCenter
            anchors.margins: 5
            progress: 0
            image: "qrc:/resources/surprize-face.svg"
            text: "Surprize"
                EmotionNewWindow{
                id: surprizeWindow
                color: mainWindow.color
                width: mainWindow.width/4
                height: surprizeWindow.width
                image: surprizeBar.image
                progress: surprizeBar.progress
                }
                onClick: {
                    surprizeWindow.show();
                }
        }
    }
        }
    }
}
