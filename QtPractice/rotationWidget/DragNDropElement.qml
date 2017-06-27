import QtQuick 2.0

Item
{
    id : root

    property alias scrollModel: scrollView.model
    property string dropKeyString : "0"
    property var dragKeysList : ["-"]

    Component
    {
        id : scrollDelegate
        Rectangle
        {
            id: rect
            width: 100
            height: 100
            border.width: 2
            border.color: "black"
            radius: 5
            color: "green"

            property bool draggingEnabled : false

            onDraggingEnabledChanged:
            {
                if(draggingEnabled)
                {
                    rect.color = "lightgreen"
                }
                else
                {
                    rect.color = "green"
                }
            }

            Image
            {
                id : imgApp
                anchors.fill: parent
                source : iconRole
                visible: (iconRole !== "")
            }

            Text
            {
                anchors.centerIn: imgApp.visible? imgApp : parent
                text: textRole
                color: "white"
                font.pointSize: 32
            }

            MouseArea
            {
                id: mouseArea
                anchors.fill: parent
                drag.target: rect.draggingEnabled?dragTile:null

                property bool dragStatus: (drag.active) && (rect.draggingEnabled)
                property point beginDrag;

                Rectangle
                {
                    id : dragTile
                    width: 60
                    height: 60
                    border.width: 2
                    border.color: "black"
                    radius: 5
                    color: "green"
                    opacity: 0.0
                    z : 10

                    property bool caught: false
                    property int draggedItemIndex : -1;
                    property var copiedData;


                    Drag.active: (mouseArea.drag.active) && (rect.draggingEnabled)
                    Drag.keys: dragKeysList;

                    Image
                    {
                        id : tileImgApp
                        anchors.fill: parent
                        source : iconRole
                        visible: (iconRole !== "")
                    }

                    Text
                    {
                        anchors.centerIn: tileImgApp.visible? tileImgApp : parent
                        text: textRole
                        color: "white"
                        font.pointSize: 32
                    }
                }

                onPressed:
                {
                    console.log("listview width : " + flick.contentWidth);
                }

                onPressAndHold:
                {
                    rect.draggingEnabled = true;
                    dragTile.parent = root;
                    dragTile.x = mapToItem(root,mouse.x,mouse.y).x - dragTile.width/2
                    dragTile.y = mapToItem(root,mouse.x,mouse.y).y - dragTile.height/2
                    console.log("Mouse pressed and hold rect.draggingEnabled:  " + rect.draggingEnabled)
                    beginDrag = Qt.point(dragTile.x, dragTile.y);
                    dragTile.draggedItemIndex = index
                    dragTile.copiedData = scrollModel.get(index);

                }

                onReleased:
                {
                    if(rect.draggingEnabled)
                    {
                        console.log("mounse release caught : " + dragTile.caught)
                        if(!dragTile.caught)
                        {

                            backAnimX.from = dragTile.x;
                            backAnimX.to = beginDrag.x;
                            backAnimY.from = dragTile.y;
                            backAnimY.to = beginDrag.y;

                            console.log("tile moving from (" + backAnimX.from + "," + backAnimY.from + ") to (" + backAnimX.to + "," + backAnimY.to + ")")
                            backAnim.start()
                        }
                        else
                        {
                            dragTile.Drag.drop();
                        }
                        rect.draggingEnabled = false;
                    }
                }

                onDragStatusChanged:
                {
                    console.log("Drag Status : " + dragStatus );
                    if(!dragStatus)
                    {
                        console.log("caught Status : " + dragTile.caught );
                        if(dragTile.caught)
                        {
                            console.log("dargging finished")
                            scrollModel.remove(dragTile.draggedItemIndex);

                        }
                    }
                    else
                    {
                        root.z = 10;
                        dragTile.parent = root
                        dragTile.opacity = 0.5
                    }
                }
            }

            DropArea
            {
                id : dropArea
                anchors.fill: parent
                keys: dropKeyString
                onEntered:
                {
                    console.log("You entered");
                    drag.source.caught = true;

                }
                onExited:
                {
                    console.log("You exited");
                    drag.source.caught = false;
                }

                onDropped:
                {
                    console.log("You dropped main model item index : " + drag.source.draggedItemIndex);
                    console.log("Copied data : " + drag.source.copiedData["iconRole"])
                    scrollModel.insert(index,drag.source.copiedData);

                }
            }

            ParallelAnimation
            {
                id: backAnim
                NumberAnimation { id: backAnimX; target: dragTile; property: "x"; duration: 300; /*spring: 2; damping: 0.2*/ }
                NumberAnimation { id: backAnimY; target: dragTile; property: "y"; duration: 300; /*spring: 2; damping: 0.2*/ }

                onRunningChanged:
                {
                    if(!running)
                    {
                        dragTile.parent = mouseArea
                        dragTile.opacity = 0.0
                    }
                }
            }
        }
    }

    Flickable
    {
        id: flick;
        clip : true
        z : 10
        flickableDirection: Flickable.HorizontalFlick
        boundsBehavior: Flickable.StopAtBounds

        anchors.fill: parent

        contentHeight: scrollViewRowId.height
        contentWidth: scrollViewRowId.width
        width: root.width
        height: root.height

        //contentX: (contentWidth>root.width)? (contentWidth - root.width) : 0

        Row
        {
            id : scrollViewRowId

            Repeater
            {
                id : scrollView
                delegate: scrollDelegate
            }
        }
    }
}

