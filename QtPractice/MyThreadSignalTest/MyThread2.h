#ifndef MYTHREAD2_H
#define MYTHREAD2_H
#include <QThread>

class MyThread2 : public QThread
{
    Q_OBJECT
public:
    MyThread2();

public slots:
    void myT2Slot();
signals:
    void myT2Signal(int a);

protected:
    void run();
};

#endif // MYTHREAD2_H
