#ifndef MYTHREAD1_H
#define MYTHREAD1_H
#include <QThread>

class MyThread1 : public QThread
{
    Q_OBJECT
public:
    MyThread1();

public slots:
    void myT1Slot();

signals:
    void myT1Signal(int a);

protected:
    void run();
};

#endif // MYTHREAD1_H
