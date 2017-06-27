#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>
class MyClass;

typedef void (MyClass::*funcptr)(int) ;

class MyClass : public QObject
{
    Q_OBJECT
public:
    explicit MyClass(QObject *parent = 0);
    void func(int a);
    void fire();

signals:

    void mySignal(funcptr, int);

public slots:

    void mySlot(funcptr a, int b);

};

class mybase : public QObject
{
    Q_OBJECT
public:
    explicit mybase(QObject *parent = 0);

public slots:
    virtual void vfun();
};

class myder : public mybase
{
    Q_OBJECT

public:
    myder() {}

public slots:
    void vfun();
};

#endif // MYCLASS_H
