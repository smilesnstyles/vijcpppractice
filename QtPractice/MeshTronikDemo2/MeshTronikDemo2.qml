import QtQuick 2.0

import "SimulationAlgorithm.js" as Engine;

Rectangle {
    id: demoParent;
    width: 1086
    height: 625
    color: "black"

    property int currentGear: 0             // Vehicle Running Gear Info
    property int currentODOMeterValue : 0   // Vehicle ODO Meter Value

    // Timers for all the meters
    property int demoTimeCounter: 0;
    property int speedoMeterTimeCounter: 0;
    property int rpmMeterTimeCounter: 0;
    property int fuelMeterTimeCounter: 0;
    property int gearTimeCounter: 0
    property int oDoMeterTimeCounter: 0;
    property int clockTimeCounter: 0;

    // Signal to emit when Demo Completed
    signal resetToInitialState;

    AnalogMeter // Speedo meter Instance. This will acts as the main element as other dials are anchored with it. The Const values
                // Numbers used in this file are all relative to the parent. So it supports resizing also.
    {
        id: speedoMeter
        width: 325          // Height and width values are not defiend. so taken some free values.
        height: 325
        anchors.centerIn: parent
        meterBgImageSource : "png/speedometer.png"
        meterMaskImageSource : "png/speedometerglass.png"
        meterNiddleImageSource : "png/speedometerpointer.png"
        meterNiddleImageSource2 : "png/speedometerpointer1.png"

        /*!
          The belwo Values are taken based on the pixel posions of the given screen shot (considering it as CRS Wireframe)
          */
        meterNiddleWidth: 140
        meterNiddleHeight: 60

        // calculated the angles considering Dial as +ve X - Axis direction.
        meterNiddleMinimumReading: -225
        meterNiddleMaximumReading: 45

        meterNiddleRotatorRadius: 30;   //Rotator radius
        z: 10

        // on completion of the startup animation, it starts the event timer for actual Demo
        onStartupAnimationCompleted :
        {
            timer.running = true;
        }

        Connections
        {
            target: timer
            onTriggered:    // for each 200ms Meters will refresh their positions.
            {
                speedoMeterTimeCounter +=200;
                speedoMeter.newRotationAngle =  speedoMeter.meterNiddleMinimumReading + Engine.getVehicleSpeed(speedoMeterTimeCounter,currentGear);
                speedoMeter.meterNiddleRotationFrequency = 100;
                speedoMeter.meterNiddleRotationAnimStart = true;
            }
        }

        Connections
        {
            target: demoParent
            onCurrentGearChanged:   // on Gear changed meters will set to initial positions.
            {
                speedoMeter.newRotationAngle =  speedoMeter.meterNiddleMinimumReading;
                speedoMeter.meterNiddleRotationFrequency = 1000;
                speedoMeter.meterNiddleRotationAnimStart = true;
            }
        }

        Connections
        {
            target: demoParent
            onResetToInitialState : // once demo completes all meters will set to initial positions.
            {
                speedoMeter.newRotationAngle = -225;
                speedoMeter.meterNiddleRotationFrequency = 1000;
                speedoMeter.meterNiddleRotationAnimStart = true;
            }
        }
    }


    AnalogMeter // RPM Meter Instance
    {
        id: rpmMeter
        width: 278
        height: 278
        anchors.right: speedoMeter.left
        anchors.rightMargin: -60
        anchors.top: speedoMeter.top
        anchors.topMargin: 60
        meterBgImageSource : "png/rpmmeter.png"
        meterMaskImageSource : "png/rpmmeterglass.png"
        meterNiddleImageSource : "png/speedometerpointer.png"
        meterNiddleImageSource2 : "png/speedometerpointer1.png"

        /*!
          The belwo Values are taken based on the pixel posions of the given screen shot (considering it as CRS Wireframe)
          */
        meterNiddleWidth: 112
        meterNiddleHeight: 48

        meterNiddleRotatorRadius: 24
        meterNiddleMinimumReading: -270
        meterNiddleMaximumReading: -74

        Connections
        {
            target: timer
            onTriggered:
            {
                rpmMeterTimeCounter +=200;
                rpmMeter.newRotationAngle =  rpmMeter.meterNiddleMinimumReading +
                                                Engine.getVehicleRPMValue(rpmMeterTimeCounter,currentGear) +
                                                Engine.getVehicleInitialRPM(currentGear);
                rpmMeter.meterNiddleRotationFrequency = 100;
                rpmMeter.meterNiddleRotationAnimStart = true;
            }
        }

        Connections
        {
            target: demoParent
            onCurrentGearChanged:
            {
                if(currentGear != 0)
                {
                    rpmMeter.newRotationAngle =  rpmMeter.meterNiddleMinimumReading + Engine.getVehicleInitialRPM(currentGear);
                    rpmMeter.meterNiddleRotationFrequency = 1000;
                    rpmMeter.meterNiddleRotationAnimStart = true;
                }
            }
        }

        Connections
        {
            target: demoParent
            onResetToInitialState :
            {
                rpmMeter.newRotationAngle = -270;
                rpmMeter.meterNiddleRotationFrequency = 1000;
                rpmMeter.meterNiddleRotationAnimStart = true;
            }
        }

    }

    AnalogMeter // Fuel Meter Instance
    {
        id: fuelMeter
        width: 278
        height: 278
        anchors.left: speedoMeter.right
        anchors.leftMargin: -60
        anchors.top: speedoMeter.top
        anchors.topMargin: 60
        meterBgImageSource : "png/fuelmeter.png"
        meterMaskImageSource : "png/fuelmeterglass.png"
        meterNiddleImageSource : "png/speedometerpointer.png"
        meterNiddleImageSource2 : "png/speedometerpointer1.png"

        /*!
          The belwo Values are taken based on the pixel posions of the given screen shot (considering it as CRS Wireframe)
          */
        meterNiddleWidth: 112
        meterNiddleHeight: 48

        meterNiddleRotatorRadius: 24
        meterNiddleMinimumReading: 0
        meterNiddleMaximumReading: -90



        Connections
        {
            target: timer
            onTriggered:
            {
                fuelMeterTimeCounter += 200;
                fuelMeter.newRotationAngle =  fuelMeter.meterNiddleMaximumReading + Engine.getFuelMeterReading(fuelMeterTimeCounter);
                fuelMeter.meterNiddleRotationFrequency = 100;
                fuelMeter.meterNiddleRotationAnimStart = true;
            }
        }

        onStartupAnimationCompleted :
        {
            // Set Fuel Dial to maximum value
            fuelMeter.setReversNiddlePosition = true;
        }

    }

    // Time/clock Element
    Rectangle
    {
        id: clockRect
        width: 200
        height: 80
        color: "black"

        anchors.top : parent.top
        anchors.topMargin: 50

        anchors.horizontalCenter: rpmMeter.horizontalCenter

        border.color: "grey"

        Text
        {
            id: clockStaticText
            text: "Demo Running Time "
            color: "White"
            font.pointSize: 15

            anchors.horizontalCenter: clockRect.horizontalCenter
        }

        Text
        {
            id: clockTime
            anchors.top : clockStaticText.bottom
            anchors.topMargin: 10

            anchors.horizontalCenter: clockRect.horizontalCenter
            text : "00H:0M:0S";
            font.bold: true
            font.pointSize: 20
            color: "green"
        }

        Connections
        {
            target: timer
            onTriggered:
            {
                clockTimeCounter += 200;
                var min = Math.floor(clockTimeCounter/(1000*60));
                var sec = Math.floor((clockTimeCounter - (min*60*1000))/1000);
                clockTime.text = "00H:" + min + "M:"+sec+"S";
            }
        }
    }


    // Gear Element
    Rectangle
    {
        id: gearRect
        width: 200
        height: 80
        color: "black"

        anchors.top : rpmMeter.bottom
        anchors.topMargin: 50

        anchors.horizontalCenter: rpmMeter.horizontalCenter

        border.color: "grey"

        property alias resetGearTo: gearNo.text

        Text
        {
            id: gearStaticText
            text: "Current Running Gear "
            color: "White"
            font.pointSize: 15

            anchors.horizontalCenter: gearRect.horizontalCenter
        }

        Text
        {
            anchors.top : gearStaticText.bottom
            anchors.topMargin: 10

            anchors.horizontalCenter: gearRect.horizontalCenter
            id: gearNo
            text : currentGear + ""
            font.bold: true
            font.pointSize: 30
            color: "green"
        }

        Connections
        {
            target: timer
            onTriggered:
            {
                gearTimeCounter += 200;
                if(currentGear <= 5)
                    currentGear = ((Math.floor(gearTimeCounter/(2*60*1000))+1) > 6) ? 6 : (Math.floor(gearTimeCounter/(2*60*1000))+1);
            }
        }

        Connections
        {
            target: demoParent
            onResetToInitialState :
            {
                currentGear = 0;
                gearRect.resetGearTo = currentGear + ""
            }
        }
    }

    // ODO Meter Element
    Rectangle
    {
        id: odoMeterRect
        width: 200
        height: 80
        color: "black"

        anchors.top : fuelMeter.bottom
        anchors.topMargin: 50

        anchors.horizontalCenter: fuelMeter.horizontalCenter

        border.color: "grey"

        Text
        {
            id: odoMeterStaticText
            text: "ODO Meter Value "
            color: "White"
            font.pointSize: 15

            anchors.horizontalCenter: odoMeterRect.horizontalCenter
        }

        Text
        {
            anchors.top : odoMeterStaticText.bottom
            anchors.topMargin: 10

            anchors.horizontalCenter: odoMeterRect.horizontalCenter
            id: odoValueId
            text : currentODOMeterValue + ""
            font.bold: true
            font.pointSize: 30
            color: "green"
        }

        Connections
        {
            target: timer
            onTriggered:
            {
                oDoMeterTimeCounter += 200;
                currentODOMeterValue = Engine.getODOMeterValue(Math.floor(oDoMeterTimeCounter/(60*1000)));
            }
        }
    }

    Timer
    {
        id: timer;
        interval: 200
        running: false;
        repeat: true;

        onTriggered:
        {
            demoTimeCounter +=200;
        }
    }

    onDemoTimeCounterChanged:
    {
        if(demoTimeCounter == (12 * 60 * 1000))
        {
            timer.stop();
            resetToInitialState();
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }
}
