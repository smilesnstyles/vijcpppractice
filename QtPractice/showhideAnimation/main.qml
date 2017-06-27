import QtQuick 2.1
import QtQuick.Window 2.0

Window {
    visible: true
    width: 800
    height: 600

    Item
    {
        width: parent.width
        height: parent.height

        Rectangle
        {
            width: 200
            height: 200

            color: "blue"

            MouseArea
            {
                anchors.fill: parent

                onClicked:
                {
                    firstContactFieldId.visible = !firstContactFieldId.visible;
                }
            }
        }

        Rectangle
        {
            id : firstContactFieldId

            width : 300
            height: 60
            radius: 5

            color: "black"
            border.color: "grey"
            visible: false

            anchors.centerIn: parent

            state: "hideTip"

            onVisibleChanged:
            {
                if(visible)
                    firstContactFieldId.state = "showTip"
                else
                    firstContactFieldId.state = "hideTip"
            }

            Text
            {
                anchors.fill: parent
                verticalAlignment: Text.AlignVCenter
                anchors.left: parent.left
                anchors.leftMargin: 10

                font.pixelSize: 20

                color: "blue"
                text : "+91 - 9243481977"
                clip: true
            }

            states : [

                State
                {
                    name : "hideTip"
                    PropertyChanges {
                        target: firstContactFieldId
                        height : 0
                    }
                },
                State
                {
                    name : "showTip"
                    PropertyChanges {
                        target: firstContactFieldId
                        height : 30
                    }
                }
            ]

            transitions: Transition
            {
                NumberAnimation { properties: "height"; duration: 500; }
            }
        }
    }
}
