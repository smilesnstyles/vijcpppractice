import QtQuick 2.0

Rectangle
{
    id : goodId
    width : 800
    height: 336

    color: "black"

    Rectangle
    {
        width : 600
        height: 336

        color: "black"

        anchors.top : parent.top
        anchors.left: parent.left

    }

    Rectangle
    {
        id : navRect
        width: 200
        height: 336

        color: "grey"

        opacity: 0.17

        anchors.top : parent.top
        anchors.left: parent.left

        z : 10

        MouseArea
        {
            anchors.fill: parent

            onClicked:
            {
                if(goodId.state == "setFav")
                {
                    goodId.state = "setSource"
                }
                else
                {
                    goodId.state = "setFav"
                }
            }
        }
    }

    state : ""

    states: [
        State
        {
            name: "setFav"
            AnchorChanges { target: navRect; anchors.left: undefined; anchors.right: parent.right }
            AnchorChanges { target: yellowId; anchors.left: navRect.left }
        },
        State
        {
            name: "setSource"
            AnchorChanges { target: navRect; anchors.right: undefined; anchors.left: parent.left }
            AnchorChanges { target: yellowId; anchors.left: navRect.right }
        }

    ]

    transitions: Transition
    {
        AnchorAnimation { duration: 1000 }
    }

    Rectangle
    {
        id : yellowId
        width : 600
        height: 336

        color : "black"

        anchors.left: navRect.right

        anchors.rightMargin: 200

    }
}

//Rectangle
//{
//    width: 400
//    height: 400

//    Component
//    {
//        id : myDelegate
//        Rectangle
//        {
//            height: 100
//            width: 100
//            color: "black"
//            border.color: "blue"
//            Text
//            {
//                anchors.fill : parent
//                text : (31 - index) + " "
//                horizontalAlignment: Text.AlignHCenter
//                verticalAlignment: Text.AlignVCenter
//                color: "red"
//            }
//        }
//    }

//    ListView
//    {
//        id : listView
//        model : 31
//        delegate: myDelegate

//        width: 100
//        height: 100
//        anchors.centerIn: parent
//        enabled: false

//        //interactive: false

//        onMovementEnded:
//        {
//            listView.positionViewAtIndex(listView.currentIndex,ListView.Visible);
//        }

//        clip : true

//        MouseArea
//        {
//            id : listMouse;
//            anchors.fill : parent

//        }

//    }

//    property bool mouseDown: false
//    property bool postionChange: false
//    property int x1: 0
//    property int y1: 0

//    property int x2: 0
//    property int y2: 0

//    property int acce: 0;

//    property double startTime : 0;
//    property double endTime : 0;

//    onMouseDownChanged:
//    {
//        if(mouseDown)
//            startTime = Date.now();
//        else
//            endTime = Date.now();
//    }

//    MouseArea
//    {
//        anchors.fill: parent

//        onPressed:
//        {
//            mouseDown = true;
//            x1 = mouse.x;
//            y1 = mouse.y;
//        }

//        onPositionChanged:
//        {
//            postionChange = true;
//            if(mouseDown)
//            {
//                x2 = mouse.x
//                y2 = mouse.y
//            }
//        }

//        onReleased:
//        {
//            mouseDown = false;

//            if(postionChange)
//            {

//                console.log("moused moved from (" + x1 + ","+y1+") to (" +x2 +"," +y2 +")");

//                var distance = Math.sqrt(((x2-x1)*(x2-x1))+((y2-y1)*(y2-y1)))

//                console.log("distance is : " + distance);

//                console.log("moused moved from " + startTime + " mSec to"+endTime +" mSec");

//                var ti = (endTime - startTime)/1000;
//                console.log("Total Duration is " + ti);

//                listView.forceActiveFocus();

//                //listView.flick(0,distance/ti);

//                var speed = (distance/ti)<300 ? 299:(distance/ti);
//                listView.highlightMoveVelocity = speed/4;

//                var limitUnit = 400;

//                console.log("Speed is " + speed);

