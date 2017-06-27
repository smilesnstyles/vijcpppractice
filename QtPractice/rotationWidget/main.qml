import QtQuick 2.1
import QtQuick.Window 2.0

Window {
    visible: true
    width: 800
    height: 600

    Item
    {
        width: 800
        height: 600
        DragNDropElement
        {
            width: parent.width
            height: 100
            id : radioAppsListId
            scrollModel: myMainModel
            objectName: "radioAppsList"
            dragKeysList : ["home1","home2","home3","home4"];
            dropKeyString: "appList"

            ListModel
            {
                id : myMainModel

                ListElement {iconRole : "qrc:/me.png"; textRole : "1"}
                ListElement {iconRole : "qrc:/me.png"; textRole : "2"}
                ListElement {iconRole : "qrc:/me.png"; textRole : "3"}
                ListElement {iconRole : "qrc:/me.png"; textRole : "4"}
                ListElement {iconRole : "qrc:/me.png"; textRole : "5"}
                ListElement {iconRole : "qrc:/me.png"; textRole : "6"}
                ListElement {iconRole : "qrc:/me.png"; textRole : "7"}
                ListElement {iconRole : "qrc:/me.png"; textRole : "8"}
                ListElement {iconRole : "qrc:/me.png"; textRole : "9"}
            }
        }

        DragNDropElement
        {
            id : home1AppsListId
            width: parent.width
            height: 100
            scrollModel: myHome1Model
            objectName: "home1AppsList"
            anchors.bottom: parent.bottom
            dragKeysList : ["appList"];
            dropKeyString: "home1"

            ListModel
            {
                id : myHome1Model

                ListElement {iconRole : "qrc:/me.png"; textRole : "10"}
                ListElement {iconRole : "qrc:/me.png"; textRole : "20"}
                ListElement {iconRole : "qrc:/me.png"; textRole : "30"}
                ListElement {iconRole : "qrc:/me.png"; textRole : "40"}

            }

        }
    }
}
