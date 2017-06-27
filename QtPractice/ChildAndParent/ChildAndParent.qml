import QtQuick 2.0

Item {
    id: mainrect
    width: 600
    height: 600

    Rectangle
    {
        id: rect1
        width: 200
        height: 200


        color: "red"

        anchors.centerIn: parent
    }

    Rectangle
    {
        id:rect2
        width: 100
        height: 100
        radius: 50

        color: "green"

        //anchors.left: parent.left
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
            console.log("Mouse clicekd")
            if(rect2.parent == rect1)
            {
                rect2.parent = mainrect
            }
            else
            {
                rect2.parent = rect1;
            }
        }
    }


}

