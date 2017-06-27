import QtQuick 2.0

Rectangle {

    property alias gameName: gName.text
    property var gameInstance: undefined

    color: "lightgreen"
    width: 100
    height: 30
    border.color: "grey"
    Text
    {
        id : gName
        text : "Game 1"
        font.pixelSize: 20
        anchors.centerIn: parent
    }

    MouseArea
    {
        anchors.fill: parent

        onClicked:
        {
            gameInstance.visible = true;
        }
    }

    Connections
    {
        target : gameInstance
        onCloseGame:
        {
            console.log("closing Game");
            gameInstance.visible = false;
        }
    }
}

