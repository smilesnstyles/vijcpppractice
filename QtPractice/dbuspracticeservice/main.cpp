#include "mainwindow.h"
#include <QApplication>
#include "test_adap.h"
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;

    new MainWindowAdaptor(&w);

    QDBusConnection connection = QDBusConnection::sessionBus();
    connection.registerObject("/myDBusObject", &w);
    connection.registerService("vijay.test");

    w.show();

    return a.exec();
}
