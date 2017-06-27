import QtQuick 2.1
import QtQuick.Window 2.0

Window {
    visible: true
    width: 600
    height: 600

    Item
    {
        anchors.fill: parent

        Rectangle
        {
            id : listViewContainer

            property real stepSize: (listView.contentHeight-listView.height)/(listViewContainer.height-scrollBar.height)

            anchors.centerIn: parent
            width: 200
            height: 400

            border.color: "grey"

            ListView
            {
                id : listView
                anchors.fill: parent
                clip : true
                boundsBehavior: Flickable.StopAtBounds
                header: myHeader
                delegate: myDelegate
                model : 10
            }

            Rectangle
            {
                id : listViewBorder
                border.color: "blue"
                border.width: 2
                color: "transparent"

                width: listView.width
                height: listView.height - listView.headerItem.height

                x : listView.x
                y: listView.y + listView.headerItem.height
            }

            Component
            {
                id : myHeader

                Rectangle
                {
                    width: listView.width
                    height: 50
                    color: "yellow"

                    Text
                    {
                        anchors.centerIn: parent
                        text : "Its My Header"
                        font.pixelSize: 20
                        color: "red"
                    }
                }
            }

            Component
            {
                id : myDelegate

                Rectangle
                {
                    width: listView.width
                    height: 100

                    Rectangle
                    {
                        width: parent.width -10
                        height: parent.height -10
                        anchors.centerIn: parent
                        border.color: "green"

                        Text
                        {
                            anchors.centerIn: parent
                            text : "Hello Index " + index
                            font.pixelSize: 30
                            color: "black"
                        }
                    }
                }
            }


        }

        Rectangle
        {
            width: 20
            height: listViewContainer.height

            anchors.top: listViewContainer.top
            anchors.left: listViewContainer.right
            border.color: "grey"

            Rectangle
            {
                id : scrollBar
                width: 18
                height:50
                x : 1
                color: "red"
                clip : true
                MouseArea
                {
                    anchors.fill: parent
                    drag.target: scrollBar
                    drag.axis: Drag.YAxis
                    drag.minimumY: 0
                    drag.maximumY: listViewContainer.height - scrollBar.height

                    onClicked:
                    {
                        console.log("maximum drag pixels : " + (listViewContainer.height - scrollBar.height))
                        console.log("maximum drag content pixels : " + (listView.contentHeight-listView.height))
                        console.log("step size for content movment : " + listViewContainer.stepSize)

                        console.log("current scrollbar y : " + scrollBar.y);
                        console.log("current contentY : " + listView.contentY);
                        console.log("current Border y : " + listViewBorder.y);
                    }
                }

                onYChanged:
                {
                    var prevY = listView.contentY
                    listView.contentY = (y * listViewContainer.stepSize)-50;

                    if(prevY < listView.contentY)
                    {
                        if(listViewBorder.y > 0)
                        {
                            listViewBorder.y -= (listView.contentY - prevY)
                            if(listViewBorder.y < 0)
                            {
                                listViewBorder.y = 0;
                            }

                            if(listViewBorder.height < listView.height)
                            {
                                listViewBorder.height += (listView.contentY - prevY)
                            }
                        }
                    }
                    else
                    {
                        if((listViewBorder.y < listView.headerItem.height) && (listView.contentY < 0))
                        {
                            listViewBorder.y += (prevY - listView.contentY)
                            listViewBorder.height -= (prevY - listView.contentY)

                        }
                    }
                }
            }

        }
    }
}
