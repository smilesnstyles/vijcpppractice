import QtQuick 2.1
import QtQuick.Window 2.0
Window {
    visible: true
    width: 360
    height: 360

    Rectangle
    {

        function ram()
        {
            for(var i= 0; i < 20000; i++)
            {

            }
        }

        anchors.fill: parent
        color : "red"

        ListView
        {
            id : myList
            model: myModel
            delegate: myDelegate
            anchors.fill: parent

        }

        Component
        {
            id : myDelegate

            Rectangle
            {
                width: 360
                height: 30

                Text {
                    anchors.centerIn: parent;
                    text: model.name + model.index
                }

                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        ram();
                        console.log("ram clicked ");
                    }
                }
            }
        }

        ListModel
        {
            id : myModel
            ListElement
            {
                name : "Vijay"
            }
            ListElement
            {
                name : "Raja"
            }
            ListElement
            {
                name : "Vijayrtewrwe"
            }
            ListElement
            {
                name : "Rajawer"
            }
            ListElement
            {
                name : "Vijayasd"
            }
            ListElement
            {
                name : "Raja345353"
            }
        }
    }
}
