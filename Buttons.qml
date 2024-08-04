import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Rectangle
{
    id: myButton
    radius: 20


    signal clicked
    property  alias text: btnText.text
    property alias buttonGradient: myButton.gradient
    property Gradient pressedGradient: Gradient {
                GradientStop { position: 0.0; color: "#ffffff" }
                GradientStop { position: 0.4; color: "#61637f" }
            }

    property Gradient defaultGradient: Gradient {
        GradientStop { position: 0.3; color: "#ffffff" }
        GradientStop { position: 1.0; color: "#C2C6FF" }
            }
    gradient: defaultGradient
    MouseArea {
                id: btnArea
               anchors.fill: parent
               onPressed:{
               myButton.gradient = myButton.pressedGradient
               }


               onReleased: {
                myButton.gradient = myButton.defaultGradient
               }
               onClicked: {
                   // Действие при клике на кнопку
                   myButton.clicked()
                   //console.log("Button clicked!")
               }
    }
    Text
    {
        id: btnText
        text: "start"
        anchors.centerIn: parent
        font.pixelSize: parent.height/2
    }
}
