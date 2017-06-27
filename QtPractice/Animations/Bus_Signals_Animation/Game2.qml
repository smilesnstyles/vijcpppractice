import QtQuick 2.0

Rectangle {

    anchors.fill : parent
    color: "black"

    signal closeGame;

    Text
    {
        id : wonText
        color: "red"

        font.pixelSize: 36

        text : "Hello Dear !! Welcome to the Game"

        width: parent.width
        height: 100

        anchors.bottom: parent.bottom

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Rectangle
    {
        width: 100
        height: 100

        color: "red"
        anchors.centerIn: parent

        PropertyAnimation on rotation
        {
            id : anim
            from : 0
            to : 270
            duration: 5000
            running: true
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                anim.start();
            }
        }
    }

    Rectangle
    {
        width: 50
        height: 50
        color: "black"
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        border.color: "grey"

        Text
        {
            text : "X"
            anchors.fill: parent
            color: "red"
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                closeGame();
            }
        }
    }
}

