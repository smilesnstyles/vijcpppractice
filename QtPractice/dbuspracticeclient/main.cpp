#include "mainwindow.h"
#include <QApplication>
#include <QDebug>
#include "test_interface.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    local::MainWindow *w = new local::MainWindow("vijay.test","/myDBusObject",QDBusConnection::sessionBus(), 0);

    w->test("via setParent");

    return a.exec();
}
