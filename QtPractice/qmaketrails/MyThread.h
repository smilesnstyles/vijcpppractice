#ifndef MYTHREAD_H
#define MYTHREAD_H
#include<QDebug>
#include <QThread>

class MyThread : public QThread
{
    Q_OBJECT

    void run()
    {
        qDebug() << "Its my thread";
    }

public:
    MyThread();
};
#endif // MYTHREAD_H
