import QtQuick 2.0

Item {

    property bool selected: false

    property int iconX            ;
    property int iconY            ;
    property int iconWidth        ;
    property int iconHeight       ;
    property string iconSource    ;
    property int textX            ;
    property int textY            ;
    property variant textLab      ;
    property variant textColorState ;

    function getGridButton(t)
    {
        console.log("calling getGridButton for " + t);
        if(t === "IconTextButton")
        {
            return iconTextButton
        }
        else if (t === "TextButton")
        {
            return textButton
        }
    }

    onSelectedChanged:
    {
        //console.log("onSelectedChanged",index);
        if(selected)
        {
            textLabel.textColor = "skyblue";
            imageGrid.source = selectedIconRole;
        }
        else
        {
            textLabel.textColor = "white";
            imageGrid.source = iconRole;
        }
    }

    Component
    {
        id : iconTextButton
        Rectangle
        {
            width: parent.width
            height: parent.height
            Image
            {
                id: imageGrid
                x: 2
                y: 5
                width: 60
                height: 60
                source : iconRole
            }


            Text
            {
                id: textLabel
                text: textRole
                color: "black"
                x: 0
                horizontalAlignment: "AlignHCenter"
            }
        }
    }

    Component
    {
        id : textButton

        Text
        {
            id: textLabel
            text: textRole
            color: "white"
            x: 0
            horizontalAlignment: "AlignHCenter"
        }
    }


    Loader
    {
        sourceComponent: getGridButton(typeRole)
    }

}

