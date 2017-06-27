import QtQuick 2.1
import QtQuick.Window 2.0

Window {
    visible: true
    width: 360
    height: 360

    x : 0;
    y : 0;
    MouseArea {
        anchors.fill: parent
        onClicked: {
            textid.color = "blue";
        }
    }

    Text {
        id : textid
        text: qsTr("Hello World")
        anchors.centerIn: parent
    }
}
