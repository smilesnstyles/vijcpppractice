import QtQuick 2.0

Image
{
    id : eggImage
    source : "images/whiteegg.png"
    width: 40
    height: 40

    property int dropDuration: 2000
    property alias eggAnimState: eggAnim.running

    PropertyAnimation
    {
        id : eggAnim
        target: eggImage
        property: "y"
        to : 400
        duration: eggImage.dropDuration
    }

}

