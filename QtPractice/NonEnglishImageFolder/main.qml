import QtQuick 2.1
import QtQuick.Window 2.0
import com.harman.MyListModal 1.0

Window {
    visible: true
    width: 360
    height: 360

    MouseArea {
        anchors.fill: parent
        onClicked: {

        }
    }

    Rectangle
    {
        width: 400
        height: 400

        ListView
        {
            anchors.fill: parent
            model: MyListModal
            delegate: myDelegate
        }

        Component
        {
            id : myDelegate

            Rectangle
            {
                height: 100
                width: 400

                Text
                {
                    anchors.centerIn: parent
                    text : headerName
                }
            }
        }

//        //color: MySTObj.color;

//        Item
//        {
//            id : myProp
//            objectName: "myProp"
//            property string name : "Vijay"
//        }

//        Text {
//            anchors.centerIn: parent
//            font.pixelSize: 30
//            color: "black"
//            text: MySTObj.name;
//        }
//        Loader
//        {
//            source : "qrc:/myLoad.qml"
//        }
    }

//    Image
//    {
//        objectName: "myImage"

//        onSourceChanged:
//        {
//            console.log("hello me " + source);
//        }
//    }
}
