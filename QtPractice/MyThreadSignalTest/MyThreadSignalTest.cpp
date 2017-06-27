#include "MyThreadSignalTest.h"
#include <MyThread1.h>
#include <MyThread2.h>
#include <QDebug>

MyThreadSignalTest::MyThreadSignalTest(QWidget *parent) :
    QWidget(parent)
{
    setupUi(this);
    t1 = new MyThread1();
    t2 = new MyThread2();

    //thread2Btn->setParent(NULL);
    //thread2Btn->show();
    connect(thread1Btn,SIGNAL(clicked(bool)),this,SLOT(startT1()));
    connect(thread2Btn,SIGNAL(clicked(bool)),this,SLOT(startT2()));

    connect(sendSignalBtnAuto,SIGNAL(clicked(bool)),this,SLOT(sendT1Signal()));
    connect(sendQueuedSignalBtn,SIGNAL(clicked(bool)),this,SLOT(sendT2Signal()),Qt::QueuedConnection);

    connect(this,SIGNAL(signalToT1()),t1,SLOT(myT1Slot()));
    connect(this,SIGNAL(signalToT2()),t2,SLOT(myT2Slot()));

    connect(t1,SIGNAL(myT1Signal(int)),this,SLOT(setTextToT1(int)),Qt::BlockingQueuedConnection); // try DirectConnection
    connect(t2,SIGNAL(myT2Signal(int)),this,SLOT(setTextToT2(int)),Qt::BlockingQueuedConnection); // try DirectConnection

    t1->start();
    t2->start();
}

MyThreadSignalTest::~MyThreadSignalTest()
{

}

void MyThreadSignalTest::startT1()
{
    t1->start();
}

void MyThreadSignalTest::startT2()
{
    t2->start();
}

void MyThreadSignalTest::sendT1Signal()
{
    emit signalToT1();
}

void MyThreadSignalTest::sendT2Signal()
{
    emit signalToT2();
}

void MyThreadSignalTest::setTextToT1(int a)
{
    QString str = QString("%1").arg(a);

    qDebug() << str << endl;

    textEdit1->setText(str);
    repaint();

}

void MyThreadSignalTest::setTextToT2(int a)
{
    QString str= QString("%1").arg(a);

    qDebug() << str << endl;

    textEdit2->setText(str);
    repaint();
}
