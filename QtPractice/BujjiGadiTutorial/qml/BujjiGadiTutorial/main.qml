import QtQuick 1.1

Rectangle {
    width: 360
    height: 360


    Text {
        id: myText
        color: "blue"
        font.pixelSize: 30
        anchors.centerIn: parent

        SequentialAnimation on scale {
                loops: 3//Animation.Infinite

                PropertyAnimation { from: 0; to: 25; duration:2000}
                PropertyAnimation { from: 25; to: 0 ; duration: 2000}

            }
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
           // Qt.quit();
        }
    }


    Item {
        anchors.fill: parent
        focus: true
        Keys.onPressed: {

                myText.text = event.text;
                console.log("move left");

                event.accepted = true;
        }
    }
}
