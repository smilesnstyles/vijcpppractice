////import QtQuick 2.1
////import QtQuick.Controls 1.0
////import QtQuick.Window 2.0

////ApplicationWindow {
////    title: qsTr("Hello World")
////    width: 640
////    height: 480

////    Rectangle
////    {

////        PathView {
////            id: pathview
////            //pathItemCount: 3
////            anchors.fill: parent
////            model: ContactModel {}
////            delegate: delegate
////            path: Path {
////                startX: 100; startY: 120
////                PathAttribute { name: "iconScale"; value: 1.0 }
////                PathAttribute { name: "iconOpacity"; value: 1.0 }
////                PathAttribute { name: "zOrder"; value: 10 }
////                PathQuad { x: 100; y: 60; controlX: 50; controlY: 75 }
////                PathAttribute { name: "iconScale"; value: 0.0 }
////                PathAttribute { name: "iconOpacity"; value: 0.0 }
////                PathAttribute { name: "zOrder"; value: -10 }
////                PathQuad { x: 100; y: 120; controlX: 260; controlY: 75 }
////            }
////        }
////    }

////    Component {
////        id: delegate
////        Item
////        {
////            width: 110; height: 110
////            scale: PathView.iconScale
////            opacity: PathView.iconOpacity
////            z:PathView.zOrder
////            Column {
////                id: wrapper
////                Rectangle {
////                    width: 80; height: 80;
////                    anchors.horizontalCenter: nameText.horizontalCenter
////                    radius: 40;
////                    border.color: "black"
////                    color: "yellow"
////                    Text
////                    {
////                        anchors.centerIn: parent
////                        text : name[0] + "";
////                        font.bold: true;
////                        font.pointSize: 30
////                    }
////                }
////                Text {
////                    id: nameText
////                    text: name
////                    font.pointSize: 16
////                    color: wrapper.PathView.isCurrentItem ? "red" : "black"
////                }
////            }
////        }
////    }

////    Timer
////    {
////        id: timer
////        interval: 1000;
////        running: true;
////        repeat: true;

////        onTriggered:
////        {
////            pathview.incrementCurrentIndex();
////        }
////    }


////    menuBar: MenuBar {
////        Menu {
////            title: qsTr("File")
////            MenuItem {
////                text: qsTr("Exit")
////                onTriggered: Qt.quit();
////            }
////        }
////    }

//////    Button {
//////        text: qsTr("Hello World")
//////        anchors.horizontalCenter: parent.horizontalCenter
//////        anchors.verticalCenter: parent.verticalCenter
//////    }
////}

//// Carousel0.qml
//import QtQuick 2.0

//PathView {
// id: view
// width: 640
// height: 360
// model: 32
// delegate: Text { text: index }
// property int pathMargin: 50
// property real rx: ry // view.width / 2 - pathMargin
// property real ry: view.height / 2 - pathMargin
// property real magic: 0.551784
// property real mx: rx * magic
// property real my: ry * magic
// property real cx: view.width / 2
// property real cy: view.height / 2
// path: Path {
//  startX: view.cx + view.rx; startY: view.cy
//  PathCubic { // first quadrant arc
//  control1X: view.cx + view.rx; control1Y: view.cy + view.my
//  control2X: view.cx + view.mx; control2Y: view.cy + view.ry
//  x: view.cx; y: view.cy + view.ry
//  }
//  PathCubic { // second quadrant arc
//  control1X: view.cx - view.mx; control1Y: view.cy + view.ry
//  control2X: view.cx - view.rx; control2Y: view.cy + view.my
//  x: view.cx - view.rx; y: view.cy
//  }
//  PathCubic { // third quadrant arc
//  control1X: view.cx - view.rx; control1Y: view.cy - view.my
//  control2X: view.cx - view.mx; control2Y: view.cy - view.ry
//  x: view.cx; y: view.cy - view.ry
//  }
//  PathCubic { // forth quadrant arc
//  control1X: view.cx + view.mx; control1Y: view.cy - view.ry
//  control2X: view.cx + view.rx; control2Y: view.cy - view.my
//  x: view.cx + view.rx; y: view.cy
//  }
// }
//}

import QtQuick 2.0
Rectangle
{
    width: 640; height: 480
    color: "#222222"
    GridView
    {
        id: grid
        interactive: false
        anchors {
            topMargin: 60; bottomMargin: 60
            leftMargin: 140; rightMargin: 140
            fill: parent
        }
        cellWidth: 120; cellHeight: 120;
        model: WidgetModel { id: icons }
        delegate: IconItem { }
        MouseArea {

            property int currentId : -1;  // Original position in model
            property int newIndex // Current Position in model
            property int index: grid.indexAt(mouseX, mouseY) // Item underneath cursor
            id: loc
            anchors.fill: parent
            onPressAndHold: currentId = icons.get(newIndex = index).gridId
            onReleased: currentId = -1;
            onMouseXChanged:
                if (loc.currentId [[Image !== -1 && index !== -1 && index ]]=== -1 && index != newIndex)
                    icons.move(newIndex, newIndex = index, 1)
        }
    }
}
