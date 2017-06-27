#ifndef MYCONTROLLER_H
#define MYCONTROLLER_H

#include <QObject>
#include <QTimer>
#include <QStringList>

class MySingletonClass;

class MyController : public QObject
{
    Q_OBJECT
public:
    explicit MyController(MySingletonClass *aMyStObj, QObject *parent = 0);
    void startMyTimer();
signals:

public slots:
    void setName();

private :
    QTimer *m_pTimer;
    MySingletonClass *m_pMyStObj;
    QStringList m_lNameList;
    int m_iNameIndex;
};

#endif // MYCONTROLLER_H
