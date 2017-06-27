#include "widget.h"
#include <QApplication>
#include <QMetaObject>
#include <qobjectdefs.h>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Widget w;
    w.show();
    MyStruct yt;
    yt.eOne = 98;
    yt.eTwo = 'i';
    yt.eThree = 643;

    QMetaObject::invokeMethod(&w,"myenumslot",Q_ARG(MyStruct,yt));

    return a.exec();
}
