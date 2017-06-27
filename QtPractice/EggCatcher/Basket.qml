import QtQuick 2.0

Image
{
    id : basketImage
    source : "images/basketbig.png"
    width: 100
    height: 100
    smooth: true
    focus: true

    property var grandParent : undefined
    property int collectedEggsCount: 0

    property bool hasMouseControl: false

    Keys.onPressed:
    {
        if(event.key === Qt.Key_Right)
        {
            var tmp = basketImage.x + 10;
            if(tmp < grandParent.width - basketImage.width)
            {
                basketImage.x = tmp;
            }
            else
            {
                basketImage.x = grandParent.width - basketImage.width;
            }
        }
        else if(event.key === Qt.Key_Left)
        {
            var tmp1 = basketImage.x - 10;
            if(tmp1 > 0)
            {
                basketImage.x = tmp1;
            }
            else
            {
                basketImage.x = 0;
            }
        }

    }

    GridView
    {
        x : 15
        y : 50

        width: 60
        height: 60
        cellWidth: 13
        cellHeight: 10

        model: (basketImage.collectedEggsCount >= 7) ? 7 : basketImage.collectedEggsCount

        delegate: eggsPack
        rotation: 30
    }

    Component
    {
        id : eggsPack
        Image {
            source: "images/whiteegg.png"
            width: 10
            height: 10
        }
    }

    MouseArea
    {
        anchors.fill: parent
        drag.target: basketImage
        drag.axis: Drag.XAxis
        drag.minimumX: 0
        drag.maximumX: grandParent.width - basketImage.width

        onClicked:
        {
            console.log("basket has the control")
            basketImage.hasMouseControl = true;
        }
    }
}
