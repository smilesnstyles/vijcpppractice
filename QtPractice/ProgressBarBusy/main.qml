import QtQuick 2.1
import QtQuick.Window 2.0
import QtGraphicalEffects 1.0
Window {
    visible: true
    width: 360
    height: 360

//    MouseArea {
//        anchors.fill: parent
//        onClicked: {

//        }
//    }

//    Image
//    {
//        objectName: "myImage"

//        onSourceChanged:
//        {
//            console.log("hello me " + source);
//        }
//    }

    Rectangle
    {
        id : progressBarPopup
        property int progressValue: -1
    }

    Rectangle
    {
        id: sliderBG
        objectName: "sliderBG"

        border.color: "yellow"
        width: parent.width - 64
        height: 20
        anchors.left: parent.left
        anchors.leftMargin: 32

        color: "white"

        Rectangle
        {
            id: progressBarFill
            objectName: "progressBarFill"

            height: parent.height
            width: progressBarPopup.progressValue * (sliderBG.width /100);
            color: "skyblue"
            visible: (progressBarPopup.progressValue != -1)
        }

        Rectangle
        {
            id : progressBusyBar
            objectName: "progressBusyBar"

            property int pBBMaxWidth : sliderBG.width /5;
            height: parent.height
            width: pBBMaxWidth;
            visible: (progressBarPopup.progressValue == -1)
            clip : true

            LinearGradient
            {
                anchors.fill: parent

                start: Qt.point(0, 0)
                end: Qt.point(0, progressBusyBar.width)
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "black" }
                    GradientStop { position: 1.0; color: "black" }
                }
            }
        }

        Timer
        {
            interval: 5
            repeat: true;
            running: (progressBarPopup.progressValue == -1)

            onTriggered:
            {
                console.log("progressBusyBar.x : " + progressBusyBar.x);
                console.log("sliderBG.width - progressBusyBar.width : " + (sliderBG.width - progressBusyBar.width));
                if((progressBusyBar.width < (progressBusyBar.pBBMaxWidth)) && !(parseInt(progressBusyBar.x) >= parseInt(sliderBG.width - progressBusyBar.width)))
                {
                    progressBusyBar.width++;
                }
                else if(parseInt(progressBusyBar.x) <= parseInt(sliderBG.width))
                {
                    progressBusyBar.x ++;
                    if(parseInt(progressBusyBar.x) >= parseInt(sliderBG.width - progressBusyBar.width))
                    {
                        progressBusyBar.width--;
                    }
                }
                else
                {
                    progressBusyBar.width = 1;
                    progressBusyBar.x = 0
                }
            }
        }
    }
}


