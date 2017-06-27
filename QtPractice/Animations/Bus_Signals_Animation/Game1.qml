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

    Rectangle
    {
        id : rectSrc
        width: 100
        height: 100
        color: "blue"

        x : 10
        y: 10
        z : 10

        MouseArea
        {
            anchors.fill: parent
            drag.axis: Drag.XAndYAxis
            drag.target: rectSrc
        }

        onXChanged:
        {
            console.log("x,y Changed source (x,y) : (" + rectSrc.x + ","+rectSrc.y+") dest (x,y) : " +  "(" + rectdest.x + ","+rectdest.y+")")

            if((rectSrc.x >= rectdest.x) && (rectSrc.y >= rectdest.y))
            {
                rectSrc.color = "red"
                wonText.text = "Hey !!! You Wone ...!!!!"
            }
            else
            {
                rectSrc.color = "blue"
                wonText.text = "Hello Dear !! Welcome to the Game"
            }
        }

        onYChanged:
        {
            console.log("x,y Changed source (x,y) : (" + rectSrc.x + ","+rectSrc.y+") dest (x,y) : " +  "(" + rectdest.x + ","+rectdest.y+")")

            if((rectSrc.x >= rectdest.x) && (rectSrc.y >= rectdest.y))
            {
                rectSrc.color = "red"
                wonText.text = "Hey !!! You Wone ...!!!!"
            }
            else
            {
                rectSrc.color = "blue"
                wonText.text = "Hello Dear !! Welcome to the Game"
            }
        }
    }

    Rectangle
    {
        id : cirSrc
        width: 100
        height: 100
        color: "yellow"
        radius: 50
        x : 120
        y: 10
        z : 10

        MouseArea
        {
            anchors.fill: parent
            drag.axis: Drag.XAndYAxis
            drag.target: cirSrc
        }

        onXChanged:
        {
            console.log("x,y Changed source (x,y) : (" + cirSrc.x + ","+cirSrc.y+") dest (x,y) : " +  "(" + cirdest.x + ","+cirdest.y+")")
            if((cirSrc.x >= cirdest.x) && (cirSrc.y >= cirdest.y))
            {
                cirSrc.color = "red"
                wonText.text = "Hey !!! You Wone ...!!!!"
            }
            else
            {
                cirSrc.color = "yellow"
                wonText.text = "Hello Dear !! Welcome to the Game"
            }
        }

        onYChanged:
        {
            console.log("x,y Changed source (x,y) : (" + cirSrc.x + ","+cirSrc.y+") dest (x,y) : " +  "(" + cirdest.x + ","+cirdest.y+")")

            if((cirSrc.x >= cirdest.x) && (cirSrc.y >= cirdest.y))
            {
                cirSrc.color = "red"
                wonText.text = "Hey !!! You Wone ...!!!!"
            }
            else
            {
                cirSrc.color = "yellow"
                wonText.text = "Hello Dear !! Welcome to the Game"
            }
        }
    }

    Rectangle
    {
        id : cirdest
        width: 140
        height: 140
        radius: 70
        border.color: "grey"

        x : 500
        y : 300
    }

    Rectangle
    {
        id : rectdest
        width: 140
        height: 140
        border.color: "grey"

        x : 700
        y : 300
    }
}

