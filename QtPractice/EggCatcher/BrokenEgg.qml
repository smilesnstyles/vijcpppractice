import QtQuick 2.0

Image
{
    id : brokenEggImage
    source : "images/brokenegg.svg"
    width: 60
    height: 60

    Timer
    {
        id : brokenEggTimer
        interval: 700;
        running: brokenEggImage.visible
        onTriggered:
        {
            brokenEggImage.visible = false;
        }
    }
}
