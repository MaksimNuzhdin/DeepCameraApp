import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
Rectangle {
    id:emoThis
    color: "transparent"

    property alias progress: cycle.progress
    property alias image: rectImage.source
    property alias text: emotionText.text
    signal click()


    Behavior on width {
        NumberAnimation {
            duration: 500 // Длительность анимации
            easing.type: Easing.InOutQuad // Тип сглаживания
        }
    }
    Behavior on height {
        NumberAnimation {
            duration: 500 // Длительность анимации
            easing.type: Easing.InOutQuad // Тип сглаживания
        }
    }
    MouseArea{
        id:mouseArea
        anchors.fill: parent
        hoverEnabled: true
        property int defaultWidth: parent.width
        property int defaultHeight: parent.height
        onEntered:
        {
            defaultHeight=parent.height;
            defaultWidth = parent.width;
            parent.height+=5;
            parent.width+=5;
        }
        onExited: {
            parent.height = defaultHeight;
            parent.width =defaultWidth;
        }

        onClicked: {

            emoThis.click()
        }
    }
    signal clicked()
    Rectangle{
        id: cycle
        width: parent.width
        height: parent.width
        radius: 100
        property int progress: 50
        gradient: Gradient{
            GradientStop{position: 0.0; color: "#c6c6c6"}
            GradientStop{position: 1.0; color: "#505050"}

        }
        Rectangle{
            id: progressRect
            width: cycle.width*(parent.progress/100)
            height: cycle.width*(parent.progress/100)
            anchors.centerIn: parent
            radius: 100
            gradient: Gradient {
                            GradientStop { position: 0.0; color: "#A5B6FF" }
                            GradientStop { position: 1.0; color: "#5272FF" }
                        }
            Behavior on width {
                NumberAnimation {
                    duration: 500 // Длительность анимации
                    easing.type: Easing.InOutQuad // Тип сглаживания
                }
            }

            Behavior on height {
                NumberAnimation {
                    duration: 500 // Длительность анимации
                    easing.type: Easing.InOutQuad // Тип сглаживания
                }
            }

        }

        Rectangle{
            Image {
                id: rectImage
                width: cycle.width
                height: cycle.height
                source: "qrc:/resources/happy-face.svg"
            }

        }
    }
    Rectangle{
        id: rectangleText
        width: parent.width
        height: parent.height-cycle.height
        anchors.top: cycle.bottom
        anchors.margins: 3
        gradient: Gradient{
            GradientStop{position: 0.0; color: "#838383"}
            GradientStop{position: 1.0; color: "#303030"}

        }
        Text{
            id:emotionText
            anchors.centerIn: parent
            text: ""
            color: "white"
        }
    }
}
