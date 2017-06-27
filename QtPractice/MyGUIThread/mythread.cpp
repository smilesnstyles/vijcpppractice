#include "mythread.h"
#include <QMutex>
#include <QTimer>
#include <QDebug>
MyThread::MyThread(bool b, QObject *parent) :
    QThread(parent),m_bStop(b)
{

}

void MyThread::run()
{
    QTimer timer;
    connect(&timer,SIGNAL(timeout()),this,SLOT(mytimerevent()));
    timer.start(2000);
    m_data = 7;

    exec();
}

void MyThread::mytimerevent()
{
    QMutex mutex;
    mutex.lock();
    if(this->m_bStop) exit(0);
    mutex.unlock();
    qDebug() << "My timer event";
    emit valueChanged(m_data);
    m_data ++;
}
