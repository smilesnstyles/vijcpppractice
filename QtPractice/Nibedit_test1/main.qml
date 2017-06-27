import QtQuick 2.4
import QtQuick.Window 2.1

Window {
    id: root
    visible: true
    width: 512
    height: 512


    MouseArea {
        property bool isMoving: false
        anchors.fill: parent

        onClicked: {
            //Stop movement of Item

        }
        Rectangle {
            id: m_red
            color:"red"
            x: 10
            y: 10
            width:100
            height:100

            states: [
                   State {
                       name: "red_color"
                       PropertyChanges { target: root; color: "red" }
                   },
                   State {
                       name: "blue_color"
                       PropertyChanges { target: root; color: "blue" }
                   }
               ]

            NumberAnimation on x{
                to: root.width - m_red.width -10
                duration: 800
            }
            NumberAnimation on y{
                to: root.height - m_red.height -10
                duration: 800

            }
        }
    }


}
