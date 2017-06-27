import QtQuick 2.3
import QtQuick.Window 2.2

Window {
    visible: true

    width: 1200
    height: 600

    Rectangle
    {
        color : "pink"
        id : town
        focus : true
        anchors.fill: parent
        property bool ignition : false
        property int activeSignal: 0

        Row
        {
            anchors.top: parent.top
            anchors.topMargin: 10

            anchors.left: parent.left
            anchors.leftMargin: 10

            spacing: 10

            GameChoice { gameName: "Game 1"; gameInstance: game1}
            GameChoice { gameName: "Game 2"; gameInstance: game2}

        }

        Text {
            id: wonText
            text: qsTr("Welcome Anuroop!!!!!!!!!!!!");

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
            height: 100

            color: "yellow"

            font.pixelSize: 30
        }

        Image {
            id: road
            source: "qrc:/Road.jpg"
            width: parent.width
            height: 300

            anchors.centerIn: parent

            Image {
                id: bus
                source: "qrc:/animated-bus-image-0008.gif"
                width: 150
                height: 100

                y: 150
                x : 0

            }
        }

        function randomNumber()
        {
            return Math.random();
        }

        function getNumber()
        {
            return Math.ceil(randomNumber()*10)%3;
        }

        Timer
        {
            id : startBus
            interval: 10
            running: false
            repeat: true

            onTriggered:
            {
                if(town.ignition)
                {
                    if(bus.x <= 900)
                    {
                        if(town.activeSignal !== 0)
                        {
                            bus.x += 1;
                        }
                        console.log("bus new x : " + bus.x + " new random : " + town.activeSignal);
                    }
                    else
                    {
                        running = false
                    }
                }
            }
        }

        Rectangle
        {
            id : signals
            anchors.right: road.right
            anchors.rightMargin: 10

            anchors.top : road.top
            color: "transparent"

            width: 100
            height: 300

            Column
            {
                spacing: 10
                Rectangle { color: (town.activeSignal == 0) ? "darkred" : "black"; width: 50; height: 50; radius: 25; border.color: "grey"}
                Rectangle { color: (town.activeSignal == 1) ? "darkorange" : "black"; width: 50; height: 50; radius: 25; border.color: "grey"}
                Rectangle { color: (town.activeSignal == 2) ? "darkgreen" : "black"; width: 50; height: 50; radius: 25; border.color: "grey"}
            }

            Timer
            {
                id : signalTimer
                interval: 1000
                running: true
                repeat: true

                onTriggered:
                {
                    town.activeSignal = town.getNumber();
                }
            }

        }

        onActiveSignalChanged:
        {
            if(activeSignal === 1)
            {
                startBus.interval = 50
            }
            else
            {
                startBus.interval = 10;
            }
        }

        onIgnitionChanged:
        {
            if(ignition)
            {
                startBus.start();
                wonText.text = qsTr("Welcome Anuroop!!!!!!!!!!!!");
                wonText.color = "yellow"
            }
            else
            {
                startBus.stop();

                if(town.activeSignal === 0)
                {
                    wonText.text = qsTr("Yeh... You Won!!!!!!!!!!!!");
                    wonText.color = "blue"
                }
            }
        }


        Keys.onUpPressed:
        {
            //console.log("key pressed + " + event.key)
            town.ignition = true
        }

        Keys.onDownPressed:
        {
            town.ignition = false
        }

        Game1
        {
            id : game1
            anchors.fill: parent

            visible: false
        }

        Game2
        {
            id : game2
            anchors.fill: parent

            visible: false
        }
    }
}

