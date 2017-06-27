import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    visible: true
    width: 360
    height: 360

    GridView
    {
        width: 200
        height: 500
        model: myModel
        delegate: myDelegate
    }

    ListModel
    {
        id : myModel
        ListElement {name : "Raj"; colour : "green"}
        ListElement {name : "Raj2"; colour : "black"}
        ListElement {name : "Raj3"; colour : "blue"}
        ListElement {name : "Raj4"; colour : "yellow"}

    }

    Component
    {
        id : myDelegate

        Rectangle
        {
            width: 100
            height: 100
            color: "grey"
            border.color: "white"

            Row
            {
                anchors.centerIn: parent
                spacing: 10
                Rectangle
                {
                    id : myCircle
                    width: 20
                    height: 20
                    radius: 10

                    color: colour

                    anchors.verticalCenter: parent.verticalCenter

                }

                Text {
                    id: myName
                    text: name
                    width : myName.contentWidth >= 100 ? 100 : myName.contentWidth
                    elide: myName.contentWidth >= 100 ? Text.ElideRight : Text.ElideNone

                    anchors.verticalCenter: parent.verticalCenter
                }
            }
        }

    }


}
