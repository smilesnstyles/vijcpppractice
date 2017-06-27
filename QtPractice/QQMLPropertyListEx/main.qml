import QtQuick 2.3
import QtQuick.Window 2.2
import com.vij.myItem 1.0
import com.vij.myListItem 1.0

Window {
    visible: true
    width: 400
    height: 400

    Rectangle
    {
        anchors.fill: parent
        color: "green"

        border.color: "black"
        border.width: 2

        MyListItem
        {
            id : mylist
            anchors.fill: parent

            MouseArea
            {
                anchors.fill: parent

                onClicked:
                {
                    console.log("Hello count : " + mylist.myListItems.lengths);

                    for(var i = 0; i < mylist.myListItems.length; i++)
                        console.log("item " + i + " name : " + mylist.myListItems[i].itemName);
                }
            }

        }
    }
}
