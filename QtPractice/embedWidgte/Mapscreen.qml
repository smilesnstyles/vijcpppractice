import Qt 4.7
import MapView 1.0


Rectangle{
id: rect
width: 200
height: 200
color: "red"
    MapViewItem {
            id: mapviewi
            z: 100
            MouseArea{
                anchors.fill: parent
                onClicked:
                {
                    console.log("clicked");
                    //mapClicked();
                }
            }
        }
}
