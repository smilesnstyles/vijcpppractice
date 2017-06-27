#include "MyThread1.h"
#include <QDebug>
#include <QCoreApplication>
MyThread1::MyThread1()
{

}

void MyThread1::myT1Slot()
{
    qDebug() << "direct signal received" << endl;
}

void MyThread1::run()
{
    qDebug() << "Thread 1 started\n";

    for(int i = 123; i > 0; i --)
    {
        QCoreApplication::processEvents();
        emit myT1Signal(i);
    }


}