//                if((y2 - y1) < 0)
//                {
//                    if((y2 - y1) < -20)
//                    {
//                        if(speed < limitUnit)
//                        {
//                            listView.incrementCurrentIndex();
//                        }
//                        else if(speed < (limitUnit*2))
//                        {
//                            for(var i=0; i < 2; i++)
//                                listView.incrementCurrentIndex();
//                        }
//                        else if(speed < (limitUnit*4))
//                        {
//                            for(i=0; i < 4; i++)
//                                listView.incrementCurrentIndex();
//                        }
//                        else if(speed < (limitUnit*6))
//                        {
//                            for(i=0; i < 6; i++)
//                                listView.incrementCurrentIndex();
//                        }
//                        else if(speed < (limitUnit*8))
//                        {
//                            for(i=0; i < 8; i++)
//                                listView.incrementCurrentIndex();
//                        }
//                        else
//                        {
//                            for(i=0; i < 10; i++)
//                                listView.incrementCurrentIndex();
//                        }

//                    }
//                }
//                else
//                {
//                    if((y2 - y1) > 20)
//                    {
//                        if(speed < limitUnit)
//                        {
//                            listView.decrementCurrentIndex();
//                        }
//                        else if(speed < (limitUnit*2))
//                        {
//                            for(var i=0; i < 2; i++)
//                                listView.decrementCurrentIndex();
//                        }
//                        else if(speed < (limitUnit*4))
//                        {
//                            for(i=0; i < 4; i++)
//                                listView.decrementCurrentIndex();
//                        }
//                        else if(speed < (limitUnit*6))
//                        {
//                            for(i=0; i < 6; i++)
//                                listView.decrementCurrentIndex();
//                        }
//                        else if(speed < (limitUnit*8))
//                        {
//                            for(i=0; i < 8; i++)
//                                listView.decrementCurrentIndex();
//                        }
//                        else
//                        {
//                            for(i=0; i < 10; i++)
//                                listView.decrementCurrentIndex();
//                        }

//                    }
//                }

//                postionChange = false;
//            }

//        }

//        onWheel:
//        {

//        }
//    }
//}

/*

// scroll bar
Rectangle
{
    width: 600
    height: 400

    ListView
    {
        id : myList
        model : myModel
        delegate: myDelegate

        width: 300
        height: 400

        clip: true;

        anchors.centerIn: parent

        boundsBehavior: ListView.StopAtBounds


        property real prevY : 0;
        property real maxYtoMove: myList.height - scrollbar.height;
        property real maxContentToMove :myList.contentHeight - myList.height;

        property real relativeYValue: maxYtoMove/maxContentToMove;




        onContentYChanged:
        {
            console.log(" Y : " + myList.contentY);

            // scroll y max to move is ListView.height - scrollbar.height
            //
            scrollbar.y += (myList.relativeYValue * (myList.contentY - myList.prevY))
            myList.prevY = myList.contentY;

        }

        onMovementStarted:
        {
            //scrollbar.visible = true
            scrollbar.scrollBarAnim = true;
        }

        onMovementEnded:
        {
            //scrollbar.visible = false
            scrollbar.scrollBarAnim = false;
        }

    }



    Rectangle
    {
        id : scrolbarBox
        visible: (scrollbar.opacity !== 0)
        width: 6
        height: myList.height
        border.color: "black"
        color: "silver"
        z : 2
        anchors.right: myList.right
        anchors.top : myList.top

        Rectangle
        {
            id : scrollbar
            width: 4

            height: myList.height * (myList.height/myList.contentHeight);

            //color: "purple"
            gradient: Gradient
            {
                GradientStop { position: 0.0; color: "red" }
                GradientStop { position: 0.33; color: "yellow" }
                GradientStop { position: 1.0; color: "green" }
            }

            anchors.left: parent.left
            anchors.leftMargin: 1

            //visible: false
            opacity: 0.0
            radius: 2
            visible : (myList.contentHeight > myList.height);

            property bool scrollBarAnim: false

            PropertyAnimation
            {
                id : scrAnim
                target: scrollbar
                property: "opacity"
                duration: 200
            }

            onScrollBarAnimChanged:
            {
                if(scrollBarAnim)
                {
                    scrAnim.to = 1.0

                }
                else
                {
                    scrAnim.to = 0.0
                }

                scrAnim.restart();
            }
        }
    }

    Component
    {
        id : myDelegate

        Rectangle
        {
            width: myList.width
            height: 40
            border.color: "black"
            Text
            {

                textFormat: Text.StyledText
                text : "<font color=\"blue\"><u>" + name + "</u></font> " + index
                color: "red"
            }

        }
    }

    ListModel
    {
        id : myModel
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }
        ListElement { name : "vijay" }

    }
}

*/
//Rectangle
//{

