#include "MySingletonClass.h"
#include <QDebug>

MySingletonClass::MySingletonClass(QObject *parent) : QObject(parent)
{
    qDebug() << "MySingletonClass::MySingletonClass <--" << endl;
    m_sColor = "red";
    m_sName = "vijay";
    m_iMyAge = 34;

    qDebug() << "MySingletonClass::MySingletonClass -->" << endl;
}

void MySingletonClass::setMyAge(int aAge)
{
    qDebug() << "MySingletonClass::setMyAge <--" << endl;
    qDebug() << "aAge : " << aAge;
    m_iMyAge = aAge;
    emit ageChanged();
    qDebug() << "MySingletonClass::setMyAge -->" << endl;
}

int MySingletonClass::getMyAge()
{
    qDebug() << "MySingletonClass::getMyAge <--" << endl;
    qDebug() << "m_iMyAge : " << m_iMyAge;
    qDebug() << "MySingletonClass::getMyAge -->" << endl;
    return m_iMyAge;
}

QString MySingletonClass::color()
{
    qDebug() << "MySingletonClass::color <--" << endl;
    qDebug() << "m_sColor : " << m_sColor;
    qDebug() << "MySingletonClass::color -->" << endl;
    return m_sColor;
}

void MySingletonClass::setColor(QString aColor)
{
    qDebug() << "MySingletonClass::setColor <--" << endl;
    qDebug() << "aColor : " << aColor;
    m_sColor = aColor;
    emit colorChanged();
    qDebug() << "MySingletonClass::setColor -->" << endl;
}

QString MySingletonClass::name()
{
    qDebug() << "MySingletonClass::name <--" << endl;
    qDebug() << "m_sName : " << m_sName;
    qDebug() << "MySingletonClass::name -->" << endl;
    return m_sName;
}

void MySingletonClass::setName(QString aName)
{
    qDebug() << "MySingletonClass::setName <--" << endl;
    qDebug() << "aName : " << aName;
    m_sName = aName;
    emit nameChanged();
    qDebug() << "MySingletonClass::setName -->" << endl;
}

