import QtQuick 2.0

Rectangle {
    width: 360
    height: 360

    property int  angle: 290
    property bool  isaccelatoron: false
    property bool constructionComplete : false

    Rectangle
    {
        anchors.fill:parent
        radius: parent.width/2
        color: "yellow"
        border.color: "black"
    }

    Rectangle
    {
        id: niddle
        width: 100
        height: parent.height/2 -10
        color: "red"
        smooth: true
        x : 180
        y : 10
        antialiasing: true
        transformOrigin: Item.Bottom
        rotation: angle

        Image
        {
            anchors.fill : parent
            source: "speedometerpointer.png"
        }

    }

    Image {
        id: myImage
        source: "rpmmeter.png"
        width: 278
        height: 278

        Image
        {
            source: "rpmmeterglass.png"
            anchors.fill: parent
        }
    }

    Component.onCompleted:
    {
        constructionComplete = true;
    }

    Timer
    {
        id: speed
        interval: 10
        running: true;
        repeat: true
        onTriggered:
        {
            if(isaccelatoron)
            {
                if(angle != 430)
                    angle +=1;
            }
            else
            {
                if(angle != 290)
                    angle -= 1;
            }
        }
    }

    Item {
        anchors.fill: parent
        focus: true
        Keys.onPressed: {
            if (event.key == Qt.Key_Space) {
                isaccelatoron = true;
                event.accepted = true;
                console.log("interval " + speed.interval)
            }
        }

        Keys.onReleased: {
            if (event.key == Qt.Key_Space) {
                isaccelatoron = false;
                event.accepted = true;
            }
        }
    }


}

