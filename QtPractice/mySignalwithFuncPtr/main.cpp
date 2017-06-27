#include <QCoreApplication>
#include <myclass.h>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    MyClass *obj = new MyClass;

    mybase *base = new myder;

    QObject::connect(obj,SIGNAL(mySignal(funcptr,int)),base,SLOT(vfun()));

    QObject::connect(obj,SIGNAL(mySignal(funcptr,int)),obj,SLOT(mySlot(funcptr,int)));

    obj->fire();

    return a.exec();
}
