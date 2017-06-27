#include "myclass.h"
#include <QDebug>
#include<QTimer>
MyClass::MyClass(QObject *parent) :
    QObject(parent)
{

}

void MyClass::func(int a)
{
    qDebug() << "my function called : " << a;
}

void MyClass::fire()
{
    funcptr fun = &MyClass::func;
    emit mySignal(fun,23);
}

void MyClass::mySlot(funcptr a, int b)
{
    qDebug() << "my slot called";
    MyClass obj;// = new MyClass;
    (obj.*a)(b);

    qDebug() << &a << " hello " << a ;
}


mybase::mybase(QObject *parent) : QObject(parent)
{

}

void mybase::vfun()
{
    qDebug() << "base vfun";
}


void myder::vfun()
{
    qDebug() << "der vfun" ;
}
