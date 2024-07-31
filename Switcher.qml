import QtQuick 2.15

Rectangle {
    property alias text: switcherText.text
    id: mainSwitcher
    gradient: status ? enableGradient : disableGradient
    radius: 20
    signal clicked
    property int animationDuration: 300
    property bool status: false
    property Gradient disableGradient: Gradient{
            GradientStop{position: 0.0; color:"#5B5B5B"}
            GradientStop{position: 0.9; color:"#DBDBDB"}
        }
    property Gradient enableGradient: Gradient{
            GradientStop{position: 0.0; color:"#78B563"}
            GradientStop{position: 0.9; color:"#A0F883"}
        }

    states: [State {
             name: "Enable"
             AnchorChanges {
                 target: switchPositioner;
                 anchors.horizontalCenter: switherSpace.right
             }
             PropertyChanges {
                 target: mainSwitcher;
                 //color: "yellow"
                 gradient: enableGradient;
             }
        }, State {
            name: "Disable"
            AnchorChanges {
                target: switchPositioner
                anchors.horizontalCenter: switherSpace.left
            }
            PropertyChanges {
                target: mainSwitcher;
                //color: "white"
                gradient: disableGradient;
            }
        }]
     state: status ? "Enable" : "Disable"
     transitions: Transition {
         // smoothly reanchor myRect and move into new position
         AnchorAnimation { duration: animationDuration }

         ColorAnimation {
             duration: animationDuration
         }
         PropertyAnimation{
             target: mainSwitcher;
             property: "gradient"
             duration: animationDuration
         }
     }
    Text{
        id: switcherText
        width: parent.width/2
        height: parent.height*0.8
        text: ""
        font.pixelSize: Math.min(parent.height/2, parent.width/5)
        verticalAlignment: Text.AlignVCenter
        anchors.left: parent.left
        anchors.leftMargin: switcherText.width/5
        anchors.verticalCenter: parent.verticalCenter
    }
    Rectangle{
        id: switherSpace
        color: "black"
        radius: 20
        width: parent.width/10
        height: parent.height/5
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: switcherText.anchors.leftMargin
    }
    Rectangle{
        id: switchPositioner
        color:"white"
        height:switherSpace.height*1.6
        width: switherSpace.width/2
        anchors.verticalCenter: switherSpace.verticalCenter
        anchors.horizontalCenter: mainSwitcher.status ? switherSpace.right : switherSpace.left
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {
            mainSwitcher.clicked();
            // if (parent.status == true)
            // {
            //     parent.status = false;
            // }
            // else
            // {
            //     parent.status = true;
            // }
        }
    }
}
