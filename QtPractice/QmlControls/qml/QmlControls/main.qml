import QtQuick 2.0
import QtQuick.Controls 1.0

ApplicationWindow {
    width: 600
    height: 600
    visible: true
    toolBar: ToolBar {
        Row
        {
           anchors.fill: parent
           ToolButton
           {
               iconSource: "C:/Users/Public/Pictures/Sample Pictures/desert.jpg"
           }

           ToolButton
           {
               iconSource: "C:/Users/Public/Pictures/Sample Pictures/desert.jpg"
           }
        }
    }

    menuBar: MenuBar {
        Menu
        {
            title: "file"
            MenuItem {text: "open"}
        }
    }
}
