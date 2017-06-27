import QtQuick 2.1
import QtQuick.Window 2.0
import QtGraphicalEffects 1.0

Window {
    visible: true
    width: 800
    height: 800

    Rectangle {
        id: container
        anchors.fill: parent

//        Rectangle
//        {
//            id : myRect
//            width: 100
//            height: 100
//            color: "grey"
//            border.color: "black"

//            gradient: Gradient {
//                GradientStop{ position: 0.0 ; color: "darkgrey"}
//                GradientStop{ position: 1.0 ; color: "lightgrey"}
//            }

////            anchors.top: parent.top
////            anchors.topMargin: 10

////            anchors.left: parent.left
////            anchors.leftMargin: 10

//            x : 10
//            y: 10

//            MouseArea
//            {
//                anchors.fill: parent

//                onClicked:
//                {
//                    //myRect.rotation += 180;
//                    //pAnim.start();
//                    myRect.state = "2"
//                }
//            }

//            states: [ State {
//                    name: "1"
//                    PropertyChanges {
//                        target: myRect
//                        x : 400
//                        width : 50
//                        height : 50

//                    }
//                },
//                State {
//                    name: "2"
//                    PropertyChanges {
//                        target: myRect
//                        y : 400
//                        width : 50
//                        height : 50

//                    }
//                }
//            ]

//            transitions: [
//                Transition {

//                    ParallelAnimation{
//                        PropertyAnimation { properties: "width,height"; duration: 1000 }
//                        PropertyAnimation { properties: "x,y"; duration: 1000 }
//                    }
//                }
//            ]



////            Behavior on rotation
////            {
////                NumberAnimation { duration: 1000 }
////            }

//            ParallelAnimation
//            {
//                id : pAnim
//                running: false
//                PropertyAnimation {target: myRect; property: "rotation"; from : 0 ; to : 180; duration: 1000 }
//                PropertyAnimation {target: myRect; property: "scale"; from : 1.0 ; to : 0.5; duration: 1000 }
//            }


//        }

        //Circular image

        Rectangle
        {
            anchors.centerIn: parent
            width: 300
            height: 300
            color: "black"

            radius: 150

            Image {
                id: myImage
                source: "Koala.jpg"
                anchors.fill: parent
                visible: false

            }

            Rectangle
            {
                id : mask
                anchors.fill: parent
                radius: 150
                color: "black"
                clip : true
                visible: false
            }

            OpacityMask
            {
                anchors.fill: mask
                source: myImage
                maskSource: mask
                visible: true
            }
        }
    }

}
