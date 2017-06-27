import QtQuick 2.0

Rectangle {

    property string meterBgImageSource;     // Actual Meter Reading are showing on this Image
    property string meterMaskImageSource;   // This is the Top Design Image for Meter Dial
    property string meterNiddleImageSource; // Actual Meter Dial Image
    property string meterNiddleImageSource2;// We spitted Dial base into Two part to set it into the middle Rotation Circle.
                                            // This is the second part of the Niddle image.
    property int meterNiddleWidth;          // Meter Niddle Width should be decided according to the Dial
    property int meterNiddleHeight;         // Meter Niddle Height should be decide according to the Dial

    property int meterNiddleRotatorRadius;  // The Niddle Rotator Circle Radius.
    property int meterNiddleMinimumReading; // The Meter mininum value (Angle of Rotation)
    property int meterNiddleMaximumReading; // The Meter Maximum Value (Angle of Rotation)

    property bool constructionComplete : false  // this is for Initial Animation start.

    property real newRotationAngle;
    property int meterNiddleRotationFrequency;
    property alias meterNiddleRotationAnimStart : eventHandlerAnim.running;
    property alias meterNiddleRotationAnimStartFrom : eventHandlerAnim.from;
    property alias currentRotationAngle: niddleRotator.rotation

    property bool setReversNiddlePosition: false;

    signal startupAnimationCompleted;

    radius: (parent.width + parent.height)/4;   // This gives the Circular Frame and avoid white residual part of the Rectangle.

    Image   // Acual Diag element
    {
        id: meterBg
        width: parent.width
        height: parent.height
        source: meterBgImageSource  // Actual Diag Image Source

        Image   // Image element for Dial Design / glass etc...
        {
            id: meterMask
            width: parent.width
            height: parent.height
            anchors.centerIn: parent        // this should fill or align centre in main Dial
            source: meterMaskImageSource    // glass / design Image source
        }

        Rectangle   // This is the actual Niddle rotator set in the middle of the Dial
        {
            id: niddleRotator
            color: "black"
            smooth: true
            antialiasing: true
            width: meterNiddleRotatorRadius * 2
            height: meterNiddleRotatorRadius *2
            radius: meterNiddleRotatorRadius        // It gives the rectangle circular shape.
            anchors.centerIn: parent                // To Set the Dial rotate from Center
            rotation: meterNiddleMinimumReading     // This is for setting the inial Niddle Position in the Dial.

            /*!
                The below source code will do the initial Niddle Movement from min to max and max to min positions.
            */
            SequentialAnimation {
                running: constructionComplete
                NumberAnimation { easing.type:Easing.InQuad; target: niddleRotator; property: "rotation"; from: meterNiddleMinimumReading; to: meterNiddleMaximumReading; duration: 1500; }
                NumberAnimation { easing.type:Easing.InQuad; target: niddleRotator; property: "rotation"; from: meterNiddleMaximumReading; to: meterNiddleMinimumReading; duration: 1500 }

                onStopped:
                {
                    startupAnimationCompleted();
                }
            }

            // This is for setting the Current Niddle position to Maximum (ex. for fuel and Gas Meters)
            NumberAnimation { running: setReversNiddlePosition; easing.type:Easing.InQuad; target: niddleRotator; property: "rotation"; from: meterNiddleMinimumReading; to: meterNiddleMaximumReading; duration: 100; }

            // This is for event handling rotation.
            NumberAnimation { id: eventHandlerAnim; easing.type:Easing.InQuad; target: niddleRotator; property: "rotation"; to: newRotationAngle; duration: meterNiddleRotationFrequency; }

            Image   // This Image element set the flexi part of the Niddle Base
            {
                width: parent.width/2
                height: parent.height
                source: meterNiddleImageSource2
                smooth: true
                antialiasing: true
            }


            Image   // This is the actual Niddle that moves with the rotator.
            {
                id: meterNiddle
                width: meterNiddleWidth
                height: meterNiddleHeight
                source: meterNiddleImageSource
                x: parent.width/2
                smooth: true
                antialiasing: true
            }
        }
    }

    /*!
      on completion of the component construction this will set the below flag so that the initial animation starts.
      */
    Component.onCompleted:
    {
        constructionComplete = true;
    }

}
