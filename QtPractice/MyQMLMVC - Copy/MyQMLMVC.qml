import QtQuick 2.0

Rectangle {
    width: 360
    height: 360

    ListModel
    {
        id: listModel;

        ListElement
        {
            name:"vijay"
            age:30
        }
        ListElement
        {
            name:"Durga"
            age:26
        }
        ListElement
        {
            name:"Anuroop"
            age:03
        }
        ListElement
        {
            name:"Govind"
            age:56
        }
        ListElement
        {
            name:"Rajyalakshmi"
            age:48
        }
        ListElement
        {
            name:"Jalamma"
            age:80
        }
    }

    Component
    {
        id: fruitDelegate
        Row
        {
            spacing: 10
            Rectangle
            {
                border.color: "black"
                width: 180
                height: 50
                color: "red"
                Text
                {
                    id: nametext
                    text: name
                    anchors.fill : parent
                    visible: true

                    MouseArea
                    {
                        anchors.fill: parent
                        onDoubleClicked:
                        {
                            nametextedit.visible = true;
                            nametextedit.focus  =  true
                            nametext.visible = false
                        }
                    }
                }

                TextInput
                {
                    id: nametextedit
                    anchors.fill: parent
                    text: name
                    visible: false
                    font.pointSize: 20;
                    cursorVisible: true
                    color: "yellow"
                    z: 20;

                    Keys.onReturnPressed:
                    {
                        console.log("Done")
                        listModel.setProperty(index,"name",nametextedit.text);
                        nametext.visible = true;
                        nametextedit.visible = false;
                    }

                    onFocusChanged:
                    {
                        if(focus == false)
                        {
                            console.log("Done")
                            listModel.setProperty(index,"name",nametextedit.text);
                            nametext.visible = true;
                            nametextedit.visible = false;
                        }
                    }
                }


            }
            Rectangle
            {
                border.color: "black"
                width: 170
                height: 50
                color: "blue"
                Text
                {
                    id: agetext
                    text: age
                    anchors.fill : parent
                    visible: true

                    MouseArea
                    {
                        anchors.fill: parent
                        onDoubleClicked:
                        {
                            agetextedit.visible = true;
                            agetextedit.focus  =  true
                            agetext.visible = false
                        }
                    }
                }

                TextInput
                {
                    id: agetextedit
                    anchors.fill: parent
                    text: age
                    visible: false
                    font.pointSize: 20;
                    cursorVisible: true
                    color: "yellow"
                    z: 20;

                    Keys.onReturnPressed:
                    {
                        console.log("Done")
                        listModel.setProperty(index,"age",parseInt(agetextedit.text))
                        agetext.visible = true;
                        agetextedit.visible = false;
                    }

                    onFocusChanged:
                    {
                        if(focus == false)
                        {
                            console.log("Done")
                            listModel.setProperty(index,"age",parseInt(agetextedit.text))
                            agetext.visible = true;
                            agetextedit.visible = false;
                        }
                    }
                }

            }
        }
    }

    Component
    {
        id: headerDelegate
        Row
        {
            spacing: 10
            Rectangle
            {
                border.color: "black"
                width: 180
                height: 50
                color: "yellow"
                Text
                {
                    text: "name"
                    anchors.centerIn: parent
                    font.pointSize: 14
                }
            }
            Rectangle
            {
                border.color: "black"
                width: 170
                height: 50
                color: "grey"
                Text
                {
                    text: "age" ;
                    anchors.centerIn: parent
                    font.pointSize: 14
                }
            }
        }
    }

    ListView
    {
        //width: parent.width
        //height: parent.height

        anchors.fill : parent
        model: listModel
        delegate: fruitDelegate
        header: headerDelegate
    }
}

