#include "widget.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Widget w;
    w.show();
    QObject::connect(&a, SIGNAL(lastWindowClosed()),&w,SLOT(pri_slot1()));
    QObject::connect(&a, SIGNAL(lastWindowClosed()),&w,SLOT(pub_slot1()));
    QObject::connect(&w, SIGNAL(mySignal1()),&w,SLOT(pub_slot1()));
    w.pub_slot1();
    w.mySignal1();
    return a.exec();
}
