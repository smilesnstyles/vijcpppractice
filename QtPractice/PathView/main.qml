import QtQuick 2.1
import QtQuick.Window 2.0

Window {
    visible: true
    width: 800
    height: 600

    Rectangle
    {
        width : parent.width
        height: parent.height

        ListModel
        {
            id : myModel
            ListElement { nbr : "1" }
            ListElement { nbr : "2" }
            ListElement { nbr : "3" }
            ListElement { nbr : "4" }
            ListElement { nbr : "5" }
            ListElement { nbr : "6" }
            ListElement { nbr : "7" }
            ListElement { nbr : "8" }
            ListElement { nbr : "9" }
            ListElement { nbr : "10" }
            ListElement { nbr : "11" }
            ListElement { nbr : "12" }
        }

        Component
        {
            id: myDelegate
            Rectangle
            {
                width: 80
                height: 80

                color: myDelegate.PathView.isCurrentItem ? "red" : "black"
                border.color: "grey"

                //z : myDelegate.PathView.isCurrentItem ? 10 : -10

                Text
                {
                    id: nameText
                    text: nbr
                    font.pixelSize: 60
                    anchors.centerIn: parent
                    //color: myDelegate.PathView.isCurrentItem ? "red" : "black"
                }
            }
        }

        PathView
        {
            id : pathView
            anchors.fill: parent
            model: myModel
            delegate: myDelegate
            path: Path
            {
                startX: 200; startY: 240
                PathArc
                {
                    x : 200
                    y: 160
                    radiusX: 1
                    radiusY: 80
                }
                PathArc
                {
                    x : 200
                    y : 320
                    radiusX: 1
                    radiusY: 40
                    direction: PathArc.Counterclockwise
                }
                PathArc
                {
                    x : 400
                    y : 320
                    radiusX: 80
                    radiusY: 80
                    direction: PathArc.Counterclockwise
                }
                PathArc
                {
                    x : 400
                    y : 160
                    radiusX: 80
                    radiusY: 80
                }
            }

//            highlight: Component
//            {
//                Rectangle
//                {
//                    width: 90
//                    height: 90
//                    border.color: "black"
//                    visible: PathView.onPath;
//                }
//            }
        }

        MouseArea
        {

        }
    }
}
