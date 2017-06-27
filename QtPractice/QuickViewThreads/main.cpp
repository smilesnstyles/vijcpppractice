#include <QGuiApplication>
#include <mythread.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    MyThread thread1("qrc:/main.qml");
    thread1.start();

    MyThread thread2("qrc:/main2.qml");
    thread2.start();

    return app.exec();
}
