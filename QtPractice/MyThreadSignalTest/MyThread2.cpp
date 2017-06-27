#include "MyThread2.h"
#include <QDebug>
#include <QCoreApplication>

MyThread2::MyThread2()
{

}

void MyThread2::myT2Slot()
{
    qDebug() << "queued signal received" << endl;
}

void MyThread2::run()
{
    qDebug() << "Thread 2 started\n";

    for(int i = 0; i < 123; i ++)
    {
        QCoreApplication::processEvents();
        emit myT2Signal(i);
    }


}

