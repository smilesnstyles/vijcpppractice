import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    visible: true
    width: 360
    height: 360

    Item {
        width: 300; height: 300

        Rectangle {
            id: rect
            width: 50; height: 50
            color: "red"

            Behavior on x { SpringAnimation { spring: 200; damping: 0.2 } }
            Behavior on y { SpringAnimation { spring: 200; damping: 0.2 } }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                rect.x = mouse.x - rect.width/2
                rect.y = mouse.y - rect.height/2
            }
        }
    }
}
