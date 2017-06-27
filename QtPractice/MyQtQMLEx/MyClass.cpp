#include "MyClass.h"
#include <QDebug>
void MyClass::myhello()
{
    setmyage(67);
    qDebug() << "myhello called" ;
    emit mysignal(EMYTWO);
}

QString MyClass::getmycolor()
{
    return m_sMyColor;
}

void MyClass::setmycolor(QString aColor)
{
    m_sMyColor = aColor;
}

int MyClass::getmyage()
{
    return m_iMyAge;
}

void MyClass::setmyage(int aAge)
{
    if(m_iMyAge != aAge)
    {
        m_iMyAge = aAge;
        emit myageChanged(m_iMyAge);
    }
}

MyClass::EAgeType MyClass::getagetype()
{
    return m_eAgeType;
}

void MyClass::setagetype(MyClass::EAgeType aType)
{
    if(m_eAgeType != aType)
    {
        m_eAgeType = aType;
        emit agetypeChanged(m_eAgeType);
    }
}

void MyClass::helloage(int aAge)
{
    qDebug() << "My Age Changed in Qt : " << aAge;
}