//    width: 800
//    height: 500

//    Component
//    {
//        id: gridButton

//        Rectangle
//        {
//            width : 200
//            height: 200
//            border.color: "red"
//            GridButton
//            {
//               anchors.fill: parent
//            }
//        }
//    }



//    GridView
//    {
//        width: 600
//        height: 400

//        cellHeight: 200
//        cellWidth: 200

//        delegate: gridButton
//        model : myModel
//    }

//    ListModel
//    {
//        id : myModel
//        ListElement { typeRole : "IconTextButton"; iconRole : "callHSTile.png"; textRole : "VIjaya"}
//        ListElement { typeRole : "IconTextButton"; iconRole : "callHSTile.png"; textRole : "VIjaya"}
//        ListElement { typeRole : "TextButton"; iconRole : "callHSTile.png"; textRole : "VIjaya"}
//        ListElement { typeRole : "IconTextButton"; iconRole : "callHSTile.png"; textRole : "VIjaya"}
//        ListElement { typeRole : "TextButton"; iconRole : "callHSTile.png"; textRole : "VIjaya"}
//        ListElement { typeRole : "IconTextButton"; iconRole : "callHSTile.png"; textRole : "VIjaya"}
//        ListElement { typeRole : "IconTextButton"; iconRole : "callHSTile.png"; textRole : "VIjaya"}
//    }

//}
//Rectangle
//{
//    width : 600
//    height: 400

//    Rectangle
//    {
//        width: 150
//        height: 80

//        anchors.centerIn: parent
//        border.color: "grey"
//        Text
//        {
//            text: "+878787877213821"
//            font.pixelSize: 27
//            color: "black"

//            anchors.fill: parent
//        }
//    }
//}

//Item
//{
//    width: 600
//    height: 400

//    Flickable
//    {
//        anchors.centerIn: parent
//        width: 400
//        height: 300

//        contentHeight: imageId.height
//        contentWidth:  imageId.width

//        boundsBehavior: Flickable.StopAtBounds
//        clip : true

//        Image {
//            id: imageId
//            height: 800
//            width: 400
//            source: "defaultContactHS.jpg"
//        }
//    }
//}

//Item
//{
//    id : scrollingWidgetId
//    width: 800
//    height: 200

//    property int slideDirection: 3 // 0 - No Slide, 1 - left only, 2 - right only, 3 - left and right
//    property int itemsFortheView: 6
//    property bool isHighlightNeeded: true

//    Image
//    {
//        width: 20
//        height: parent.height
//        id: imgLeftSideScrollerId

//        source: "qrc:/image/night/ic_expand_left.png"

//        anchors.left: parent.left
//        anchors.leftMargin: 5

//        anchors.top: parent.top
//        anchors.topMargin: 5

//        visible: slideDirection & 0x01

//        MouseArea
//        {
//            anchors.fill: parent

//            onPressed:
//            {
//                imgLeftSideScrollerId.source = "qrc:/image/night/ic_chevron_previous.png"
//            }

//            onReleased:
//            {
//                imgLeftSideScrollerId.source = "qrc:/image/night/ic_expand_left.png"
//            }

//            onClicked:
//            {
//                listViewId.incrementCurrentIndex();
//            }
//        }
//    }

//    Image
//    {
//        width: 20
//        height: parent.height
//        id: imgRightSideScrollerId

//        source: "qrc:/image/night/ic_expand_right.png"

//        anchors.right: parent.right
//        anchors.rightMargin: 5

//        anchors.top : parent.top
//        anchors.topMargin: 5

//        visible: slideDirection & 0x02

//        MouseArea
//        {
//            anchors.fill: parent

//            onPressed:
//            {
//                imgRightSideScrollerId.source = "qrc:/image/night/ic_chevron_next.png"
//            }

//            onReleased:
//            {
//                imgRightSideScrollerId.source = "qrc:/image/night/ic_expand_right.png"
//            }

//            onClicked:
//            {
//                listViewId.decrementCurrentIndex();
//            }
//        }
//    }

