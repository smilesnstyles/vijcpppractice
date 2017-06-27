#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <myitem.h>
#include <mylistitem.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<MyItem>("com.vij.myItem",1,0,"MyItem");
    qmlRegisterType<MyListItem>("com.vij.myListItem",1,0,"MyListItem");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
