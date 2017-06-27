#ifndef MYTHREAD_H
#define MYTHREAD_H

#include <QThread>
#include<QQmlApplicationEngine>

class MyThread : public QThread
{
public:
    MyThread(QString qmlPath);
private:
    virtual void run();

private:
    QQmlApplicationEngine m_qmlAppengine;
};

#endif // MYTHREAD_H
