#ifndef MYTHREAD_H
#define MYTHREAD_H

#include <QThread>

class MyThread : public QThread
{
    Q_OBJECT
public:
    explicit MyThread(bool b, QObject *parent = 0);
    void run();

    bool m_bStop;

    int m_data;
signals:
    void valueChanged(int);
public slots:
    void mytimerevent();

};

#endif // MYTHREAD_H
