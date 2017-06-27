import QtQuick 2.1
import QtQuick.Window 2.0

Window {
    visible: true
    width: 600
    height: 600

    Item
    {
        width: parent.width
        height: parent.height



        Rectangle
        {
            anchors.centerIn: parent
            width: 400
            height: 100
            color: "red"
            border.color: "black"
            TextEdit
            {
                anchors.fill: parent
                verticalAlignment: TextEdit.AlignVCenter
                color: "white"
                focus: true
                cursorVisible: true
                inputMethodHints: Qt.ImhHiddenText

            }
        }

    }
}
