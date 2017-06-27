import QtQuick 2.0
import MyClass 2.8
import QtQuick.Controls 1.0
import MyQmlItem 1.1
import vijkia 1.0

Rectangle {
    id: mainrect
    width: 360
    height: 360
    color: "green"

    signal sayhi;

    MyTimeQmlItem
    {
        id: myTimer;
    }

    Button
    {
        text: "push me";
        anchors.centerIn: myRect;
        z: 65

        onClicked:
        {
            sayhi();
            console.log("Current time: " + myTimer.hour + ":"+myTimer.min);
        }
    }

    MyQmlItem
    {
        id: myQmlItem
        width: 100;
        height: 100;

        x: 40;
        y: 40;

    }

    function sayhislot()
    {
        console.log("Hi Vijayakumar k!");
    }

    Connections
    {
        target: mainrect
        onSayhi:
        {
            sayhislot();
        }
    }

    Component.onCompleted:
    {
        mainrect.sayhi.connect(sayhislot);
    }

    Text {
        text: qsTr("Hello World")
        anchors.centerIn: parent

    }

    MyRectangle
    {
        anchors.centerIn: parent
        id: myRect;
        width: 100
        height: 100

        z: 2
        MouseArea
        {
            anchors.fill: parent
            onClicked:
            {
                console.log("My Rectangle Clicked")
                myClass.myage = 78;
            }
        }
    }

    Rectangle {
        width: 20;
        height: 20;
        anchors.left: parent.left
        anchors.top:parent.top
        z:23;
        MouseArea
        {
            anchors.fill: parent
            onClicked: {
                console.log("Small rect mouse pressed");
                myClass.myage = MyObj.getmyage();
                myClass.agetype = MyClass.ETHREE;
                myClass.myhello();
            }
        }
    }

    Connections
    {
        target: myClass
        onAgetypeChanged:
        {
            console.log("age type changed to " + aType);
        }
    }

    Connections
    {
        target: myClass
        onMysignal:
        {
            console.log("My signal data : " + aEnum);
        }
    }

    MyClass {
        id: myClass
        onMyageChanged: {
            console.log("your age changed to : " + myage);
        }
    }

    MouseArea {

        anchors.fill: parent
        onClicked: {
            console.log("Mouse Pressed");

            myClass.myage = 87;
            //console.log("your age changed to : " + myClass.myage);
        }
    }
}
