import QtQuick 2.2
import QtQuick.Window 2.1

Window {
    visible: true
    //visibility: "Maximized"
    width: 1000
    height: 600
    flags: Qt.MSWindowsFixedSizeDialogHint
    title: "My Egg Catching Game"

    Image
    {
        id : bg
        anchors.fill: parent
        source: "images/bg.jpg"

        signal eggCollected(var eggType);

        property int collectedEggs: 0
        property int droppedEggs: 0

        Text
        {
            id : welcomeBanner
            anchors.centerIn: parent
            text : "Welcome Vijayakumar"
            color: "orange"
            font.pixelSize: 40

            Timer
            {
                running: true
                interval: 10000
                onTriggered:
                {
                    welcomeBanner.visible = false
                    modelGenerator.running = true;
                    textZoomId.running = false;
                }
            }

            Timer
            {
                id : textZoomId
                running: true;
                interval: 500
                repeat: true
                onTriggered:
                {
                    if(welcomeBanner.scale  == 1.0)
                        welcomeBanner.scale = 1.3
                    else
                        welcomeBanner.scale = 1.0;
                }
            }
        }

        onEggCollected:
        {
            if(eggType === 0)
            {
                bg.droppedEggs += 1;
            }
            else
            {
                bg.collectedEggs += eggType;
            }
        }

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            onPositionChanged:
            {
                if(eggCatchingBasket.hasMouseControl)
                {
                    eggCatchingBasket.x = mouse.x;
                }
            }

            onClicked:
            {
                if(eggCatchingBasket.hasMouseControl)
                {
                    eggCatchingBasket.hasMouseControl = false;
                }
            }
        }

        Basket
        {
            id : eggCatchingBasket
            x : 100
            y: 400
            grandParent: bg
            collectedEggsCount : bg.collectedEggs
        }

        Row
        {
            id : chickensGroup
            spacing: 100
            anchors.top: parent.top
            anchors.topMargin: 100

            anchors.left: parent.left
            anchors.leftMargin: 100

            Repeater
            {
                model : myGameModel

                Image {
                    id : motherChicken
                    source: "images/chicken2.png"
                    width: 100
                    height: 100

                    Egg
                    {
                        id : egg
                        x : (parent.width/4)
                        y : parent.height - 20
                        visible: eggAnimState
                        dropDuration : eggDropDuration
                        source : eggSource;


                        property int eggInitY: 100;
                        property int eggInitX: 100 + (index*chickensGroup.spacing) + (index*motherChicken.width);
                        property bool isEggCollected: false;

                        onEggAnimStateChanged:
                        {
                            if(!eggAnimState)
                            {
                                if(!egg.isEggCollected)
                                {
                                    brokenEgg.visible = true;
                                    bg.eggCollected(0);
                                }
                                else
                                {
                                    bg.eggCollected(eggValue);
                                    egg.isEggCollected = false;
                                }

                                egg.y = motherChicken.height - 20
                                if(myGameModel.get(index)["timerState"] === true)
                                {
                                    myGameModel.setProperty(index,"timerState",false);
                                    myGameModel.setProperty(index,"eggSource","images/whiteegg.png");
                                    myGameModel.setProperty(index,"eggValue",1);
                                }
                            }

                        }

                        onYChanged:
                        {
                            //console.log(" item pos : " + (egg.eggInitX + egg.x) + " " +(egg.eggInitY + egg.y))
                            //console.log("basket pos : " + eggCatchingBasket.x + " " + eggCatchingBasket.y)
                            if((Math.floor(egg.y + egg.eggInitY + 5) > (eggCatchingBasket.y + 10)) &&
                                    ((Math.floor(egg.y + egg.eggInitY - 5) < (eggCatchingBasket.y + 10))) &&
                                    ((eggCatchingBasket.x - 60) < (egg.eggInitX + egg.x) ) &&
                                    ((eggCatchingBasket.x + 60) > (egg.eggInitX + egg.x)))
                            {
                                console.log("egg is in the basket")
                                egg.isEggCollected = true;
                                egg.eggAnimState = false;
                            }
                        }
                    }

                    BrokenEgg
                    {
                        id : brokenEgg
                        x : (parent.width/4)
                        y : 400
                        visible: false
                    }

                    Timer
                    {
                        id : eggAnimTimer
                        interval: newEggGeneareteInmSec
                        running: timerState
                        onTriggered:
                        {
                            egg.eggAnimState = true;
                        }
                    }
                }

            }
        }

        ListModel
        {
            id : myGameModel
            ListElement { eggSource : "images/whiteegg.png"; eggValue: 1; timerState : false; newEggGeneareteInmSec: 2000; eggDropDuration : 2000}
            ListElement { eggSource : "images/whiteegg.png"; eggValue: 1; timerState : false; newEggGeneareteInmSec : 1500; eggDropDuration : 2000}
            ListElement { eggSource : "images/whiteegg.png"; eggValue: 1; timerState : false; newEggGeneareteInmSec : 2000; eggDropDuration : 2000}
            ListElement { eggSource : "images/whiteegg.png"; eggValue: 1; timerState : false; newEggGeneareteInmSec : 1000; eggDropDuration : 2000}
            ListElement { eggSource : "images/whiteegg.png"; eggValue: 1; timerState : false; newEggGeneareteInmSec : 2000; eggDropDuration : 2000}
        }

        Timer
        {
            id : modelGenerator
            interval: 500
            repeat: true

            onTriggered:
            {
                var modelIndex = Math.floor(Math.random()*5);

                //console.log("model Generator triggered for index : " + modelIndex)

                //console.log("timer state : " + myGameModel.get(modelIndex)["timerState"]);

                if(myGameModel.get(modelIndex)["timerState"] === false)
                {
                    //console.log("setting timer state to true");
                    myGameModel.setProperty(modelIndex,"timerState",true);

                    var modelNewEggTimerInterval = Math.floor(Math.random()*100);
                    myGameModel.setProperty(modelIndex,"newEggGeneareteInmSec",modelNewEggTimerInterval);

                    var modelEggDropDuration = Math.floor(Math.random()*2000);
                    if(modelEggDropDuration < 1000)
                        modelEggDropDuration = 1000;
                    myGameModel.setProperty(modelIndex,"eggDropDuration",modelEggDropDuration);
                }
            }
        }

        Timer
        {
            id : giftEggsGenerator
            running: (bg.collectedEggs >= 10)
            repeat: true
            interval: 3000

            onTriggered:
            {
                console.log("gift egg generator triggered")
                var modelIndex = Math.floor(Math.random()*5);

                if(myGameModel.get(modelIndex)["timerState"] === false)
                {
                    console.log("gift egg generated")
                    myGameModel.setProperty(modelIndex,"timerState",true);

                    var modelNewEggTimerInterval = Math.floor(Math.random()*100);
                    myGameModel.setProperty(modelIndex,"newEggGeneareteInmSec",modelNewEggTimerInterval);

                    var modelEggDropDuration = Math.floor(Math.random()*2000);
                    if(modelEggDropDuration < 1000)
                        modelEggDropDuration = 1000;
                    myGameModel.setProperty(modelIndex,"eggDropDuration",modelEggDropDuration);

                    var modelEggGolden = Math.floor(Math.random()*10);
                    if(modelEggGolden <5)
                    {
                        myGameModel.setProperty(modelIndex,"eggSource","images/goldenegg2.png");
                        myGameModel.setProperty(modelIndex,"eggValue",5);
                    }
                    else
                    {
                        myGameModel.setProperty(modelIndex,"eggSource","images/goldenegg.png");
                        myGameModel.setProperty(modelIndex,"eggValue",10);
                    }
                }
            }
        }

        Rectangle
        {
            id : chickenStandBaseId
            width: parent.width
            height: 2
            color: "black"

            anchors.left: parent.left
            anchors.top : parent.top
            anchors.topMargin: 197
        }

        Rectangle
        {
            id : scoreBoard

            width: 500
            height: 100

            anchors.top : parent.top
            anchors.topMargin: 10

            anchors.left: parent.left
            anchors.leftMargin: 50

            color: "transparent"

            Row
            {
                spacing: 50
                anchors.centerIn: parent

                Text {
                    id: collectedEggsText
                    text : "Eggs Collected : " + bg.collectedEggs
                    font.pixelSize: 20
                    color: "green"
                }

                Text {
                    id: droppedEggsText
                    text : "Eggs Dropped : " + bg.droppedEggs
                    font.pixelSize: 20
                    color: "red"
                }


            }
        }

    }


}
