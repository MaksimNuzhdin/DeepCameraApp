import QtQuick

Rectangle {
    color: mainWindow.color
    MyLabel{
        id: sourceMenuHeader
        width: parent.width/1.5
        height: parent.height/10
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        text: 'Choose source'

    }
    Rectangle{
    id: seourceHolder
    width: mainWindow.width/2.5
    height: mainWindow.height * 0.45
    anchors.horizontalCenter: parent.horizontalCenter
    y: mainWindow.height*0.2
    color: "transparent"

    Column{
        id: ourceMenuColumn
        spacing: 10
        Switcher{
            id: cameraSrc
            width: seourceHolder.width
            height: mainWindow.height/10
            status: true
            text: "Camera"
            onClicked: {
                cameraSrc.status? cameraSrc.status = false : cameraSrc.status = true;
                if (cameraSrc.status)
                {
                    fileSrc.status = false;
                    youTubeSrc.status = false;
                    embededSrc.status = false;
                }
            }
            }
        Switcher{
            id: fileSrc
            text: "Video file"
            width: seourceHolder.width
            height: mainWindow.height/10
            status: false
            onClicked: {
                fileSrc.status? fileSrc.status = false : fileSrc.status = true;
                if (fileSrc.status)
                {
                    cameraSrc.status = false;
                    youTubeSrc.status = false;
                    embededSrc.status = false;
                }
            }
            }
        Switcher{
            id: youTubeSrc
            text: "YouTube"
            width: seourceHolder.width
            height: mainWindow.height/10
            status: false
            onClicked: {
                youTubeSrc.status? youTubeSrc.status = false : youTubeSrc.status = true;
                if (youTubeSrc.status)
                {
                    fileSrc.status = false;
                    cameraSrc.status = false;
                    embededSrc.status = false;
                }
            }
            }
        Switcher{
            id: embededSrc
            text: "Deep Camera"
            width: seourceHolder.width
            height: mainWindow.height/10
            status: false
            onClicked: {
                embededSrc.status? embededSrc.status = false : embededSrc.status = true;
                if (embededSrc.status)
                {
                    fileSrc.status = false;
                    youTubeSrc.status = false;
                    cameraSrc.status = false;
                }
            }
            }
        }
    }
    Buttons{
    id: backBtn
    text: "Back"
    width:seourceHolder.width
    height: mainWindow.height/10
    anchors.top: seourceHolder.bottom
    anchors.topMargin: backBtn.height
    anchors.horizontalCenter: parent.horizontalCenter
    onClicked: {
        stack.pop()
        }
    }

}
