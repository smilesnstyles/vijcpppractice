import QtQuick 2.1
import QtQuick.Window 2.0

Window {
    visible: true
    width: 600
    height: 600

    Rectangle
    {
        anchors.fill: parent

        color: "red"

        Rectangle
        {
            id : topM
            width: 300
            height: 300

             anchors.centerIn: parent

             color: "blue"

             MouseArea
             {
                 anchors.fill: parent
                 onClicked: {
                     console.log("clicked")
                 }
             }
        }

        Rectangle
        {
            width: 100
            height: 100

            color: "green"

            anchors.centerIn: topM
        }



//        ListModel
//        {
//            id : myModel
//            ListElement {name : "raja1"}
//            ListElement {name : "raja2"}
//            ListElement {name : "raja3"}
//            ListElement {name : "raja4"}
//            ListElement {name : "raja5"}
//            ListElement {name : "raja6"}
//            ListElement {name : "raja7"}
//            ListElement {name : "raja8"}
//            ListElement {name : "raja9"}
//            ListElement {name : "raja10"}
//            ListElement {name : "raja11"}
//        }

//        Component
//        {
//            id : myDelegate

//            Rectangle
//            {
//                width: gridView.cellWidth
//                height: gridView.cellHeight
//                border.color: "black"

//                color: "yellow"

//                Text
//                {
//                    text : index
//                    anchors.centerIn: parent
//                }
//            }
//        }

//        Rectangle
//        {
//            id : gridViewBorder
//            width: 220
//            height: 420

//            border.color: "green"
//            border.width: 2
//            anchors.centerIn: parent
//            radius: 20
//            color: "red"


//        }

//            GridView
//            {
//                id : gridView

//                property int showGradiant: 0 // 0 - nogradient , 1 - half, 2 - full
//                width: 200
//                height: 400

//                anchors.centerIn: gridViewBorder

//                cellWidth: 100
//                cellHeight: 100

//                clip : true



//                model: myModel
//                delegate: myDelegate

//                Component.onCompleted:
//                {
//                    gridView.positionViewAtEnd();
//                    updateGradiantStyle();
//                }

//    //            onContentYChanged:
//    //            {
//    //                updateGradiantStyle();
//    //            }

//                onMovementStarted:
//                {
//                    gridView.showGradiant = 0;
//                }

//                onMovementEnded:
//                {
//                    updateGradiantStyle();
//                }

//                function updateGradiantStyle()
//                {
//                    var visibleItemIndexAtEnd = gridView.indexAt(gridView.contentX, gridView.contentY + gridView.height - 20);

//                    if(gridView.count % 2 != 0)
//                    {
//                        if(visibleItemIndexAtEnd === gridView.count-1)
//                            gridView.showGradiant = 1;
//                        else
//                            gridView.showGradiant = 2;
//                    }
//                    else
//                    {
//                        gridView.showGradiant = 2;
//                    }

//                }

//                Rectangle
//                {
//                    id : halfId
//                    width: gridView.cellWidth
//                    height: 20
//                    color: "red"
//                    opacity: 0.4

//                    anchors.bottom: parent.bottom
//                    anchors.left: parent.left

//                    visible: gridView.showGradiant === 1
//                }

//                Rectangle
//                {
//                    id : fullId
//                    width: gridView.cellWidth * (gridView.width/gridView.cellWidth)
//                    height: 20
//                    color: "red"
//                    opacity: 0.4

//                    anchors.bottom: parent.bottom
//                    anchors.left: parent.left

//                    visible: gridView.showGradiant === 2
//                }
//            }
    }
}
