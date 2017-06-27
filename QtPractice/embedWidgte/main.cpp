#include <QApplication>
#include "mapview.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    QDeclarativeView view;
    //view.rootContext()->setContextProperty("Pushbutton",pb);
    qmlRegisterType<MapView>("MapView", 1, 0, "MapViewItem");
    view.setSource(QUrl("qrc:/Mapscreen.qml"));
    view.show();
    return a.exec();
}