//    ListView
//    {
//        orientation: ListView.Horizontal

//        id : listViewId
//        model: 9
//        delegate: scrollerListDelegate
//        height: parent.height - 20
//        spacing: 5

////        width: parent.width - (imgLeftSideScrollerId.visible?imgLeftSideScrollerId.width:0) -
////               (imgRightSideScrollerId.visible?imgRightSideScrollerId.width:0)

//        anchors.top: parent.top
//        anchors.topMargin: 10

//        anchors.left: imgLeftSideScrollerId.visible?imgLeftSideScrollerId.right : parent.left
//        anchors.leftMargin: 5

//        anchors.right: imgRightSideScrollerId.visible? imgRightSideScrollerId.left : parent.right
//        anchors.rightMargin: 5

//        focus: true
//        z : -1


//    }



//    Component
//    {
//        id: scrollerListDelegate

//        Rectangle
//        {
//            width : (listViewId.width-30)/6
//            height: listViewId.height

//            Rectangle
//            {
//                id : scrollItemBorderId
//                width : (listViewId.width-30)/6
//                height: listViewId.height

//                border.color: "grey"

//                visible: index == listViewId.currentIndex && isHighlightNeeded

//             }
//            Rectangle
//            {
//                width : listViewId.width/6 - 10
//                height: listViewId.height - 10

//                anchors.verticalCenter: scrollItemBorderId.verticalCenter
//                anchors.horizontalCenter: scrollItemBorderId.horizontalCenter
//                color: "blue"
//            }


//        }

//    }

//}


//Item {

//    width: 600
//    height: 400

//    Image
//    {
//        id : phoneIcon
//        anchors.left: parent.left
//        anchors.leftMargin: 16
//        anchors.top : parent.top
//        anchors.topMargin: 24

//        width: 48
//        height: 48
//        rotation: 90
//        source: "callHSTile.png"

//        smooth: true
//    }

//    Text
//    {
//        id: callDuration
//        font.pointSize: 24

//        anchors.left: phoneIcon.right
//        anchors.leftMargin: 20

//        anchors.top : phoneIcon.top
//        anchors.topMargin: 5

//        text : "<call duration>"
//    }

//    Text
//    {
//        id: callerName
//        font.pointSize: 24
//        anchors.top : phoneIcon.bottom
//        anchors.topMargin: 24

//        anchors.left: parent.left
//        anchors.leftMargin: 40

//        text : "Nick Drader"
//    }

//    Text
//    {
//        id: callerNumber
//        font.pointSize: 16
//        anchors.top : callerName.bottom
//        anchors.topMargin: 32

//        anchors.left: parent.left
//        anchors.leftMargin: 40

//        text : "Phone Number"
//    }

//    Image
//    {
//        id : callerImage
//        anchors.right: parent.right
//        anchors.rightMargin: 16
//        anchors.top : parent.top
//        anchors.topMargin: 24

//        width: 200
//        height: 200

//        source: "defaultContactHS.jpg"
//    }


//    Row
//    {
//        spacing: 24
//        anchors.bottom: parent.bottom
//        anchors.bottomMargin: 24

//        anchors.left: parent.left
//        anchors.leftMargin: 16

//        anchors.rightMargin: 16

//        Rectangle
//        {
//            border.color: "grey"
//            width: 96
//            height: 96

//            Text {
//                text: qsTr("End\nCall")
//                anchors.centerIn: parent
//            }
//        }

//        Rectangle
//        {
//            border.color: "grey"
//            width: 96
//            height: 96

//            Text {
//                text: qsTr("Mute")
//                anchors.centerIn: parent
//            }
//        }

//        Rectangle
//        {
//            border.color: "grey"
//            width: 96
//            height: 96

//            Text {
//                text: qsTr("Add\nCall")
//                anchors.centerIn: parent
//            }
//        }
//        Rectangle
//        {
//            border.color: "grey"
//            width: 96
//            height: 96

//            Text {
//                text: qsTr("DTMF")
//                anchors.centerIn: parent
//            }
//        }
//        Rectangle
//        {
//            border.color: "grey"
//            width: 96
//            height: 96

//            Text {
//                text: qsTr("Transfer")
//                anchors.centerIn: parent
//            }
//        }

//    }



//}

