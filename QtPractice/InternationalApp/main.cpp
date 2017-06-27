#include "widget.h"
#include <QApplication>
#include <QtWidgets>
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    QTranslator myTrnas;
    myTrnas.load("C:\\QtPractice\\InternationalApp\\mytrans.qm");
    a.installTranslator(&myTrnas);
    Widget w;
    QPushButton *btn = new QPushButton(QObject::tr("hello"),&w);
    Q_UNUSED(btn);
    w.show();

    return a.exec();
}
