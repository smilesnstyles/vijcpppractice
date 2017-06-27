#include "mythread.h"

MyThread::MyThread(QString qmlPath)
{
    m_qmlAppengine.load(QUrl(qmlPath));

}

void MyThread::run()
{
    exec();
}

