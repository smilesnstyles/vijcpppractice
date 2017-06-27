#ifndef MYTHREADSIGNALTEST_H
#define MYTHREADSIGNALTEST_H

#include <QWidget>
#include<ui_MyThreadSignalTest.h>

class MyThread1;
class MyThread2;

class MyThreadSignalTest : public QWidget, public Ui::MyThreadSignalTest
{
    Q_OBJECT

public:
    explicit MyThreadSignalTest(QWidget *parent = 0);
    ~MyThreadSignalTest();
private slots:
    void startT1();
    void startT2();

    void sendT1Signal();
    void sendT2Signal();

    void setTextToT1(int a);
    void setTextToT2(int a);

signals:
    void signalToT1();
    void signalToT2();

private:
    MyThread1 *t1;
    MyThread2 *t2;
};

#endif // MYTHREADSIGNALTEST_H
