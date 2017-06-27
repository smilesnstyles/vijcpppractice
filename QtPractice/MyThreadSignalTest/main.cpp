#include "MyThreadSignalTest.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MyThreadSignalTest w;
    w.show();

    return a.exec();
}
